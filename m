Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A222C3272
	for <linux-doc@vger.kernel.org>; Fri, 27 Jun 2025 10:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751019037; cv=none; b=UiBLD57qKRRqJYiHQHLJY5q8ZwETne1vZDLex6JDGTJk6KBZfc+huZI/2lcKz3JzXheB0VrLF0iv8Jihf36Ewu8C1sbMbtP65iy1bVNBocTQQweLzIDC0oxzJZp0JNm0vtmhW03UtmaK2DW+iqFHRlFeAZMWGvPrc4cYY3TR6mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751019037; c=relaxed/simple;
	bh=zu4jprqPkVKK+s8SMuEoaDk/xS62TRzk/ACCvXy3VVM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n0HgDc/Q1wsrWpkxSYAGX6l1aoHb7P/nmd6yoqQ0u/447sNe0P+nVYGIfQ4aSlWuP2ScK9nKwgG8jKG+/HZZQpfjQ92wKEN4VhOS3c+rVP4B5XMKb9SWyurYw7+EQAoAvovbvxaWMttI2eCmbz9Huxz6syXsCjKREcOPHIKk8+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Y52AXAeW; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Y52AXAeW"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a4e62619afso228505f8f.1
        for <linux-doc@vger.kernel.org>; Fri, 27 Jun 2025 03:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751019034; x=1751623834; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+1GkDD0t9TV+8eyclzSuxcgZwyBe3Yxz+qGLtTo9oS4=;
        b=Y52AXAeW926JRvxZUrN4oMzCabGj4X8XaJAdJ5CB0eeOwWsCuNgQQb5lG16YISeBZZ
         7wbcmfAPGixWJCVNo7w+dt+h1xtRQD6+EfGoV8sdLC+aJoPvuyCaKgzqubv8fai8xM7T
         LzLy0TevpNBvXjmS9K7CbvJVTRWnrRp8TOXLlRKnAnxau2cHKTBgIE6cmtlamB6+2nNc
         yvuKqGItvpODq5lJtxzCuCbLXRwKkHspAFUt840cS+pwDX+v/5tshyaMK9z+7vjaqPxi
         Qa23axnLnH+YyfBFWT0iB/urEZwv90g9GgqWY3rsj90QaAgKwnpwbGkAEhC0M1u0lJ+1
         wWyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751019034; x=1751623834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+1GkDD0t9TV+8eyclzSuxcgZwyBe3Yxz+qGLtTo9oS4=;
        b=ZUF9wqxgB8ZiEOUdq/l2JJ9U2TTtpXyBORQrBBqAgZ+bSM3Rd/Ahx8q9wZD3OLUnyv
         dPQQ8BbjLe1T5KPP9JN3b0gSbfINnb8HJgu5mOBKWDcX1BN81FF9RbVKh4qzHVcPp/+/
         y31kfVUthR2E9itvCmZgo+B0SuyHca4q1WC2YmGZxjRdBlKGQBGd0cLNzueW/eXAKmWO
         PYfDPmeiHtn9m5Srlsn2vwCOZo6U4ifzAeVXJk1tA3YlWFRJ48tolgUWnZlQhb6rsX8x
         9p+yQtmPfJA0d96aoQ/LtYqiuyOJDOH+k2PBVWYe0u8i7+fL+L9FKhxXh3HIFnHcfBcU
         glaA==
X-Forwarded-Encrypted: i=1; AJvYcCWTePtVvPfqpHOMXS8XHwK8RA6hVbPBByUbppKDRmZbI/OSI236J5dKhVuzy8hlJoYaeeNTJttd+Ts=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywg3HKhysN1RxeXaGCUWttzO5uSIcDAV0z1YAHwpG8TUjJ2XMEL
	sqopEfbatCf3F3h+CpeFRvQshQ9Oh+Ty/1T2ub3rrciuzaTb2ZdlvFTBlgPcuDtURc0=
X-Gm-Gg: ASbGncvegB0ncyy6sCjtdHzE+bX3E/se7ol1onc2/xEE7khdpDazdM8X0TrSzBb0xeM
	+NMCbtZ1g+qPMoktGTKZSLyYgtbnJA/juwRWGLNGukYOsfLf8MJLGsjDaK2ZvgqEZLzc39pm2M2
	3z7UcZnxKGTe1GN4/P1wbPM81RXonc0jzvCf8dh8Tz3WqMdPDZ/ztnxs9hhX4Af7xGrcVgJUWPt
	dgIGsXfcWbZ+ElEmw4+wbUVs9tQzI2qWCPIYTMyUXMDkAekbvLuxlgc2LcdGEs5mGjPzVnZGQht
	VN6f9hqgLGPwoFYnI14K9UpMyuItpA4k5DYx3n/vuySWCL7NadzWe3RCSk4VQfpnGd2xa0Uvlmz
	rYXFYE+y1kU7b5Jj+pbAouIkyIeUJl72BzUPiWTkeCRlySoZFeGgw
