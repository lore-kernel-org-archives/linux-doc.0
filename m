Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 577D4C4332F
	for <linux-doc@archiver.kernel.org>; Tue, 14 Sep 2021 14:34:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 44645610A2
	for <linux-doc@archiver.kernel.org>; Tue, 14 Sep 2021 14:34:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233641AbhINOgI (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 14 Sep 2021 10:36:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:57324 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233800AbhINOeH (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 14 Sep 2021 10:34:07 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 86232610FB;
        Tue, 14 Sep 2021 14:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631629970;
        bh=EITKoccU4E1iR3VkhTp48668Q3t6P/4e5dWQsfbYlJU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=UIXE43H/p0geAakbK8n0vvqGe5CYImNhAdZEDGM6vkhmSF5Tli7knLtD4exR9TSey
         c4bqXkBQgL8SUJJpSw3LvTFbdqc8OvXuNdlqKBNyxjMdGhNUi5Cbat15QjvaQEvx+u
         6SDb2BPoAxtSZlNSwLNMS3VeSQhrnzImFHmL1L0x954jF4JA/K876Cb31FEpZ0l1Wn
         gCaxg7Xu1K8FkuGhrON4hPAzYrcBEnkTeR4FkMogthLQ0oUJmelHa9wkRkAWZuP9mM
         Vv5VcyQb1jbFbdBChPP57VEWOJ3gceokgYHVfmT4Y95/RV5pBIGikb8p1XZTsYUPbR
         jsoQi+EdB1NWw==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mQ9UN-000Kky-Ss; Tue, 14 Sep 2021 16:32:47 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>, linux-kernel@vger.kernel.org
Subject: [PATCH v2 12/29] ABI: sysfs-ata: use a proper wildcard for ata_*
Date:   Tue, 14 Sep 2021 16:32:27 +0200
Message-Id: <46c00627a960ef0d9a7cd6501fe671fc56adca87.1631629496.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1631629496.git.mchehab+huawei@kernel.org>
References: <cover.1631629496.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

In order to let script/get_abi.pl to convert it into a Regex,
replace the three "..." at the end, meaning a wildcard to
a real filesystem wildcard.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/ABI/testing/sysfs-ata | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-ata b/Documentation/ABI/testing/sysfs-ata
index 9ab0ef1dd1c7..2f726c914752 100644
--- a/Documentation/ABI/testing/sysfs-ata
+++ b/Documentation/ABI/testing/sysfs-ata
@@ -1,4 +1,4 @@
-What:		/sys/class/ata_...
+What:		/sys/class/ata_*
 Description:
 		Provide a place in sysfs for storing the ATA topology of the
 		system. This allows retrieving various information about ATA
-- 
2.31.1

