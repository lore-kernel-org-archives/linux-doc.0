Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C6A13714F
	for <linux-doc@vger.kernel.org>; Tue,  7 Nov 2023 20:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ncf.edu header.i=@ncf.edu header.b="n8C8txHO"
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3C0510FD
	for <linux-doc@vger.kernel.org>; Tue,  7 Nov 2023 12:34:37 -0800 (PST)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-5a87ac9d245so73965717b3.3
        for <linux-doc@vger.kernel.org>; Tue, 07 Nov 2023 12:34:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ncf.edu; s=google; t=1699389277; x=1699994077; darn=vger.kernel.org;
        h=mime-version:references:in-reply-to:organization:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aWp5Pb+/LdzWJWf4DW8IBglT8Le0ScvSI5TXWdEwNqg=;
        b=n8C8txHOJBRMO50qXHXTqN3QJ+ZXK1GiARcrHelqpI2qz2ElJyziOHqgfFgtNQ4ch+
         DG3xM/n8Jovv5wdHAuIY3mh8quCFmMuYu/zzVEb83xaMnBtvEYQys2+4O2YzMwXdnetd
         ngt1QyG6ec2ShYEYLLGSw4KyMtXRXxIs+p2ZR2vdxSwkRPwSH2D9YxSlsp5daGR5FNlV
         LFnEmZ2PR1qdkbne8qFyrHKO9yh2nKHbMU/AsSgMVrH0GppibjDI1+eF1GoZNJcz4cy1
         F4NbrHFQ7E1WPHEnWCazBvwDIZjxIFwR9nXr2M3QVrrsH8GPCPlDshz2xmVKceul2rD/
         x2Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699389277; x=1699994077;
        h=mime-version:references:in-reply-to:organization:message-id:date
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aWp5Pb+/LdzWJWf4DW8IBglT8Le0ScvSI5TXWdEwNqg=;
        b=IAA8z7jj+sUI5velLNcS8a7343M6PxzZjTeRn5smZpDGQ10Hinf3PWGhDoXEk+tabw
         eQK/r3W2qc4m2FroESl9zrKZRC2n0O6D3tdsdN04JZ2So5QBTPrzD2tutlYOJ4QvQVdg
         ILvWv1P6VftryaCZUQxOZZCiBEvGZL5uwSSV4gCQsvt97nwCozRn7LswK/SETyPtZmxD
         eT5RiTDCM0wAkZf6Umv1dOyjOrHx+QvAV8bswTUui/6iYZCjg+M2NuDmitFyiTNQkRLX
         9bp7pFYiR5lTR3Bu6vWhnKtwBj5U+OdNr5Je3SIkuYKuAvOEFSaeqaj/pGhVWvoFkmPK
         szRQ==
X-Gm-Message-State: AOJu0Yy13fPqOEJgjPdg1xKMGVsMjTvwt2pKaasmmZGuBVs5N/zZh2xG
	yHYU00c05G85OVzrUlHidqzivg==
X-Google-Smtp-Source: AGHT+IFCLuTnYPZoOwFZ96oW9PizZC3cqb+219coA5tTSa7FD5yZSWjW9IZIkFPmXv9f3dw6ESaCng==
X-Received: by 2002:a0d:cb16:0:b0:5a7:c6bd:7ac0 with SMTP id n22-20020a0dcb16000000b005a7c6bd7ac0mr14965043ywd.13.1699389276735;
        Tue, 07 Nov 2023 12:34:36 -0800 (PST)
Received: from lux.localnet ([2601:580:8201:d0::4174])
        by smtp.gmail.com with ESMTPSA id u82-20020a816055000000b0059c0629d59csm6051836ywb.115.2023.11.07.12.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 12:34:36 -0800 (PST)
From: Hunter Chasens <hunter.chasens18@ncf.edu>
To: linux-kernel@vger.kernel.org, "Lazar, Lijo" <lijo.lazar@amd.com>
Cc: linux-doc@vger.kernel.org, Xinhui.Pan@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 daniel@ffwll.ch, alexander.deucher@amd.com, airlied@gmail.com,
 christian.koenig@amd.com
Subject:
 Re: [PATCH v2] drm: amd: Resolve Sphinx unexpected indentation warning
