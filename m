Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CED43C433E0
	for <linux-doc@archiver.kernel.org>; Wed, 24 Feb 2021 14:44:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 886BE64EF1
	for <linux-doc@archiver.kernel.org>; Wed, 24 Feb 2021 14:44:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231414AbhBXOl6 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 24 Feb 2021 09:41:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236431AbhBXNUm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 24 Feb 2021 08:20:42 -0500
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com [IPv6:2607:f8b0:4864:20::c35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99C97C06121E
        for <linux-doc@vger.kernel.org>; Wed, 24 Feb 2021 05:18:45 -0800 (PST)
Received: by mail-oo1-xc35.google.com with SMTP id l5so495364ooj.7
        for <linux-doc@vger.kernel.org>; Wed, 24 Feb 2021 05:18:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2QMkH64M8As4l+KSDTQdK+u4M5qrIN7PaZOHlR51wic=;
        b=QmN0FsJYiPxmCNa2Tha1APhsUK8o/7UaZLHeTlgpjASwj19luMRyZbWjrLxbXnOWSq
         QX3Widqm0McOoSM3HTXHxcQmOE55BROws/lIjp65Idz5F6TUFsQCip3AEZUVrDi4802W
         a1DgYxiomsD1lW1EmR4QuPaF4FxC5XnzYOdkw7NhBJMriRHA9/xsyO/aNXKB4gX+Akwl
         XZDq3lTBz1baGF2HPr2Zj2AtovQtHjgyajNkzw0upFslmhr/BtBhrG2tOL3fl4ZgMHp+
         eyKWP2uXQHTgp4Q/AvKzKs1YWSL4aGdSzROSCh8GqzzcYz7IiSTyQg3cPlVOLhACAypy
         MH3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2QMkH64M8As4l+KSDTQdK+u4M5qrIN7PaZOHlR51wic=;
        b=AF732cZZp7cfHVUn2Tt2MVKeELbft8ZAn0JjIK6Ux0s6qcd9MR84gqId0+xMbAxzOY
         Y0riIefvelfW4OfsZhyqFJ8s58wWXKKylzu2Cnb522jU6/YG2V2roPnj38Z9/V56bv1A
         yGE4mTF1lqsHCutKKlsRGhf3yo564QdqpnnrvXWs6olNHdkJkM54LAnJAyoQAF+/eBme
         6Qfyl0u1NHuYdSFZvOPZyJA5IvglmxoqXXQjYfwLRrGS5yI1PQfz2ZmizOFjM5PCJrqQ
         5XNPanAUqS4OMYzrJDfmKrdGnFdwlZ6Xdqv3w2shUsUmZvRIa4E97XfXbKiI/3R3EyyD
         S5xQ==
X-Gm-Message-State: AOAM533mPhqWBOIVIULcm17P2hJMy0s7DJ0vkaPTP5V1qnD/px2oS52x
        xgb+60xHrjYF1bzsYpP2bLAZQQ==
X-Google-Smtp-Source: ABdhPJzZENaJ/w4FIbF/u86i6KIgI4boKlF8cypFxWZArBN+CEJ43ycBpfR7AD/CKXEZpGzOO2u34Q==
X-Received: by 2002:a4a:c44:: with SMTP id n4mr23749084ooe.62.1614172725035;
        Wed, 24 Feb 2021 05:18:45 -0800 (PST)
Received: from winterfell.papolivre.org (winterfell.papolivre.org. [198.58.116.17])
        by smtp.gmail.com with ESMTPSA id b21sm380149oot.34.2021.02.24.05.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Feb 2021 05:18:44 -0800 (PST)
Received: from localhost (unknown [IPv6:2001:1284:f016:4cfd:27e0:441e:870:6787])
        by winterfell.papolivre.org (Postfix) with ESMTPSA id 7BFBE1C2F43;
        Wed, 24 Feb 2021 10:18:43 -0300 (-03)
From:   Antonio Terceiro <antonio.terceiro@linaro.org>
To:     cgroups@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Tejun Heo <tj@kernel.org>, Zefan Li <lizefan.x@bytedance.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Jiong Wang <jiong.wang@netronome.com>
Subject: [PATCH] Documentation: cgroup-v2: fix path to example BPF program
Date:   Wed, 24 Feb 2021 10:16:31 -0300
Message-Id: <20210224131631.349287-1-antonio.terceiro@linaro.org>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This file has been moved into the "progs" subdirectory in
bd4aed0ee73ca873bef3cb3ec746dd796f03df28, together with all test BPF
programs.

Signed-off-by: Antonio Terceiro <antonio.terceiro@linaro.org>
Cc: Tejun Heo <tj@kernel.org>
Cc: Zefan Li <lizefan.x@bytedance.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Jiong Wang <jiong.wang@netronome.com>
---
 Documentation/admin-guide/cgroup-v2.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
index c513eafaddea..befe9425d028 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -2094,7 +2094,7 @@ If the program returns 0, the attempt fails with -EPERM, otherwise
 it succeeds.
 
 An example of BPF_CGROUP_DEVICE program may be found in the kernel
-source tree in the tools/testing/selftests/bpf/dev_cgroup.c file.
+source tree in the tools/testing/selftests/bpf/progs/dev_cgroup.c file.
 
 
 RDMA
-- 
2.30.1

