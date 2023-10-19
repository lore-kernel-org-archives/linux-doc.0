Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A937017985;
	Thu, 19 Oct 2023 10:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ViHqvtAL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57D37C433C8;
	Thu, 19 Oct 2023 10:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697710951;
	bh=PKYzCBBNs1O32oIawGxF3uIbDChRrVw3IJL0BEhOvoE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ViHqvtALFFnpctn8RsIfJYCIj7DwvYkiiPvlN/uF+gglBElEflYqwEqQ3X7tAExDP
	 QKLfxK4bPnzDT+0CSgjrlzzfdvDACHwVd11/qVqK1NiuLziWaFeHRyVLe/5/GPgb5Y
	 8fupB0UMPif5QUQQ8ay7buIf26O0y3qg/8R94FOpufo9ONGnz292TuRcEdYDedjNIJ
	 FJaFHwvMYb0aDWD5sVfqMZ55nXtcPdnCEgiSerN8h9RNNAahmACit6zfpS3Yaj0zE4
	 6UDZ3f90tPRKeDKoVmTj4Rit7xOezNsysbxkEw+fiMRL+ujI5kiz8EpKHv4I5YFT2K
	 ivDxq4QT0oK4g==
Date: Thu, 19 Oct 2023 11:22:26 +0100
From: Conor Dooley <conor@kernel.org>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: Evan Green <evan@rivosinc.com>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>,
	Andrew Jones <ajones@ventanamicro.com>,
	Samuel Ortiz <sameo@rivosinc.com>
Subject: Re: [PATCH v2 01/19] riscv: hwprobe: factorize hwprobe ISA extension
 reporting
Message-ID: <20231019-flatten-showbiz-127b2e917a7a@spud>
References: <20231017131456.2053396-1-cleger@rivosinc.com>
 <20231017131456.2053396-2-cleger@rivosinc.com>
 <CALs-HssL=wNwj9nRuZwpZhy1CB9p9-X=OqgwBw9zvgA7hA4fEg@mail.gmail.com>
 <20231018-scrap-bankable-a0f321d97a46@spud>
 <20231018-flagpole-footpad-07a6228485f3@spud>
 <844f6f35-3125-4014-852c-9ad7aee19ddc@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0kZSCNOwIdjxb8Tb"
Content-Disposition: inline
In-Reply-To: <844f6f35-3125-4014-852c-9ad7aee19ddc@rivosinc.com>


