Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06F9182B4
	for <linux-doc@vger.kernel.org>; Tue, 23 Sep 2025 11:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758625233; cv=none; b=pYjVQ4nduw10HQmI/fyIBSf/EfVOgA6ZqbP0+CNa/8slAK9OhXYeCgOai+2CxGaS92x1F+S6IgiVH0uat1GCstxIx4Fvif0xHT2+9G1y0tMLqm1McExUmftNVpUcj74p0nNeq98Bayqsg1r+pLGNVEbE7c5V1GAZDRyBQmSXggQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758625233; c=relaxed/simple;
	bh=GDxglpOBD85/zqKPgGqA6irkma4YXu4IN/8mmFFANvg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TL2nPhX6R+wUAnQrcMAKvqRL7sAfpvyv9TH7fE4vu3F7qlD/wyHuLuqp/iRyWRdYveEqndxu4avmkc1WN+cLW9r1B9r9yV9Gzws46t63A64mkjZHTS46F2fWVUXCfc1Hte+16ziT/1XREp7NISy6zNS+bWopEanwtUIH+PnnQ1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X+vPf33K; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X+vPf33K"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-77f3405c38aso1887427b3a.0
        for <linux-doc@vger.kernel.org>; Tue, 23 Sep 2025 04:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758625231; x=1759230031; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GDxglpOBD85/zqKPgGqA6irkma4YXu4IN/8mmFFANvg=;
        b=X+vPf33KtB+y4+tNWeaQMADe25GI+kgZeaGFCzdQXS4j57y69CwQYw9LkEMXwvnUQS
         f0ZyzcI8tG1azi7DPOkmQNwDUwkitNC5Ek2hW+wMFAIJkOGq68qzIGmNA0UzuhgoFv2Y
         URO1+fczPAVGoKpJZMvi8UVaGGkjXOHL8SLXAz5+PU/DXhb/XOt+R3XYzGpXbOaQJhDM
         cadgEcddRNKy41tsYdyHqFLLcOZRK/KGgpiTIVLxecwAI5t8IzVHj++Tnb96ZVm97qvY
         hlsWbzRKj/otUvbLOoBfd0gkEF92uG9GUJ2oo2PUyCZ81NVUL6gVda5YBIS60T9k+vql
         38HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758625231; x=1759230031;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GDxglpOBD85/zqKPgGqA6irkma4YXu4IN/8mmFFANvg=;
        b=QispO7PlYwyczHvYcYGsCxp3SgcQqACoTMAgqWpL9EPPToUP/3U1/XQMqBG9YtuSYa
         ywXx0ncIk2GwmgnoB/GfKBVJpFPemhvk369ME/1MxP9PZjeaYHWqpqfZ9Glk/RJIbsOR
         vxZd19BIBbrexlEkTkpRW+pq2Rien9NZtAS2Oy3y0AEoyjph7MwyWYnFiNg/cpOt0XVy
         7bEkPX4eO9WNuLtyCd219mO6pJRYNt+dHrCKZQjSHOeO8+vh+ef4Xp0nwPfo4lexI/JU
         tK1DXgyhPQiNxCaI9Nm60dxN6+e1phBCKJuu/YfGZARVcWnb7c55kJaY8McXkfIgAbq7
         mZTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgZQj4NCdrIi8P6ujaqwi5UqjyJ26JwyELR0bG90V+C8MMT7RugqUEUHhinqEIbVN+8G+AxwCy7Mk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKh6/OBRMERITi2DJ43t5Rh7kKiryuXIecSUO+ZEMIKp9+gHZu
	Ek8SlhV1iCRRxI+vH/Qz3TjbbzVD674IKPwZ6wzbmmGDkS3o6SjeOStJ
X-Gm-Gg: ASbGncsMx3RXzsMhAjPiAl3gZTssaWeEeB6EF+OMTIEPS5oaAw0weayM5n/Ho7lsJHs
	GqYFzaYPy2NaO+iwyejF1MjnTyz3dG7nF8gLbAuXLA7JXSCPiALmsWjNmNAJKU/Z2f3w3LlWaQG
	VOd0sq2Gbx79/AJsD09fp27In0nuzhQbgR2cjNqca6oDlIYj1Vy8wc80pL7u76cg8MzQYa73sdM
	IAMBsuzUKaG0ERBANJjriUJIQcyJXfeiL7kK5IIrkzWbBWO/jvsrDwT9WK3BAhCMN2Hx/tFd1Ak
	JUlf0ik4/UddLCxYWop2pqqzIDlvzy/WqQ658HhOCxIediRLPoiupo+mEsltmHoeoTBIRACIlAg
	ERbcV0+fVgVZ7xx0ue3EfKA==
X-Google-Smtp-Source: AGHT+IGlJnxXcG91si6Lov+UeTJK18aFcEv9DMAsss+SwJDyYu9wS6PnyUUHCx/J0lIhGRH6XH3NEQ==
X-Received: by 2002:a05:6a00:2d06:b0:77f:2e62:1e3e with SMTP id d2e1a72fcca58-77f53a1373amr2631781b3a.18.1758625229911;
        Tue, 23 Sep 2025 04:00:29 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77f0fc4cfbcsm10816814b3a.61.2025.09.23.04.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 04:00:28 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id DD14641A2EDC; Tue, 23 Sep 2025 18:00:24 +0700 (WIB)
Date: Tue, 23 Sep 2025 18:00:24 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux GFS2 <gfs2@lists.linux.dev>,
	Andreas Gruenbacher <agruenba@redhat.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>,
	Bjorn Helgaas <bhelgaas@google.com>, Jan Kara <jack@suse.cz>,
	Christian Brauner <brauner@kernel.org>,
	Miklos Szeredi <mszeredi@redhat.com>,
	Jeff Layton <jlayton@kernel.org>,
	"Darrick J. Wong" <djwong@kernel.org>,
	James Morse <james.morse@arm.com>,
	Bernd Schubert <bschubert@ddn.com>,
	Chen Linxuan <chenlinxuan@uniontech.com>,
	Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH v4] Documentation: gfs2: Consolidate GFS2 docs into its
 own subdirectory
Message-ID: <aNJ9yJ7XT4Pnsl9E@archie.me>
References: <20250911004416.8663-2-bagasdotme@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zS+cmMosgl12Kn56"
Content-Disposition: inline
In-Reply-To: <20250911004416.8663-2-bagasdotme@gmail.com>


--zS+cmMosgl12Kn56
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 11, 2025 at 07:44:17AM +0700, Bagas Sanjaya wrote:
> Documentation for GFS2 is scattered in three docs that are in
> Documentation/filesystems/ directory. As these docs are standing out as
> a group, move them into separate gfs2/ subdirectory.

Hi Andreas,

It looks like this patch isn't in 6.18 PR [1]. Should I resend it after
merge window (and for 6.19 instead)?

Thanks.

[1]: https://lore.kernel.org/lkml/20250923090549.31521-1-agruenba@redhat.co=
m/

--=20
An old man doll... just what I always wanted! - Clara

--zS+cmMosgl12Kn56
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaNJ9xAAKCRD2uYlJVVFO
o3EtAP9KVxkoZ1irQ3++A8HUSRb7xWOkDTI/dXQuFagJgf77hwEAmv7lMeqvV4p6
v7FlBiDHPYQWC4/5lWxjwyZmlVwZgAo=
=Q3gu
-----END PGP SIGNATURE-----

--zS+cmMosgl12Kn56--
