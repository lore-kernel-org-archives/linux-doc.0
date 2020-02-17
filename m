Return-Path: <SRS0=VB12=4F=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBA41C34039
	for <linux-doc@archiver.kernel.org>; Mon, 17 Feb 2020 16:13:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 99E19214D8
	for <linux-doc@archiver.kernel.org>; Mon, 17 Feb 2020 16:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1581955996;
	bh=E9wHHcvBmmu2s572iWfqpO1JiHtihnoPCff6jLUibmk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=nQWpyFulhDM9JSqoEvQLoJ8lLa0ve5X7CLJDr0gY/bjtUE7liv9xt9nBRf2zA48E+
	 cdtfNcqvajW2Z/6VykjZql8zMx3TDXc7dV87UuoAnnRMlP9myvk1fpqw0jqNjqQea6
	 uX5NRqyYuhCqGJ2VaEHCisZiAcLwI5zHGsVWj/pw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729827AbgBQQNQ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 17 Feb 2020 11:13:16 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:47156 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729687AbgBQQMe (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 17 Feb 2020 11:12:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description;
        bh=zxYnd8vOctQKhIzAX3Aug75pQPWyw3LwrJRpdfjW0a8=; b=AGozPQmwPJ/n8NKyCmWV4+mhjZ
        /zPurxFVL3h9MEHS3+1jSBoM1QRcI5H4fQ8Z8iUxQ0ZZvNm3Jy1XFU6GlJl+bHVkSEb65rQScMwUA
        GXgQ/1wubMRW4+CgilMzjXUVigtiio9XB7ZoCcqiVQ5MATOJnKPnY99CgMSLl5kIporMZIjfqSsRq
        PNVkpE0bpLhmiTXWhJjvgSJHaY5FEYkpQFZJFtShz0jOeICpLeFiNo2whes0bxe00dp9CSO3toIF3
        ybJCiZ1AW64czwKRVIiGADzP5SYFOqLCBMpOlzv6fKIHZSH9TRyG1RvMz/wQCt5TY/e4jieuqnqam
        7FtDXYTg==;
Received: from tmo-109-126.customers.d1-online.com ([80.187.109.126] helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1j3j0c-0006uj-EH; Mon, 17 Feb 2020 16:12:34 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92.3)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1j3j0a-000fac-Fs; Mon, 17 Feb 2020 17:12:32 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-fsdevel@vger.kernel.org
Subject: [PATCH 21/44] docs: filesystems: convert hfsplus.txt to ReST
Date:   Mon, 17 Feb 2020 17:12:07 +0100
Message-Id: <4298409da951fbee000201a6c8d9c85e961b2b79.1581955849.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1581955849.git.mchehab+huawei@kernel.org>
References: <cover.1581955849.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Just trivial changes:

- Add a SPDX header;
- Add it to filesystems/index.rst.

While here, adjust document title, just to make it use the same
style of the other docs.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/filesystems/{hfsplus.txt => hfsplus.rst} | 2 ++
 Documentation/filesystems/index.rst                    | 1 +
 2 files changed, 3 insertions(+)
 rename Documentation/filesystems/{hfsplus.txt => hfsplus.rst} (95%)

diff --git a/Documentation/filesystems/hfsplus.txt b/Documentation/filesystems/hfsplus.rst
similarity index 95%
rename from Documentation/filesystems/hfsplus.txt
rename to Documentation/filesystems/hfsplus.rst
index 59f7569fc9ed..f02f4f5fc020 100644
--- a/Documentation/filesystems/hfsplus.txt
+++ b/Documentation/filesystems/hfsplus.rst
@@ -1,4 +1,6 @@
+.. SPDX-License-Identifier: GPL-2.0
 
+======================================
 Macintosh HFSPlus Filesystem for Linux
 ======================================
 
diff --git a/Documentation/filesystems/index.rst b/Documentation/filesystems/index.rst
index c16e517e37c5..c351bc8a8c85 100644
--- a/Documentation/filesystems/index.rst
+++ b/Documentation/filesystems/index.rst
@@ -67,6 +67,7 @@ Documentation for filesystem implementations.
    f2fs
    gfs2
    gfs2-uevents
+   hfsplus
    fuse
    overlayfs
    virtiofs
-- 
2.24.1