--0kZSCNOwIdjxb8Tb
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 19, 2023 at 09:26:31AM +0200, Cl=C3=A9ment L=C3=A9ger wrote:
>=20
>=20
> On 18/10/2023 19:36, Conor Dooley wrote:
> > On Wed, Oct 18, 2023 at 06:33:34PM +0100, Conor Dooley wrote:
> >> On Wed, Oct 18, 2023 at 10:24:15AM -0700, Evan Green wrote:
> >>> On Tue, Oct 17, 2023 at 6:15=E2=80=AFAM Cl=C3=A9ment L=C3=A9ger <cleg=
er@rivosinc.com> wrote:
> >>>>
> >>>> Factorize ISA extension reporting by using a macro rather than
> >>>> copy/pasting extension names. This will allow adding new extensions =
more
> >>>> easily.
> >>>>
> >>>> Signed-off-by: Cl=C3=A9ment L=C3=A9ger <cleger@rivosinc.com>
> >>>> ---
> >>>>  arch/riscv/kernel/sys_riscv.c | 32 ++++++++++++++++++--------------
> >>>>  1 file changed, 18 insertions(+), 14 deletions(-)
> >>>>
> >>>> diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_r=
iscv.c
> >>>> index 473159b5f303..e207874e686e 100644
> >>>> --- a/arch/riscv/kernel/sys_riscv.c
> >>>> +++ b/arch/riscv/kernel/sys_riscv.c
> >>>> @@ -145,20 +145,24 @@ static void hwprobe_isa_ext0(struct riscv_hwpr=
obe *pair,
> >>>>         for_each_cpu(cpu, cpus) {
> >>>>                 struct riscv_isainfo *isainfo =3D &hart_isa[cpu];
> >>>>
> >>>> -               if (riscv_isa_extension_available(isainfo->isa, ZBA))
> >>>> -                       pair->value |=3D RISCV_HWPROBE_EXT_ZBA;
> >>>> -               else
> >>>> -                       missing |=3D RISCV_HWPROBE_EXT_ZBA;
> >>>> -
> >>>> -               if (riscv_isa_extension_available(isainfo->isa, ZBB))
> >>>> -                       pair->value |=3D RISCV_HWPROBE_EXT_ZBB;
> >>>> -               else
> >>>> -                       missing |=3D RISCV_HWPROBE_EXT_ZBB;
> >>>> -
> >>>> -               if (riscv_isa_extension_available(isainfo->isa, ZBS))
> >>>> -                       pair->value |=3D RISCV_HWPROBE_EXT_ZBS;
> >>>> -               else
> >>>> -                       missing |=3D RISCV_HWPROBE_EXT_ZBS;
> >>>> +#define CHECK_ISA_EXT(__ext)                                       =
            \
> >>>> +               do {                                                =
            \
> >>>> +                       if (riscv_isa_extension_available(isainfo->i=
sa, __ext)) \
> >>>> +                               pair->value |=3D RISCV_HWPROBE_EXT_#=
#__ext;       \
> >>>> +                       else                                        =
            \
> >>>> +                               missing |=3D RISCV_HWPROBE_EXT_##__e=
xt;           \
> >>>> +               } while (false)
> >>>> +
> >>>> +               /*
> >>>> +                * Only use CHECK_ISA_EXT() for extensions which can=
 be exposed
> >>>> +                * to userspace, regardless of the kernel's configur=
ation, as no
> >>>> +                * other checks, besides presence in the hart_isa bi=
tmap, are
> >>>> +                * made.
> >>>
> >>> This comment alludes to a dangerous trap, but I'm having trouble
> >>> understanding what it is.
> >>
> >> You cannot, for example, use this for communicating the presence of F =
or
> >> D, since they require a config option to be set before their use is
> >> safe.
> >=20
> > Funnily enough, this comment is immediately contradicted by the vector
> > subset extensions, where these CHECK_ISA_EXT() macros are used wrapped
> > in has_vector(). The code looks valid to me, since has_vector() contains
> > the Kconfig check, but does fly in the face of this comment.

> Yes, the KConfig checks are already done by the headers, adding #ifdef
> would be redundant even if more coherent with the comment

I don't really understand what the first part of this means, or why using
avoidable ifdeffery here would be desirable.

> BTW, wouldn't
> it make more sense to get rid out of the unsupported extensions directly
> at ISA string parsing ? ie, if kernel is compiled without V support,
> then do not set the bits corresponding to these in the riscv_isa_ext[]
> array ? But the initial intent was probably to be able to report the
> full string through cpuinfo.

Yeah, hysterical raisins I guess, it's always been that way. I don't
think anyone originally thought about such configurations and that is
how the cpuinfo stuff behaves. I strongly dislike the
riscv_isa_extension_available() interface, but one of Drew's patches
does at least improve things a bit. Kinda waiting for some of the
patches in flight to settle down before deciding if I want to refactor
stuff to be less of a potential for shooting oneself in the foot.

--0kZSCNOwIdjxb8Tb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZTEDYQAKCRB4tDGHoIJi
0hxoAP0Q/QwVBDGTktqXbnElnvW6qMUNCJQnZu8Yc7rQ7OMNJAEAkJ4ESLvJaOki
BU3KxXVZ+61ZCescByygZiFqNKepPgM=
=2KUA
-----END PGP SIGNATURE-----

--0kZSCNOwIdjxb8Tb--
