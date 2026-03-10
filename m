Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C16127E07A;
	Tue, 10 Mar 2026 14:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773152193; cv=none; b=STnDmNClnLSc9GAmfQ8O5RfX+Dz6ulrfWgionZIUIIEX2vsuwfrGspBTaselFIEysmgkK4SpGwvQeaUNDI1c3dDDuj4n7E023z9HXY8oqOMcZfgDHxemMMt2xZSPC7UGPu1KowOO/vEuNtTCWIoqx4M5e0RM9iRoEK4bflc3Xj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773152193; c=relaxed/simple;
	bh=JRTscOBGN76eWlWUti9ne/LlhiFnYIktmGcgUIkQbyE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U2Ulg7O3o2BGCaaX7vXqS1Qhr8wr73k9RBOSK9a9zAtWFGYWjawohgnvcU3kgHUP7CydTBvA0KMJWnTk1R0EROMcyPBg6tOw2Y+rPZ60dAB+3Uzx/g6PUweMXbgXQRTqjO0rSLLrnfm6YYXt+unqZT4sACyBoHE7OyEvgmVGDXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MS/2qf8t; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MS/2qf8t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2893BC19423;
	Tue, 10 Mar 2026 14:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773152192;
	bh=JRTscOBGN76eWlWUti9ne/LlhiFnYIktmGcgUIkQbyE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MS/2qf8tnZif563e1QLAUHMRAMWrC4Cys+8C+hyWa/VclKrJp4MxWoWs5pVQ5IwCg
	 gjAy2V8j6A5nPt/YQhweZkqUK7s2cZUAJIj8BVCAMwjstzUOW6KqVouCfFHXfI4Hvg
	 5xkpQn9OEqNfAwI3Dw69J90PZBSXoixR9P3hxg093wECq41fLUbyb4/VaddtlwHOyV
	 FCj8KnkEhpfjTt3kvkeD3s6+pu7VCu16dwy97FKh5XDtAk316yvetNrnnZ4xF+cXTV
	 jOFsgfxKhpYnXb1MyjsllE2NatP03c3oIL9DTAMtgmn6CAkEs5e5A8KEAJnJ73xC+d
	 99cPix0NMoQdQ==
Date: Tue, 10 Mar 2026 14:16:28 +0000
From: Mark Brown <broonie@kernel.org>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, brgl@kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 13/14] reset: convert reset core to using firmware
 nodes
Message-ID: <0b72286b-33dd-4bc9-8c0e-161c2f4baed8@sirena.org.uk>
References: <20260306-reset-core-refactor-v3-0-599349522876@oss.qualcomm.com>
 <20260306-reset-core-refactor-v3-13-599349522876@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LsxqS50JR+bUBMM7"
Content-Disposition: inline
In-Reply-To: <20260306-reset-core-refactor-v3-13-599349522876@oss.qualcomm.com>
X-Cookie: No Canadian coins.


--LsxqS50JR+bUBMM7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 06, 2026 at 06:22:57PM +0100, Bartosz Golaszewski wrote:
> With everything else now in place, we can convert the remaining parts of
> the reset subsystem to becoming fwnode-agnostic - meaning it will work
> with all kinds of firmware nodes, not only devicetree.

This patch is causing issues for me in yesterday's -next on a Toradax
Mallow platform with a TI K3 AM625.  Things start to go wrong with a
WARN_ON():

[   11.544610] WARNING: drivers/reset/core.c:1195 at __fwnode_reset_control=
_get+0x488/0x580, CPU#0: (udev-worker)/129

=2E..

[   11.693583]  __fwnode_reset_control_get+0x488/0x580 (P)
[   11.698802]  __reset_control_get+0x64/0xa0
[   11.702892]  __devm_reset_control_get+0x74/0x110
[   11.707502]  k3_m4_rproc_probe+0xf8/0x3d0 [ti_k3_m4_remoteproc]
[   11.713421]  platform_probe+0x5c/0xa4

and ends up not probing the relevant device due to:

[   12.155596] platform 78000000.r5f: error -EINVAL: failed to get reset ha=
ndle

Full log:
   https://lava.sirena.org.uk/scheduler/job/2545371#L1126

bisect log:

