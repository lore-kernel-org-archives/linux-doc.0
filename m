Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9C38C04A68
	for <linux-doc@archiver.kernel.org>; Thu, 28 Jul 2022 23:46:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231881AbiG1XqD (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 28 Jul 2022 19:46:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231761AbiG1XqC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 28 Jul 2022 19:46:02 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BE283D5B4
        for <linux-doc@vger.kernel.org>; Thu, 28 Jul 2022 16:45:59 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id j22so5725028ejs.2
        for <linux-doc@vger.kernel.org>; Thu, 28 Jul 2022 16:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pqrs.dk; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=M7/jd+TmiWFhj3BgYNw38FFZtKKvi/KFHz2HsNXDs8o=;
        b=ab7KO9rNYMJ04eu1ovs3n627vErNyTn4Qr0ffBAeHoPwjoWKJfzhmJSZht3uFKDOIy
         BsA5Axw+QLm8T0svdAoKAFsTMVj3dKdzlWIWUc0kD+3s0Lg0kVS9sPVA9WnkZfW+mQll
         SsMdT1lzJhwdxGyebu/q7bLiOoicJ5XHtkWzI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=M7/jd+TmiWFhj3BgYNw38FFZtKKvi/KFHz2HsNXDs8o=;
        b=EdB5Bh0aTaEVHZUD45F3QOWLSk3dVn8gpUdVM3mCpqp4GzJjfTB+h6OBDL2bFHnksB
         4twdMPSkJhURcPI3Rsxuy4TYXwXE8yaVlmWocmF0L5+KDIResnCbOcSmsPLyObhv2xjS
         H3SxHtr4uGm6+MUl2Pkxe5O3jo3ka5AxBafrPrQ2vGfcIbwdP4X20TZrvBCYDj2/hRi0
         iueFGpKiRA4wVGf18sr7HXazdW0qfjZ6W6QDCAtCrbQM7487BRzslbYQ7G9dvrVgegHx
         VIUNJ48ao+Y+JZokgS6t+5JyzIjBt/bIjnG8vyWM3lwRmW8bttKeClZAiw1C97kxz9aU
         WpwA==
X-Gm-Message-State: AJIora8p1iF9nAU6fWRcmNhw6KpWXST0Qy69DgiPT/uDoN98zGxnOG1F
        ODDrQGsMvgWIquK75TkXosWarg==
X-Google-Smtp-Source: AGRyM1spKku6z28jzABhGX8ROE6i2B6rgImRJKGH2zUtcivOilPVr8PR7m9m8IUElAd2rSBvfkx+Nw==
X-Received: by 2002:a17:907:8a1d:b0:72b:9e7b:802a with SMTP id sc29-20020a1709078a1d00b0072b9e7b802amr924882ejc.189.1659051957926;
        Thu, 28 Jul 2022 16:45:57 -0700 (PDT)
Received: from localhost.localdomain (80.71.142.18.ipv4.parknet.dk. [80.71.142.18])
        by smtp.gmail.com with ESMTPSA id v23-20020a1709062f1700b0072ff4515792sm934822eji.54.2022.07.28.16.45.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jul 2022 16:45:57 -0700 (PDT)
From:   =?UTF-8?q?Alvin=20=C5=A0ipraga?= <alvin@pqrs.dk>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     =?UTF-8?q?Alvin=20=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] documentation: debufs: add a missing closing parenthesis
Date:   Fri, 29 Jul 2022 01:45:47 +0200
Message-Id: <20220728234547.647691-1-alvin@pqrs.dk>
X-Mailer: git-send-email 2.37.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Alvin Šipraga <alsi@bang-olufsen.dk>

The two impacted sentences ought to be one, concatenated at the point of
the missing parenthesis that has been added.

Signed-off-by: Alvin Šipraga <alsi@bang-olufsen.dk>
---
 Documentation/filesystems/debugfs.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/filesystems/debugfs.rst b/Documentation/filesystems/debugfs.rst
index 71b1fee56d2a..a810eee40a8b 100644
--- a/Documentation/filesystems/debugfs.rst
+++ b/Documentation/filesystems/debugfs.rst
@@ -155,8 +155,8 @@ any code which does so in the mainline.  Note that all files created with
 debugfs_create_blob() are read-only.
 
 If you want to dump a block of registers (something that happens quite
-often during development, even if little such code reaches mainline.
-Debugfs offers two functions: one to make a registers-only file, and
+often during development, even if little such code reaches mainline),
+debugfs offers two functions: one to make a registers-only file, and
 another to insert a register block in the middle of another sequential
 file::
 
-- 
2.37.0

