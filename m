Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6734C7EE2F
	for <linux-doc@archiver.kernel.org>; Mon,  5 Jun 2023 05:09:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232082AbjFEFJ3 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 5 Jun 2023 01:09:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232467AbjFEFJ1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 5 Jun 2023 01:09:27 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA470B1
        for <linux-doc@vger.kernel.org>; Sun,  4 Jun 2023 22:09:26 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-652a6bf4e6aso1695846b3a.2
        for <linux-doc@vger.kernel.org>; Sun, 04 Jun 2023 22:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685941766; x=1688533766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wwm6y0uAqQL65eNndzr7gfbmRUptPUVk/b+gJobQ0ZE=;
        b=CkTa1wbIo3QGHIpXxwe0tZ5bQOq2jh0qNmEi8n8O6Zl7qUq/+NMTqI9r6E8TsHl087
         DJxkEhQ1FA8aozElBjj72sSTGxZQ8BoG5lONcijyz0ftEROUezGeYCGq4zMtwdtp9uLK
         npBDL2DQqNNaqs3QVTso9e5FHe3iNsdibFFb8bQ3So+x9X1ZY8ZrYviNhCWcbZKvnoN/
         XbRMxkZwwrOZ3zcCKdHkXWkbTK0vJmrFWc87SHaeh4paiCSO+wIYVZ8r7Yn/DpGepItN
         XUuzdzkmNytmsW1nX8DMu6zSdvkT2ReRSVT+fvHC3ZXvBXT3KjZ+VcHZmsqtvhfdTX7t
         9tAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685941766; x=1688533766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wwm6y0uAqQL65eNndzr7gfbmRUptPUVk/b+gJobQ0ZE=;
        b=fat9eHvj+1FiIKwUQzU+aGD3wxAhBdUOiRm3Hd2n7DitWNDu+bmhvGCbmT9IHEfUoy
         IeZcX1amPqYAEdASXPJi8ksy+p0/SeBiKm6xyEsNgs9ymqGJK7X0yMOTSgd6zSQXCKa6
         SDoxjL/2tQAO5JyFdWtMRxHX7BRNgweKOsLjeAw19ZpC+cz2R7l5AFKM8TUv5kaTw4TI
         CT8nxze3B3wmSkk1lOv9udtpsRbjrOj35AStVpKAaY0XDYdSzXSru9GtSt68gX3BxV+w
         qn3tfFODhMKKQgVRvrWeD6CGCvtm8fnD6R1Mct+IZgf3vs51oqdLnencIGeUGcpoeBDk
         SjlQ==
X-Gm-Message-State: AC+VfDzbyIjvbRutZLsTVnhMzUuxhRkA8cY+kqPF60Yf91hguBKKhxA4
        UjGiULiNiB4til0uWPfOsYt8B1o13tYUqw==
X-Google-Smtp-Source: ACHHUZ7A+41eKnG/u3IdkDoLdozgfNSgaF3ptgh5m/NSIvlHyFo5a3hmQ9mo1hD4H0gJj50ugAtc6Q==
X-Received: by 2002:a05:6a00:150a:b0:652:9f37:8d27 with SMTP id q10-20020a056a00150a00b006529f378d27mr5492787pfu.8.1685941765803;
        Sun, 04 Jun 2023 22:09:25 -0700 (PDT)
Received: from localhost.localdomain ([76.132.108.20])
        by smtp.gmail.com with ESMTPSA id fe16-20020a056a002f1000b0064d48d98260sm4329175pfb.156.2023.06.04.22.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jun 2023 22:09:25 -0700 (PDT)
From:   Russell Harmon <eatnumber1@gmail.com>
To:     bagasdotme@gmail.com
Cc:     mpatocka@redhat.com, snitzer@redhat.com, dm-devel@redhat.com,
        linux-doc@vger.kernel.org, Russell Harmon <eatnumber1@gmail.com>
Subject: [PATCH v4 4/4] Documentation: dm-integrity: Document an example of how the tunables relate.
Date:   Sun,  4 Jun 2023 22:08:53 -0700
Message-Id: <20230605050853.6240-5-eatnumber1@gmail.com>
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
 Documentation/admin-guide/device-mapper/dm-integrity.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/admin-guide/device-mapper/dm-integrity.rst b/Documentation/admin-guide/device-mapper/dm-integrity.rst
index 0241457c0027..d8a5f14d0e3c 100644
--- a/Documentation/admin-guide/device-mapper/dm-integrity.rst
+++ b/Documentation/admin-guide/device-mapper/dm-integrity.rst
@@ -213,6 +213,12 @@ table and swap the tables with suspend and resume). The other arguments
 should not be changed when reloading the target because the layout of disk
 data depend on them and the reloaded target would be non-functional.
 
+For example, on a device using the default interleave_sectors of 32768, a
+block_size of 512, and an internal_hash of crc32c with a tag size of 4
+bytes, it will take 128 KiB of tags to track a full data area, requiring
+256 sectors of metadata per data area. With the default buffer_sectors of
+128, that means there will be 2 buffers per metadata area, or 2 buffers
+per 16 MiB of data.
 
 Status line:
 
-- 
2.34.1

