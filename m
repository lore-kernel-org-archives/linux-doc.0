Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35AB5C7EE2C
	for <linux-doc@archiver.kernel.org>; Mon,  5 Jun 2023 05:09:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232165AbjFEFJ2 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 5 Jun 2023 01:09:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232351AbjFEFJ1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 5 Jun 2023 01:09:27 -0400
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4298EB3
        for <linux-doc@vger.kernel.org>; Sun,  4 Jun 2023 22:09:25 -0700 (PDT)
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-75d3f2c9d13so241390585a.1
        for <linux-doc@vger.kernel.org>; Sun, 04 Jun 2023 22:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685941764; x=1688533764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JV27aquw/ZAgJlQRmYYQBIObAUSulk0jluLIU1m6Gg4=;
        b=qhTDswsOmVsIGLGcEpRfG7UvCBn8EswedfYBAgAmZQC9hcHrvB4lz5wBH82AZlXovd
         jVids5YuwLOJeU17P2kJQ9k6eLjWPogO9z00b7/47KafKxslu5NZQfeM5tLzrqD8ZZiL
         /DMy40W/DJE1sEoxWaaX0bUZz77BZe15cgbj72b3GuWMVkI/KY6ECMKZYczymPLHf20r
         ih4iHizrXhUlIYNnrbpvXZQiwNpmBfxqXL4j9AXfQklVlkrUfrr6r+MYTFOK7XsUDuQa
         lZV52qioeygsda8+VmiLOk0IDiDWqCFrUXtyU9X2LqIFi4eg93Un1LxNaMXCU+oUeQNQ
         HJ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685941764; x=1688533764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JV27aquw/ZAgJlQRmYYQBIObAUSulk0jluLIU1m6Gg4=;
        b=OL1JrEItumb37DvhnoJ3S8/DjOCs4x1syd64vdkpg61XHRx8ln+se4BXY1KO0kQqzO
         r1P4sANY9AWRS9EjwvfHvgBrO7AU3LvI1rRKCqE7wFuYEDzmIquHQewQ38RHTHk9EkTs
         7KEyE2KBFlPOdmhnRErc6o9cjuyWWL773qIrV60X+Pj07NIIRwihItvQFU6Ccwpwr6ab
         VuA20TklHqEZPE/aX5lgd4UHVIct/FcKbIZTEeU+mZYT2cYuV1Nh/P7jzTB0vjkWyQDq
         vjuvTc4QDMz1NchJdBPO08BnqetGgoGxJvp4BewmrPDpjcv3sJllM4ZuLG3/x3sobXdN
         rh+w==
X-Gm-Message-State: AC+VfDyiBUIpTWoju36NSco1c15ZGeqmtmCwGrm2oIrubg5bhx9LbELx
        5RqQ30QhL/ebb3h38azU15T31aylk0OnFA==
X-Google-Smtp-Source: ACHHUZ4dVa9BGbkpJ2SS7J4by0gwenCyV3fGr7C4RMpOELogeyPD1tHwOfq+IRqOcINi90N0zr2few==
X-Received: by 2002:a05:620a:1a24:b0:75b:23a1:3625 with SMTP id bk36-20020a05620a1a2400b0075b23a13625mr24255840qkb.54.1685941764205;
        Sun, 04 Jun 2023 22:09:24 -0700 (PDT)
Received: from localhost.localdomain ([76.132.108.20])
        by smtp.gmail.com with ESMTPSA id fe16-20020a056a002f1000b0064d48d98260sm4329175pfb.156.2023.06.04.22.09.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jun 2023 22:09:23 -0700 (PDT)
From:   Russell Harmon <eatnumber1@gmail.com>
To:     bagasdotme@gmail.com
Cc:     mpatocka@redhat.com, snitzer@redhat.com, dm-devel@redhat.com,
        linux-doc@vger.kernel.org, Russell Harmon <eatnumber1@gmail.com>
Subject: [PATCH v4 3/4] Documentation: dm-integrity: Document default values.
Date:   Sun,  4 Jun 2023 22:08:52 -0700
Message-Id: <20230605050853.6240-4-eatnumber1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230605050853.6240-1-eatnumber1@gmail.com>
References: <20230604190604.4800-1-eatnumber1@gmail.com>
 <20230605050853.6240-1-eatnumber1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

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

