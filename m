Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF302EBBAA
	for <linux-doc@vger.kernel.org>; Thu, 20 Nov 2025 09:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763631007; cv=none; b=T3f9XPPgDFDTE86VC0e80QNafGWvwH37K9LT/oxWXZdqkvLtjFEW1ouF4wV9J6h88hRW/sGMvp7oDgoQLvXVVAzZR+/y5sfIaCsUmr6JuIuYs28c/MN0wJTSEzIA9cltcKwVgpGoT9sktLmn0ZDg8T5DqzBPCo1yBj+MJ7o1n50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763631007; c=relaxed/simple;
	bh=yQl6Am+yjM+jiH0K2AKGK6fLV8tbHJIiZjM0lPoL1lE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mLcpNz3rwPGoJ2YARI8ZYP4So3OTojNwYWdBGf0R1BjYVm4JFhRiQ+UnnQzvIusUz12lg8vUqxoWSXsTthqAe7GjFRETEMI7/xMry5p+7flRXk0cBIgo7+Gr+RYwwqpCMD2ljj/812cjFKcX3z+JPXG9Bg6kZQDVj37FTYAQBd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LkJdHGqH; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LkJdHGqH"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7bab7c997eeso767951b3a.0
        for <linux-doc@vger.kernel.org>; Thu, 20 Nov 2025 01:30:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763631004; x=1764235804; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y0ahZnkbKTq/zXCngVOV5tNUB9eHwQteBjkic4SlaNw=;
        b=LkJdHGqHa6ld60aK0jwh3vfQDfBL7YvT20Lef9wLzgef2/0kVrbgnn0E9X2FzUySE/
         mCwQS99km2qsErzS+qX/l6SX1c2zSFbZWrm+aSavnNybRJzkblgyHyUG8E8Ang1OlLhq
         m3jV9LGxzoXpUdtfAWBsgli08pmT+m11KghmtlsZHNXW5WTKKqeaMSR4F93OWwg1k0aN
         iJh8Csg8J5SGt0lgGJ8WUT5GJcLoL5RMRVV1Muya1mGZmpk+x7VDmWCDwC7Ucln8HgW7
         jkrL0IFtJ6uUOsPKUJ22D0h0zzGGVr79PwX66it6nkquXq1hZmI9Q7RzaJU38FZ5i1SG
         9aRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763631004; x=1764235804;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y0ahZnkbKTq/zXCngVOV5tNUB9eHwQteBjkic4SlaNw=;
        b=YHcw3nF3N8nM9BsCPnwNfVfM5PcCxe741Cn2Eg0vdW+ZRe6Srd4sv7eXFFAaLbb5Gs
         L3ugQnBfzQyh6K39I1d1sPRZGCrsKrdgTbTmS+XVU4KZYjEDI8JOwA3jdHumapHzrV0i
         W0UlppN9lWGFFCUX1K9CzEkPtcO8HwQ0kd3qDbKgC11xsBnQzfSQ+a33Dj9C1sIcsJze
         GVwHPh5n0pbrwPfMsBIeEA4NWKpBpyxaRRzHApmCX71mpvyT7RSwGi+dyp2DsMnkEUkw
         eOtzF4SnjCnBKjoAjOCnXvf3W91V39zTYOzXLgsNIE6pHgYTFuh3e9Wp9xajhPBbRdbV
         lzWA==
X-Forwarded-Encrypted: i=1; AJvYcCUfMvY2ndtCB5VyFEIh9GccticsHCbsVB6Um3L4jT97pK2+uwnlLaiMX/Be/DYNUX0InEDii3aZbu4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqIhF0pIsSaEsmh8nx0oSle6ayJAO6FsjSw5tJBeYULAJYw71W
	5xgupixG5JTUsjb+jzYt/IBTtmSU2CPMu4wKM/9xBKmf1JM7+00lLSBueLHpvAqaa6I=
X-Gm-Gg: ASbGncsKl6ylJ4CvkcbBxAS3c5voRlZFdh27GzTYYBT+uThgEDmzzyS9Y5kCqw84kLG
	xnsqueooNDaq9ZOAmDmBuuJ438mwhN7vz6kT4Pr+iQbOxA/DhZ2TlDJpae8hSqKHdURTFxkDLhF
	Zv6NC7K1IREb45nRDA/N/2W/aaDUzMGAJhV2qVF/vCn4Hg3uwyNqJuIhnsxmal+GjxAjgkwuByb
	cUO+qxnPQvy0LLdFzWPKoxBdadIYtOwHbv5Ziysit1R56sq9GqcujEZ9ikJnlATbfCk24ishC1K
	P7rXB70WgNIoLLdwpSuPYz+427lczfmrzXHeUFmYEd3y45cVK/wAzT2divcnDewwJkujDIiSu8o
	5vpL4zRzCy9fp8V59xU+RBAcfkryPbO2PvLk4CkokZLsdeI1wOcDCRFglxwuCVifh32KyEE/s/9
	hETLGsNQ4Qf+KdHSUcJA58yg==
