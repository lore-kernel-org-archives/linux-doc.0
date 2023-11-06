Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 627909471
	for <linux-doc@vger.kernel.org>; Mon,  6 Nov 2023 08:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q4y/4djj"
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22855B0;
	Mon,  6 Nov 2023 00:14:46 -0800 (PST)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1ccbb7f79cdso5921815ad.3;
        Mon, 06 Nov 2023 00:14:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699258485; x=1699863285; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RnL15XWbR/PqBAe5vEEeomw1xohZpb97YhaYfG/+2hE=;
        b=Q4y/4djjOSZ1UNDbhESUfIQbCy/qADR/YqrXo7tLpcd2/f7uVDnXAyvQDc+Zq0u6N7
         mPuFsTdI951pYVmlzEUvL+qFPwm88Az1CxZXuNqsAgdX9wrTGogHWKdZO98KvRFEYn/5
         Fs95NgiaNJVz6BTCaDZK2kH8vvZndbaKo/zY4j/si40ZXhoPCip/0fqPebu5XWLFyF/C
         AnapUjdVaU+e+TUpMALoa6nGLHYB4+h1f7T5cQ+eDrIQysuxfYYomTLZsxfSf6fggz/+
         LAQBk/rPs0cITxqfmg1gEZfEhKaIDq8Z8eoGiDepN2fB71gv9P+eNTJSVeCcVR7ZGek+
         nFPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699258485; x=1699863285;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RnL15XWbR/PqBAe5vEEeomw1xohZpb97YhaYfG/+2hE=;
        b=BZ3SZRajp4Kd47G1I44N7kA14TwdmZsrkTFEKV/7G5sisH8nEnd3Xfzo2UsT/bgjq8
         DgRhuYflEC3SzZ24mfNyBNNeBgpzCyPaDP32oB0XPVha0q+nWx+TaQZRDrWKlPwJPuU8
         WMKDTxmMbe7/tSJscchwxdMcmLCN0Ib2PFnfoADZ/7bx6ZvxxkA2DG0BOJfb3Xh/kNAW
         tGHBncUIjgzSQtTOuZ5peS7sBXzIuopvic6xE6z2E+UMk7N8t4dVufI8MyySzLYLr8eR
         02r6QazT4lvrjF/nJ8/pcLv/fngUccKN0HWHjCq8MFzU7XV1HTpf/1tn9nF5n+RSjZ/v
         lLSg==
X-Gm-Message-State: AOJu0YwRCKi+Dm5oD9av5+72Dv7ysWCHnu+N6PpVKnUnTC4vDGw8313o
	XmN2ACzx5Zs4y4eL6ks0sQc=
X-Google-Smtp-Source: AGHT+IEH71t99GuGPuDpnkZTNN858Z5Z6G2lkYXBgMtLmpxZNn3A6l6Q8xwlyYMdOWlmUXyeV+Q6aA==
X-Received: by 2002:a17:902:ec81:b0:1cc:6e5e:a980 with SMTP id x1-20020a170902ec8100b001cc6e5ea980mr16100026plg.3.1699258485414;
        Mon, 06 Nov 2023 00:14:45 -0800 (PST)
Received: from debian.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id l12-20020a170903120c00b001c746b986e5sm5349705plh.45.2023.11.06.00.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 00:14:44 -0800 (PST)
Received: by debian.me (Postfix, from userid 1000)
	id DCC899481F1F; Mon,  6 Nov 2023 15:14:40 +0700 (WIB)
Date: Mon, 6 Nov 2023 15:14:38 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>,
	Hunter Chasens <hunter.chasens18@ncf.edu>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: Linux Documentation <linux-doc@vger.kernel.org>,
	Linux DRI Development <dri-devel@lists.freedesktop.org>,
	amd-gfx@lists.freedesktop.org, daniel@ffwll.ch, airlied@gmail.com,
	Xinhui.Pan@amd.com, christian.koenig@amd.com,
	alexander.deucher@amd.com, evan.quan@amd.com,
	Lijo Lazar <lijo.lazar@amd.com>
Subject: Re: [PATCH v1] drm: amd: Resolve Sphinx unexpected indentation
 warning
Message-ID: <ZUigbshGGc451V5L@debian.me>
References: <20231105210044.70371-1-hunter.chasens18@ncf.edu>
 <ZUh2fuCjmgle3vd9@debian.me>
 <665794d7-38e0-4e74-9af7-eca986792e44@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pfvq47Pno2Wrjbn6"
Content-Disposition: inline
In-Reply-To: <665794d7-38e0-4e74-9af7-eca986792e44@infradead.org>


--pfvq47Pno2Wrjbn6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 05, 2023 at 09:26:26PM -0800, Randy Dunlap wrote:
>=20
>=20
> On 11/5/23 21:15, Bagas Sanjaya wrote:
> > On Sun, Nov 05, 2023 at 04:00:44PM -0500, Hunter Chasens wrote:
> >> diff --git a/drivers/gpu/drm/amd/pm/amdgpu_pm.c b/drivers/gpu/drm/amd/=
pm/amdgpu_pm.c
> >> index 517b9fb4624c..703fe2542258 100644
> >> --- a/drivers/gpu/drm/amd/pm/amdgpu_pm.c
> >> +++ b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
> >> @@ -990,11 +990,14 @@ static ssize_t amdgpu_get_pp_features(struct dev=
ice *dev,
> >>   * the power state and the clock information for those levels. If dee=
p sleep is
> >>   * applied to a clock, the level will be denoted by a special level '=
S:'
> >>   * E.g.,
> >> - *	S: 19Mhz *
> >> - *	0: 615Mhz
> >> - *	1: 800Mhz
> >> - *	2: 888Mhz
> >> - *	3: 1000Mhz
> >> + *
> >> + * ::
> >> + *
> >> + *  S: 19Mhz *
> >> + *  0: 615Mhz
> >> + *  1: 800Mhz
> >> + *  2: 888Mhz
> >> + *  3: 1000Mhz
> >>   *
> >>   *
> >>   * To manually adjust these states, first select manual using
> >=20
> > LGTM, thanks!
> >=20
> > Fixes: 615585d09b33 ("Documentation/amdgpu: Modify pp_dpm_*clk details")
> > Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>
> >=20
>=20
> but can it be done without being so obvious about using Sphinx (or is it =
ReST?)
> in source files?

Yes, the comment is included in Documentation/gpu/amdgpu/thermal.rst, so re=
ST
syntax applies there.

--=20
An old man doll... just what I always wanted! - Clara

--pfvq47Pno2Wrjbn6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZUigaAAKCRD2uYlJVVFO
o2CLAQCUAbBtOtn22yQGu7Uv9lipjEUjPeZ57pIl4xfW8ZjorQEA7hZ6R3PSNen9
ebEfktqrfgqONoXsVVGm1/5wlmlsggc=
=yZdv
-----END PGP SIGNATURE-----

--pfvq47Pno2Wrjbn6--
