Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC071A3178
	for <linux-doc@vger.kernel.org>; Wed,  8 Oct 2025 00:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759882222; cv=none; b=upYak7X/k9WWN8nbJVb1O6amKeXI8wkr2IBbwQUJ5eQt3fwqLgJ76urTPl1lvqP9JhZJIpIwBGZ2/L+GtwTe8Q0BAzwXR8dXoXUY0xo4+wIsjiNRTQ8y41Uq9hGAPxUMhPXp66UMFvjwgCdEVGHejZ+M23biYkAcrMAqvrv1BEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759882222; c=relaxed/simple;
	bh=drQLTEcf0s9aDQXkyASHEbZdCPNdt5PbIV0XIqvxYGw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jds4BKS1AflpH8FTHQJbrQBzZFZLpV/OpKDIAodkQS5kR9aGORz0ZcqEX1iFItarg8YKAk0yzclS9umYrT/KvXJA4ykbEzuHV5PBtQ57uZjp10SyhtufMH8pUMSe6P1MmX5PvBxK6Q+DqGJ1WPm/WD0kLr1QW93D4CTJ9WRca1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dQePr3PH; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dQePr3PH"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-269af38418aso82438055ad.1
        for <linux-doc@vger.kernel.org>; Tue, 07 Oct 2025 17:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759882220; x=1760487020; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=drQLTEcf0s9aDQXkyASHEbZdCPNdt5PbIV0XIqvxYGw=;
        b=dQePr3PH9dxlxO+TCuwqGtwrGTndkebpOdifkUngwvjgw4Gq2Yr5vPJ7M5S6ITkOgV
         AXAZ/THC0sU65WsXx95TpzTXl+8Ma+U06Jz4aUWto+pOso+nTcOOpZsh7ItWiNl08L+w
         g/c7okkaLRcsuzqwWO5EArWriyigXNLpWuzoWqBKgaq1NkZQFfm50+rQfTn3W1q8O1Tz
         /YN4oLVuzy3CjFaM670gqnlb6O6+nhUQcaSuq3KxRS0NHkLO9g+EFFQmpkBtvAM7d23U
         DAgN50mzQYXyQawtfZO+0FksxXH3wrKiIVp6WL8FRwQmVhdugwIBBWIUZ8R1NIiAc0LW
         Fksg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759882220; x=1760487020;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=drQLTEcf0s9aDQXkyASHEbZdCPNdt5PbIV0XIqvxYGw=;
        b=rs39pHAtPAS3oQCBfoPytS/DDmTdP8Ui4keXAZNuEaissvFPmMGqQCy1bRSAdoVYQM
         wC1WUdr+EGzcCeYnk5Z62mifM5SM6iEMOtFEZOpaUMhiNZnT4AX+NUD3grNRQp3HV2P1
         h6a71Ewhg6LCWk4v2ummgLeLoL8bN4FKzy1arPgCc0a0IMwD00d7W+8MP2WeIcvJaWlY
         6IsDp28fe35OHvxOwpfoiJl4oEmf13jhSPan7q7UChqQzYG2yymiaBaqXMv5P1RvA2ly
         uMoxYb99M4o/5L5ixoZ+OvCqmUujmtlSkn9XfH5rDtEQwN/VkW0X1VI0cyNowpHwqwh9
         lUHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVa/R9BJUsBP0eqSszRT7gz3IOzfxWif4B7OK/BVSQj7Q59TTWwjMd7hEqqGvE7Cx6/bnAc+Dp82KQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEDc6dEzOp4GXnVdnKqv9qizU/22/RTNC5IcyjKPg4BunzfC/f
	hvUfiexyGh2ltMj1O7iY9UzVkSJnLRrEWcF2fuN81QB5zKabjrfkCdvfEjLQC/fk
X-Gm-Gg: ASbGncvp+0bD3CulbJXAppppAGfed0lbD0Ef6N2rQA1e9giK9H+w5GIIvfs0jt8XCtY
	2+3sq5YfaFKrCJyZVrO3LRhU9gZFyoh6b4i5coVrhLrJ8PPPhoIv2fVG/k/rRRF3AAY6YpTETQ/
	KuICBPSNZUVMSIshJaJCqklIqHaRBA9cJFSyIy5yXWUawBr31yhLted0fp65qYuVh44PjuWEtyK
	QosTVo1Wjcli1Rl1E5QOpBFSj+HCLVViUDJ1npDNnrXqD1WdQvzf7vYRlPglBhlzeOMrBRpzXwD
	1NBlbhO1+u0gdbFuLnUAjhhNpiApkdWGt2yfT30XfWlALjVVVevyRPIAC7Cuc1OzlvMr9cO1VDv
	XR34nxdLHkEJ582D9Jp6AlV8NuJzm9C08tku/rycd+TnEKNS7tQ==
X-Google-Smtp-Source: AGHT+IESzqjvqNWRLBhUSfgdQA0DbNktIOO7T7mo7zBI5D4i2rQuwbdLk49P2ILdFhIuxAbr8RriAg==
X-Received: by 2002:a17:902:ef4e:b0:28d:190a:1913 with SMTP id d9443c01a7336-290273edfcemr19418575ad.38.1759882219780;
        Tue, 07 Oct 2025 17:10:19 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e9cbff2a9sm147087985ad.32.2025.10.07.17.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 17:10:18 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id E747D4233430; Wed, 08 Oct 2025 07:10:16 +0700 (WIB)
Date: Wed, 8 Oct 2025 07:10:16 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Gopi Krishna Menon <krishnagopi487@gmail.com>, rostedt@goodmis.org,
	corbet@lwn.net
Cc: linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com, khalid@kernel.org,
	linux-kernel-mentees@lists.linux.dev, crwood@redhat.com,
	tglozar@redhat.com, costa.shul@redhat.com, jkacur@redhat.com
Subject: Re: [PATCH 6/8] Documentation/rtla: rename
 common_timerlat_options.rst
Message-ID: <aOWr6Ga_UzUsPfoi@archie.me>
References: <aOUMyGvkibvOV0IS@archie.me>
 <20251007185508.40908-1-krishnagopi487@gmail.com>
 <20251007185508.40908-7-krishnagopi487@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LlIS5/VYPbtMmilJ"
Content-Disposition: inline
In-Reply-To: <20251007185508.40908-7-krishnagopi487@gmail.com>


--LlIS5/VYPbtMmilJ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 08, 2025 at 12:24:55AM +0530, Gopi Krishna Menon wrote:
> common_timerlat_options.rst is intended to be included by other rtla
> documents and is not meant to be built as a standalone document.
>=20
> Rename common_timerlat_options.rst to common_timerlat_options.txt to
> maintain consistency with other common_*.txt files and prevent Sphinx
> from building it as a standalone document. Update all include references
> accordingly.
>=20

LGTM, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--LlIS5/VYPbtMmilJ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaOWr6AAKCRD2uYlJVVFO
oxP5AP98xFQWDMEDF9qmYQ0B2Wtvoh8Q9kx1bnbfFDCX6IqjJQEAk+h5fDL4OXEc
i5PQIL+OKPTBIi+wbjKY+z5qbTgraAA=
=XW3K
-----END PGP SIGNATURE-----

--LlIS5/VYPbtMmilJ--
