Return-Path: <SRS0=jIxK=EE=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E5CEC4363A
	for <linux-doc@archiver.kernel.org>; Thu, 29 Oct 2020 00:58:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 350A1207DE
	for <linux-doc@archiver.kernel.org>; Thu, 29 Oct 2020 00:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603933105;
	bh=utf67EdxIsrYU5HAUJdkhYRVW67PKxkveGsT+//j2js=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=117LN/XMqUE4CKCDNV8y4AkCPDOiMCtcQS2FJZbuXaDtThvBAgdTEFndEXEBGf7+1
	 wlbByuDz6iyavess306eLf1ruMDstgwTDX6oDfzBK+UzN/QLC8HqPbOa56+H6KwR5E
	 TBgvRkNFtd4+A0PsT1VgKB5wHZDS4the9VIwmDsI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403834AbgJ2A6G (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 28 Oct 2020 20:58:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:60510 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731580AbgJ1WRc (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 28 Oct 2020 18:17:32 -0400
Received: from mail.kernel.org (ip5f5ad5b2.dynamic.kabel-deutschland.de [95.90.213.178])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DBD652478B;
        Wed, 28 Oct 2020 14:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603895015;
        bh=utf67EdxIsrYU5HAUJdkhYRVW67PKxkveGsT+//j2js=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hHc8VebZJkGO9OBFNDnFHRp6wL+5K+njBomOa2uYTFTU232qLZg+B4xQ0rv9vLo87
         Mqs7u0roypnstIRZ9ZS8pK9dvXvOHYKfuulT+6siZelYPYoVq/zqWoKFC+kau7+hXn
         KYgvEHirM3B1j0PwXia9kkoTBnJoRPOnMVMYWNrA=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kXmMO-003hlX-TC; Wed, 28 Oct 2020 15:23:32 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>,
        "Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 18/33] docs: ABI: README: specify that files should be ReST compatible
Date:   Wed, 28 Oct 2020 15:23:16 +0100
Message-Id: <5e3c2f89e22849f2dbbbac35088e285f5d051278.1603893146.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1603893146.git.mchehab+huawei@kernel.org>
References: <cover.1603893146.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

As we plan to remove the escaping code from the scripts/get_abi.pl,
specify at the ABI README file that the content of the file should
be ReST compatible.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
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
2.26.2

