Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F485C433E6
	for <linux-doc@archiver.kernel.org>; Mon,  8 Feb 2021 15:10:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0474F64F07
	for <linux-doc@archiver.kernel.org>; Mon,  8 Feb 2021 15:10:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232721AbhBHPJt (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 8 Feb 2021 10:09:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231327AbhBHPIR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 8 Feb 2021 10:08:17 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D89AC0617AB
        for <linux-doc@vger.kernel.org>; Mon,  8 Feb 2021 07:07:30 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id s3so18486634edi.7
        for <linux-doc@vger.kernel.org>; Mon, 08 Feb 2021 07:07:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xzslJqqYok3eHk246H4d4mLujOeY1JZA7MAatswLEGY=;
        b=GF+rQOIaO1qT7ZpZTTPLXUDleJO/QJoQZJIi2SvSGnOZ21Mso9Cm2SRW09og6aN+ra
         x9Ru+TSiWpOZC71c616XwFgVi5WvHMs1jxvBRHFc6kDS/MbpyoIJoNlchxJ4unRXqOKo
         jpUS5mxS0Rl5SG158nkgLGCx/7JnxeIK4AYiYN/xxGgJu7lRdz+KFZRRI9XmOXEcrYU0
         i281ZfnvHitKN/tLWog7QGX+8BKy7/fzWghtGpRXLhCQc+rDwQ+oMYfjtS5dZ7M/lahN
         voZVppSOd6Nrv9iZ6GI7aaom5vRDLlPVu3hk6U0jgG7aHKOY51Km3kAtH3kxsZBPRM3H
         GlNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xzslJqqYok3eHk246H4d4mLujOeY1JZA7MAatswLEGY=;
        b=H4KVw20fG0tWgWjscm9dsVC9fbDxAjuoXdEAejzviEzEvjAjHGjVPhHZUSCCRKtyxS
         I0mW58ChfCWCDOqYoQulPm45sm0Tf1Tw3VF5u2/Ww152oli+c9nDlZNDA09rG2Yrm3WV
         hoJal7d0Zt3vU9OZ8m1yfD3uuRFPG8aK03n8nKla3ByFoigB40Zisn3uBxMPZWukNMFg
         kOpctpxJyQLf2tiS0QiAfhcRPpPr/W4jNDWhhQ209scKHwDRcwLk6R4YCH8ANqT0EQl+
         4eIRVsNkLTS4ctcAskAQsYegF3mKJEyj3Ya7EuDV69gTbOJavnrh6IHawf8qLZK32w0E
         WKXg==
X-Gm-Message-State: AOAM530gI0qEq6TDatIx2rEUVXP7kTKi3tWwmo5MRUlhn0vpBchBZbE7
        6TjXKyn4Cuxf3flTmk7hqpsCgb3zFW1vTVya
X-Google-Smtp-Source: ABdhPJygkbEZPUBL8FKCivIVru+pMlLkDZdp0Yvt+q99tDgbzhqGWQ56hw+CAjnWh/NqPusekOuqtA==
X-Received: by 2002:aa7:d6d4:: with SMTP id x20mr18008624edr.8.1612796849091;
        Mon, 08 Feb 2021 07:07:29 -0800 (PST)
Received: from dell-xps159570.domain_not_set.invalid (129-228-158-163.dynamic.caiway.nl. [163.158.228.129])
        by smtp.gmail.com with ESMTPSA id c3sm810930edr.94.2021.02.08.07.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Feb 2021 07:07:28 -0800 (PST)
From:   Yorick de Wid <ydewid@gmail.com>
To:     linux-doc@vger.kernel.org, corbet@lwn.net
Cc:     Yorick de Wid <yorickdewid@users.noreply.github.com>,
        Yorick de Wid <ydewid@gmail.com>
Subject: [PATCH] docs: Remove the Microsoft rhetoric
Date:   Mon,  8 Feb 2021 16:04:48 +0100
Message-Id: <20210208150447.87104-1-ydewid@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Yorick de Wid <yorickdewid@users.noreply.github.com>

There is no need to need to name Microsoft. The point is clear without that context.

Signed-off-by: Yorick de Wid <ydewid@gmail.com>
---
 Documentation/process/coding-style.rst | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/process/coding-style.rst b/Documentation/process/coding-style.rst
index 98227226c4e..5608ed2931f 100644
--- a/Documentation/process/coding-style.rst
+++ b/Documentation/process/coding-style.rst
@@ -306,8 +306,7 @@ that counts the number of active users, you should call that
 
 Encoding the type of a function into the name (so-called Hungarian
 notation) is asinine - the compiler knows the types anyway and can check
-those, and it only confuses the programmer. No wonder Microsoft makes buggy
-programs.
+those, and it only confuses the programmer.
 
 LOCAL variable names should be short, and to the point.  If you have
 some random integer loop counter, it should probably be called ``i``.
-- 
2.30.0

