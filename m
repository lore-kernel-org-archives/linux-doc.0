Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 922AEC7EE24
	for <linux-doc@archiver.kernel.org>; Sat,  3 Jun 2023 20:16:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229824AbjFCUQZ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 3 Jun 2023 16:16:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229579AbjFCUQY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 3 Jun 2023 16:16:24 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DBA0CA
        for <linux-doc@vger.kernel.org>; Sat,  3 Jun 2023 13:16:23 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-2565a9107d2so2841804a91.0
        for <linux-doc@vger.kernel.org>; Sat, 03 Jun 2023 13:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685823383; x=1688415383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=USecArDqAdgBTvEoQjoT64yfDEDUCJbu7LC23aKiJj4=;
        b=f+JLU74B3JWqj8IjLFqNWXn0QBMYGxMWXqOvGyXssXNLkdtZTEnC0vVG3ATIs2Qonv
         zWSY76EBT9iScsH4ePkPQbMAmg3V5Oxt0bVKF4S4ic+PFHokb7BKBxpI1bsZI+wtIEQp
         EOdJubjx7ROew4ZeliYo3kC8ghTR/xZTIZzsfLQGOOBo2DZ6B8p0fMQv69+dUFipMZOq
         4ClOQXX+jDuhfitYAgHXwnEMyi5N3AdcIRmB9Jib9RGMaeit3U2O2sL2y8nYdw+gib8h
         eNk/qGVNO4ZyaY7SqmCo7anz0Jt9Ll1yiZa9E+F23XHoto2m4PRUhdVd5MSuyal4tcxJ
         1M9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685823383; x=1688415383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=USecArDqAdgBTvEoQjoT64yfDEDUCJbu7LC23aKiJj4=;
        b=hK+8dxqakULBkchpQmCQq4pVNY2OtHqTgP3TAt+PbpcSeXnj1ZT7nmZhByERRLEd9L
         FAFVsHpTAsS5+u9cofSWH7Cbk2jgsHAFsU5tvroW6nvNGv+KAgwccf4Z1wvd65jw5r7q
         ZJiYuMsyaxjKCVEs1zT98qOq2Me66WYhhT7Nh9+KYrn8ihsKWVKQXkzS1s56WBVKmnS0
         6iUCglDxIkwkB7g1IUDbSDPw2v+9fp4KcSXBUOT/S8tYoADnQ7UrNTTmOv0bX6nbjZX9
         zfxPaLZMIpq2uPdWAVqK+GJWhvyjYyXjdzN918dnodAi7YQ9X8unSsjY0rtyQkEKYfIx
         RaIA==
X-Gm-Message-State: AC+VfDzcJSOSGaUCPPBXvE++jGcYap/Kx53ZELa4FXCzlYKNRykUaPn1
        MsPlXsd5i80IPk0Ue/A9P9vSuR1eTBlFQA==
X-Google-Smtp-Source: ACHHUZ6TB/FMxnHhq46t8yOEkGpuFky25L3vxC/WKvEbcC5vwYhyE+Il+sbHyIxtJdJ2z0yw6fe50A==
X-Received: by 2002:a17:90a:5410:b0:259:17ba:e89a with SMTP id z16-20020a17090a541000b0025917bae89amr1598284pjh.34.1685823382623;
        Sat, 03 Jun 2023 13:16:22 -0700 (PDT)
Received: from localhost.localdomain ([76.132.108.20])
        by smtp.gmail.com with ESMTPSA id u7-20020a17090a1d4700b00250bf8495b3sm5001691pju.39.2023.06.03.13.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jun 2023 13:16:22 -0700 (PDT)
From:   Russell Harmon <eatnumber1@gmail.com>
To:     bagasdotme@gmail.com
Cc:     mpatocka@redhat.com, snitzer@redhat.com, dm-devel@redhat.com,
        linux-doc@vger.kernel.org, Russell Harmon <eatnumber1@gmail.com>
Subject: [PATCH 2/4] Documents the meaning of "buffer" in dm-integrity.
Date:   Sat,  3 Jun 2023 13:15:23 -0700
Message-Id: <20230603201525.9409-3-eatnumber1@gmail.com>
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
 .../admin-guide/device-mapper/dm-integrity.rst      | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/device-mapper/dm-integrity.rst b/Documentation/admin-guide/device-mapper/dm-integrity.rst
index b2a698e955a3..31f514675809 100644
--- a/Documentation/admin-guide/device-mapper/dm-integrity.rst
+++ b/Documentation/admin-guide/device-mapper/dm-integrity.rst
@@ -38,6 +38,15 @@ the device. But it will only format the device if the superblock contains
 zeroes. If the superblock is neither valid nor zeroed, the dm-integrity
 target can't be loaded.
 
+Accesses to the on-disk metadata area containing checksums (aka tags) are
+buffered using dm-bufio. When an access to any given metadata area
+occurs, each unique metadata area gets its own buffer(s). The buffer size
+is capped at the size of the metadata area, but may be smaller, thereby
+requiring multiple buffers to represent the full metadata area. A smaller
+buffer size will produce a smaller resulting read/write operation to the
+metadata area for small reads/writes. The metadata is still read even in
+a full write to the data covered by a single buffer.
+
 To use the target for the first time:
 
 1. overwrite the superblock with zeroes
@@ -106,10 +115,6 @@ buffer_sectors:number
 	The number of sectors in one buffer. The value is rounded down to
 	a power of two.
 
-	The tag area is accessed using buffers, the buffer size is
-	configurable. The large buffer size means that the I/O size will
-	be larger, but there could be less I/Os issued.
-
 journal_watermark:number
 	The journal watermark in percents. When the size of the journal
 	exceeds this watermark, the thread that flushes the journal will
-- 
2.34.1

