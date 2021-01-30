Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88769C433E0
	for <linux-doc@archiver.kernel.org>; Sat, 30 Jan 2021 09:07:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5D27D64E28
	for <linux-doc@archiver.kernel.org>; Sat, 30 Jan 2021 09:07:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229987AbhA3JHE (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 30 Jan 2021 04:07:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233621AbhA3Ebi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 29 Jan 2021 23:31:38 -0500
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C086CC061756
        for <linux-doc@vger.kernel.org>; Fri, 29 Jan 2021 18:25:10 -0800 (PST)
Received: by mail-pg1-x52f.google.com with SMTP id t25so7880799pga.2
        for <linux-doc@vger.kernel.org>; Fri, 29 Jan 2021 18:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wsefsrvK3Ht5t7CkdAQV5MnJMhqDTrCnUmcnyN05tCo=;
        b=NljSDHFHlEr5h4ZI+S63HTZXnwriZiuKYEE7+31RtGNbsZPmetDdj/mIR6sU676Ehx
         YvMaH84FSiLWBMj8ODu+wANmdQ+QgqdRt0HKu6U2jkw/jO2EnSdu7mA0YE8XAWfweIYb
         FB6cGmLmsIZM/ydG/P9JMdjPRtbogWaGVGGxS0fwJ6W76D8BRDjxQ1G+O0BfeHg76C/4
         Wcu/cMdfI9mbCKFbl2y0dCMoClGXZ5l/zVVRQfh8v3C4UCTJhmTuR2YKtpWqaWQwnWBQ
         zvTNPQis8YUV/ehRXjK8yVEn08YDhXJjXyhW+647aJw3Axs1HrpQUVbx8RvXouUH3AfE
         y04g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wsefsrvK3Ht5t7CkdAQV5MnJMhqDTrCnUmcnyN05tCo=;
        b=bn2uC7U/rQP61J4t2+xMCcLEz0df64RXVh4K+6WuNygCOxq+T0l31JaTAVj4VKmIz9
         6uikSDpLbhUO3lFNRD9g0fQwYQq68beM81XoEVjkRqMNUclqq/YVa30lprTZAqd+d1Fw
         tt4vSmIPcDPVAm7v83M4NEB8o+gJiPKQy6p3zLTQkhVAGj/hu0DH+yhyxBS8eu2ES+qI
         Hp6uZIgl2a19AYP6CASkZpIq/c5uRKjZsYcWB1n/6+l2Tty1dAoW2OgkIxwjarYNCbqJ
         icv/OgyGTWEUBrXZdGLwXXXaddL0KQsn5HicVd9LSRxvthrVwWcD8PwJHjgci9xMppsY
         ZsAw==
X-Gm-Message-State: AOAM530lbeYgtpzVs2ceWIpyq/YNi9i6jPp5n8iwWbOquGoJJ0xL2nLt
        EeLGixEzPlea7KUBdcHNuHY=
X-Google-Smtp-Source: ABdhPJwPVru15rGssu0SFBx91ZUEVKcWlClLSnTK8/4u0qGQDT6o+nKMMxCdWOA7ptH2QeIZBJIheA==
X-Received: by 2002:a05:6a00:238b:b029:1b4:af1d:d3ff with SMTP id f11-20020a056a00238bb02901b4af1dd3ffmr6743530pfc.66.1611973510152;
        Fri, 29 Jan 2021 18:25:10 -0800 (PST)
Received: from localhost.localdomain ([2604:a880:4:1d0::1c9:f000])
        by smtp.gmail.com with ESMTPSA id d195sm2695041pfd.216.2021.01.29.18.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jan 2021 18:25:09 -0800 (PST)
From:   Nicolas Bouliane <nicboul@gmail.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-doc@vger.kernel.org, trivial@kernel.org,
        Nicolas Bouliane <nicboul@gmail.com>
Subject: [PATCH] kbuild: fix typo in Documentation/kbuild/modules.rst
Date:   Sat, 30 Jan 2021 02:23:37 +0000
Message-Id: <20210130022337.11175-1-nicboul@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Signed-off-by: Nicolas Bouliane <nicboul@gmail.com>
---
 Documentation/kbuild/modules.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/kbuild/modules.rst b/Documentation/kbuild/modules.rst
index a1f3eb7a43e2..44a18bccdd5a 100644
--- a/Documentation/kbuild/modules.rst
+++ b/Documentation/kbuild/modules.rst
@@ -205,7 +205,7 @@ module 8123.ko, which is built from the following files::
 		KDIR ?= /lib/modules/`uname -r`/build
 
 		default:
-			$(MAKE) -C $(KDIR) M=$$PWD
+			$(MAKE) -C $(KDIR) M=$PWD
 
 		# Module specific targets
 		genbin:
@@ -239,7 +239,7 @@ module 8123.ko, which is built from the following files::
 		KDIR ?= /lib/modules/`uname -r`/build
 
 		default:
-			$(MAKE) -C $(KDIR) M=$$PWD
+			$(MAKE) -C $(KDIR) M=$PWD
 
 		# Module specific targets
 		genbin:
@@ -268,7 +268,7 @@ module 8123.ko, which is built from the following files::
 		KDIR ?= /lib/modules/`uname -r`/build
 
 		default:
-			$(MAKE) -C $(KDIR) M=$$PWD
+			$(MAKE) -C $(KDIR) M=$PWD
 
 		# Module specific targets
 		genbin:
-- 
2.25.1

