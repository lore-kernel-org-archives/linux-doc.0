Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF372C15A3
	for <linux-doc@vger.kernel.org>; Tue, 24 Jun 2025 13:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750772375; cv=none; b=PJjnfracrci0/soQ8zYudSQ/WFGchZ+8aC8oBVGoqgBssApOHVbALVmKlrrFIReOhbE+3I/bRGXI1RG809vAa4sbOBXaALl4if14+MhPW4XpVz3+52hdumZOTq8fjvDGEfg0+NlWZHBbn1CG19Dz0m2QKOKDV19kjqH5O6JFf0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750772375; c=relaxed/simple;
	bh=upmwj8n4ZMOQPPUNURbAWXmJiyyO05PQ3fhNj+QN7p0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OLl23sAxLS7ejX588ZBnTd+fxHmfbBAUIe3623oEBjjTNe3h9Yz/JYqWcwn8JYCanfFqE3i7a8XY4hMYGkduTyjeKzTS+25esx3OcCopZotkO2VFDX8q6wByWutek3z/M3RShsViafW8f7jeToYFyk2NjmzJ+IQVfnK26AqyW3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=XVg8v/Ik; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="XVg8v/Ik"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a577ab8c34so754374f8f.3
        for <linux-doc@vger.kernel.org>; Tue, 24 Jun 2025 06:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750772372; x=1751377172; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IHvhAvi5eCUp/ybstJnQHmjXO3pY/1hXWEhrYPlflFU=;
        b=XVg8v/IkHwyE4YqRc85n4dFwyp9awxf/ILl7OOSpKGG8RF37+v20NTNpCLmuJprIeI
         rAQMU7hues0eTcD3v/mwnSTBM9adKnF2dwqdQVk9Qoxfj+GiiGNugfSRLXYM6wlrWc8I
         ZFOcetHgqV85ZWYprfJWmOXk/3owTIzCHRMpCQQOh31xEeY/1F1XdYcyRS0gsrGopXVX
         JLl/hXzfKQ6gqe4xrijvxcASLPkP/Dwrz2H5I0gfeKHgtHo5gH1FBtOaRkT0lJ4f3ko7
         rCYR/SyZXZCnBjhz6ppXC/4gPOhgr/yF00pKzO67jG35a+8vYBqPpfoWiwvHvfqNym6U
         LNZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750772372; x=1751377172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IHvhAvi5eCUp/ybstJnQHmjXO3pY/1hXWEhrYPlflFU=;
        b=Q0e0B1U3mXgRO6ifpAtJ1wkr33++qU6NaulYmtCWWKewW6RFHoZtQfssODeusGk6c2
         2+9esyRlEb27M/3roxvAupTUSUfkKarc71KE/clAdL4O2txv1H3+d4NVcNoVDzOOwblZ
         eIUBC7GNNFaHZuVUhs/ZZr1vu1/UYz5vwkqMYAWNvldvx4vFTSocb/El6GhQrs7gKI0e
         ybpRT8Sa2N/E7Ir7sKJGHeO3XUdS916t81gb/zwg0W5Vn68j5i3r0wSKppbzvfKJ9omN
         1ZM28mmjLqjQa9FiuKXT2L3OhSkz1S19QvKoR7lMc8fxGYZ12QLTjSBgRhU1EMX6zuaC
         3d+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVjHQxntuJIJqPjVYgi+nHr8LIVZRzbWaV2+2BtfQbzL8wQBkQ5qa8m/qKBAdcQylnx9ELehnGDh1M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwzDxNJH2jypdixdEf3t++DyWzrQw4vA5GJ7xEaRoS2i/u+SJu
	7vmgig7oEiI2OoCxxeRKyIAIgs/p+vjezvltw5ECjaqV3p0TGJT7W6gfEbssPZ4CPm0=
X-Gm-Gg: ASbGncsmm1LD/zqzlg7SfLnIaFZDF+3DyJNPBCoVhLoSLO62ZHNKQUL5ap4lYAxO+nS
	TdemJgx758lP9/Tu06m/zBVbNt7F/ZehUm8OtLBElVgRfTWh39dTr0fdrxDrWGEhbbpoT3V9lZ0
	DXvnNmqy46851YEbv8yHqTYwA9e2uNrr0Eb2zGo+a41lYqARYDM+AGV3HBALYmarhZWZqx3AhqZ
	bd/QX6P6zNipg6imSsJdtuKRxbZYeChU/gCoM7cD2ci2MlnXlKQ6LnfdypTpdmcS9qbNOsH7bQ1
	n7we+UAPnb35DQgtfvIU20/fBYBMq8pvPGX4M5shzP2v9vICUjGZkcyLy+pQMx248OQkYPBY7nk
	tGcwGE/+r7ET3Cb4UKkBucv3pSibq+gorolPkZANFrSNQXPBxlihz