# bad: [343f51842f4ed7143872f3aa116a214a5619a4b9] Add linux-next specific f=
iles for 20260309
# good: [7c426ecc244791791ec70ffb264e99bb5e158ef0] Merge branch 'for-linux-=
next-fixes' of https://gitlab.freedesktop.org/drm/misc/kernel.git
# good: [aa3d0c93a333182e887426366a4f3e5f06ee0d83] regulator: max20411: sho=
w failure on register
# good: [b1ef855c62601ed4de2c4b0ff75a075877e3dac8] regmap: Simplify devres =
handling
# good: [ef0b4783afc211a4b120e72b5a57f3d0340a9981] ASoC: cs35l56: KUnit tes=
ts for reading speaker ID from host GPIOs
# good: [e7662bced2e98ffa2c572126677deb9cf55d43b3] regcache: Move HW readba=
ck after cache initialisation
# good: [2adac914c72b6cb5aba2612f49050c82aecd498e] ASoC: cs35l56-test: Add =
test cases without onchip pulls defined
# good: [96f06d055ca03d1dfb5830fd07ff6eadbd66264c] spi: dt-bindings: mpfs-s=
pi: remove clock-names
# good: [f48e7a246a567e3764112e2463274c479d95cd96] ASoC: soc-core: Use guar=
d()/scoped_guard() for mutex lock
# good: [9891b52ba12e9d5fed5901b6b5f6e0cdcd424390] regcache: Factor out reg=
cache_hw_exit() helper
# good: [e84141846decb77d2826e553318a608b256804e5] regulator: pf9453: Allow=
 shared IRQ
# good: [9ab637ac5d3826606947f4e861107da958eda324] regcache: Amend printf()=
 specifiers when printing registers
# good: [d3b693a13b39bce16e284e1c737874966b3a96de] spi: spi-mem: clean up k=
ernel-doc in spi-mem.h
# good: [da37bfe76b5b4ccc01ed8132215098e20d78e5f3] ASoC: cs42xx8: add error=
 checks for constraints in TDM mode
# good: [06dba254de95b16e7793224d29daa5195de2e581] ASoC: dt-bindings: nvidi=
a,tegra-audio-max9808x: document additional board pins
# good: [1696fad8b259a2d46e51cd6e17e4bcdbe02279fa] ASoC: sti: use managed r=
egmap_field allocations
# good: [17c6bf433742e0c1ff5ce175145877c0194e4a7a] ASoC: cs35l45: Hibernate=
 wm_adsp on runtime suspend
# good: [34b4fc44e4f904fbb81335d53163ffdcb0180000] ASoC: soc_sdw_utils: rem=
ove index from sdca codec name
# good: [2974aa42e6696a1d95b727d677dc01a71af5b998] ASoC: remove snd_soc_pcm=
_subclass
# good: [501efdcb3b3ab099fc0ce2f6e668b1c4095dd476] ASoC: SDCA: Pull the Q7.=
8 volume helpers out of soc-ops
# good: [d90c0f78379454d51a428e312ac6db573060185c] regulator: cpcap-regulat=
or: add support for Mot regulators
# good: [5c74a008ffc62fc57a041602b4517519c8bf9436] firmware: cs_dsp: Mark K=
Unit test suites KUNIT_SPEED_SLOW
# good: [260c3fff1fefc570d8f23e87953e181d7d248861] ASoC: cs-amp-lib-test: S=
top including platform_device.h
# good: [e02902dd493bf9c9b05353c761737ac514ad7a5c] spi: add devm_spi_new_an=
cillary_device()
# good: [37983fad7f3ef296fa0504c8e945987459dc5487] regmap: define cleanup h=
elper for regmap_field
# good: [196b2b95fec447c2c4460f753b277d840633fbef] drm/nouveau: Add DRM_IOC=
TL_NOUVEAU_GET_ZCULL_INFO
# good: [7c12f6ead4672cb08b74e6f6115eb04dca8ccfa4] spi: tegra210-quad: Add =
runtime autosuspend support
# good: [ada32396f90951e12465224c04742607ca56a982] ASoC: SDCA: Add CS47L47 =
to class driver
# good: [507a071d9868cb60e4e76f8a06fc8eb014f59ae4] spi: pxa2xx: use min() i=
nstead of min_t()
# good: [5ebc20921b7fff9feb44de465448e17a382c9965] ASoC: tas2552: Allow aud=
io enable GPIO to sleep
# good: [5943243914b9fed8e26edcb9d45421721a5e3576] dma-buf: use inline lock=
 for the dma-fence-array
