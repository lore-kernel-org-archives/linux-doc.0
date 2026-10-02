Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED3C496D3B
	for <linux-doc@vger.kernel.org>; Fri,  2 Oct 2026 13:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790948934; cv=pass; b=c+R8C2fD/9HCWIAmHwHKvVuxPMRZQHeodf3EbjA1m6wXbJqv57HTwfFy4ZTb+Y1TT7cjubLHRxkbsi/vksjeOh1F8lPDOQr4EfNYsKC6/mGLqUm+TVgrIP4hTUwU4V50m+tNBdeJTd/nUEUGx+OMQjVTPuyIJo+po1QskvvF5zg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790948934; c=relaxed/simple;
	bh=BHyLO35Wvhtr+fFgyTIl6B//zGulC8gMPyhU4qmkt4U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ieugr47TyKPGPzePXJze/+8H+O3A5PL7+ul6edypdyQ4HVRBQhhXVN2yEaesNRgMFJdILUaiNjIuvKKjTJEsEeRUDSTSwmENPVxkuH6crSwu8I4MuhyidEKUdn0tI5mxQWqe6PVylBcRaWx5cgGZQfudq9jMUXaFS6O7sdHWg6k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GqYNLp2R; arc=pass smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GqYNLp2R"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33e79c06622so864983eec.3
        for <linux-doc@vger.kernel.org>; Fri, 02 Oct 2026 06:48:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790948932; cv=none;
        d=google.com; s=arc-20260327;
        b=HYOTHx/KtZyTHGR/s8Ued3xXDP2rLH+7PaohQm8UQFuTVOjpqgmEUrcWWxd+aYjtJf
         Lo37AUkN9NMZRBIyiHrlNrC+M8aRQm0NUv3yUs5X+ECISia6QnaZ5DtSeZDlNvoa0gJw
         zwunVji8d+ztbHekiu1Qy7G1e1J9zYPOW7YFjYQXg3KF2Ftsx5oq+8lenPo7Gxyb0wij
         i3B2Walk9scr73dXCUDPpNsfggya1wao8rbZ9i3fWFXjZqGQWejpQJJ+Shu/eOBNuHWC
         pM2tctf04mNkMa57KgBaSl3v9BgZDHv99ENikCbBJ8dnKqekM6+518p9UithlbsK45so
         f4Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=J2DKjRlAzAFGq6y1KL+4ocbnmqLb/iUOft+MhA4fQgo=;
        fh=tQBDCcyz7lq/GKL1s7J3KpNtLnb8cyjBWkIAJ7igtzk=;
        b=cOae0A0Mht35pcvaGUUrFuxhy7y9h+kIyi3ZmmgYDBDTuagEj9v/t70TCXaGo56RvT
         mVETxHHwza7xo6rmtth1tIhY/7SIfLuRPstKP/Bgg5boxIewZZxl/ZGNm/B8LU7weKJm
         3te0L3ibL6KY765DGpy3DxsSIC19U2q8POHjrdyhx6klkopv0YJn/7aeVfobc9yi2koE
         BterNOYnk7Gs4L2UNN7fxIw2L0TzaEsS2mosqzUMipHfSQACdFAuCQ5cIXm6xU5quTYZ
         YB5sacAtD+g6ydKeLSzM42ZvFC3ybGgLOuQligPMJOrBQZn8aBdfJJLlN+byAvbnFnQ+
         La4A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790948932; x=1791553732; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J2DKjRlAzAFGq6y1KL+4ocbnmqLb/iUOft+MhA4fQgo=;
        b=GqYNLp2RKWTo0cWl9l9Fn5M6H8XioY0LRrAsWE5rysFZp4UN/l3tTUdN35+nnOrCtg
         LQ/ENq6t4QpvnoHLTSlGT+iMV1s9SHIOEbglT2+3wGGNi5M8lg6vBSP9rEaEWjevfeaX
         4cm9chhnc0dmYH8/Ifl4ALDYIlDUneSFzEppjl9ow1QDMsbLbbpfk2oSAGKm/ap1LOUP
         Jc4LiLqr2pf8v5Y41QSFdw64YMrfyLbnL3kBSNwef/kSAojE5xduBV6JbRl+kJq1KjD/
         tJc44+GJ1oG2xNS8oFGRNs0hqCTTaEWnmQPUFIapKl3iYVpmNryLSaoTmvvbNo4QUGh8
         pgHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790948932; x=1791553732;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J2DKjRlAzAFGq6y1KL+4ocbnmqLb/iUOft+MhA4fQgo=;
        b=IDuNNGoqYkJl+hSm+IX8yLOyyvEw0rQaNT5CQyDMtHAE2Y8B5uyLeQGirnyqTCjuhz
         DXLKSCHwxeqRSWVIeO1TUzxMWcBB31e3TQyLmiucpXa/euR5vjw/ISXWB3D4Q8pfFDaw
         GvgWHUS5nst9ZISQB+AcMn6Bv8lzkw5HYdY4Dc0131HaQNBEEiQ2QukGBwu/bF4NK/71
         fyamv16Gi9BhFQoxc2JRnQfoP5xKlccf93ZocY/z0FshCIXDrPLX25X5ofCvAlQQZEE7
         FBik9LQ1wA1ZuOfz5T16KWsvSTChOoBcdEk33opG0TRMCIw3mA0nq7pXXMMyoOfpFPfk
         xMow==
