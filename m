Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CE31C433ED
	for <linux-doc@archiver.kernel.org>; Mon, 10 May 2021 10:31:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0E4436101D
	for <linux-doc@archiver.kernel.org>; Mon, 10 May 2021 10:31:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232090AbhEJKcf (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 10 May 2021 06:32:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:33952 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231735AbhEJKai (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 10 May 2021 06:30:38 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id DB72061921;
        Mon, 10 May 2021 10:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620642443;
        bh=K81lP2IJe6F92g35GyK7GwsLSYxXRw45oY6NL6QPjkg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=rI5riaooeiAr6Tan6MBCXeDXppiFLTpbr6phfxBXQ3xckImegzuVDIZxiZRLmx995
         iFLkdswS9j8F12kFoBEcdM8gEXS03BeTZmGmxgWI/8OpXI/BNOTkXlVP+qtvFvRU86
         9hDAKQIuNcadWuLV6Mx+AYTiY/Nc0Tkvd5M5+NZwiXD7QLQAvzpzhxGtu05wOtNcvk
         2G0BU/Dhz767GnnXy2gwH2GHKskx1yTwi2fjn+Qt9xXN1VIA0poDhqd9pZuZwqyp1m
         kighftvKiJJet0se08fLLtnj8MGpqmUwBgPKQDSCxMSHOlJPrDvgrNvZcaxVL84eGU
         xTwMGPhkpm8KA==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1lg38D-000UPQ-54; Mon, 10 May 2021 12:27:21 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>, linux-kernel@vger.kernel.org
Subject: [PATCH 17/53] docs: driver-api: firmware: other_interfaces.rst: avoid using UTF-8 chars
Date:   Mon, 10 May 2021 12:26:29 +0200
Message-Id: <df85ad0207e3d91b6f30d274ea8968f626f7080e.1620641727.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1620641727.git.mchehab+huawei@kernel.org>
References: <cover.1620641727.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

While UTF-8 characters can be used at the Linux documentation,
the best is to use them only when ASCII doesn't offer a good replacement.
So, replace the occurences of the following UTF-8 characters:

	- U+2019 ('’'): RIGHT SINGLE QUOTATION MARK

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/driver-api/firmware/other_interfaces.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/driver-api/firmware/other_interfaces.rst b/Documentation/driver-api/firmware/other_interfaces.rst
index b81794e0cfbb..6711b3572408 100644
--- a/Documentation/driver-api/firmware/other_interfaces.rst
+++ b/Documentation/driver-api/firmware/other_interfaces.rst
@@ -23,7 +23,7 @@ Exception Level 3 (EL3).
 
 The Intel Stratix10 SoC service layer provides an in kernel API for
 drivers to request access to the secure features. The requests are queued
-and processed one by one. ARM’s SMCCC is used to pass the execution
+and processed one by one. ARM's SMCCC is used to pass the execution
 of the requests on to a secure monitor (EL3).
 
 .. kernel-doc:: include/linux/firmware/intel/stratix10-svc-client.h
-- 
2.30.2

