Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 240D826FA70
	for <linux-doc@vger.kernel.org>; Tue, 30 Sep 2025 05:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759210251; cv=none; b=eADSR5XatG+gsdQ5MxDhlxvkEyt4LM6hemvHVatR4xjgUbhWODsRgLhQQYELBklxWiH/1/yM8SH8e18uxVYLXe5mhpNOeS79oPl4/PVIXzYspI0ksFTCM9t3N3GIFj7V1xOh0xVm2jj10soEzF3zcPRvA6YjDDeeiIumSle6UW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759210251; c=relaxed/simple;
	bh=kJbqLTiMm5n5re5QK5W+OP5gnoACwklUKd76CdRrlyk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GfDbAZNMHibKG0OJx0MWeUPVjnH3SAoVXhJK6/T++B1mZq4Vip9tgveUpxO+ucQwfufVRg6/r8HkI+SueHUUtHCyy/Z5xBFz/6ArdTZfkbqUsPhTvwu8VlqVLSFoUxZ/VGe91QBZ0A4l6FdecNj1wdf9qx2v1oxuTlVrOYwetMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MhfQs+Vb; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MhfQs+Vb"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-27edcbcd158so56113585ad.3
        for <linux-doc@vger.kernel.org>; Mon, 29 Sep 2025 22:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759210249; x=1759815049; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kJbqLTiMm5n5re5QK5W+OP5gnoACwklUKd76CdRrlyk=;
        b=MhfQs+Vb1YmkmBFRvuBGmrzR7QjTt/S0ppwkiGaHR/bNv2vQvYjAy+Ls/sRJZzUozD
         yU/HwajVP6mLUcNVXq0R7+OQB8jscL9Wf9LHu+PzXgPO9pyEXnaXSud8P1NWVpL1Nzy7
         0s2Onsxw/aPXfAS0ZvrNUsQtA5wX0I8dqXKwGwKPtkoU1IRrBOvXYKPje74ecLT4DqET
         a5Q4b5LjnCZaz7NxFH2WzN4ZktEAL3qxIBKpwIBC7e/MT4i3gL+xxuevB9xBxKeNbnqG
         EfUI0rbrWrUnc5V07zLasQNEMCXHk1WbdVPKZqMCJ8tKEqhU7HHMv/8GJQSf1b7ILEus
         7lhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759210249; x=1759815049;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kJbqLTiMm5n5re5QK5W+OP5gnoACwklUKd76CdRrlyk=;
        b=GZ0r59wF1gfuLLjkwWA2yzTzDWfTj7+xARFnVY5VK5LZMfilzdVkzFy+5Nwbi1FCwP
         hhTOUAE7eObq1b0xIOWq8M8vQKdMIkeBHKHpZNE4g3ndTd00OXE14xEGaENWjzfewnph
         qskNRpuhTT32vVEFsMIcS6d07WEdGkPTKlIuJDoAI01dH8YqQF7faqXeAAxVgc+JmFoi
         50oNwGiHVMx6KnwdzaiJ3DChq//vSKscMTYscTFBrOk42n/bHWsTaPKBZFS0C1LdtSC/
         HQKTC8FvPIW9tgbYMLsn35AstvPFN6sQoCB9vkEgKqNqmCVGmP1V8buzNNM/mCcSIsC4
         8neA==
X-Forwarded-Encrypted: i=1; AJvYcCUA+ViG6l2tofmiEs5hwKnHBhVmU1RLu53z1RQJPNKthguExTDeiQMkwsTcS7YIOuYzQLAbpcpQ8UU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwQRebTJyTB+b0KcYrsnxxVN+CX16iOZxFuAOFAQIKMMLtPBxg
	dyLmY6lziY9csN36lKbASzfFYDdZTPSxz+k8NmbtacbzSmClsMZhWRKA
X-Gm-Gg: ASbGnctd/53bfd+EE0KcQ5+OIEyJENmYeDZvt6101iwcmRw1eiFTw2yuSMETBzGFUNG
	NrOm+NZGJfFxo7qT0E0Mhtf8rY3s3auJ0zk8d8qanNBass6AWilomXwvwhil1FipdyqoRjsmscB
	qVrqTTn/DHYJ7iDjDVcHbn1nl4pz045ChfsKdKoBqEGyunPAVeH1mlJvrjv55Uu4eef9HuBHnlL
	tOQkn9Mq20NF2WKvtpFg7fFAM2YLNILmY4ed2krj7K3nr4TtWaifX6hBiXvsh1w7aCd4K87ls2y
	JHdUOyE2JSUAdxhRuxTFXoQfTpKV57CYO2TkScmIQvKNTnC3nAlvQpEO2UXkBxC6iXEkHWV/Zo2
	NfA5/MFwGr/DlqYV7+gX6O47XN9j+TV6BopkOKqaRS64AEipEpJ0RYsdE4K1f
X-Google-Smtp-Source: AGHT+IFH0qFdbXtToX9fXo/RIjy+qv5QY1o56wuNcKsmdGzJWcBq+mdk2EFwSV8jJXEVGNLFeuik1w==
X-Received: by 2002:a17:903:3884:b0:282:ee0e:5991 with SMTP id d9443c01a7336-282ee1da05amr90374515ad.30.1759210249140;
        Mon, 29 Sep 2025 22:30:49 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed66d43c4sm150130985ad.17.2025.09.29.22.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 22:30:47 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id D887140220BF; Tue, 30 Sep 2025 12:30:44 +0700 (WIB)
Date: Tue, 30 Sep 2025 12:30:44 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Swaraj Gaikwad <swarajgaikwad1925@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Koichi Okuno <fj2767dz@fujitsu.com>,
	Yicong Yang <yangyicong@hisilicon.com>,
	Will Deacon <will@kernel.org>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Cc: skhan@linuxfoundation.org, david.hunter.linux@gmail.com
Subject: Re: [PATCH v1] Documentation/admin-guide/perf: Fix indentation and
 formatting in fujitsu_uncore_pmu.rst
Message-ID: <aNtrBM-ta2YGDp4t@archie.me>
References: <20250930100742.4741-1-swarajgaikwad1925@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cMSAwhz+Sv4CEa3d"
Content-Disposition: inline
In-Reply-To: <20250930100742.4741-1-swarajgaikwad1925@gmail.com>


--cMSAwhz+Sv4CEa3d
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 30, 2025 at 10:07:36AM +0000, Swaraj Gaikwad wrote:
> This patch fixes several reStructuredText (RST) formatting issues in
> documentation/admin-guide/perf/fujitsu_uncore_pmu.rst that were causing
> Sphinx build warnings and errors. Specifically:
>=20
> - Unexpected indentation in bullet lists.
> - Block-quote unindents that broke literal blocks.
> - Missing blank lines between paragraphs and lists.

Already fixed by [1].

Thanks.

[1]: https://lore.kernel.org/lkml/20250926043748.3785-1-krishnagopi487@gmai=
l.com/

--=20
An old man doll... just what I always wanted! - Clara

--cMSAwhz+Sv4CEa3d
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaNtq/gAKCRD2uYlJVVFO
oz60AP97XF6CvLqd4PNXGjdCTmfDaUUqBNMnJAzw/BJi2efbOQEAnNY+kFcwa4rh
HBtD9ufl1ONXIwYHfhbAR8Is9Fb4dg8=
=CBP8
-----END PGP SIGNATURE-----

--cMSAwhz+Sv4CEa3d--
