Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C7C30594F
	for <linux-doc@vger.kernel.org>; Thu, 21 May 2026 23:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779405973; cv=none; b=WpzmUW7yvXghfn6DRRBshcXBiVACeeUDm8UIoiUgPrKDEvUj+Qo3lJnu6/AAgjwUiFM74nRainSJBSVQb1KVyWGog4o+J0vajf+AKjG1Gzalysy+ySaW48cMZ/Tdln5fFAH64SPo2UpQODBLs8uzTKZ9gCvY9QIJuGnROsBBbQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779405973; c=relaxed/simple;
	bh=Dw7PuRHNA/W8Hiw9V5ggJj9yrjp9HMSTlX2kIqqk7uE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UqgFcNuGQhSEyE8Jyu/BRj0xBjdl7B6lckBW/iRa8m4OdBsnq1MGChjDMcKS7T4+/ULfCL2n2oxxDFCjWsDz8P1c0SS3BkkttADiDpJ9afvIjOhaphUJviH6J73C3NA7XfTdIXVzrIBf16sK1u3C1WcrGAPHjNN4IIJ/3+YfCKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LDwlpKX7; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LDwlpKX7"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c8095d7d75bso2720793a12.1
        for <linux-doc@vger.kernel.org>; Thu, 21 May 2026 16:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779405971; x=1780010771; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Dw7PuRHNA/W8Hiw9V5ggJj9yrjp9HMSTlX2kIqqk7uE=;
        b=LDwlpKX72cKVkldLepR+ZeyTIUfqTztKIPLLqg5mKbbYvjDMiGQE2hI/EzZWwIgpxz
         vy8vVcIQaQumGTVQrYQ2o7fwgwy0gFAKbf5aFtzf4eiuoq2LKIZFYduQ5NOVE9JKnPF5
         07yd0IEUs+n5K3KjoVvBwkE0jQb6jqp6rOZ05f7uiLeUa2e8PXi3518ZgzkB9gLUyFlW
         F2m5Jb+iSwF1c85DYQ0gAxVCT7KiJkyiCw4LbPtYjz9oTMNj0roOvhohM26QaDQGZvaU
         +j2DwIzXi8zizePffFmGA1fSVbo5pWFB/d3hu06cBRE4bBgeT2gFkG2GSJ2h/8MpUYlj
         JCvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779405971; x=1780010771;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dw7PuRHNA/W8Hiw9V5ggJj9yrjp9HMSTlX2kIqqk7uE=;
        b=IGa8D0cd2ITO29hoZDVDOjD6Q7M+/AihRJCBh0vd/WiuaDPMx5SUiGLQjNFLktpzXm
         pdvxuoGCy7K+RSPBAPgbeRErh8pWGC/T+N0SXvMgfc6Weo8fhn92sVvEnLkYkXoAmOjb
         FPwD3ozYhTEazA4nwuUNwfI1USWLfWgoqMIwdojeslD1sH3kGO8CJb818AbEIizi59E5
         2SIIGIBNt9z9hd2FQwrMH04NOFkb7S+tMhYM/oY9OEeA7TF662Frf1lws0ZEgx3+Dcdt
         WsHbl5UX/gsRkJS+9Ufv3ldhHuYI6C8/WS8acr9jMHWz+3pFG6LqLJyEWwYjFATJG9yq
         wnyw==
X-Forwarded-Encrypted: i=1; AFNElJ9DXUsxzam+maNND2v4T5ztSXVCbBydgb9l3DjSFhEaHcBvbH6wAV7AKHx+DH3sZ7hqeHZISV1ETlk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5Aq1T5Wnl0mr37mmYavN8hgkDkXnWbcKgaaP8JlwW36nn1qNg
	m9QpnV7m+28RN5M4eZEXMVu2wjIPbE7qWZ9FXL9aC0I1AiHEJhU1ohgp
X-Gm-Gg: Acq92OHLLvI+oGPeIfRYlDvTwn0AAyqnm7wlbC0tkUwaNshKn6rhXY78jAyV4sOTZic
	YUK9lh61L+Jn5jeowXwKtDu7TH0Mob1P+5MqR5pKefzZLO33Uvoq7DsP4u5H/hu5QpIImV0kDFH
	QXV6WHw91oRdZvDoTT8DgZxqZJwFg9FfZ9wsFtHL2jq9c+UCwFFKxnx6WT9mDTfN+D21pok4swe
	fXoULyd1vidHsMVWfz6g4/Q2uXJY0ZGQgpaamBFChQLBR5KGnpqImUBWrCCWbb0or0+hKW2n3uy
	eZSMfZ/E7k2zjJrSeSUhUjVxFfkvDOBBfQrHMh4giImWSeTjVIj2YupiNplpmwQG8NmPbwRb+Ws
	kYf9YlnmK367n50ekpwFUGGPT1f+4kW/hGNjAtVuhPSsEDIEocRx5D3qkQco7jCtAPSr+zSqp2L
	NhdfWSAJMb0yUaBjXzjqg=
X-Received: by 2002:a05:6a20:9389:b0:398:7eea:50a0 with SMTP id adf61e73a8af0-3b328cfb9e4mr1006142637.18.1779405971211;
        Thu, 21 May 2026 16:26:11 -0700 (PDT)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c851d2d9d86sm245625a12.20.2026.05.21.16.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 16:26:09 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 7C79E4244583; Fri, 22 May 2026 06:26:06 +0700 (WIB)
Date: Fri, 22 May 2026 06:26:06 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc: Stefan =?utf-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	linux-arm-kernel@lists.infradead.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] ARM: zte: clean up zx297520v3 doc. warnings
Message-ID: <ag-UjgpdYEdd5zi-@archie.me>
References: <20260521191458.177046-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1z/7KOFz6eY7PkPh"
Content-Disposition: inline
In-Reply-To: <20260521191458.177046-1-rdunlap@infradead.org>


--1z/7KOFz6eY7PkPh
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 21, 2026 at 12:14:57PM -0700, Randy Dunlap wrote:
> Fix multiple documentation build warnings.
> Improve punctuation and formatting of the rendered output.

Much better, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--1z/7KOFz6eY7PkPh
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCag+UiQAKCRD2uYlJVVFO
o9ksAQCQ5MAM4pSQ9ck8cANNTAKfC2X5mBf0qnJcPYNQVs5dPwD/TuV0pRHBwJoq
FU7BzdZAEC+z4vRC+9k1AEPkhjA3Ygo=
=nZ6w
-----END PGP SIGNATURE-----

--1z/7KOFz6eY7PkPh--
