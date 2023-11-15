Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A96B1A58A
	for <linux-doc@vger.kernel.org>; Wed, 15 Nov 2023 13:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hAGv14Er"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0399187
	for <linux-doc@vger.kernel.org>; Wed, 15 Nov 2023 05:16:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700054166;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LPNZAc6r0CSSO6lMN8bwDAougMdgFH11dwZvW1JyD1g=;
	b=hAGv14ErPFm7w941J4LZc7lve/yVTpK9Jb3LlRhXVIBuWqPnrCNDuFUSNXRt6NxIqqIJEg
	jau/i9aJH0AARRoVCf5oQr7rUy2bHRJrd5V7ad5FGEaU/UXLueovmc7INURvz+bY6E0Rdk
	h0L3BBWZVJH8BcV4ZQ+gPY3GE5Vwbdc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-274-gdhmA71kMr24dhnAjQnIGg-1; Wed, 15 Nov 2023 08:16:04 -0500
X-MC-Unique: gdhmA71kMr24dhnAjQnIGg-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-32db6a28e24so3208515f8f.0
        for <linux-doc@vger.kernel.org>; Wed, 15 Nov 2023 05:16:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700054163; x=1700658963;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LPNZAc6r0CSSO6lMN8bwDAougMdgFH11dwZvW1JyD1g=;
        b=b8pMcEXXsLzENFc3NdbTr4yhHVL/mvjS6mQMr/C9/9fTgZ0drJmQLDJQx99F5CAn2n
         ozrSlGd4wlDyj/zUPdiQrcIOWMaVX+BJVfR9h6wW9bPZTVQK/TDdBmArPvd0SyKRH3H7
         NTmlVP6Fwzubh7EPVPTJw2oLrXcuRretlqZs1CW5IGjJ+FaSD9lGDMCkARb+mu6O1zGA
         PXbuDV05UvOoahCuT6wVPBCWqLE5lcfMG8baQCJK38PKm4GEBGnpRzrs2HLfMRM6KINq
         10ki+uoLjJWIXMfLpbfpPMNdbdIrQdnC2rHSl7DO08IvlMpmpM/rQgK1KAlqLmf1tSc3
         DXzA==
X-Gm-Message-State: AOJu0YzvSvkKxKgZC/D9lY8OToQdrp4I0l3l/zkY47fsWlBRE1iSHeb6
	2JzeoaF0RpKBkN211/936re1j9Cwo/ryvK8SVqowyKh+tzuR+VDSv5hIz9E068ZoLFEp33cV/eO
	FG+mB24aY+EVMUuwMNzW+
X-Received: by 2002:a5d:6b8f:0:b0:331:4e5e:d9e7 with SMTP id n15-20020a5d6b8f000000b003314e5ed9e7mr5201139wrx.34.1700054163342;
        Wed, 15 Nov 2023 05:16:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH90wwQXO1DSYdUi0fT0muUxSLgnxdRuPpEfFKAh1lwXIDvxopHNTDogbaEw6FCwpQCc2B74A==
X-Received: by 2002:a5d:6b8f:0:b0:331:4e5e:d9e7 with SMTP id n15-20020a5d6b8f000000b003314e5ed9e7mr5201118wrx.34.1700054163127;
        Wed, 15 Nov 2023 05:16:03 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id b1-20020a5d6341000000b00323293bd023sm10579306wrw.6.2023.11.15.05.16.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 05:16:02 -0800 (PST)
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
	Daniel Vetter <daniel@ffwll.ch>,
	David Airlie <airlied@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v2 5/5] drm/todo: Add entry about implementing buffer age for damage tracking
Date: Wed, 15 Nov 2023 14:15:44 +0100
Message-ID: <20231115131549.2191589-6-javierm@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231115131549.2191589-1-javierm@redhat.com>
References: <20231115131549.2191589-1-javierm@redhat.com>
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
---

(no changes since v1)

 Documentation/gpu/todo.rst | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index b62c7fa0c2bc..5c43a958814b 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -782,6 +782,26 @@ Contact: Hans de Goede
 
 Level: Advanced
 
+Buffer age or other damage accumulation algorithm for buffer damage handling
+============================================================================
+
+Drivers that do per-buffer uploads, need a buffer damage handling (rather than
+frame damage like drivers that do per-plane or per-CRTC uploads), but there is
+no support to get the buffer age or any other damage accumulation algorithm.
+
+For this reason, the damage helpers just fallback to a full plane update if the
+framebuffer attached to a plane has changed since the last page-flip.
+
+This should be improved to get damage tracking properly working on drivers that
+do per-buffer uploads.
+
+More information about damage tracking and references to learning materials in
+`Damage Tracking Properties <https://docs.kernel.org/gpu/drm-kms.html#damage-tracking-properties>`_
+
+Contact: Javier Martinez Canillas <javierm@redhat.com>
+
+Level: Advanced
+
 Outside DRM
 ===========
 
-- 
2.41.0

