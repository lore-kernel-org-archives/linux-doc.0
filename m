Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2C46C07E9B
	for <linux-doc@archiver.kernel.org>; Fri,  9 Jul 2021 13:42:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DDA3C61374
	for <linux-doc@archiver.kernel.org>; Fri,  9 Jul 2021 13:42:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231944AbhGINph (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 9 Jul 2021 09:45:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43301 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231937AbhGINph (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 9 Jul 2021 09:45:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1625838173;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=UjO7PzMYDwKqWrTVmLCQJSFoOel7Kb6tJJsCfZrgkBA=;
        b=HozXq1XpWK0ajA2no/hoU0Eh+u1mLa4EW/gvxSjg8WmN7LmgEzgoEIDD0eVtpa7Vy3KEpL
        0o8n/lwiuY3KNvm3uuWuecPMDtLGgim7su/+vqkPFyWwqKm1QGNePLZpDMjeAbYG8xQ47x
        ZzWvmKuVYcCZIAGgaBpWjBRIrDU4T74=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-486-1gz5AQ_HMG-kZtO2jJfvqQ-1; Fri, 09 Jul 2021 09:42:52 -0400
X-MC-Unique: 1gz5AQ_HMG-kZtO2jJfvqQ-1
Received: by mail-oi1-f199.google.com with SMTP id o15-20020a0568080f8fb029023dd6814af4so6674161oiw.9
        for <linux-doc@vger.kernel.org>; Fri, 09 Jul 2021 06:42:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UjO7PzMYDwKqWrTVmLCQJSFoOel7Kb6tJJsCfZrgkBA=;
        b=tLPx1feb3+FCAtyZRzoRB0kHMBNac/7zKmalsIm9vpNEo47NYL6VvsRo5y/hH/QzFh
         vzQagm+Fwz2ZrkeO90YL+aioH4443VR03A+00qtH2iRWyX3U7X2YGH2Mgde2y3MYo1Lo
         MFsCd1PDFJdMxkCvCXETJE2djV84VBM707OWWzBYmx4M6mojCxaFIoV9yYtinoEG91n3
         VGb4H+7f1nLFzb6py0Uv7ClaTeF1bK7OGJKAPQP1LXDYidM6qPtKMaErw+/7BWcq2JUy
         aKflLdFl7r81pvqQlDRIeMG+r7RCkrMQTlsYKC8a8C1Igj2owojJVt1bpH7d6uafB3dI
         DpEw==
X-Gm-Message-State: AOAM530QpyItqfi7arVYCK8dn0NpsVj8vabgmm1nHvkleXM9ncEPo/5O
        LxonO4JnhcX34vreA7/Tp2FwCoo3FY3F7t45NSX2Cx+265PeVRHquGFOEEx2iu92/PTFUjOl4+L
        NXe6VSO9kou4zgoCJh506
X-Received: by 2002:a9d:dc1:: with SMTP id 59mr27753472ots.246.1625838171650;
        Fri, 09 Jul 2021 06:42:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyoYUu5i8N6kNaYl0+QLRwq8xSRtvtf+Xpkl+ciyEx190t+NOwxARHU2zfR4lvNfosXtdwtGQ==
X-Received: by 2002:a9d:dc1:: with SMTP id 59mr27753455ots.246.1625838171426;
        Fri, 09 Jul 2021 06:42:51 -0700 (PDT)
Received: from localhost.localdomain.com (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id j23sm1215948oie.9.2021.07.09.06.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 06:42:51 -0700 (PDT)
From:   trix@redhat.com
To:     mdf@kernel.org, corbet@lwn.net, hao.wu@intel.com
Cc:     linux-fpga@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Tom Rix <trix@redhat.com>
Subject: [PATCH v2 2/4] fpga: region: introduce compat_id_show op
Date:   Fri,  9 Jul 2021 06:42:27 -0700
Message-Id: <20210709134229.2510349-4-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210709134229.2510349-1-trix@redhat.com>
References: <20210709134229.2510349-1-trix@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Tom Rix <trix@redhat.com>

The sysfs reported value for compat_id is implementation
dependent.  So add an optional op to fpga_region_ops to allow
an implementation to override the default.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/fpga/fpga-region.c       | 3 +++
 include/linux/fpga/fpga-region.h | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/drivers/fpga/fpga-region.c b/drivers/fpga/fpga-region.c
index dfa35c2dc2720..864dd4f290e3b 100644
--- a/drivers/fpga/fpga-region.c
+++ b/drivers/fpga/fpga-region.c
@@ -169,6 +169,9 @@ static ssize_t compat_id_show(struct device *dev,
 {
 	struct fpga_region *region = to_fpga_region(dev);
 
+	if (region->rops && region->rops->compat_id_show)
+		return region->rops->compat_id_show(region, buf);
+
 	if (!region->compat_id)
 		return -ENOENT;
 
diff --git a/include/linux/fpga/fpga-region.h b/include/linux/fpga/fpga-region.h
index d712344fd00a7..236d3819f1c13 100644
--- a/include/linux/fpga/fpga-region.h
+++ b/include/linux/fpga/fpga-region.h
@@ -12,6 +12,7 @@ struct fpga_region;
 /**
  * struct fpga_region_ops - ops for low level fpga region drivers
  * @get_bridges: optional function to get bridges to a list
+ * @compat_id_show: optional function emit to sysfs a compatible id
  *
  * fpga_region_ops are the low level functions implemented by a specific
  * fpga region driver.  The optional ones are tested for NULL before being
@@ -19,6 +20,7 @@ struct fpga_region;
  */
 struct fpga_region_ops {
 	int (*get_bridges)(struct fpga_region *region);
+	ssize_t (*compat_id_show)(struct fpga_region *region, char *buf);
 };
 
 /**
-- 
2.26.3

