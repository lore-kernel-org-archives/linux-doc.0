Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4982D23BD
	for <linux-doc@vger.kernel.org>; Tue, 24 Jun 2025 13:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750772382; cv=none; b=gwICvDGZp6kdLd5zrb9Z47RGO3s80b5NiJZIx0+T9GbADqgCpXO3vJF93fLVka3fkP5ugrqTIrCpNKHB6NMohxANljL2MCzjvR3G7eeD4vYspTv2d0976HPlPgPa8rhQjyjIQQPxFwqQmLevsNau3DN+ioROPCwOV5g7D5y2UyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750772382; c=relaxed/simple;
	bh=QT9inBggY1If/sJ/J64i0f/T+fZ+JZCkAwwWoVQBbug=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Tp+i655fT4qNYMRjWH5XX5xJeqpofTDsWkrlhC7MV7fXU198U7IkKQEfoBJVwWgWdpay7jBjjuluyfiy3iqqaqnaUpGScuDPwvvdzBsSgX1LXm6rKFOz4BIthqeyfWFhpQbtx8QEmcakiEcYh9tayKQogpxDB3gX62PFth3dZWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=BCWI0PGy; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="BCWI0PGy"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45306976410so1905805e9.3
        for <linux-doc@vger.kernel.org>; Tue, 24 Jun 2025 06:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750772379; x=1751377179; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4sx2Gr9jg00N7+zRyz0IpMFfOiCDQPryj3aB7m6WADE=;
        b=BCWI0PGyCv0/xS3ddpxHK7jaMwd/iSqoufKjDIul00unT+kyGM51soBla8Ulns7pfZ
         q/exk4su2PBT2r4To2uKqAxJYhpdVjom9ZPpGEXxCrHBL8C2/OFV20QoRWXcp1CxL02A
         RJ+1daq3yWKV1wu3XbmZwhnuao9+dRTnKg1puo8om0SRMwTvNCXSvY0SvZjh1KqxsWDK
         svNIKd2vvExxyqRWS0QoPxXkEMkLZJBuh7DPltGbH32FW3Q5PXM4xVzaumK6hoHemcjo
         3v7b5kbXlIVm4EeWFwAnEtaF8PYA5TnbJaJiIRtoINCUEiRIT6px4ksTUFKuw01wd0ZC
         0jtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750772379; x=1751377179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4sx2Gr9jg00N7+zRyz0IpMFfOiCDQPryj3aB7m6WADE=;
        b=G19hOZkmDsIcg45aRaFHPvLZ6W9ZxRIYt2xhKF4bLPfHjeKADeuwJiNq/PFMTZZ0Ji
         8QrlC2u8nueRScY7V47y16ZXAfMlsjQsMo60QlVeMOmQbBBiors66uhWHjxzvGKMkt/I
         kSgFgo3rmajCxuZomzo6oGToMUPtRyAO/v8Uvo4YWWZCRtNXUDdtiwq+/QANHukN952z
         McbpIvt+3ZOO6T2ZGmSyakEHpEJLYLXcDm8WwPDb4TZy+Zb9b0yiytmoZWdE6EDykhcY
         792D8fDiI+7ZWxNTsksdVaSBUxh2y5hvf3tIJZKUPc7K6OICyDmqd7sDnDyYaTjm08MZ
         V2mQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4n0mdflKGZZQQ4/X0++IY34QdOP3ExSehoqG1Q6Zw9YemvsmS/ZjT2tFQcRQD521cSg/VnKYWZaM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQYeZ0Mx9vO1GJpUCd4Jt6kxMzEzVn+RuE1yJBSn1AM07zIcuo
	Z5HybGto6/p3AqXwiFXvzgAjhBUMANuqwukQUTLRqfBIZzsvBxcLh1ZFmPduZ6yQIfs=
