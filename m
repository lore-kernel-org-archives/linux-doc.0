Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF26310794
	for <linux-doc@vger.kernel.org>; Mon, 23 Oct 2023 07:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WQo0ZhkH"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98A94CC
	for <linux-doc@vger.kernel.org>; Mon, 23 Oct 2023 00:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1698047225;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2ig9pnbkXsw6GzlEEjdjTDGad5diacA6zlPvo0RK13g=;
	b=WQo0ZhkH2faweptFJOaO91UtYDBc4Ww1rBeH7wLcOlEisfxpHj9FGJ8ja3C4xVA06lLoCp
	VSkLaehAF9/fAvjvCTOj/sm9fC/P3/k0RMp+RH0EYwTTlu1pTGgbUJdGhGVBxazwPSR2Z4
	hRbQCcEAB9lm2ygAlu8E5vKQUwHP2cw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-76-TyA4BC3iMWuf9jc7i8bRww-1; Mon, 23 Oct 2023 03:47:02 -0400
X-MC-Unique: TyA4BC3iMWuf9jc7i8bRww-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 09FBD857CF1;
	Mon, 23 Oct 2023 07:46:46 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.45.225.243])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 398B11120F;
	Mon, 23 Oct 2023 07:46:41 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
To: qemu-devel@nongnu.org
Cc: zackr@vmware.com,
	contact@emersion.fr,
	linux-doc@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>,
	iforbes@vmware.com,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Chia-I Wu <olvaffe@gmail.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Hans de Goede <hdegoede@redhat.com>,
	Matt Roper <matthew.d.roper@intel.com>,
	David Airlie <airlied@gmail.com>,
	banackm@vmware.com,
	Rob Clark <robdclark@gmail.com>,
	javierm@redhat.com,
	krastevm@vmware.com,
	spice-devel@lists.freedesktop.org,
	Gurchetan Singh <gurchetansingh@chromium.org>,
	Jonathan Corbet <corbet@lwn.net>,
	David Airlie <airlied@redhat.com>,
	virtualization@lists.linux-foundation.org,
	linux-kernel@vger.kernel.org,
	mombasawalam@vmware.com,
	Daniel Vetter <daniel@ffwll.ch>,
	ppaalanen@gmail.com,
	VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	David Airlie <airlied@linux.ie>
Subject: [PATCH v6 5/9] drm/vboxvideo: Use the hotspot properties from cursor planes
Date: Mon, 23 Oct 2023 09:46:09 +0200
Message-ID: <20231023074613.41327-6-aesteve@redhat.com>
In-Reply-To: <20231023074613.41327-1-aesteve@redhat.com>
References: <20231023074613.41327-1-aesteve@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5

From: Zack Rusin <zackr@vmware.com>

Atomic modesetting got support for mouse hotspots via the hotspot
properties. Port the legacy kms hotspot handling to the new properties
on cursor planes.

Signed-off-by: Zack Rusin <zackr@vmware.com>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/vboxvideo/vbox_mode.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vboxvideo/vbox_mode.c b/drivers/gpu/drm/vboxvideo/vbox_mode.c
index 341edd982cb3b..9ff3bade97957 100644
--- a/drivers/gpu/drm/vboxvideo/vbox_mode.c
+++ b/drivers/gpu/drm/vboxvideo/vbox_mode.c
@@ -429,8 +429,8 @@ static void vbox_cursor_atomic_update(struct drm_plane *plane,
 	flags = VBOX_MOUSE_POINTER_VISIBLE | VBOX_MOUSE_POINTER_SHAPE |
 		VBOX_MOUSE_POINTER_ALPHA;
 	hgsmi_update_pointer_shape(vbox->guest_pool, flags,
-				   min_t(u32, max(fb->hot_x, 0), width),
-				   min_t(u32, max(fb->hot_y, 0), height),
+				   min_t(u32, max(new_state->hotspot_x, 0), width),
+				   min_t(u32, max(new_state->hotspot_y, 0), height),
 				   width, height, vbox->cursor_data, data_size);
 
 	mutex_unlock(&vbox->hw_mutex);
-- 
2.41.0

