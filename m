Received: from mail-dl2-f42.google.com (mail-dl2-f42.google.com [74.125.229.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C657E36F8FE
	for <linux-doc@vger.kernel.org>; Fri,  2 Oct 2026 13:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790948091; cv=pass; b=czmLTE2wPnyC5G238uD2uU/Mhmf+ZyUTZGhmwiq7BF/EnEt1+3sKophcXYtRZvEqPEX8YoO/SNbjCHAnJmPMXGkCspAIR1Zgx2Sy3FU92HGIKEa2X/2BINgHDK1AVWicNKPzTmoafiv8gBF+ehhM7GpWQc5GybpesU7NKs0ovfg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790948091; c=relaxed/simple;
	bh=ptuql8EP/xwC8/m6AyGXvhJvfVbV+wQgTXqkQooIt/U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qj9CBo6JtpF3hxucRo57VddSeZfG0A0YoY6A09nkIkcZQU09MdHmzU5xbfEGGoJEsUbZtlT0BpUVHXAVPKc4xdN7drFWGTGycXagLfjfHdhjzLGUPmMSBO+KjdD3qQpdHUgm8SpY6ngkvlgZHJT4Hq0Zx81+Ip5uPhkjuaNvEUs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lcQ5Adeg; arc=pass smtp.client-ip=74.125.229.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lcQ5Adeg"
Received: by mail-dl2-f42.google.com with SMTP id a92af1059eb24-144ef651963so171166c88.3
        for <linux-doc@vger.kernel.org>; Fri, 02 Oct 2026 06:34:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790948086; cv=none;
        d=google.com; s=arc-20260327;
        b=abrtByM2IMAMskXX0fp74Wi57TyImC6g8aw0YBwEjYpTWXCm+VG3DYr7hX4ThC8wFu
         JpwT4Xgs/zDo/9vCUWCoYNeIQOn5r/gQePF9BOEnR7qOYLxmNBDjT/Vio3+NmOx4yHrR
         3ZjpE943Tw3JVojMAaNYS9pls76a6cSdeuSKVaHkRwi1HSN8lG1/EEWsvfBsZfCGBtTo
         ZUfeQLq73xUXs5fEzmJYlCU/Y84Ai/iO2SC8Sbl/pfRrkwcAoaQjN682eWBLdAC9hpIU
         WGpu5RMx/ro2W0pLU+T14PXyaGP3wKiAaAAg7QX8InLuCXp6qhdjKCY18r9/d6nwxYOL
         2n9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yx6G1AW+nvvITgzsA9b25EAkpoWe5JEuWuaZEwVI7YQ=;
        fh=s2Ii4R5ycJCS46GluGLNeP8n/7UDhyDCTwjv/+n+22s=;
        b=EQzZJ4yc1+FolECM6UZ6flnsMJLgo4I0RK7AYeJBYAbhsSFaUUdUjVkoe9oakkgOTQ
         WyGhEWV8dfL71eoXp5xIgJaRbn/3R9xjFuU2RUpyLDx1ywHI6XWuGKK9R1c9d/fiCYtV
         Ar8R0dYUMbHnhb6jQmu6h1Acu7IHgHHs92UggpfnI6gZPflE5lOUT9y0RgrcgQ6yf7E4
         y51dpIgaH7ElrmCN4F/85tzNzaRre7msZwiQcmN/Fx60R5y5mTIXbnB1GKgCvkWsNor1
         pLVgE7q75YovY5OmWsAjMo4y9ZlRhV+1yVT+PG40Z9pS30H2M+cdsNjsSwKCzpsWsdxC
         m7yQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790948086; x=1791552886; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yx6G1AW+nvvITgzsA9b25EAkpoWe5JEuWuaZEwVI7YQ=;
        b=lcQ5AdegZSWHxI/3afoIRtWBelesyOuzbm/AjZlE3M+ToEsQ8o/cQ6juqrhiwuG+Ya
         zVxqavVOuavXKoq5zvNZ82FaE9LqPMTCLCvZAWeOT71s/u3qKiuz2PYpj36mgXsXITHo
         utuoP45iTXIeMDub1kcnYkk0KcloDDzdyTPROUDwpGkl86b66BAL6obIubtgCEswDEbe
         JlyxL8DnFVo54b7LHNWZ7DTjG/9ru43zdYuBFLq7EAzcrWFk2eRi4wx+L5lbcEf6qKri
         PNY6SHXHSc2D9qAFIaFJCUo3VSbwqBSbiHYFizpV8HjCbh6QEQoY+dPIUOpcSxXSRyOC
         r2Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790948086; x=1791552886;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yx6G1AW+nvvITgzsA9b25EAkpoWe5JEuWuaZEwVI7YQ=;
        b=pM7jJWprAWB3Su6JizPl7HbRortjwTALCaG1QycijDo5EuWcuXSRPpUied4go/SLuV
         8/mN63BVJV6eb5jKKEJnBLXzf6MbXHZmV+eZXBijKE4WvEDmSZmdiir99hfmXjtnc4Q3
         AURtrSTfTKrRFd/YCynIqE943SKdUBjoz2rPo903qAPDk8wesO39NP0h8kCsi6PfXvhb
         PHCWXsRY2Mh/1rnbncfmXXVP8wEoynkNnxjX7jZ0neNCCTpJZzGW9jCrmEbk0dNTi/IN
         MEuZXgxS5ikjdKdERBJ+adX5SsjUkoZo3c4vfTXNvLNuM3jRXzHXBLq+td/nP2uD1X40
         4plg==
X-Forwarded-Encrypted: i=1; AKwUvBwp73m8ODTKR60IVX6SNcxo2PM2N3ceTJXhXXshjdREs2NjkVuXHtkPMfx83rk2b8lz8af9ISZY4K4=@vger.kernel.org
X-Gm-Message-State: AFuF++lG7q1gM2Bc1J+DhoojeZZ+MTC7JnFgStgoa78PFf+5zD8B/otl
	A0Vmer/JBDeVKysvo835cBRu7PcPJh4MQLyl7+gUa3d6GeACbZKmKqsRPg/bYo6lMhwh/5nzmX/
	+dx18b8Rf5V8dg+r6NsGE0PVPmDmreto=
X-Gm-Gg: AYBFou1TwYdUNpXjOw57Le+iqXMHOaww4xKAogv7ilQc+SQ5qdT4fTbI+voXktpV4KA
	UFmUQ1KADmG9LrToiU4D3lnTwzuREcJl6RwH/aNNgxJTpF02+TX/MNY0MM8sa66S0+TFXT+eQN+
	s0yQOl6n/7DshkbVeNxchnQ5ctqO+RTYlTxk6SDvhzdyhy5wHFNlZW1nzq8e6Rjw8YOkAqg8+6d
	vihG5PwtLNMNJQRSDdkrX9Or4vELrocubuFBvt48uMCUe/LEKv6ZqgLXt6iyPS9pSlSeV+/1Vz1
	acS+/cN8Uv3W2KGcDuXGxZZg401l7EnGJ7VuQSozMOjPeRJwWV87H59LJFDGsnQNIKvxTuODYB7
	J+bRE4EYGvvHcRKiHGzbDnWnAlQibch9NUerUnBN0qTqSwXAft8gN
X-Received: by 2002:a05:701b:424d:20b0:146:ffa9:2117 with SMTP id
 a92af1059eb24-14f5aa4188fmr4688728c88.1.1790948085630; Fri, 02 Oct 2026
 06:34:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907-visibility-unification-v1-0-6a962e5b3351@redhat.com>
In-Reply-To: <20260907-visibility-unification-v1-0-6a962e5b3351@redhat.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 2 Oct 2026 09:34:33 -0400
X-Gm-Features: AclHuK_TcjLVEROGMJB5lyBOvzPZSfQv2eIf90DD5P5QCDVjEATvEIscfiIQFpg
Message-ID: <CADnq5_MZZje5XGfYgJ1v4Ts_k+ZyyBtSrSqB5upTEt+AqBi9Yg@mail.gmail.com>
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

On Mon, Sep 7, 2026 at 9:45=E2=80=AFAM Albert Esteve <aesteve@redhat.com> w=
rote:
>
> amdgpu_dm grew its own STATIC_IFN_KUNIT / EXPORT_IF_KUNIT /
> INLINE_IFN_KUNIT macros instead of using kunit/visibility.h. This
> series switches the KUnit helpers over to the common API.
>
> VISIBLE_IF_KUNIT is gated on CONFIG_KUNIT rather than
> CONFIG_DRM_AMD_DC_KUNIT_TEST, so the helpers are non-static whenever
> KUnit is enabled. EXPORT_SYMBOL_IF_KUNIT places the symbols in the
> EXPORTED_FOR_KUNIT_TESTING namespace; the AMD DC test files import
> that namespace with MODULE_IMPORT_NS().
>
> INLINE_IFN_KUNIT is dropped rather than generalized. It was only used
> on amdgpu_dm_fixpt_from_s3132(), inverted the original static inline,
> and is unnecessary for tests in another translation unit.
>
> Tested with:
>   ./tools/testing/kunit/kunit.py run --arch=3Dx86_64 \
>     --kunitconfig=3Ddrivers/gpu/drm/amd/display/amdgpu_dm/tests
>
> (CONFIG_GCOV omitted; it is not available on x86_64.)
>
> Suggested-by: Maxime Ripard <mripard@kernel.org>
>
> Signed-off-by: Albert Esteve <aesteve@redhat.com>

I've reverted this series.  It breaks the build when CONFIG_KUNIT=3Dy and
CONFIG_DRM_AMD_DC_KUNIT_TEST=3Dn. When CONFIG_KUNIT=3Dy,
the functions are not static, but when CONFIG_DRM_AMD_DC_KUNIT_TEST=3Dn,
they should be, resulting in build errors.

Alex

> ---
> Albert Esteve (3):
>       drm/amd/display: replace STATIC_IFN_KUNIT with VISIBLE_IF_KUNIT
>       drm/amd/display: replace EXPORT_IF_KUNIT with EXPORT_SYMBOL_IF_KUNI=
T
>       drm/amd/display: drop INLINE_IFN_KUNIT
>
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  79 ++++-----
>  .../drm/amd/display/amdgpu_dm/amdgpu_dm_audio.c    |  26 +--
>  .../amd/display/amdgpu_dm/amdgpu_dm_backlight.c    |  74 ++++----
>  .../drm/amd/display/amdgpu_dm/amdgpu_dm_color.c    | 133 +++++++--------
>  .../drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c  |  12 +-
>  .../amd/display/amdgpu_dm/amdgpu_dm_connector.c    | 190 ++++++++++-----=
------
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c  |  38 ++---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c |  52 +++---
>  .../drm/amd/display/amdgpu_dm/amdgpu_dm_cursor.c   |  10 +-
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_dmub.c |  30 ++--
>  .../drm/amd/display/amdgpu_dm/amdgpu_dm_freesync.c |  10 +-
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c | 105 ++++++------
>  .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  | 140 +++++++--------
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c  | 146 ++++++++-------=
-
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_ism.c  |  40 ++---
>  .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |  60 +++----
>  .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c    | 104 +++++------
>  .../drm/amd/display/amdgpu_dm/amdgpu_dm_pp_smu.c   | 116 ++++++-------
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c  |  22 +--
>  .../drm/amd/display/amdgpu_dm/amdgpu_dm_quirks.c   |   4 +-
>  .../drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c   |   9 +-
>  .../drm/amd/display/amdgpu_dm/amdgpu_dm_services.c |  10 +-
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c   |  18 +-
>  .../display/amdgpu_dm/tests/amdgpu_dm_audio_test.c |   1 +
>  .../amdgpu_dm/tests/amdgpu_dm_backlight_test.c     |   1 +
>  .../display/amdgpu_dm/tests/amdgpu_dm_color_test.c |   1 +
>  .../amdgpu_dm/tests/amdgpu_dm_colorop_test.c       |   1 +
>  .../amdgpu_dm/tests/amdgpu_dm_connector_test.c     |   1 +
>  .../display/amdgpu_dm/tests/amdgpu_dm_crc_test.c   |   1 +
>  .../display/amdgpu_dm/tests/amdgpu_dm_crtc_test.c  |   1 +
>  .../amdgpu_dm/tests/amdgpu_dm_cursor_test.c        |   1 +
>  .../display/amdgpu_dm/tests/amdgpu_dm_dmub_test.c  |   1 +
>  .../amdgpu_dm/tests/amdgpu_dm_freesync_test.c      |   1 +
>  .../display/amdgpu_dm/tests/amdgpu_dm_hdcp_test.c  |   1 +
>  .../amdgpu_dm/tests/amdgpu_dm_helpers_test.c       |   1 +
>  .../display/amdgpu_dm/tests/amdgpu_dm_irq_test.c   |   1 +
>  .../display/amdgpu_dm/tests/amdgpu_dm_ism_test.c   |   1 +
>  .../amdgpu_dm/tests/amdgpu_dm_kunit_helpers.c      |   1 +
>  .../amdgpu_dm/tests/amdgpu_dm_mst_types_test.c     |   1 +
>  .../display/amdgpu_dm/tests/amdgpu_dm_plane_test.c |   1 +
>  .../amdgpu_dm/tests/amdgpu_dm_pp_smu_test.c        |   1 +
>  .../display/amdgpu_dm/tests/amdgpu_dm_psr_test.c   |   1 +
>  .../amdgpu_dm/tests/amdgpu_dm_quirks_test.c        |   1 +
>  .../amdgpu_dm/tests/amdgpu_dm_replay_test.c        |   1 +
>  .../amdgpu_dm/tests/amdgpu_dm_services_test.c      |   1 +
>  .../amd/display/amdgpu_dm/tests/amdgpu_dm_test.c   |   1 +
>  .../display/amdgpu_dm/tests/amdgpu_dm_wb_test.c    |   1 +
>  drivers/gpu/drm/amd/display/dc/core/dc_sink.c      |   6 +-
>  drivers/gpu/drm/amd/display/dc/core/dc_stream.c    |   2 +-
>  drivers/gpu/drm/amd/display/dc/dm_helpers.h        |  13 +-
>  tools/lib/python/kdoc/xforms_lists.py              |   3 +-
>  51 files changed, 748 insertions(+), 728 deletions(-)
> ---
> base-commit: bc35965f6940a9bf834d54187b6088b8eb09206d
> change-id: 20260907-visibility-unification-fd358c580447
>
> Best regards,
> --
> Albert Esteve <aesteve@redhat.com>
>
