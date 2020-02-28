Return-Path: <SRS0=2giX=4Q=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 385A1C3F2CD
	for <linux-doc@archiver.kernel.org>; Fri, 28 Feb 2020 00:07:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0F296246B5
	for <linux-doc@archiver.kernel.org>; Fri, 28 Feb 2020 00:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1582848433;
	bh=buFkJM3dOgTb+/Wc/5NZAZVAdJZc0V6cFW8WGF8OLzU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=hHNd+D8XIY60Dvbc5abAA/8WWmhHoyBWCIW4FwtlxCztvIsA8Tu9WfBPGrm03mCEZ
	 Kkw2ksrLcSF0HxPRo3HGOxq5q4sWrJSw2DrNpjpF3eaB2dyRjCyCG1kGMCq/mYImi2
	 aoReWN0jlkmbxri8jATC0QV9HeZzlEqVuxXO5Y2c=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729930AbgB1AHM (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 27 Feb 2020 19:07:12 -0500
Received: from mail.kernel.org ([198.145.29.99]:60234 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729953AbgB1AHM (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 27 Feb 2020 19:07:12 -0500
Received: from kicinski-fedora-PC1C0HJN.thefacebook.com (unknown [163.114.132.128])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6AF13246AA;
        Fri, 28 Feb 2020 00:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582848431;
        bh=buFkJM3dOgTb+/Wc/5NZAZVAdJZc0V6cFW8WGF8OLzU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=aVWszsY9Jw8wQboqZTwFTjibWNQvi8Rt+iFaXEm+Cp6oJ5UzRJG8pxrB4qVidrnOE
         tVcIJnWZqMr1seN0/7cnDK+quh5Bu98Ei1Exe8OdD4x6Oc5eFo9qLsP70BnPojT+ot
         rWV4EBJ06nCEOnGvOaG7FkKdPV5it92iqGPmtdis=
From:   Jakub Kicinski <kuba@kernel.org>
To:     corbet@lwn.net
Cc:     clm@fb.com, hannes@cmpxchg.org, tj@kernel.org, lizefan@huawei.com,
        linux-doc@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH doc 1/5] doc: cgroup: improve formatting
Date:   Thu, 27 Feb 2020 16:06:49 -0800
Message-Id: <20200228000653.1572553-2-kuba@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200228000653.1572553-1-kuba@kernel.org>
References: <20200228000653.1572553-1-kuba@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Fix tabs vs spaces issue which cases the line to be considered
a new list entry.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
Acked-by: Johannes Weiner <hannes@cmpxchg.org>
---
 Documentation/admin-guide/cgroup-v2.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
index 3f801461f0f3..723c8bd422cc 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -1103,7 +1103,7 @@ PAGE_SIZE multiple when read back.
 	proportionally to the overage, reducing reclaim pressure for
 	smaller overages.
 
-       Effective min boundary is limited by memory.min values of
+	Effective min boundary is limited by memory.min values of
 	all ancestor cgroups. If there is memory.min overcommitment
 	(child cgroup or cgroups are requiring more protected memory
 	than parent will allow), then each child cgroup will get
-- 
2.24.1

