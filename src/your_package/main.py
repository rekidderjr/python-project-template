"""Main module for your package.

This module contains the core functionality of your package.
"""

from typing import Any, Dict, Optional


class YourClass:
    """A sample class demonstrating proper docstring format.
    
    This class serves as an example of how to structure your code
    with proper documentation following Google docstring conventions.
    
    Attributes:
        name: A string representing the name of the instance.
        config: A dictionary containing configuration options.
    """
    
    def __init__(self, name: str, config: Optional[Dict[str, Any]] = None) -> None:
        """Initialize YourClass instance.
        
        Args:
            name: The name for this instance.
            config: Optional configuration dictionary. Defaults to None.
        """
        self.name = name
        self.config = config or {}
    
    def do_something(self) -> str:
        """Perform some operation and return a result.
        
        Returns:
            A string describing what was done.
            
        Raises:
            ValueError: If the name is empty.
        """
        if not self.name:
            raise ValueError("Name cannot be empty")
        
        return f"Hello, {self.name}! Configuration: {self.config}"


def main() -> None:
    """Main entry point for the application."""
    instance = YourClass("World")
    result = instance.do_something()
    print(result)


if __name__ == "__main__":
    main()