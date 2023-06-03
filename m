Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B45A9C7EE24
	for <linux-doc@archiver.kernel.org>; Sat,  3 Jun 2023 20:16:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229579AbjFCUQb (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 3 Jun 2023 16:16:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230123AbjFCUQa (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 3 Jun 2023 16:16:30 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 210D2197
        for <linux-doc@vger.kernel.org>; Sat,  3 Jun 2023 13:16:29 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-256932cea7aso1583634a91.3
        for <linux-doc@vger.kernel.org>; Sat, 03 Jun 2023 13:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685823388; x=1688415388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JV27aquw/ZAgJlQRmYYQBIObAUSulk0jluLIU1m6Gg4=;
        b=UH7K+i9OMMRhlxflF1A5aAcVMzmtbXqvXjlwtqsGf4uq2E86ByoRZG0TziW1UX0DPH
         DIqHm8Qal6odETNMCmhi41k7ZAyhItYenTJWXTJfsjNL6oBNNWgbcAUoti1u1YOrVVuz
         VT/cZ96x9KRUAXUFVJpW1E/rCxBz6NOUPSlHN+o+opdsIp7r++35fETcFGdDL5dZdb/m
         XCAKSu9p7NcRcSGXuif4UtQkrMvHmfO3bf/lSwX7EkrdRM0wXSdm4vxXB+tk8bUwZ0sk
         Rq+ghOZuzRCWLrgaFlGfEK4vg5GWX6ffe2e3J5tfbP0vzrShNNcIcRFmrHiAsI6R3owm
         5viw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685823388; x=1688415388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JV27aquw/ZAgJlQRmYYQBIObAUSulk0jluLIU1m6Gg4=;
        b=WFX0jGBv5cE8GIWNkiojff1XyoqfEvH1qWWLNoZ7JJrRe1Me6bX/jqAN+u04iUC5mT
         sFzB9NaIAoEhJ9j91+iqcWLZLvcS9Dk02MuRyLhksMwfze0dPt7sr25DVnJShDcjpycX
         UESi81pvdB1YzoeghU5yX81xAzcBLXQlXh6Ev4eiRMXJzbN8MWkNl+AYTxyecNGaE6AC
         quejtwIHhM6ZbNkMyksleiMWkyWJQ73tOo8mw4UpTHILM0O6+b5u0rggzB+V/u97HKux
         zP9PaYNr4cjYJ038jf8jJQKGfGsfL/pE5QKjq1jI/mbQJ2DO4iJnzw+2Jym/XQqp+TVx
         31tQ==
X-Gm-Message-State: AC+VfDxr1jTfBL9OOCZSt3AJfWYT3p8pnCO6xgVFj+brieKOwuGYW6Ne
        yjKAvtrwDXvGU0m9U81JxLJHbp4CP0D0Nw==
X-Google-Smtp-Source: ACHHUZ41mu44z+deph4NvL04rLUcVW4YDy9nmQXE5DlaMO6uQEDuzbgKGhztQCtokHlr1aeOyG/Mpg==
X-Received: by 2002:a17:90a:fb52:b0:255:54ce:c3a9 with SMTP id iq18-20020a17090afb5200b0025554cec3a9mr1882850pjb.24.1685823388153;
        Sat, 03 Jun 2023 13:16:28 -0700 (PDT)
Received: from localhost.localdomain ([76.132.108.20])
        by smtp.gmail.com with ESMTPSA id u7-20020a17090a1d4700b00250bf8495b3sm5001691pju.39.2023.06.03.13.16.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jun 2023 13:16:27 -0700 (PDT)
From:   Russell Harmon <eatnumber1@gmail.com>
To:     bagasdotme@gmail.com
Cc:     mpatocka@redhat.com, snitzer@redhat.com, dm-devel@redhat.com,
        linux-doc@vger.kernel.org, Russell Harmon <eatnumber1@gmail.com>
Subject: [PATCH 3/4] Document dm-integrity default values.
Date:   Sat,  3 Jun 2023 13:15:24 -0700
Message-Id: <20230603201525.9409-4-eatnumber1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230603201525.9409-1-eatnumber1@gmail.com>
References: <ZHs2BHGBrJ-YGd-v@debian.me>
 <20230603201525.9409-1-eatnumber1@gmail.com>
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

