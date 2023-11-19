Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GBTYQyJC"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 021E2C6
	for <linux-doc@vger.kernel.org>; Sun, 19 Nov 2023 02:57:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700391449;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=paKcR4aagnq4OR4cFFNyGyCczT8YfM2615gwz6U/Ifs=;
	b=GBTYQyJCjXzWJayLRZEy4SWH0JNdwmSOGvX9i/zEh+Tzn3y7LijV3ciKjO5PGmXGg+Wnni
	l5o62/3SDI9+SX1uuaJ0LHm3LC8hMuLNBTqzl5wcLPgFhTFUVBtWv1fzWwG5nNNCIpBY+B
	Pt/ePNUc9IRo+trHOhoS9iRKwG3abGk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-686-OUFAoUEpPamskNfFDoG6CA-1; Sun, 19 Nov 2023 05:57:25 -0500
X-MC-Unique: OUFAoUEpPamskNfFDoG6CA-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-40853e14f16so6119245e9.1
        for <linux-doc@vger.kernel.org>; Sun, 19 Nov 2023 02:57:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700391444; x=1700996244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=paKcR4aagnq4OR4cFFNyGyCczT8YfM2615gwz6U/Ifs=;
        b=brC13KE5eu4af2rYMwh8ld1nPkpBdi2gtQDOT4RtzH3B6tWRsx9kEjQ8A0a9cc7S6w
         kxwpVvz/5czJP3113DYB6pKXVwYFkPejCcBVxG71QxzvmKy3DqvS6chn4okJVQ6qwOJx
         gWryLs3gMQG3dEgv0frSr1XzivqLfqoeUp/4DPro8Le+grjNZ0jOgdOATSQshOEkfLcH
         qo/x028a2cYuB6zLJZoGRdh5JPJB3ySc7fR/JYMIW3jj0ehzW6kJ6Lmi45jlNQqmmzQ9
         zbB6f4E0KPjUvWD+vxoj2+Cn47MOOu7FXegigJlES+KSvLtBnYsVYCNbp/G82gQN4mJa
         9KIQ==
X-Gm-Message-State: AOJu0YzLkmjrOpswz2R/uhUmkiMNaeiD95ZE4AsSy93FdafNsu2HivNS
	02B5ZeEOxXkTR6rtBuPhBGe1oQBI9edoyp8gpNlqQfd99US6kKobUsbF4aS0VyeVwyzU3w3QLj0
	4Us1dpB++hXNcx0rX0MtF
X-Received: by 2002:adf:e58b:0:b0:32d:b051:9a27 with SMTP id l11-20020adfe58b000000b0032db0519a27mr2879797wrm.20.1700391444493;
        Sun, 19 Nov 2023 02:57:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFi7SRJ7y81uoAdnNo/STFG3TuDFoHARhcCF0tpowHTWIp4MigNAbZkJfZ0hoizOoIOzIYjFQ==
X-Received: by 2002:adf:e58b:0:b0:32d:b051:9a27 with SMTP id l11-20020adfe58b000000b0032db0519a27mr2879785wrm.20.1700391444248;
        Sun, 19 Nov 2023 02:57:24 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id dm15-20020a0560000bcf00b0032d81837433sm7796649wrb.30.2023.11.19.02.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 02:57:23 -0800 (PST)
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
	Daniel Vetter <daniel@ffwll.ch>,
	David Airlie <airlied@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v3 5/5] drm/todo: Add entry about implementing buffer age for damage tracking
Date: Sun, 19 Nov 2023 11:57:01 +0100
Message-ID: <20231119105709.3143489-6-javierm@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231119105709.3143489-1-javierm@redhat.com>
References: <20231119105709.3143489-1-javierm@redhat.com>
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

