Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED69239E63
	for <linux-doc@vger.kernel.org>; Wed, 15 Oct 2025 23:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760572608; cv=none; b=tl/cGqKI2z0HoQpFQD6KNFHiY+L11OAw1mzfySSZaujlhIzqLPeWyCjWC56ECFYsJ9Q8QqFDohl6Pe9upvsodrGJZm4YRZVlrKj1Hbmuw7wo0RDWyPrkUWwS5GH65hYAT0lULrlWIM3wVRBc1b+Rha5ZQRwRlXTvZaSOE2AKNts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760572608; c=relaxed/simple;
	bh=VrdjKA95pfJlziaCm9nOUEwTPMyNUSWxkOAgrsJdVf0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F2uMzdSltgGSL8RS+3zVca6LWTb64ts3SCfrLIPPif/G6tYDJCAVICuQkEXj2uJ8jaTYe53JcKhjH3kyXVYFt63w2ezgtHdl5HzQr9FtsBvPlYiKeAD1FkCx4ZXV/6F6VsYB+A4HoFW35k2tficax1A4OsI9QzbC/HPmLHpq8zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EmNo3KLc; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EmNo3KLc"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b550eff972eso46778a12.3
        for <linux-doc@vger.kernel.org>; Wed, 15 Oct 2025 16:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760572606; x=1761177406; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VrdjKA95pfJlziaCm9nOUEwTPMyNUSWxkOAgrsJdVf0=;
        b=EmNo3KLchX5BOKY+Gug74htQ8237XXTPl3MyGg0kEITSNrVU8h1+FLzUn28cRCsDPA
         llyHcg+S7CNE7CkiQHold5YA/XgVMZmYq1sIB+nIcBrEtFlnTI5bLbFPQa4a7yTOiZno
         9eAQLi/pTtJRsshVJ262jo7eCXIWorVjq6ADgz0EejBNAko1bw8mztDFN2kvdmFal2Ub
         8fgIYZGor3QsKXjOsrbL5/Hllp/ttwSCO+pv2ImM+sGSRI24e0GouTxd/VEqZiQf9DUh
         Ie6DG8CZ+cehNFLnIRPmYVMVOV4NsS8Vg35M4BxtOSq6eyxvMf37h5ilaE11pSOpO+xM
         bF9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760572606; x=1761177406;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VrdjKA95pfJlziaCm9nOUEwTPMyNUSWxkOAgrsJdVf0=;
        b=iLcjYUc9P+14zDQMFAA0AMdbEmuMKeSiqPKmQx43pz4fH+QiF3sNrm3V1Ik3LKJvnt
         /myjTieWK9j5SUU1rHUmLNN2UqTi91K83I1P1onA4a95kDh+9e6em+sIhgrIntuvUL6U
         EMdFepmJwx9nVf0wmNkwJcGfrQrRVfIjxwaQ5n0uZtCLIXHsu8PrtUCsEKH1yK4waf8T
         1FChX/q7H0SPWADU4Iic3I3wC7O1Jv2wS1WO7liwqh9UMbPVtCkgS9Mv36SN2BV71Oyj
         CHfxePpE4UZwWp7PnVpHWy1Yvx8LyJFYXnmM4ZxIDKAt/7BU4ynfTb9tx9lIyde2K48M
         rg3A==
X-Forwarded-Encrypted: i=1; AJvYcCXSpNJ7ySpSAHQaX4x/SreEn1Yyhy7xpybWYqSyv5LceR5fOL2qf3p4sSAHLnJlDO94s0NVg+71wm0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVp5m1N4t5jijq6TBwr3q/6PA7hhSoS354IZk20gT68O3+r3Il
	3Th2J2blYXD4uIFrIalKs2eTliaPnhxneJy6UsXiMP58cbq1fLQiHnrz
X-Gm-Gg: ASbGncvM2s0T/bUZNodH13qqjjYhjRzLUgLEfTRpOQor0TgxxYnGmoNk8kunBZTHzvA
	Ikk9NTbqkhYRtED6lAuLPoMk7nHea4I09JtXJCYxi+20MLpxTMYTvJF9314iTlrHvdvzXGE0MlT
	Gz9JiPO+FaJ0a/bdnjugbRFJmOhxhlzHg9Y+4bF7aLp+Vvl+8keNUDlq/5K5fZonSRlqv36AwdJ
	uiYDJztuyZQwkp7Q3BDOCJqp0fTJETkUCN3OsH2so1fDLPJfAp6p9HsFRZ/noEju8qYbYmQsO0G
	5cQKoFyj9Csqc+5oPF+2tt+cKl5RItpZ7qMrt9k7Tt0xM+J6Ct3lOpyDspx3T5pJwWebTMAzStY
	x0N7XqJqAYrYJQ2upvszrskQym6eEC/91nRx51y289wuuixWeYLmsRC2LiYQkwDZwPoaQEheHV0
	5EAQN1aikyGF5jyX16aX/1ZbOg
X-Google-Smtp-Source: AGHT+IGSJiLb5NMgZSUQODUANG+2COIewb92cwb9YvRlW3gs67WecUf+O5HmxRj2ud/Z7M+Voe3WDQ==
X-Received: by 2002:a17:902:cf41:b0:267:776b:a315 with SMTP id d9443c01a7336-290272c2019mr363652655ad.32.1760572605763;
        Wed, 15 Oct 2025 16:56:45 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b97878b03sm3872453a91.16.2025.10.15.16.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 16:56:44 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 27E53419B28D; Thu, 16 Oct 2025 06:56:42 +0700 (WIB)
Date: Thu, 16 Oct 2025 06:56:41 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Simon Horman <horms@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux Networking <netdev@vger.kernel.org>,
	Sridhar Samudrala <sridhar.samudrala@intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Vasudev Kamath <vasudev@copyninja.info>,
	Krishna Kumar <krikku@gmail.com>
Subject: Re: [PATCH net] Documentation: net: net_failover: Separate
 cloud-ifupdown-helper and reattach-vf.sh code blocks marker
Message-ID: <aPA0ucheaqqhuUqb@archie.me>
References: <20251015094502.35854-2-bagasdotme@gmail.com>
 <aO_OPBukiAjmO43g@horms.kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pwZlaeVNL9Fp5cUU"
Content-Disposition: inline
In-Reply-To: <aO_OPBukiAjmO43g@horms.kernel.org>


--pwZlaeVNL9Fp5cUU
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 15, 2025 at 05:39:24PM +0100, Simon Horman wrote:
> Hi Bagas,
>=20
> For the above maybe this is more succinct and intuitive:
>=20
> Debian cloud images::
>=20
> ...

Thanks for the suggestion! I will include it in v2.

--=20
An old man doll... just what I always wanted! - Clara

--pwZlaeVNL9Fp5cUU
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaPA0tQAKCRD2uYlJVVFO
o4oFAQDBERR//Sh1k48W7RWGnLb3IrKcEpaa2Ru8q8OMSFVD/wEAzCIBRrvx10Ap
XZKRtUoSLGf+YfhBQfKerigKla/hpg0=
=GtTb
-----END PGP SIGNATURE-----

--pwZlaeVNL9Fp5cUU--
