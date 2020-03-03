Return-Path: <SRS0=Succ=4U=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECBB7C3F2D9
	for <linux-doc@archiver.kernel.org>; Tue,  3 Mar 2020 15:50:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BA55220866
	for <linux-doc@archiver.kernel.org>; Tue,  3 Mar 2020 15:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1583250651;
	bh=PyKCDooU4KzQOkbDDZXq892AnX71lclOSwV9wlmYVO0=;
	h=From:Cc:Subject:Date:In-Reply-To:References:To:List-ID:From;
	b=AOYg3DdIelXis6tT9cMlpJ3uUleEzQMdRxw5/C2jWldR8UXeCvn6VeD3jWGRMpHt7
	 QoZBkxPaT6HHx5v1/hO/rEUX7dnDGrjoX0k9sZIMaKoNOyDUebG2piV1PUkPklelKj
	 LFyKUIFmQgn5mqS6QJ44ObgpOC0EIsAqPTBt5HkU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730242AbgCCPuv (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 3 Mar 2020 10:50:51 -0500
Received: from mail.kernel.org ([198.145.29.99]:60066 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730245AbgCCPuu (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 3 Mar 2020 10:50:50 -0500
Received: from mail.kernel.org (tmo-101-56.customers.d1-online.com [80.187.101.56])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1BC7521741;
        Tue,  3 Mar 2020 15:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583250650;
        bh=PyKCDooU4KzQOkbDDZXq892AnX71lclOSwV9wlmYVO0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mY2zVi/2UJK8rPzJbpBPpMZUN48qXP3MFxbHZpeInZ1W52behvVDlAAQDY6SpvpGY
         l1Mc7YQhchvIzchQAMf6IFu8bHgggSiNzFwWBTHG5pIdM3OJawzM5/y0THK+FK38TY
         9dT7tNnwnmFHqrYThmLPGjZ4gTeTGt/mky/K0YOE=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1j99og-001ZPA-KL; Tue, 03 Mar 2020 16:50:42 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Frank Li <Frank.li@nxp.com>, Jonathan Corbet <corbet@lwn.net>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org
Subject: [PATCH 8/9] docs: perf: imx-ddr.rst: get rid of a warning
Date:   Tue,  3 Mar 2020 16:50:38 +0100
Message-Id: <b27b54bd4f847032fd33313d6497ff320c0f3d78.1583250595.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <afbe367ccb7b9abcb9fab7bc5cb5e0686c105a53.1583250595.git.mchehab+huawei@kernel.org>
References: <afbe367ccb7b9abcb9fab7bc5cb5e0686c105a53.1583250595.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

    Documentation/admin-guide/perf/imx-ddr.rst:47: WARNING: Unexpected indentation.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/admin-guide/perf/imx-ddr.rst | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/perf/imx-ddr.rst b/Documentation/admin-guide/perf/imx-ddr.rst
index 3726a10a03ba..f05f56c73b7d 100644
--- a/Documentation/admin-guide/perf/imx-ddr.rst
+++ b/Documentation/admin-guide/perf/imx-ddr.rst
@@ -43,7 +43,8 @@ value 1 for supported.
 
   AXI_ID and AXI_MASKING are mapped on DPCR1 register in performance counter.
   When non-masked bits are matching corresponding AXI_ID bits then counter is
-  incremented. Perf counter is incremented if
+  incremented. Perf counter is incremented if::
+
         AxID && AXI_MASKING == AXI_ID && AXI_MASKING
 
   This filter doesn't support filter different AXI ID for axid-read and axid-write
-- 
2.24.1

