Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com [209.85.215.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D189638BDCE
	for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 10:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768386817; cv=none; b=j6okHjwMU7/phqJrkMdvnVD2DU1c2pKimy9GxRjflSz7xHafN2pJoNrXWPoZgYp+h2XdoyE4JUv/VncwA8KWonGy/IO7IqRU4arqpVODZuJYkFYbHGtppoGEd3AepjzWl0ukgf2xkh+XHK8+DFzgnTER+E5lPz2+tGHIxp8WqwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768386817; c=relaxed/simple;
	bh=k1SMSsqpMZwZvSV0g20lBr2XOnaCbd3o4aDq4dxErIE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dKNoADGXbnTqH/Ck2KBbAjCyArE98JSnNLi0xGMaiiMHYMmHtgGPO+w5Y8RXLwT/m3tktAxKunn0ED7e1l0dABFI74rBy+9udXs43U+iNrCVbT9prOsdkIs9eb2gs+HVpeRBG/94fL3OAo1qgv5sT3+2HZJitJ4AzNERrMktMlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XY2Iyfpz; arc=none smtp.client-ip=209.85.215.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XY2Iyfpz"
Received: by mail-pg1-f196.google.com with SMTP id 41be03b00d2f7-ba599137cf8so331578a12.0
        for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 02:33:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768386800; x=1768991600; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=f3/DcMGpMzg+mO6zLmbwnAiGuiQO6diCOcrnU4aPWyM=;
        b=XY2IyfpzmQ54GANXeb4t6+oQN37rcph/mwnMI6fSwVMltWPyDEHXeQTK2VaR5t05mk
         yv+w2Oeblr97p0FAPdhLwNarJMcSN3sF9rLFTbdZ1uNohAv9OOpimcf0qGnnblQ90cpY
         +5esAVXcR/CQDrv2ldDUK1lfIDuFIdGEiMZfE9I4YhkkwJvItfTsG550IdEXSl9PQtXC
         K1cwONIBkojntYVpl1Uh5DlsgeTnestwnviYBfSTdjTFpHnJf8xhiAhqJ3TZRxdfgwYW
         WlzTr7dRZSwc/d8cFw2l2KEr9xHLiybi3gBrj55EilwwOgRpE5iiP1HxMXdJaTaLZ+ZO
         EeAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768386800; x=1768991600;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f3/DcMGpMzg+mO6zLmbwnAiGuiQO6diCOcrnU4aPWyM=;
        b=UHmXS4rRDBUgxAa7xRydqNTziciVaAQ2cWVXfpQyRAAxs6RvVk9qEa7BaH9kLBej2C
         /ztgEWf8PtaeJHePNUVPhIslqUe76WWUz94V35f9RJnMqSobvsf6oP7PJbyF8N9MdoEW
         aUS3sOvd1KYDXuqUr59V2eZ6nV54q+z5Yoj7mDbCDW9Wr5Uxq2AK3XJS+sHiUf+iQ0du
         eisJNFpqW0eO6RMFzSMaeQG1Kgysp/1ELMT5g15ITPG5aMH4vWLR35vgyz8pljzhx3HV
         CXryq8o/vPZPdDQ6+oOmpWHqdbb3n7zqaWvLZ8m8iscHbXcc1bZyyFJQiHwWfrYFu1Ri
         HR4Q==
X-Gm-Message-State: AOJu0YxHv80d63t8RjnHV3NzD/41BJwFYjOwmlM0XXjk3lHkzs7D2MqM
	44XFYU9RPnjjn6m7uHcCKl8CM1KlYlZC3GMk+baavQX93FGOHtZ/yQgf
X-Gm-Gg: AY/fxX6yI4ZYQDDKND5bVQBLOo85R9FX/u71pE7rkbZJ7uEFbE0EHbGbQI+pXtS9TlA
	Baj5nzBtoWDCr72ciIAinyhtmMaZYrk+v5NfVXuBLfYUMRPwojH3baRDy2tKQnch//Ssh117bek
	wJiHLf8gahQnu3MshQepSDihjBnYqxEc7jl9irxRj8GhD9G9KvLe2p3TCg/Oa1CqjALsjeCYbTz
	/iF93eoebSy7whi4bf+hTeoL4AT5UstOhDs92ICVYpIR8w3ciiwIJ7c6D3cSMFrlwhtJCEC798p
	PwLDNEuB4prvNZvOonNGVKeRhnsbOHrye0o0zatAUv5z1cj/A0c1nu8cSDVEWtsM5RZfcn224UB
	QCDvr3nxCPyyOf/j4O7oXr6Nk3f1u5T4inPaTfs992XfYo99+2dccCvddRxfENY3CMJwmaAk1E5
	H8Qy92v7o=
X-Received: by 2002:a05:6a20:7d9f:b0:2cb:519b:33fe with SMTP id adf61e73a8af0-38bed3887ecmr2409623637.21.1768386799808;
        Wed, 14 Jan 2026 02:33:19 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35109e3fbb2sm1619031a91.12.2026.01.14.02.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 02:33:18 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 850C44187F7D; Wed, 14 Jan 2026 17:33:15 +0700 (WIB)
Date: Wed, 14 Jan 2026 17:33:15 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Petr Vorel <pvorel@suse.cz>
Cc: linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Alejandro Colomar <alx@kernel.org>, man-pages@man7.org
Subject: Re: [PATCH v3 3/3] Documentation: CSS: Improve man page font
Message-ID: <aWdw64Up3PNtk3Re@archie.me>
References: <20260113113612.315748-1-pvorel@suse.cz>
 <20260113113612.315748-4-pvorel@suse.cz>
 <aWbLEeeVuY1X-YjA@archie.me>
 <20260114083614.GA334250@pevik>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Uiqr5VaKU6LSzeH5"
Content-Disposition: inline
In-Reply-To: <20260114083614.GA334250@pevik>


--Uiqr5VaKU6LSzeH5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 14, 2026 at 09:36:14AM +0100, Petr Vorel wrote:
> > On Tue, Jan 13, 2026 at 12:36:10PM +0100, Petr Vorel wrote:
> > > +
> > > +a.manpage {
> > > +	font-style: normal;
> > > +	font-weight: bold;
> > > +	font-family: "Courier New", Courier, monospace;
> > > +}
>=20
> > Shouldn't font-family be the same as Alabaster's default for consistenc=
y?:
>=20
> > font-family: 'Consolas', 'Menlo', 'DejaVu Sans Mono', 'Bitstream Vera S=
ans Mono', monospace;
>=20
> Probably yes. FYI I took this from
> Documentation/sphinx-static/theme_overrides.css, maybe span.menuselection,
> code.kbd, code.kbd span should be fixed too.

OK, thanks!

--=20
An old man doll... just what I always wanted! - Clara

--Uiqr5VaKU6LSzeH5
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaWdw5QAKCRD2uYlJVVFO
o6vJAQDD/zVGciS3M30ioXXxrsx+zIZu7oMJZYG4NSvaiitrcAEAtp+TtvGfdxb0
3/0s3HW4HfGDVTR9M+rrRzFa4tTuuAQ=
=RSm5
-----END PGP SIGNATURE-----

--Uiqr5VaKU6LSzeH5--
