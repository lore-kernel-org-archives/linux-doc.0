Return-Path: <SRS0=2giX=4Q=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81276C3F2D0
	for <linux-doc@archiver.kernel.org>; Fri, 28 Feb 2020 00:07:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4C309246A8
	for <linux-doc@archiver.kernel.org>; Fri, 28 Feb 2020 00:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1582848434;
	bh=/4wVjqmrBspm9EnZOKQaF0PtnQoAhB60IM6pppAslk4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=BCLc1iihYIwIWuZTxi2o+D9HkwjOD936wlXSvluzGZH7lMjMU1c+UBikFoXEioff+
	 R3WTxYlTboxAHiao+iIryc9MJv60DD1afMf0vl+SSJ6Vwfe9aYJ3TgPToVM8MpmrtO
	 fiBtCwHRxek1nI23YbxkX9HNmwSktANac4xpVvxg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730034AbgB1AHN (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 27 Feb 2020 19:07:13 -0500
Received: from mail.kernel.org ([198.145.29.99]:60330 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729953AbgB1AHN (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 27 Feb 2020 19:07:13 -0500
Received: from kicinski-fedora-PC1C0HJN.thefacebook.com (unknown [163.114.132.128])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D0F86246B4;
        Fri, 28 Feb 2020 00:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582848433;
        bh=/4wVjqmrBspm9EnZOKQaF0PtnQoAhB60IM6pppAslk4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=N5/eqeMPmJSZbS760VnBZt5p2QYkoko0M3D6ioSAbhNvrmWXrVZXQzfvqf2+gDvpN
         WF8Qd2fLl1rUC5QgGfrRnro/Eo2e7hLjii7/Yh1i4JaxEQKkfQ3CEWiGTVCglJHlVs
         HkF50yExxITOvcEXO6WCsmDTt+Ab9Z8kyoXcM8/Y=
From:   Jakub Kicinski <kuba@kernel.org>
To:     corbet@lwn.net
Cc:     clm@fb.com, hannes@cmpxchg.org, tj@kernel.org, lizefan@huawei.com,
        linux-doc@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH doc 4/5] doc: cgroup: improve formatting of cpuset examples
Date:   Thu, 27 Feb 2020 16:06:52 -0800
Message-Id: <20200228000653.1572553-5-kuba@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200228000653.1572553-1-kuba@kernel.org>
References: <20200228000653.1572553-1-kuba@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

We need literal sections otherwise the entire example is rendered
as a single line.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
Acked-by: Johannes Weiner <hannes@cmpxchg.org>
---
 Documentation/admin-guide/cgroup-v2.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
index 9d16fbc5df63..308d096af071 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -1841,7 +1841,7 @@ Cpuset Interface Files
 	from the requested CPUs.
 
 	The CPU numbers are comma-separated numbers or ranges.
-	For example:
+	For example::
 
 	  # cat cpuset.cpus
 	  0-4,6,8-10
@@ -1880,7 +1880,7 @@ Cpuset Interface Files
 	from the requested memory nodes.
 
 	The memory node numbers are comma-separated numbers or ranges.
-	For example:
+	For example::
 
 	  # cat cpuset.mems
 	  0-1,3
-- 
2.24.1

