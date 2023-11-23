Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TcCCsrpk"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BD0910CF
	for <linux-doc@vger.kernel.org>; Thu, 23 Nov 2023 14:13:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700777602;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NNr7AyogBLBECN5NVEc3sDwHAg2qPYRl5gFzwIza95Q=;
	b=TcCCsrpkJMzASYvJJNmOjJv/QRjLXT+s0R9MENznXt5uiZ+ybpUZ8oV/LkEuvvWvXuu3gb
	GJ+vwrt5ujgZHqZaY9jWqqSp/JxO/eHkJ9KFqePsQBxvcbGoYE+m4x1lvFwQCP6McMXery
	I+pMFfKBf2t4CLz7pPv9z9m+Qhbo/Dg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-386-UUeGaH2oMCW9WM88JyB90Q-1; Thu, 23 Nov 2023 17:13:20 -0500
X-MC-Unique: UUeGaH2oMCW9WM88JyB90Q-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-40b357e2a01so5894175e9.1
        for <linux-doc@vger.kernel.org>; Thu, 23 Nov 2023 14:13:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700777600; x=1701382400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NNr7AyogBLBECN5NVEc3sDwHAg2qPYRl5gFzwIza95Q=;
        b=oFdWxjKM/zc990Fb/6q/hrq54NwILAWtBg3BA4cUoyflSH69q2ErbvsJSuJ6XG+tvb
         CnSCq9ikcHy63KzhblaB5QmzzXiJDNg/2bwK4e6TvpQqOJSHDJKzxzfdzFIYZCYBMJ5O
         ybBNFgCXYNfW0ZxQdY049hBPtYd53Ib3vcw3hsUOLWQI0EAXlLNpdBbGStwT2eOGVotG
         JkMhH37bwTYBap/mOCk0OV55tEA4nTPoj8Sn1d4VDpHp6X7z2NCFHcEivSvcbN/qHyMH
         oKiesFhVUMIfE6UswiyYU+MHH9BfLl5nzYi53pVUiUMjh7UqWr4VhsT3yWw1qBZ753F8
         eMkA==
X-Gm-Message-State: AOJu0Yyz2ti//iHOBKq3vujIOIkWe/w5W7hjAeSjNZe+hji+1oWCY9Ea
	64edpCe7+ktbersBL+HnTk7iNOT0L9VvwPjMuTU8/rhJ71MmmSlu4toS9rsujJM+FX/cHlxEsxV
	tGpicrAKvIoh+QoOdHuO3
X-Received: by 2002:a05:600c:1c9d:b0:408:434c:dae7 with SMTP id k29-20020a05600c1c9d00b00408434cdae7mr695855wms.2.1700777599771;
        Thu, 23 Nov 2023 14:13:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGsLgt3C+76rwt6+lTv0sowa6U49h5FFZqfpVdWRCJlUnBufhPrTXVPA1hV/im8nsFEBKfIcQ==
X-Received: by 2002:a05:600c:1c9d:b0:408:434c:dae7 with SMTP id k29-20020a05600c1c9d00b00408434cdae7mr695832wms.2.1700777599346;
        Thu, 23 Nov 2023 14:13:19 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id r7-20020a05600c35c700b0040b30be6244sm3233457wmq.24.2023.11.23.14.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 14:13:18 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Maxime Ripard <mripard@kernel.org>,
	Zack Rusin <zackr@vmware.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Pekka Paalanen <pekka.paalanen@collabora.com>,
	Bilal Elmoussaoui <belmouss@redhat.com>,
	Simon Ser <contact@emersion.fr>,
	Erico Nunes <nunes.erico@gmail.com>,
	Sima Vetter <daniel.vetter@ffwll.ch>,
	Javier Martinez Canillas <javierm@redhat.com>,
	stable@vger.kernel.org,
	nerdopolis <bluescreen_avenger@verizon.net>,
	Daniel Vetter <daniel@ffwll.ch>,
	David Airlie <airlied@gmail.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v4 1/5] drm: Allow drivers to indicate the damage helpers to ignore damage clips
