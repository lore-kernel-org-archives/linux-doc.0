Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com [209.85.215.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DCBBEADC
	for <linux-doc@vger.kernel.org>; Tue, 20 Jan 2026 00:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768867470; cv=none; b=TaRq41G6AFS7j7GBl0IpCpmAk5/8yNiYqI43FVS4Xl/2VuwcE2ojOuQYxsioV/4iaPuN6eTO7+kOAUw/uNpmUb5fOJmltdPxTylChiQ9KIqvQsxFDCGtMtYM0FOugnKzP+a3H53oBQ2VVGEz9yIqRK7LFllSGoH2lUd4Gvbq0/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768867470; c=relaxed/simple;
	bh=cuKZQcuapQnBZVta8YkwFU3o1xEnR1bsXItHBrnjVWw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cev6iQ4kWZG71YC/w5aIKuwpXjBPk6hCz8RTq18/eg56Ui4PafUfqRbmOFBLicPIlwBD0Vc+sRxdwU/keorfJfarvzgm2FFn/EzotTiZ46vQ/uAehr0WrYozWUKQ0OnCRnudLbh8+wuFT4cu1QPHFi8+GYXjDjmVdRvpnc2eB2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SEg4VYDr; arc=none smtp.client-ip=209.85.215.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SEg4VYDr"
Received: by mail-pg1-f193.google.com with SMTP id 41be03b00d2f7-c2a9a9b43b1so3163945a12.2
        for <linux-doc@vger.kernel.org>; Mon, 19 Jan 2026 16:04:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768867468; x=1769472268; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+Wubt2tqx7SxUgLn+ubS/XLWpKCP8r4Dm/ia5St2vgU=;
        b=SEg4VYDrKSJMyCmnOgFvsvmX7r5FsaMfTkaTXsQhLVFPGANJFzPlb3zvAENOtSJ/JM
         zHqgi6sw+bHTRgjCynmW+ZffykQT8r+kBNvYY4wEaCZaD5w5aWYklnaVv/0XzZ09KWwF
         N1V9+AP9hU9QoXh/64pykGR2wP2+P+vgsIOKicfx7nNeLQ/yJXdsPNTaj9eMnBwtIAWL
         lPhX+wlpFgBnk9eJPRIpQEuGF1s37YoNk3UJGu2RidIBVJe1lCDDgoYBcot1Ty9dUmEr
         eWeFDBcgfxPaqCu6QtAWuDRALiUgaTx5PfoJRrPUW2wEfrD6POqDszQGi9QA7SHSBgao
         v5qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768867468; x=1769472268;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Wubt2tqx7SxUgLn+ubS/XLWpKCP8r4Dm/ia5St2vgU=;
        b=IYLxWsFcF7r1ONFGuM7qggNtjFprNb9WFldBfQBez64I8Xr4nXkeniiQxK6TL9BuNC
         Vx8JLuaERobTTfbRdvz9QNFCXlGbK49RBAit8fJ7ET3pC30XsbCGHmWailgF0ZjUdvm1
         w5awmRbWj0pWWdQh7ef6ff0SLIp1cLIGNbxxMiRdBa7c1JBQF8BKPh6LpLXxA8CdXRPy
         K1FmswB0CwNgGVexrITzTLeMxJ5M186SR4mVYdbTRICQXGgZ12wZ6hH3Bxmt/xMypEWe
         4Df/zARH3Db6an3tX5H0p6exJOK1xRxsJdjqnlZVfPFzpD1XsJu9k1hYPpEA0Blhw0l9
         vAoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVloIqiK+NZObKPvYlfbJW/yBYgZA8xmI3nQcTr2SsMjNSqt5WX2VUOwSTjEO5ESbosBJ+JhlFywdc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7GCqMolZMks3b6JPF6q75r1BKFDpzB582jexFjCGc58cnr7T1
	t3hHWyZM5uuWNmkjx+NB4163UCYriL9PQqYhGSUoCqc59Lre1Azb1XvM
X-Gm-Gg: AY/fxX5I7yDioqb+jmFUGN47hJIR350JT3KUPQkiwY5t6c66HOaq1uqiHUA9dlCwHd/
	RSKQ83w0U0V3Y8+drDhDDFbXBoWvwNaRHPYz8EPDBkX8BJrTS0spX5bbOyZvMyAZyq0GOlk7Okb
	+9Z/SjvnVWVPbhLHmqO4YFxIW/1jViHIRLjq6E4+rCOL08x5MBO7ktEWMKZpf/S6diGX35uRv9t
	hk6M4wLH9JFhRQZZew20LDdx3fMz2CH258sehseM6pTMm32Tv6ZBglY/1Q42zofPm02FdtOkgKf
	DmX4QVVgVcVw2GM29cNum3iTVcom6yg7AYKj4wpC1JdZHhQS/NmrEvtglYV+7ufsLiaOOLrBc3x
	cM6b6qtdg0j7xXE6yRua4LSBYEyUAfbBK6pIu67TskrivC096+Bz9KrsNt0Xi1q7FgkHWA3mIXx
	puaYPgEZ0=
X-Received: by 2002:a05:6a21:6b05:b0:384:f573:42bf with SMTP id adf61e73a8af0-38e00d9682fmr11086386637.53.1768867468314;
        Mon, 19 Jan 2026 16:04:28 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3527313c2a9sm10227886a91.17.2026.01.19.16.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 16:04:26 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id E9AC3422053E; Tue, 20 Jan 2026 07:04:23 +0700 (WIB)
Date: Tue, 20 Jan 2026 07:04:23 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Vishnu Sankar <vishnuocv@gmail.com>, dmitry.torokhov@gmail.com,
	hmh@hmh.eng.br, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
	corbet@lwn.net, derekjohn.clark@gmail.com
Cc: mpearson-lenovo@squebb.ca, linux-doc@vger.kernel.org,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net,
	platform-driver-x86@vger.kernel.org, vsankar@lenovo.com
Subject: Re: [PATCH v5 3/3] Documentation: thinkpad-acpi - Document
 doubletap_enable attribute
Message-ID: <aW7Gh6WsTjVo5IO_@archie.me>
References: <20251226235101.106451-1-vishnuocv@gmail.com>
 <20251226235101.106451-4-vishnuocv@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cXr86z952AoRnBdA"
Content-Disposition: inline
In-Reply-To: <20251226235101.106451-4-vishnuocv@gmail.com>


--cXr86z952AoRnBdA
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 27, 2025 at 08:51:01AM +0900, Vishnu Sankar wrote:
> +Values:
> +	* 1 - doubletap events are processed (default)
> +	* 0 - doubletap events are filtered out (ignored)

Please separate the bullet list from "Values:" paragraph.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--cXr86z952AoRnBdA
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaW7GgwAKCRD2uYlJVVFO
o5IaAP94b7MmrmseMySClfVwqN2J5VwmAmCppeUJ/3BURZkyIAD9FBUs2/yUHoyX
mdvAzlxMyN4BFBzd/S6jJXcMr4fBwww=
=2Yar
-----END PGP SIGNATURE-----

--cXr86z952AoRnBdA--
