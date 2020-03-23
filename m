Return-Path: <SRS0=kJSq=5I=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E0A4C4332B
	for <linux-doc@archiver.kernel.org>; Mon, 23 Mar 2020 12:26:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 041D12078B
	for <linux-doc@archiver.kernel.org>; Mon, 23 Mar 2020 12:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1584966388;
	bh=YHai4ctJCjlmCmGFPnFzHa2wxTDr6jCJFRdt8EREGNo=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=ELl+RpowXedeKe1Z5BXflZzswDKvxHjwhPSbjxrSUGluElcD3rKVDh1G/bcdgTjuJ
	 WGr0RVtzwbmILmlHqmVBAUc3nKQf6fu+xFUQGp4VLV8+oqBvipjtJ8ODAouLIK12Xb
	 BPnb92EEjgokuhuwGjhSIXFBrj8bh8FMqLFexPCA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727130AbgCWM01 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 23 Mar 2020 08:26:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:50868 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727108AbgCWM01 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 23 Mar 2020 08:26:27 -0400
Received: from mail.kernel.org (ip5f5ad4e9.dynamic.kabel-deutschland.de [95.90.212.233])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EA4002076A;
        Mon, 23 Mar 2020 12:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584966387;
        bh=YHai4ctJCjlmCmGFPnFzHa2wxTDr6jCJFRdt8EREGNo=;
        h=From:To:Cc:Subject:Date:From;
        b=FvGbBMxXHG2jZpLD0Qn1P8L2JXwyRRyrcS3gMG6uIuzvISXsRYXWINbl5NCBWkIq/
         9DZXaqtRWF1meriBRM0A5+OAZNdhlfLw9Kz33qf2EHgFDYvSoP0jjmGyYV3k5ez67F
         DPG26Bxg4jmHq+vUS6p48Sk0FLtudJiK67+fUqmM=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jGM9w-001Ttw-UG; Mon, 23 Mar 2020 13:26:24 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH] docs: trace: coresight-ect.rst: fix a build warning
Date:   Mon, 23 Mar 2020 13:26:24 +0100
Message-Id: <049f74b1db84cf08a02d0922bfa7567a895d46f1.1584966380.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Sphinx wants a line after "..", as otherwise it complains with:

	Documentation/trace/coresight/coresight-ect.rst:2: WARNING: Explicit markup ends without a blank line; unexpected unindent.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/trace/coresight/coresight-ect.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/trace/coresight/coresight-ect.rst b/Documentation/trace/coresight/coresight-ect.rst
index ecc1e57012ef..a93e52abcf46 100644
--- a/Documentation/trace/coresight/coresight-ect.rst
+++ b/Documentation/trace/coresight/coresight-ect.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GPL-2.0
+
 =============================================
 CoreSight Embedded Cross Trigger (CTI & CTM).
 =============================================
-- 
2.24.1