X-Gm-Gg: ASbGnctliAWSU3DbqjM9AzZWjYn3ivBjj+guyqfPz8bQA0S000dgHvDVoMoOxDnUR0+
	PWfUlOy/7GdDOL9c6rX12fnWB/cAumekYDqf4ZB2upDBBYuuSQiQvGW7qnWn2POfih8wQa6VTJP
	elVXldNrh7XGcHpwDpHXy1oJnk12H4Btm2cERYx+ZyIacxiB6V6qiw9CrQZNUz525QRufsQeL9/
	nvXVhz8wxCQbi6wvYtjwxkXl8iT0SSlFxonrQLuTeim+cw4vy6LPoAoU870/6jEHcMutffok0u+
	DbgHNEcF0oyV/fFbPO+OoIHxVwIYH3abpprSx+cAALuxYYirISAszfi/wXerAslz/+MtbqBD0FH
	fBoCiX36La1CYWGinsnSYntmFLkSmw08PeG80dMYeh2xW3iDCTx87
X-Google-Smtp-Source: AGHT+IHjfatN3aA0WosLoWdQDyKydeoZw/uVFREpIVO7tEoIVnSxxs5IGUHXJ6h6lYlWKWIGlOYciQ==
X-Received: by 2002:a05:600c:4e8a:b0:451:eed7:6d76 with SMTP id 5b1f17b1804b1-453659ca55cmr57962935e9.8.1750772378926;
        Tue, 24 Jun 2025 06:39:38 -0700 (PDT)
Received: from localhost (dynamic-2a00-1028-83b8-1e7a-3010-3bd6-8521-caf1.ipv6.o2.cz. [2a00:1028:83b8:1e7a:3010:3bd6:8521:caf1])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a6e805100dsm2044971f8f.18.2025.06.24.06.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:39:38 -0700 (PDT)
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
Subject: [PATCH 8/8] docs: dma-api: clean up documentation of dma_map_sg()
Date: Tue, 24 Jun 2025 15:39:23 +0200
Message-ID: <20250624133923.1140421-9-ptesarik@suse.com>
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

Describe in one sentence what the function does.

Do not repeat example situations when the returned number is lower than
the number of segments on input.

Signed-off-by: Petr Tesarik <ptesarik@suse.com>
---
 Documentation/core-api/dma-api.rst | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/Documentation/core-api/dma-api.rst b/Documentation/core-api/dma-api.rst
index 65132ec88104..f5aadb7f8626 100644
--- a/Documentation/core-api/dma-api.rst
+++ b/Documentation/core-api/dma-api.rst
@@ -308,10 +308,10 @@ action (e.g. reduce current DMA mapping usage or delay and try again later).
 	dma_map_sg(struct device *dev, struct scatterlist *sg,
 		   int nents, enum dma_data_direction direction)
 
-Returns: the number of DMA address segments mapped (this may be shorter
-than <nents> passed in if some elements of the scatter/gather list are
-physically or virtually adjacent and an IOMMU maps them with a single
-entry).
+Maps a scatter/gather list for DMA. Returns the number of DMA address segments
+mapped, which may be smaller than <nents> passed in if several consecutive
+sglist entries are merged (e.g. with an IOMMU, or if some adjacent segments
+just happen to be physically contiguous).
 
 Please note that the sg cannot be mapped again if it has been mapped once.
 The mapping process is allowed to destroy information in the sg.
@@ -335,9 +335,8 @@ With scatterlists, you use the resulting mapping like this::
 where nents is the number of entries in the sglist.
 
 The implementation is free to merge several consecutive sglist entries
-into one (e.g. with an IOMMU, or if several pages just happen to be
-physically contiguous) and returns the actual number of sg entries it
-mapped them to. On failure 0, is returned.
+into one.  The returned number is the actual number of sg entries it
+mapped them to. On failure, 0 is returned.
 
 Then you should loop count times (note: this can be less than nents times)
 and use sg_dma_address() and sg_dma_len() macros where you previously
-- 
2.49.0

