Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09DA63B5821
	for <linux-doc@vger.kernel.org>; Mon,  6 Jul 2026 10:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783334478; cv=none; b=KdawZTE9ar4qbaPyAbTZzSW1/HVtab3ChhL89z9nuMcZ7rYYGkNEB5Gf6/9ucEpjcdo/8F9srjOFWNNmEIbWo5Hzz9n31Xuh23Cj8rmS7lsXYC4/wCmQmw0LwQHG5sE+ycMDsGW/b0R1K0JoYeKuKacJ0Yfp8X++WLhJL/tCYWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783334478; c=relaxed/simple;
	bh=tcRl1VT3E4bY3Iz0hzz0D0GMh/W67RUbYGutLFyNepQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AP9h/duaoWnH33mWQqBnHjhXDueIRS/TfIs3lhjPh/OpIg679l7GADBFqahcQ21WI45eeg61aavvuCeNXOzyJIRQNbTOYh1ivcIjHyuyPs8VOtKJog9NzJoDS7p3XDGvBbibHi3oliYZntfgnG99xPnE5FGQ8RxLi2UGCLpg4Lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=P3BmNy+a; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="P3BmNy+a"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-47122683cf3so1796851f8f.0
        for <linux-doc@vger.kernel.org>; Mon, 06 Jul 2026 03:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783334475; x=1783939275; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gC0UcNZnbE6CbmrSx0jp7Sr1t92Q0XTpYVp2pbMGzto=;
        b=P3BmNy+akynJWhMlFFcWxCDBj0fg0QHIoyugBh46JM+58xryILTvAxHrPeHFp65nQ1
         kZVqHBlPxn8N884pcsyfJ2hVVXfqYBDYMO16h5n1iQGErAlIG4DYa8Nom7AS+qR8yEqw
         ka5C03pHpx5k6n7l79B6N6lnSh0+vqPewclBljKmYzcKOzex7o4npLWJIV8BNPp9JHKE
         5SrWgE6Ouz3eidOY0zBoKcC/KYfeA8VPlTCPJ34pY+178sgmspZZvzvrMHc4wKqxWODx
         lhgsIK+qoHR8WBMAv+wt7tbh15PpmIqGeGrzpbkTgeUtymJIEnIfJYQaNWeWymSNa5aZ
         jQdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783334475; x=1783939275;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gC0UcNZnbE6CbmrSx0jp7Sr1t92Q0XTpYVp2pbMGzto=;
        b=Z4bg3Nf7d8v9dxiDcFj5V72hzbrfZsC8qqq4eoZa7UGJaNBqB/Z/LG8b6BogFpvtxN
         L7VOZp9voH0zMV1txonjyuZ9jC1/cBlhuvguym2gBugDpmMb/O/5y8DYDvGR5BLBHRFa
         wEqs0BY99/uaNajX7O/P07WACKLTs8086YP+TDPvqQ6fRPk4234ztg310ca43Mdgb8rp
         w9kQgI8eIf4eurD3I9DTWAOzedMhgtwXWGYf/XKNokBPVrBYX/Kyij4HAb/wpRqLVVPx
         gTe1Fvb/vlklF9PK1AclyriYpljDRfFhdHZBg40hDcAhhAo7YhfRyb1YgG87kPvnphag
         QH/g==
X-Forwarded-Encrypted: i=1; AHgh+Rpt8Fcst0BEcWVbta48QRuGargUdj/yWf3kmg3BSUPV9Ly/3T0OkXouxdo0lfjBiZEzMxjB1e1v89g=@vger.kernel.org
X-Gm-Message-State: AOJu0YyT48hbDa3zedMP142g7u4PM6GJjQw92MNHlMtYitSG3KJ+KbqM
	GomPe1tdE3jEYluzUmJTDS4qRMyIz/ZAPVUWWFkmGUqhm0n/Hr0TpbBg2hRIYVTp+eoS4hXQ+eH
	EHMnb