Date: Tue, 07 Nov 2023 10:34:35 -0500
Message-ID: <22087039.EfDdHjke4D@lux>
Organization: New College of Florida
In-Reply-To: <6bd4f6d9-07c9-9ac1-2f3f-bb083b9c8085@amd.com>
References:
 <20231106201739.29507-1-hunter.chasens18@ncf.edu>
 <6bd4f6d9-07c9-9ac1-2f3f-bb083b9c8085@amd.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart7603761.EvYhyI6sBW";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart7603761.EvYhyI6sBW
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Hunter Chasens <hunter.chasens18@ncf.edu>
To: linux-kernel@vger.kernel.org, "Lazar, Lijo" <lijo.lazar@amd.com>
Date: Tue, 07 Nov 2023 10:34:35 -0500
Message-ID: <22087039.EfDdHjke4D@lux>
Organization: New College of Florida
In-Reply-To: <6bd4f6d9-07c9-9ac1-2f3f-bb083b9c8085@amd.com>
MIME-Version: 1.0

On Monday, November 6, 2023 11:45:24 PM EST Lazar, Lijo wrote:
> On 11/7/2023 1:47 AM, Hunter Chasens wrote:
> > Resolves Sphinx unexpected indentation warning when compiling
> > documentation (e.g. `make htmldocs`). Replaces tabs with spaces and
> > adds
> > a literal block to keep vertical formatting of the
> > example power state list.
> > 
> > Signed-off-by: Hunter Chasens <hunter.chasens18@ncf.edu>
> > ---
> > 
> >   drivers/gpu/drm/amd/pm/amdgpu_pm.c | 13 +++++++------
> >   1 file changed, 7 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/amd/pm/amdgpu_pm.c
> > b/drivers/gpu/drm/amd/pm/amdgpu_pm.c index 517b9fb4624c..81b8ceb26890
> > 100644
> > --- a/drivers/gpu/drm/amd/pm/amdgpu_pm.c
> > +++ b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
> > @@ -989,12 +989,13 @@ static ssize_t amdgpu_get_pp_features(struct
> > device *dev,> 
> >    * Reading back the files will show you the available power levels
> >    within
> >    * the power state and the clock information for those levels. If
> >    deep sleep is * applied to a clock, the level will be denoted by a
> >    special level 'S:'> 
> > - * E.g.,
> > - *	S: 19Mhz *
> > - *	0: 615Mhz
> > - *	1: 800Mhz
> > - *	2: 888Mhz
> > - *	3: 1000Mhz
> 
> > + * E.g.::
> This will be like E.g.: Could you keep it like E.g.,<space>:: so that ::
> is taken out?
> 
> Thanks,
> Lijo
> 
> > + *
> > + *  S: 19Mhz *
> > + *  0: 615Mhz
> > + *  1: 800Mhz
> > + *  2: 888Mhz
> > + *  3: 1000Mhz
> > 
> >    *
> >    *
> >    * To manually adjust these states, first select manual using

No problem. I'll send a v3 out in a bit.

--nextPart7603761.EvYhyI6sBW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEFaTi3I3XEd+IzfdZZz/o+CKADX8FAmVKWQsACgkQZz/o+CKA
DX8MxQf+OReDu+tIzKqafU63tL2/DgaIr4JodkrKVsbt+QyEfbmSWS9mwP5KsOgf
3Rzv37K/A2OTkRbuWMKE1k+ZJHp/2qrZUJIzZHEE/P9g/LV91biimlgXl9/OI2cp
nAKt6aPapq6ZqyZrVt+5kmIGgUc+7p71dMJ8H89BLTTx29/mOziAHEV38FdWbQO7
OEYDa4c1ugKbxqsnU3ni18PFdMxapGIT6mmr4P7GtD+ikCqireQ1zY+VkeefDOu7
uppL3QTO+AXMNkwhiR6NbaLYyX98pcg6d7Gq3LeGf9CShx+Pz6c28aIiF4KcSk4W
JBL1EslGewkEHY9C3LlIuow9Pkg30Q==
=sA05
-----END PGP SIGNATURE-----

--nextPart7603761.EvYhyI6sBW--



