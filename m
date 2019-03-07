Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 709317D04D
	for <lwn-linux-doc@archive.lwn.net>; Thu,  7 Mar 2019 21:13:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726285AbfCGVM1 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 7 Mar 2019 16:12:27 -0500
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:36267 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726186AbfCGVM0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 7 Mar 2019 16:12:26 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id 9A3883026;
        Thu,  7 Mar 2019 16:12:24 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Thu, 07 Mar 2019 16:12:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; bh=fvDUUrSZWfNWQF1kal+TwFBvkWfhzWW906Ay9fl3GSE=; b=Z4tbxDkG
        N/t0m1Q14yaXumHhw9m1HldI/T/IS/IQZPtOhkhH/3lDF9aQhCg4xFPLCHzJHCEg
        R6m3cSKUpInuDNwiCegHjwPemO2RAPl8oUN4ZOw+hfmm5/RQNIE1vs3i9SN7NK+/
        jOpsfoVcHyA5WVBl0nTzK9TWCF91ptHdQEMCp21G3u833NNSKz8Ewp4Y1TaTou71
        8u/YzRKN5CRqmeU1B+0XnqsjbYV5adShz8p0tzKlwULO1X4yFsqwNP6k0ZEmCd+Z
        jFy0jufMSnFE0g94vYHoTsy0BcB4tRHpp+m932/EHcJJaxp/cQH2gFNAPdWhuMAO
        SfQwvwWkb92EyQ==
X-ME-Sender: <xms:OImBXNLNiVxg0qxILpXS4e430EGJdy0eD886HSpwpTThMdxhzQlpwg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedutddrfeekgdduhedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpedfvfhosghi
    nhcuvedrucfjrghrughinhhgfdcuoehtohgsihhnsehkvghrnhgvlhdrohhrgheqnecuff
    homhgrihhnpehsphgugidrohhrghenucfkphepuddvgedrudeiledrhedrudehkeenucfr
    rghrrghmpehmrghilhhfrhhomhepthhosghinheskhgvrhhnvghlrdhorhhgnecuvehluh
    hsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:OImBXFc72tADfUGXb_VCleRNk_qKFRYgkovMZr_qL0OpxFDJeaTBmA>
    <xmx:OImBXId3bjPRfYXMvT2_xN0M4jiWyaaXSlgjZQHeVB51as3iFbGCHw>
    <xmx:OImBXAPOc0Bd7fq-6Act60mH3Ed4xAWXz50LT2_kbsXZGUV2fl6pxw>
    <xmx:OImBXGph-gxdgsLfJcwsAiDVbFY5uWgKrlESoCHcBnBhhaLhTFlvNQ>
Received: from eros.localdomain (124-169-5-158.dyn.iinet.net.au [124.169.5.158])
        by mail.messagingengine.com (Postfix) with ESMTPA id 3856F1033F;
        Thu,  7 Mar 2019 16:12:21 -0500 (EST)
From:   "Tobin C. Harding" <tobin@kernel.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     "Tobin C. Harding" <tobin@kernel.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/9] docs: Fix spelling mistake
Date:   Fri,  8 Mar 2019 08:11:45 +1100
Message-Id: <20190307211153.28400-2-tobin@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190307211153.28400-1-tobin@kernel.org>
References: <20190307211153.28400-1-tobin@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Documentation contains a spelling mistake / typo.

s/descibed/described/

Fix spelling mistake.

Signed-off-by: Tobin C. Harding <tobin@kernel.org>
---
 Documentation/process/howto.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/process/howto.rst b/Documentation/process/howto.rst
index 58b2f46c4f98..5cac67f8fb17 100644
--- a/Documentation/process/howto.rst
+++ b/Documentation/process/howto.rst
@@ -62,7 +62,7 @@ Legal Issues
 The Linux kernel source code is released under the GPL.  Please see the file
 COPYING in the main directory of the source tree. The Linux kernel licensing
 rules and how to use `SPDX <https://spdx.org/>`_ identifiers in source code are
-descibed in :ref:`Documentation/process/license-rules.rst <kernel_licensing>`.
+described in :ref:`Documentation/process/license-rules.rst <kernel_licensing>`.
 If you have further questions about the license, please contact a lawyer, and do
 not ask on the Linux kernel mailing list.  The people on the mailing lists are
 not lawyers, and you should not rely on their statements on legal matters.
-- 
2.21.0

