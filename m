Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9164CC61DD8
	for <linux-doc@archiver.kernel.org>; Mon, 16 Nov 2020 16:30:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3131521527
	for <linux-doc@archiver.kernel.org>; Mon, 16 Nov 2020 16:30:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eJORAZ3f"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731009AbgKPQau (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 16 Nov 2020 11:30:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730983AbgKPQat (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 16 Nov 2020 11:30:49 -0500
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com [IPv6:2607:f8b0:4864:20::e36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EE20C0613CF
        for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2020 08:30:49 -0800 (PST)
Received: by mail-vs1-xe36.google.com with SMTP id m16so9465996vsl.8
        for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2020 08:30:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=/eh/Nsa3jelD0lHYxE5OvsvYUw58fCyvEc6XpiB4FlA=;
        b=eJORAZ3f/kb7E5tiIhFTquuDPe05Y9FXFekiaXk7BRtZ13Et0GomxxepeWpSi4b1H3
         3sGJVTXg7jH2Ce0NQIdgJgQfuM1b5lE8vO/oBaKBAofRJiwU6MTaG5xGENVCY/RBOC0e
         VqFJN4w61O3ZFll3yjgroPQsYSMkJZrMETLxADjWK9c215vQQMZbRPB7483JkHlQfis2
         3FR54S8yWQ0ZbsZ2s7q7INE8DLd+co39COiNgngUC1l+sV6OXeKcBR+U8O/yYaAVCya+
         9B/UNhEyEDnK0SOp3j3781+bvG4hEDKM9kSYesDhAotLM4cHU1rZVFKA1mW/SOuEy93f
         PsAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=/eh/Nsa3jelD0lHYxE5OvsvYUw58fCyvEc6XpiB4FlA=;
        b=D4jgz8UVLwUGyh37wnRZ/2nWGHeDLi4+9o/l9/jioC+f/0hZZ73sgGUPbmcaMRjN4w
         za3/SWbLCd/1bQiCPmJMVfahrogtPrfsgkI2Vp7Xz/yJt185y5DryEFbwU491HC/ZQaD
         OEwV9P3L2oG7HH/aZwi4EXbYRIHwsvpICJN/UW6Dg4fFfroINxnalwogwgpHw4iyi186
         WBjzR83BdjWtSDSu23yfVW0KFVgomcvv9kzcT//Lr5ecc4uHBrJn18BDPln0uMmjOxEN
         6znnI97US0bPZvONwa/GuXrjLlej1XcbghQnK5Jj2dxwoV+pd4CEKJ9RbMbHFEm3MJv6
         +ozw==
X-Gm-Message-State: AOAM532NfkjDOTE7mUGlKcsuTHf1H23S3kN6zV7NbiViUOVFp2o1wH6i
        E0BPcfVa7ak+YV4baCGRkHSu87jHCryS209fQChQAQj4pQo=
X-Google-Smtp-Source: ABdhPJy1pif4IxQc97EqLkTGKMewbgldsTNaMIgwebPq85ZnRlG2x3IrU/ElzjXgvGFVxejKfCYDoWZX7ONky1/9jbU=
X-Received: by 2002:a67:2f4c:: with SMTP id v73mr8520366vsv.33.1605544247776;
 Mon, 16 Nov 2020 08:30:47 -0800 (PST)
MIME-Version: 1.0
From:   =?UTF-8?B?0JXQvdGM0YjQuNC9INCQ0L3QtNGA0LXQuQ==?= 
        <and.enshin@gmail.com>
Date:   Tue, 17 Nov 2020 01:30:36 +0900
Message-ID: <CAHoi7Su9sWetsH4BCYnzx6+9kskFAd9gwvMgUG_e0Mmy9UQOZA@mail.gmail.com>
Subject: [PATCH] Fix cgroup-v1 doc: /proc/<pid>/cgroup instead of /proc/<pid>/cgroups
To:     linux-doc@vger.kernel.org
Cc:     trivial@kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

---
 Documentation/admin-guide/cgroup-v1/cgroups.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/cgroup-v1/cgroups.rst
b/Documentation/admin-guide/cgroup-v1/cgroups.rst
index b068801..9544370 100644
--- a/Documentation/admin-guide/cgroup-v1/cgroups.rst
+++ b/Documentation/admin-guide/cgroup-v1/cgroups.rst
@@ -485,7 +485,7 @@ subsystems when none are explicitly specified is
not supported when
 you give a subsystem a name.

 The name of the subsystem appears as part of the hierarchy description
-in /proc/mounts and /proc/<pid>/cgroups.
+in /proc/mounts and /proc/<pid>/cgroup.


 3. Kernel API
-- 
2.7.4


-- 
Best Regards,
Andrei Enshin
