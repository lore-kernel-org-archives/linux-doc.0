Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1211F10945
	for <linux-doc@vger.kernel.org>; Thu, 28 Dec 2023 20:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Io2Ld0hm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 424F1C433C7;
	Thu, 28 Dec 2023 20:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703794360;
	bh=PAswcP4Q57wmNd8eRdT7FmdFHdzApvqLvmLKs5lCajM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Io2Ld0hm/p6nVvkMDk6W0k/5qh/RVROyxgNK0d4exv887aCi4uHabfjWvuRbQHY4j
	 92TjB9rS3SDZZzDP1tC7lobP6+z7e9XQrz3nm05UYu7NMkHtsHhy5HSkOajgh6CpqM
	 lBPM9I7zcKpAM8+RVBTotBHdSWFupHV++bKvkOE5Pxy7OmuGS7iv0qKzUbj5sH29BD
	 l/JNFK59+sKs2E8v4u2BKJrmC9NsNmCu72zwtbxRlGpa3QERuohY9hn29AN48OB9OF
	 Y2qW2o8RLLNBnGSFe3WQ8Q3qvGhBy9VBW5oEh4oHfQwByAG/wiA3fRxi7Wkao7ieB0
	 ZAQBh+yGOg47w==
Date: Thu, 28 Dec 2023 21:12:36 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Vegard Nossum <vegard.nossum@oracle.com>, Linux Doc Mailing List
 <linux-doc@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, "
 =?UTF-8?B?TsOtY29sYXM=?= F. R. A. Prado" <nfraprado@protonmail.com>
Subject: Re: docs: automarkup.py
Message-ID: <20231228211236.44c80b69@coco.lan>
In-Reply-To: <88cf6c24-ce20-4db1-9112-02a7ad82501b@infradead.org>
References: <06a5efb9-df6f-4488-9ff9-ccee296d0351@infradead.org>
	<e0b06cd8-5198-4c09-b748-f64858abe304@oracle.com>
	<7930ed23-f9ea-4ee3-a55a-cc1bc9446696@infradead.org>
	<20231228172239.6ba497ee@coco.lan>
	<88cf6c24-ce20-4db1-9112-02a7ad82501b@infradead.org>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Em Thu, 28 Dec 2023 12:01:00 -0800
Randy Dunlap <rdunlap@infradead.org> escreveu:

> On 12/28/23 08:22, Mauro Carvalho Chehab wrote:
> > Em Wed, 27 Dec 2023 14:20:05 -0800
> > Randy Dunlap <rdunlap@infradead.org> escreveu:
> >  =20
> >> Hi Vegard and Mauro,
> >>
> >> Thanks for your assistance.
> >> (more below)
> >>
> >>
> >> On 12/27/23 01:08, Vegard Nossum wrote: =20
> >>>
> >>> On 27/12/2023 08:55, Randy Dunlap wrote:   =20
> >>>> Can anyone explain this?=C2=A0 maybe even suggest a fix for it?
> >>>>
> >>>> This has been around for a few weeks AFAIK. I haven't see a patch fo=
r it,
> >>>> but I could have missed it.
> >>>>
> >>>> (since 17e02586ed185 in August/2023; oh, that just fixed the move
> >>>> of files to the Documentation/arch/ subdir, so maybe even longer)
> >>>>
> >>>>
> >>>> In file Documentation/ABI/testing/sysfs-bus-papr-pmem:
> >>>>
> >>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 response to H_SCM_HEALTH =
hcall. The details of the bit
> >>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 flags returned in respons=
e to this hcall is available
> >>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 at 'Documentation/arch/po=
werpc/papr_hcalls.rst'. Below are
> >>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 the flags reported in thi=
s sysfs file:
> >>>>
> >>>> kernel-doc reports:
> >>>>
> >>>> linux-next-20231222/Documentation/ABI/testing/sysfs-bus-papr-pmem:2:=
 WARNING: unknown document: '/powerpc/papr_hcalls'
> >>>>
> >>>> and the output file Documentation/output/admin-guide/abi-testing.htm=
l says:
> >>>>
> >>>> response to H_SCM_HEALTH hcall. The details of the bit
> >>>> flags returned in response to this hcall is available
> >>>> at '<span class=3D"xref std std-doc">/powerpc/papr_hcalls</span>' . =
Below are
> >>>> the flags reported in this sysfs file:</p>
> >>>>
> >>>>
> >>>> so the leading "Documentation/arch" is being removed from the filena=
me
> >>>> AFAICT.
> >>>>
> >>>> I tried changing the quoted filename from single quotes to double ba=
ck quotes
> >>>> `` and I tried it without any quotes, all with the same results.
> >>>>   =20
> >>>
> >>> I don't see that here, there is no warning and it renders properly.
> >>>
> >>> If you go on https://docs.kernel.org/admin-guide/abi-testing.html then
> >>> it says 6.7.0-rc7 and (AFAICT) it also links/renders properly.   =20
> >>
> >> Yes, I probably should have checked there earlier. :)
> >> =20
> >>> Maybe try building in a fresh clone/worktree just to verify there isn=
't
> >>> some old file somewhere that didn't get cleaned out/updated?   =20
> >>
> >> That does work but it made me suspicious.
> >>
> >> I was building in a kernel tree that was built from a tarball
> >> and linux-next daily patches.  That leaves behind some *.orig files
> >> (since I use 'patch -b' for "backups").
> >>
> >> If I remove the Documentation/ABI/*.orig files, there is no issue
> >> like I had erroneously reported here.
> >> Maybe get_abi.pl is (also) processing the *.orig files and that
> >> somehow causes it to produce the confusing output. =20
> >=20
> > The logic which parse files at get_abi.pl is this one:
> >=20
> >     sub parse_abi {
> >         my $file =3D $File::Find::name;
> >=20
> >         my $mode =3D (stat($file))[2];
> >         return if ($mode & S_IFDIR);
> >         return if ($file =3D~ m,/README,);
> >=20
> > Currently, it ignores just README and directories.
> >=20
> > It wouldn't be hard to add something like:
> >=20
> > 	return if ($file =3D~ m,/\.(rej|org|orig|bak)$,); =20
>=20
> That didn't quite work as is. I changed it to this:
>=20
> +       return if ($file =3D~ m,\.(rej|org|orig|bak)$,);
>=20
> which works (dropping the leading "/").

Great! If you want, feel free to submit a patch with that with
my Acked-by.

>=20
> > to ignore certain extensions. On such case, we would need to explicitly
> > add the extensions to be Ignored.
> >=20
> > We could, instead, do a broader regex:
> >=20
> > 	return if ($file =3D~ m,/\.,); =20
>=20
> That line is already present in the script, for skipping
> hidden (dot) files.
>=20
> It does not skip filenames like "papr_hcalls.orig" -- at least I
> still see this problem when that line is present.
>=20
> I wouldn't suggest skipping any file that has a '.' in its name.

Yeah, agreed.

Regards,
Mauro
