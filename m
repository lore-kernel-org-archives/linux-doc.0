Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58BE1C433EF
	for <linux-doc@archiver.kernel.org>; Thu,  9 Dec 2021 09:20:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234503AbhLIJYX (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 9 Dec 2021 04:24:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232940AbhLIJYW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 9 Dec 2021 04:24:22 -0500
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE559C061746
        for <linux-doc@vger.kernel.org>; Thu,  9 Dec 2021 01:20:49 -0800 (PST)
Received: by mail-pg1-x52c.google.com with SMTP id f125so4607836pgc.0
        for <linux-doc@vger.kernel.org>; Thu, 09 Dec 2021 01:20:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=irHZpoRPcugwT7KVGkgzeSlwarJgYZko4ofe/M+L3h8=;
        b=HWeTV6mRz+Bpy7clgu1MODgxMTskk/J3ncVDhqlO95TktFxQEhph2PvHr1/r+K/sc0
         IGXTnVU+4Mgkfxlzxczy2wlESdmb1pTxtBE2+gNq2m/qCaeitu/8nQA3SvuGVotU/q1O
         lkfzPIdNIuswvAPwbcHonCyBF3ACwutyB11GSEcMrhjouPupSaLiExtAx+jp8UycauT0
         1NKkwtWYoaloZAliFP8XvKBWL5elVLH4/em5Cae6SdpVblwXK2/RBn9T1Qmccfj+sZ+y
         ZrzuB3F3P7spknBLCYR6xTHV55uRGql/q3qq9TgFAUyJ0LHs+D/K8xlpp9v5p43bPKRV
         Nbmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=irHZpoRPcugwT7KVGkgzeSlwarJgYZko4ofe/M+L3h8=;
        b=ONI4H9ZfUQ+CR03qXIvhCmtZhc76DvYZGYCOkeZn9Q8NAmq+ZX4djDtXxydddWeFQR
         04YnPZHoobx2KeTVNyl/7HKvars5xs5EY4/nRvrPV4mkihRcV6LH2aYTm2/I1JGOzpkF
         w/iA89rG3u6JraukRO3Oh1q+ZMHLHVj+5bVVsRLrrv9FGPKshWfgSbBAZYEIasIbQaba
         TsBRsd5UL1gWBmbcm8rPJA0qKUX48ngIgCQy8/mseNKPdoVENdScZeGaZmiFTYudI0UX
         eAXTxWDVIkXbKHiDSknsNDG441/zoTNKswyer1c0TjNelSuf2G9DHi9xsY6WY8nzL8GN
         jgKA==
X-Gm-Message-State: AOAM532UYPjRlcm9zhjvjE5NdJNpx+mHvApX2CS13EmOlakKWEaxMd2e
        Bp9zvXmFipfJzaIZ5hoDPxYHlWCSOKxUA3/6QRw=
X-Google-Smtp-Source: ABdhPJyTB0M4Nok3pQD3zUln+WHeLUFHsp7FYtyZTAFXE8rhoRaF2ZePUOlhE52LCWRjIKB3LVZ9aA==
X-Received: by 2002:a63:af4e:: with SMTP id s14mr16375022pgo.273.1639041649362;
        Thu, 09 Dec 2021 01:20:49 -0800 (PST)
Received: from localhost.localdomain ([8.31.2.21])
        by smtp.gmail.com with ESMTPSA id j13sm6503054pfc.151.2021.12.09.01.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 01:20:48 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     pcc@google.com
Cc:     andreyknvl@gmail.com, catalin.marinas@arm.com,
        akpm@linux-foundation.org, corbet@lwn.net,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com,
        Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH] docs/arm64: delete a space from tagged-address-abi
Date:   Thu,  9 Dec 2021 17:19:22 +0800
Message-Id: <20211209091922.560979-1-siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Since e71e2ace5721("userfaultfd: do not untag user pointers") which
introduced a warning:

linux/Documentation/arm64/tagged-address-abi.rst:52: WARNING: Unexpected indentation.

Let's fix it.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 Documentation/arm64/tagged-address-abi.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/arm64/tagged-address-abi.rst b/Documentation/arm64/tagged-address-abi.rst
index 0c9120ec58ae..540a1d4fc6c9 100644
--- a/Documentation/arm64/tagged-address-abi.rst
+++ b/Documentation/arm64/tagged-address-abi.rst
@@ -49,7 +49,7 @@ how the user addresses are used by the kernel:
 
    - ``brk()``, ``mmap()`` and the ``new_address`` argument to
      ``mremap()`` as these have the potential to alias with existing
-      user addresses.
+     user addresses.
 
      NOTE: This behaviour changed in v5.6 and so some earlier kernels may
      incorrectly accept valid tagged pointers for the ``brk()``,
-- 
2.27.0

