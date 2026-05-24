{ inputs, ... }: {
  flake.overlays.helium = inputs.helium.overlays.default;
}