X-Google-Smtp-Source: AGHT+IFM1rG6BQ9QLPRgC9WRSoHnGffbzNzuoM89C5S7NauJeRqdu2h4JvYetmK1mXobCaM3XLB4rA==
X-Received: by 2002:a05:6a00:10ce:b0:7ab:8d8a:1024 with SMTP id d2e1a72fcca58-7c3ee197dfemr2897250b3a.7.1763631004085;
        Thu, 20 Nov 2025 01:30:04 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3ed379558sm2106554b3a.25.2025.11.20.01.30.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 01:30:03 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 5E84A41117C8; Thu, 20 Nov 2025 16:30:01 +0700 (WIB)
Date: Thu, 20 Nov 2025 16:30:01 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Jim Cromie <jim.cromie@gmail.com>, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, gregkh@linuxfoundation.org,
	jbaron@akamai.com
Cc: ukaszb@chromium.org, louis.chauvet@bootlin.com,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 04/31] docs/dyndbg: explain flags parse 1st
Message-ID: <aR7fmRgNmP60RJZz@archie.me>
References: <20251118201842.1447666-1-jim.cromie@gmail.com>
 <20251118201842.1447666-5-jim.cromie@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tNRZFCgC3+laadDu"
Content-Disposition: inline
In-Reply-To: <20251118201842.1447666-5-jim.cromie@gmail.com>


--tNRZFCgC3+laadDu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 18, 2025 at 01:18:14PM -0700, Jim Cromie wrote:
> -
> -A match specification is a keyword, which selects the attribute of
> -the callsite to be compared, and a value to compare against.  Possible
> +Note: because the match-spec can be empty, the flags are checked 1st,
> +then the pairs of keyword values.  Flag errs will hide keyword errs:
> +
> +  bash-5.2# ddcmd mod bar +foo
> +  dyndbg: read 13 bytes from userspace
> +  dyndbg: query 0: "mod bar +foo" mod:*
> +  dyndbg: unknown flag 'o'
> +  dyndbg: flags parse failed
> +  dyndbg: processed 1 queries, with 0 matches, 1 errs

The snippet above is shown as long-running paragraph instead, so I wrap it
in literal code block:

---- >8 ----
diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentat=
ion/admin-guide/dynamic-debug-howto.rst
index fd3dbae00cfc60..7690287cbe0c79 100644
--- a/Documentation/admin-guide/dynamic-debug-howto.rst
+++ b/Documentation/admin-guide/dynamic-debug-howto.rst
@@ -112,8 +112,8 @@ The match-spec's select *prdbgs* from the catalog, upon=
 which to apply
 the flags-spec, all constraints are ANDed together.  An absent keyword
 is the same as keyword "*".
=20
-Note: because the match-spec can be empty, the flags are checked 1st,
-then the pairs of keyword values.  Flag errs will hide keyword errs:
+Note that since the match-spec can be empty, the flags are checked first,
+then the pairs of keyword values.  Flag errs will hide keyword errs::
=20
   bash-5.2# ddcmd mod bar +foo
   dyndbg: read 13 bytes from userspace
@@ -122,9 +122,9 @@ then the pairs of keyword values.  Flag errs will hide =
keyword errs:
   dyndbg: flags parse failed
   dyndbg: processed 1 queries, with 0 matches, 1 errs
=20
-So a match-spec is a keyword, which selects the attribute of the
+Hence, a match-spec is a keyword, which selects the attribute of the
 callsite to be compared, and a value to compare against.  Possible
-keywords are:::
+keywords are::
=20
   match-spec ::=3D 'func' string |
 		 'file' string |

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--tNRZFCgC3+laadDu
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaR7flQAKCRD2uYlJVVFO
ozygAQDeqV2+eAL925SBI3I8R+CQGvz0yTuUJJ9a6KUiNhCDDgEAsMy6wTgxalgk
ymAwck6TVuSNIyI5PoEJGZv83FrVLgs=
=wp6p
-----END PGP SIGNATURE-----

--tNRZFCgC3+laadDu--
