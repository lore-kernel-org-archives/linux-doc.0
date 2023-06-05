Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D2C7C77B73
	for <linux-doc@archiver.kernel.org>; Mon,  5 Jun 2023 05:09:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232413AbjFEFJ1 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 5 Jun 2023 01:09:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232165AbjFEFJY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 5 Jun 2023 01:09:24 -0400
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com [IPv6:2607:f8b0:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC924B1
        for <linux-doc@vger.kernel.org>; Sun,  4 Jun 2023 22:09:23 -0700 (PDT)
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-33b1da9a8acso22224955ab.3
        for <linux-doc@vger.kernel.org>; Sun, 04 Jun 2023 22:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685941763; x=1688533763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gxCtGKB4/odZJcA7XOpbwNyB264buEilxJGo+B0loX0=;
        b=NIxZPq0dNPwwyqmLx/t7+TU07PeNHNWQegTRVDAf+qsMTvVAa57XuSQAv7oaUgolsz
         4o1Rky3Q3lCBDArzo/wuQPs6MDX3vIFjGFYf/qQJDWjr785SQNHjSmHv05heOYOw98hp
         fzykSdlD/Vv5m9duRl1DNxnhD3kxPrXySAIQvsfmHtkMlWGigRGBrnc+0wUZfOR0VPMr
         m+KI8Jgj87sPCTpgDW/s8WsdpmpQsVw3oxyWneChNro3gkDWsjZ2JVS0N2/5CZXNdITV
         SiOyCyZZDLcmw+WO2ytU4cXAvRn87UOZIde8zwoaHX6gdxZk/Y0ikMwKwcWI1+88sgZf
         rxYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685941763; x=1688533763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gxCtGKB4/odZJcA7XOpbwNyB264buEilxJGo+B0loX0=;
        b=PIPkEf8H4vS89dHOoYRfEl++6T+ILw8E5xASXZJ5dSR/+9T8te+a4Y3E/Hsee+cLEq
         LmEuBwCBN0SEanGHutScNF0afOGIdYoPyw0ieNZee66PbGygonYGShRYgj9ClCfii8f7
         xNhvBSRg0D5rIwY9AVe41x2+qhZT1SAizX2sDcDqfo3q7Ou8P+R+G2SCN7LhCxa+ryai
         iBUVSfAy0mvW2NMPW6C7pyWKy3k5XT12ZkD15gX6BKTpBzlao41UWpv/V7lBxg9SYalm
         L3dEUglGKBXJ243/MepLVBqPpUVgga1YJrDceWyKdANAOLAjq5B5Nqx+P6LQy5uBDzYB
         vwbw==
X-Gm-Message-State: AC+VfDxDyCZe3EIbyApTi7y1UlDjsf/jsHFHImQ3v1fyWYuqa9SlW9ws
        EZyIxKUsjqS/SrwcP+iKrWeM6N2wgqnnkw==
X-Google-Smtp-Source: ACHHUZ60cJPCU5c2Z31OTJ0Ltf0fy4A4LvBh+XDacnGy9xXs5a9nqxcHEjW8sk1BcPEujSTDrlHz1g==
X-Received: by 2002:a92:cc11:0:b0:331:105c:81f9 with SMTP id s17-20020a92cc11000000b00331105c81f9mr19454579ilp.29.1685941762771;
        Sun, 04 Jun 2023 22:09:22 -0700 (PDT)
Received: from localhost.localdomain ([76.132.108.20])
        by smtp.gmail.com with ESMTPSA id fe16-20020a056a002f1000b0064d48d98260sm4329175pfb.156.2023.06.04.22.09.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jun 2023 22:09:22 -0700 (PDT)
From:   Russell Harmon <eatnumber1@gmail.com>
To:     bagasdotme@gmail.com
Cc:     mpatocka@redhat.com, snitzer@redhat.com, dm-devel@redhat.com,
        linux-doc@vger.kernel.org, Russell Harmon <eatnumber1@gmail.com>
Subject: [PATCH v4 2/4] Documentation: dm-integrity: Document the meaning of "buffer".
Date:   Sun,  4 Jun 2023 22:08:51 -0700
Message-Id: <20230605050853.6240-3-eatnumber1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230605050853.6240-1-eatnumber1@gmail.com>
References: <20230604190604.4800-1-eatnumber1@gmail.com>
 <20230605050853.6240-1-eatnumber1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

"Buffers" are buffers of the metadata/checksum area of dm-integrity.
They are always at most as large as a single metadata area on-disk, but
may be smaller.

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