X-Google-Smtp-Source: AGHT+IHg37TDJn0ybirhMSzgiCvKi7BYNHT5VAEQ6KF0RJ85EgIsRWvQC3Z7Ra12tDoOlf0Dg9NQPA==
X-Received: by 2002:a05:6000:2f83:b0:3a4:f7ea:a638 with SMTP id ffacd0b85a97d-3a6d128bc58mr4861104f8f.3.1750772371648;
        Tue, 24 Jun 2025 06:39:31 -0700 (PDT)
Received: from localhost (dynamic-2a00-1028-83b8-1e7a-3010-3bd6-8521-caf1.ipv6.o2.cz. [2a00:1028:83b8:1e7a:3010:3bd6:8521:caf1])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4536fefd2b4sm84782955e9.36.2025.06.24.06.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:39:31 -0700 (PDT)
From: Petr Tesarik <ptesarik@suse.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Morton <akpm@linux-foundation.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Leon Romanovsky <leon@kernel.org>,
	Keith Busch <kbusch@kernel.org>,
	Caleb Sander Mateos <csander@purestorage.com>,
	Sagi Grimberg <sagi@grimberg.me>,
	Jens Axboe <axboe@kernel.dk>,
	John Garry <john.g.garry@oracle.com>,
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list),
	linux-mm@kvack.org (open list:MEMORY MANAGEMENT),
	Petr Tesarik <ptesarik@suse.com>
Subject: [PATCH 3/8] docs: dma-api: remove remnants of PCI DMA API
Date: Tue, 24 Jun 2025 15:39:18 +0200
Message-ID: <20250624133923.1140421-4-ptesarik@suse.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250624133923.1140421-1-ptesarik@suse.com>
References: <20250624133923.1140421-1-ptesarik@suse.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The wording sometimes suggests there are multiple functions for an
operation. This was in fact the case before PCI DMA API was removed, but
since there is only one API now, the documentation has become confusing.

To improve readability:

* Remove implicit references to the PCI DMA API (plurals, use of "both",
  etc.)

* Where possible, refer to an actual function rather than a more generic
  description of the operation.

Signed-off-by: Petr Tesarik <ptesarik@suse.com>
---
 Documentation/core-api/dma-api.rst | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/Documentation/core-api/dma-api.rst b/Documentation/core-api/dma-api.rst
index c0a2cc7d0b95..3e89e3b0ecfd 100644
--- a/Documentation/core-api/dma-api.rst
+++ b/Documentation/core-api/dma-api.rst
@@ -53,10 +53,9 @@ minimum allocation length may be as big as a page, so you should
 consolidate your requests for coherent memory as much as possible.
 The simplest way to do that is to use the dma_pool calls (see below).
 
-The flag parameter (dma_alloc_coherent() only) allows the caller to
-specify the ``GFP_`` flags (see kmalloc()) for the allocation (the
-implementation may choose to ignore flags that affect the location of
-the returned memory, like GFP_DMA).
+The flag parameter allows the caller to specify the ``GFP_`` flags (see
+kmalloc()) for the allocation (the implementation may ignore flags that affect
+the location of the returned memory, like GFP_DMA).
 
 ::
 
@@ -64,13 +63,12 @@ the returned memory, like GFP_DMA).
 	dma_free_coherent(struct device *dev, size_t size, void *cpu_addr,
 			  dma_addr_t dma_handle)
 
-Free a region of coherent memory you previously allocated.  dev,
-size and dma_handle must all be the same as those passed into
-dma_alloc_coherent().  cpu_addr must be the virtual address returned by
-the dma_alloc_coherent().
+Free a previously allocated region of coherent memory.  dev, size and dma_handle
+must all be the same as those passed into dma_alloc_coherent().  cpu_addr must
+be the virtual address returned by dma_alloc_coherent().
 
-Note that unlike their sibling allocation calls, these routines
-may only be called with IRQs enabled.
+Note that unlike the sibling allocation call, this routine may only be called
+with IRQs enabled.
 
 
 Part Ib - Using small DMA-coherent buffers
@@ -246,9 +244,7 @@ Part Id - Streaming DMA mappings
 Maps a piece of processor virtual memory so it can be accessed by the
 device and returns the DMA address of the memory.
 
-The direction for both APIs may be converted freely by casting.
-However the DMA API uses a strongly typed enumerator for its
-direction:
+The DMA API uses a strongly typed enumerator for its direction:
 
 ======================= =============================================
 DMA_NONE		no direction (used for debugging)
@@ -325,8 +321,7 @@ DMA_BIDIRECTIONAL	direction isn't known
 			 enum dma_data_direction direction)
 
 Unmaps the region previously mapped.  All the parameters passed in
-must be identical to those passed in (and returned) by the mapping
-API.
+must be identical to those passed to (and returned by) dma_map_single().
 
 ::
 
-- 
2.49.0