X-Google-Smtp-Source: AGHT+IFN+4rxHLnEkyIUsrPqGi0U/kgqahdfchbV1MPl60s4rMY1PSGd5MD4vpgOV5VdL516KcG0DQ==
X-Received: by 2002:a5d:64e3:0:b0:3a5:781c:6956 with SMTP id ffacd0b85a97d-3a90c5516a3mr1085911f8f.6.1751019033571;
        Fri, 27 Jun 2025 03:10:33 -0700 (PDT)
Received: from localhost (dynamic-2a00-1028-83b8-1e7a-3010-3bd6-8521-caf1.ipv6.o2.cz. [2a00:1028:83b8:1e7a:3010:3bd6:8521:caf1])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a892e5f34csm2232521f8f.85.2025.06.27.03.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 03:10:33 -0700 (PDT)
From: Petr Tesarik <ptesarik@suse.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list),
	linux-mm@kvack.org (open list:MEMORY MANAGEMENT),
	Petr Tesarik <ptesarik@suse.com>
Subject: [PATCH v2 6/8] docs: dma-api: clarify DMA addressing limitations
Date: Fri, 27 Jun 2025 12:10:13 +0200
Message-ID: <20250627101015.1600042-7-ptesarik@suse.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250627101015.1600042-1-ptesarik@suse.com>
References: <20250627101015.1600042-1-ptesarik@suse.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the description of DMA mask from the documentation of dma_map_single()
to Part Ic - DMA addressing limitations and improve the wording.

Explain when a mask setting function may fail, and do not repeat this
explanation for each individual function.

Clarify which device parameters are updated by each mask setting function.

Signed-off-by: Petr Tesarik <ptesarik@suse.com>
Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/core-api/dma-api.rst | 35 +++++++++++++++---------------
 1 file changed, 18 insertions(+), 17 deletions(-)

diff --git a/Documentation/core-api/dma-api.rst b/Documentation/core-api/dma-api.rst
index bed6e8fdf56e2..9fcdb160638e0 100644
--- a/Documentation/core-api/dma-api.rst
+++ b/Documentation/core-api/dma-api.rst
@@ -92,13 +92,20 @@ for alignment, like queue heads needing to be aligned on N-byte boundaries.
 Part Ic - DMA addressing limitations
 ------------------------------------
 
+DMA mask is a bit mask of the addressable region for the device. In other words,
+if applying the DMA mask (a bitwise AND operation) to the DMA address of a
+memory region does not clear any bits in the address, then the device can
+perform DMA to that memory region.
+
+All the below functions which set a DMA mask may fail if the requested mask
+cannot be used with the device, or if the device is not capable of doing DMA.
+
 ::
 
 	int
 	dma_set_mask_and_coherent(struct device *dev, u64 mask)
 
-Checks to see if the mask is possible and updates the device
-streaming and coherent DMA mask parameters if it is.
+Updates both streaming and coherent DMA masks.
 
 Returns: 0 if successful and a negative error if not.
 
@@ -107,8 +114,7 @@ Returns: 0 if successful and a negative error if not.
 	int
 	dma_set_mask(struct device *dev, u64 mask)
 
-Checks to see if the mask is possible and updates the device
-parameters if it is.
+Updates only the streaming DMA mask.
 
 Returns: 0 if successful and a negative error if not.
 
@@ -117,8 +123,7 @@ Returns: 0 if successful and a negative error if not.
 	int
 	dma_set_coherent_mask(struct device *dev, u64 mask)
 
-Checks to see if the mask is possible and updates the device
-parameters if it is.
+Updates only the coherent DMA mask.
 
 Returns: 0 if successful and a negative error if not.
 
@@ -173,7 +178,7 @@ transfer memory ownership.  Returns %false if those calls can be skipped.
 	unsigned long
 	dma_get_merge_boundary(struct device *dev);
 
-Returns the DMA merge boundary. If the device cannot merge any the DMA address
+Returns the DMA merge boundary. If the device cannot merge any DMA address
 segments, the function returns 0.
 
 Part Id - Streaming DMA mappings
@@ -207,16 +212,12 @@ DMA_BIDIRECTIONAL	direction isn't known
 	this API should be obtained from sources which guarantee it to be
 	physically contiguous (like kmalloc).
 
-	Further, the DMA address of the memory must be within the
-	dma_mask of the device (the dma_mask is a bit mask of the
-	addressable region for the device, i.e., if the DMA address of
-	the memory ANDed with the dma_mask is still equal to the DMA
-	address, then the device can perform DMA to the memory).  To
-	ensure that the memory allocated by kmalloc is within the dma_mask,
-	the driver may specify various platform-dependent flags to restrict
-	the DMA address range of the allocation (e.g., on x86, GFP_DMA
-	guarantees to be within the first 16MB of available DMA addresses,
-	as required by ISA devices).
+	Further, the DMA address of the memory must be within the dma_mask of
+	the device.  To ensure that the memory allocated by kmalloc is within
+	the dma_mask, the driver may specify various platform-dependent flags
+	to restrict the DMA address range of the allocation (e.g., on x86,
+	GFP_DMA guarantees to be within the first 16MB of available DMA
+	addresses, as required by ISA devices).
 
 	Note also that the above constraints on physical contiguity and
 	dma_mask may not apply if the platform has an IOMMU (a device which
-- 
2.49.0

