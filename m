Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE15CC433F5
	for <linux-doc@archiver.kernel.org>; Sun,  5 Dec 2021 13:45:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234258AbhLENtO (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 5 Dec 2021 08:49:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234250AbhLENtN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 5 Dec 2021 08:49:13 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EA9EC061714
        for <linux-doc@vger.kernel.org>; Sun,  5 Dec 2021 05:45:46 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id fv9-20020a17090b0e8900b001a6a5ab1392so6266691pjb.1
        for <linux-doc@vger.kernel.org>; Sun, 05 Dec 2021 05:45:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=49EKaZqFYKu8AivZrqi2cPU20bijT+Y2EWiNQG0V9Gg=;
        b=UxTNhhXpyt/gOd2ZNVrAeft7nYHUhpBF7x2wLnNvMNqpwXoZtM0KYouO1AO6cmihBi
         3njgNr5chfMIvnhVSbR1Zb5Nb1frnZGUioFQtrnSUfkcSHghMAiX4JGmu07pV6uFS8eH
         ezUsJHNPpPZNdF1TG30maiCuj4Wlo1koJ3XjKytyFM8QAi8GMtj2tVd7Mv8BS8nZAHaM
         gMAPt1QTougr4zDvX8gEDeFcPl5MSggM6Us16qWioY3cKjvkLV+SQOpQR2ACPQMZqpWK
         1nDbmJs93U+PHpdq9dWyw+pN2ycWDYeJ1v7xibrE/nA0sBIbOcTVq8CJjPhhg97zsO9s
         ahnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=49EKaZqFYKu8AivZrqi2cPU20bijT+Y2EWiNQG0V9Gg=;
        b=SuQbOR98zpomcflD6fBdXGX1MnFMpf1TZsLLC7bQW40uMXBz5XVxzLkS5KzdoJ/3Hw
         E6y15ynr5r2FlphFXRqhyDTyyh6lEzFcgLAMHN+FuGmzIr8mOrYE+ZgbwBHpHjnflUy7
         N2rwg+JmG2zNUD2a32tGQsdOz0NcWvmP9+7YzLZz/39LV8BdMaOiOdKmME0iDhAe2X2m
         4CgncNwQAyOtmKOSeJDh6PJcawwnqqkzyazrbYNRE1qXGFc2q8gyoES0IX7c6CvMLLyv
         K759uWsE9t40IUtvtZaA2oY0o3pNEc09de82UTFJMoLgEuh/Kk6R49oz/kC9KL5USezi
         roIA==
X-Gm-Message-State: AOAM531ltr6wgIYzBASZIf7T4VTgjzXp2Nrz5Dm+Di+0h50zqaT+baVx
        lEOXo1ZLYTmolagoXn8RYsg=
X-Google-Smtp-Source: ABdhPJyclNCqF/dJi2ObKPqpehzjjM9S1d6/qM6C46FemqCiVpibhjYWmCka+m/J8kp1jfMi3QR2PQ==
X-Received: by 2002:a17:903:1c7:b0:141:e630:130c with SMTP id e7-20020a17090301c700b00141e630130cmr37155041plh.80.1638711946173;
        Sun, 05 Dec 2021 05:45:46 -0800 (PST)
Received: from localhost.localdomain ([8.26.182.175])
        by smtp.gmail.com with ESMTPSA id g19sm4265114pfc.145.2021.12.05.05.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Dec 2021 05:45:45 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com
Subject: [PATCH 09/11] docs/filesystems: fix a label of backend-api
Date:   Sun,  5 Dec 2021 21:43:58 +0800
Message-Id: <e516235a5bbdd4a4e60293f79dc1bbf299b425c5.1638706875.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1638706875.git.siyanteng@loongson.cn>
References: <cover.1638706875.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Fix warning as:

Documentation/filesystems/caching/backend-api.rst:417: WARNING: undefined label: documentation/filesystems/netfs_library.rst (if the link has no caption the label must precede a section header)

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 Documentation/filesystems/caching/backend-api.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/filesystems/caching/backend-api.rst b/Documentation/filesystems/caching/backend-api.rst
index 72c3bbfe7ced..538be97bc1b4 100644
--- a/Documentation/filesystems/caching/backend-api.rst
+++ b/Documentation/filesystems/caching/backend-api.rst
@@ -414,7 +414,7 @@ A cache backend provides a data I/O API by through the netfs library's ``struct
 netfs_cache_ops`` attached to a ``struct netfs_cache_resources`` by the
 ``begin_operation`` method described above.
 
-See :ref:`Documentation/filesystems/netfs_library.rst` for a description.
+See :netfs_library: Documentation/filesystems/netfs_library.rst for a description.
 
 
 Miscellaneous Functions
-- 
2.27.0

