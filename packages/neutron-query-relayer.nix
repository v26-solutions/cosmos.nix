{
  neutron-query-relayer-src,
  cosmosLib,
  libwasmvm_1_5_0,
}:
cosmosLib.mkCosmosGoApp rec {
  goVersion = "1.20";
  name = "neutron_query_relayer";
  version = "v0.2.0";
  src = neutron-query-relayer-src;
  rev = neutron-query-relayer-src.rev;
  vendorHash = "sha256-QoHGZsi+1g1OdECWR4VSEr5RONT9V5x9cI50sJs8w+c=";
  engine = "cometbft/cometbft";
  preFixup = ''
    ${cosmosLib.wasmdPreFixupPhase libwasmvm_1_5_0 name}
  '';
  buildInputs = [libwasmvm_1_5_0];
}
