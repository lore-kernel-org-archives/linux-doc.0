Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEDF936AFE
	for <linux-doc@vger.kernel.org>; Wed,  8 Nov 2023 19:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KRhOIFP1"
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com [IPv6:2001:4860:4864:20::2d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 425B62136;
	Wed,  8 Nov 2023 11:04:15 -0800 (PST)
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-1efad296d42so4276664fac.2;
        Wed, 08 Nov 2023 11:04:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699470254; x=1700075054; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PIAfp4n5FTAxG5B/n8MBsaBM3cT8s3lVCrtfOSkbjqw=;
        b=KRhOIFP1xpTmooxJxWnXLGboBGX0vThLLGkgU+33ALTl1Wqla/NWtFQHad//p95hoj
         z5dBzwgfx/LdptqllVfetqAiHHMEWlpOBK+WuYYpy7jeQXy1p90DfLr4IoZF25CrlviJ
         cMw+tjbyvERgVS6qtA67Ppw75WT3j6i/bYOTxMaiU6SPbYEl1aGf0vBCRs0bbRhCtEOS
         +vOcPkJDCSkfFFm8noS5DNQtoxa5Z0M9RFAgLL5AC3TvzIQhvjU8aUMSjvHHLOas8Y1+
         N9VuQ7Gari9fFS6yebyir13ieI6IeHTBP4RnTrxIGMqQHGVP2Edg6cX7KM322QoKnGTl
         mMRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699470254; x=1700075054;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PIAfp4n5FTAxG5B/n8MBsaBM3cT8s3lVCrtfOSkbjqw=;
        b=sZoumpf8nLvKmXcqkl/aO/jl21ewetoeSyfedLvd46oIjz3XGbEfTJbsWLqqSWb07u
         kCq5dCMTR8dqxFcuAsMrsBMAZqC1vv64JbLbcwn5R3ULutUmyE7l7WiQsywffpkz4/tz
         79dyitYE3SHId6Q7g1j7fpJyP/lt1vGicN6O0wEq0hbzdWaiWqyiDE7+mUZDoXIKmyfv
         e7uLCmGUHsuPtDsLfArmMPnTh/MX/3AuswQAGgSxcIsg+hb7pcwmll8cFNjt52fL19YY
         2BjRIxrC9m/YrpjW6zOCLZYa+XYBXGE5lYXwoxUl/75bmG4DbZreVoeWvLX1FrTLmDrg
         nUsA==
X-Gm-Message-State: AOJu0Yzg7fDyCDY+Ot5u+PyOHkyv3XQgN73bym0bfDgsax0tT12zXPpD
	mN63lRMnRhiiwwjP0rWqAsy43rYxKLQXXLWKUEw=
X-Google-Smtp-Source: AGHT+IFMQHWb9vtoHBrkxGDELJboskZE0aJf095yx+v+npphVWFwsJlmyOfvUZWdSPLGSEwyBKaIWu1ACGNqXJ8U2Oo=
X-Received: by 2002:a05:6870:9551:b0:1ea:7bd1:c495 with SMTP id
 v17-20020a056870955100b001ea7bd1c495mr2449172oal.27.1699470254574; Wed, 08
 Nov 2023 11:04:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231107162830.36856-1-hunter.chasens18@ncf.edu> <2853fe7e-7d39-9b32-87b2-93845f16ae51@amd.com>
In-Reply-To: <2853fe7e-7d39-9b32-87b2-93845f16ae51@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 8 Nov 2023 14:04:03 -0500
Message-ID: <CADnq5_O4AXB_x8uv1bx0XZHt+mqxtKdaH0XAFFouuJ0X_QCNhA@mail.gmail.com>
Subject: Re: [PATCH v3] drm: amd: Resolve Sphinx unexpected indentation warning
To: "Lazar, Lijo" <lijo.lazar@amd.com>
Cc: Hunter Chasens <hunter.chasens18@ncf.edu>, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Xinhui.Pan@amd.com, 
	dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
	alexander.deucher@amd.com, christian.koenig@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied.  Thanks!

On Tue, Nov 7, 2023 at 11:17=E2=80=AFPM Lazar, Lijo <lijo.lazar@amd.com> wr=
ote:
>
>
>
> On 11/7/2023 9:58 PM, Hunter Chasens wrote:
> > Resolves Sphinx unexpected indentation warning when compiling
> > documentation (e.g. `make htmldocs`). Replaces tabs with spaces and add=
s
> > a literal block to keep vertical formatting of the
> > example power state list.
> >
> > Signed-off-by: Hunter Chasens <hunter.chasens18@ncf.edu>
>
> Reviewed-by: Lijo Lazar <lijo.lazar@amd.com>
>
> Thanks,
> Lijo
>
> > ---
> >   drivers/gpu/drm/amd/pm/amdgpu_pm.c | 13 +++++++------
> >   1 file changed, 7 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/pm/amdgpu_pm.c b/drivers/gpu/drm/amd/p=
m/amdgpu_pm.c
> > index 517b9fb4624c..576202bf64f3 100644
> > --- a/drivers/gpu/drm/amd/pm/amdgpu_pm.c
> > +++ b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
> > @@ -989,12 +989,13 @@ static ssize_t amdgpu_get_pp_features(struct devi=
ce *dev,
> >    * Reading back the files will show you the available power levels wi=
thin
> >    * the power state and the clock information for those levels. If dee=
p sleep is
> >    * applied to a clock, the level will be denoted by a special level '=
S:'
> > - * E.g.,
> > - *   S: 19Mhz *
> > - *   0: 615Mhz
> > - *   1: 800Mhz
> > - *   2: 888Mhz
> > - *   3: 1000Mhz
> > + * E.g., ::
> > + *
> > + *  S: 19Mhz *
> > + *  0: 615Mhz
> > + *  1: 800Mhz
> > + *  2: 888Mhz
> > + *  3: 1000Mhz
> >    *
> >    *
> >    * To manually adjust these states, first select manual using
