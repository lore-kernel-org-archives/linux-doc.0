Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4845CC433EF
	for <linux-doc@archiver.kernel.org>; Fri,  8 Apr 2022 09:31:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229663AbiDHJdP (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 8 Apr 2022 05:33:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231939AbiDHJdN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 8 Apr 2022 05:33:13 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CE00119251
        for <linux-doc@vger.kernel.org>; Fri,  8 Apr 2022 02:31:09 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id r66so7324210pgr.3
        for <linux-doc@vger.kernel.org>; Fri, 08 Apr 2022 02:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=4j0+DnviuzQfplThzBT6GmD5+p0PPtemh3iHtO2pPN0=;
        b=QBvJ/qo2xLWY0fsSHKwpSOQaRmZMd0PhQCuYSRVAI2PY5k/HgKTOZW048YVH3HmhLv
         H5i8KndaBklWW7tiJoAEL0VVumrEak+wN53YAC9yfr0fDCaPnLWt5CVhp/Q9SLPtJzBF
         xCtXq5ssoB+QczA3AfFLVSPNBNqJlYbl7rDwbtGIB4ViwvX3GLheEXubbTzOVdZQ7xf9
         rOoTrkfUsKECFqEDrsTJaTKV2Koe20K9XHAptP0qF8VyJ7vlMBGh/UvsNoQQcO10vNfQ
         HdDXN6TEDZA5VnARfPXtZ9KDd+sbHb2YGTdrfBMUmj8cMkymZJVfWoOkoXNEIA84WzrH
         ULRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=4j0+DnviuzQfplThzBT6GmD5+p0PPtemh3iHtO2pPN0=;
        b=32uQtNC2236S8tgOpzpicN9fdG8FtElSMR5nYlQffXhespyvpA6z/6mZCwEIQ1DUpO
         Q/oAAeLWcD/r9FwXXwKwJ9F4zQP8VA1tE+q4Z+KHWWDOi/7zS4M9tD5HoFRt6Pfz99nI
         97ZPqvN8vKvcjdjjW4mt0jJbIBrkyC/5XPfK5VxNeMUEp/G1xFzpC1hkuXrfGppHkQ2E
         SfCEd+lmyVJqr/IwFyQAnueSHWwfUi9tX5YeBiFepcsblR3TSZtm1Y0yDlcIv6ih/H/+
         j90qHKsn1w6hxjO4piRSoUpoiGC+YLbrDXiFFHfrS2sE52AtziPa915afG0cJ3Y4m3wp
         JPTQ==
X-Gm-Message-State: AOAM532eB0AnqyK/77VzSVS5HQB41dW7wi3MQBIYDvAfuHWF7LVXVkHr
        osaQaj8zp3st33CPpqcFmRAZQAndhPdNWqhiy7VpvPGv
X-Google-Smtp-Source: ABdhPJzLUFD+wBayIi0aiK0Z4fQGAlgBnYVLVjN3N6QF2mgE3guJSZo0eSoPEy0ET+DI6ScRShUdzg==
X-Received: by 2002:a62:1c8d:0:b0:4fa:8dcb:6da2 with SMTP id c135-20020a621c8d000000b004fa8dcb6da2mr18088644pfc.19.1649410269081;
        Fri, 08 Apr 2022 02:31:09 -0700 (PDT)
Received: from localhost.localdomain ([43.132.141.9])
        by smtp.gmail.com with ESMTPSA id z16-20020a056a00241000b004f3a647ae89sm26718331pfh.174.2022.04.08.02.31.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 08 Apr 2022 02:31:08 -0700 (PDT)
From:   "brookxu.cn" <brookxu.cn@gmail.com>
To:     corbet@lwn.net
Cc:     linux-doc@vger.kernel.org
Subject: [PATCH] docs/scheduler: Change unit of cpu_time and rq_time to nanoseconds
Date:   Fri,  8 Apr 2022 17:31:06 +0800
Message-Id: <1649410266-32360-1-git-send-email-brookxu.cn@gmail.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Chunguang Xu <brookxu@tencent.com>

In the current implementation, cpu_time and rq_time should be
in nanoseconds, so this document needs to be modified.

Signed-off-by: Chunguang Xu <brookxu@tencent.com>
---
 Documentation/scheduler/sched-stats.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/scheduler/sched-stats.rst b/Documentation/scheduler/sched-stats.rst
index dd9b99a..9078a27 100644
--- a/Documentation/scheduler/sched-stats.rst
+++ b/Documentation/scheduler/sched-stats.rst
@@ -56,9 +56,9 @@ Next two are try_to_wake_up() statistics:
 
 Next three are statistics describing scheduling latency:
 
-     7) sum of all time spent running by tasks on this processor (in jiffies)
+     7) sum of all time spent running by tasks on this processor (in nanoseconds)
      8) sum of all time spent waiting to run by tasks on this processor (in
-        jiffies)
+        nanoseconds)
      9) # of timeslices run on this cpu
 
 
-- 
1.8.3.1

