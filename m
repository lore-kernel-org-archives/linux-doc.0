Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529E134A797
	for <linux-doc@vger.kernel.org>; Thu, 12 Mar 2026 21:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773352721; cv=pass; b=sYG0/SuDPAhnOfUbMRZXFzt6be0cMQm+iaaixAoVy0NSmyp54nSTOHw1sIn8/kauedCzoMmV6uj7TUqVjLfGIR/FFPa6sVDQIDuw9nAusXJ8Y38s60DKQ+8ul5EBj4YFJ2oohx1lgtF3sD/t5rkK0K10yoicHZGU1qOHmiQoQ6I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773352721; c=relaxed/simple;
	bh=/UXbidtDU54/5v7kkzH9PAfgESqYtiigH9Z7woqu25w=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=uMgjrDyE/snce2V/4Zq1REuROxqib/HubLYsE1BZiACvNMfF3z86k2ncFX+h8Q6B6QZ54LMrFjTGU02t79Blg3rFemat9K6SbCclVq9McyfR0VLANNvLezMvGUTVXrRylw9YcjoZrBz3yquRbbgZ40Jrr4uwRrQgQygCwqlUMP8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kLjFKNkc; arc=pass smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kLjFKNkc"
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-415b23dd6e5so584594fac.3
        for <linux-doc@vger.kernel.org>; Thu, 12 Mar 2026 14:58:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773352719; cv=none;
        d=google.com; s=arc-20240605;
        b=EBgycbZtwsRYdbofppxKo3E5yS9f7Dh601U+z2hs2uhoIdu7Ageout+jB46FYRrirf
         klDol8AAb3YX+SDp7vHlaZcc7qinkmDrAVmZoNNULi9cTVWBr2f/0hnwO6ObL4zLddgd
         H/N+h3wlfk8hn9FiGysZgnM4z6bYOjepNGIlYr/2htVjXLpSr4Ah0mqqzu/UN18N0sa9
         YcGZzYAA+z2qgZDylCf8X6fx4B6dw48uks4lt7TPvK7C0mJUJ5/Hl4Gb7N6foPekAHup
         YHkpU1QgbXnc/+jy9mOvjGkxvZCF5R4BjprHOQaJ24Za5RtFKlGNWeaKYEv/KG6NgIZ8
         V2fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=FqP84TGmgvyTgfJsFq+pkxpoA3lD0KYlwSD57EbzY8Y=;
        fh=iGqUu97id0w39o+bldzEb2UBqfqFcocfn7aegnWhaPE=;
        b=G9L9VA/waVM4Cy2eNdsdqAoGMt72lqpHdTOWNhJjAmG7cDLiVuj+iH3HJwvyR0HyhH
         gxy11jrF274NJvwwNVk+8VnbMp65dCd2nPx1/LBvVu4TRWQXRbLEnjcuyK2qB30zUsJN
         oB4E0qIsXLHWDBakB7j3VUHVpjQx00S7eexB7CMQ8Ayz6W+KI9k8HsCjeSEi4nlKROPh
         Y8+PhMFbSXdnlFM9yu8S5J4SZGB5AnKqoyk8j+DzSGMK4kVNz887QHtvi3AbGO8L6Kpr
         xPiuBVJ/Dh6ZBPHXvLrD7k4q1dEE1GE11/akp0r/gw5krzqSJNyoYPF+8g7fjF7hAH4V
         lZDA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773352719; x=1773957519; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FqP84TGmgvyTgfJsFq+pkxpoA3lD0KYlwSD57EbzY8Y=;
        b=kLjFKNkcyHGrvKdNmhragVkqK2yhm1eU42X6gW9Nz3314svj5NHvsFVk1cy/XuohWV
         xmQa35/lj6RpdhqU58ZMBpYtFGfXLiAJwD1y2mPzW2I3MVamXbpqhlHaoNUoHwnQGXx/
         vCIPATibO5MVW6GFZAHAFJQzF19Fj3Zb9M8fou1exuDTHHw6mVZyqEiLrKewtca2AWdp
         eQ5XUU7eJGdoKsnfeBh9OjJS2pGu1aDWsTRkFtW1srGEWx8AhSZRSbPo6I0274UAkzdo
         gTz/OZfXv/XZRMQTENtOr792Om7yPZuFi8xmOP67RgmiUi8PctAM5f+9YTQxaOIMEuqK
         OJbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773352719; x=1773957519;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FqP84TGmgvyTgfJsFq+pkxpoA3lD0KYlwSD57EbzY8Y=;
        b=kHHC9niDllFilrNpWv+jE9embgncX4+z5qHKibiveiyssMrbA0KSQCRffoafx9sjPa
         2GphCxjVS1YbY70wKO7GmgAUyfUwKyZAQbNB747D0PzxTNwquh+XSIIa4qWNtLDo3tAB
         x/2SKVh+ApIm09Dncb5uemP9uMU0GijNu/otswObM5o+z8HWGFconf8RvaNDJCYrsbOU
         f73sv39icUlXGDVgEBR0pP/nMwUTlZl2qYBUCES4rsD3QkQviOIr7jalNofSd/KuekQW
         NbfOqjNGCpQRRGn2yf3naDbDKqU1IWm0Bt8DiFY0M/4R8rw+JFHA7itHH+M4cLxujxV7
         qPoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmsWM/Nqja6X7236qvXNWZw7glRDEyOIIksa3DQDp8mSx21rAWyN3eGSxXWGR79ul0nqtMsmo9vkU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRHT8y4g/EnfV0zdHv8abJOHyPD/HtOflEpFsnnKpxzmzBydw8
	SBmf2TlnMDXUSjwTIB3LOumoEghYvQAMlEQbVZrsX81EWwzcYE25HbJMWY7SeAbRazHjG/zoyxE
	2bcK0uczYbnLXrUGfinhi7RQU/akGvR0=
