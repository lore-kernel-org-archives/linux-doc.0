Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B57F0C7EE2D
	for <linux-doc@archiver.kernel.org>; Sat,  3 Jun 2023 20:16:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230123AbjFCUQc (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 3 Jun 2023 16:16:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230051AbjFCUQb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 3 Jun 2023 16:16:31 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E38C21A5
        for <linux-doc@vger.kernel.org>; Sat,  3 Jun 2023 13:16:30 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-256e1d87998so2830475a91.3
        for <linux-doc@vger.kernel.org>; Sat, 03 Jun 2023 13:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685823390; x=1688415390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wwm6y0uAqQL65eNndzr7gfbmRUptPUVk/b+gJobQ0ZE=;
        b=SaxRLzAd7y4zj+f1kN0amvL/CKWwpXxMz7fOnx9YTL8d+eTntOKPVWutDtDppKWgnP
         KHKiVt8IeTBQws2yv2ABqUTV1VIIihOTzJbX9IKsoUcQ8ENAEkH7E18so4w9by3FxoLK
         vy60QLZKnQNJxDW4mz9vnsVKExYLfB4NdDBVjlJYvTXfA58u4L/DY0ThBu/1c1Zo1TwZ
         4U10TvXnnZSKDyveK+sBvz5+WtYQxh3pH20hPNlJkcOW6uT6gVJ8PhX72klO7claDCOz
         vKNXD/7GUubcLYOjy27gPVbmdNSITTnMGbN2Zx6NZBAr4tx3YMbnDpcZDizCHsTLQ1OI
         dQ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685823390; x=1688415390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wwm6y0uAqQL65eNndzr7gfbmRUptPUVk/b+gJobQ0ZE=;
        b=lkAZlj9zPmm1ispWYb4MXZMoB3QAHDlNetf1kRXXoxqi6M/5Y7/ScygY9G3tVZ0Rty
         mbDsaJKsBzD72W7QLqTblM/lpClFokHHkcjPHEPxHnPBzu5J0JlGk286prUiHWrzkFei
         MgC69JH1IRsu9FfwVtwVVON3RKmi0vrNoJ7SBKwnIZWhTJ37VwsbuvyF0+5wJQrWgxGw
         m+B0Rn5ZFYRNgWA+cRX6Lh+sv3Vd/ywaJZclWdanaCG5oi6lQyKgn5iLHvmxRdTja9V4
         bDPgMNyFtLMlaCmCHg3nndHJ5lX0k6YR8gW7ZW9/2okNU615H3IfblEvvP5ULwtUnodq
         R45Q==
X-Gm-Message-State: AC+VfDyVYRx/jGN/EWR6XN2DAscQeQ5p40fDkdln6YkfsddIM2UzDUSH
        x0ZUWW4WKwtjLLtynAw3TqQ=
X-Google-Smtp-Source: ACHHUZ6+DVIaDXY3V4bk2UJ3VMYDkDps43QEvbrdIPHt71i0o9LwdWP4g09RbzJWV7xwkfyS6nalSA==
X-Received: by 2002:a17:90a:7147:b0:253:74f8:1e31 with SMTP id g7-20020a17090a714700b0025374f81e31mr3089623pjs.39.1685823390075;
        Sat, 03 Jun 2023 13:16:30 -0700 (PDT)
Received: from localhost.localdomain ([76.132.108.20])
        by smtp.gmail.com with ESMTPSA id u7-20020a17090a1d4700b00250bf8495b3sm5001691pju.39.2023.06.03.13.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jun 2023 13:16:29 -0700 (PDT)
From:   Russell Harmon <eatnumber1@gmail.com>
To:     bagasdotme@gmail.com
Cc:     mpatocka@redhat.com, snitzer@redhat.com, dm-devel@redhat.com,
        linux-doc@vger.kernel.org, Russell Harmon <eatnumber1@gmail.com>
Subject: [PATCH 4/4] Document an example of how the tunables relate in dm-integrity.
Date:   Sat,  3 Jun 2023 13:15:25 -0700
Message-Id: <20230603201525.9409-5-eatnumber1@gmail.com>
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

