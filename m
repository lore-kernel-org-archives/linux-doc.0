Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1CEF4A0C
	for <linux-doc@vger.kernel.org>; Sat, 29 Nov 2025 06:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764396838; cv=none; b=a40tUztj78MTp11xW3WyqtbH8mHNE1rIG/ig6wnIdwZez3Q+5Ct9hJObtICHf/zj4W09sifHBgdto/5iDyHg1eesrO6bZenJhE49n8SJDrlCn7MTIpyclklWAMDUovjwCzExpqTPVWD/oh07HOQ0ZC+kErw/2h/STSnYf06pe/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764396838; c=relaxed/simple;
	bh=N/UJt7KBJ78Mnxz1RizQ8Qtf5SW/riBLR0h+pKcbRfs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=StX14bBOUSkRZZ4X2EEEt3qiPJcyJvP9OBZax18uzUlC7hUUFEh3No6reMU8WitGeQKJgpXstcQFXlhHLpi9Q+ItMa15gUrAvuqhC0LdzB5ujwmtw7xZbtF2wPuXA1R5aJAsdCUvLGEI8bfpMp9y8h7+115JjHOp5z+K2Pa+Vio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NxO2Clcd; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NxO2Clcd"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-78aa49cde3dso24742827b3.1
        for <linux-doc@vger.kernel.org>; Fri, 28 Nov 2025 22:13:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764396836; x=1765001636; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=N/UJt7KBJ78Mnxz1RizQ8Qtf5SW/riBLR0h+pKcbRfs=;
        b=NxO2ClcdrMKfD/5iLSij1Y9yJIb2rmZWcce2QC/nUBdZlfv35FT4hcyiNA2KsDYjCR
         VFYwe2sPsjO5tjl9R8I4TTNgRDvsItxmKjG5LbqIhnlGLxcdHop5bX3d+XZqWuKN7IS6
         epO9lnKaDf+z2/CrhMDXWzD2N0zMp0JaNwnzLLgeFMwViRbY6JU0mBi8QGySAwq/5ID8
         YYa8JwFTQEa2lcMDI4VLFCkNnO7GNBDOtqcYy5wct3kBYu6N3oUdvFxRxmpfG36K6eqC
         FN7nuJCAGIplQWC4YB3xvaRccqCRilERqu1F6z93IU+cmm9rZFIlAqsN3O1/a6xZZBS0
         k26g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764396836; x=1765001636;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N/UJt7KBJ78Mnxz1RizQ8Qtf5SW/riBLR0h+pKcbRfs=;
        b=cWpoSyoMevp0ywMiq8Lmzrpav/JTbynJy3jD1BDVMVeeFlojK4ko8VztdxYf3AZHkE
         ybXPQKkotVCUoYd3AOCHP+OGN7kBZXEEK/hg2D6VhFMVPTCgsklOC//rlJXxugf1LQIV
         2FbqnvAp1zGoV6Q5viftcKjBB45D5vUOtHMPuXEqX70l5PBrEDRvp8hBAR2Z3F0YLazq
         96WtujVXMXgSFhRD5A7v/5pkiMJwqOaMPBvk8oY9TaLy9OAu/9JlHNRukJq0QVdyhd/e
         hcyPPbBbyN1uMvhvZMjQqPLF+/2Wi4NEVnzUQyNMlUhZx47W9KxXg4ffp4ACXeFMp8w9
         pEEA==
X-Gm-Message-State: AOJu0YzfKNAX502/ayQFcJguuBdl2UwVRSaBkzeMhjvIDapury8qJVE5
	i4ONILR5b5KfAV0KVgSCE33XV0gmCmOEaFsc0FOAwETp/+oFnQ5NRNAP
X-Gm-Gg: ASbGncu37yOjkpT6AdtzbUZJ5OlDP2TD2RycwWfM2yPlXe/Mu6fahst0PWj2s6wWckl
	6ojORG/SYmZOiDVyv8STt8Ot3BQ2zf3AUPQJgN+YuycAQOKJq+MvvhS2ntkMeIg1HDSRFprfh4B
	y5AqJBi6ocFnOeHrEAtZs3/Kq1SZ4+ZAN+nz4+LFc0v6Fx0A+Pc2J5MxwNWK9R28x5xl76hNTnb
	IW6aWR44hA7AIHSbblL57juPBPYtcQeijXlZiK3yVdNwDUWTuEaMDOX7IBfoF9IoKNv9XGxsPev
	WlYMyE1d17vdcijPU6oQjp8wAEW4wjKVVtGucXAInOJClT/RPPiGnO3L95HWVD8dhkBlRXDx7qM
	gma6IPh5l+H+dMPL9Vb3g/tOYF1mQKMMcshvJ3zMfTxoe8TQoNupjFRkJ60WvPw0jpfmQw0Wq6O
	wDNe6Y9VuQVOlwzwYSGm6t+Q==
X-Google-Smtp-Source: AGHT+IFeF+7rAVCyTdCqnPau2+6bWuKd1NEEo09WhTMmfCMc6rDM7pGr6ebydVzsV1AqdYdGXGeuug==
X-Received: by 2002:a05:690c:6282:b0:787:f72d:2a5d with SMTP id 00721157ae682-78a8b478e4bmr242685997b3.2.1764396835616;
        Fri, 28 Nov 2025 22:13:55 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78ad1045723sm22503807b3.55.2025.11.28.22.13.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 22:13:53 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 10A90420A78D; Sat, 29 Nov 2025 13:13:48 +0700 (WIB)
Date: Sat, 29 Nov 2025 13:13:48 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Max Nikulin <manikulin@gmail.com>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-scsi@vger.kernel.org
Subject: Re: [PATCH] docs: admin: devices: /dev/sr<N> for SCSI CD-ROM
Message-ID: <aSqPHMSgtHN7ty8-@archie.me>
References: <a221275c-53af-459d-97ed-05a0766adb04@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2DTQ2HgverAOqLYq"
Content-Disposition: inline
In-Reply-To: <a221275c-53af-459d-97ed-05a0766adb04@gmail.com>


--2DTQ2HgverAOqLYq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 29, 2025 at 12:12:32AM +0700, Max Nikulin wrote:
> +Usage of ``/dev/scd?`` as alternate SCSI CD-ROM names for ``sr?`` devices
> +ended around year 2011.

What about "Support for /dev/scd? as alternative names for /dev/sr? has been
removed in 2011"?

Thanks.=20

--=20
An old man doll... just what I always wanted! - Clara

--2DTQ2HgverAOqLYq
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaSqPFwAKCRD2uYlJVVFO
o6PUAQDqxcd/JKBpxfZ6OYZrxEtxybPvLxaJauhOI2xuxqhk8gD/bl1UUTyMQcHD
OdR++u0nCqcGS37b5CQ4LkiHLrDhzgY=
=609j
-----END PGP SIGNATURE-----

--2DTQ2HgverAOqLYq--
