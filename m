Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795648140;
	b=yoyBVVdFsdb34CpElLgWqOV0m39IY4VAu1ojYwGRYDWKi1hapQuStYbD3WYqSltysXmA
	 AVbwJCLBjjh9jaKCaZtaBW6Gd69tC6B3lqIhCVtS21iZOI4wlOU1gAe69UxoeQ22YULkT
	 9TaXXVTzsYDC+zsvFn1NDjW/uYcCIUkMTfJkvgqjFeTTxNe4vPIYXs2RjcnPVRErXVd6N
	 mopd81nQ5V/XxHb39BtDDRKwbbtY1caDC/rYJH409luFnND/OTPMsNcBBjqxAlvDbp9id
	 Yl495guz9fyu8cqcNH1PdYHKtQFfalVWEkosz7v/US5excEXGy/Dfs7t5nRVWLVZpig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795648140;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=EorhezSB3H7kybqBFg7VnnNzD79YcoCZdwMFraja7fw=;
	b=JvF7oD9rzoKfxbSYROhPVV3r9VQnEtlm1WTqPt9DFdnfQ6gWOjiPUoP+ZgOTInbv5Op8
	 pTiKkKZfENVDohK4UJVLm83STs7gfebnxVlOeZ5PV/xqYywPK6UptzAJjO0xWqdmZGcEp
	 NJxki1AsIPajosxd3Py4FYLvoLBci2kMUutQQzCByL/oI8BfY6U7CPbXEVGGwFrYAwkzT
	 dgtZi0+iE3iwbc6riaLbBFsZhl/E/wDHLCHbz8PpyVaNDiaMj+v/qSGKQt+EzBv72w0g9
	 M27pJOsaV01h44KbqfA6pGhP8WT5I7C7rAXbzNGqvTxrqKeZ/cdLF7Mf0dvt7ZRczwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MgEQxPvq;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6DB9606A31E
	for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 23:08:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6DB9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MgEQxPvq
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2f045b921caso37523925ad.3
        for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 15:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795648139; x=1796252939; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EorhezSB3H7kybqBFg7VnnNzD79YcoCZdwMFraja7fw=;
        b=MgEQxPvqyytLZXf90OJPdh9PK1QbYUQGR9tBs/gU/iq2JMuoIc1EOF5PMb/JixBK+Z
         wZdsRu1GceHsqwSdB+3O2/7Uf7ghDdLNUL7SLKmR8/BiYzlM1mkLX6XZUrB07Tev7973
         X7MksrtBfscb8nNYJbxGM+eNYzSr71x9jR0MLpzAgaxAa53nHoo9ysokjg+ydCbjgkum
         arsJzwe58DZENu8fxE6FjTT5rKBGlRJsyFCeIjUGG4w0BdBAA0Jpn1+K96zKAZvSAaz2
         90vgLS9ls0SHShj4sXXg5R8AEfgvAuPpE5qByrYdt2raTvSBo95lFHi8Jk2qURMPkz7v
         cZbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795648139; x=1796252939;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EorhezSB3H7kybqBFg7VnnNzD79YcoCZdwMFraja7fw=;
        b=xp4o/kdmurDKxE7ddxvfLpqS1M6G7dXRjvtiG+A9u68hWs6RIGcwqLKt51ewoGB3FF
         wBCeMcDmGrDPg6nXbhQ18uKF/1/5JojMuY1g0OhC82QuzY7GbeP9uYIfes1au2XYgRBc
         Q5GEif8w15KRr54f4hHJBriu0PyWQEWu19SFtjEfpub1KlVZRY/E4NtFY0Eq9g/rKWE3
         JvX9ae0Tq7sV+POpuhyLUS9C3USobBmTMFnj6Knwogv0cdQ/slo1drHy2kLb1Ws/qCjO
         1UvqXpJG8EGRkH/g0tkevW9Vdgvksrmvjylfu8toY14MrdQ1B/VOxJbh011vMaxxB7ZS
         5sSg==
X-Forwarded-Encrypted: i=1; AL+hErE794dMmvKrK6k5DrENkvd35hxvZZZzpCWhpfwbWi1btjf/11BUY2ZoXL3TIW+pxu/x5R2/u2bsRNw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+oYwQJY15YUB4dAXrt4HLc5RDHUEh0Cepb4jMVwiW0pHF6SVxC
	P9NXEmfCYcp7wac7LFkGeAVTVujW/a0x8p1fX8oCuXX5jmtGFthhv4mj
