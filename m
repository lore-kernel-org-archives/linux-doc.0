Return-Path: <SRS0=ZV4e=6P=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E79BC47258
	for <linux-doc@archiver.kernel.org>; Fri,  1 May 2020 15:38:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F3D952495E
	for <linux-doc@archiver.kernel.org>; Fri,  1 May 2020 15:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1588347516;
	bh=gdYpQP4YuzhmUp4cdhCZ2oGju8f9Ib3IkVTGnfeDFqI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=qWy2MpQM4Qn8hlI7LsOyggk67q927t22VFupssQJXDGFCqTlP7YKrshQB8q4tRAi1
	 CiKl5/Y0GOlS2ysNgMdCmZlhD5kqR4wD+/92+ewHO71JXrqg2IoBClHAVU255z/duG
	 H7Wr+4mPPzD0g+7+Al2GAfp5WEzn4+yBDbptxFX4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729875AbgEAPiF (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 1 May 2020 11:38:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:52462 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729634AbgEAPiE (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 1 May 2020 11:38:04 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 07A0424962;
        Fri,  1 May 2020 15:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588347483;
        bh=gdYpQP4YuzhmUp4cdhCZ2oGju8f9Ib3IkVTGnfeDFqI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=EYnEMIKZEZFr8tljcH42ANdpUuR+qfKAWnjx79Bl5imzcNtdgzFX27Bn85OMwE+FW
         IOJKv9lK52PrzrKQAypcCxPgfassnrM2sJlUs1a+aptgs6jiVBv8lcxaw7L/Ja3bOy
         2RsP/ZKYi0E59zquT6YlYeupxBzMzJfxEJrKK7tY=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jUXjl-00FE5H-9Z; Fri, 01 May 2020 17:38:01 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 13/14] docs: staging: don't use literalinclude
Date:   Fri,  1 May 2020 17:37:57 +0200
Message-Id: <a89d8059e0357247841dfd4c68daa817faf775eb.1588345503.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <cover.1588345503.git.mchehab+huawei@kernel.org>
References: <cover.1588345503.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Such directive cause troubles with PDF output.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/staging/index.rst | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/Documentation/staging/index.rst b/Documentation/staging/index.rst
index 8e98517675ca..8cc9d94b0a13 100644
--- a/Documentation/staging/index.rst
+++ b/Documentation/staging/index.rst
@@ -19,14 +19,17 @@ Unsorted Documentation
 Atomic Types
 ============
 
-.. literalinclude:: ../atomic_t.txt
+.. include:: ../atomic_t.txt
+   :literal:
 
 Atomic bitops
 =============
 
-.. literalinclude:: ../atomic_bitops.txt
+.. include:: ../atomic_bitops.txt
+   :literal:
 
 Memory Barriers
 ===============
 
-.. literalinclude:: ../memory-barriers.txt
+.. include:: ../memory-barriers.txt
+   :literal:
-- 
2.25.4

