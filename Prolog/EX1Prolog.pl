% EX1Prolog.pl

% ---------------------------------------------------------
% Fatos: Progenitores
% ---------------------------------------------------------

progenitor(urano, cronos).
progenitor(gaia, cronos).

progenitor(urano, oceano).
progenitor(gaia, oceano).

progenitor(cronos, zeus).
progenitor(reia, zeus).

progenitor(cronos, poseidon).
progenitor(reia, poseidon).

% Inclusão pedida no exercício: Hades como filho de Cronos e Reia
progenitor(cronos, hades).
progenitor(reia, hades).

progenitor(zeus, atena).
progenitor(zeus, apolo).
progenitor(hera, apolo).

progenitor(zeus, artemis).
progenitor(leto, artemis).

progenitor(zeus, ares).
progenitor(hera, ares).

progenitor(zeus, hefesto).
progenitor(hera, hefesto).

progenitor(poseidon, tritao).
progenitor(zeus, perseu).
progenitor(danae, perseu).
progenitor(atena, erictonio).

% ---------------------------------------------------------
% Domínios
% ---------------------------------------------------------

dominio(zeus, ceu).
dominio(zeus, trovao).

dominio(poseidon, mar).
dominio(poseidon, terremoto).

dominio(hades, submundo).

dominio(atena, sabedoria).
dominio(atena, guerra_estrategica).

dominio(ares, guerra_brutal).

dominio(apolo, sol).
dominio(apolo, musica).

dominio(artemis, caca).
dominio(artemis, lua).

dominio(hefesto, fogo).
dominio(hefesto, forja).

dominio(afrodite, beleza).
dominio(afrodite, amor).

dominio(cronos, tempo).

% ---------------------------------------------------------
% Armas
% ---------------------------------------------------------

arma(zeus, raio).
arma(poseidon, tridente).
arma(hades, elmo_escuridao).
arma(atena, escudo_aegis).
arma(perseu, espada_adamantina).

% ---------------------------------------------------------
% Características
% ---------------------------------------------------------

caracteristica(zeus, rei).
caracteristica(hera, rainha).
caracteristica(hades, invisivel).
caracteristica(hefesto, ferreiro).
caracteristica(artemis, virgem).
caracteristica(perseu, mortal).

% ---------------------------------------------------------
% Alianças
% ---------------------------------------------------------

aliado(zeus, poseidon).
aliado(poseidon, zeus).

aliado(atena, apolo).
aliado(apolo, atena).

aliado(ares, hades).
aliado(hades, ares).

aliado(hefesto, atena).
aliado(atena, hefesto).

% ---------------------------------------------------------
% Locais principais
% ---------------------------------------------------------

local_principal(zeus, olimpo).
local_principal(poseidon, atlantida).
local_principal(hades, submundo).
local_principal(apolo, olimpo).
local_principal(artemis, florestas).

% ---------------------------------------------------------
% Regra: divindade_olimpica
% ---------------------------------------------------------

divindade_olimpica(Deus) :-
    progenitor(cronos, Deus),
    dominio(Deus, Dominio),
    (Dominio = ceu ; Dominio = mar ; Dominio = submundo).

