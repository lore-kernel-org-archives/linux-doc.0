Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EF6FC433F5
	for <linux-doc@archiver.kernel.org>; Sun,  5 Dec 2021 13:45:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234256AbhLENtI (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 5 Dec 2021 08:49:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234250AbhLENtI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 5 Dec 2021 08:49:08 -0500
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43F8BC061714
        for <linux-doc@vger.kernel.org>; Sun,  5 Dec 2021 05:45:41 -0800 (PST)
Received: by mail-pl1-x634.google.com with SMTP id p18so5317594plf.13
        for <linux-doc@vger.kernel.org>; Sun, 05 Dec 2021 05:45:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Qjky0h4v0EehVNPUdMG8E5ZJjOQ9BmpfpPWooVRGJlY=;
        b=M9sX9Vx+mh9JFDgybjbJrvNdP6LDY7X9ebbLrpChVrc9066khc0fH+hKN+9uRJh00J
         IGJ5zbwJnOWkdskk4c5wJfi61Ap5GzQQ3Qp7IS2g3lgwaxLebEqY1wc0rij1hTuWvoaN
         GfOJG6+aY4Q2vU0lDhLe3S32Zqpoa3B5GJRt6pPu5PgG0JB3VcOmHHQYYmtAfiKXuFUC
         5sN8iPIAenCdk9hIMUlfjfLc7bgN7sgMlzKphTFUHoNIYfPzBM5WLlsSEKYxmwXC9lri
         45bp6wvDOM2bAfDqF/U8+wbbhH/Da0mhr/j76KeU70MiugQ5Fc6KNSoNCZWCFqa1tkNO
         +71Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Qjky0h4v0EehVNPUdMG8E5ZJjOQ9BmpfpPWooVRGJlY=;
        b=Np1h4oYQE+Ip22wjs7yG6YDTMld0E9ghR17FNOXiKRo3xlTMydPduf4iOixltpC9aw
         qOsar9m6NGgF+GFkGARsA2TO9RH+bUYEmca/jstsg8UNngodW7VKqN1F3vyZDROn6ygt
         +xSPKnLFSFFCXHOPb1FqUXi0Z2wWKBKcu8t2FtIIvv2qO/pplW+j2QzmzqyNZ7fmtLJ+
         X1L1GTSYirzNGtfUKBGrGJPOV9xZ3vIY1gfzcJgWINkVW5snjbmi8t+hSsg/kZYuP8KI
         GazNfNtfIu/sHTlvqefwpK4HQIilvvR4IRguY62QPwpge/8h5NzzTNkj7LsBJOgsuHKC
         8//g==
X-Gm-Message-State: AOAM532N8ZzmBJEldjRRZQju3pMlocu3tQLU/iLN6sl+k8KiaZAqXi5r
        RShbeTEtHnqtKfZiJWhtjw8=
X-Google-Smtp-Source: ABdhPJwPceo6nbK6HHcwqxSEAH3gOEA7KXvH1cVHCDaB97IWDIZUbD8KVKUg6tG034EUx2bLNOPJ7Q==
X-Received: by 2002:a17:902:ec90:b0:142:269:4691 with SMTP id x16-20020a170902ec9000b0014202694691mr37598943plg.48.1638711940763;
        Sun, 05 Dec 2021 05:45:40 -0800 (PST)
Received: from localhost.localdomain ([8.26.182.175])
        by smtp.gmail.com with ESMTPSA id g19sm4265114pfc.145.2021.12.05.05.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Dec 2021 05:45:40 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com
Subject: [PATCH 07/11] docs/driver-api: Replace a comma in the n_gsm.rst with a double colon
Date:   Sun,  5 Dec 2021 21:43:56 +0800
Message-Id: <7af552e229e36782a4e9ca2ccbea1b66b3d2679e.1638706875.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1638706875.git.siyanteng@loongson.cn>
References: <cover.1638706875.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Fix warning as:

linux-next/Documentation/driver-api/serial/n_gsm.rst:23: WARNING: Definition list ends without a blank line; unexpected unindent.
linux-next/Documentation/driver-api/serial/n_gsm.rst:100: WARNING: Definition list ends without a blank line; unexpected unindent.
linux-next/Documentation/driver-api/serial/n_gsm.rst:115: WARNING: Inline emphasis start-string without end-string.
linux-next/Documentation/driver-api/serial/n_gsm.rst:118: WARNING: Inline emphasis start-string without end-string.
linux-next/Documentation/driver-api/serial/n_gsm.rst:120: WARNING: Inline emphasis start-string without end-string.
linux-next/Documentation/driver-api/serial/n_gsm.rst:122: WARNING: Inline emphasis start-string without end-string.
linux-next/Documentation/driver-api/serial/n_gsm.rst:125: WARNING: Inline emphasis start-string without end-string.
linux-next/Documentation/driver-api/serial/n_gsm.rst:139: WARNING: Inline emphasis start-string without end-string.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 Documentation/driver-api/serial/n_gsm.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/driver-api/serial/n_gsm.rst b/Documentation/driver-api/serial/n_gsm.rst
index 4fca5b16a0f3..90f222dc0d37 100644
--- a/Documentation/driver-api/serial/n_gsm.rst
+++ b/Documentation/driver-api/serial/n_gsm.rst
@@ -104,7 +104,7 @@ How to use it
 
   2.3 configure the mux using GSMIOC_GETCONF / GSMIOC_SETCONF ioctl.
 
-  2.4 obtain base gsmtty number for the used serial port,
+  2.4 obtain base gsmtty number for the used serial port::
 
     #include <stdio.h>
     #include <stdint.h>
-- 
2.27.0

