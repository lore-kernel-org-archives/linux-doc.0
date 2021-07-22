Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23064C63793
	for <linux-doc@archiver.kernel.org>; Thu, 22 Jul 2021 10:04:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0CBC76127C
	for <linux-doc@archiver.kernel.org>; Thu, 22 Jul 2021 10:04:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231695AbhGVJYE (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 22 Jul 2021 05:24:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231877AbhGVJXy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 22 Jul 2021 05:23:54 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16DEEC0613CF
        for <linux-doc@vger.kernel.org>; Thu, 22 Jul 2021 03:03:58 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id dp20so7541214ejc.7
        for <linux-doc@vger.kernel.org>; Thu, 22 Jul 2021 03:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MAR/197ZIT3kSyhNe4tx+U85YGZIc/Ll5NNFXKz7ZUU=;
        b=X8ULWz4CU8IS6hhbZmy8mzvOimrO+0c9hJEnhNtsGFvsOP2GxrEK/XwHtA8yCd7a/G
         Hc5kn/orLmyj4EeWwZazTjK/FfGI6TIKRC0KbCu3JQgZ6CqrcoQxEgIzmjkYlRuOjv/v
         Yx/FBxHsam+FEyDYMI0bAy15Re0Knwx+l8YTKqcjx5XO7Atl/+7retCohCvUvE9T+3oA
         rml1hzR3p2HvplRDybFbu72tHhCGzWy3WYLCZdHXU13qUyuncaUIGORZtRqPP+OQTbQ5
         NiAIJCKMOfSn0q00Yhu4hOjFSzurY6/MOS1xMpTJATeQCzAVWqbhlkaIWnlpgA73T8Xv
         TOEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MAR/197ZIT3kSyhNe4tx+U85YGZIc/Ll5NNFXKz7ZUU=;
        b=CxRqQBOwc5w2nqNoOmcL3Nk+Gtk66Pa2/3ZfJ6DSUPOem0N+FgH/s44aiSdiG63MVQ
         nb7WHddYRGyNC95GJTROvGSQD02s9h7alV3jWuNhEh3HknyqysTiMIzahmHWKSWv1Jqc
         P0WFgJq5jUNVeQqnbg9kYD0hb4Irmd7NePC/Rdg74GIEesa9WflynH6W1bXURaAhoQou
         xaPtst/9WjmOXLHI7GynPqQ78C3wqTXjqe5EnVJacPpIiw+UE0RN9lmnB2kNk3/KHgHD
         B2NA+3BtulsSJSOdXsGYcgS3ObNEp9Mczws/44Qbr14W/XODEJxHSrPhM5VY1QZUKKA+
         w5Ew==
X-Gm-Message-State: AOAM5334+bv6/BjIxpNzz6EbVeWcYpX3gN+3R4HBC3/4q7QVI0EdyWWN
        VnYRmB1Fr/2kBSBQDOdbyts=
X-Google-Smtp-Source: ABdhPJwpa2wE3M4ARKzmvkvIk/uT1kAjGY18+IJYtrboDtF+6QkTJutI1PqRvMZrdbe1N0u43C+hyw==
X-Received: by 2002:a17:906:4dcf:: with SMTP id f15mr42215690ejw.400.1626948236659;
        Thu, 22 Jul 2021 03:03:56 -0700 (PDT)
Received: from yoga-910.localhost ([82.76.66.29])
        by smtp.gmail.com with ESMTPSA id cb4sm9341749ejb.72.2021.07.22.03.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jul 2021 03:03:56 -0700 (PDT)
From:   Ioana Ciornei <ciorneiioana@gmail.com>
To:     Jonathan Corbet <corbet@lwn.net>, Petr Mladek <pmladek@suse.com>,
        Steven Rostedt <rostedt@goodmis.org>
Cc:     linux-doc@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
        Maxim Levitsky <mlevitsk@redhat.com>,
        Jing Zhang <jingzhangos@google.com>,
        Ioana Ciornei <ioana.ciornei@nxp.com>
Subject: [PATCH 1/4] docs: printk-formats: fix build warning
Date:   Thu, 22 Jul 2021 13:03:53 +0300
Message-Id: <20210722100356.635078-2-ciorneiioana@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210722100356.635078-1-ciorneiioana@gmail.com>
References: <20210722100356.635078-1-ciorneiioana@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Ioana Ciornei <ioana.ciornei@nxp.com>

Add an empty line after the '::' starting the code block so that the
following lines are properly interpreted.

Without this, the following build warnings are visible.

Documentation/core-api/printk-formats.rst:136: WARNING: Unexpected indentation.
Documentation/core-api/printk-formats.rst:137: WARNING: Block quote ends without a blank line; unexpected unindent.

Fixes: 9294523e3768 ("module: add printk formats to add module build ID to stacktraces")
Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
 Documentation/core-api/printk-formats.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/core-api/printk-formats.rst b/Documentation/core-api/printk-formats.rst
index d941717a191b..e08bbe9b0cbf 100644
--- a/Documentation/core-api/printk-formats.rst
+++ b/Documentation/core-api/printk-formats.rst
@@ -130,6 +130,7 @@ printed after the symbol name with an extra ``b`` appended to the end of the
 specifier.
 
 ::
+
 	%pS	versatile_init+0x0/0x110 [module_name]
 	%pSb	versatile_init+0x0/0x110 [module_name ed5019fdf5e53be37cb1ba7899292d7e143b259e]
 	%pSRb	versatile_init+0x9/0x110 [module_name ed5019fdf5e53be37cb1ba7899292d7e143b259e]
-- 
2.31.1

