Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C021964CC9
	for <linux-doc@vger.kernel.org>; Tue, 19 Mar 2024 02:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710813905; cv=none; b=fjF6qkdzUH/sVkMQ2I1CMZq/ClnDJnav+z4kJz/XPQg0mb3nUbxuaPjU3T45hjRnH7LE6db6LivsjiRgj3gOEOSw1r/yPx47e8MFKFrvGDy8/4Q5Vfq1zuwQIlcark4vmuc704+nBedoP4TTuk82CSKGTeFSnscOSiiGT2coTNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710813905; c=relaxed/simple;
	bh=/EjKEmmC073iwKqI8NAC1v36l29m9mvpTdkkx5mYXao=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Aiq8hWsnIxxeagY/W/9XWhvXj6nz664jGTMYb5nudxT0Tt/lIXsK6xXheaZRfnbJvflK9oEBftaUILAhwVLywVnKZtfCGm2NwRoBTThMK1UydeBhNdkp67CjfemlTYbd+SDaisNF78hBk/IWEoJGOAc0al27ZVa0a1Rk1N003/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XuXt62My; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XuXt62My"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-5dbd519bde6so3801177a12.1
        for <linux-doc@vger.kernel.org>; Mon, 18 Mar 2024 19:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710813903; x=1711418703; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/EjKEmmC073iwKqI8NAC1v36l29m9mvpTdkkx5mYXao=;
        b=XuXt62My2+6LVMlbTTu5ObF8KUjpE4+epTu2q3GHOCm8BJ3AJLaEOD0h5vLWzklKOL
         v5NBJwlk+X8Tymy1Drh+CmieIcnv7LifNtDcsbVwfpKci2BXyd1w1tvWzrnKSMxW2/1R
         93GKLTIPIPeuSZz94b1rN7GvUWLPjpi+Ctm6yata4H2zIRyWg/yDs3KbFrGLqtwaFKUI
         1vPRxP7KsLLT4Oz5VseYbqf288OcWrWK3YgqX3LumuWA9DjSAiNn7bIjyHNQBlCnCgV8
         dymzCcLEdMlA8ikisog3dteRMgMn95119MXoW8jUCEc+Zk5ZHr6mWgV1kLmb2BG5yk5r
         fDfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710813903; x=1711418703;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/EjKEmmC073iwKqI8NAC1v36l29m9mvpTdkkx5mYXao=;
        b=hnXO7qcAaqOfLRsHEjZSZhjpadJS3lI50Pddo2BhbglAOYQeo7BTNRmNn1mvSlhGZE
         IKKDz3wTEHSzE+983R/lppm1THPevrZ3eawA89AyP2wp9mpVjcVMDI6PePBDpxYwEVCk
         tbvmvCCPJ6BsS5KRe0A18/Ly+hNsQjLbUq1IHyUFbRUBXK7oNgOeDQZJuLZGTGzPvtny
         2u+rm3pLno9DlEHOkpZeNI3S6K82t4SH5kTli8TdbPdb8sOksqByGpteiv3jpp7bVbOK
         N3dYiOnfPNr0oe8B4CYljvLIqLilw6qJbRMZTXvRbVFEeptte6i2u4A3seiO8UuRsJYp
         PzLg==
X-Forwarded-Encrypted: i=1; AJvYcCVROqP42McKtNkxgdB0k+s+EdA3s8swLMogRDw7X3XkueSIVYlW0dJDPwRUWbzT1X7fXlFV+5c/n8fjEWClDIw07lcgYHE8Nf9G
X-Gm-Message-State: AOJu0YzxC7lh/KkiZZM0g6CI3DGloNPbbYgavVbVS75k2ERMtnIIZI0A
	hHhexa2YYxkb4OWtc7risNzAMYUNsi01bEmVBjbcTxe2BxxTOp+VxcrlyxAhBuw=
X-Google-Smtp-Source: AGHT+IEgbOwVrNUGScyShvUWIoqBlb0IIoiCPyatUnkYcdAZUkyQez/d/4boPEkWOTzFq6EDqrXLcA==
X-Received: by 2002:a17:902:e841:b0:1de:e9b5:bb54 with SMTP id t1-20020a170902e84100b001dee9b5bb54mr1759104plg.34.1710813902828;
        Mon, 18 Mar 2024 19:05:02 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id b12-20020a170902650c00b001dc96292774sm10209729plk.296.2024.03.18.19.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 19:05:02 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 3C57D1846B4A8; Tue, 19 Mar 2024 09:05:00 +0700 (WIB)
Date: Tue, 19 Mar 2024 09:05:00 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Weiji Wang <nebclllo0444@gmail.com>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] format shell command as code block
Message-ID: <ZfjyzP7ZDoAZU3cf@archie.me>
References: <20240318140129.21986-1-nebclllo0444@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sWAUkYMT2Btntb0t"
Content-Disposition: inline
In-Reply-To: <20240318140129.21986-1-nebclllo0444@gmail.com>


--sWAUkYMT2Btntb0t
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 18, 2024 at 10:01:25PM +0800, Weiji Wang wrote:
> This formats the last two shell commands in
> Documentation/admin-guide/mm/zswap.rst as code blocks.

Why?

Also missing Signed-off-by.

Confused...

--=20
An old man doll... just what I always wanted! - Clara

--sWAUkYMT2Btntb0t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZfjyywAKCRD2uYlJVVFO
ox94APkBWDONxYpGJzms0BVE/gPgJMpYl3fY1HYBlNme/HhjhQD/YNQV2MzAYHrR
NjqT2ia6BdnANvOkJJ/N0GReD0L/Awc=
=WdTL
-----END PGP SIGNATURE-----

--sWAUkYMT2Btntb0t--
