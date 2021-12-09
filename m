Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3D3EC433EF
	for <linux-doc@archiver.kernel.org>; Thu,  9 Dec 2021 09:23:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229657AbhLIJ1Y (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 9 Dec 2021 04:27:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233295AbhLIJ1X (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 9 Dec 2021 04:27:23 -0500
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99DDDC0617A1
        for <linux-doc@vger.kernel.org>; Thu,  9 Dec 2021 01:23:50 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id q17so3413120plr.11
        for <linux-doc@vger.kernel.org>; Thu, 09 Dec 2021 01:23:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UiiPGo4UfFgqevjsPMGe97ZoNMy3THPhhn9It13T5/o=;
        b=lFrRV9SHRW6pdJxaijU+Nz/Q7pRNCkYzueiI8M6xQwG09wStR6yNXH0cH7gOuxzpup
         2lF3WUxQ6CLl4LXtK9H1Cw+tc3NRDlucKzXttGmNvA4Y/xL8nKHxs10Ww1ncHNEsg352
         ABAyIHRjo4BMnmy5qIecMpUunlLbKSopot5Fmwey7pCCQrdpgRjVr6EW3hSsk9xUTohh
         cayzn9ueovMRaw8BCf6U30JpbLIymbDfJjXW46Aif1DgPWvlqs8hvW9Xh3d7ejLf4M7s
         pjVBthFZxr9Nb0tqS92tM7kbvetW8lbZGe2cSjhsIqxTGFkFcTaBSkBcDeJSDl+7Nswd
         Ealg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UiiPGo4UfFgqevjsPMGe97ZoNMy3THPhhn9It13T5/o=;
        b=YuiabQATvSz7WA52Wm7vHpaa780li5VtOzUtJfKrVU1Qhh3hZhLIS2a6yR0h5Nt1Fo
         ut7bgbVrieqaSTL1JWG/3Yd8tWEf0j/gwiwrFDrpjBUDN7zDeWKASD7Yj1FVDEa6vF20
         3bOFUu14wVvwRgbPjLTRDelUekrc8uiMi6993HYVMT7kZefJxyoSNAQAKoCPFimopSc4
         eIhBAgP+07+N9YttOI9yglRZF5SLrgAfVA+FWzoh6Ib2TQlqS3CInVOxWw3cukJvsD+H
         pFUWk0Ria/ubwhGTqwU6MK9j6usnpxjYLRm9ddPhVJ0XewRQlA9rIs56Lxisgm85M16x
         PBBA==
X-Gm-Message-State: AOAM5329huGw5zTo6eQVZ+LjWCv2gXCTMZBHG9dT4Na4aw5zVx3RfGgW
        F14X1a7nMU2Tx6bh1Ox0E3c=
X-Google-Smtp-Source: ABdhPJynt0xuJmPeDCNan4qmvBZPZpvxbhhZcCDUZcG0i7SSQhDccVszQV3w5K6O9hrpzfuLnSfbaA==
X-Received: by 2002:a17:90b:350c:: with SMTP id ls12mr13938496pjb.197.1639041830215;
        Thu, 09 Dec 2021 01:23:50 -0800 (PST)
Received: from localhost.localdomain ([8.31.2.21])
        by smtp.gmail.com with ESMTPSA id q9sm6975039pfj.9.2021.12.09.01.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 01:23:49 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     mpatocka@redhat.com
Cc:     colin.king@canonical.com, ross.zwisler@linux.intel.com,
        dan.carpenter@oracle.com, dan.j.williams@intel.com,
        msnitzer@redhat.com, corbet@lwn.net, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com, Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH] docs/admin-guide: Add the necessary blank lines to the writecache
Date:   Thu,  9 Dec 2021 17:22:23 +0800
Message-Id: <20211209092223.561740-1-siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Since 48debafe4f2f ("dm: add writecache target") wihch
introduced a warning:

linux/Documentation/admin-guide/device-mapper/writecache.rst:23: WARNING: Unexpected indentation.

Add a blank line.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 Documentation/admin-guide/device-mapper/writecache.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/admin-guide/device-mapper/writecache.rst b/Documentation/admin-guide/device-mapper/writecache.rst
index 10429779a91a..6bf78b0446ac 100644
--- a/Documentation/admin-guide/device-mapper/writecache.rst
+++ b/Documentation/admin-guide/device-mapper/writecache.rst
@@ -20,6 +20,7 @@ Constructor parameters:
    size)
 5. the number of optional parameters (the parameters with an argument
    count as two)
+
 	start_sector n		(default: 0)
 		offset from the start of cache device in 512-byte sectors
 	high_watermark n	(default: 50)
-- 
2.27.0

