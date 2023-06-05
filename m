Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D007FC7EE24
	for <linux-doc@archiver.kernel.org>; Mon,  5 Jun 2023 05:09:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229905AbjFEFJ0 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 5 Jun 2023 01:09:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232082AbjFEFJW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 5 Jun 2023 01:09:22 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52165B3
        for <linux-doc@vger.kernel.org>; Sun,  4 Jun 2023 22:09:21 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-6b15f091949so1061900a34.1
        for <linux-doc@vger.kernel.org>; Sun, 04 Jun 2023 22:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685941760; x=1688533760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GG3Hy7n4oCrePrc6XsNght2qZ/b76zbKsk6sMW+iZsQ=;
        b=U1ZW4BIbWhNaNxfMryztBiiIO7/0IYx01JsAjAo68om3mZkg+UgAc+PWbCCFnzpgAX
         sokf3YnOkd6Qjb5zCXfnYm8ilN4I9VEEeiNHLfM+xFPUZgH38en+ObDzx79yygdxGaMz
         SAh2twNFV95v35LjTqnvD3xI0BobOAdzdUhrIRR5HhBX8EuBzK7MCXNPhBm1rPOyMu/j
         f9mSnjAn3E3Oplyucy7VBPms36nYQbhPIYgtyz081d8QgFUxSPw+2/jSjyHHNjPjl7ht
         l8yVIkbZxvzmPbZLopTKIi8c1HoZTuAjNbzEJI5SdxARa+fWhbSwiMUgHJCw1zYJuQpJ
         ukCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685941760; x=1688533760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GG3Hy7n4oCrePrc6XsNght2qZ/b76zbKsk6sMW+iZsQ=;
        b=BmIS4KiRFYTwJLe8d2o/qjb4BGSg3oLz5edvaZLkcAEeyLAZvpuvL3caH3VU4eP5cA
         iFeMQYYOR1GxNYKWibKX5VQNJ+08shxzp5HDDpo65RwhQFXiLyCaerfby4fEWDa5JvLB
         WDy2Rskd4tsPYExwnmfFJ0J5KzDqG5w9P6L1djgVzUqw9E0gdPSzD0X/Kt9nxARzxoR0
         NlnmItBHrcJIWHVp7x/Wxce1nLw+/DtH+CD+6jSrWNuZgCvIACSM6/uZHsKQYZDTr1Hl
         A/Tvtg1KKJAFGWLdMM3KcM5aw4YXBrCmwVSUm1ivCspIvDxiYCjNv2HqOG4OU1NEXRV1
         t3vA==
X-Gm-Message-State: AC+VfDxBJD2owKQ9bJoCDiQB3irKjymRZ1q1d9L7GGHfsmVg+81eILhY
        H8/jNpNypvbPSu4HnExTzMAg8cdnW7/3ow==
X-Google-Smtp-Source: ACHHUZ5IksPmLdXJYPvgF7U10QpfFiuI+Z8wHDNCgr5a5dvTWdfTByxfpZXQsZ1UjGiyjEm9wfzJOw==
X-Received: by 2002:a9d:6d0a:0:b0:6aa:d278:24e5 with SMTP id o10-20020a9d6d0a000000b006aad27824e5mr9331828otp.14.1685941760359;
        Sun, 04 Jun 2023 22:09:20 -0700 (PDT)
Received: from localhost.localdomain ([76.132.108.20])
        by smtp.gmail.com with ESMTPSA id fe16-20020a056a002f1000b0064d48d98260sm4329175pfb.156.2023.06.04.22.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jun 2023 22:09:20 -0700 (PDT)
From:   Russell Harmon <eatnumber1@gmail.com>
To:     bagasdotme@gmail.com
Cc:     mpatocka@redhat.com, snitzer@redhat.com, dm-devel@redhat.com,
        linux-doc@vger.kernel.org, Russell Harmon <eatnumber1@gmail.com>
Subject: [PATCH v4 1/4] Documentation: dm-integrity: Fix minor grammatical error.
Date:   Sun,  4 Jun 2023 22:08:50 -0700
Message-Id: <20230605050853.6240-2-eatnumber1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230605050853.6240-1-eatnumber1@gmail.com>
References: <20230604190604.4800-1-eatnumber1@gmail.com>
 <20230605050853.6240-1-eatnumber1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

"where dm-integrity uses bitmap" becomes "where dm-integrity uses a
bitmap"

Signed-off-by: Russell Harmon <eatnumber1@gmail.com>
---
 Documentation/admin-guide/device-mapper/dm-integrity.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/device-mapper/dm-integrity.rst b/Documentation/admin-guide/device-mapper/dm-integrity.rst
index 8db172efa272..b2a698e955a3 100644
--- a/Documentation/admin-guide/device-mapper/dm-integrity.rst
+++ b/Documentation/admin-guide/device-mapper/dm-integrity.rst
@@ -25,7 +25,7 @@ mode it calculates and verifies the integrity tag internally. In this
 mode, the dm-integrity target can be used to detect silent data
 corruption on the disk or in the I/O path.
 
-There's an alternate mode of operation where dm-integrity uses bitmap
+There's an alternate mode of operation where dm-integrity uses a bitmap
 instead of a journal. If a bit in the bitmap is 1, the corresponding
 region's data and integrity tags are not synchronized - if the machine
 crashes, the unsynchronized regions will be recalculated. The bitmap mode
-- 
2.34.1

