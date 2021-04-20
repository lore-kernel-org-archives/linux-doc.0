Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D70A2C433B4
	for <linux-doc@archiver.kernel.org>; Tue, 20 Apr 2021 12:06:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8FB43613BF
	for <linux-doc@archiver.kernel.org>; Tue, 20 Apr 2021 12:06:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232338AbhDTMHQ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 20 Apr 2021 08:07:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232331AbhDTMHQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 20 Apr 2021 08:07:16 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9180C06138A
        for <linux-doc@vger.kernel.org>; Tue, 20 Apr 2021 05:06:43 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id s15so44771624edd.4
        for <linux-doc@vger.kernel.org>; Tue, 20 Apr 2021 05:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=x9c3r13HPylppoMPao4ledc3mbYWLGl4YkdEgW4VZvA=;
        b=Ek0bA+l5MzxGUC/5g7l67MICM4Uh7CjRfjjdhE9VBxIoPsksBobOlUj1JSFtCu6uEv
         pE5sceaIYjsIQNK8fyzIEz+2jCQtoGdU0A1SAAsCfUKWkPG0CGLyqyiSHsVDlYhBxwm0
         +ll6w1U7w1L1Z+qKeF3iPJr1RsBZYbKzMgoiI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=x9c3r13HPylppoMPao4ledc3mbYWLGl4YkdEgW4VZvA=;
        b=BP2nO3Mapfhwmp4JNDex9skiZkncAUNIwti8DGZRltPd7S8VCmJrRlVCgbxrw29ubc
         kD9KNYMviJDYbz9rgoNJR4oXrWOMkCcyxf2cY/Tnqf6zOFW0Ypiwjvc5E91/fs2adokN
         jvhzdtMqkwuBgDcaP/FVZrgybZq8GlfyWw0esQtmh2TqM/CXDb+VKU5tBsquKSZ+N0Qv
         kvnCDEl9UVvCwanLUl2wTvv56XNX36/w3uIqVr5IjXV6CFkAboveK4VzU6mfyoLc/1Ih
         y9OcLaSVTy/pdPu8j3bDxNXvol3ypLJ3JSxftuAsmkHti7KCu6TseeMAHzUa7LFWZsDL
         5BsA==
X-Gm-Message-State: AOAM530VQNYpbP2mj65gdHbKoBIadZPKn1KW7y5B1/cKFQW+mKX1+McE
        x6ej4lK57Mj4ejIkTHNm6ZUfnw==
X-Google-Smtp-Source: ABdhPJzDMI1SxSR+7L9SKSloUbd8WrblJjsRu0Cg1QtdYfJSIJzmvkefnMruL+WbZ5Q8SoSrOP9AHA==
X-Received: by 2002:a05:6402:2807:: with SMTP id h7mr31548676ede.217.1618920402614;
        Tue, 20 Apr 2021 05:06:42 -0700 (PDT)
Received: from prevas-ravi.prevas.se ([80.208.71.248])
        by smtp.gmail.com with ESMTPSA id q25sm15615644edt.51.2021.04.20.05.06.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Apr 2021 05:06:42 -0700 (PDT)
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
To:     Jonathan Corbet <corbet@lwn.net>,
        Kay Sievers <kay.sievers@vrfy.org>,
        Greg Kroah-Hartman <gregkh@suse.de>
Cc:     Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] docs: admin-guide: update description for kernel.hotplug sysctl
Date:   Tue, 20 Apr 2021 14:06:38 +0200
Message-Id: <20210420120638.1104016-1-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

It's been a few releases since this defaulted to /sbin/hotplug. Update
the text, and include pointers to the two CONFIG_UEVENT_HELPER{,_PATH}
config knobs whose help text could provide more info, but also hint
that the user probably doesn't need to care at all.

Fixes: 7934779a69f1 ("Driver-Core: disable /sbin/hotplug by default")
Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 Documentation/admin-guide/sysctl/kernel.rst | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
index 1d56a6b73a4e..c24f57f2c782 100644
--- a/Documentation/admin-guide/sysctl/kernel.rst
+++ b/Documentation/admin-guide/sysctl/kernel.rst
@@ -333,7 +333,12 @@ hotplug
 =======
 
 Path for the hotplug policy agent.
-Default value is "``/sbin/hotplug``".
+Default value is ``CONFIG_UEVENT_HELPER_PATH``, which in turn defaults
+to the empty string.
+
+This file only exists when ``CONFIG_UEVENT_HELPER`` is enabled. Most
+modern systems rely exclusively on the netlink-based uevent source and
+don't need this.
 
 
 hung_task_all_cpu_backtrace
-- 
2.29.2

