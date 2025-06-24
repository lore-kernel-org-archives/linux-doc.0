Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96FAA2D23B5
	for <linux-doc@vger.kernel.org>; Tue, 24 Jun 2025 13:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750772381; cv=none; b=iXza5CXhLN69hF9vydyPguyqsjIgpXtgzwBoBrju4FgtBVjTL3eFaN9SnK9KX6mAHDmlbEymr3avewawsc7Or9DQB2kjskccQelvHXoJuqYJBJjSakoOiiqzIJakFBlz29S6hAubADQP++CwXIPytl37HJV3jrio9Rr2tnPDejc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750772381; c=relaxed/simple;
	bh=csFIrfXy0fedNjjmAddrddMk/Vqb6fR+cfz6pIU/Vd4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gGy1HiFW0yWcJgzvSHJuAHqWwscLHp+hvTtX80wMggr8RBDwjwx1VUBWoK4c1PZ7YiH6IAPNWnJxjPxyHDFcUp21vmUcm4rk6t+y8ssBNMUXtL7goFHFg2DH898MnoQoUjSNzzUIc+Yk90rZ61doJu99zFakSK4tFYi8kYfkOkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=f4tyvbx2; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="f4tyvbx2"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4535fc0485dso6948145e9.0
        for <linux-doc@vger.kernel.org>; Tue, 24 Jun 2025 06:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750772378; x=1751377178; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MIxqpUsJs9BGJgIKtRsM8twkmF7DXFUM7UQBjMXgiB8=;
        b=f4tyvbx2EL05OH4YlSJFuhpYGb+NE9wRaMAYGctPhke4zkdkb1Zp5zrka1OHb2nq25
         ZFbbIZi9YdHbgRukaIiy1xQnzXbmXixxY7VNZ/aqHk3i4WNgmaAoIfKtDD115cXsAg8C
         FWOMPMIqNt2P2rEwEHHrS1LqF7MvszrUv+XrTOsg0RJt/3tHMLLUfGEghN6J6FBoKh5m
         4wNhPGn7Bru60IhC2wYPEVYgMluXsMvqT/3bGdBx4tAbTuf3bj36ulI7OdeH3j495j3a
         CwaDDWwOnwCdHgih+0GFWXL+OwzgJ6LvvinTGG7pcZBEzFEY6xoiDkFh14apxLCytZwF
         Qvkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750772378; x=1751377178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MIxqpUsJs9BGJgIKtRsM8twkmF7DXFUM7UQBjMXgiB8=;
        b=NvQsAD+qcT3YpwpZeMQOFb70x8303Vw+rkqD8xjjaAwBRho/vZUWgoXN5RnQcESocx
         skH3Hc96VxwN5izG1PzS+b/QYrnywd7xlvbRaGBbURua3k6YCupie3jt2wVwx0T5Ehw2
         OebW3ktEWc2fZBA/605jny2HIxGj/pWi+62NuA5TCtIwa7A8T6ByLQFePszp399g6rNf
         q8SOf+MSRas9dhWEyETN78ppArJsaMlXBRQxMJZj/hTSR1/XxKn9ECe3pjnfOEXT4L3c
         MrZ4rtHazt8FZL4TQGalsQ3CyuNe78Hy6mzn/n2DpROXF+3eARXjro3vzJiyaNGeHto7
         +ZKA==
X-Forwarded-Encrypted: i=1; AJvYcCU274cJ4zc2+cuOBY9oo1SWyJHCQ/JzxH8K3GfnnLxCJtH4hE3xsJRHJ6GwaOE7gT60IhQIBrrrRuU=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywq8DyFOwc3rYlrNREkGzPN2kQ3qkz0+aB61frDAOChvpdt2DIL
	4jutQqgpcSqHXw+D6j//6P/pIHFbg81lzwnOjQmpFeTznxZT1sS8QisGyf1iAD0lxBw=
