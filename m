Received: from e2i411.smtp2go.com (e2i411.smtp2go.com [103.2.141.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B17317584
	for <linux-doc@vger.kernel.org>; Thu, 11 Apr 2024 19:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.2.141.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712863616; cv=none; b=G2Z+Q6I1N16s9Al01UBlVpR5NvMcPf5xUAbSaaGGjOIns2QwWV7pQGAR56u+mUqtewcvEphsAr+cn43N26ZhM05Bg5tFNMUXLqN2lPzwb9NpQSPUKtQaY29o4Gv+pChnJu7B8z40ptsX1Q7opsJZtfzxZrzsa5owtbN2Ei/r/48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712863616; c=relaxed/simple;
	bh=/6EP39PEdV6eLxyFI48MKtoI6Ljh9xgN08pCQTCANdA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lL+QZnunXexyDqWe5jKGxTbWi98G+nwCe8+UKo+NdHWn5TOwR40x0I/8azFTVsDBTvk98lkq+X2q5iFp+OLH5JBKD5+DRzFQIdoHMa5v+t9JPMEQZcXGKDgEO8V/W4YL0BzZAPeuymZuUdRObaU6rMCd1LYUtDoxbT0/FXpBxYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=em1174286.fjasle.eu; dkim=fail (0-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b=UquxyWVZ reason="unknown key version"; dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=OOrPm4Jk; dkim=pass (1024-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=Gg/0YxZA; arc=none smtp.client-ip=103.2.141.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em1174286.fjasle.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="unknown key version" (0-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b="UquxyWVZ";
	dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="OOrPm4Jk";
	dkim=pass (1024-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="Gg/0YxZA"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=smtpservice.net; s=mp6320.a1-4.dyn; x=1712864505; h=Feedback-ID:
	X-Smtpcorp-Track:Message-ID:Subject:To:From:Date:Reply-To:Sender:
	List-Unsubscribe; bh=pIOYDS3WXvzOcTsutmpuRDpQIudpnZDh0x217c1hsjk=; b=UquxyWVZ
	kq/pmi1Wao4ZHixfNy+J1om9TE5OkmXWqsG6XmSjQh6Ct9/6txwMjZ8wdXC5FX1TFOOS80hHD7f7p
	hEz3qEZkfWjxjG/T6pDiMO7L+RdTi7LYP5sL4BUM2FYbPpefM9a1rTaTOGEtgigWMzF4AltE+mtiR
	dhm/Inrg/WczoUZmbKbZX9oGq3AT5iStR425OvKy5+JNg0QX4Buu7RlOKFXq7BsH2ekEXM2L+7ACl
	OOOKWyxntsZzuzvCaoKpYGCJfAkr3QI7+sCOoobB7lRBpxlXThgp2yiH1RZ5VIuXntQebfhritw3v
	qmvemlzKZY00G1cHsVmSorNdQg==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fjasle.eu;
 i=@fjasle.eu; q=dns/txt; s=s1174286; t=1712863605; h=from : subject :
 to : message-id : date;
 bh=pIOYDS3WXvzOcTsutmpuRDpQIudpnZDh0x217c1hsjk=;
 b=OOrPm4JkagEMZNOreQqv3AHp1AU2eLW+rkuAmNj6+KqxSNJ1m/GgGcIquiULnWTFg2FYN
 wDFmdZLJkcHpfRVPw07ltZtnap1NTszO3fF1/kLntRpDx5NPOcyj6r4NZC8FhcdgrxgurY5
 T7bMT3zrWa384+4kjPNUqs9zAiMsIR4ZISA5UritrTYybEd4rHvui+nBDHifwy7JpKYEfbc
 RHMh/nieWDULIu7egXjRKef6TXulrutDHbXf7aRgb3XnZY95HyEp/onLX4EHibPQLKjpvZe
 fk5kh5fsw7X/6MARxubeEVzxAOuI6fbn9AKfrRTajGCzxkGM4Rk8Q47kS0fw==
Received: from [10.176.58.103] (helo=SmtpCorp) by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2-S2G) (envelope-from <nicolas@fjasle.eu>)
 id 1rv03N-TRk1tG-La; Thu, 11 Apr 2024 19:25:46 +0000
Received: from [10.85.249.164] (helo=leknes.fjasle.eu)
 by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.96.1-S2G) (envelope-from <nicolas@fjasle.eu>)
 id 1rv03N-9EViq5-05; Thu, 11 Apr 2024 19:25:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fjasle.eu; s=mail;
 t=1712863536; bh=/6EP39PEdV6eLxyFI48MKtoI6Ljh9xgN08pCQTCANdA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Gg/0YxZAyzeSIEUDjrVzM4oIvdfPb+5HEuOwZTsZHHo9TgZQz1J/VOCkbWT3gi0FG
 kA0K7oMkUKRflC3s8nAE14T4sBraSECNgEKpFH15aF1I/QFv239f3PPF6H8xzc357v
 /9FNbzTMOiBtfKAllhy+mFJ7gdAGX09aMwOwRppU=
Received: by leknes.fjasle.eu (Postfix, from userid 1000)
 id 01D9E3E960; Thu, 11 Apr 2024 21:25:35 +0200 (CEST)
Date: Thu, 11 Apr 2024 21:25:35 +0200
From: Nicolas Schier <nicolas@fjasle.eu>
To: "Daniel Walker (danielwa)" <danielwa@cisco.com>
Cc: Nicolas Schier <n.schier@avm.de>,
 "Valerii Chernous -X (vchernou - GLOBALLOGIC INC at Cisco)"
 <vchernou@cisco.com>, Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 "xe-linux-external(mailer list)" <xe-linux-external@cisco.com>,
 Jonathan Corbet <corbet@lwn.net>,
 "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] Add MO(mod objs) variable to process ext modules with
 subdirs
Message-ID: <Zhg5L2xO_lT4lLwp@fjasle.eu>
References: <20240405165610.1537698-1-vchernou@cisco.com>
 <ZhfLrGrED-ls6i5V@buildd.core.avm.de> <ZhgdjpE+yl3IYSzl@goliath>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="kz7PYebefrXoraDu"
Content-Disposition: inline
In-Reply-To: <ZhgdjpE+yl3IYSzl@goliath>
X-Smtpcorp-Track: 1rv03N9EViq505.GOkxCdm3hYZiX
Feedback-ID: 1174286m:1174286a9YXZ7r:1174286sdeYb5ezlG
X-Report-Abuse: Please forward a copy of this message, including all headers,
 to <abuse-report@smtp2go.com>


--kz7PYebefrXoraDu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 11, 2024 at 05:27:42PM +0000 Daniel Walker (danielwa) wrote:
> On Thu, Apr 11, 2024 at 01:38:20PM +0200, Nicolas Schier wrote:
> > Hi Valerii,
> >=20
> > thanks for your patch.  I know several non-upstream kernel developers
> > that would like to see support for out-of-source builds of external
> > kmods (and we developed several work-arounds at AVM as well); but please
> > be aware that patches that don't fix or enhance the in-tree kernel/kmod
> > build but only add feature for out-of-tree stuff, are rarely accepted.

"out-of-tree stuff" was meant to be "out-of-tree kernel modules".  "Rarely"=
 was
chosen in explicit contrast to "never", but to hint on my personal expectat=
ion
regarding the probability of acceptance.

> If that were true we would not have driver/uio/ for example. It seems like
> Cisco and NVM should work together produce a solution.
>=20
> You could run into this issue even with entirely in tree modules. For exa=
mple,
> we may have a v6.6 kernel but we need some modules from v5.15 for some in=
compatibility
> reason in v6.6. Then we may build the v5.15 modules as out of tree modules
> against the v6.6 kernel.

If your in-tree module in question does compile and run properly in v5.15 a=
nd
in v6.6: why don't you just compile it in-tree in v6.6?  Which driver/modul=
e do
you refer to?

> You also have just normal developers making kernel modules which always s=
tart as
> out of tree modules before they are upstreamed. Those modules could be an=
y level
> of complexity.

I do not agree, but there is no need to convince me as I am not in the posi=
tion
to decide between acceptance or denial.  I just thought it might be fair to
warn that I do not expect acceptance.

Kind regards,
Nicolas



> I don't think it make sense to view this as strictly enhancing large of t=
he tree
> modules with no upstream potential.
>=20
> Daniel

--=20
epost|xmpp: nicolas@fjasle.eu          irc://oftc.net/nsc
=E2=86=B3 gpg: 18ed 52db e34f 860e e9fb  c82b 7d97 0932 55a0 ce7f
     -- frykten for herren er opphav til kunnskap --

--kz7PYebefrXoraDu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh0E3p4c3JKeBvsLGB1IKcBYmEmkFAmYYOSYACgkQB1IKcBYm
EmkWABAAuB4G3SHinwG4MH0JXhY/Z9qL2SQzLcu+frNSpobXWQIDgnEDwsdBbMWp
UsC26wZjjBJuBv42JYEeP79EawDqJKImFg75gmiXnuVNt1/foqsKJRQjRMmc5YeO
hmCX9uOJcKC6C66GtpppRlTZidh4I7svhLnvGUgz10Y/k1sx0gyl+PfqW5okzXNO
mreXIep3YrlHUg3vMnLmyvtj6NKbC+nZFeF88TYHFG3HURWENw1jy9tJg8VpyqCv
V8yWtuxmnStiwGjX40PDdiTcNHbBwz0ULkx/N98aw1mCJT7pZSx59x4kRlSTgCjb
7E98vL1ArfZEIbK4zb+BVNJp8aqjaEGSHrhH/pWMt+9lhKl5thuHjjefp0tw2nHL
gPNdGcTxDsSiW29hkCPk8T5Wo+PO7IAFiDAIAETdi5HUR/uCylrsb2iIApU/jD85
mELn6UDNxjHzk2db1uBNARAuLRkmElIL1Q48DNOhpitPWnwipz7GMIl4mOiz4UFQ
GVbOrtcYeIDx6Br860aMJic/4kCI2a9SMEoOEDWaN37jpoPv1RUGd4FbGGRoZ87Q
FjcMZWy7X4IdVqB39BqzQll1YnBMyQ2WGJ1V8Euiv8DuL7INElouhPf1vrMNGDCl
pfXAKOPa0ZK8yykV6KHco3LeJFY2D0qERlhHd3U5rhx8YKGZkr0=
=5fm7
-----END PGP SIGNATURE-----

--kz7PYebefrXoraDu--