# good: [541c8f2468b933acc5d129e84bd264923675a66e] dma-buf: detach fence op=
s on signal v3
# good: [fed6e5084894373d76270cad4a32eb6479ad8247] spi: atcspi200: Remove r=
edundant assignment to .owner
# good: [171b3663f33e1efdc97f5112f49be10b47b20fa8] ASoC: codecs: aw88261: A=
dd firmware-name support
# good: [c2bcf62ca75c541ec4297e6ff02a68ddc2e02029] regcache: Split regcache=
_count_cacheable_registers() helper
# good: [0556bb42a84ee391a2145ddba86756f9747bc27f] regulator: pf0900: Make =
regu_irqs variable static const
# good: [a480f5c6f5fa14c954aa8c462302d34223947510] drm/mcde: dsi: convert t=
o of_drm_find_and_get_bridge()
# good: [8b85987d3cf50178f67618122d9f3bb202f62f42] Merge drm/drm-next into =
drm-misc-next
# good: [d075cef4af6327a5de4bee7bf77591e3201e54f4] ASoC: simple-card-utils:=
 add sysclk ordering support
# good: [bf122191473e26a8f195308b1ba924c98424c8e1] ASoC: rt5677-spi: Add SP=
I device ID matching table
# good: [78dfbd4ad0be9f51de7b9a19388809254aeccd26] ASoC: Add quirk for Leco=
o Bellator N176
# good: [fbb4c52ccdcb4a612d2b7f800aa57090eeee16d7] regulator: spacemit-p1: =
Update supply names
# good: [fe0b1b8269eba268a7dee293b32d6c008a6c3fec] drm/mcde: dsi: mcde_dsi_=
bind: break when a panel or bridge is found
git bisect start '343f51842f4ed7143872f3aa116a214a5619a4b9' '7c426ecc244791=
791ec70ffb264e99bb5e158ef0' 'aa3d0c93a333182e887426366a4f3e5f06ee0d83' 'b1e=
f855c62601ed4de2c4b0ff75a075877e3dac8' 'ef0b4783afc211a4b120e72b5a57f3d0340=
a9981' 'e7662bced2e98ffa2c572126677deb9cf55d43b3' '2adac914c72b6cb5aba2612f=
49050c82aecd498e' '96f06d055ca03d1dfb5830fd07ff6eadbd66264c' 'f48e7a246a567=
e3764112e2463274c479d95cd96' '9891b52ba12e9d5fed5901b6b5f6e0cdcd424390' 'e8=
4141846decb77d2826e553318a608b256804e5' '9ab637ac5d3826606947f4e861107da958=
eda324' 'd3b693a13b39bce16e284e1c737874966b3a96de' 'da37bfe76b5b4ccc01ed813=
2215098e20d78e5f3' '06dba254de95b16e7793224d29daa5195de2e581' '1696fad8b259=
a2d46e51cd6e17e4bcdbe02279fa' '17c6bf433742e0c1ff5ce175145877c0194e4a7a' '3=
4b4fc44e4f904fbb81335d53163ffdcb0180000' '2974aa42e6696a1d95b727d677dc01a71=
af5b998' '501efdcb3b3ab099fc0ce2f6e668b1c4095dd476' 'd90c0f78379454d51a428e=
312ac6db573060185c' '5c74a008ffc62fc57a041602b4517519c8bf9436' '260c3fff1fe=
fc570d8f23e87953e181d7d248861' 'e02902dd493bf9c9b05353c761737ac514ad7a5c' '=
37983fad7f3ef296fa0504c8e945987459dc5487' '196b2b95fec447c2c4460f753b277d84=
0633fbef' '7c12f6ead4672cb08b74e6f6115eb04dca8ccfa4' 'ada32396f90951e124652=
24c04742607ca56a982' '507a071d9868cb60e4e76f8a06fc8eb014f59ae4' '5ebc20921b=
7fff9feb44de465448e17a382c9965' '5943243914b9fed8e26edcb9d45421721a5e3576' =
'541c8f2468b933acc5d129e84bd264923675a66e' 'fed6e5084894373d76270cad4a32eb6=
479ad8247' '171b3663f33e1efdc97f5112f49be10b47b20fa8' 'c2bcf62ca75c541ec429=
7e6ff02a68ddc2e02029' '0556bb42a84ee391a2145ddba86756f9747bc27f' 'a480f5c6f=
5fa14c954aa8c462302d34223947510' '8b85987d3cf50178f67618122d9f3bb202f62f42'=
 'd075cef4af6327a5de4bee7bf77591e3201e54f4' 'bf122191473e26a8f195308b1ba924=
