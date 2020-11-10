Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4813AC5517A
	for <linux-doc@archiver.kernel.org>; Tue, 10 Nov 2020 15:52:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D8C0F2068D
	for <linux-doc@archiver.kernel.org>; Tue, 10 Nov 2020 15:52:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gUTyGTQg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731081AbgKJPwE (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 10 Nov 2020 10:52:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729909AbgKJPwE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 10 Nov 2020 10:52:04 -0500
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43EAAC0613CF;
        Tue, 10 Nov 2020 07:52:04 -0800 (PST)
Received: by mail-pg1-x544.google.com with SMTP id z24so10532181pgk.3;
        Tue, 10 Nov 2020 07:52:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=p7BfMtOnE/LpJ0Crt8wgon1nRqzmHVhKaZn6sFng2vo=;
        b=gUTyGTQgNxeuy0fu/nde4ua6XVOobj3IyX93i0JrKm7kbYtxwLRwyUSm4daec/4vyN
         Deo4FsFHNZ3deaRVcCStOb6ZZFQI7LKYT65i4PgJJM3ICaL1iXdm9yQAKSQTEjiSrYa7
         NfBYqjcbg8LJPQ5IJPlnDIAdAmYydZ3BlJ8f4RsdQtgpnKZdlU+rKL8By26+m2YpEEz2
         JciinGd2jkgDmAd2RNvLpX8awzryqV9alNpRi5AJZtj6XPCVrCbNGqAvhNQYVBl4qe1B
         iFYSbslxvkufGwe0IKQv52pasw5xEWvOTmjrfNX5euqryEYBKO4sJ2Be2Uf2O/0caH3u
         cbHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=p7BfMtOnE/LpJ0Crt8wgon1nRqzmHVhKaZn6sFng2vo=;
        b=BhEfjfjl3bFa0mYgX7BBbfHVTW+6O0rmH/qfxniKC+O7oi1kMpgIvSFQ9J21W+a0q9
         SMuHey4WjPmeMkYFO6IPI/wU7S7lLuz0DqVvylwuUFJv9AlfMw2l6qrdoKUadj5hoh8a
         S811KXcj3B5FOT+lVhJEOXNBQHKhLLKrMg9DOragIQWolY6+A0eK4wGi48/NOl93Qo73
         YliMypQ+w1vSWYwhGMlNA+fnIcVoTU879W5dke60H+Xy/VD4uq0IopOk9HRvTHnYCkMJ
         dzk+KYptP5z6FwXAHe/Ku1tI4EfW2WDXwrH77L6e2LoCGMYmMF/0iw+2VmTHuTL+fpLA
         8AMw==
X-Gm-Message-State: AOAM5301E+ioONsNXRiqEJrdmCNSQp6bgEzw28WBbAzObYUy9jjRPBme
        RDlaUmzM2/YG6P5R3feShgw=
X-Google-Smtp-Source: ABdhPJwo/c0UVxRstqpDjIDuEpCQ/rWe2ahqfqs7Zisty8dJFO1qxLxSyh+jBXZ8XLITKGH0ljLR3Q==
X-Received: by 2002:a17:90b:19d8:: with SMTP id nm24mr340282pjb.144.1605023523721;
        Tue, 10 Nov 2020 07:52:03 -0800 (PST)
Received: from localhost.localdomain ([2402:3a80:413:8adf:79d0:1679:313c:70a2])
        by smtp.googlemail.com with ESMTPSA id t5sm3549116pjq.7.2020.11.10.07.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2020 07:52:03 -0800 (PST)
From:   Aditya Srivastava <yashsri421@gmail.com>
To:     mchehab+huawei@kernel.org
Cc:     yashsri421@gmail.com, lukas.bulwahn@gmail.com, joe@perches.com,
        krzk@kernel.org, gregkh@linuxfoundation.org,
        grandmaster@al2klimov.de, trix@redhat.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH] checkpatch: Documentation: include sign off for reverts
Date:   Tue, 10 Nov 2020 21:21:53 +0530
Message-Id: <20201110155153.29862-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Currently, we do not have any documentation on commit reverts regarding
the requirement of Signed-off-by tag for it. This may be misleading to
the users.

Evaluating MISSING_SIGN_OFF checkpatch warnings on v4.13..v5.8 showed
that 4 out of 11 cases missing a sign-off are revert commits.

Add documentation regarding the same to document the community
consensus and let readers know.

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
 Documentation/process/submitting-patches.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
index 83d9a82055a7..ff065e1f6a25 100644
--- a/Documentation/process/submitting-patches.rst
+++ b/Documentation/process/submitting-patches.rst
@@ -404,6 +404,8 @@ then you just add a line saying::
 
 using your real name (sorry, no pseudonyms or anonymous contributions.)
 This will be done for you automatically if you use ``git commit -s``.
+Also reverts should include a Signed-off-by. ``git revert -s`` does
+that for you.
 
 Some people also put extra tags at the end.  They'll just be ignored for
 now, but you can do this to mark internal company procedures or just
-- 
2.17.1