X-Gm-Gg: ATEYQzzw5aHb6uT/6VQCdr/Fg+kycvk9WeVXnyIpw5aQEa1Dmn5OXGkTl1vy0ueAN9/
	efIRZNoU+PL4xft9BH/raXDCprQKYa6AI7pGKYsdy+Fywq/M6W03nncG+wL7O3AsRiiy/gersxR
	pIocxvTHekkql6/27qfi/64Hi7fIPtGsycg6Q3McSlWdIwgi2T125E2L+KG8wXfllufGluS19Lm
	zz64C6x2ygho062DqgX7tBOna5xntrM34C+Rfc38l2HcP9qHn2x98JFoNTHso0vD8HV6Olw0MCn
	/6lavQJLXQByWhHnC87YX1CQ7TiFgFSkdepAHxL8s7TYv4Ls8Evk6Vu4UfqEDUpmSCaUjg==
X-Received: by 2002:a05:6871:582b:b0:417:5cf7:48f6 with SMTP id
 586e51a60fabf-417b9059c22mr617649fac.3.1773352719154; Thu, 12 Mar 2026
 14:58:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: John S <xaum.io@gmail.com>
Date: Thu, 12 Mar 2026 22:58:26 +0100
X-Gm-Features: AaiRm53jG2HdeSoWg3E3eUPDX7LBFweqaGa9oOaMogvds1ztn67HqyTh2Ab3FCg
Message-ID: <CAAZVx999y-DvB7Dp2ekoHk6s8aqqScd2gKSY4ySGAK6NNXeH5g@mail.gmail.com>
Subject: [PATCH] virtio: document the map API in the driver writing guide
To: mst@redhat.com, jasowang@redhat.com
Cc: xuanzhuo@linux.alibaba.com, eperezma@redhat.com, corbet@lwn.net, 
	skhan@linuxfoundation.org, virtualization@lists.linux.dev, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

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

diff --git a/Documentation/driver-api/virtio/writing_virtio_drivers.rst
b/Documentation/driver-api/virtio/writing_virtio_drivers.rst
index e5de6f5d061a..a3fcbf91ffe0 100644
--- a/Documentation/driver-api/virtio/writing_virtio_drivers.rst
+++ b/Documentation/driver-api/virtio/writing_virtio_drivers.rst
@@ -187,6 +187,78 @@ certain scenarios. The way to disable callbacks
reliably is to reset the
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