X-Gm-Gg: ASbGncu/aT0UlQdU2zjPU6aIEAJ0kAiGW56538eQ2//CBXaNwOjYnZuPPJLkk85Z006
	PeMwjoeIexT2kA/UE5MkUY0HfsNDK9/Ec2kV2GKRlZqtOwUydPujQ7OzoleTaGqJvK7WoOj06ns
	RoAxKaKgOuLJUQfDNCxJ+M0B2G8QdHz0ovz94SVk6l7ha+n2+BzlMI7aifW/P1u6V268GMyvOJw
	5Us4gNg39QV0lG2tadcGJXkBIxkNN3FLEjGIEG98OjaxZoMQX+aEuhWviYGJbRaUivogjX7/8dg
	+0j/LwFT5bhDPyfHrNq6uJivu2oriDFc6OPT0wiqut3X+xGM2PKPBoStqR/5krSCgYfIcpvFEp7
	Juwmbq/PVANKOGl9IEhZozFglc7It74528XCf6USy64GmJxMMToa7
X-Google-Smtp-Source: AGHT+IEjaxkBLFq2C7HKp7UXXzPUtMdjdq0jQWl+WGokmC3baJpMc/moJUhdPmwtbE7N5mn13G5tFA==
X-Received: by 2002:a05:6000:2013:b0:3a3:6a3f:bc61 with SMTP id ffacd0b85a97d-3a6d12f9a28mr5299380f8f.7.1750772377699;
        Tue, 24 Jun 2025 06:39:37 -0700 (PDT)
Received: from localhost (dynamic-2a00-1028-83b8-1e7a-3010-3bd6-8521-caf1.ipv6.o2.cz. [2a00:1028:83b8:1e7a:3010:3bd6:8521:caf1])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4535eac8e19sm175942315e9.21.2025.06.24.06.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:39:37 -0700 (PDT)
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
Subject: [PATCH 7/8] docs: dma-api: update streaming DMA API physical address constraints
Date: Tue, 24 Jun 2025 15:39:22 +0200
Message-ID: <20250624133923.1140421-8-ptesarik@suse.com>
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

Clarify that SWIOTLB also allows to use any physical address with the
streaming DMA API. Remove the requirement to use platform-dependent flags
to allocate buffers for dma_map_single().

Do not claim that platforms with an IOMMU may not require physically
contiguous buffers. Although the claim is generally correct, it is
misleading, because the current implementation of the streaming DMA API
explicitly rejects vmalloc addresses, no matter if an IOMMU is present or
not.

Signed-off-by: Petr Tesarik <ptesarik@suse.com>
---
 Documentation/core-api/dma-api.rst | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/Documentation/core-api/dma-api.rst b/Documentation/core-api/dma-api.rst
index cd432996949c..65132ec88104 100644
--- a/Documentation/core-api/dma-api.rst
+++ b/Documentation/core-api/dma-api.rst
@@ -210,18 +210,12 @@ DMA_BIDIRECTIONAL	direction isn't known
 	this API should be obtained from sources which guarantee it to be
 	physically contiguous (like kmalloc).
 
-	Further, the DMA address of the memory must be within the dma_mask of
-	the device.  To ensure that the memory allocated by kmalloc is within
-	the dma_mask, the driver may specify various platform-dependent flags
-	to restrict the DMA address range of the allocation (e.g., on x86,
-	GFP_DMA guarantees to be within the first 16MB of available DMA
-	addresses, as required by ISA devices).
-
-	Note also that the above constraints on physical contiguity and
-	dma_mask may not apply if the platform has an IOMMU (a device which
-	maps an I/O DMA address to a physical memory address).  However, to be
-	portable, device driver writers may *not* assume that such an IOMMU
-	exists.
+	Mapping may also fail if the memory is not within the DMA mask of the
+	device.  However, this constraint does not apply if the platform has
+	an IOMMU (a device which maps an I/O DMA address to a physical memory
+	address), or the kernel is configured with SWIOTLB (bounce buffers).
+	It is reasonable to assume that at least one of these mechanisms
+	allows streaming DMA to any physical address.
 
 .. warning::
 
-- 
2.49.0

