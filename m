Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73AC6E56A
	for <linux-doc@vger.kernel.org>; Wed,  8 Oct 2025 00:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759882069; cv=none; b=ZnFBJLMrqM5ac/pJ6Div2VpHDocJZDUCvqLrlw5UfyHa/Hvh1zA3E04fkOKRtTsKVmUr42jLqgCD8SOvI0ONRRkHqvnHqrslC1pwPXJZDHGwif3xyqpfR80nYKGDmVguWmlWQd1tgDPVYeDXT0IA9IlA7keUK8lTr5aYQwqI2Lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759882069; c=relaxed/simple;
	bh=l4S5DxriXVBDip76PzIYOyJuhXHx4LTL9c53nJwdfoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dQZg69TTMXfGiGlwDTLVrktBk+Yz/rbZLMWPrW1L8HQZlFOkdE650WEg3++7wg50T8etePTLrPu6U4LDsBzSbAV8NHMvS+RIoBdmX5Dy/0KVe0SZHel7wVmjGBrVykCMYGUhO/5PNe5HQ6NJG12PVZBMZQctFXec4BjjwAQJg/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eOi0Bqlm; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eOi0Bqlm"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-26983b5411aso45571995ad.1
        for <linux-doc@vger.kernel.org>; Tue, 07 Oct 2025 17:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759882067; x=1760486867; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l4S5DxriXVBDip76PzIYOyJuhXHx4LTL9c53nJwdfoQ=;
        b=eOi0BqlmjnkjpLi/J9aJ/pQHE0cLgHvakbsgbEuQykHg3WX5c1DR9lR9GZqJWid9Sm
         MZhx1AAYqKDTwJyfUPnO1JjLsAX4biK3yHwglKCCgDhujg/eZiTN6MVBrcG9Hzp3LBYW
         9IkYUaarQbtwPaLjueK2MjE2i2qKyveVDNDxeZOMTKRkjbAV/Tqn4e/LU/PEPETgFBUj
         PVS3H9dhVhTd8pzlM9aiOYEBtMm0hesmjXzdslCeYhety78qWJUbubSyab9flXvVISju
         2Sa5FdquNXcVxUWQZb29afckAdkxCWHQ85r9dWs6Cfibm4TcKwOn9v6y1j+DRtbXfJyG
         JAkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759882067; x=1760486867;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l4S5DxriXVBDip76PzIYOyJuhXHx4LTL9c53nJwdfoQ=;
        b=KJYNgCdluHHGeaLrOsVPjTlhI3ZZgpfN5N6Nil3csuUXk5hYU+GsiscLQPJqiagNGV
         ZbtIWyYPe+zcjMYUcgou0fUtOgJJcDorV89EK5TSaVbn2wa8AWP4brKMVm/6QVYcjum6
         9Yvc85UwHmvZw/LcnPopb9aVbhFHBY1pzSCtp+7slJo1xpg0d3WWdgX3GxMW2jsmkHm5
         Rv7g6TuuL2XXD2Dxd6zBtzoB7l1OrCLjwq86WtQkRUo0e1GZEu7P2WDbbWKbW5wUyke/
         2PMGrXtgR7gL3m3OQyrPRiTt098Xlrf7iFxhoYXMLRZLrkgJzSGOMdLDVsDwpNohtM02
         B2iA==
X-Forwarded-Encrypted: i=1; AJvYcCXUXCdkFVyxAv9txRfP2YjhzgRsKIH7XTV0UoJ9uKY9wnKMc/aMWoIHazvT+xyxkgFO4apuO2jyfbE=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywprsi0KVRgczmnht84lP/SPbjndvaqeT98qlI1YiIaEGQS2vs1
	a0GIQ3zs2yDUGq3xBE/axdWi2gjLcWFycTZK5lDVbVz1McwRzXjpEsSE
X-Gm-Gg: ASbGncvPi0/FtBd24YEAPF6d0hpTRhOZhbHsq/KpMA3nLDby4YiC9r1qTWK+RKiGxOs
	YM7/HvJD5ctgrTKvuH6r8gf+nNBU3z4EZn6Vvw5IgIwJe5oMGOBUJgixh5xTh7vzxq0cwZqj/RW
	ncKwiUrL6xqXP9BpGnd0RUuHZZNJE+9YlwAUz78nnFEHE2E00ZS8nmaNXxUM1p5yrHoKWi+eOx+
	g7IsWM6lkzx/AmeY3fe7hGFxeK9sIWn6UULhfabPPYi/QKjainMZh7b8WZgj4/vCoNSYI3FVlzg
	7O/oa6diO7Cp80em02EW4TunX3dX0MVTsiFyU27DittPs1LN69U5W7yWpPWR/0W/ntLZaTmUAWE
	O5digQYDD0ZGaELmEGk0c1rKbIh3GIgaUq3duJJbTbQTzbj/wEw==
X-Google-Smtp-Source: AGHT+IFvLrrTtLYc/WdPj/MLYULIodTkELvA/9nEoTpJDQVKXDnFiVL5AgqY4kmgosIYn/DoCBNTOg==
X-Received: by 2002:a17:902:e550:b0:268:15f:8358 with SMTP id d9443c01a7336-29027402ca0mr18266115ad.42.1759882066181;
        Tue, 07 Oct 2025 17:07:46 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28ea1d99ab1sm140124385ad.9.2025.10.07.17.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 17:07:45 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 262AE4233430; Wed, 08 Oct 2025 07:07:43 +0700 (WIB)
Date: Wed, 8 Oct 2025 07:07:43 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Gopi Krishna Menon <krishnagopi487@gmail.com>, rostedt@goodmis.org,
	corbet@lwn.net
Cc: linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com, khalid@kernel.org,
	linux-kernel-mentees@lists.linux.dev, crwood@redhat.com,
	tglozar@redhat.com, costa.shul@redhat.com, jkacur@redhat.com
Subject: Re: [PATCH 3/8] Documentation/rtla: rename
 common_osnoise_description.rst
Message-ID: <aOWrT79N-Pavz-6z@archie.me>
References: <aOUMyGvkibvOV0IS@archie.me>
 <20251007185508.40908-1-krishnagopi487@gmail.com>
 <20251007185508.40908-4-krishnagopi487@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="v16T4K3LqUohqyO6"
Content-Disposition: inline
In-Reply-To: <20251007185508.40908-4-krishnagopi487@gmail.com>


--v16T4K3LqUohqyO6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 08, 2025 at 12:24:52AM +0530, Gopi Krishna Menon wrote:
> common_osnoise_description.rst is intended to be included by other rtla
> documents and is not meant to be built as a standalone document.
>=20
> Rename common_osnoise_description.rst to common_osnoise_description.txt
> to maintain consistency with other common_*.txt files and prevent Sphinx
> from building it as a standalone document. Update all include references
> accordingly.
>=20

LGTM, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--v16T4K3LqUohqyO6
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaOWrTgAKCRD2uYlJVVFO
ozVZAQC5CsLiy7sQl+rTtl5xrbElBxWgvxQ21/IMGdTbJfuv9QD/WSnjn7oWG8BK
g6i2dSDUeR5aG7vCmABdR1Qmzhp+ggY=
=skU1
-----END PGP SIGNATURE-----

--v16T4K3LqUohqyO6--
