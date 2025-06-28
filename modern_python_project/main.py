import click

from .my_function import my_function


@click.command()
@click.option("--name", prompt="Your name", help="The person to greet.")
def main(name):
    print(my_function(name=name))


if __name__ == "__main__":
    main()
