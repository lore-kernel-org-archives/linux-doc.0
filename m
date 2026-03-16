Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA39347532
	for <linux-doc@vger.kernel.org>; Mon, 16 Mar 2026 06:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773643141; cv=none; b=hhTlldoIK2ylqZbJb2fEY/CKAfPcjCT+xrmrcB5mzPQ9KDqpC73SeR5wqFxsRs3oF+xesZu20vzCZn2ynF3KRFj92MVy/HZjYzjwkTbebxP+7mxRVmyGi/4rCrIx6cmKPt4jdckN1e+bpDeHZ6W2BUZG6XMPHjfC2GksuS/B6IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773643141; c=relaxed/simple;
	bh=i52TkJLF+/gqgwMa4dA8pwBRoRKDZSDVOXYB570DO/0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qKMM98gdZ//e+Ii6I6Sv2dSJjiKiGKwRWi2aCQQzwynBtyONopTiHWBDeAWICFVn94rAmarztT1BQANsc/vrIIzb2aEihr3K4WBVK9alLSfx/2SC93MZbbpfQY66BnViKNFo7y2P5zpABWcYyy+nJkjblY5MGQQBztF8JDlxgzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ddsid2jR; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ddsid2jR"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-35ba2ae4df3so271674a91.2
        for <linux-doc@vger.kernel.org>; Sun, 15 Mar 2026 23:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773643140; x=1774247940; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=i52TkJLF+/gqgwMa4dA8pwBRoRKDZSDVOXYB570DO/0=;
        b=ddsid2jRunlm3QWsYIRJxhqSqCIG06b7JpuF/vd0ma4RwwxgCyDlSvIUmGE6TSh5st
         BsFzCpRncBECnflV1/kPwYYIOUluITACdtZPmPACcOW/GUx/1mZjyr/LnC8p1kjQD/Gk
         twhdQZ7YfHMQC05sp5uzj+wutlFOzYm5FLZmPLu4SxAnTkwrZPce1u+AIPom3tbMswY6
         6jAxU76aykPEtfZ/ywB0GanGdGiq+NF9S9QQWKT9FFGs4B0NDMuOBaJ0LGBSz7qdJ5dW
         m5X0m1SNS20tyXDsW7gDgoGub9AwQCOgRk+ZXGpCyGGsEQC+1lHvonElNHSJ3UrmShYZ
         IvBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773643140; x=1774247940;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i52TkJLF+/gqgwMa4dA8pwBRoRKDZSDVOXYB570DO/0=;
        b=XTm430la4vBFGDQu7f8zRQAAw6BLee3sQIoB2ak/1kJESW7EoTY/7ehohTR0eQ0WNa
         p193S4gbyZzCu0Ch38hkTbGC2eGg3gjlsdOX9ZGeplN1hm7dqHM0nWsm7sQOwEXROc1y
         /fgLjjoLQv75j8LYiZ/MU8FJOJuPUleFOZSYQhSZc/IkbZqSZnbl9n9yg/MeUBpqiget
         xHxPJRsiykYRs+HlmwoDK7JeJj6Ql4Lyq/+zERGKS0fBHyRmar7ye6T8bkCGOA8+3IPQ
         WhK0knyfz0oxF204T0kj9Z9wjHT5Re0HG2kIEmEdCmcB4cqZNp1CTWyFigu16Nw3qUb5
         FRKw==
X-Forwarded-Encrypted: i=1; AJvYcCVLGGtdMcQEwAc2LVTvF7AXyA/+pW1aQ0f4NiWUeZ4uFQBCZKqN3Orf8SKjFDddi60HAbu94E5q3qw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5OthYHd/gQzGWddId0b2LnPWXvoFMaxgh/AAi8XzqLEh4Jhxg
	2FtLe7EdhpoMVV0eXD4jYn4ZHqyvp5qPb34NEqMr+OfdbBTaTTzgESI3XgdynEbr
X-Gm-Gg: ATEYQzxUyTNESwdcA6CtTxjXf1iRA7PkuolkOKzXKbtPM5xBOpHp8IWldJiH7HJ7n3h
	uv7mxzvgV7GNum2HCfJ8b/g8QQIwsh3lY8Uz3pp/XSJ/0UisprIe/hGfDMPbFVDV+FV429E8j9f
	ToK9/r9eBPl52YuHlRwpJf4Aiqzg2r5H742IXHEA6bSiyjl8XG8uTXVez6VoHHfoj7PdoBDyEAD
	IQMTCUpOhRx6vC5IslmvIf59ixV/3/0Ky3NtBCOSq9x8aHZtKD0ryxVoqk6TXoc51C1fOo1sdPr
	IAVbqUVGN5YF8ricDfC65e61hjdT0aK/dqB5QXRjW7eBrU/O/qMVOaC7MNJR+JOFGnljY73z6On
	J9hTL4yVtyn2Sr6iktgPC57tEMekzory7pqI9FsD1te+N05IyiPoctTwULjt449LSpU5cihIplP
	olYfXmcG8qINs+8qar9CQ=
X-Received: by 2002:a17:903:19d0:b0:2ae:c358:bb7c with SMTP id d9443c01a7336-2aecab1f8ccmr139465805ad.35.1773643139772;
        Sun, 15 Mar 2026 23:38:59 -0700 (PDT)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b05db37a8esm11809845ad.29.2026.03.15.23.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 23:38:58 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id BD70A420A800; Mon, 16 Mar 2026 13:38:54 +0700 (WIB)
Date: Mon, 16 Mar 2026 13:38:54 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <ljs@kernel.org>, linux-mm@kvack.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH] Docs: mmap_prepare: don't italicize structs
Message-ID: <abelfnu4kfapNEoG@archie.me>
References: <20260315224506.1973566-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kw+YVwJ/rSL03oH2"
Content-Disposition: inline
In-Reply-To: <20260315224506.1973566-1-rdunlap@infradead.org>


--kw+YVwJ/rSL03oH2
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 15, 2026 at 03:45:06PM -0700, Randy Dunlap wrote:
> Using a single quote mark `struct xyz` causes the html output to be
> produced as italic. Omit the quote marks so that kernel-doc's automarkup
> can make the "struct xyz" bold monospace ("code" style") in the
> generated html.

Acked-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--kw+YVwJ/rSL03oH2
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCabeldwAKCRD2uYlJVVFO
o17JAQDjHSzFfwNatbI8KWsASlWo4rDgcmRiR8d3LDhZWa5bOwEAlJTuBxoFWI+m
4EYUBh3zA9OKXNp54eOkbQ4REzpK+gA=
=JW2B
-----END PGP SIGNATURE-----

--kw+YVwJ/rSL03oH2--
