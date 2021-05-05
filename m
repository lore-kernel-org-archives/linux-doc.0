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
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0DCDC433ED
	for <linux-doc@archiver.kernel.org>; Wed,  5 May 2021 12:10:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AEF3C6139A
	for <linux-doc@archiver.kernel.org>; Wed,  5 May 2021 12:10:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233558AbhEEMLP (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 5 May 2021 08:11:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233622AbhEEMKD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 5 May 2021 08:10:03 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92C5CC061351
        for <linux-doc@vger.kernel.org>; Wed,  5 May 2021 05:08:06 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id h7so997428plt.1
        for <linux-doc@vger.kernel.org>; Wed, 05 May 2021 05:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ABIrOudAzeXYs/VYZbnAvP1ZidtTqHskW0YZBqm0gb8=;
        b=BOiBKyLcsUaggywYNjX/iKKuOJdYHrWCWOBto1tDCAoUJzE/BretQYWi/7uC57xVlg
         3uqmf+OeQZB9DSJziVa5JsJmeiwxpeoFkPoywVVTLrIN47xzh6eXeB2n/tztJ3qApitJ
         SYBpaanRepeY2dMtxBDn86VTDnmtTqDRVwhpQ8FEO5JBU9Pw+/Ylg4wmB2XkhbMUcVM0
         GMEHDoFyCwSUx7qb/uk6LoZ3Dl/LXiAS02VTi0MoNKdvQwsYMq4mVv25n9TdIn0jhX6p
         m3surh3Q3ZcQ9DLIGeGqz0r2BVwC6C3tWDvKelW1kehOLEAMyMjFAEIMof8MqgaJdqem
         xkEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ABIrOudAzeXYs/VYZbnAvP1ZidtTqHskW0YZBqm0gb8=;
        b=KCcWpbS6saXnpHGWVnON+vznvEet6PNv4O1FpeQhnpmrEOEVYZX2BTKa1YGhWd4wQG
         owEG8/7QWrde6Bh/w2j0Lx0duLzzsdYnQgGoeuqTYyM88CIboDj8x0nYw4EWPndYsMAC
         Pc6aiN048M35ADMmL2bjfPWMt+l1LNkgP48TGKkMUXu2emqMwT8RuKUWs6loqVTezNqI
         5l7PZIsuFikRP3CoQhibs5WGDCs0LK3RkCaYpc5ChubaZ3xtX36Jf1sr9GHhDTkQgs77
         RDJMuf92KP1YF3LQi+Ot9or1DUdWUOUIixs3gi7bJasnaKH8dWipf+fAfbI3TfvrGwAy
         d+hQ==
X-Gm-Message-State: AOAM530SEWqylWNQCTLSRccf6T8bvltaGb0eIBvb6hQC+zPfaL7WdM0W
        R0hFV2PpxWH2BpsO+ENRNSI=
X-Google-Smtp-Source: ABdhPJyYBqZI0gQSBKAALgWPuqe6TpZNsgjXt+H/+oaFohv9H7lBc/+nbVXb0AYBGr35/UmTnt8CvQ==
X-Received: by 2002:a17:902:ed95:b029:ee:aa46:547a with SMTP id e21-20020a170902ed95b02900eeaa46547amr26922997plj.27.1620216486213;
        Wed, 05 May 2021 05:08:06 -0700 (PDT)
Received: from WRT-WX9.. ([141.164.41.4])
        by smtp.gmail.com with ESMTPSA id j7sm14177959pfc.164.2021.05.05.05.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 05:08:05 -0700 (PDT)
From:   Changbin Du <changbin.du@gmail.com>
To:     Eric Van Hensbergen <ericvh@gmail.com>,
        Latchesar Ionkov <lucho@ionkov.net>,
        Dominique Martinet <asmadeus@codewreck.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Changbin Du <changbin.du@gmail.com>
Subject: [PATCH 2/3] 9p: doc: move to a new dedicated folder
Date:   Wed,  5 May 2021 20:07:47 +0800
Message-Id: <20210505120748.8622-3-changbin.du@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210505120748.8622-1-changbin.du@gmail.com>
References: <20210505120748.8622-1-changbin.du@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Later we will add another documentation for v9fs.

Signed-off-by: Changbin Du <changbin.du@gmail.com>
---
 Documentation/filesystems/index.rst         |  2 +-
 Documentation/filesystems/{ => v9fs}/9p.rst |  0
 Documentation/filesystems/v9fs/index.rst    | 11 +++++++++++
 3 files changed, 12 insertions(+), 1 deletion(-)
 rename Documentation/filesystems/{ => v9fs}/9p.rst (100%)
 create mode 100644 Documentation/filesystems/v9fs/index.rst

diff --git a/Documentation/filesystems/index.rst b/Documentation/filesystems/index.rst
index d4853cb919d2..e53992636a49 100644
--- a/Documentation/filesystems/index.rst
+++ b/Documentation/filesystems/index.rst
@@ -63,7 +63,7 @@ Documentation for filesystem implementations.
 .. toctree::
    :maxdepth: 2
 
-   9p
+   v9fs/index
    adfs
    affs
    afs
diff --git a/Documentation/filesystems/9p.rst b/Documentation/filesystems/v9fs/9p.rst
similarity index 100%
rename from Documentation/filesystems/9p.rst
rename to Documentation/filesystems/v9fs/9p.rst
diff --git a/Documentation/filesystems/v9fs/index.rst b/Documentation/filesystems/v9fs/index.rst
new file mode 100644
index 000000000000..a1e45b89e2a2
--- /dev/null
+++ b/Documentation/filesystems/v9fs/index.rst
@@ -0,0 +1,11 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+====
+v9fs
+====
+
+.. toctree::
+   :maxdepth: 6
+   :numbered:
+
+   9p
-- 
2.30.2