X-Forwarded-Encrypted: i=1; AKwUvBxFziMv3XRLBZIvz+MpIyt+FbGcaHYYhyFOITWttZXo22KM1U2kPR17g07LOb15rXLbtlZtpuJI4oU=@vger.kernel.org
X-Gm-Message-State: AFuF++nJbztYZe0mXqNpJBKJxp2alrW2OrgnT01MlVuIacU5oCtshcAO
	AoFU8fH3PQa4JkY8ios7I+7DASM5mwKDJcWpQoW72DEZhBvLLykqINNlpjcfO6EXwXpitTTFS2L
	gerZGnOCqNOaf5/LH9hUlul70YFtHw5g=
X-Gm-Gg: AYBFou0aC/aA11e8wgK9jO3VzHiJTsENxiuIi5dcyHh4oPdjz1/+jVuoAAiaEpgAxER
	ok6qYPxoGe/fj8mDRVKy7udIKVDmGdxvb8JdaTG/T79LTS+RCSX2T0USeJoUFYIkFOA6R7CXaib
	7XDzJt6Baf7XxtbBZx3PE5Y4mL7Dfbvh+/ZpqTQKqYntlJZR+JOhbcmxuGB85iuEy9qMUtht05W
	8ewqk9KEnulfVbHCS9lHzjXkuPAKXySbq2wZ1CdvUFpCLklH8yN3ZLy2V8DUMAjYFIQMkXpw55h
	ohZwu5puJIPocxoghrhWqoRaXJe69dRSLrH1DS+ezQRRtlC5ABaRSR/u1DZuzXppUrrNHivNl87
	AGTrfDzovHJY8WMLQiJJzscnuvLwTN8En4vTcfML95XQNkKMlYNMaDRpE6RiLm0M=
X-Received: by 2002:a05:701b:4550:10b0:143:8212:a43 with SMTP id
 a92af1059eb24-14f5a93aa43mr4045234c88.1.1790948931622; Fri, 02 Oct 2026
 06:48:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907-visibility-unification-v1-0-6a962e5b3351@redhat.com>
 <CADnq5_MZZje5XGfYgJ1v4Ts_k+ZyyBtSrSqB5upTEt+AqBi9Yg@mail.gmail.com> <CADSE00L=KGCXqpjm3aiOQ-JwzirXTrvVsd-mNXpb9QDggVs=pw@mail.gmail.com>
