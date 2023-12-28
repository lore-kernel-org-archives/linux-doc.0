Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B6D101C1
	for <linux-doc@vger.kernel.org>; Thu, 28 Dec 2023 16:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nuXYkLSs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A2B6C433C7;
	Thu, 28 Dec 2023 16:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703780564;
	bh=A4pCQCZkJsFJZuYxooz/V8iV5P4GcGRRgvZSzruzgWg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=nuXYkLSsTrMGHX/qEg6mzecUhJ6UttbDHILRrheGNnBVr2zs0Z2eCwriTJ5OP9bz9
	 GhVtdSDJCkDzut4NhZNtw2Ky4oGFlWdbSakIi2c/JvAI29fdvH+ZeMsBtnW9vlVRsa
	 t1sjhLbXnHfQIh+q3V8naWRrKoHO4aeYkhuQNInBOpVxSYIteooP3wSceGADGdvFJ4
	 +Ph2oxitHgUcWo8QLJYSGBZ+VWuPa2IpHl9hQh6OdHhH7C2vwDwURG2YaQRu0nH7Pa
	 f9Y9Wqt0rNNze8I2ZcFJqIv1BgqlUUOJ3CEJM/S2laI5E7Z7XhvrmW+loSxHMtrFFo
	 23vU9uQvS2qCQ==
Date: Thu, 28 Dec 2023 17:22:39 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Vegard Nossum <vegard.nossum@oracle.com>, Linux Doc Mailing List
 <linux-doc@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, "
 =?UTF-8?B?TsOtY29sYXM=?= F. R. A. Prado" <nfraprado@protonmail.com>
Subject: Re: docs: automarkup.py
Message-ID: <20231228172239.6ba497ee@coco.lan>
In-Reply-To: <7930ed23-f9ea-4ee3-a55a-cc1bc9446696@infradead.org>
References: <06a5efb9-df6f-4488-9ff9-ccee296d0351@infradead.org>
	<e0b06cd8-5198-4c09-b748-f64858abe304@oracle.com>
	<7930ed23-f9ea-4ee3-a55a-cc1bc9446696@infradead.org>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Em Wed, 27 Dec 2023 14:20:05 -0800
Randy Dunlap <rdunlap@infradead.org> escreveu:

> Hi Vegard and Mauro,
>=20
> Thanks for your assistance.
> (more below)
>=20
>=20
> On 12/27/23 01:08, Vegard Nossum wrote:
> >=20
> > On 27/12/2023 08:55, Randy Dunlap wrote: =20
> >> Can anyone explain this?=C2=A0 maybe even suggest a fix for it?
> >>
> >> This has been around for a few weeks AFAIK. I haven't see a patch for =
it,
> >> but I could have missed it.
> >>
> >> (since 17e02586ed185 in August/2023; oh, that just fixed the move
> >> of files to the Documentation/arch/ subdir, so maybe even longer)
> >>
> >>
> >> In file Documentation/ABI/testing/sysfs-bus-papr-pmem:
> >>
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 response to H_SCM_HEALTH hc=
all. The details of the bit
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 flags returned in response =
to this hcall is available
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 at 'Documentation/arch/powe=
rpc/papr_hcalls.rst'. Below are
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 the flags reported in this =
sysfs file:
> >>
> >> kernel-doc reports:
> >>
> >> linux-next-20231222/Documentation/ABI/testing/sysfs-bus-papr-pmem:2: W=
ARNING: unknown document: '/powerpc/papr_hcalls'
> >>
> >> and the output file Documentation/output/admin-guide/abi-testing.html =
says:
> >>
> >> response to H_SCM_HEALTH hcall. The details of the bit
> >> flags returned in response to this hcall is available
> >> at '<span class=3D"xref std std-doc">/powerpc/papr_hcalls</span>' . Be=
low are
> >> the flags reported in this sysfs file:</p>
> >>
> >>
> >> so the leading "Documentation/arch" is being removed from the filename
> >> AFAICT.
> >>
> >> I tried changing the quoted filename from single quotes to double back=
 quotes
> >> `` and I tried it without any quotes, all with the same results.
> >> =20
> >=20
> > I don't see that here, there is no warning and it renders properly.
> >=20
> > If you go on https://docs.kernel.org/admin-guide/abi-testing.html then
> > it says 6.7.0-rc7 and (AFAICT) it also links/renders properly. =20
>=20
> Yes, I probably should have checked there earlier. :)
>=20
> > Maybe try building in a fresh clone/worktree just to verify there isn't
> > some old file somewhere that didn't get cleaned out/updated? =20
>=20
> That does work but it made me suspicious.
>=20
> I was building in a kernel tree that was built from a tarball
> and linux-next daily patches.  That leaves behind some *.orig files
> (since I use 'patch -b' for "backups").
>=20
> If I remove the Documentation/ABI/*.orig files, there is no issue
> like I had erroneously reported here.
> Maybe get_abi.pl is (also) processing the *.orig files and that
> somehow causes it to produce the confusing output.

The logic which parse files at get_abi.pl is this one:

    sub parse_abi {
        my $file =3D $File::Find::name;

        my $mode =3D (stat($file))[2];
        return if ($mode & S_IFDIR);
        return if ($file =3D~ m,/README,);

Currently, it ignores just README and directories.

It wouldn't be hard to add something like:

	return if ($file =3D~ m,/\.(rej|org|orig|bak)$,);

to ignore certain extensions. On such case, we would need to explicitly
add the extensions to be Ignored.

We could, instead, do a broader regex:

	return if ($file =3D~ m,/\.,);

to ignore everything that would have a dot at the file name, but that
could be problematic if we ever end adding files with extensions
there.

Regards,
Mauro