c98424c8e1' '78dfbd4ad0be9f51de7b9a19388809254aeccd26' 'fbb4c52ccdcb4a612d2=
b7f800aa57090eeee16d7' 'fe0b1b8269eba268a7dee293b32d6c008a6c3fec'
# test job: [aa3d0c93a333182e887426366a4f3e5f06ee0d83] https://lava.sirena.=
org.uk/scheduler/job/2531476
# test job: [b1ef855c62601ed4de2c4b0ff75a075877e3dac8] https://lava.sirena.=
org.uk/scheduler/job/2531902
# test job: [ef0b4783afc211a4b120e72b5a57f3d0340a9981] https://lava.sirena.=
org.uk/scheduler/job/2530824
# test job: [e7662bced2e98ffa2c572126677deb9cf55d43b3] https://lava.sirena.=
org.uk/scheduler/job/2530811
# test job: [2adac914c72b6cb5aba2612f49050c82aecd498e] https://lava.sirena.=
org.uk/scheduler/job/2523914
# test job: [96f06d055ca03d1dfb5830fd07ff6eadbd66264c] https://lava.sirena.=
org.uk/scheduler/job/2523382
# test job: [f48e7a246a567e3764112e2463274c479d95cd96] https://lava.sirena.=
org.uk/scheduler/job/2522152
# test job: [9891b52ba12e9d5fed5901b6b5f6e0cdcd424390] https://lava.sirena.=
org.uk/scheduler/job/2522265
# test job: [e84141846decb77d2826e553318a608b256804e5] https://lava.sirena.=
org.uk/scheduler/job/2516897
# test job: [9ab637ac5d3826606947f4e861107da958eda324] https://lava.sirena.=
org.uk/scheduler/job/2516463
# test job: [d3b693a13b39bce16e284e1c737874966b3a96de] https://lava.sirena.=
org.uk/scheduler/job/2511822
# test job: [da37bfe76b5b4ccc01ed8132215098e20d78e5f3] https://lava.sirena.=
org.uk/scheduler/job/2511897
# test job: [06dba254de95b16e7793224d29daa5195de2e581] https://lava.sirena.=
org.uk/scheduler/job/2513785
# test job: [1696fad8b259a2d46e51cd6e17e4bcdbe02279fa] https://lava.sirena.=
org.uk/scheduler/job/2514115
# test job: [17c6bf433742e0c1ff5ce175145877c0194e4a7a] https://lava.sirena.=
org.uk/scheduler/job/2513841
# test job: [34b4fc44e4f904fbb81335d53163ffdcb0180000] https://lava.sirena.=
org.uk/scheduler/job/2513660
# test job: [2974aa42e6696a1d95b727d677dc01a71af5b998] https://lava.sirena.=
org.uk/scheduler/job/2502250
# test job: [501efdcb3b3ab099fc0ce2f6e668b1c4095dd476] https://lava.sirena.=
org.uk/scheduler/job/2500570
# test job: [d90c0f78379454d51a428e312ac6db573060185c] https://lava.sirena.=
org.uk/scheduler/job/2500334
# test job: [5c74a008ffc62fc57a041602b4517519c8bf9436] https://lava.sirena.=
org.uk/scheduler/job/2496444
# test job: [260c3fff1fefc570d8f23e87953e181d7d248861] https://lava.sirena.=
org.uk/scheduler/job/2494135
# test job: [e02902dd493bf9c9b05353c761737ac514ad7a5c] https://lava.sirena.=
org.uk/scheduler/job/2489689
# test job: [37983fad7f3ef296fa0504c8e945987459dc5487] https://lava.sirena.=
org.uk/scheduler/job/2489177
# test job: [196b2b95fec447c2c4460f753b277d840633fbef] https://lava.sirena.=
org.uk/scheduler/job/2497877
# test job: [7c12f6ead4672cb08b74e6f6115eb04dca8ccfa4] https://lava.sirena.=
org.uk/scheduler/job/2488549
# test job: [ada32396f90951e12465224c04742607ca56a982] https://lava.sirena.=
org.uk/scheduler/job/2489110
# test job: [507a071d9868cb60e4e76f8a06fc8eb014f59ae4] https://lava.sirena.=
org.uk/scheduler/job/2486368
# test job: [5ebc20921b7fff9feb44de465448e17a382c9965] https://lava.sirena.=
org.uk/scheduler/job/2485121
# test job: [5943243914b9fed8e26edcb9d45421721a5e3576] https://lava.sirena.=
org.uk/scheduler/job/2498010
# test job: [541c8f2468b933acc5d129e84bd264923675a66e] https://lava.sirena.=
org.uk/scheduler/job/2498115
# test job: [fed6e5084894373d76270cad4a32eb6479ad8247] https://lava.sirena.=
org.uk/scheduler/job/2484678
# test job: [171b3663f33e1efdc97f5112f49be10b47b20fa8] https://lava.sirena.=
org.uk/scheduler/job/2482573
# test job: [c2bcf62ca75c541ec4297e6ff02a68ddc2e02029] https://lava.sirena.=
org.uk/scheduler/job/2483266
# test job: [0556bb42a84ee391a2145ddba86756f9747bc27f] https://lava.sirena.=
org.uk/scheduler/job/2483182
# test job: [a480f5c6f5fa14c954aa8c462302d34223947510] https://lava.sirena.=
org.uk/scheduler/job/2498343
# test job: [8b85987d3cf50178f67618122d9f3bb202f62f42] https://lava.sirena.=
org.uk/scheduler/job/2498190
# test job: [d075cef4af6327a5de4bee7bf77591e3201e54f4] https://lava.sirena.=
org.uk/scheduler/job/2483446
# test job: [bf122191473e26a8f195308b1ba924c98424c8e1] https://lava.sirena.=
org.uk/scheduler/job/2482807
# test job: [78dfbd4ad0be9f51de7b9a19388809254aeccd26] https://lava.sirena.=
org.uk/scheduler/job/2483097
# test job: [fbb4c52ccdcb4a612d2b7f800aa57090eeee16d7] https://lava.sirena.=
org.uk/scheduler/job/2482446
# test job: [fe0b1b8269eba268a7dee293b32d6c008a6c3fec] https://lava.sirena.=
org.uk/scheduler/job/2497744
# test job: [d9cc39c565935b634aed60237a0d9262efd703ef] https://lava.sirena.=
org.uk/scheduler/job/2545125
# bad: [d9cc39c565935b634aed60237a0d9262efd703ef] Merge branch 'xtensa-for-=
next' of https://github.com/jcmvbkbc/linux-xtensa.git
git bisect bad d9cc39c565935b634aed60237a0d9262efd703ef
# test job: [343f51842f4ed7143872f3aa116a214a5619a4b9] https://lava.sirena.=
org.uk/scheduler/job/2545371
# bad: [343f51842f4ed7143872f3aa116a214a5619a4b9] Add linux-next specific f=
iles for 20260309
git bisect bad 343f51842f4ed7143872f3aa116a214a5619a4b9
# test job: [601a8229b851e12ef5bb4fe12c034c342180df21] https://lava.sirena.=
org.uk/scheduler/job/2545813
# bad: [601a8229b851e12ef5bb4fe12c034c342180df21] Merge branch 'main' of ht=
tps://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git
git bisect bad 601a8229b851e12ef5bb4fe12c034c342180df21
# test job: [d9cc39c565935b634aed60237a0d9262efd703ef] https://lava.sirena.=
org.uk/scheduler/job/2545125
# bad: [d9cc39c565935b634aed60237a0d9262efd703ef] Merge branch 'xtensa-for-=
next' of https://github.com/jcmvbkbc/linux-xtensa.git
git bisect bad d9cc39c565935b634aed60237a0d9262efd703ef
# test job: [68ade9d1ef86387fb7e6c50f0099d9685eebccfc] https://lava.sirena.=
org.uk/scheduler/job/2545938
# good: [68ade9d1ef86387fb7e6c50f0099d9685eebccfc] Merge branch 'for-next' =
of https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git
git bisect good 68ade9d1ef86387fb7e6c50f0099d9685eebccfc
# test job: [5fc055700d1c1c44b455cbba097eb0456a8e7e80] https://lava.sirena.=
org.uk/scheduler/job/2546007
# good: [5fc055700d1c1c44b455cbba097eb0456a8e7e80] Merge branch 'for-next' =
of https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git
git bisect good 5fc055700d1c1c44b455cbba097eb0456a8e7e80
# test job: [759498ea498be7915fb7680db1b82ab24d2ea4a1] https://lava.sirena.=
org.uk/scheduler/job/2546151
# bad: [759498ea498be7915fb7680db1b82ab24d2ea4a1] Merge branch 'for-next' o=
f https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git
git bisect bad 759498ea498be7915fb7680db1b82ab24d2ea4a1
# test job: [febe1d6bb4aedf5909524c9d2b7a0f951ff5b2cd] https://lava.sirena.=
org.uk/scheduler/job/2546362
# good: [febe1d6bb4aedf5909524c9d2b7a0f951ff5b2cd] Merge branch 'v7.1-armso=
c/dts64' into for-next
git bisect good febe1d6bb4aedf5909524c9d2b7a0f951ff5b2cd
# test job: [ed463b91c8f535b0480177e7ca164852c6a8a222] https://lava.sirena.=
org.uk/scheduler/job/2546598
# bad: [ed463b91c8f535b0480177e7ca164852c6a8a222] Merge branch 'reset/next'=
 of https://git.pengutronix.de/git/pza/linux
