Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 742F2208D5
	for <linux-doc@vger.kernel.org>; Thu,  9 Nov 2023 17:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="e/cGm8lY"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF6D0325A
	for <linux-doc@vger.kernel.org>; Thu,  9 Nov 2023 09:25:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699550709;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=KM+kZjFHA8E0A+l+o485oGQAZV87bwGJzM3u9NBaaMA=;
	b=e/cGm8lYKvoeQYINzkmtM+ll6tQjTbbgMlj+O7XVmg9vhZHZdmMZIM5qvj+W8Fr/jFm0ZX
	P7K3mNfN9ua/yU7uhevO+qWx7CWiFLNOgXUHBEi1pMBJuuU2Hbw2xJihTKJd7U8LdC7q2z
	XaF5uI6BHfHQ2Em0LlIjGVWeVPKmZ54=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-441-FiDGtgtANRug0aNnu94JCg-1; Thu, 09 Nov 2023 12:25:07 -0500
X-MC-Unique: FiDGtgtANRug0aNnu94JCg-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4084001846eso7292905e9.1
        for <linux-doc@vger.kernel.org>; Thu, 09 Nov 2023 09:25:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699550706; x=1700155506;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KM+kZjFHA8E0A+l+o485oGQAZV87bwGJzM3u9NBaaMA=;
        b=i+wkH0oXuaYPTN23HvE/SWqL4Vf+DpQnaqj2y7QNlLVILeJBCsv2hvmMaMAPgsiUOR
         9fiOpH5PhOPP6QqClzlCXEED2hDbPiiv2DGNp7UlBgWLPBHmFFcImqeHaovToY0ZxXsw
         heDDiACRVeC7I+v5vCl0oNo00wom8U/s+XbkXFCotERI+9tfS6yWQbXa2wvUT8XSjJfn
         ew3BqLar3gsnjLGC5oHkbyA8C1bxI9DtHSOwdMLzC0FIIz2ox0XngMVMETD9vO9+Pvix
         Bqn8wdGRHI+lRjGbvMCoWbA5TR69UQLWCikEd9q7av5+o5BzdisT80qoE19/hJJBR1gr
         jvPw==
X-Gm-Message-State: AOJu0YxhGv4qkYRteMC7TJll8g2XNM7OmoHCjszCXJ4I41NOfDkA1A86
	ObxOiMRvTAta54TXdK0DHqTGU9FH9jbKW5xwDdfvdzHDBmkrcygaxsL9RiYuXpbDvd9IgFvIi97
	3tWdQ/p+MMC45B6LHMaIM
X-Received: by 2002:a05:600c:3d9a:b0:408:5bc6:a7d with SMTP id bi26-20020a05600c3d9a00b004085bc60a7dmr4807914wmb.19.1699550706434;
        Thu, 09 Nov 2023 09:25:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFBYNpBFpSwc4pVpHVCRnVRLdnQyz2wbfqHlyA9KAIkGVscHGBHFPnaFmMk7VrRW7vmMUDnCw==
X-Received: by 2002:a05:600c:3d9a:b0:408:5bc6:a7d with SMTP id bi26-20020a05600c3d9a00b004085bc60a7dmr4807894wmb.19.1699550706031;
        Thu, 09 Nov 2023 09:25:06 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id n18-20020a05600c3b9200b0040839fcb217sm646229wms.8.2023.11.09.09.25.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 09:25:04 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Simon Ser <contact@emersion.fr>,
	Sima Vetter <daniel.vetter@ffwll.ch>,
	Pekka Paalanen <pekka.paalanen@collabora.com>,
	Maxime Ripard <mripard@kernel.org>,
	Bilal Elmoussaoui <belmouss@redhat.com>,
	Erico Nunes <nunes.erico@gmail.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Chia-I Wu <olvaffe@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	David Airlie <airlied@gmail.com>,
	David Airlie <airlied@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Gurchetan Singh <gurchetansingh@chromium.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
	Zack Rusin <zackr@vmware.com>,
	dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org,
	virtualization@lists.linux-foundation.org
Subject: [PATCH 0/6] drm: Allow the damage helpers to handle buffer damage
Date: Thu,  9 Nov 2023 18:24:34 +0100
Message-ID: <20231109172449.1599262-1-javierm@redhat.com>
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

Patch #1 is just a refactoring to allow the logic of the frame damage
helpers to be shared by the buffer damage helpers.

Patch #2 adds the helpers that are needed for buffer damage handling.

Patch #3 fixes the virtio-gpu damage handling logic by using the
helper that is required by drivers that need to handle buffer damage.

Patch #4 fixes the vmwgfx similarly, since that driver also needs to
handle buffer damage and should have the same issue (although I have
not tested it due not having a VMWare setup).

Patch #5 adds to the KMS damage tracking kernel-doc some paragraphs
about damage tracking types and references to links that explain
frame damage vs buffer damage.

Finally patch #6 adds an item to the DRM/KMS todo, about the need to
implement some buffer damage accumulation algorithm instead of just
doing a full plane update in this case.

Because commit 01f05940a9a7 landed in v6.4, the first three patches
are marked as Fixes and Cc stable.

I've tested this on a VM with weston, was able to reproduce the issue
reported and the patches did fix the problem.

Please let me know what you think. Specially on the wording since could
made mistakes due just learning about these concepts yesterday thanks to
Sima, Simon and Pekka.

Best regards,
Javier


Javier Martinez Canillas (6):
  drm: Move drm_atomic_helper_damage_{iter_init,merged}() to helpers
  drm: Add drm_atomic_helper_buffer_damage_{iter_init,merged}() helpers
  drm/virtio: Use drm_atomic_helper_buffer_damage_merged() for buffer
    damage
  drm/vmwgfx: Use drm_atomic_helper_buffer_damage_iter_init() for buffer
    damage
  drm/plane: Extend damage tracking kernel-doc
  drm/todo: Add entry about implementing buffer age for damage tracking

 Documentation/gpu/todo.rst             |  20 +++
 drivers/gpu/drm/drm_damage_helper.c    | 166 +++++++++++++++++++------
 drivers/gpu/drm/drm_plane.c            |  22 +++-
 drivers/gpu/drm/virtio/virtgpu_plane.c |   2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c    |   2 +-
 include/drm/drm_damage_helper.h        |   7 ++
 6 files changed, 173 insertions(+), 46 deletions(-)

-- 
2.41.0