In-Reply-To: <CADSE00L=KGCXqpjm3aiOQ-JwzirXTrvVsd-mNXpb9QDggVs=pw@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 2 Oct 2026 09:48:39 -0400
X-Gm-Features: AclHuK9HlnwREQSprOE2OEafwiRXDdiofJf8sSV8e9OU00tSYzj35_B2cG2A_YM
Message-ID: <CADnq5_PEun0nB3in17GyBSy2qSF_fWf=40-m2csv=9f1rmr5XA@mail.gmail.com>
Subject: Re: [PATCH 0/3] drm/amd/display: use kunit/visibility.h for test helpers
To: Albert Esteve <aesteve@redhat.com>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
	Rodrigo Siqueira <siqueira@igalia.com>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Maxime Ripard <mripard@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 2, 2026 at 9:46=E2=80=AFAM Albert Esteve <aesteve@redhat.com> w=
rote:
>
> On Fri, Oct 2, 2026 at 3:34=E2=80=AFPM Alex Deucher <alexdeucher@gmail.co=
m> wrote:
> >
> > On Mon, Sep 7, 2026 at 9:45=E2=80=AFAM Albert Esteve <aesteve@redhat.co=
m> wrote:
> > >
> > > amdgpu_dm grew its own STATIC_IFN_KUNIT / EXPORT_IF_KUNIT /
> > > INLINE_IFN_KUNIT macros instead of using kunit/visibility.h. This
> > > series switches the KUnit helpers over to the common API.
> > >
> > > VISIBLE_IF_KUNIT is gated on CONFIG_KUNIT rather than
> > > CONFIG_DRM_AMD_DC_KUNIT_TEST, so the helpers are non-static whenever
> > > KUnit is enabled. EXPORT_SYMBOL_IF_KUNIT places the symbols in the
> > > EXPORTED_FOR_KUNIT_TESTING namespace; the AMD DC test files import
> > > that namespace with MODULE_IMPORT_NS().
> > >
> > > INLINE_IFN_KUNIT is dropped rather than generalized. It was only used
> > > on amdgpu_dm_fixpt_from_s3132(), inverted the original static inline,
> > > and is unnecessary for tests in another translation unit.
> > >
> > > Tested with:
> > >   ./tools/testing/kunit/kunit.py run --arch=3Dx86_64 \
> > >     --kunitconfig=3Ddrivers/gpu/drm/amd/display/amdgpu_dm/tests
> > >
> > > (CONFIG_GCOV omitted; it is not available on x86_64.)
> > >
> > > Suggested-by: Maxime Ripard <mripard@kernel.org>
> > >
> > > Signed-off-by: Albert Esteve <aesteve@redhat.com>
> >
> > I've reverted this series.  It breaks the build when CONFIG_KUNIT=3Dy a=
nd
> > CONFIG_DRM_AMD_DC_KUNIT_TEST=3Dn. When CONFIG_KUNIT=3Dy,
> > the functions are not static, but when CONFIG_DRM_AMD_DC_KUNIT_TEST=3Dn=
,
> > they should be, resulting in build errors.
>
> Oops! I'm very sorry. What's the procedure now? I see you posted a
> series containing the revert. Can I send another version of this
> series after that lands to fix it?

Yes, that would be fine.

Alex

