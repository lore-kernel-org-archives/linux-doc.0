Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 621ADC48BCD
	for <linux-doc@archiver.kernel.org>; Tue,  8 Jun 2021 21:24:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4E2D4613B1
	for <linux-doc@archiver.kernel.org>; Tue,  8 Jun 2021 21:24:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234808AbhFHV0i (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 8 Jun 2021 17:26:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31963 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234548AbhFHV0T (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 Jun 2021 17:26:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623187465;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Vgj8oqZLl0A1vt9dwKiJZ0f0m4QB6PQYsey/uhZG+bc=;
        b=E4ynXmV/9fUyt1cnd/b0Xudku/LNhq/b5dyNRaPKPPyYdSNZ7QXrNNPhGJ4XIuhHrw2B+E
        JTGjbBZ2g3FLF2nyVTneOsko2RtR+WPDBmzPkggGltzpE141mfQTpoWMoxLZ/79PLYYlxq
        eWFbFwFSL5EzmxkM2NmPbN8E9aDadxw=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-28-goL9SzrRNdutsV4EhRSRIA-1; Tue, 08 Jun 2021 17:24:24 -0400
X-MC-Unique: goL9SzrRNdutsV4EhRSRIA-1
Received: by mail-oi1-f200.google.com with SMTP id a29-20020a544e1d0000b02901eef9e4a58cso8968204oiy.3
        for <linux-doc@vger.kernel.org>; Tue, 08 Jun 2021 14:24:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Vgj8oqZLl0A1vt9dwKiJZ0f0m4QB6PQYsey/uhZG+bc=;
        b=lkUADpbnEpMVe+PCJ2kYrTjSXANlfLY+PsEDxaF6A0hYCeynOdbJ99nOfRIYHFWCsu
         EiTcQNX3fVIJfA6HpJQVZA8Jx+R+Xd9F6c1TBNLU8JIVXjQ3Pai/j0Rx5xDt9iZRpU3C
         FLQIH4jYz0cXFjk/ovhdMhX0Sc35ypgCv8z2SKXLfxUSPULSpl1ZY2gmBXh2sdmsOpa+
         hDEv87Ow00EFjm6vF0pBbI+fCoSyjw7FxrT2XQ97UGxApoFsT1hp0Eq6IsgYu+Z7icSg
         BpT9sZymr02H9QSQKH0MIGNbUBk+NrdIYaHp5XmdYFELzItx7V6IUkq+BhH8/JazCUsO
         4S6Q==
X-Gm-Message-State: AOAM533GmiBPpi3Dlr+X8An1C7n01DEOzSXWEM7SNFhvWcWyJpKKwxnt
        aaZ+fvjWhnFjpYNRCqudxDplr8qzQ5wkU6vNdNNvArYDpu/ERRU+VJMNKoC7/lCMhD1dToRxuRn
        GmKhvvtWDW0JM90ivN6QL
X-Received: by 2002:a4a:315a:: with SMTP id v26mr18955550oog.75.1623187463592;
        Tue, 08 Jun 2021 14:24:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz82nKYiIALAJjZeYKXYeO4V0CO6L9b2b0ozuO1NkuMBf4budBP8Ik6fiODXlFbdCe14KQ8gg==
X-Received: by 2002:a4a:315a:: with SMTP id v26mr18955531oog.75.1623187463421;
        Tue, 08 Jun 2021 14:24:23 -0700 (PDT)
Received: from localhost.localdomain.com (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id x199sm1954310oif.5.2021.06.08.14.24.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 14:24:23 -0700 (PDT)
From:   trix@redhat.com
To:     mdf@kernel.org, robh+dt@kernel.org, hao.wu@intel.com,
        corbet@lwn.net, fbarrat@linux.ibm.com, ajd@linux.ibm.com,
        bbrezillon@kernel.org, arno@natisbad.org, schalla@marvell.com,
        herbert@gondor.apana.org.au, davem@davemloft.net,
        gregkh@linuxfoundation.org, Sven.Auhagen@voleatech.de,
        grandmaster@al2klimov.de
Cc:     linux-fpga@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-crypto@vger.kernel.org,
        linux-staging@lists.linux.dev, Tom Rix <trix@redhat.com>
Subject: [PATCH 09/11] fpga: of-fpga-region: change FPGA indirect article to an
Date:   Tue,  8 Jun 2021 14:23:48 -0700
Message-Id: <20210608212350.3029742-11-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210608212350.3029742-1-trix@redhat.com>
References: <20210608212350.3029742-1-trix@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Tom Rix <trix@redhat.com>

Change use of 'a fpga' to 'an fpga'

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/fpga/of-fpga-region.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/fpga/of-fpga-region.c b/drivers/fpga/of-fpga-region.c
index e405309baadc1..e3c25576b6b9d 100644
--- a/drivers/fpga/of-fpga-region.c
+++ b/drivers/fpga/of-fpga-region.c
@@ -181,7 +181,7 @@ static int child_regions_with_firmware(struct device_node *overlay)
  * @region: FPGA region
  * @overlay: overlay applied to the FPGA region
  *
- * Given an overlay applied to a FPGA region, parse the FPGA image specific
+ * Given an overlay applied to an FPGA region, parse the FPGA image specific
  * info in the overlay and do some checking.
  *
  * Returns:
@@ -273,7 +273,7 @@ static struct fpga_image_info *of_fpga_region_parse_ov(
  * @region: FPGA region that the overlay was applied to
  * @nd: overlay notification data
  *
- * Called when an overlay targeted to a FPGA Region is about to be applied.
+ * Called when an overlay targeted to an FPGA Region is about to be applied.
  * Parses the overlay for properties that influence how the FPGA will be
  * programmed and does some checking. If the checks pass, programs the FPGA.
  * If the checks fail, overlay is rejected and does not get added to the
@@ -336,8 +336,8 @@ static void of_fpga_region_notify_post_remove(struct fpga_region *region,
  * @action:	notifier action
  * @arg:	reconfig data
  *
- * This notifier handles programming a FPGA when a "firmware-name" property is
- * added to a fpga-region.
+ * This notifier handles programming an FPGA when a "firmware-name" property is
+ * added to an fpga-region.
  *
  * Returns NOTIFY_OK or error if FPGA programming fails.
  */
-- 
2.26.3