git bisect bad ed463b91c8f535b0480177e7ca164852c6a8a222
# test job: [3a76b5326d67bbfe2bc81f834d2f21a5b4498b57] https://lava.sirena.=
org.uk/scheduler/job/2546759
# good: [3a76b5326d67bbfe2bc81f834d2f21a5b4498b57] Merge branches 'renesas-=
arm-defconfig-for-v7.1', 'renesas-drivers-for-v7.1', 'renesas-dt-bindings-f=
or-v7.1' and 'renesas-dts-for-v7.1' into renesas-next
git bisect good 3a76b5326d67bbfe2bc81f834d2f21a5b4498b57
# test job: [20adbf3b8f5c5787da29f8cdd7cfc4fa87854bd5] https://lava.sirena.=
org.uk/scheduler/job/2546854
# good: [20adbf3b8f5c5787da29f8cdd7cfc4fa87854bd5] reset: warn on reset-gpi=
o release
git bisect good 20adbf3b8f5c5787da29f8cdd7cfc4fa87854bd5
# test job: [8c91302a29bc1b710c7a164d4b81b5bb432f4eb5] https://lava.sirena.=
org.uk/scheduler/job/2546912
# good: [8c91302a29bc1b710c7a164d4b81b5bb432f4eb5] reset: protect struct re=
set_control with its own mutex
git bisect good 8c91302a29bc1b710c7a164d4b81b5bb432f4eb5
# test job: [9035073d0ef1de813c6335239250248bfe0a64aa] https://lava.sirena.=
org.uk/scheduler/job/2546951
# bad: [9035073d0ef1de813c6335239250248bfe0a64aa] reset: convert reset core=
 to using firmware nodes