Date: Thu, 23 Nov 2023 23:13:00 +0100
Message-ID: <20231123221315.3579454-2-javierm@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231123221315.3579454-1-javierm@redhat.com>
References: <20231123221315.3579454-1-javierm@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It allows drivers to set a struct drm_plane_state .ignore_damage_clips in
their plane's .atomic_check callback, as an indication to damage helpers
such as drm_atomic_helper_damage_iter_init() that the damage clips should
be ignored.

To be used by drivers that do per-buffer (e.g: virtio-gpu) uploads (rather
than per-plane uploads), since these type of drivers need to handle buffer
damages instead of frame damages.

That way, these drivers could force a full plane update if the framebuffer
attached to a plane's state has changed since the last update (page-flip).

Fixes: 01f05940a9a7 ("drm/virtio: Enable fb damage clips property for the primary plane")
Cc: <stable@vger.kernel.org> # v6.4+
Reported-by: nerdopolis <bluescreen_avenger@verizon.net>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=218115
Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Zack Rusin <zackr@vmware.com>
Acked-by: Sima Vetter <daniel.vetter@ffwll.ch>
---

Changes in v4:
- Refer in ignore_damage_clips kernel-doc to "Damage Tracking Properties"
  KMS documentation section (Sima Vetter).

Changes in v2:
- Add a struct drm_plane_state .ignore_damage_clips to set in the plane's
  .atomic_check, instead of having different helpers (Thomas Zimmermann).

 Documentation/gpu/drm-kms.rst       |  2 ++
 drivers/gpu/drm/drm_damage_helper.c |  3 ++-
 include/drm/drm_plane.h             | 10 ++++++++++
 3 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.rst
index 270d320407c7..a98a7e04e86f 100644
--- a/Documentation/gpu/drm-kms.rst
+++ b/Documentation/gpu/drm-kms.rst
@@ -548,6 +548,8 @@ Plane Composition Properties
 .. kernel-doc:: drivers/gpu/drm/drm_blend.c
    :doc: overview
 
+.. _damage_tracking_properties:
+
 Damage Tracking Properties
 --------------------------
 
diff --git a/drivers/gpu/drm/drm_damage_helper.c b/drivers/gpu/drm/drm_damage_helper.c
index d8b2955e88fd..afb02aae707b 100644
--- a/drivers/gpu/drm/drm_damage_helper.c
+++ b/drivers/gpu/drm/drm_damage_helper.c
@@ -241,7 +241,8 @@ drm_atomic_helper_damage_iter_init(struct drm_atomic_helper_damage_iter *iter,
 	iter->plane_src.x2 = (src.x2 >> 16) + !!(src.x2 & 0xFFFF);
 	iter->plane_src.y2 = (src.y2 >> 16) + !!(src.y2 & 0xFFFF);
 
-	if (!iter->clips || !drm_rect_equals(&state->src, &old_state->src)) {
+	if (!iter->clips || state->ignore_damage_clips ||
+	    !drm_rect_equals(&state->src, &old_state->src)) {
 		iter->clips = NULL;
 		iter->num_clips = 0;
 		iter->full_update = true;
diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
index 79d62856defb..fef775200a81 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -190,6 +190,16 @@ struct drm_plane_state {
 	 */
 	struct drm_property_blob *fb_damage_clips;
 
+	/**
+	 * @ignore_damage_clips:
+	 *
+	 * Set by drivers to indicate the drm_atomic_helper_damage_iter_init()
+	 * helper that the @fb_damage_clips blob property should be ignored.
+	 *
+	 * See :ref:`damage_tracking_properties` for more information.
+	 */
+	bool ignore_damage_clips;
+
 	/**
 	 * @src:
 	 *
-- 
2.41.0

