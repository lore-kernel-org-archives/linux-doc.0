Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB8C3DE425
	for <linux-doc@vger.kernel.org>; Wed,  6 May 2026 08:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778056676; cv=pass; b=oxvj/Nii3fLomK5h5sfIJSC91C5VnOqwg0VW7usWCZOIqGH4oRvkAP5lYNjiBPTFbNpPMENK0e/rjCf5r/nv0gYmMZ3Dm4O1uNeWEnlK45UUwH0dxh6W4SbtGm6Wa2MKAcUuyVHIZwvAgrQHTF25rXlVpW2Uow4+WP0wq00xjVE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778056676; c=relaxed/simple;
	bh=BQ/L1Adqk6o4OdG6nxv5nzheitk/VkCmyj3eyJlGF/c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IpGwccpYtd3t/3qrs7HkvgGX7n7lmOseph3Iub6h9NgrZOceyYTQFnbxRkCxSIXtJmjqM7j3V3GmUQm7jgiEA30T0dUk5cYsH5a+uH3MeEkPYI188woHNGwLPJaY9mP+LkLv5ue6iExjj5Pq7BUi8M3T3MbQLV94h11U4q9lU1Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OUCtbXAI; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=TD9P15l1; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OUCtbXAI";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="TD9P15l1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778056672;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IMA+C0TJi4LM3UTvwkCroeu4Tv8AgJe8bHK3v1p/l2E=;
	b=OUCtbXAIom0lydhN+lO9z+XtYHlZR6wu9cdq5HmSfK7CnJmXsciTN8Z3v02qLumj4DI2id
	OFfliZaXwRqboOidSL8DG8FSq3zIeVC+zGqsDIcr5AbjoaZn8D+b1L/0E0TUJhM4l78YbY
	/rSWyMCExd/9MblSpzuuY17E1n7ino4=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-371-EqFqsQeZNTSfLE8ELpB4DQ-1; Wed, 06 May 2026 04:37:51 -0400
X-MC-Unique: EqFqsQeZNTSfLE8ELpB4DQ-1
X-Mimecast-MFC-AGG-ID: EqFqsQeZNTSfLE8ELpB4DQ_1778056670
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-7bd49a24683so142079217b3.3
        for <linux-doc@vger.kernel.org>; Wed, 06 May 2026 01:37:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778056670; cv=none;
        d=google.com; s=arc-20240605;
        b=OJxdWjly1d4oKNhJ3iViYT8VKJylacUqYzD6Nm0miQuTffRxSJmB5FCuPNrsvckNdl
         ptrGLkfOOP8N8SuIObEbxrEKCZRL+k4UkqaKd2ttemBPpFd13rhUX/PnUUDgZ+TQypyS
         Ls3LANG4w3Ga4BHiUog3jgOIqZ3rrxURUhg88AVrLP8FiGCgCXBNRnpuWtT10cePb2FB
         CjPDE1ofUumq8i+L9fYdMWRmXqm9wEp26FeL5br4xnSYQxKvi61HMj7Fx+I+8diFnfwF
         MlUm/mIwCgFl4/KRLHShVeUxXnhdlvambZWrRNnXBdC+ShtOzLi3E8VeCcbOMljV239Y
         0K5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IMA+C0TJi4LM3UTvwkCroeu4Tv8AgJe8bHK3v1p/l2E=;
        fh=o/RCUo91DXdliqRWGgpVR71WxdLGlNsuMN3FPMErS6s=;
        b=Bk/J+bHF80TZGWj9fP/VZn95wZ0O2d1Nk6uxNpajV4IG6lt9iNrO3CJ7ggjWfyXrbZ
         1ECsBYmWHbLacuThahZyIZHvZNcn26GkCcERsOZ0eHtn/MUVtV6YAKMuo0OHRB874Ate
         bMbotNhho3e/theKrxdvXFFEZ6P1IIPTUikc16oaP7bYBF/dlqddf2+4PlKx3NiJi+2U
         HLpA52zcX1syC1nRxP29hO2/BY2+V3uHIeEYrvW74/hHnOMEuViRP0k08B5Ey+08HM9k
         bofuQQ8g7E690xpSgY4VtR7E2hmM/tERTjH4zwTZu816eCNSKEXZnZk1VOxYAfMgE08m
         fsIQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1778056670; x=1778661470; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IMA+C0TJi4LM3UTvwkCroeu4Tv8AgJe8bHK3v1p/l2E=;
        b=TD9P15l1ROTyURydBJ4R92GsG2crGWwJkzYBvRLVACF97Sj+m07fa4Pl/NxCUZM32A
         ov40m9JuAbs7Di15LYBMUkbnliutrgieUbhml1Hg7wT9UUunJ9Sv2FXpI8/kUjMVJmwd
         H2lccH89lvr9s0lAvpwbf2bNr1xd7JHanh87sJkGHNxLggZ3PBy3ZqQAOFtH03wcyuBR
         G38KItKk8HZx/AaJmO44lIz27gpLAIqRscjkIz/vxyhKdpnUWnosqovbs2A38vPjNYDY
         d04jYGQIXc5zkpCbT38ugrPmoZZ/joGkjvKM+Sgg1Z9PdXJcdcmPtRPDF6Bz6SLMvoCL
         l+6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778056670; x=1778661470;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IMA+C0TJi4LM3UTvwkCroeu4Tv8AgJe8bHK3v1p/l2E=;
        b=M+F0tbZYiwdIFSJkLVpDgyHAVPzjMJOVt7c/DN+su9CQceWgKl3AuNzP1HwBRH6Sep
         QRfXNJICBh9/v6AvL/Yot3Y3lcPI46huz5e2ZO+LToe65oF9jUD8IweY79xj8o4ii0o7
         iOJpleX9cdZGPHPHRSFx8Ryldh1vyBB83OmuThue8j/NZe19h1yj9C7u6nJwswB5eIfU
         r9snzT1Su4xmpNgstCW+l3Xm8mGL6HMzSHNxqAJNr+GehHPvwSst9cMJc/M3PG/YJuNK
         pGWNafjRBoSvBnnNyDJpAPMUQNQYyuyIU2VwKF6XhRpT4/KsXZvMBBR1Q58QU7lCmGJn
         HW6w==
