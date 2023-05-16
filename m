Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CA57C77B75
	for <linux-doc@archiver.kernel.org>; Tue, 16 May 2023 06:53:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230125AbjEPGxM (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 16 May 2023 02:53:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230206AbjEPGxJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 16 May 2023 02:53:09 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3380A40F2
        for <linux-doc@vger.kernel.org>; Mon, 15 May 2023 23:52:53 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-50bcb229adaso24957719a12.2
        for <linux-doc@vger.kernel.org>; Mon, 15 May 2023 23:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1684219968; x=1686811968;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XysAE3wBPBRnm+kDZyhpJGmXjkkmPukHucI6hmadXi8=;
        b=Ak4POiE5wpWvOE4HBZZ/QK+uzljVcOSZ0PZFLxSJSX6U9zO0wEn9O1JfK5eScqffy/
         iJddJE6wnJM4s5qWoYWMmvGd0iy9lGRhHRibg88pAR1pYvxanmIVf9LyOhMQkbr/+R/2
         HAx7KY2Oxe9kNv2dT8r7euRP0SIKWypXbWXGQaTWnLNvEatbS+CK56HYMyudLLt1bD2o
         XKilbGHsSLEypsk4ozmWNJh570FRBH8pY+2ZNeRJ7CIzeWe8wvU2bau4pvJomNQzvZ26
         aN996RyxSYkI0gwTqRKKyW7TmIwuBAxnE54t37rqK7uQ4GiHdqrzZDiUOLah2tVAyhvY
         J7gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684219968; x=1686811968;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XysAE3wBPBRnm+kDZyhpJGmXjkkmPukHucI6hmadXi8=;
        b=RC+87XZgLBLlPOMNfp9Jrwfy2d/hKWGXiM7lFcdjW0+gSjZH0jr6nGSK+2w6/wAk46
         u5jrmc2+CZWEYoNfKY3O82y6RXc2SyULqhCxe49dM5kD4gvK0abFRu+KJiJQwQr//51C
         vURKoy3OltWtzCq5M431EnjTFtgaUwhh28JrFz6TMB+MZCwwPs1jIk5reRfNbU84Dy3a
         csSfZqHVVc6Wwg+/on/ilBr74JVX/1dJLjbplzDmAmStmIJViZEwW+ClZCirTuP/1xnp
         lrWXg6LJA8o+DuS/i/qNkc09PUj4kfZqW5EoIZiQTvgS3/a0MVexfocKrJ2rL2ebk5SN
         zfog==
X-Gm-Message-State: AC+VfDyl5CaIfrod6DuZ2nO8K0Wwi1c4aslBBEs+tdNfQu+9lUqMH91+
        sTNh04ce+ciGfTzQfEemO3Vutg==
X-Google-Smtp-Source: ACHHUZ6RU/odBg3xoOW5scszLU3AOGmHa9Dax0R2pmUq/aaCvjZkpY+xHcGVojB1+0eRJbIeGiTv0g==
X-Received: by 2002:a17:907:da4:b0:966:4d99:b0aa with SMTP id go36-20020a1709070da400b009664d99b0aamr28303285ejc.59.1684219968320;
        Mon, 15 May 2023 23:52:48 -0700 (PDT)
Received: from [192.168.183.139] ([41.66.96.127])
        by smtp.gmail.com with ESMTPSA id k21-20020a170906971500b00965ffb8407asm10407706ejx.87.2023.05.15.23.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 May 2023 23:52:47 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
Date:   Tue, 16 May 2023 08:52:43 +0200
Subject: [PATCH] docs: printk-formats: Clarify %*pb format parameters
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230516-printk-bitmap-v1-1-d5f810192a10@fairphone.com>
X-B4-Tracking: v=1; b=H4sIADsoY2QC/x2NQQqDMBAAvyJ77oqaarBfKT1s4kaX0hg2UlrEv
 zf2OAzD7JBZhTPcqh2U35JljQXaSwV+oTgzylQYuqYzTd8OmFTi9kQn24sSOh/CZK2xI3kojaP
 M6JSiX84qpCsOtam/p0vKQT7/1/1xHD8JiERAewAAAA==
To:     Petr Mladek <pmladek@suse.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.2
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Since it's rather unusual for printk formats to require two parameters,
expand the documentation to clearly mention that in the printk format
for bitmaps.

As an extra example, for example from include/net/bluetooth/hci_core.h
we have a bitmap DECLARE_BITMAP(dev_flags, __HCI_NUM_FLAGS);
This can be printed with ("%*pb", __HCI_NUM_FLAGS, hdev->dev_flags)

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
This probably also applies to other printk formats but since this is the
only one so far I've used that requires two parameters I cannot really
help with the others.

Someone with more knowledge on the other more unusual format strings
could apply this to others also.
---
 Documentation/core-api/printk-formats.rst | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/core-api/printk-formats.rst b/Documentation/core-api/printk-formats.rst
index dfe7e75a71de..3cafb988d757 100644
--- a/Documentation/core-api/printk-formats.rst
+++ b/Documentation/core-api/printk-formats.rst
@@ -571,7 +571,9 @@ For printing bitmap and its derivatives such as cpumask and nodemask,
 %*pb outputs the bitmap with field width as the number of bits and %*pbl
 output the bitmap as range list with field width as the number of bits.
 
-The field width is passed by value, the bitmap is passed by reference.
+This requires two parameters, the field width (number of bits in the bitmap)
+passed by value and the bitmap passed by reference.
+
 Helper macros cpumask_pr_args() and nodemask_pr_args() are available to ease
 printing cpumask and nodemask.
 

---
base-commit: 16a8829130ca22666ac6236178a6233208d425c3
change-id: 20230516-printk-bitmap-bcffd77379ac

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

