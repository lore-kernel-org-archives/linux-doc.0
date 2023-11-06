Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432E22F27
	for <linux-doc@vger.kernel.org>; Mon,  6 Nov 2023 05:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CTPn6r+8"
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09B95F2;
	Sun,  5 Nov 2023 21:15:51 -0800 (PST)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-6bf03b98b9bso3879918b3a.1;
        Sun, 05 Nov 2023 21:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699247750; x=1699852550; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wJQuj+yw5AtCsm3Nh3eaEJ8IPjFc0cjx5pVXpkaybko=;
        b=CTPn6r+8XnED3e4e/nXoq46KC4uGTNB8b7Zy0rSkcHmgSWteG8jk9zVyG9rwgFBqM8
         eY0atvtFauJVBOFf66xWKo94KQZG53Z/q+M91KAiI7KGOmdJmlGXTeG//bbd6TXjau9W
         kGGgDObMwXXNs0+Mh3EEtx3q3HhqPdEYXsYf+I0uHOgKzVNLAHZWXhgrQ8VYM480ILMM
         pr0NM5OINkOiN+7cvwUawdzL+ap9J2tKqH4ef893pV4eFl0/wV6WL8Bcf2jy/kCCNkuP
         kaIkYzUKQwB7X2wByAZYHTrxgY3QKKuI89bPpmSoEFXeb9DDOnwXnwJP7nT3JM3tDPnz
         2L7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699247750; x=1699852550;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wJQuj+yw5AtCsm3Nh3eaEJ8IPjFc0cjx5pVXpkaybko=;
        b=wEYq52iTSCt7ET9yDaz4AuPEKJbPCLmv9DiePhlgo7QvLhhI6jcXMVY/BSnwhK2gpt
         e15cSJvYEZDCApBcpos2e2KL9rKhU9wcUHgIugHvgo0Rh0cWyzS97d70L2KGdX3uZXvX
         9F2H6Ekm1/L4u4/YtVdUXxOOGNr37cKlXyUvrHYkqGZx8kqn30hADUY4SRkFtilmzWSE
         pPN7A2EAxgys+qaQ7SA4oU5lyi1SF9xSBuPfcsbfycqsGPsP47V/KPyQnZSnsoDg83oD
         BpJc/QZtrMz/xflgaXhAVpWEe3rT2ccO9oN/veXYaU8a5BIqF4u7Ofj9zxv4j62WbDda
         8RSQ==
X-Gm-Message-State: AOJu0Yz8RLfuJmO87LrN0/ZyjptZe+gIQ0Wdweyrxg3JOUOfsYgoDQJ1
	14IOJmU8UiiJErBRdo0GYtk=
X-Google-Smtp-Source: AGHT+IFJnPm4yurMc99aQj3qffQVoJNmBJcK7sbQ+SdUH+x3YGKqHbHy1aOCEnKMvznjVmoguV3Pzw==
X-Received: by 2002:a05:6a20:2587:b0:181:a5ff:2dfa with SMTP id k7-20020a056a20258700b00181a5ff2dfamr11831872pzd.5.1699247750411;
        Sun, 05 Nov 2023 21:15:50 -0800 (PST)
Received: from debian.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id s133-20020a632c8b000000b005ab281d0777sm4748640pgs.20.2023.11.05.21.15.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Nov 2023 21:15:49 -0800 (PST)
Received: by debian.me (Postfix, from userid 1000)
	id EE5B1822370C; Mon,  6 Nov 2023 12:15:43 +0700 (WIB)
Date: Mon, 6 Nov 2023 12:15:42 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Hunter Chasens <hunter.chasens18@ncf.edu>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: Linux Documentation <linux-doc@vger.kernel.org>,
	Linux DRI Development <dri-devel@lists.freedesktop.org>,
	amd-gfx@lists.freedesktop.org, daniel@ffwll.ch, airlied@gmail.com,
	Xinhui.Pan@amd.com, christian.koenig@amd.com,
	alexander.deucher@amd.com, evan.quan@amd.com,
	Lijo Lazar <lijo.lazar@amd.com>
Subject: Re: [PATCH v1] drm: amd: Resolve Sphinx unexpected indentation
 warning
Message-ID: <ZUh2fuCjmgle3vd9@debian.me>
References: <20231105210044.70371-1-hunter.chasens18@ncf.edu>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Z3YYlR3KMg8w41Vy"
Content-Disposition: inline
In-Reply-To: <20231105210044.70371-1-hunter.chasens18@ncf.edu>


--Z3YYlR3KMg8w41Vy
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 05, 2023 at 04:00:44PM -0500, Hunter Chasens wrote:
> diff --git a/drivers/gpu/drm/amd/pm/amdgpu_pm.c b/drivers/gpu/drm/amd/pm/=
amdgpu_pm.c
> index 517b9fb4624c..703fe2542258 100644
> --- a/drivers/gpu/drm/amd/pm/amdgpu_pm.c
> +++ b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
> @@ -990,11 +990,14 @@ static ssize_t amdgpu_get_pp_features(struct device=
 *dev,
>   * the power state and the clock information for those levels. If deep s=
leep is
>   * applied to a clock, the level will be denoted by a special level 'S:'
>   * E.g.,
> - *	S: 19Mhz *
> - *	0: 615Mhz
> - *	1: 800Mhz
> - *	2: 888Mhz
> - *	3: 1000Mhz
> + *
> + * ::
> + *
> + *  S: 19Mhz *
> + *  0: 615Mhz
> + *  1: 800Mhz
> + *  2: 888Mhz
> + *  3: 1000Mhz
>   *
>   *
>   * To manually adjust these states, first select manual using

LGTM, thanks!

Fixes: 615585d09b33 ("Documentation/amdgpu: Modify pp_dpm_*clk details")
Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--Z3YYlR3KMg8w41Vy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZUh2dgAKCRD2uYlJVVFO
o8u3AP9EGukcdCE9j7syJTFV3j9ZJFi0tBknTBxXtF86voVT7QEA7mRPIMBMAUYJ
/kqkXet60szZtgn55HRclmw6vzSt9g4=
=qHmW
-----END PGP SIGNATURE-----

--Z3YYlR3KMg8w41Vy--
