Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00A85C433F5
	for <linux-doc@archiver.kernel.org>; Sun,  5 Dec 2021 13:45:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232715AbhLENs5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 5 Dec 2021 08:48:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234248AbhLENs5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 5 Dec 2021 08:48:57 -0500
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A200C061714
        for <linux-doc@vger.kernel.org>; Sun,  5 Dec 2021 05:45:30 -0800 (PST)
Received: by mail-pl1-x62f.google.com with SMTP id z6so5345528plk.6
        for <linux-doc@vger.kernel.org>; Sun, 05 Dec 2021 05:45:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ptHvepjFueF1YF7dWCFz1pxH8gh0ptlgtUQENmZTgU8=;
        b=kQss6e3751195kNsdt18O4+hNO7fdshkqdr3BGZvm7OyEyWTk9CAbDmSyf6WhzwvQc
         8ItCk/k+j7XntAyDXmyM6s7LpT0BvSe1jPux9Agu19fTKFtLCKWOf+KCBFdviNtB/GaC
         i+iJ68Zr3+cMhm4sOaov8ITZsu8KmY3vpbYpuKeXqxvJ3u9XAAXO3eNCmknUnqaJb52j
         jQAFbfwNz9JX1jJlZb0fr/iyKJmwTP651KvbLyf/I1m36x1yqYimEcInVGqQsLPvqrCj
         ++2Dd3EIQCyl79Vb/91AplU6Br/Nee2l/HMT06HO7KPYyjy6eLT5gHBr3zJc68qae6oC
         Lxog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ptHvepjFueF1YF7dWCFz1pxH8gh0ptlgtUQENmZTgU8=;
        b=nA3NIaNJ20Fikc2/5obrg8qb+XT78SwzNrhK4IzNL1BVLX4lsffXoBfRY9Aijbr4pW
         6H/rUUtbRgvLwr9a50FZR1imhECkSKyTfqX7PigyP/XrjJwbGE032iKOw0++dXf44tqx
         L6sPpmneGA59t5VCBftk5orWWJedRt4NW2243zVWJ8iCN1fxdJ4/+RQs2JbSjCW93hhx
         M/fwHVL7jh6b/uB7O+JjcUOiN6pxjcjkIbUmP80eV7K1O1UVK+LbY1SaJEW4PsQUuhL3
         IfbLoiV3ZZWuLOeK/aLBj+i7KpqCfKXT/fUujso+oEpGEJERC9xBHhdiW6n+rVC/3ANF
         29tQ==
X-Gm-Message-State: AOAM532nZ+EYJX1fP7bwS0BiQlNsC0zuPYuYxrKjc0/IJpHyoWLyiIx3
        17yRdPNyW6XrKTCFrjDBVQo=
X-Google-Smtp-Source: ABdhPJwkwVAimGoGI02xXVjhsoWXLgMPr1o8OKmd/9i+HSA+F5Z+5cUAlzJN3YUc1asrsw6U27GbCQ==
X-Received: by 2002:a17:90b:4d0a:: with SMTP id mw10mr29736246pjb.89.1638711929596;
        Sun, 05 Dec 2021 05:45:29 -0800 (PST)
Received: from localhost.localdomain ([8.26.182.175])
        by smtp.gmail.com with ESMTPSA id g19sm4265114pfc.145.2021.12.05.05.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Dec 2021 05:45:29 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com
Subject: [PATCH 03/11] docs/arm64: delete a space from tagged-address-abi
Date:   Sun,  5 Dec 2021 21:43:52 +0800
Message-Id: <b12925ae7bf6bed610b142244465b2844583a81d.1638706875.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1638706875.git.siyanteng@loongson.cn>
References: <cover.1638706875.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Fix warning as:

  linux-next/Documentation/arm64/tagged-address-abi.rst:52: WARNING: Unexpected indentation.

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