>
> BR,
> Albert.
>
> >
> > Alex
> >
> > > ---
> > > Albert Esteve (3):
> > >       drm/amd/display: replace STATIC_IFN_KUNIT with VISIBLE_IF_KUNIT
> > >       drm/amd/display: replace EXPORT_IF_KUNIT with EXPORT_SYMBOL_IF_=
KUNIT
> > >       drm/amd/display: drop INLINE_IFN_KUNIT
> > >
> > >  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  79 ++++-----
> > >  .../drm/amd/display/amdgpu_dm/amdgpu_dm_audio.c    |  26 +--
> > >  .../amd/display/amdgpu_dm/amdgpu_dm_backlight.c    |  74 ++++----
> > >  .../drm/amd/display/amdgpu_dm/amdgpu_dm_color.c    | 133 +++++++----=
----
> > >  .../drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c  |  12 +-
> > >  .../amd/display/amdgpu_dm/amdgpu_dm_connector.c    | 190 ++++++++++-=
----------
> > >  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c  |  38 ++---
> > >  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c |  52 +++---
> > >  .../drm/amd/display/amdgpu_dm/amdgpu_dm_cursor.c   |  10 +-
> > >  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_dmub.c |  30 ++--
> > >  .../drm/amd/display/amdgpu_dm/amdgpu_dm_freesync.c |  10 +-
> > >  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c | 105 ++++++-----=
-
> > >  .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  | 140 +++++++----=
----
> > >  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c  | 146 ++++++++---=
-----
> > >  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_ism.c  |  40 ++---
> > >  .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |  60 +++----
> > >  .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c    | 104 +++++------
> > >  .../drm/amd/display/amdgpu_dm/amdgpu_dm_pp_smu.c   | 116 ++++++-----=
--
> > >  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c  |  22 +--
> > >  .../drm/amd/display/amdgpu_dm/amdgpu_dm_quirks.c   |   4 +-
> > >  .../drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c   |   9 +-
> > >  .../drm/amd/display/amdgpu_dm/amdgpu_dm_services.c |  10 +-
> > >  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c   |  18 +-
> > >  .../display/amdgpu_dm/tests/amdgpu_dm_audio_test.c |   1 +
> > >  .../amdgpu_dm/tests/amdgpu_dm_backlight_test.c     |   1 +
> > >  .../display/amdgpu_dm/tests/amdgpu_dm_color_test.c |   1 +
> > >  .../amdgpu_dm/tests/amdgpu_dm_colorop_test.c       |   1 +
> > >  .../amdgpu_dm/tests/amdgpu_dm_connector_test.c     |   1 +
> > >  .../display/amdgpu_dm/tests/amdgpu_dm_crc_test.c   |   1 +
> > >  .../display/amdgpu_dm/tests/amdgpu_dm_crtc_test.c  |   1 +
> > >  .../amdgpu_dm/tests/amdgpu_dm_cursor_test.c        |   1 +
> > >  .../display/amdgpu_dm/tests/amdgpu_dm_dmub_test.c  |   1 +
> > >  .../amdgpu_dm/tests/amdgpu_dm_freesync_test.c      |   1 +
> > >  .../display/amdgpu_dm/tests/amdgpu_dm_hdcp_test.c  |   1 +
> > >  .../amdgpu_dm/tests/amdgpu_dm_helpers_test.c       |   1 +
> > >  .../display/amdgpu_dm/tests/amdgpu_dm_irq_test.c   |   1 +
> > >  .../display/amdgpu_dm/tests/amdgpu_dm_ism_test.c   |   1 +
> > >  .../amdgpu_dm/tests/amdgpu_dm_kunit_helpers.c      |   1 +
> > >  .../amdgpu_dm/tests/amdgpu_dm_mst_types_test.c     |   1 +
> > >  .../display/amdgpu_dm/tests/amdgpu_dm_plane_test.c |   1 +
> > >  .../amdgpu_dm/tests/amdgpu_dm_pp_smu_test.c        |   1 +
> > >  .../display/amdgpu_dm/tests/amdgpu_dm_psr_test.c   |   1 +
> > >  .../amdgpu_dm/tests/amdgpu_dm_quirks_test.c        |   1 +
> > >  .../amdgpu_dm/tests/amdgpu_dm_replay_test.c        |   1 +
> > >  .../amdgpu_dm/tests/amdgpu_dm_services_test.c      |   1 +
> > >  .../amd/display/amdgpu_dm/tests/amdgpu_dm_test.c   |   1 +
> > >  .../display/amdgpu_dm/tests/amdgpu_dm_wb_test.c    |   1 +
> > >  drivers/gpu/drm/amd/display/dc/core/dc_sink.c      |   6 +-
> > >  drivers/gpu/drm/amd/display/dc/core/dc_stream.c    |   2 +-
> > >  drivers/gpu/drm/amd/display/dc/dm_helpers.h        |  13 +-
> > >  tools/lib/python/kdoc/xforms_lists.py              |   3 +-
> > >  51 files changed, 748 insertions(+), 728 deletions(-)
> > > ---
> > > base-commit: bc35965f6940a9bf834d54187b6088b8eb09206d
> > > change-id: 20260907-visibility-unification-fd358c580447
> > >
> > > Best regards,
> > > --
> > > Albert Esteve <aesteve@redhat.com>
> > >
> >
>