git bisect bad 9035073d0ef1de813c6335239250248bfe0a64aa
# test job: [ba8dbbb14b7e6734afbb5ba37d0679831aa3d590] https://lava.sirena.=
org.uk/scheduler/job/2547005
# good: [ba8dbbb14b7e6734afbb5ba37d0679831aa3d590] reset: convert the core =
API to using firmware nodes
git bisect good ba8dbbb14b7e6734afbb5ba37d0679831aa3d590
# first bad commit: [9035073d0ef1de813c6335239250248bfe0a64aa] reset: conve=
rt reset core to using firmware nodes

--LsxqS50JR+bUBMM7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmwJ7sACgkQJNaLcl1U
h9AkSgf/Vd4hW1JmxXmJCdoWr9Um/AlTbXdKIUUA5SLTCoKzGA9axd1+FfinkFXq
z+/qSJqPOCcoT9kbnqec3SItA9+cdrYgDbXaC4dk6TOFX8wQUA4EZaerTUhsUKSl
4JYBlogUbkhgjp7g/eLfE2RZJW0tIcPno1RZmKbEBJxG3DOKjXHqhiBN2JCG/NP3
dC8vPyOlYiUn1clFcDQZGCa2COgnikJ89d8aK1tRt35T3TubBaM/26QKaA6U23Op
cvVmCvHWOaTF7coAacDYv/s6+nVlX/4Y7azXPk+zgn5egy9q42nqSTaEvi1nYvVt
5z2TQBlbG1oU1Z3ZtaH03WoJOzHarQ==
=MYsC
-----END PGP SIGNATURE-----

--LsxqS50JR+bUBMM7--
