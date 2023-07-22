Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F982C0015E
	for <linux-doc@archiver.kernel.org>; Sat, 22 Jul 2023 23:15:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229468AbjGVXPW (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 22 Jul 2023 19:15:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229663AbjGVXPU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 22 Jul 2023 19:15:20 -0400
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com [IPv6:2607:f8b0:4864:20::f32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7F571FD7
        for <linux-doc@vger.kernel.org>; Sat, 22 Jul 2023 16:15:16 -0700 (PDT)
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-635eb3a1d93so23927696d6.1
        for <linux-doc@vger.kernel.org>; Sat, 22 Jul 2023 16:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1690067716; x=1690672516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AN03s9OeFU4xgplmqM3lIZ6LlOvPnGJDa4y5aw2r6PE=;
        b=GEwr0q4z/KJrBbjpH9m4mksCYYGzhmQBkldWwvlrkzZPNUFMo+33zYjKWn236Rz5Jh
         mNrrcz1WM/1Zm1p4HZjzbp2iOD9Y5Thnv6+TJ4aBxLzCWX9PTygswuQC8+LqS2O5UYva
         zr3rAoGqN/oYoVNT6hMhFhQCZXGMeXDs3m3dALlQzfV5RH0/CbpIDYZ9GLKnBfbJeNrA
         fUkGhNpwdYXj8QTjTKXHA8gCo10j3oZij5KaRCcRWldrqMIvfZjg/UXbGDHeJUE/BZk9
         3Wus6jWqwnVJyxWj53YeX8o6cUJ+8Ed98IR/js9MS6gJHzN9MVBtaCE912d72lqlkRm2
         duUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690067716; x=1690672516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AN03s9OeFU4xgplmqM3lIZ6LlOvPnGJDa4y5aw2r6PE=;
        b=K5MzQv8pzvQmoOV0ifnRlXxe4YE8Xtw4MX4SZIHrjS/fKxwusQ/xJztqnbDNQbEUp2
         epoAt8M5UohajAoJ+Jeig3vSyvJNhSCbbh1r+APidNmnRqBkwziGyYOtlEfZsD1J5gds
         /gf5CDjT8EiCJYbek6wfL84ZCLu1rZSQrsLPRf/tBd9n9504oYQ0Euk9uDfCq31h8v6e
         PC9TEh7Z2GR+K/UQ4f8qD2ZnVGi8joRQU8oHau8H7DXoQDgP6V/d50SMp9vX2D0d/nN5
         QRTYAUkQMViCixzCWYRqrmAedeE4Mtw5+3/J4aAj6ag6KSeusA6CjU32hd9e9z3oSMye
         1NXA==
X-Gm-Message-State: ABy/qLYZgIC/cHJBYiZZbn4B5KLSGm8oHTooLU8u2NG8OdKyd4rfatKk
        4V/Uw9HZ7lNd1BjAwZaK71t4Hw==
X-Google-Smtp-Source: APBJJlFgPvVh9jusGtl/aMb2jHxgpWDCI2Ta53l5JgMLT6qMwivZP9ZENOy3ByIlqRkIvorgLDUVUQ==
X-Received: by 2002:a0c:e049:0:b0:632:80f:4728 with SMTP id y9-20020a0ce049000000b00632080f4728mr3778989qvk.27.1690067715976;
        Sat, 22 Jul 2023 16:15:15 -0700 (PDT)
Received: from soleen.c.googlers.com.com (193.132.150.34.bc.googleusercontent.com. [34.150.132.193])
        by smtp.gmail.com with ESMTPSA id u21-20020ae9c015000000b007675c4b530fsm2075957qkk.28.2023.07.22.16.15.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jul 2023 16:15:15 -0700 (PDT)
From:   Pasha Tatashin <pasha.tatashin@soleen.com>
To:     pasha.tatashin@soleen.com, akpm@linux-foundation.org,
        corbet@lwn.net, linux-mm@kvack.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, rick.p.edgecombe@intel.com
Subject: [PATCH v2 2/3] doc/vm: add information about page_table_check warn_on behavior
Date:   Sat, 22 Jul 2023 23:15:07 +0000
Message-ID: <20230722231508.1030269-3-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.41.0.487.g6d72f3e995-goog
In-Reply-To: <20230722231508.1030269-1-pasha.tatashin@soleen.com>
References: <20230722231508.1030269-1-pasha.tatashin@soleen.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The default behavior of page table check was changed from panicking
kernel to printing a warning.

Add a note how to still panic the kernel when error is detected.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 Documentation/mm/page_table_check.rst | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/mm/page_table_check.rst b/Documentation/mm/page_table_check.rst
index c12838ce6b8d..f534c80ee9c9 100644
--- a/Documentation/mm/page_table_check.rst
+++ b/Documentation/mm/page_table_check.rst
@@ -14,13 +14,14 @@ Page table check performs extra verifications at the time when new pages become
 accessible from the userspace by getting their page table entries (PTEs PMDs
 etc.) added into the table.
 
-In case of detected corruption, the kernel is crashed. There is a small
+In case of detected corruption, a warning is printed. There is a small
 performance and memory overhead associated with the page table check. Therefore,
 it is disabled by default, but can be optionally enabled on systems where the
 extra hardening outweighs the performance costs. Also, because page table check
 is synchronous, it can help with debugging double map memory corruption issues,
 by crashing kernel at the time wrong mapping occurs instead of later which is
-often the case with memory corruptions bugs.
+often the case with memory corruptions bugs. In order to crash kernel sysctl
+panic_on_warn should be set to 1.
 
 Double mapping detection logic
 ==============================
-- 
2.41.0.487.g6d72f3e995-goog

