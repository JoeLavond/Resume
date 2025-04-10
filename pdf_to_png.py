import argparse
import pathlib
from pdf2image import convert_from_path


def get_args():
    """
    Get the arguments from the command line
    Determine the directory and file name for future conversion

    :return: argparse.Namespace, the arguments from the command line
    """

    parser = argparse.ArgumentParser()

    parser.add_argument(
        "--dir_name",
        type=str,
        default="out",
        help="Read/write directory for the files",
    )
    parser.add_argument(
        "--file_name",
        type=str,
        default="lavond-joseph-cv",  # specify with suffix resume or cv whether to convert my 1 or multipage resume
        help="Name of the file for conversion",
    )

    return parser.parse_args()


def main(configs: argparse.Namespace) -> None:
    """
    Main function to convert a PDF to PNG images

    :param configs: argparse.Namespace, the arguments from the command line

    """
    # determine the path to the file
    path = pathlib.Path(__file__).parent
    path = path / configs.dir_name
    if not path.exists():
        raise FileNotFoundError(f"Directory {path} does not exist")

    # collect the input pdf file
    in_path = path / f"{configs.file_name}.pdf"
    if not in_path.exists():
        raise FileNotFoundError(f"File {in_path} does not exist")

    # convert pdf to a list of images
    images = convert_from_path(path / f"{configs.file_name}.pdf")

    if len(images) == 0:
        raise ValueError(f"No images were converted from {in_path}")

    # save the image
    for page_num, page in enumerate(images):
        out_path = path / f"{configs.file_name}-page{page_num + 1}.png"
        page.save(out_path, "PNG")


if __name__ == "__main__":
    args = get_args()
    main(args)
