Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aOt6UeWc"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0711F10DA
	for <linux-doc@vger.kernel.org>; Thu, 23 Nov 2023 14:13:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700777610;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7MuULYoz5ao+rLNA+YbUecP2cAJXv6WyavKrHjMaHS4=;
	b=aOt6UeWcVqoKQsY1VWAMoc6/ClcXYWhG8fH0/PAIhFnCd9LXN6TEJFArIMEY+Q9I3s52ZM
	YVkfE1kMN+NBvW4RMSmqmuz0nBPJMv3dn4L+7jyUOsWEZH0bN94DLnVyHhUVIIo9JPlJTT
	lrKSk3Gsr3ymZ6oWTtjOkag3gfZ6JBk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-674-pwfpocDTP7-Cez02t42OFg-1; Thu, 23 Nov 2023 17:13:28 -0500
X-MC-Unique: pwfpocDTP7-Cez02t42OFg-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-332e2e0b98bso640083f8f.1
        for <linux-doc@vger.kernel.org>; Thu, 23 Nov 2023 14:13:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700777607; x=1701382407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7MuULYoz5ao+rLNA+YbUecP2cAJXv6WyavKrHjMaHS4=;
        b=Yr32UYufVJ8FI9FAY3/N8t4nB6h8xPNkn1293pt6PlbRaf2h7GtFsnkkWZunaZova6
         4Mdbssf4gO/Ncxv6GgFq2g2syek9z28tEZSwbM4YCqWrxxyqN2qzgVhoIhg5VImD29Zw
         5WHZ8v0dh79/rcZBTIBEhpqjJPuXQDyg451l10jSgElTamUnm/mk7d/2b0FLCndP2YbE
         HRDJwvHJ3gcgH1tr9Q+tdnt4ewkMi8xs2POGjhnqRAc1Dg3AI1qQ/7NRAn5nwVPEf0YP
         LoeD1P/87P/gQmn86T2sykFysMDoeqoSluoTx2mZPojj9vHOi70yGxEwjrQepwZcaftn
         BFag==
X-Gm-Message-State: AOJu0YzDJ4WiREpJ4k6gS0nISv6nEMGxDchzUfTcf78R47AkmQasc5+O
	XaUTmrS4HZlXh+uF5f95uoHOLR7weX8fZ8BIodCRwvcE6VK2ujzETgHzQy9k2u9PK0wxIMKAQV3
	+Huog88so6eFBUbiVohbu
X-Received: by 2002:a5d:40c8:0:b0:332:e777:a8d4 with SMTP id b8-20020a5d40c8000000b00332e777a8d4mr565977wrq.36.1700777607602;
        Thu, 23 Nov 2023 14:13:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFbblMAN+hzDoQaplfSW1Ls9XUsnDbl4YuadfKrIq6lj50fMHkQHToWy2rbRvbEJLq7TAFUoA==
X-Received: by 2002:a5d:40c8:0:b0:332:e777:a8d4 with SMTP id b8-20020a5d40c8000000b00332e777a8d4mr565964wrq.36.1700777607350;
        Thu, 23 Nov 2023 14:13:27 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id s7-20020a5d5107000000b00332c6a52040sm2681153wrt.100.2023.11.23.14.13.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 14:13:27 -0800 (PST)
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
	Daniel Vetter <daniel@ffwll.ch>,
	David Airlie <airlied@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v4 5/5] drm/todo: Add entry about implementing buffer age for damage tracking
Date: Thu, 23 Nov 2023 23:13:04 +0100
Message-ID: <20231123221315.3579454-6-javierm@redhat.com>
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

Currently, only damage tracking for frame damage is supported. If a driver
needs to do buffer damage (e.g: the framebuffer attached to plane's state
has changed since the last page-flip), the damage helpers just fallback to
a full plane update.

Add en entry in the TODO about implementing buffer age or any other damage
accumulation algorithm for buffer damage handling.

Suggested-by: Simon Ser <contact@emersion.fr>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Simon Ser <contact@emersion.fr>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Zack Rusin <zackr@vmware.com>
Acked-by: Sima Vetter <daniel.vetter@ffwll.ch>
---

Changes in v4:
- Reference the &drm_plane_state.ignore_damage_clips and the damage helpers
  in the buffer damage TODO entry (Sima Vetter).

 Documentation/gpu/todo.rst | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index b62c7fa0c2bc..503d57c75215 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -782,6 +782,29 @@ Contact: Hans de Goede
 
 Level: Advanced
 
+Buffer age or other damage accumulation algorithm for buffer damage
+===================================================================
+
+Drivers that do per-buffer uploads, need a buffer damage handling (rather than
+frame damage like drivers that do per-plane or per-CRTC uploads), but there is
+no support to get the buffer age or any other damage accumulation algorithm.
+
+For this reason, the damage helpers just fallback to a full plane update if the
+framebuffer attached to a plane has changed since the last page-flip. Drivers
+set &drm_plane_state.ignore_damage_clips to true as indication to
+drm_atomic_helper_damage_iter_init() and drm_atomic_helper_damage_iter_next()
+helpers that the damage clips should be ignored.
+
+This should be improved to get damage tracking properly working on drivers that
+do per-buffer uploads.
+
+More information about damage tracking and references to learning materials can
+be found in :ref:`damage_tracking_properties`.
+
+Contact: Javier Martinez Canillas <javierm@redhat.com>
+
+Level: Advanced
+
 Outside DRM
 ===========
 
-- 
2.41.0

