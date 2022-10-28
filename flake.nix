{
  description = "Overlay for KWinFT/Disman/KDisplay/Wrapland";
  outputs = { self }: { overlays.default = import ./.; };
}
