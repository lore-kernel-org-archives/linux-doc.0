Return-Path: <SRS0=PdnY=D6=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFBECC5DF9D
	for <linux-doc@archiver.kernel.org>; Fri, 23 Oct 2020 16:35:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8FC8A22254
	for <linux-doc@archiver.kernel.org>; Fri, 23 Oct 2020 16:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603470949;
	bh=O/E0Z6O/UPUrbSu7UXWU5T0qLip69CA7JYzVL18Z7bE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=A9HKsPxg1+Gx5c9WGr5YrNqfMhX8JgtuoveOTdRIDi2eftFm1ZHSb7nUGHYS4R5II
	 7v5G0mz6YCTZfwCJX5PNW4sOX4w4urj6XcrdqI6pj/LrBSFTY/E6SzCAveDvQ8EaPK
	 PAUHrz3TZPsUYMc1FD7+4TnuX9Jh3VB5OKYpNkAs=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S465935AbgJWQfi (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 23 Oct 2020 12:35:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:33220 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751866AbgJWQdv (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 23 Oct 2020 12:33:51 -0400
Received: from mail.kernel.org (ip5f5ad5a3.dynamic.kabel-deutschland.de [95.90.213.163])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B70A3246E0;
        Fri, 23 Oct 2020 16:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603470828;
        bh=O/E0Z6O/UPUrbSu7UXWU5T0qLip69CA7JYzVL18Z7bE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PSeu01f1iBI+mfYtOfszKvhc87BQEY8j+rOWwRjujNP49nNXoLPkke1eibCO5K6bq
         3/WgPQXqxmC/co3/E8AAUuDB6mxKyZQmk8JiYWU8+E5YmYFtJzGYPHNQk5zOZBTBo6
         PIBGUAZezqdEAhx3DsWusHg2BEqguKuA+FkUthGQ=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kW00g-002Axd-K8; Fri, 23 Oct 2020 18:33:46 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>,
        Ard Biesheuvel <ardb@kernel.org>,
        Ingo Molnar <mingo@kernel.org>, Jann Horn <jannh@google.com>,
        Kees Cook <keescook@chromium.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH v3 49/56] refcount.h: fix a kernel-doc markup
Date:   Fri, 23 Oct 2020 18:33:36 +0200
Message-Id: <fd94a95cfe01b97190b6ffb9e942cb4bbeeaa6bf.1603469755.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1603469755.git.mchehab+huawei@kernel.org>
References: <cover.1603469755.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The documented typedef just after the kernel-doc markup
is named "refcount_struct".

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 include/linux/refcount.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/refcount.h b/include/linux/refcount.h
index 497990c69b0b..8f431b0e69e4 100644
--- a/include/linux/refcount.h
+++ b/include/linux/refcount.h
@@ -101,7 +101,7 @@
 struct mutex;
 
 /**
- * struct refcount_t - variant of atomic_t specialized for reference counts
+ * struct refcount_struct - variant of atomic_t specialized for reference counts
  * @refs: atomic_t counter field
  *
  * The counter saturates at REFCOUNT_SATURATED and will not move once
-- 
2.26.2

