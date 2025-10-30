Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5DC337B8F
	for <linux-doc@vger.kernel.org>; Thu, 30 Oct 2025 07:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761810054; cv=none; b=c11P35wpA7EUrR0aM1E412vP4nqbL/Jb5GjoAiM+cAk7qsZbH+FGZDGVi7YE8W86Kfe43EaFNVN8Q0ol/TAhedjoU5lOThJl3+jVJQHrQHe7LNKrrbo+B3RP5GTg/MgBvtht9ZKMWIbFEB+z/Ebr0Y30M58yFgoXhM6zYyuePdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761810054; c=relaxed/simple;
	bh=H1hjxQGjEC5L4T4UtQNNrJaSLGQSRQrdJRzQ9oj29ac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sbQlmnSF3Vz9wspTaYeFnteTcY7OEaJL7i1uR6W+UYe4knnrib9kJkwGpDjQAm3ekvP5BUk83kbK2yRPruNpAKF0Y+6i08/IOcpy81EqCaEPa7U0w6uXjx9kNBNSnPetnlBX6qnQWCSD1W04l/UPnO3rGKANDqyL2aEktBDRawQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DDQfTdex; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DDQfTdex"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-27d4d6b7ab5so9547535ad.2
        for <linux-doc@vger.kernel.org>; Thu, 30 Oct 2025 00:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761810050; x=1762414850; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=H1hjxQGjEC5L4T4UtQNNrJaSLGQSRQrdJRzQ9oj29ac=;
        b=DDQfTdex7r2tKhbvtJhdJQnl1VIYrxggBEO9A31p5H5dDCW8sMEVcFNI6M04Qnt2rj
         oGYweSn0EC8NNgEP+ip8ZKYbboivkpqdfWWGowk7tqnmGbBUP7zAoJ4jtIQFGEGGjzBU
         Vupgs3Jtkk1brsvOy6dF1bT1jquMLhUXUInk+LsTZsGouSuEdeYU5uwoD9F7SgCW6Qgx
         34AZbpZLSkw4+Ya0MS/iAwOfPTnrAETU2mjU+iLb90TkuzPnGk/eMXqycO0JWh/7xzvz
         4mvVkWw49Dh3r+ETaaLYWbdHVgrwoCAzqg5TV1U++AkLwzTsT5S8zvAkbiITH+gFdJH9
         Yj/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761810050; x=1762414850;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H1hjxQGjEC5L4T4UtQNNrJaSLGQSRQrdJRzQ9oj29ac=;
        b=Cy81uukBjBfNpv4wRjEk/4b/9FeL3wtfQyS7+hlZl5X0SP1T6ArbClW0LaM8OJF+Ty
         ai86Ot6lC33SuybGzu30eEUYuz3D3L3rYlkDqwEXMsmEPT1v8rYM4czo5Hqqn+57XHOy
         ETvAdctzj9VDiKQPJB4ddyBWzTSvJMNh6Njgehst/cUgtgJ33PdRpcn0dLqCIXCjZqk8
         JKwXKtnJq6hKsjwLsUJi4nU6BTGTq5OhmTKIJUpV6cDLAAf3odk64ubshiiEmLqHaSB3
         OhgMbQ5wmFAgYtnM9Da/gNc+gjA7rYZC6U/ZdIRogw7wlX++TEQTxkYi71JISgtMthOG
         +ysg==
X-Forwarded-Encrypted: i=1; AJvYcCVkhvLEH5pmgataTgOxPgqYBgVycXeEROik/kGttO6UL/8wv+vCByATm4zGqB8cBlDy6bMJrAmI8yY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtT+nznpfyS/QVj/vMEykzFz70QbBRyEoIgR9+Xial2yYTgBoW
	pMDLPjeP84O0+S79LZcnWZPmUWp48ObtxPHU82ijpUitkOUPkFQZvBXJ
X-Gm-Gg: ASbGncvjglqdzL5lJx5RRcNrNto4NKywNFFQnObWctaBXGbAnhd6996CWLVX5uU0Yzv
	ZCdpPxcm4x/myVDCtY6HDyttnzUQZa4YrwA6LstAe/Qay4DYs6yXIRTuAsgn46FbCH81Zq6Ised
	IlCGbFGvqkIG3bVAEnENgbYAgdSwiUmyYPiSNZcr8j9i7BwalJd6XnGXhebavr1jk98mrbAodTF
	OqC8eKGq5k2isAGbX8jRLXki3eMZv1Vqmp5X84mE84liyFVn1m/IiEWmW00lojcxjC3jgHqKLrA
	ZfyYdtsFzEjHcUqLFCbdE1p9AejRncea2cq1z82Y6tepnNgjrMKANiYUoatP2BC2kjdZqS9M7L+
	f167l9B9um7V/RgRTiTJRy4gbUFbqV2I6wZW672aghu2TbbTv7KCILEHxljBzGrCYTmguuh8YT1
	eA+IbSny4+WIg=
X-Google-Smtp-Source: AGHT+IEhJrBVY2OU2QdJTvc4eWg0c6Su8jbKCtvPUTeYudGOdXSEj26zmCHIN6FgAx0W7VrJvvw/gw==
X-Received: by 2002:a17:902:f601:b0:24c:cb60:f6f0 with SMTP id d9443c01a7336-294ee479ab4mr28678895ad.58.1761810050370;
        Thu, 30 Oct 2025 00:40:50 -0700 (PDT)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d09a33sm174420525ad.32.2025.10.30.00.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 00:40:49 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 130774209E4B; Thu, 30 Oct 2025 14:40:41 +0700 (WIB)
Date: Thu, 30 Oct 2025 14:40:41 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux Networking <netdev@vger.kernel.org>
Cc: Breno Leitao <leitao@debian.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH net-next] Documentation: netconsole: Separate literal
 code blocks for full and short netcat command name versions
Message-ID: <aQMWeZyZoT2vV-Z3@archie.me>
References: <20251030072945.38686-1-bagasdotme@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KqaALex6Sku4dIYk"
Content-Disposition: inline
In-Reply-To: <20251030072945.38686-1-bagasdotme@gmail.com>


--KqaALex6Sku4dIYk
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 30, 2025 at 02:29:44PM +0700, Bagas Sanjaya wrote:
> Both full and short (abbreviated) command name versions of netcat
> example are combined in single literal code block due to 'or::'
> paragraph being indented one more space than the preceding paragraph
> (before the short version example).
>=20
> Unindent it to separate the versions.

Please ignore this patch (missing v2). I'll resend shortly.

--=20
pw-bot: changes-requested

--KqaALex6Sku4dIYk
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaQMWeQAKCRD2uYlJVVFO
o7SuAQC6Oq6KaPgD/blKnKE2tBWgL49wdzToS+7PXDDYHKZU1gD8DYRUeyiRXmJT
h5Qq9SRDuqwPzWA50zNlXOYlpQH/dg0=
=8ULH
-----END PGP SIGNATURE-----

--KqaALex6Sku4dIYk--
