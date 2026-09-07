Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E0D424D46
	for <linux-doc@vger.kernel.org>; Mon,  7 Sep 2026 13:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788787760; cv=none; b=ckNjK5y3ga96dmoHPv7gDyC9Q8+W161A0xer6rqDL+pKdF29TzJAV5n5oNBPejIGp4RcR02SaVXgH2O8SqpJusha7xsZvCjITaT6nzRQXfFqtZgWO1gcogpzaR4b/wsZEIi2Iy69bYKsea5nLSvelgrrhJVlEeGH5GiKw8M2gJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788787760; c=relaxed/simple;
	bh=CSNKE3X9zGEThKEHTUj/MHt2L2p9PiFQgfv/1nvjjNU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HNshxjhr9rTKVKTNA/tGqWThXhgOQlt8siAEY64lgU5KJ7H9tO63lQVWeNafihGWGBhth1rfUko34JsClqI47EinxOnHr1LY1e/bFBtKca4J/l5E5P4os8Wq/8WnBsbC4btF4ObkYsN6cWUZ4wW1kXFcAPiGzLMBrz/2ytiiDto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=i+p+8pLp; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="i+p+8pLp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788787754;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=KjeZBR97TCcSu6Yi5+/kV6dt//KNAu887Dd5tax8g44=;
	b=i+p+8pLph/Bu6MouiO8pZiMuunAvqYz1Mw+MiSBIcbhvVUCM42AjP4ea0nN8AvgzzitKak
	xcsWFMSbYjj2Zzimx9FxejNRYhfugGWcXR+IjIvbb2b/KD3G9ydrwxE2YbuQO/PTjRYZy2
	bgt47o7F+t4rlkNp48nqGzLU2Ci1Ock=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-325-s8jbVTQcPG2MVyvTqaa3lg-1; Mon,
 07 Sep 2026 09:29:08 -0400
X-MC-Unique: s8jbVTQcPG2MVyvTqaa3lg-1
X-Mimecast-MFC-AGG-ID: s8jbVTQcPG2MVyvTqaa3lg_1788787746
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 468DE18089B6;
	Mon,  7 Sep 2026 13:29:05 +0000 (UTC)
Received: from aesteve-thinkpadp1gen8.rmtes.csb (headnet05.pony-001.prod.iad2.dc.redhat.com [10.2.32.117])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 67CBD30001A2;
	Mon,  7 Sep 2026 13:29:00 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
Subject: [PATCH 0/3] drm/amd/display: use kunit/visibility.h for test
 helpers
Date: Mon, 07 Sep 2026 15:28:55 +0200
Message-Id: <20260907-visibility-unification-v1-0-6a962e5b3351@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2Myw5AMBQFf0XuWpN6P35FLKhbTiIlLULEvyvLS
 WbmJscW7KgObrJ8wGExHqIwIDV1ZmSBwTPFMs5lJQvxKT1mbJfYDTRUt/lE6CHJSpWVMk0L8vF
 qWeP8x037PC8qLH2yaAAAAA==
X-Change-ID: 20260907-visibility-unification-fd358c580447
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>, Albert Esteve <aesteve@redhat.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788787739; l=4699;
 i=aesteve@redhat.com; s=20260827; h=from:subject:message-id;
 bh=CSNKE3X9zGEThKEHTUj/MHt2L2p9PiFQgfv/1nvjjNU=;
 b=8zHCFmM8DeOlXqSqlpqBu7B6JtthMEyk14mY/UJKGwYfbN7SV1iH7DPRsKgP16JKLpc0ZEDhi
 YY6+2QFeYO8CIZM8sNv4uB3f/ORgwzuvvOQHWSfIWm4LQihGNiMJR0B
X-Developer-Key: i=aesteve@redhat.com; a=ed25519;
 pk=zI2RBeZgocwYm3AkJW4CtjoJnKoDZrfBl1xe5Ed6h+U=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

amdgpu_dm grew its own STATIC_IFN_KUNIT / EXPORT_IF_KUNIT /
INLINE_IFN_KUNIT macros instead of using kunit/visibility.h. This
series switches the KUnit helpers over to the common API.

VISIBLE_IF_KUNIT is gated on CONFIG_KUNIT rather than
CONFIG_DRM_AMD_DC_KUNIT_TEST, so the helpers are non-static whenever
KUnit is enabled. EXPORT_SYMBOL_IF_KUNIT places the symbols in the
EXPORTED_FOR_KUNIT_TESTING namespace; the AMD DC test files import
that namespace with MODULE_IMPORT_NS().

