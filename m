Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4903F36D9E2
	for <linux-doc@vger.kernel.org>; Sun, 15 Mar 2026 14:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773586705; cv=none; b=TinNzp8Fl9meaYYg5BUPj3eqffE+1SVtn/NAfxSPkqhq2gNl9EuZhpP1b+AXyBgmsL2+EO9HFQy9S2UUWwpHnka9xmZuOhjWGMhcQdEJTA8+SIRDvZ8M3Vj3MihkVrKYhOsHq7xD6l//9aPlsHEwU+q33PZcCvTcUsGs40PL6s8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773586705; c=relaxed/simple;
	bh=6e81gTOFwcms8WF8rZ3PvV1TV21hTOBkP19QN0vMPcY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Pa1HybLLfuyP8KncNnjKekb7jz16PuRFHHxOGPxogn90EDHKfx0ruliCldmSJImWkv/1RpBI7u2h6EWpF9NIgYGsmVuztNds/0XYTGS7cuZlyd1WB5wWCQLwWf1EESQaOve9zcG7RMYbxpFlr6EP2Bz1ESlByD7Nj7Lo2RhVzgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GCct98q3; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GCct98q3"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-439b790af67so3575331f8f.0
        for <linux-doc@vger.kernel.org>; Sun, 15 Mar 2026 07:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773586703; x=1774191503; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+sFIIHFtnDsPo18Tm8giyRmkIEx54O4WiipHf2L7azg=;
        b=GCct98q3FjNg4deC7lP5EO82N18h4AYB/9DScTi+WgXXf7NfH/nuQ5y2B+Ney+IMel
         kIl25chZwtjynRWNdrAi7oixI9ewGNEV6O1+dH/bH3zC4hayuBt7SPBjNH2Lp6yntTC1
         4k5PU5wLdofK+lisA/ZNDEL7+PXuNHYk+H08vr57WCWj38k55fTuXLQkYTGgjxKYSvDa
         CxHOR1RTmR41pLTjeWOf1J0dUdJpn5s6/BAtxB3Gb1UpR9qX9T95oiOQWkH5dfUj7dL9
         ECCnbUkVDbyylpymU5A7c/qq3MaKg7oGAMI0AIQDdrR/UnpiZGzUo1TKjEixQj2I216I
         qcMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773586703; x=1774191503;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+sFIIHFtnDsPo18Tm8giyRmkIEx54O4WiipHf2L7azg=;
        b=DHB6pWAex6a2UHsmFbHLjvzDAC+hl666TyfdVe+XlDqSE5eAmjbueJVK9so4ZyMTRp
         wH0o3vF9kBREkgIFIiGqIuFeQj8WX/LiDnHPGPfdsymE/R6AvZRJq87r6zkpQ3d8L/xR
         KpatuTd67vMthfYDkSv7qH5JH+6qBcr/DDWeiIa9L4fusZ3yLvnPnXzvIs6gRvjqBs1p
         s/sE9v518lyG8aHp+6GMOpjzP652Rpac9eYmUqOfLsJQDq9CPs7K3aae8EnqpJnvvdkD
         wtsHrtl2D0r4wCsnp78S1BseV64reZNF2GCLfMcAjdtBEUHFLBd7g73+mP3xZr6kxDya
         bgQg==
X-Forwarded-Encrypted: i=1; AJvYcCW/5KjFeqGcsims2bFRAAzg0YUfFY/6kZufZL19AnRUAH7Olc9v/7iLzYc1eOc+Ib0VcQSvEbqpXrk=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywu90IN3+82LS0KuPSbRvzHIin5/GyMasPUxWSUBMvGRGsfphCj
	k37tI3Ylf4bewWlOgreUl8asET0Hh4HZp23BmwACUTWjREeUDUhKGzCW
X-Gm-Gg: ATEYQzxHH/1EonpOJ1biPP9nH+pJPJ7qGk0Igzz0AG4u9AcMoQdw6k8HFhcUXVNo6j0
	+mFfgCRulwR301Vvf7Wqz55TNzXPm4JSYb+LjeXvYILxds2VOV38uaRCiMNO5t0LveLFEOZ1q+j
	qQB42X+7DS1LgrhcjQAZpjlNkc94jdfEd6P3YJ9JLBcFBIdYzP9Y3mBVF6LHiysbASFZdzTxG/G
	r7eTHRjX4Ots7yt2I2XQwzkEWCbGcU59MmzJZvA4MeBgubhzePlpug7lblPteTnRCVgIst9K3Mw
	n6lqZqTO1aUX6B5tTJpSb+lRW328QSR2uU+fJnd8r6nAaPC2qxjDpl0I79gdDPbzkv4SV4+yR0d
	sH60tPDbG6q+jTehOA37M7GOtr8pCqPZe7v6KYSy36dU+0mkPZNo+mE4o8aVBNLlika3xe30YXu
	Yhzex0sAHV/h3ZwkJrbLJLgCaRyYGOOKbmdqTjIAoiRR5AL/4V0ikNl3IXNsv2hvC+R8p5SDX6u
	7aRpQvPJdhFZWBuu51uWQZ4FDojLw==