X-Gm-Gg: AfdE7cl65TpVqcPiYc00Gse0Wa15m3/6M2ivngq6PagGrC/v08AEXOl/jPHjPY1ukfB
	dK7LI8eruQWXEYydFxB8klmfgkpfCcr+t6cYVJkbF2PPmjokoHST3+z2q+GW1BsqBH+BZzXANPE
	Kmy4pKGEWGtKkSUUuOMdIeh2GIFnRuYVWaak6SAqP9G+BYcUzpV0uipDqUNbQr4IIvABG+uXr2g
	mrrZAgCI1aNaJ0/hKnHcjXj6d2VhlKDQs5bl3NtiJXZ3FsUpqt9m3Bn6fpXrgLX5SPZ9N/nw7mN
	p+/wTsoFVfD0ttL1tNECUL4ISEUV5q7HWUb5DUOXFHnwwDb1ThHYcu3RByIJ2HoTzsDyaVZtS7C
	xm6Xmuw+est89oO+70H8XqM5CFM8LhWyLRMIYIVhWWxuQ3zO7paSclgbnmBRjDdD8WoaB9BDnQZ
	c29Z8u7vrscgJvxk0vqZtxKq0ZzJhoSAy2QfxYKA5neM2nq62UzHIaKI/mUEofiisuXdz4kCzEH
	fdeOcf0vj+ikjQ=
X-Received: by 2002:adf:e448:0:b0:473:57d9:d014 with SMTP id ffacd0b85a97d-47aac5e19a9mr9203337f8f.17.1783334472541;
        Mon, 06 Jul 2026 03:41:12 -0700 (PDT)
Received: from localhost (p200300f65f47db0426af56a07ec3b32d.dip0.t-ipconnect.de. [2003:f6:5f47:db04:26af:56a0:7ec3:b32d])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47a9de1d8cdsm25716162f8f.1.2026.07.06.03.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 03:41:11 -0700 (PDT)
Date: Mon, 6 Jul 2026 12:41:11 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Bjorn Helgaas <bhelgaas@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Linus Torvalds <torvalds@linux-foundation.org>
Cc: Shuah Khan <skhan@linuxfoundation.org>, linux-pci@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] Documentation: PCI: Update header defining struct
 pci_device_id
Message-ID: <akuF--S3u2ighG47@monoceros>
References: <a01d1cca33187c8b2715227d3db7146465513ced.1783332821.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fydpeoqoyqksxjta"
Content-Disposition: inline
In-Reply-To: <a01d1cca33187c8b2715227d3db7146465513ced.1783332821.git.u.kleine-koenig@baylibre.com>


--fydpeoqoyqksxjta
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1] Documentation: PCI: Update header defining struct
 pci_device_id
MIME-Version: 1.0

On Mon, Jul 06, 2026 at 12:21:15PM +0200, Uwe Kleine-K=F6nig (The Capable H=
ub) wrote:
> The defintion of struct pci_device_id was moved from
> <linux/mod_devicetable.h> to a PCI specific header. Follow the movement
> to get the struct's documenation back.
>=20
> Fixes: ad428f5811bd ("mod_devicetable.h: Split into per subsystem headers=
")
> Signed-off-by: Uwe Kleine-K=F6nig (The Capable Hub) <u.kleine-koenig@bayl=
ibre.com>
> ---
> Hello,
>=20
> I'm unsure about the best way to apply it. The obvious options are:
>=20
>  - Linus applies it as he also pulled the header split without involving =
the
>    PCI tree; or
>  - it goes in via the pci tree
>  - it goes in via the documentation tree
>=20
> The 2nd is probably preferable if there are pending pci fixes for 7.2
> anyhow?!

There are a few more instances that need a similar fix. So please
disregard this patch, I'll post a complete patch adapting all the now
broken references and target for the first or third option then.

Best regards
Uwe

--fydpeoqoyqksxjta
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpLhkQACgkQj4D7WH0S
/k6GPAf9FX7sv4VNoogpb9+xtXJSRMue+Gk2u7O3FsjA2IcWhdxa+p3tGns/By/I
lqXKtM+4v8g8aaOcbC472qd9t5w+7qT4ysbXlgNtPpV3D+89dG6laib7J7A3xQsY
fTvXONa3pwR5mVDqng6w0c140cBUTNGc+3CnttlvbfTgu7zyk75K8bez0eURGqlV
61OYwO7sYyQ2mn3GyXF/Jr5f3tzGg4Ha2VwRt5RGG8GjA9W5qfTzfbkYLaO6nHFb
L82PUJlqB8m6VE0EKhUXzRbXHR2pACHf5GYZu76ngs2QVm5MV4Vnd+ry4bGIY5c1
FaeA494W+6sRHzN8JWPIl+HLt5n6tA==
=meB0
-----END PGP SIGNATURE-----

--fydpeoqoyqksxjta--
