Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC2523909F
	for <linux-doc@vger.kernel.org>; Sat,  1 Nov 2025 09:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761988484; cv=none; b=NBQjAV/u2ynIjUdtRkvCjLqEoe/vstahGBxq+fRGeDioIsOAa9r9NqU3YZSIO9TsiJK2AwrP7J1hKTPDA2TrR0hnMaTUHZCCRH2ISp090qaWxF4m8LM/A3tHWsZeAijO7Mcto7MlLne/+4HqLbc4yB4Rt3aSYaNmvgJRzBcVTxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761988484; c=relaxed/simple;
	bh=bcrlFnjZggziM0QjMVr/YX7dISMIrIzKScqkwXuRVEU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GvvzD+NCSWxEpHFujhvPAxkwZuBM3T3J0yVGCYa6LddMgHJTG/NuHOxjGIhTs7Gp4x9X/rWQ0pUgH2/+zcg5w15khwOVAdTH/crTlZHjfMTNyF1lkntGu6ORUaMqnIIF55C6TE/YzyPccvw+gTpQ34pgFcb/nxXfMO5xcKzKpQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZsEDrVzY; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZsEDrVzY"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b6d5c59f2b6so720092866b.2
        for <linux-doc@vger.kernel.org>; Sat, 01 Nov 2025 02:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761988481; x=1762593281; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bjIH77hSFGTlPjPYXJoBf9VYrU+klsU2kyIOYwEmpag=;
        b=ZsEDrVzY2Sw7IOsPUFyPEquNjVCBKVmnWv8CvhQqnIXQeq+H3BHzFJk06V8dJmX8mx
         jUzED/yole49OUO3wPQB0SMnFsN50Zamz40+5u+uNNBJliE53/Xs7rsTJad/myMNzX8Z
         ykkrhhTowNOpP4XGqdNiyNmrWmcDHv4sfPLVAtFzeren6yPOTsC9AAIKn2vwcC0A4BMn
         k2urr8yCc4mpTKmaOkm41WP0ajzsZxl7YlymErFfc+6AuG5o3mOcng0R2tIFg0Aaaj1x
         C0NJhhVAkAlGbDWnFmeWjNGXXcbYOCN5ILwgK1CNa9uW5ijjQVnOtkoSOxN0zvTskwsS
         CX3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761988481; x=1762593281;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bjIH77hSFGTlPjPYXJoBf9VYrU+klsU2kyIOYwEmpag=;
        b=tlvmVb5bJHt+dIZdDWH+p/shlXOYIrriLt9Wl871LqipvVa2GkRVitT/Ao/lLagmo4
         Vc1vpmC6SfxA2hM4+gKgfBCuO/Ug0etIveZV0cRFvICqxeBRppOufCN/l+vmFyt+xHQu
         guxacvHJMYEJzmzyjyz9Yd+HkOuHHYAoiNRko3Fhs8HB87Fy1JHyHJoZht4Vg4Ezhd8P
         7C0dGvHPREj4BroTGbvWeoGdL8bOYsbZAzoQSmQQ1935qg+zGXgR+2NnqP/YCinBXCpV
         m4uPNcvjCo7+0vfn7uRKIjlVYrFeAZmHT3JzBVW9IRLRajae2N+i2wJBz7+v7U1bC6Yp
         AqBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVoSv9y6X/JoQrl4fr+LA06Gl0pp9tJZvA/Uy7GW9yvV+6bMjmgsTSkJxVrKVDxDOmvk2i9mUOEgiY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTyioDNympqX1AEYDUTeqdAJEE1PLm3IWuHDM5mE6aF2rwBBpd
	cS4CMy6kHHFz+haAtg/3PY3OjEBsoBAOiQ85ZtUlSNMRIIUbT0kiFLzf
X-Gm-Gg: ASbGncsqW2gwPBMdkGL7HXkzXm1BE7QppRvJEuNdovpQoz2ndzSaqpKToJ0GtlMT0rL
	u+Cz/E9naLhaqTH/Lazatvx57YaxfXjKsFCxeR/r355n9F5eQxuoo6DqPx2vNf6qMpDGybtIPrz
	dFl/PC8JdaDgoc6eR0uDAane4Ittw8j+gyYDrNfkMEhWav7lLHkU0lgHkGvskr5/mnLed2thvQm
	0OYldphvrGFkxm/PzyG4NIQtJPQ+dXZGhgLpZc2ULJlho1JeuYj8IuaZsdlAl9cPuzWjiWkfTWw
	inYM9X1snxLiuYcemce8tMfBci30KQHV5Z5XtAIW/a57yZmoMixswC1sdFRt8N0x0PauoRCtEXs
	Z7PUF4NEwcW1q6hCROjTfcCiefMrCJkhh00QHz4rSuZGYSY0Lm79BXeDjwmI3qUAnXz9oxv19Cz
	hIW69I5II6x3o=
X-Google-Smtp-Source: AGHT+IE4m8jWVnUeKVDtexD4VIUk1rWLovwGz6eGHJUc/54gMaEdRZBIb1qgJ3mc6oZKZWsrxXePlQ==
X-Received: by 2002:a17:907:3f82:b0:b6d:2773:3dcb with SMTP id a640c23a62f3a-b7070138988mr589022366b.14.1761988480766;
        Sat, 01 Nov 2025 02:14:40 -0700 (PDT)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b70779a92c9sm409785466b.22.2025.11.01.02.14.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Nov 2025 02:14:39 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 9B9D14209E50; Sat, 01 Nov 2025 16:14:35 +0700 (WIB)
Date: Sat, 1 Nov 2025 16:14:35 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux Networking <netdev@vger.kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: [PATCH net-next 0/6] xfrm docs update
Message-ID: <aQXPe49BkkZ1W1uM@archie.me>
References: <20251029082615.39518-1-bagasdotme@gmail.com>
 <7148e00e-14c4-4eb7-a940-112e86902bc2@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6h14tAqlT9+a5/Iu"
Content-Disposition: inline
In-Reply-To: <7148e00e-14c4-4eb7-a940-112e86902bc2@infradead.org>


--6h14tAqlT9+a5/Iu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 31, 2025 at 09:58:33PM -0700, Randy Dunlap wrote:
> OK, one small nit. 3 of the section headings end with ':'
> that should not be there.  See xfrm/index.html:
>=20
> XFRM Framework
> XFRM device - offloading the IPsec computations
>   Overview
>   Callbacks to implement
>   Flow
> XFRM proc - /proc/net/xfrm_* files
> Transformation Statistics
> XFRM sync
>   1) Message Structure
>   2) TLVS reflect the different parameters:
>   3) Default configurations for the parameters:
>   4) Message types
>   Exceptions to threshold settings
> XFRM Syscall
>   /proc/sys/net/core/xfrm_* Variables:

Sure, I'll clean them up in v2.

>=20
> Oh, and could/should
>   Exceptions to threshold settings
> be numbered, 5) ? It looks odd to be unnumbered.

Ack.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--6h14tAqlT9+a5/Iu
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaQXPdwAKCRD2uYlJVVFO
o7MJAP9oppzWwRobyPNTMy/S+a83Bl9LCyQUEYE9ompFmbp8rQD+PNBr+LTiJ8ac
5XEpfnhav7RYgjmpzWnVM2z5LwA5agY=
=jv2q
-----END PGP SIGNATURE-----

--6h14tAqlT9+a5/Iu--
