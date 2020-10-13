Return-Path: <SRS0=GARK=DU=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 473CDC43457
	for <linux-doc@archiver.kernel.org>; Tue, 13 Oct 2020 12:00:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EB5832080A
	for <linux-doc@archiver.kernel.org>; Tue, 13 Oct 2020 12:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602590430;
	bh=6FnAXTisJK9UFRAN8m9cKwYQmxfqAucBzkfFzqVowps=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=exI6yOe9SquGdKUmgC5tVUszkcBMRNB2SpxJ9o6qinC/HIVlwOEA4PxjrMyG9R6iy
	 AjXuxP5oWtznooqweatxg7u/8VC/8jHzzGy8lA5FvCSHQrf1RPUcR6Gzl5g7PqaaXn
	 nnXOWXvH3REk0ikuTJfWzA1EAXdsV73a459VWgCY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727474AbgJMMA2 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 13 Oct 2020 08:00:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:57390 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727464AbgJMLym (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 13 Oct 2020 07:54:42 -0400
Received: from mail.kernel.org (ip5f5ad5b2.dynamic.kabel-deutschland.de [95.90.213.178])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8A15C222B8;
        Tue, 13 Oct 2020 11:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602590080;
        bh=6FnAXTisJK9UFRAN8m9cKwYQmxfqAucBzkfFzqVowps=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=M+CryfopvZVxNhSp4//FqDaBQ+Oscc631+w+7kIforkvV7qYf6WA6B2myPIPTwKlT
         6cmmU7OqFIAqHJflE1PtapTHLQwa9gLAyCZ7eiCGN02ogsROXGrk24mlTDRg2L3+vS
         em9ac5KmHk6N0zRL1r5Hz/R9z8poVQMHR7PBdu7w=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kSIt4-006CUd-I4; Tue, 13 Oct 2020 13:54:38 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>, linux-kernel@vger.kernel.org
Subject: [PATCH v6 33/80] docs: basics.rst: get rid of rcu kernel-doc macros
Date:   Tue, 13 Oct 2020 13:53:48 +0200
Message-Id: <f6eca03c3b5252f8d4f8c691899ca2b7d483087d.1602589096.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1602589096.git.mchehab+huawei@kernel.org>
References: <cover.1602589096.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Those are already defined at kernel-api.rst, as part of the
synchronization primitives chapter.

This solves several Sphinx 3 warnings, like:

	.../Documentation/driver-api/basics.rst: WARNING: Duplicate C declaration, also defined in 'core-api/kernel-api'.
	Declaration is 'rcu_idle_enter'.
	.../Documentation/driver-api/basics.rst: WARNING: Duplicate C declaration, also defined in 'core-api/kernel-api'.
	Declaration is 'rcu_idle_exit'.
	.../Documentation/driver-api/basics.rst: WARNING: Duplicate C declaration, also defined in 'core-api/kernel-api'.
	Declaration is 'rcu_is_watching'.
	.../Documentation/driver-api/basics.rst: WARNING: Duplicate C declaration, also defined in 'core-api/kernel-api'.
	Declaration is 'call_rcu'.
	.../Documentation/driver-api/basics.rst: WARNING: Duplicate C declaration, also defined in 'core-api/kernel-api'.
	Declaration is 'synchronize_rcu'.
	...

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/driver-api/basics.rst | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/Documentation/driver-api/basics.rst b/Documentation/driver-api/basics.rst
index 54f8d5ca7475..63bbe3ed5e76 100644
--- a/Documentation/driver-api/basics.rst
+++ b/Documentation/driver-api/basics.rst
@@ -103,12 +103,6 @@ Kernel utility functions
 .. kernel-doc:: kernel/panic.c
    :export:
 
-.. kernel-doc:: kernel/rcu/tree.c
-   :export:
-
-.. kernel-doc:: kernel/rcu/update.c
-   :export:
-
 .. kernel-doc:: include/linux/overflow.h
    :internal:
 
-- 
2.26.2

