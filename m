Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0422D63E5
	for <linux-doc@vger.kernel.org>; Fri, 24 Apr 2026 07:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777015043; cv=pass; b=AQUR1eWARGJ+FCTnGZHpftpa4K01J9iq6aXEqKdl8nKzFbpE7cG75MOIMZiy43kf8aNewi3sy36galdwGM9WKT59aLDFm8jI+kB9UoMIAUkwnbOcMfdKmqReDXSYWk40sr6MN+Dy+1zJ6Ttw38H4xnLnvboujTPLAq9yt29fZ04=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777015043; c=relaxed/simple;
	bh=yClHRF8OjhIxck88Jx+vYcQmNKKejUFC6AKG1u3nJUk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N3yBTIdq0WW2pS23CB+rf7cBptwok9Me+zieoVWr717QvjOa2KhDpVZ0CyQYo70mhB6frHg7JoNDX5QAqDEpgkrUBaEzfdVh23Gu8W0d6Y/nu4P80QRRUIfjqnuDt3R4Xal55vOkvDu+U6tPwN97+fK1R2HVRW3sYbWhnldSU8s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WBilzT/1; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=RYGFxIrY; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WBilzT/1";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="RYGFxIrY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777015039;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ocRQwsGxmUd24plQscvID6P4Yrryzt44ghQQY2RzSsk=;
	b=WBilzT/1/BLIvMDu9bNMuHsHK2zo5+CmDwL02svO12ZZ3uJzPqcrFiBhJLkZO/lm9oKnAQ
	eAUCnfdLO8sBOg8PcGXKQ0iv3RvQ2cuMFcksm8hD8d+w/gZm9+1ar9n8G4ujM2ps9QqIb2
	OQa8+7wSPO7HupwcElDJZ+1M+U19ChI=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-116-j1VDswV9N7OSxR8VMt8t1A-1; Fri, 24 Apr 2026 03:17:18 -0400
X-MC-Unique: j1VDswV9N7OSxR8VMt8t1A-1
X-Mimecast-MFC-AGG-ID: j1VDswV9N7OSxR8VMt8t1A_1777015038
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-7b7e80f7a8bso85455527b3.3
        for <linux-doc@vger.kernel.org>; Fri, 24 Apr 2026 00:17:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777015038; cv=none;
        d=google.com; s=arc-20240605;
        b=PK0ib67ibLtJRS98Q/OPjy8hDIN8z01AlpGX11CNI6CpMTdvEd39qcJqDsVmXMjZ12
         IEgRE2+003Rjcn+pNx36cP4gzlwkSo7xD7XsxgFJDg8v+NgfDsLm05vHLj2U7IH0bSVw
         M0ufwGkouaBxDMPTtoInvg6klV3gITI9fs/9zAQSw2gnqRETkfL3QLuMx/m6rhS1Lz3K
         vvuFzh4Rx5J9Fxu/znoIhGoApSaTogXRnGrWMH9anMEsOlgIvfhwHgDLCYtQghPXVYOd
         g68lK3koPvp/KcTFGtn5cdYnirxjzuTSOu6QbApv2YvMJvgCRoIyK2v7dsQEfDuXHEsj
         8lWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ocRQwsGxmUd24plQscvID6P4Yrryzt44ghQQY2RzSsk=;
        fh=kZy967isTQoFbMBnUgpvbw7mrDsj1SsWatLsHykiB/E=;
        b=jPMf137x1UVEjaqLBfvBZer9WFjxE6758Dr4p9C38mqYjdRB+gwjRsa+H+HiSleFUs
         ysJFcAm/sQk2hOdD71y3O2zykIVxJYhN8keqIYKHrlbA4ZAp9eY2HS7QJ81n23Y6DMyH
         AeryYQ6S5lT4biBzJjgT6sIVWHtF43kT7SxvsoLk+ZJReb/S6hb3SWPz86emMhyL/XFR
         uArKNRNfQLhMS88pw1aqjip1ptMeCxMzO5q4HvVLZlj7oCYUaogkP3Xs89Ix+NXRTJME
         2cExJgdEv2ngzFJqlwsEgajwMcS836TwcKvLy6vhT0Bq3Rg5Hejp6/owNBqaXqRfQYcV
         Kiog==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1777015038; x=1777619838; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ocRQwsGxmUd24plQscvID6P4Yrryzt44ghQQY2RzSsk=;
        b=RYGFxIrYmkdPH5H6sCnbRVAiE21g7fScoKvsLDZjrODthL/MNFbzmR0zDYAz4D0JEU
         3VF8Ypl6Xua84ndVEP9DtGOKMuIDvDY+BgSIX7cB/ExtidMYVDyzplilORHQreGfdIoG
         uprang6fhniPd7CGuEpa+tcq8zU42mmV7eQMpQZEaZM6yBkUBjb+svkh8Zlyu5XtjJiE
         RXhVE+99TjOvYdQ5QTZgyUM8S2G/e4kVe6PPDB/ny0/QMLfjGC4CqGGqPNGbDR2hQsns
         DQaBpYjDwFDqhp80jX4gI58zrf250ID6XU3o/mULjqqz3JZ8Cjn/3fXNBHDrW7wmyRvx
         vv6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777015038; x=1777619838;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ocRQwsGxmUd24plQscvID6P4Yrryzt44ghQQY2RzSsk=;
        b=epOUuMOGRZBl1JVNq8qzqe8Mtx2fE8d5KOSwf3Ca7iaSmBvY0sqmGmgI6YZQ++FxQ9
         T/vrdko9pCoAIK0w802ZO8E5R/NyMKBwH+so2RGqBC7md2L60KdDkHlKG3MBZ6I9QS+P
         5x+lMhsuViDRE1s8shkyUjwib3ollJjd//zDoa/ksHRaLPXwfqj63XeScDkpfWYPp/GK
         Ulk8VEzr6uu75zUrv4JnfEKcP6AZqIeZKKDfYU95jEkAc9iw4yXsoBri8r1o/ty3E9kC
         g4eBYuDxt6sr6EGdrCb0owiPVPXVVrERKyix8lotZDbtUNViQAubz7tcyZ7dxNVyZ6bC
         n8cQ==
