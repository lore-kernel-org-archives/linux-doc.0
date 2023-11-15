Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B005C1A591
	for <linux-doc@vger.kernel.org>; Wed, 15 Nov 2023 13:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="c1Wa9htB"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4E1F11D
	for <linux-doc@vger.kernel.org>; Wed, 15 Nov 2023 05:15:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700054158;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4lF7aMHaWE0StDFmSjkvXf9QppPYg6hsJ7Fo37wmlDE=;
	b=c1Wa9htB+toi/SLnkRoMPPi7JY3pwDmVhsNpG64vB4zYXN0hgMWqNKZjMQUU+v4iJkEabD
	s+UmjZH/Ulj2jQ4OzPLlMPu7O8AQHoOKl/YzA+Idl17mWq6Ks/kf/qE1bxH6udZPN5xah5
	ev8lyJm4VQamhE+qFM7pTPn0Yx+WXnk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-509-XBI-ypI5PHihFYyJrdWXqQ-1; Wed, 15 Nov 2023 08:15:54 -0500
X-MC-Unique: XBI-ypI5PHihFYyJrdWXqQ-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-32dceab634dso3085082f8f.2
        for <linux-doc@vger.kernel.org>; Wed, 15 Nov 2023 05:15:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700054153; x=1700658953;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4lF7aMHaWE0StDFmSjkvXf9QppPYg6hsJ7Fo37wmlDE=;
        b=sCBvCnMgERG+YRSFI3A8WGdfO2F32une7j+eS4wDqg4QlpMxa+/NgSDo9YiFMB8Ccq
         YepRL7pAUvz06XFzkfbPBjCAel/YZFnsGB7nFz2FNub6DsGjMx9RDmHwvJcPcThhkZKm
         QogbsnK9cDUcQVGbhariLvyZI9vXZ7wUiAtdhRkBH3xeFmYnXIzZQHBW0SCBIRUZuyy3
         Tk8kgcu0dxyOwJjmhoIr39zuANcAkES/JOXYtB0/+48WVJ9ZIF6GlLfNHd2GJuOOepjb
         psvhnzRV/ShXy2XM+ExFRUXlNjip3noNMGL5Jgi9Y3aqAFeVa72MgcPvxgZScyaliiOI
         3ZMA==
X-Gm-Message-State: AOJu0Yxpjt9nnHPsdF7iuwNVUYYj8Z8c2H7U/6PnNe2hvoVZo/w8jZiv
	jkdDfF35r+rKEfa4e8oKoxZA+hUs4rDvFrm/RX0wwbm1mAjwnUFyE55LsjbM6OhdA9bNxGdqv/R
	fQDrBlh3Lo9PmHzAv0BEX
X-Received: by 2002:a5d:64ef:0:b0:31c:8880:5d0f with SMTP id g15-20020a5d64ef000000b0031c88805d0fmr8815325wri.11.1700054153434;
        Wed, 15 Nov 2023 05:15:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG8Akj/DP0M6gaPcJ9iKzQAqtuUVukMuYMObXNcXMXbVoCf04jCr7iPlpSq+gDQSE1T7tfrhg==
X-Received: by 2002:a5d:64ef:0:b0:31c:8880:5d0f with SMTP id g15-20020a5d64ef000000b0031c88805d0fmr8815312wri.11.1700054153053;
        Wed, 15 Nov 2023 05:15:53 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id q12-20020a05600000cc00b0032db4e660d9sm10551595wrx.56.2023.11.15.05.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 05:15:52 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Maxime Ripard <mripard@kernel.org>,
	Bilal Elmoussaoui <belmouss@redhat.com>,
	Simon Ser <contact@emersion.fr>,
	Erico Nunes <nunes.erico@gmail.com>,
	Pekka Paalanen <pekka.paalanen@collabora.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Sima Vetter <daniel.vetter@ffwll.ch>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Chia-I Wu <olvaffe@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	David Airlie <airlied@gmail.com>,
	David Airlie <airlied@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Gurchetan Singh <gurchetansingh@chromium.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
	Zack Rusin <zackr@vmware.com>,
	dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org,
	virtualization@lists.linux.dev
Subject: [PATCH v2 0/5] drm: Allow the damage helpers to handle buffer damage
Date: Wed, 15 Nov 2023 14:15:39 +0100
Message-ID: <20231115131549.2191589-1-javierm@redhat.com>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This series is to fix an issue that surfaced after damage clipping was
enabled for the virtio-gpu by commit 01f05940a9a7 ("drm/virtio: Enable
fb damage clips property for the primary plane").

After that change, flickering artifacts was reported to be present with
both weston and wlroots wayland compositors when running in a virtual
machine. The cause was identified by Sima Vetter, who pointed out that
virtio-gpu does per-buffer uploads and for this reason it needs to do
a buffer damage handling, instead of frame damage handling.

Their suggestion was to extend the damage helpers to cover that case
and given that there's isn't a buffer damage accumulation algorithm
(e.g: buffer age), just do a full plane update if the framebuffer that
is attached to a plane changed since the last plane update (page-flip).

It is a v2 that addresses issues pointed out by Thomas Zimmermann in v1:
https://lists.freedesktop.org/archives/dri-devel/2023-November/430138.html

Patch #1 adds a ignore_damage_clips field to struct drm_plane_state to be
set by drivers that want the damage helpers to ignore the damage clips.

Patch #2 fixes the virtio-gpu damage handling logic by asking the damage
helper to ignore the damage clips if the framebuffer attached to a plane
has changed since the last page-flip.

Patch #3 does the same but for the vmwgfx driver that also needs to handle
buffer damage and should have the same issue (although I haven't tested it
due not having a VMWare setup).

Patch #4 adds to the KMS damage tracking kernel-doc some paragraphs about
damage tracking types and references to links that explain frame damage vs
buffer damage.

Finally patch #5 adds an item to the DRM todo, about the need to implement
some buffer damage accumulation algorithm instead of just doing full plane
updates in this case.

Because commit 01f05940a9a7 landed in v6.4, the first 2 patches are marked
as Fixes and Cc stable.

I've tested this on a VM with weston, was able to reproduce the issue
reported and the patches did fix the problem.

Best regards,
Javier

Changes in v2:
- Add a struct drm_plane_state .ignore_damage_clips to set in the plane's
  .atomic_check, instead of having different helpers (Thomas Zimmermann).
- Set struct drm_plane_state .ignore_damage_clips in virtio-gpu plane's
  .atomic_check instead of using a different helpers (Thomas Zimmermann).
- Set struct drm_plane_state .ignore_damage_clips in vmwgfx plane's
  .atomic_check instead of using a different helpers (Thomas Zimmermann).

Javier Martinez Canillas (5):
  drm: Allow drivers to indicate the damage helpers to ignore damage
    clips
  drm/virtio: Disable damage clipping if FB changed since last page-flip
  drm/vmwgfx: Disable damage clipping if FB changed since last page-flip
  drm/plane: Extend damage tracking kernel-doc
  drm/todo: Add entry about implementing buffer age for damage tracking

 Documentation/gpu/todo.rst             | 20 ++++++++++++++++++++
 drivers/gpu/drm/drm_damage_helper.c    |  3 ++-
 drivers/gpu/drm/drm_plane.c            | 20 ++++++++++++++++++++
 drivers/gpu/drm/virtio/virtgpu_plane.c | 10 ++++++++++
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c    | 11 +++++++++++
 include/drm/drm_plane.h                |  8 ++++++++
 6 files changed, 71 insertions(+), 1 deletion(-)

-- 
2.41.0