X-Forwarded-Encrypted: i=1; AFNElJ8VRPjriXU6JF+r19dwR/K7SKCHvE2Cc5nA0yG9kBwcV/9CH0otaskhONVdpKrvhk5u1RUXYZr3z4c=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTTPB36YhASMblWMWCzjY2D2OevFpLpUDEI7jzmznTpI5ey8oc
	OWStTVGADRYhMqKcMjpwmGCNh3VMf0e4gC3bGucTCpcucBBfH4jdnbzulgXbcIAcrAQsdDLj02x
	3F6Gapa7oLEOuBnFEGVy6cTMxQhH/s88ylrMJGYTfyoKveLUr1W6IoznYAknXwoEhzQ2JV0BUOQ
	yC+dLqwNQP8ocJQGuTlov+m7LvdupXE4kkMC2U
X-Gm-Gg: AeBDieuSAZl1ZC7NQN0y+e/2E5stsh8+m5XqW/432HOHy4B9bP6SKe9tnrh/VTYVtAn
	QY76nkZIqqzmcWP5aIOuOfZ3pfjI5+r14f2QTcqTstnwcxQm0KbAVKoSHHwcprO9rs/1HHvHl1J
	3kpTQVJVOvfF9dcgpcm1CSex6KL7jk9lVQXg0B06RgANDuWooJrfJhI6Vf8L5CtiKPpBYKgAHER
	b1523CEFZfS/Hfp
X-Received: by 2002:a05:690c:60c3:b0:7bd:696d:5137 with SMTP id 00721157ae682-7bdf5eb872emr28070057b3.41.1778056670493;
        Wed, 06 May 2026 01:37:50 -0700 (PDT)
X-Received: by 2002:a05:690c:60c3:b0:7bd:696d:5137 with SMTP id
 00721157ae682-7bdf5eb872emr28069617b3.41.1778056670063; Wed, 06 May 2026
 01:37:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504-kunit_add_support-v8-0-3e5957cdd235@redhat.com>
 <20260504-kunit_add_support-v8-3-3e5957cdd235@redhat.com> <20260504-tentacled-free-lobster-38d8d9@houat>
In-Reply-To: <20260504-tentacled-free-lobster-38d8d9@houat>
From: Albert Esteve <aesteve@redhat.com>
Date: Wed, 6 May 2026 10:37:39 +0200
X-Gm-Features: AVHnY4LGPM5httthyZYEMeSVpsAZZGIetxyr0Irj5BEH6JEFnHV4PP6tgxL43VM
Message-ID: <CADSE00+TPGWPjD7DGHy5f+=QzwUqYHc=X-G1sEER8=NS5VvV-Q@mail.gmail.com>
Subject: Re: [PATCH v8 3/4] drm: Suppress intentional warning backtraces in
 scaling unit tests