X-Forwarded-Encrypted: i=1; AFNElJ+yZxtICHbz8T49RCcpAVkhEpULSJ1pX6RHLzAMKwhQ1V1ff/J+bN+dfJjcuLUzKvgVUIRnmpP3t6U=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvfspsntE+AgvO42CUOmugIzli4q0wl+nxAO+cXq+jLNdWOobl
	zzsmCiZyQZ6P53Yr+7TrJitMdauZqt9+ziNtxuOyMFev5606q5bmxhwCkXR7fjM5XTFhFkMMfq2
	stIt1t2XfVWvMY5Skrdq7iraAWKQY57QMC4pnluN6n1rbvrUNMsLDxWbnDyu2/ev4iSxuA6Xwun
	PeECTtUfc54Wee2Vi1V0UpLyssZHE5ciVlEHX5
X-Gm-Gg: AeBDiesRCFODCkLSnHTjp4jibJuMdQseYO018M+OG0oUra2dI3tHuUmMbEGNqg66rtb
	iLF+f8f7+xVfRY0Q/xnO+XntnChq+2whLjImTLHosmJDzKzBl15/Z5IhYDf0Ns2FvaYVFQ6C0pZ
	V7HBBm5P1feVt4t/OJaFZfr2drYtMvQNLLd3t3GkxqQx7WMLxKtp1E2nVCoPrrpqj0X1YFZoLfF
	7JHm8Ge9IOzrsDq
X-Received: by 2002:a05:690c:2701:b0:79b:cf31:9767 with SMTP id 00721157ae682-7b9ece638bbmr313691527b3.3.1777015037638;
        Fri, 24 Apr 2026 00:17:17 -0700 (PDT)
X-Received: by 2002:a05:690c:2701:b0:79b:cf31:9767 with SMTP id
 00721157ae682-7b9ece638bbmr313691117b3.3.1777015037197; Fri, 24 Apr 2026
 00:17:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260420-kunit_add_support-v7-0-e8bc6e0f70de@redhat.com>
 <20260420-kunit_add_support-v7-4-e8bc6e0f70de@redhat.com> <20260420144702.GM3102624@noisy.programming.kicks-ass.net>
 <CADSE00JJq6fsYbkFN5hBD=-ZWsFG9p4_C55fp3MupMJQj0QCUQ@mail.gmail.com> <8a9c125c08206296d698c79c3d3dd6aea36a7e3b@intel.com>
In-Reply-To: <8a9c125c08206296d698c79c3d3dd6aea36a7e3b@intel.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Fri, 24 Apr 2026 09:17:05 +0200
X-Gm-Features: AQROBzD6yZWbejVMF7ldH8G24-m4djSD1N4zfjIlQ_Qh0r0EH3w2r9AAFZGj5x0
Message-ID: <CADSE00+b-8moX5FkLjLs+wzyaW5dtJDMxvTT6Gu-QmDoDxJdVA@mail.gmail.com>
Subject: Re: [PATCH v7 4/5] drm: Suppress intentional warning backtraces in
 scaling unit tests
