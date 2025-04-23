Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FEBE1EF094
	for <linux-doc@vger.kernel.org>; Wed, 23 Apr 2025 09:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745400651; cv=none; b=TjtMdcodJEgdwy0OK/NQi8zz0NWFvPJ2cAlHlLztv0o+EjoRXMyfVn0P9dcaEHOVmq/MVfqGAqjzOsfju0gfQa/HRBoSuMu/xPiT2/vUNrumfI1xxlNbLaED1gg3k54GaQFZjhO8ExNWBgA3kMLy3xgrxXbODdJITbAjxWfF1v0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745400651; c=relaxed/simple;
	bh=zc2MpuZxPkZe2TmeryHW7kMkIaIoao0VsaUCv0wGt0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DnLKbwkeVKwS6cr+qQCdRHhhI2VX+p3ssSSNfqtooDOa1rO7MiU0E/p9pY0J2rSnF0FBZPMgLwecAFZDfWB9S7tCA5eBJORO4bBiVa2Hpb0SuMT2r3w5PomJfaGiMjyNV3sa7ZmnzsqYxOBXfnWnv1ZDBECquyOJ23pWmSsGQqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=w3ty2l1e; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="w3ty2l1e"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43690d4605dso49156325e9.0
        for <linux-doc@vger.kernel.org>; Wed, 23 Apr 2025 02:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745400647; x=1746005447; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zc2MpuZxPkZe2TmeryHW7kMkIaIoao0VsaUCv0wGt0Y=;
        b=w3ty2l1eCTaxcf1SRcZW8b1fKDc+2Y34kqEDnWT/ktV/egVYu/88/pLxkdK/xqgVMd
         UdbvsLgjL9QbKWTM5eoM94DMS94BhIciVJ3rw6XOhuQN/BaejshvB2BEPYsuwoNA32Z8
         qUetHSrvAq3RmjGPcpqVmLbENf/1XCPF7mzSXZKb1YPIBd2l5qL4lcaUuMa4cR//dCq7
         1eR4Jq5zhBLKJvskr7SLBUT7AuVZ/4ldx6nrXvVR9smj9+R+KuNuNP7FRezSf1jjosYI
         uP6bn9XF0nzF45KSS3j4jHemLDwFmbdM3p9TrylZTRCcd/ofDMFuh0h2s3Yc/XLUH3av
         Zc9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745400647; x=1746005447;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zc2MpuZxPkZe2TmeryHW7kMkIaIoao0VsaUCv0wGt0Y=;
        b=duJfbPk3r6pvsanoBC609thXVmmhsV/xvJXOgwE+CiDsvBV5DiI82nKEiKjf6i2FFd
         rzoha0iCzM60Su/+H2OxZmSXHbI57ef4WwdZ0FuXYfwMYlEb+KvXgc7BjrLHbaVufgXi
         iOSKgEZ6RoODjZs841dpr7D2YZTkn1Vqph1D3lAyB5Entx3qy60hK9PEcBnj6o2joZ3w
         uEvoNefu9D963o7PUNgIFfcX6YEIsxVV1o2poQ7EonsIa8PbGBwPl4cykBMv7ss/SL/5
         vVryLVbcHixymVjSiBBl32XmqHWrSXkbmFNkg/sXKuCsJDEQKCqxtn0g8Rl1aEQk4ii+
         c6+w==
X-Forwarded-Encrypted: i=1; AJvYcCXVKCIHSxqxPMb2TTE+cOaq9JUU3cLlVxg/esiMTrjXlvhYEuTjZBOfhS0qntlCaawvpI2EwHXKz+g=@vger.kernel.org
X-Gm-Message-State: AOJu0YywW+cQtXFvRlSXQOChHVhONCJHkFE5cjmDhxvRjkYfqQtymdWr
	Sv8/yq9md/P5xemAGxU36T3im52ElKr5OoOel2VD71yrq4O5UVI1C8CYpEdcHaY=
X-Gm-Gg: ASbGncvDTCAG+TXAix5UAn6z+X0zMATZ27OVNeb1eKTkokzEjgmzaSYcN3xDnXyuUNm
	9tpS6MU9i9zofxrNcSMRhlvUfgoxJ5g9DRBgD+/ZSzGTdSzEw/KL2r7np02GpyfO9pH9ysGANIu
	l9WjYvnlk8UbPx4QsOFNygpjejkh8S2PJxrcE8Q+7jqcye3A4UMl+RPjH1PKRTEhiqSQ7mtUn8S
	P09ol7K8AXsY4LxcObOv/RfDY1n622CrbFChUxPr2pMBmR3HSfpz3ess7/JvTwr3Gl7WAeMuB5l
	HqYBccUH+v0+nQ0qnxbJFSixNR3184yiAiUbh5LSvNxztndZekojOvsTO19Q85H5ELWCgGowUHF
	OZZ8nKP0=
X-Google-Smtp-Source: AGHT+IGYIRlaO8pPs6VOM1lbH32BnRzuDrN5uMW+rN4dGUiqnfcKg1oyd237URbM2+ibr1QQs7FIDw==
X-Received: by 2002:a05:600c:4e8f:b0:43d:47e:3205 with SMTP id 5b1f17b1804b1-4406ab99521mr154772095e9.11.1745400647431;
        Wed, 23 Apr 2025 02:30:47 -0700 (PDT)
Received: from localhost (p200300f65f00780800000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f00:7808::1b9])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-44092b0a4b5sm19262045e9.0.2025.04.23.02.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 02:30:46 -0700 (PDT)
Date: Wed, 23 Apr 2025 11:30:44 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-pwm@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2] pwm: Fix various formatting issues in kernel-doc
Message-ID: <sctvatvjz2wf73nunz6lrp6z52qw26bkbeb5yeq5yfz5vwpv5i@gfaxoo67dcr2>
References: <20250417181611.2693599-2-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="264cylunhiihawgp"
Content-Disposition: inline
In-Reply-To: <20250417181611.2693599-2-u.kleine-koenig@baylibre.com>


--264cylunhiihawgp
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] pwm: Fix various formatting issues in kernel-doc
MIME-Version: 1.0

Hello,

On Thu, Apr 17, 2025 at 08:16:11PM +0200, Uwe Kleine-K=F6nig wrote:
> Add Return and (where interesting) Context sections, fix some formatting
> and drop documenting the internal function __pwm_apply().
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

Applied to
https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/for-=
next

Uwe

--264cylunhiihawgp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmgIs0EACgkQj4D7WH0S
/k4omggAkZzdVzAoG/HbIWHoh9BD931ApKqoWmJNziXZWSpOiYDPgzZvtfRcYzsy
TWbnv6sqRQExDd611KHQWsgRttwGqTLGRggkz91PbxE0l8Hlyx1Bva8GY6fC0NSx
Q3Jl9O81y54ydQEUM2cxmxJS8xOjCxEoWA0d9698fPDN/aDEdcHmDupqCN0KSjOi
+hX1VMkV11byKq3WbdM3uUhz9BdbFNTq5DXyAeNn5Hg6dO0MdX/vb1A+IP8M0T+n
ahuctCxXpWp26zio3ZwXxEZ5iWOx+FmH50ScSMEcOlDnfIxSaxgH0a3sIzcqvIHn
M8GpwlkX6vQcWzY5awzdGT7n6kOj8A==
=dB7L
-----END PGP SIGNATURE-----

--264cylunhiihawgp--
