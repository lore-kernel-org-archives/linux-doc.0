Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D1ECC433ED
	for <linux-doc@archiver.kernel.org>; Fri, 16 Apr 2021 14:12:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 63161611AC
	for <linux-doc@archiver.kernel.org>; Fri, 16 Apr 2021 14:12:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244348AbhDPOMk (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 16 Apr 2021 10:12:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244150AbhDPOMk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 16 Apr 2021 10:12:40 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25D0BC061756
        for <linux-doc@vger.kernel.org>; Fri, 16 Apr 2021 07:12:15 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id f41so21623697lfv.8
        for <linux-doc@vger.kernel.org>; Fri, 16 Apr 2021 07:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=uged.al; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Qvg0+ynFQWDqQCIO8KNqZL3+z/lrvuKdEEgfI7FsQlo=;
        b=ELyLsiUaExhjw8YySJFA347NWUPn9j1onQtEB8PIFFgCd0rSH4RHWYCfpnKhEl3/w8
         r2tqpsvCLvbZ5ufl2YzrkABtOqLiXfpc0s8WWpP3j3liXDtL+8fKYh5E9BtuYP9NUBBX
         F2RVbdj+Qd8QICZ7cK0S2WsPyy+wtkXbj1aPNXuRK2WCHEYbL77Bn4+S2Y1AJKqvIjF2
         zfQDxWkt6S7yWSrOahYG/p9o44w/TMzabmP+cykZtFiKvJ1q2vp/jai2lvCYV6KhH8Cc
         KVKs/iOKDIlgT+3z6ih24LIhHDsL0lZHPBf+YFFqElurjSyFM4D6fHiUcnCmVZS5dKlR
         e/VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Qvg0+ynFQWDqQCIO8KNqZL3+z/lrvuKdEEgfI7FsQlo=;
        b=tN0n7q4Jux3OC1DBSOlYAhTst4JGzy6bwd67apt+JXgfkpyLjZoR0h3HXL4C2yMPCc
         vHR5s8txbO1hBI7iec3++d558ABF5cW5c+QZzS4cHp9MHvMtjux6ri4k/h381T+sO8PM
         YK6TYVzZ/8wT3/Lnqq/wL0mIlZKzaUUVP9t5V1PC4ILgmGnBkLHwbLkE12MpWGBTqv+M
         +7PPMWOogbcIUVMIKdXgYxhB8oTjp90IQ6PfjdFixxTFY7bTKejLKG+UTNsMRyMTz0zC
         xwB+LXiBk19Nny8jsMcd98tSJCmk5wPCTKursxACmbhHic5pt94gq1Q9qoSn5fQJMitI
         QwkQ==
X-Gm-Message-State: AOAM5337jNY1EqG+1XfqJn6wDmmg0qV4f28RbUk0hFnSqNM5okZMNRAf
        m/7aiTbZf5JJITtE4doOaFshQQ==
X-Google-Smtp-Source: ABdhPJwTjyGxYJE7A0Jj+kJ11xfEOUPdFWMRr2xcguCnlM0OZmlE10G3ooWjvAE+htQ9wke4A55Atg==
X-Received: by 2002:ac2:515e:: with SMTP id q30mr3379202lfd.514.1618582332576;
        Fri, 16 Apr 2021 07:12:12 -0700 (PDT)
Received: from xps.home ([2001:4647:9b4f:0:2992:a57:479e:be30])
        by smtp.gmail.com with ESMTPSA id 130sm1001746lfg.263.2021.04.16.07.12.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Apr 2021 07:12:11 -0700 (PDT)
From:   Odin Ugedal <odin@uged.al>
To:     corbet@lwn.net
Cc:     cgroups@vger.kernel.org, linux-doc@vger.kernel.org,
        Odin Ugedal <odin@uged.al>
Subject: [RFC] docs/admin-guide/cgroup-v2: Add hugetlb rsvd files
Date:   Fri, 16 Apr 2021 16:11:46 +0200
Message-Id: <20210416141146.542786-1-odin@uged.al>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add missing docs about reservation accounting for hugetlb in cgroup v2.

Signed-off-by: Odin Ugedal <odin@uged.al>
---
RFC: This is linking from cgroup-v1 docs, and that is probably not
optimal. The information about the difference between reservation
accounting and page fault accounting is pretty hard to make short.

I think we have four ways to do it, but I don't know what is
most optimal:

- Link from cgroup-v2 to cgroup-v1 (this patch)
- Have a separate description for both v1 and v2
- Move description from cgroup-v1 to cgroup-v2, and link from v1 to
  v2.
- Move info from cgroup-v1 to admin-guide/mm/hugetlbpage or
  vm/hugetlbfs_reserv, and link from cgroup to them.

admin-guide/cgroup-v1/hugetlb need some formatting anyhow also, will fix
that in the same patchset as this. Together with describing
<hugepagesize> in cgroup-v2.

 Documentation/admin-guide/cgroup-v2.rst | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
index 64c62b979f2f..0a29cd46b1ab 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -2143,12 +2143,31 @@ RDMA Interface Files
 HugeTLB
 -------
 
-The HugeTLB controller allows to limit the HugeTLB usage per control group and
-enforces the controller limit during page fault.
+The "HugeTLB" controller regulates usage of huge pages. The controller
+supports two forms of accounting: page fault accounting and reservation
+accounting. See
+:ref:`Documentation/admin-guide/cgroup-v1/hugetlb.rst <cgroup-v1-hugetlb>`
+for more details.
+
 
 HugeTLB Interface Files
 ~~~~~~~~~~~~~~~~~~~~~~~
 
+  hugetlb.<hugepagesize>.rsvd.current
+	Show current reservations and no-reserve faults for "hugepagesize"
+	hugetlb.  It exists for all the cgroup except root.
+
+  hugetlb.<hugepagesize>.rsvd.max
+	Set/show the hard limit of reservations and no-reserve faults for
+	"hugepagesize" hugetlb. The default value is "max".
+	It exists for all the cgroup except root.
+
+  hugetlb.<hugepagesize>.rsvd.events
+	A read-only flat-keyed file which exists on non-root cgroups.
+
+	  max
+		The number of allocation failure due to HugeTLB reservation limit
+
   hugetlb.<hugepagesize>.current
 	Show current usage for "hugepagesize" hugetlb.  It exists for all
 	the cgroup except root.
-- 
2.31.1

