Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D26F27AC4D
	for <linux-doc@vger.kernel.org>; Tue, 18 Nov 2025 01:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763428272; cv=none; b=ucyKBqlDSMc+sdptnzSBI0ipIxRSinsyyZDbIj0cThHTh1NGwRo/EWQOkE7Sikp+SoTAK/ID+xQWVN5qYQeZGhO0gFI5Oxy13DsZRAG+rujMxJfXag3IoEsvFgdfCXWplMX0r+5wEV6eUP19+csy9NWFTN9J0uXxyDb/n6ClID8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763428272; c=relaxed/simple;
	bh=YKxqcNViX6qqvZI5Du+w7cR+Z9auWma1NTdEDFyftKM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cz8Wv1QNjw3vXx84dInjvkjfIaXuxWegLKjRJgx2CsTk1DV8jyB3ma8hQJ60wMy1V3bpu3TuC+GhxAusf4SFHyekz96fOUD4hiHP19K8l3JZpksGTA53ofjC81a9FKuPTt1hDxRdubP6h4hOCoJPIKs4oAFBJ5VMpOY4ClbNXgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TGDKNIJE; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TGDKNIJE"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2958db8ae4fso45517445ad.2
        for <linux-doc@vger.kernel.org>; Mon, 17 Nov 2025 17:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763428270; x=1764033070; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Vp0LDsyDyb7R1ZTDvCb7ywKMsPMwduazxpj+Qd4FomA=;
        b=TGDKNIJErvd/5AZSfJLkGPJXQBS7pWZ7cdHYCqEK+RGS0Ny4hv/KPzXdlzIoQPNY9L
         HTTYJKwrcElfWr4F/NRExNlxow1akLkrtvJcXWgr3O/zI4IiRFxJppUGGGBk5YFU503r
         +zA61KXtCloIHbVPR6Ei1a8MunmDFV8bs0EV7k4kYOK4qCyQPi01FGqwoV5tYra7ibZr
         RJ46oUr0NDOkFE0TER9mOTqCcCQbmIC/aDXU4j2EvdUFm9DZpkiBYi5j66lvSqHEzJhT
         hZavZEIV8BYBfJcAeKb47wBnwStXT3qwJ7Nzyrwo4C/T0RIbs7voE35rAcsDJB6aL+x/
         t6VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763428270; x=1764033070;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vp0LDsyDyb7R1ZTDvCb7ywKMsPMwduazxpj+Qd4FomA=;
        b=N46fmbDiZRiLke2YHYcvmNU0xrr3FlHvWyJMqPffl8L/jVezrvwAtM5iuMnigyIEyL
         Q1bvHnAbtCjLDvKChPIcGeYurLr7WY9Q0uftBRUeW3gNXCJLGw5p54kaP4OMZQosMEs7
         FXe4e6I9w3iy8+KUivbCisKZDpmZzbvTV8lKn6UMLA0IOeUWlYI5zypOc9X0zjwF3U80
         doeRWtlDccy4B1uTtbg5RClG9n8DYK1zzOGhjOh9r42rOCbJIP/88+mHddfGJfCcRsiu
         Ff0HKlxWqRl0qVtLwboxqyjb0VG/FepZLT/3sezGR6R8Dnri38shJsuN+GaSBGMRcO+l
         3QBg==
X-Forwarded-Encrypted: i=1; AJvYcCVG70c8AAOpuHIZynYNOazbxGKzMkiigRxKOwSTqtvVKxVhPx1lfsjdIZQiASxjFSD+CXEi+eqPW3k=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywwyaa03VVaDUxofapdCMGSSN5WcLzjffc5Tj8P2nVfZnwoQoZA
	vQhzmH0O/u5leJWP/m2znoxLpaadGv4u+yiq4jt9Lb0WCg/E83Zoj6xB
X-Gm-Gg: ASbGncvgn2+QBiq398H+w+ZPcQrAJnzZPHCLuepj6l4g7Sa2mze/+/Dk2Pe3HnmVzmu
	e+eyijfjewUF2Ne4fdyuBfeJs5LjrQqqW7yTP22fjQfiY8/PRzwHO4yW7rMYoPn1LHi0U/c6dX2
	bIZbFUp7rfnwTaITmIILVdu8/5Jsumb8u684F+ehw11P43YcXwJw84dff2uJYadjk4aDo9jJbTq
	lCFPoTShClCugoL5jOumUScvs1C+Yz3oLI4GK8s33ik/sk8HOJdcAXOS80fJIDkREjnF7Shi7/X
	UHS/8EHWZN7VPwdMmIpGI/lrHBr0kLghkDaXTZOGua9GlyltgYMhzk8ujd6pJujPTuGhi8pifZV
	eLtu6uPKaqcDXU3ikAtd2uneIucTeTtCy6TJgmNIgY+3lvHnf8XqszWqZxYV2ypbIIn42yd/CD0
	yd
X-Google-Smtp-Source: AGHT+IH8sMh87DimhuzypShcWCnl2ByVdY3P0E2b5MviNB0StB+AzCfPk7P5NcCTsWL0y2uLvh3SNg==
X-Received: by 2002:a17:902:cf03:b0:298:46a9:df01 with SMTP id d9443c01a7336-2986a6b8911mr198986545ad.3.1763428270176;
        Mon, 17 Nov 2025 17:11:10 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2346acsm153403135ad.14.2025.11.17.17.11.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 17:11:09 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 29C3A437C003; Tue, 18 Nov 2025 08:11:02 +0700 (WIB)
Date: Tue, 18 Nov 2025 08:11:01 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Sasha Levin <sashal@kernel.org>, linux-doc@vger.kernel.org
Cc: corbet@lwn.net, josh@joshtriplett.org, kees@kernel.org,
	konstantin@linuxfoundation.org, linux-kernel@vger.kernel.org,
	rostedt@goodmis.org, workflows@vger.kernel.org, joe@perches.com,
	rdunlap@infradead.org
Subject: Re: [PATCH v3] README: restructure with role-based documentation and
 guidelines
Message-ID: <aRvHpfke8hZ--AHF@archie.me>
References: <20251117213801.4077535-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EE6eExpXX0pcGBTQ"
Content-Disposition: inline
In-Reply-To: <20251117213801.4077535-1-sashal@kernel.org>


--EE6eExpXX0pcGBTQ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 17, 2025 at 04:38:01PM -0500, Sasha Levin wrote:
> +* Build the kernel: make defconfig && make -j$(nproc)

See Documentation/admin-guide/quickly-build-trimmed-linux.rst.

> +* Attribution: Agents MUST add Assisted-by tag:
> +  Format: Assisted-by: $AGENT_NAME:$MODEL_VERSION [$TOOL1] [$TOOL2] ...
> +
> +Examples of Proper Attribution:
> +
> +Good examples:
> +  Assisted-by: AI-Tool:model-version-1.0 coccinelle
> +  Assisted-by: AI-Assistant:v2.5.0
> +  Assisted-by: Code-Helper:model-2024-04-09 sparse smatch
> +  Assisted-by: ML-Agent:version-2024-11

So mentioning LLM version is strictly required?

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--EE6eExpXX0pcGBTQ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaRvHoQAKCRD2uYlJVVFO
o3JkAP9l/bfUKENUEWzlJJVL601LI2w+o0c5JyJtN3cGfgsxYwD/RO75lmxNYEbi
FDTWrES1gwg3s7oY4beGSsBMWfhsMwk=
=9Fa+
-----END PGP SIGNATURE-----

--EE6eExpXX0pcGBTQ--
