Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03C64C7EE23
	for <linux-doc@archiver.kernel.org>; Sun,  4 Jun 2023 19:06:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231368AbjFDTGz (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 4 Jun 2023 15:06:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230437AbjFDTGx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 4 Jun 2023 15:06:53 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40FD3DA
        for <linux-doc@vger.kernel.org>; Sun,  4 Jun 2023 12:06:47 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1b04706c85fso38253655ad.0
        for <linux-doc@vger.kernel.org>; Sun, 04 Jun 2023 12:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685905607; x=1688497607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v181M03vb06+Rh0AY4HYkr+GW7+0CiOJfqvRtVjcRHc=;
        b=CyVO5qY6Qa0xu8voeVRCTCoHLyFRt3+B0f/tiaZEbQYj7PDh7BQqFdzPS7TiVnt/bg
         iVSOHfqDNybrBejt2Jpk93INmxcKJ1hgYV9fugvdj1UByDfUoh4Gez39FKjer6mb3h6k
         6/wMrOnXYr4PrFDf2UFCdOVCEPzDG0T5v61/4U5qWbr1qiQk4myqoU+enbjGW1fhCLgL
         b0PHPP4JSH05lGFRQeo/79wifH+wbyPqnwEljMs3fQM9htem4AI1opL+ER1X8nFS0EjM
         gk9mEXyDxjx7y3ltnYTkWUlpYyqpnmpKuvcpIide+jYxBG99Gtw/6lB4zOzfm3yfKD3g
         8gZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685905607; x=1688497607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v181M03vb06+Rh0AY4HYkr+GW7+0CiOJfqvRtVjcRHc=;
        b=SSyPnOcWfQ1PyX/o3uOLFiwKxgoW83Vva48GGDPxCMIre9PXOUprkxgqn59QhZJ4ot
         VbBUw9v+Lvg7+skU/GHzfdpK29RBstf19E7Aq5dM6PVc9JB4IsOL+YSpjrQbSPoYSR0P
         j4o1mQ8CxtwVdzonyuTi9EzIKKWDZann2/NZvTFL8N2Nj/s0kVkyyBDuoanCiEHsqXT4
         YwfQW+U5MCWoVhW/xpo/ycvk0q3fidpuKklQS5dqnIkeDNevjcPfQBnbOwjdmdGJ8ofF
         m4S10z+UDggsln/rasmhqsAKCZ2GYwkrYnfZc4wSHoTQGE53MxLXmkyRTv3aTNcF0WPV
         uDgA==
X-Gm-Message-State: AC+VfDw0o6tAxeGYd8RESnQywiw3gA14a+DED5yjBnNJ95KZR7Egs7ym
        P/ed7jXpCMVAo4gWbHfKNK0hd5rfiEE/Ew==
X-Google-Smtp-Source: ACHHUZ5PaUHC2vpAgmMHxRGyYeYhLLkOMZR+zE4hr51QE2B05P+PbgCO49FoubrAf77Mk/I0L7tBSQ==
X-Received: by 2002:a17:903:24e:b0:1af:e8cf:7004 with SMTP id j14-20020a170903024e00b001afe8cf7004mr6534147plh.15.1685905606456;
        Sun, 04 Jun 2023 12:06:46 -0700 (PDT)
Received: from localhost.localdomain ([76.132.108.20])
        by smtp.gmail.com with ESMTPSA id m8-20020a170902db0800b001a6ed2d0ef8sm4979072plx.273.2023.06.04.12.06.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jun 2023 12:06:46 -0700 (PDT)
From:   Russell Harmon <eatnumber1@gmail.com>
To:     bagasdotme@gmail.com
Cc:     mpatocka@redhat.com, snitzer@redhat.com, dm-devel@redhat.com,
        linux-doc@vger.kernel.org, Russell Harmon <eatnumber1@gmail.com>
Subject: [PATCH v3 3/4] Document dm-integrity default values.
Date:   Sun,  4 Jun 2023 12:06:03 -0700
Message-Id: <20230604190604.4800-4-eatnumber1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230604190604.4800-1-eatnumber1@gmail.com>
References: <CA+zrezTegR8jHQA3MNM6WnfFU_RP4=fiCuk6WgwJZsjZ2PYUSw@mail.gmail.com>
 <20230604190604.4800-1-eatnumber1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Specifically:
  interleave_sectors = 32768
  buffer_sectors = 128
  block_size = 512
  journal_watermark = 50
  commit_time = 10000

Signed-off-by: Russell Harmon <eatnumber1@gmail.com>
---
 .../device-mapper/dm-integrity.rst            | 22 +++++++++----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/Documentation/admin-guide/device-mapper/dm-integrity.rst b/Documentation/admin-guide/device-mapper/dm-integrity.rst
index 31f514675809..0241457c0027 100644
--- a/Documentation/admin-guide/device-mapper/dm-integrity.rst
+++ b/Documentation/admin-guide/device-mapper/dm-integrity.rst
@@ -102,7 +102,7 @@ journal_sectors:number
 	device. If the device is already formatted, the value from the
 	superblock is used.
 
-interleave_sectors:number
+interleave_sectors:number (default 32768)
 	The number of interleaved sectors. This values is rounded down to
 	a power of two. If the device is already formatted, the value from
 	the superblock is used.
@@ -111,16 +111,16 @@ meta_device:device
 	Don't interleave the data and metadata on the device. Use a
 	separate device for metadata.
 
-buffer_sectors:number
-	The number of sectors in one buffer. The value is rounded down to
-	a power of two.
+buffer_sectors:number (default 128)
+	The number of sectors in one metadata buffer. The value is rounded
+	down to a power of two.
 
-journal_watermark:number
+journal_watermark:number (default 50)
 	The journal watermark in percents. When the size of the journal
 	exceeds this watermark, the thread that flushes the journal will
 	be started.
 
-commit_time:number
+commit_time:number (default 10000)
 	Commit time in milliseconds. When this time passes, the journal is
 	written. The journal is also written immediately if the FLUSH
 	request is received.
@@ -168,11 +168,10 @@ journal_mac:algorithm(:key)	(the key is optional)
 	the journal. Thus, modified sector number would be detected at
 	this stage.
 
-block_size:number
-	The size of a data block in bytes.  The larger the block size the
+block_size:number (default 512)
+	The size of a data block in bytes. The larger the block size the
 	less overhead there is for per-block integrity metadata.
-	Supported values are 512, 1024, 2048 and 4096 bytes.  If not
-	specified the default block size is 512 bytes.
+	Supported values are 512, 1024, 2048 and 4096 bytes.
 
 sectors_per_bit:number
 	In the bitmap mode, this parameter specifies the number of
@@ -291,7 +290,8 @@ The layout of the formatted block device:
     Each run contains:
 
 	* tag area - it contains integrity tags. There is one tag for each
-	  sector in the data area
+	  sector in the data area. The size of this area is always 4KiB or
+	  greater.
 	* data area - it contains data sectors. The number of data sectors
 	  in one run must be a power of two. log2 of this value is stored
 	  in the superblock.
-- 
2.34.1

