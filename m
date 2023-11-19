Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="I8/i4bZ2"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B543E5
	for <linux-doc@vger.kernel.org>; Sun, 19 Nov 2023 02:57:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700391437;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GpzYJKfv/0ZtdesZuwEDnk0DKAmF9L/deY6r6V9scok=;
	b=I8/i4bZ2rJ5jmj8hMtThvj3aTlMuC3Gm2/+0KD7pv4ez7yLuwBFN1kYvA8LG0lqTWq2yEy
	70lp4S5wO1Fs1My41FVR4OWQhwtSaWdCIAYqVRxOiROUdUVaUzDxnBgQMcEBk3nt6IhrPd
	MBaawu1n4CHwEFSA6/RBH8QTT3PEJ5E=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-652-jLmqvTp9MW6E6x-ZVTTzrQ-1; Sun, 19 Nov 2023 05:57:16 -0500
X-MC-Unique: jLmqvTp9MW6E6x-ZVTTzrQ-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-408f9cee5e8so7924165e9.0
        for <linux-doc@vger.kernel.org>; Sun, 19 Nov 2023 02:57:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700391434; x=1700996234;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GpzYJKfv/0ZtdesZuwEDnk0DKAmF9L/deY6r6V9scok=;
        b=kjoIPVIaObLoYHEwMsREPclJHOD8swgjvWtTHVUjh9HaAW96pVkk30+V8RqSeqshJ+
         w9YIXbstuEteVpp7fCWTBH64oSFw1vN7GG2Fra0b7CwoMDdMQOWqsj5/0KawoJc+PyEZ
         p7zem3P/j8kPisuYuAKk9AQ499HN/daJnINQsX1TJUQ6bNrjCd6cOAbuufizpjRSoT3E
         9GSgxUkkQNVvh5VoNyxadrFIUZjFCF7ZAVzDkJoF8qwnC2NArcQ2V5Ubxzajijbf2MHh
         +DXisQf4CKGA8i30GmPArvtQWCeslxE9HXZgPmHKIb3rmnD5eoRzDPasCH/RoxZ4/l27
         m1mw==
X-Gm-Message-State: AOJu0YyjKVuSfORSS2NT+McwIe2sJngKYxl9BN5Nh7Q8maPCC9tKdNRD
	AUSmvYmDvESQpgP9TC+SnMntnMiyMYAnT65VeUT6VXa13C/HqgmAoKnZruioQbgqfM8DngxGMFz
	Y1LP8Y4Um4zbjKdZute42WsAaXLm0
X-Received: by 2002:a05:600c:35c7:b0:409:57ec:9d7e with SMTP id r7-20020a05600c35c700b0040957ec9d7emr3646457wmq.21.1700391434294;
        Sun, 19 Nov 2023 02:57:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF9bQCU2PwD56RVajuSjL/MgwYtR78B+r3siDyRHcYH8/tVvIrad76Lc1ocORueFtFPDVgqEA==
X-Received: by 2002:a05:600c:35c7:b0:409:57ec:9d7e with SMTP id r7-20020a05600c35c700b0040957ec9d7emr3646424wmq.21.1700391433813;
        Sun, 19 Nov 2023 02:57:13 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id d34-20020a05600c4c2200b0040a48430837sm13634419wmp.13.2023.11.19.02.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 02:57:13 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
	Maxime Ripard <mripard@kernel.org>,
	Pekka Paalanen <pekka.paalanen@collabora.com>,
	Sima Vetter <daniel.vetter@ffwll.ch>,
	Erico Nunes <nunes.erico@gmail.com>,
	Simon Ser <contact@emersion.fr>,
	Bilal Elmoussaoui <belmouss@redhat.com>,
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
Subject: [PATCH v3 0/5] drm: Allow the damage helpers to handle buffer damage
Date: Sun, 19 Nov 2023 11:56:56 +0100
Message-ID: <20231119105709.3143489-1-javierm@redhat.com>
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

It is a v3 that addresses issues pointed out by Thomas Zimmermann  and
Simon Ser in v2:

https://lists.freedesktop.org/archives/dri-devel/2023-November/430896.html

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

Changes in v3:
- Fix typo in the kernel-doc (Simon Ser).
- Add a paragraph explaining what the problem in the kernel is and
  make it clear that the refeference documents are related to how
  user-space handles this case (Thomas Zimmermann).

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
 drivers/gpu/drm/drm_plane.c            | 26 ++++++++++++++++++++++++++
 drivers/gpu/drm/virtio/virtgpu_plane.c | 10 ++++++++++
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c    | 11 +++++++++++
 include/drm/drm_plane.h                |  8 ++++++++
 6 files changed, 77 insertions(+), 1 deletion(-)

-- 
2.41.0

