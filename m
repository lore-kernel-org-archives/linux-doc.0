Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 79A5D7D90F
	for <lwn-linux-doc@archive.lwn.net>; Sat, 22 Jun 2019 17:32:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726445AbfFVRcB (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 22 Jun 2019 13:32:01 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:45120 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726353AbfFVRcA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 22 Jun 2019 13:32:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=GwuJAUByrQHMk1PQs8rz13IEKJH89ptQrCnqtIM5oaA=; b=FzvrRI+tASz6quuDZZiuJkokoj
        pw9c7wdJXISMFtZePbkE9s8YZp3GkKDrxI/SPeQC+cOzhWSgahR8L/LkTTD3DNpzKJdzCbPmdzawB
        ikoUqnY0R5p4C8G3+HjD7MOq15WuNtasZDh86b68uBN9426i5NLOxohoNByo70ahGQ7GyJr4F9OwC
        41pOVYuzriGN/RtoFZ4B2/gCbOvc2CAp1IQiXFq9Rxr+7swy15R6qmULh3AvMO0VLwOang51vVOne
        z62/B7FALpbKnVtRP7WDl4AhOKa9YpCP6Rq5qw8AUrngQDIUkGEuYpzkWd3L2KDv2DLJGDdndF6kO
        GAREcliA==;
Received: from [179.95.45.115] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hejrs-00076f-8p; Sat, 22 Jun 2019 17:32:00 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1hejrq-0001H8-5J; Sat, 22 Jun 2019 14:31:58 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        gregkh@linuxfoundation.org
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Subject: [RFC v2 1/8] docs: ABI: README: specify that files should be ReST compatible
Date:   Sat, 22 Jun 2019 14:31:49 -0300
Message-Id: <eb3017ed2dbeed35da11f738880ac19aeb8b8df8.1561224093.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1561224093.git.mchehab+samsung@kernel.org>
References: <cover.1561224093.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

As we plan to remove the escaping code from the scripts/get_abi.pl,
specify at the ABI README file that the content of the file should
be ReST compatible.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 Documentation/ABI/README | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/README b/Documentation/ABI/README
index 3121029dce21..8bac9cb09a6d 100644
--- a/Documentation/ABI/README
+++ b/Documentation/ABI/README
@@ -32,7 +32,7 @@ The different levels of stability are:
 	layout of the files below for details on how to do this.)
 
   obsolete/
-  	This directory documents interfaces that are still remaining in
+	This directory documents interfaces that are still remaining in
 	the kernel, but are marked to be removed at some later point in
 	time.  The description of the interface will document the reason
 	why it is obsolete and when it can be expected to be removed.
@@ -58,6 +58,14 @@ Users:		All users of this interface who wish to be notified when
 		be changed further.
 
 
+Note:
+   The fields should be use a simple notation, compatible with ReST markup.
+   Also, the file **should not** have a top-level index, like::
+
+	===
+	foo
+	===
+
 How things move between levels:
 
 Interfaces in stable may move to obsolete, as long as the proper
-- 
2.21.0

