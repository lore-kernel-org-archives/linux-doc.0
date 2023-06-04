Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6BF3C77B73
	for <linux-doc@archiver.kernel.org>; Sun,  4 Jun 2023 19:06:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229670AbjFDTGw (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 4 Jun 2023 15:06:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230437AbjFDTGv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 4 Jun 2023 15:06:51 -0400
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06192120
        for <linux-doc@vger.kernel.org>; Sun,  4 Jun 2023 12:06:45 -0700 (PDT)
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-39a55e5cfc0so3745296b6e.3
        for <linux-doc@vger.kernel.org>; Sun, 04 Jun 2023 12:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685905605; x=1688497605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gxCtGKB4/odZJcA7XOpbwNyB264buEilxJGo+B0loX0=;
        b=Ni0UvMVjnsuWgPAoPrAmzZ1oRCkyCzt68KqPSDQHkxO9Mt860D9eMt2unWPzXkiJKj
         tDLqhpdHlslgIACupQh/hLeu7hkvKJeBOyoGjSUmGHnnvPN/CVZY7W1JcU6/NCOOlDb7
         rxNFK6+5CffFG126EolBPYBeEunUL624+kJZ7aSPI5ulJHKF1bwu/Qi6MBUcGYBlPGDN
         rrHiJx/rCs/CdUF5iyUpoanrH3Rm7X4ffWvKFNqYmo337URQmegw8zEh4kQebWy8lydN
         z1XLKrQMMnoqLWE7tWE5GjmINLye2k5wVkJMQV8/38UhFHRTZJN4WHqmPbF2RN8RxVxZ
         Dc3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685905605; x=1688497605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gxCtGKB4/odZJcA7XOpbwNyB264buEilxJGo+B0loX0=;
        b=KBCK9KPnF8kdPz/IQUjvCSdY7Nm/PIaTGnLftY8y92PBttsMnXLF7/4MQqb1UzAQ7n
         Ldr+mHi0upmHxlvUpcvvANGf+ljAKZ9v7/NPhUFV4/uQOP+Mey8wY26vupVhXxwosWsN
         4AbJqI2lVRLDiLVejDXTOZ3+r1y+I3MXBDGe7j9qMhXKUpqup6PawzbLjIHRF1RmjBze
         MCeGbcls0fuaEYZdZsVFJWAEo4coBNpnOmnqb9NlPL8OhgLYzaOJ4uxchggG3E8BnmOz
         4zzZxsek1dI8kNxVkb64iTXoUJ+c6UhP2s6PzxmH8qHKbLlnvHkusiF0sqAF/ul4k2Q9
         cyDA==
X-Gm-Message-State: AC+VfDzwiS8gUusa1rRqJoJDcIZSZCiW/CMYiYBjZOkoqW3FjV6Ms855
        +5bEJ3UXe9L2DRPNNrtf+lgSf6d74rwfSg==
X-Google-Smtp-Source: ACHHUZ6ssUXm3UcAeNUYG9nhiMci3N0tZ8dME7Nxi/34YBG3u2FiT/w1W4ogjgwvVjSTmURMis1QwA==
X-Received: by 2002:a05:6808:298f:b0:398:ad87:2dab with SMTP id ex15-20020a056808298f00b00398ad872dabmr5904321oib.5.1685905604851;
        Sun, 04 Jun 2023 12:06:44 -0700 (PDT)
Received: from localhost.localdomain ([76.132.108.20])
        by smtp.gmail.com with ESMTPSA id m8-20020a170902db0800b001a6ed2d0ef8sm4979072plx.273.2023.06.04.12.06.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jun 2023 12:06:44 -0700 (PDT)
From:   Russell Harmon <eatnumber1@gmail.com>
To:     bagasdotme@gmail.com
Cc:     mpatocka@redhat.com, snitzer@redhat.com, dm-devel@redhat.com,
        linux-doc@vger.kernel.org, Russell Harmon <eatnumber1@gmail.com>
Subject: [PATCH v3 2/4] Documents the meaning of "buffer" in dm-integrity.
Date:   Sun,  4 Jun 2023 12:06:02 -0700
Message-Id: <20230604190604.4800-3-eatnumber1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230604190604.4800-1-eatnumber1@gmail.com>
References: <CA+zrezTegR8jHQA3MNM6WnfFU_RP4=fiCuk6WgwJZsjZ2PYUSw@mail.gmail.com>
 <20230604190604.4800-1-eatnumber1@gmail.com>
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

