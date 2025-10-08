Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B522191
	for <linux-doc@vger.kernel.org>; Wed,  8 Oct 2025 00:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759882033; cv=none; b=ZxXyFxt/FLC2lSDU9S06bN8Cto/o/j7njZtgHBNgqj/jwYgEcOKMoXfCSoGWCS+awpxG+P4m7eof5ofVErOE1z4I5oHdff3ZcRki+Ej2KP6hWD6NwxCdP9PnlenCj6TJBeAr89yJcLNLCZlpPKuf/23RV/vnzRcrYv/9u/2bsOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759882033; c=relaxed/simple;
	bh=vC8ooiip9yJoKnRrYy59NMGAT5KdgSyvEGK3SSFeUbc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vGHXpr0zXahJgBDSboftsLTDUf+37uOQ2qBO1EFNK/OJbNB6rVO+QsIujgKS5hKucqXWkg0RY4PRkwLtxHc/+h1gIw7X9rgJfuM0wBKMm43PeYZgrzVV6E/Eanq2UFwcVZzHN2+bATOwUeYn1pT7uOseO3/LdMzTeVufx3KHeDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pq3YzqhF; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pq3YzqhF"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-791c287c10dso2284611b3a.1
        for <linux-doc@vger.kernel.org>; Tue, 07 Oct 2025 17:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759882031; x=1760486831; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vC8ooiip9yJoKnRrYy59NMGAT5KdgSyvEGK3SSFeUbc=;
        b=Pq3YzqhFrWQhgS8sBvscxPq4JRDaw9JfdcZRYivF9acsS1Q9pyXtRGgrRfcpJBahTv
         LL5TKM2sp5WfdL3XvY17I+jrWlsskBzdrO7PPXN4ceuwZ1dUd8ftlCY7UGNeiX0TREWV
         dSkLAuJspqpd2mO20l2nyhO/9ovPItTwNpj2K5H3/B+OcbFB6B98NBlBGWOFb5GFjWLl
         vXDPAUT/rR4srMKv2MKe22sfEXuQkgVWXF+GNuChdjxZgjc4Vx8TtJ+BKRVvndCxyz7M
         ubVSDLagaFX0gXAf3fXLgD0PLWfHgszehyRSdV5QBihebyzK+Xs371EXE9f2a3RBBK0g
         ahuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759882031; x=1760486831;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vC8ooiip9yJoKnRrYy59NMGAT5KdgSyvEGK3SSFeUbc=;
        b=iJcg+YpUIDE/RNQRNtyTjNGlMwfXLwMN6IXc+936LI9k5dZd0AVTiWIYpQHVtxZwrL
         2p9TqlUKOXQyut21PQBu+BiMEkSznb+rO85CfCAf1TykSTlb0cP1FtqWYWMv/bzv49nH
         J9aGNvRgghu+uGv0gaw1EtUfd1HIlboftmsD3tvB8YiFSbz6FXbdfOzb3v7NqIBvRrLE
         hZIGMpXUYFJNrtikv9XKL8qgEwOSINqovYRUi9zChgQS/ueMJp1+O46POvxaYCtmf/BG
         mrUMJruFDXmkRwMdnLYWM7PY6iOejCMuAQirWecb7FKsLSyJKQoMcBqwn5qK2mUAT4vJ
         R9nQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuZxPjwWX2yLnjYDNIYbwwi7UqinTe3G9M+1OfUiDOr4VjSJdnhuDKg9Wjo2qh2KTIdckMEkz675s=@vger.kernel.org
X-Gm-Message-State: AOJu0YyI0nRhHkRFTztPt0nlIJ1e9sDJkwuAVaeXft9MJN4MzcAeo3XU
	EI70T7AinXERH0xt9bPRw3RhIJVPkR7k2SnG5kUlxO3vcvMnSANh9bBB
X-Gm-Gg: ASbGncvFmVOSZngx+54JsxvSVhS1Taq2v6n959iaHnsBU+9Pulw+vclst0YNoEB4l/7
	C/pWJMSXu9BNHtAnzLExOvWytqYeHzZ5bib3aukJGOd0WTeIplmwdfx0HjDch4t717YGXRneOm7
	BE7jgvBhKz0UklBqfpBIKNGlX2dhO/Y+Pvzm4G0JJJjWigO0pul7A9auA0mC1pnNOzaqIK/osJa
	PCIJMgYQMQDzdQ5uvQzu3mvskviNPmWBZkEiikYn3/jRxygAj3DeRQlpSnSsVm4qG7S5qFtzfFQ
	mhZfIQiK+3mgIG9yR96QZrtnjEgGOcZ7PQY0gDDemAPHPNSK+KVatCVLNRnQWMm+fot/YlV5vII
	aUwfuKGky0t6WdTPPWpwPBD0oSRx1XPHfIE1/ln/laekltCapUw==
X-Google-Smtp-Source: AGHT+IFc8t5RIReyxhe/YhSffa5uXVtkzd3/79NpH3j4fjj8RiMnktaajaSJ8gcmock1LzX66HbTfg==
X-Received: by 2002:a05:6a00:17a5:b0:78c:99a8:d294 with SMTP id d2e1a72fcca58-79382c6bb87mr1630730b3a.0.1759882030944;
        Tue, 07 Oct 2025 17:07:10 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b020537d2sm16845105b3a.58.2025.10.07.17.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 17:07:09 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 50F3C4233430; Wed, 08 Oct 2025 07:07:07 +0700 (WIB)
Date: Wed, 8 Oct 2025 07:07:07 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Gopi Krishna Menon <krishnagopi487@gmail.com>, rostedt@goodmis.org,
	corbet@lwn.net
Cc: linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com, khalid@kernel.org,
	linux-kernel-mentees@lists.linux.dev, crwood@redhat.com,
	tglozar@redhat.com, costa.shul@redhat.com, jkacur@redhat.com
Subject: Re: [PATCH 2/8] Documentation/rtla: rename common_hist_options.rst
Message-ID: <aOWrK-vPQaqbgUAH@archie.me>
References: <aOUMyGvkibvOV0IS@archie.me>
 <20251007185508.40908-1-krishnagopi487@gmail.com>
 <20251007185508.40908-3-krishnagopi487@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="B//GlOCCMvZhY8mv"
Content-Disposition: inline
In-Reply-To: <20251007185508.40908-3-krishnagopi487@gmail.com>


--B//GlOCCMvZhY8mv
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 08, 2025 at 12:24:51AM +0530, Gopi Krishna Menon wrote:
> common_hist_options.rst is intended to be included by other rtla documents
> and is not meant to be built as a standalone document.
>=20
> Rename common_hist_options.rst to common_hist_options.txt to maintain
> consistency with other common_*.txt files and prevent Sphinx from
> building it as a standalone document. Update all include references
> accordingly.

LGTM, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--B//GlOCCMvZhY8mv
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaOWrKwAKCRD2uYlJVVFO
oy9ZAQDYJV6qE/AzMUzQwGGq8HBR5bcwCtyChfYiU9bhnHMyLgD/bkifhp6WZd4p
YPpU7zjarwlFUjfFPhgF7OOFDRTrkAk=
=kSCJ
-----END PGP SIGNATURE-----

--B//GlOCCMvZhY8mv--
