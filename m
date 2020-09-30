Return-Path: <SRS0=Pt5A=DH=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C385C47420
	for <linux-doc@archiver.kernel.org>; Wed, 30 Sep 2020 13:27:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D5F4E2075F
	for <linux-doc@archiver.kernel.org>; Wed, 30 Sep 2020 13:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601472426;
	bh=mf156XDS+RQ7mgP8yKK2xLh7kHg77GTlwBg64jsL3eY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=unM5rBC49mJ6eNOfey24TPRH95t/5Dz1Wv5u1DEZAoKlvUOWd/nj56bPfDIOtZz1A
	 5Jebs/cRAeYURYjBPc/trOPFxHOroXEtemdLTEkaAtBk1tVAbEMu+Fky2W9bTsonkZ
	 RgMkcwqnW5opjPSXMTzCs/pZeTofTrM+DrCVigOY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730270AbgI3N0v (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 30 Sep 2020 09:26:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:38752 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730263AbgI3NZW (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 30 Sep 2020 09:25:22 -0400
Received: from mail.kernel.org (unknown [95.90.213.196])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A642023A6A;
        Wed, 30 Sep 2020 13:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601472321;
        bh=mf156XDS+RQ7mgP8yKK2xLh7kHg77GTlwBg64jsL3eY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=XQtb8IK3FbSBPPWh7EUUGDTwR/GAKGsda61wD5jvsCnnKhVxRM/olzlVe7cNmM2m7
         KsN6STQVOt+0ZN9P9IW5OpWxhp0ze/38UefLDPfL8BhTuLIuE1+zURhw8bnle3yUrL
         6vNIYwDzUShR76/PDeEHOdMzsLsLaXYE83MN7LHs=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kNc6h-001XL3-Qd; Wed, 30 Sep 2020 15:25:19 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Tomas Winkler <tomas.winkler@intel.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 47/52] docs: mei.rst: fix a C expression markup
Date:   Wed, 30 Sep 2020 15:25:10 +0200
Message-Id: <34a9c9aaf8d5f922eac76fbd66a1a20da6b80714.1601467849.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601467849.git.mchehab+huawei@kernel.org>
References: <cover.1601467849.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Sphinx 3.x doesn't allow expressions using :c:func markup:

	./Documentation/driver-api/mei/mei.rst:41: WARNING: Unparseable C cross-reference: 'close(int fd)'
	Invalid C declaration: Expected end of definition. [error at 5]
	  close(int fd)
	  -----^

So, convert it into a :c:expr.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/driver-api/mei/mei.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/driver-api/mei/mei.rst b/Documentation/driver-api/mei/mei.rst
index cea0b69ec216..4f2ced4ccdc6 100644
--- a/Documentation/driver-api/mei/mei.rst
+++ b/Documentation/driver-api/mei/mei.rst
@@ -38,7 +38,7 @@ Because some of the Intel ME features can change the system
 configuration, the driver by default allows only a privileged
 user to access it.
 
-The session is terminated calling :c:func:`close(int fd)`.
+The session is terminated calling :c:expr:`close(fd)`.
 
 A code snippet for an application communicating with Intel AMTHI client:
 
-- 
2.26.2