To: Jani Nikula <jani.nikula@intel.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Arnd Bergmann <arnd@arndb.de>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Rae Moar <raemoar63@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	dri-devel@lists.freedesktop.org, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>, 
	Linux Kernel Functional Testing <lkft@linaro.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	=?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Alessandro Carminati <acarmina@redhat.com>, Simona Vetter <simona.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2026 at 1:51=E2=80=AFPM Jani Nikula <jani.nikula@intel.com>=
 wrote:
>
> On Tue, 21 Apr 2026, Albert Esteve <aesteve@redhat.com> wrote:
> > On Mon, Apr 20, 2026 at 4:47=E2=80=AFPM Peter Zijlstra <peterz@infradea=
d.org> wrote:
> >>
> >> On Mon, Apr 20, 2026 at 02:28:06PM +0200, Albert Esteve wrote:
> >> > From: Guenter Roeck <linux@roeck-us.net>
> >> >
> >> > The drm_test_rect_calc_hscale and drm_test_rect_calc_vscale unit tes=
ts
> >> > intentionally trigger warning backtraces by providing bad parameters=
 to
> >> > the tested functions. What is tested is the return value, not the ex=
istence
> >> > of a warning backtrace. Suppress the backtraces to avoid clogging th=
e
> >> > kernel log and distraction from real problems.
> >> >
> >> > Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
> >> > Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
> >> > Acked-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> >> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> >> > Cc: David Airlie <airlied@gmail.com>
> >> > Cc: Daniel Vetter <daniel@ffwll.ch>
> >> > Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> >> > Signed-off-by: Alessandro Carminati <acarmina@redhat.com>
> >> > Signed-off-by: Albert Esteve <aesteve@redhat.com>
> >> > ---
> >> >  drivers/gpu/drm/tests/drm_rect_test.c | 14 ++++++++++++++
> >> >  1 file changed, 14 insertions(+)
> >> >
> >> > diff --git a/drivers/gpu/drm/tests/drm_rect_test.c b/drivers/gpu/drm=
/tests/drm_rect_test.c
> >> > index 17e1f34b76101..1dd7d819165e7 100644
> >> > --- a/drivers/gpu/drm/tests/drm_rect_test.c
> >> > +++ b/drivers/gpu/drm/tests/drm_rect_test.c
> >> > @@ -409,8 +409,15 @@ static void drm_test_rect_calc_hscale(struct ku=
nit *test)
> >> >       const struct drm_rect_scale_case *params =3D test->param_value=
;
> >> >       int scaling_factor;
> >> >
> >> > +     /*
> >> > +      * drm_rect_calc_hscale() generates a warning backtrace whenev=
er bad
> >> > +      * parameters are passed to it. This affects all unit tests wi=
th an
> >> > +      * error code in expected_scaling_factor.
> >> > +      */
> >> > +     KUNIT_START_SUPPRESSED_WARNING(test);
> >> >       scaling_factor =3D drm_rect_calc_hscale(&params->src, &params-=
>dst,
> >> >                                             params->min_range, param=
s->max_range);
> >> > +     KUNIT_END_SUPPRESSED_WARNING(test);
> >>
> >> Would not something like:
> >>
> >>         scoped_kunit_suppress() {
> >>                 scaling_factor =3D drm_rect_calc_hscale(&params->src, =
&params->dst,
> >>                                                       params->min_rang=
e, params->max_range);
> >>         }
> >>
> >> be better?
> >
> > Since KUnit already has a few macros in its API it didn't occur to me.
> > Good idea, I like it. And I guess the scope approach matches well with
> > your __cleanup comment in the first patch. If no one opposes, I will
> > work toward that pattern for the next version.
>
> There's a catch with kunit and __cleanup and thus (scoped) guards. Kunit
> runs in ktreads, asserts lead to kthread_exit() and the __cleanup won't
> be called.

Hi Jani,

Good point. In this specific case, the actual cleanup is handled by
kunit_add_action_or_reset(), so __cleanup not firing on assert is
harmless.

>
> Warning suppression being part of kunit infrastructure, asserts can and
> should end the suppression too. But setting the example (scoped) guards
> are safe in kunit tests in general feels like a trap waiting to happen.
>

... but I agree it sets a misleading precedent. I'll stick with the
explicit start/end API, then? Or maybe we can clearly document why the
scoped approach is safe in this case and use it.

>
> BR,
> Jani.
>
>
> >
> >>
> >> Also, how can you stand all this screaming in the code?
> >>
> >
> > Again, KUnit already contains many macros, so this use didn't register
> > as such. Now I will not be able to unsee it.
> >
> >
>
> --
> Jani Nikula, Intel
>