To: Maxime Ripard <mripard@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Brendan Higgins <brendan.higgins@linux.dev>, 
	David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	dri-devel@lists.freedesktop.org, workflows@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org, 
	peterz@infradead.org, Guenter Roeck <linux@roeck-us.net>, 
	Linux Kernel Functional Testing <lkft@linaro.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	=?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Alessandro Carminati <acarmina@redhat.com>, Simona Vetter <simona.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 4, 2026 at 12:04=E2=80=AFPM Maxime Ripard <mripard@kernel.org> =
wrote:
>
> Hi,
>
> On Mon, May 04, 2026 at 09:41:27AM +0200, Albert Esteve wrote:
> > From: Guenter Roeck <linux@roeck-us.net>
> >
> > The drm_test_rect_calc_hscale and drm_test_rect_calc_vscale unit tests
> > intentionally trigger warning backtraces by providing bad parameters to
> > the tested functions. What is tested is the return value, not the exist=
ence
> > of a warning backtrace. Suppress the backtraces to avoid clogging the
> > kernel log and distraction from real problems.
> >
> > Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
> > Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
> > Acked-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: David Airlie <airlied@gmail.com>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> > Signed-off-by: Alessandro Carminati <acarmina@redhat.com>
> > Acked-by: David Gow <david@davidgow.net>
> > Signed-off-by: Albert Esteve <aesteve@redhat.com>
> > ---
> >  drivers/gpu/drm/tests/drm_rect_test.c | 23 +++++++++++++++++++----
> >  1 file changed, 19 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/tests/drm_rect_test.c b/drivers/gpu/drm/te=
sts/drm_rect_test.c
> > index 17e1f34b76101..818e16e80c8f9 100644
> > --- a/drivers/gpu/drm/tests/drm_rect_test.c
> > +++ b/drivers/gpu/drm/tests/drm_rect_test.c
> > @@ -409,8 +409,16 @@ static void drm_test_rect_calc_hscale(struct kunit=
 *test)
> >       const struct drm_rect_scale_case *params =3D test->param_value;
> >       int scaling_factor;
> >
> > -     scaling_factor =3D drm_rect_calc_hscale(&params->src, &params->ds=
t,
> > -                                           params->min_range, params->=
max_range);
> > +     /*
> > +      * drm_rect_calc_hscale() generates a warning backtrace whenever =
bad
> > +      * parameters are passed to it. This affects all unit tests with =
an
> > +      * error code in expected_scaling_factor.
> > +      */
> > +     kunit_warning_suppress(test) {
> > +             scaling_factor =3D drm_rect_calc_hscale(&params->src, &pa=
rams->dst,
> > +                                                   params->min_range,
> > +                                                   params->max_range);
> > +     }
> >
> >       KUNIT_EXPECT_EQ(test, scaling_factor, params->expected_scaling_fa=
ctor);
> >  }
> > @@ -420,8 +428,15 @@ static void drm_test_rect_calc_vscale(struct kunit=
 *test)
> >       const struct drm_rect_scale_case *params =3D test->param_value;
> >       int scaling_factor;
> >
> > -     scaling_factor =3D drm_rect_calc_vscale(&params->src, &params->ds=
t,
> > -                                           params->min_range, params->=
max_range);
> > +     /*
> > +      * drm_rect_calc_vscale() generates a warning backtrace whenever =
bad
> > +      * parameters are passed to it. This affects all unit tests with =
an
> > +      * error code in expected_scaling_factor.
> > +      */
> > +     kunit_warning_suppress(test) {
> > +             scaling_factor =3D drm_rect_calc_vscale(&params->src, &pa=
rams->dst,
> > +                                                   params->min_range, =
params->max_range);
> > +     }
> >
> >       KUNIT_EXPECT_EQ(test, scaling_factor, params->expected_scaling_fa=
ctor);
> >  }
>
> For both I think we should add KUNIT_EXPECT_SUPPRESSED_WARNING_COUNT call=
s, no?

Hi Maxime,

It may indeed add verification value by ensuring the call actually
generates the expected warning.

The original patch did not include count checks on the version I
inherited it from (i.e.,
https://lore.kernel.org/all/20250526132755.166150-5-acarmina@redhat.com/),
so I kept the same approach while adapting to the API changes. That
said, the check is simple to add, so I could include it in the next
version.

BR,
Albert

>
> Maxime

