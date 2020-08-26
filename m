Return-Path: <SRS0=H0Zm=CE=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0A1EC433DF
	for <linux-doc@archiver.kernel.org>; Wed, 26 Aug 2020 10:47:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AE27920838
	for <linux-doc@archiver.kernel.org>; Wed, 26 Aug 2020 10:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1598438848;
	bh=jxKgwQpqmG7edKBQ2bcpJ5DtU3FDZhmfZZD+7bojMRs=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=WCKHz5WV7Fv1HfunA4VM4JTINkEXfXTnSIIPOC1/qyYilWhCmdbxD69gJGqlJMgKZ
	 yMILr0GtCuWgKswZBH2Dd4VK0EJaA1LFII5suBESBN55hw5f4SMw5kBEBzhDQIJkCf
	 VoWC9O8Km3J4ogJM2xcqd3zT1OgNFhnmNRXOxBJ0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728609AbgHZKrZ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 26 Aug 2020 06:47:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:35432 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728602AbgHZKrV (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 26 Aug 2020 06:47:21 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 865C5206EB;
        Wed, 26 Aug 2020 10:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598438840;
        bh=jxKgwQpqmG7edKBQ2bcpJ5DtU3FDZhmfZZD+7bojMRs=;
        h=From:To:Cc:Subject:Date:From;
        b=grLmVFx23Q4+R3zgco4J19ZsMNvDq+0oLaf+AE4DudRly3a7YT9HUsWWELNw2kmxT
         DrzUlmoPIL3vog2sdfCSb1WldnlHTtkVEOA9ubbHjDSP1uccfq1kpQbek9JTcHjHea
         6v6hv9ZUULTxpPQ/CabatIEGPU4OwKPPBIUu04dY=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kAsxa-002Dnc-Kd; Wed, 26 Aug 2020 12:47:18 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH] docs: hwmon: adm1266.rst: fix a broken reference
Date:   Wed, 26 Aug 2020 12:47:17 +0200
Message-Id: <20200826104717.529661-1-mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The reference was missing the extension, causing the
check script to complain.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/hwmon/adm1266.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/hwmon/adm1266.rst b/Documentation/hwmon/adm1266.rst
index 9257f8a48650..2b877011cfdf 100644
--- a/Documentation/hwmon/adm1266.rst
+++ b/Documentation/hwmon/adm1266.rst
@@ -20,7 +20,7 @@ ADM1266 is a sequencer that features voltage readback from 17 channels via an
 integrated 12 bit SAR ADC, accessed using a PMBus interface.
 
 The driver is a client driver to the core PMBus driver. Please see
-Documentation/hwmon/pmbus for details on PMBus client drivers.
+Documentation/hwmon/pmbus.rst for details on PMBus client drivers.
 
 
 Sysfs entries
-- 
2.26.2

