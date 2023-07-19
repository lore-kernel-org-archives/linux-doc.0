Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AF97EB64DA
	for <linux-doc@archiver.kernel.org>; Wed, 19 Jul 2023 10:17:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229651AbjGSKRF (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 19 Jul 2023 06:17:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229887AbjGSKRE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 19 Jul 2023 06:17:04 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D79E21FC0
        for <linux-doc@vger.kernel.org>; Wed, 19 Jul 2023 03:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689761772;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type;
        bh=BuruPS9lhc1t9yWa6oN21bRI3YjjBxzYMDFcnENMa/E=;
        b=SA93yACNz1uJQpe++4nLj0WCzvpHKZZ65vwdyMksbA0vn/+QEbjGOz5lSMbHs3vO2LRJOF
        lbhT8TahzLdzmub+IhsWehlxNIH0Y0xByhyLrtR/lCb302yCLrjKTMlxl5bCBoxgG+ep08
        ZSYPGqK5uxrWUdCUzbQ3iGGV3X1X2r0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-451-f-3tOa1BNFCyuE-SI6NumQ-1; Wed, 19 Jul 2023 06:16:09 -0400
X-MC-Unique: f-3tOa1BNFCyuE-SI6NumQ-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3143a431a01so3680947f8f.1
        for <linux-doc@vger.kernel.org>; Wed, 19 Jul 2023 03:16:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689761768; x=1692353768;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BuruPS9lhc1t9yWa6oN21bRI3YjjBxzYMDFcnENMa/E=;
        b=DVSenN66l4VH7oaLyzTK0fL+py11tsSEVbP3903ONGQLebwda1DDukk3BYUiV2uuDC
         r4Xa/tB1mjYhM6FayKfZiY6S6PhKFNN+uaIWKXWyuLKM6+TFOR6xgU+jj9PH2ALaPQ1e
         wxpdkXy17+JI4U9aRvhuXIoNdYNTx18M9Y4FOKOHgQXKwOAEtfUKQOzZ0AirYqGdjFZj
         wdKypoN5KiujM71mu/s3Hz9UZgDY6TELtYmABrQ9YAvvDYFJrf0Gld9ENqR4e2XDN7gq
         2zWZcr+xzr7dUZTtMDo5M2dDaJFVxKqO5u/P7FmV2dldYykfnxOrDN5SQ5lLRCCyoJCv
         siOg==
X-Gm-Message-State: ABy/qLYZscpcsKYnpaJJjbtm5OffVGYWtHNSAYOU+gvaUwHPtHASpYjP
        Ggib+9+yKf2W7tD+YMDGIMJfCMYiIzblIbEolWlKNAuCKHUjvQWHvSfHrliPLg9S5ZTaFenwrUH
        VqzeKLMwwbo6tmpYR1bFi
X-Received: by 2002:a5d:49c7:0:b0:315:94e7:e100 with SMTP id t7-20020a5d49c7000000b0031594e7e100mr1612370wrs.55.1689761768263;
        Wed, 19 Jul 2023 03:16:08 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHvaNhr1gOmNY9eMZGDEyKAg8Zpg7qwsGNYJJBZQv3f1kiSVh1vC5Kv3hERFy3/FF+fPukITA==
X-Received: by 2002:a5d:49c7:0:b0:315:94e7:e100 with SMTP id t7-20020a5d49c7000000b0031594e7e100mr1612350wrs.55.1689761767914;
        Wed, 19 Jul 2023 03:16:07 -0700 (PDT)
Received: from redhat.com ([2.52.16.41])
        by smtp.gmail.com with ESMTPSA id m18-20020a056000181200b0031434936f0dsm4895611wrh.68.2023.07.19.03.16.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 03:16:06 -0700 (PDT)
Date:   Wed, 19 Jul 2023 06:15:59 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     Jonathan Corbet <corbet@lwn.net>, Christoph Hellwig <hch@lst.de>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Robin Murphy <robin.murphy@arm.com>, linux-doc@vger.kernel.org,
        iommu@lists.linux.dev
Subject: [PATCH] dma: DMA_ATTR_SKIP_CPU_SYNC documentation tweaks
Message-ID: <98ef4f76d7a5f90b0878e649a70b101402b8889d.1689761699.git.mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

A recent patchset highlighted to me that DMA_ATTR_SKIP_CPU_SYNC
might be easily misunderstood.

This attempts to improve documentation in several ways:

when used with dma_map_*, DMA_ATTR_SKIP_CPU_SYNC does not
really assume buffer has been transferred previously -
the buffer would often not even exist in device domain
before it's mapped, instead it normally has to be transferred later.

Add a hint on how buffer can be transferred.

Code comments near DMA_ATTR_SKIP_CPU_SYNC focus on
the use-case of CPU cache synchronization while in
practice this flag isn't limited to that.
Make it more generic.

A couple of things I'm thinking about left for a follow-up patch:
- rename DMA_ATTR_SKIP_CPU_SYNC to DMA_ATTR_SKIP_SYNC
  there's nothing I can see making it especially related to the CPU.
- drop mentions of CPU cache from documentation completely
  and talk about CPU domain exclusively, or maybe mention
  CPU cache as an example: CPU domain (e.g. CPU cache).

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 Documentation/core-api/dma-attributes.rst | 5 +++--
 include/linux/dma-mapping.h               | 5 ++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/core-api/dma-attributes.rst b/Documentation/core-api/dma-attributes.rst
index 1887d92e8e92..782734666790 100644
--- a/Documentation/core-api/dma-attributes.rst
+++ b/Documentation/core-api/dma-attributes.rst
@@ -61,8 +61,9 @@ same synchronization operation on the CPU cache. CPU cache synchronization
 might be a time consuming operation, especially if the buffers are
 large, so it is highly recommended to avoid it if possible.
 DMA_ATTR_SKIP_CPU_SYNC allows platform code to skip synchronization of
-the CPU cache for the given buffer assuming that it has been already
-transferred to 'device' domain. This attribute can be also used for
+the CPU cache for the given buffer assuming that it is
+transferred to 'device' domain separately, e.g. using
+dma_sync_{single,sg}_for_{cpu,device}. This attribute can be also used for
 dma_unmap_{single,page,sg} functions family to force buffer to stay in
 device domain after releasing a mapping for it. Use this attribute with
 care!
diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
index 0ee20b764000..13295ae4385a 100644
--- a/include/linux/dma-mapping.h
+++ b/include/linux/dma-mapping.h
@@ -32,9 +32,8 @@
  */
 #define DMA_ATTR_NO_KERNEL_MAPPING	(1UL << 4)
 /*
- * DMA_ATTR_SKIP_CPU_SYNC: Allows platform code to skip synchronization of
- * the CPU cache for the given buffer assuming that it has been already
- * transferred to 'device' domain.
+ * DMA_ATTR_SKIP_CPU_SYNC: Allows platform code to skip synchronization of the
+ * CPU and device domains for the given buffer.
  */
 #define DMA_ATTR_SKIP_CPU_SYNC		(1UL << 5)
 /*
-- 
MST