INLINE_IFN_KUNIT is dropped rather than generalized. It was only used
on amdgpu_dm_fixpt_from_s3132(), inverted the original static inline,
and is unnecessary for tests in another translation unit.

Tested with:
  ./tools/testing/kunit/kunit.py run --arch=x86_64 \
    --kunitconfig=drivers/gpu/drm/amd/display/amdgpu_dm/tests

(CONFIG_GCOV omitted; it is not available on x86_64.)

Suggested-by: Maxime Ripard <mripard@kernel.org>

Signed-off-by: Albert Esteve <aesteve@redhat.com>
---
Albert Esteve (3):
      drm/amd/display: replace STATIC_IFN_KUNIT with VISIBLE_IF_KUNIT
      drm/amd/display: replace EXPORT_IF_KUNIT with EXPORT_SYMBOL_IF_KUNIT
      drm/amd/display: drop INLINE_IFN_KUNIT

 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  79 ++++-----
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_audio.c    |  26 +--
 .../amd/display/amdgpu_dm/amdgpu_dm_backlight.c    |  74 ++++----
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_color.c    | 133 +++++++--------
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c  |  12 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_connector.c    | 190 ++++++++++-----------
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c  |  38 ++---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c |  52 +++---
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_cursor.c   |  10 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_dmub.c |  30 ++--
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_freesync.c |  10 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c | 105 ++++++------
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  | 140 +++++++--------
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c  | 146 ++++++++--------
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_ism.c  |  40 ++---
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |  60 +++----
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c    | 104 +++++------
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_pp_smu.c   | 116 ++++++-------
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c  |  22 +--
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_quirks.c   |   4 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c   |   9 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_services.c |  10 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c   |  18 +-
 .../display/amdgpu_dm/tests/amdgpu_dm_audio_test.c |   1 +
 .../amdgpu_dm/tests/amdgpu_dm_backlight_test.c     |   1 +
 .../display/amdgpu_dm/tests/amdgpu_dm_color_test.c |   1 +
 .../amdgpu_dm/tests/amdgpu_dm_colorop_test.c       |   1 +
 .../amdgpu_dm/tests/amdgpu_dm_connector_test.c     |   1 +
 .../display/amdgpu_dm/tests/amdgpu_dm_crc_test.c   |   1 +
 .../display/amdgpu_dm/tests/amdgpu_dm_crtc_test.c  |   1 +
 .../amdgpu_dm/tests/amdgpu_dm_cursor_test.c        |   1 +
 .../display/amdgpu_dm/tests/amdgpu_dm_dmub_test.c  |   1 +
 .../amdgpu_dm/tests/amdgpu_dm_freesync_test.c      |   1 +
 .../display/amdgpu_dm/tests/amdgpu_dm_hdcp_test.c  |   1 +
 .../amdgpu_dm/tests/amdgpu_dm_helpers_test.c       |   1 +
 .../display/amdgpu_dm/tests/amdgpu_dm_irq_test.c   |   1 +
 .../display/amdgpu_dm/tests/amdgpu_dm_ism_test.c   |   1 +
 .../amdgpu_dm/tests/amdgpu_dm_kunit_helpers.c      |   1 +
 .../amdgpu_dm/tests/amdgpu_dm_mst_types_test.c     |   1 +
 .../display/amdgpu_dm/tests/amdgpu_dm_plane_test.c |   1 +
 .../amdgpu_dm/tests/amdgpu_dm_pp_smu_test.c        |   1 +
 .../display/amdgpu_dm/tests/amdgpu_dm_psr_test.c   |   1 +
 .../amdgpu_dm/tests/amdgpu_dm_quirks_test.c        |   1 +
 .../amdgpu_dm/tests/amdgpu_dm_replay_test.c        |   1 +
 .../amdgpu_dm/tests/amdgpu_dm_services_test.c      |   1 +
 .../amd/display/amdgpu_dm/tests/amdgpu_dm_test.c   |   1 +
 .../display/amdgpu_dm/tests/amdgpu_dm_wb_test.c    |   1 +
 drivers/gpu/drm/amd/display/dc/core/dc_sink.c      |   6 +-
 drivers/gpu/drm/amd/display/dc/core/dc_stream.c    |   2 +-
 drivers/gpu/drm/amd/display/dc/dm_helpers.h        |  13 +-
 tools/lib/python/kdoc/xforms_lists.py              |   3 +-
 51 files changed, 748 insertions(+), 728 deletions(-)
---
base-commit: bc35965f6940a9bf834d54187b6088b8eb09206d
change-id: 20260907-visibility-unification-fd358c580447

Best regards,
-- 
Albert Esteve <aesteve@redhat.com>