X-Received: by 2002:a05:600c:4fd5:b0:46e:59bd:f7e2 with SMTP id 5b1f17b1804b1-48555b2c8fbmr163883565e9.11.1773586702402;
        Sun, 15 Mar 2026 07:58:22 -0700 (PDT)
Received: from DESKTOP-TILNSD1.localdomain ([139.47.104.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b5e9179sm348661125e9.3.2026.03.15.07.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 07:58:21 -0700 (PDT)
From: Kit Dallege <xaum.io@gmail.com>
To: "Michael S . Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	virtualization@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kit Dallege <xaum.io@gmail.com>
Subject: [PATCH 5/5] virtio: document the map API in the driver writing guide
Date: Sun, 15 Mar 2026 15:58:12 +0100
Message-ID: <20260315145812.24276-1-xaum.io@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new "Buffer mapping" section to the virtio driver writing guide
documenting the virtio map API (struct virtio_map_ops). This API was
introduced in commit bee8c7c24b73 ("virtio: introduce map ops in virtio
core") to allow transports and devices that do not perform DMA (such
as VDUSE) to provide their own buffer mapping logic instead of abusing
the DMA API.

The new section explains when and why custom map ops are used, documents
the virtio_map_ops structure and the union virtio_map token, and
references the driver-facing mapping helpers with their kernel-doc.

Signed-off-by: Kit Dallege <xaum.io@gmail.com>
---
 .../virtio/writing_virtio_drivers.rst         | 72 +++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/Documentation/driver-api/virtio/writing_virtio_drivers.rst b/Documentation/driver-api/virtio/writing_virtio_drivers.rst
index e5de6f5d061a..a3fcbf91ffe0 100644
--- a/Documentation/driver-api/virtio/writing_virtio_drivers.rst
+++ b/Documentation/driver-api/virtio/writing_virtio_drivers.rst
@@ -187,6 +187,78 @@ certain scenarios. The way to disable callbacks reliably is to reset the
 device or the virtqueue (virtio_reset_device()).
 
 
+Buffer mapping
+==============
+
+Virtio devices need to map buffers so they can be accessed by the device.
+Historically, virtio relied exclusively on the kernel DMA API for this,
+which works well for hardware devices that perform real DMA. However, some
+virtio backends (such as VDUSE, a user-space vDPA device) do not perform
+DMA at all and previously had to abuse the DMA API with custom
+``dma_ops`` to make things work.
+
+The virtio map API, introduced via ``struct virtio_map_ops``, solves
+this by allowing transports and devices to provide their own mapping
+logic. When a device supplies custom map ops, those are used instead of
+the DMA API. When no custom ops are provided, the standard DMA API path
+is used as before, so existing drivers require no changes.
+
+Map operations
+--------------
+
+A transport or device that needs custom mapping implements
+``struct virtio_map_ops`` and assigns it to the ``map`` field of
+``struct virtio_device``. The ``vmap`` field carries opaque mapping
+metadata (a ``union virtio_map``) that is passed through to every map
+operation:
+
+.. kernel-doc:: include/linux/virtio_config.h
+    :identifiers: struct virtio_map_ops
+
+The ``union virtio_map`` holds the mapping token -- for DMA-capable
+devices this is a ``struct device *`` pointer, while for devices like
+VDUSE it can be a pointer to their own mapping context (e.g. an IOVA
+domain):
+
+.. kernel-doc:: include/linux/virtio.h
+    :identifiers: union virtio_map
+
+Driver-facing helpers
+---------------------
+
+Most virtio drivers do not need to call the map API directly -- the
+virtqueue helpers (``virtqueue_add_inbuf()``, ``virtqueue_add_outbuf()``,
+etc.) handle mapping internally. However, drivers that perform their own
+pre-mapping or need coherent allocations can use the following helpers:
+
+.. kernel-doc:: drivers/virtio/virtio_ring.c
+    :identifiers: virtqueue_map_single_attrs
+
+.. kernel-doc:: drivers/virtio/virtio_ring.c
+    :identifiers: virtqueue_unmap_single_attrs
+
+.. kernel-doc:: drivers/virtio/virtio_ring.c
+    :identifiers: virtqueue_map_page_attrs
+
+.. kernel-doc:: drivers/virtio/virtio_ring.c
+    :identifiers: virtqueue_unmap_page_attrs
+
+.. kernel-doc:: drivers/virtio/virtio_ring.c
+    :identifiers: virtqueue_map_alloc_coherent
+
+.. kernel-doc:: drivers/virtio/virtio_ring.c
+    :identifiers: virtqueue_map_free_coherent
+
+.. kernel-doc:: drivers/virtio/virtio_ring.c
+    :identifiers: virtqueue_map_mapping_error
+
+.. kernel-doc:: drivers/virtio/virtio_ring.c
+    :identifiers: virtqueue_map_need_sync
+
+After mapping a buffer, always check the returned address with
+``virtqueue_map_mapping_error()`` before using it.
+
+
 References
 ==========
 
-- 
2.53.0

