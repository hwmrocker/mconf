#!/usr/bin/env bash
# Demo script for blendconf CLI tool
# Run this from the project root directory

set -e

# Helper function to show file content with a header
show_file() {
    local file="$1"
    if [ -f "$file" ]; then
        echo "Content of $file:"
        echo "---"
        cat "$file"
        echo "---"
    else
        echo "File $file not found"
    fi
}


echo "=================================================="
echo "blendconf Demo"
echo "=================================================="
echo ""

echo "1. Merge two JSON files and print to stdout"
echo "   Command: uvx --from . blendconf examples/config1.json examples/config2.json"
echo "--------------------------------------------------"
show_file "examples/config1.json"
show_file "examples/config2.json"
uvx --from . blendconf examples/config1.json examples/config2.json
echo ""
echo ""

echo "2. Merge two JSON files and save to a file"
echo "   Command: uvx --from . blendconf examples/config1.json examples/config2.json -o examples/merged.json"
echo "--------------------------------------------------"
uvx --from . blendconf examples/config1.json examples/config2.json -o examples/merged.json
echo "Output saved to examples/merged.json"
show_file "examples/merged.json"
echo ""
echo ""

echo "3. Convert JSON to TOML"
echo "   Command: uvx --from . blendconf examples/config1.json -o examples/converted.toml"
echo "--------------------------------------------------"
uvx --from . blendconf examples/config1.json -o examples/converted.toml
echo "Output saved to examples/converted.toml"
show_file "examples/converted.toml"
echo ""
echo ""

echo "4. Merge YAML and TOML files (outputs as YAML)"
echo "   Command: uvx --from . blendconf examples/settings.yaml examples/overrides.toml"
echo "--------------------------------------------------"
show_file "examples/settings.yaml"
show_file "examples/overrides.toml"
uvx --from . blendconf examples/settings.yaml examples/overrides.toml
echo ""
echo ""

echo "5. Merging .env files"
echo "   Command: uvx --from . blendconf examples/env_default.env examples/env_local.env -o examples/env_merged.env"
show_file "examples/env_default.env"
show_file "examples/env_local.env"
uvx --from . blendconf examples/env_default.env examples/env_local.env -o examples/env_merged.env
echo "Output saved to examples/env_merged.env"
show_file "examples/env_merged.env"
echo ""


echo "=================================================="
echo "Demo complete!"
echo "=================================================="