X-Gm-Gg: AZFdTZcEdEtQrKLf9j20y9yd+KNFJm2MfsL+ZeWmsbpYGAqkCu6Un/qKIKSJDAA67Dk
	fguaprZvtjG/gMPd0aw/WkAKLOh260znxH5Wjx/ZZ1RYCB4s/bFS7U0dL0WIWqwz1kt8bMjKMvR
	r4QHyOMMnKQR/ksRApBFgtR+zKBmFrZSBViFFBmAgZCs6LKuYVnxFJkJnU+4UsdYgxM9grzwTaJ
	qxTH4cVtAdtlTQajtg0yk0vlz5AXGD5kJ7yEQVAwcrtf6zmR78WvJETPckGcx/H2z4x/xgtzZjG
	bte93WXOvX0z+dtTUd+TVQK3G2UH0TMHARHOXP6Dgi81wLTrEckFQr2FuD2OZocm/91RIQDikvm
	Y8321ddBXajzf6GBNCOvFbd84vO4O61adrVgTapmFSMadvLM0uEKTA7/RHG3Qeyv0LdpD0U9dF9
	QLrmoBD4pWaawx601M3aYLKpke1sbI64KgVFeeM3qbl6q5tXx77rDy01p3U9bKZAeSSr6vI6Jwb
	tnuumqOpgPD12iti24gFW/E2h47hsDr2K4rs+44f+2HnyHmL6oRkVPBCi3CxehkXbPo62xAV3bu
	Kv0qTCdKehMGUNdOppFMyJMrFMZIm+dI4xGasMibLjWLB4kC
X-Received: by 2002:a17:903:19e7:b0:2ed:b7e4:f5b with SMTP id d9443c01a7336-2f03f18a7d9mr181302175ad.40.1795648139044;
        Wed, 25 Nov 2026 15:08:59 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d02ba46sm9395193a12.21.2026.11.25.15.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 15:08:57 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 78DBD420A76D; Thu, 26 Nov 2026 06:08:54 +0700 (WIB)
Date: Thu, 26 Nov 2026 06:08:54 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Willy Tarreau <w@1wt.eu>, Jonathan Corbet <corbet@lwn.net>
Cc: skhan@linuxfoundation.org, Randy Dunlap <rdunlap@infradead.org>,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	gregkh@linuxfoundation.org, Johan Hovold <johan@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>
Subject: Re: [PATCH v2 05/14] docs: security-bugs: explain how to send a fix
 that can be applied
Message-ID: <awdqgBF62SOKaU0Q@archie.me>
References: <20261114190014.17826-1-w@1wt.eu>
 <20261114190014.17826-6-w@1wt.eu>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/uqKRyynA7J8RM0T"
Content-Disposition: inline
In-Reply-To: <20261114190014.17826-6-w@1wt.eu>

--/uqKRyynA7J8RM0T
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 08:00:05PM +0100, Willy Tarreau wrote:
> +Most fixes sent along with reports cannot be applied as-is because they =
were
> +damaged by the mailer or lacking a commit message, forcing maintainers t=
o ask
> +for a resend. A fix must be applicable using ``git am``, which is most e=
asily
> +achieved by letting git produce and send the messages (see
> +Documentation/process/submitting-patches.rst).
> +
> +When the fix is meant to only be sent privately, the preferred method is=
 to
> +send the report as a cover letter of a series, followed by the fix::

Documentation/process/submitting-patches.rst guidelines also applies to
privately-sent fixes, no?

> +
> +  $ git format-patch --cover-letter -1
> +  (edit 0000-cover-letter.patch and replace the subject and text with the
> +   report's subject and text)
replace the subject and message body placeholder as appropriate for the rep=
ort

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--/uqKRyynA7J8RM0T
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCawdqgAAKCRD2uYlJVVFO
o8cvAP0UI4UPI69NykSfDcgis1xBWe2etCvfNQGcwSBb/jIkFAEAk4tq4aFkzzMk
UKJQhOV/RP0fTwz7if/m457ISve37wU=
=72sa
-----END PGP SIGNATURE-----

--/uqKRyynA7J8RM0T--
