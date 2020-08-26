Return-Path: <SRS0=H0Zm=CE=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3217AC433E3
	for <linux-doc@archiver.kernel.org>; Wed, 26 Aug 2020 10:47:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 136F62080C
	for <linux-doc@archiver.kernel.org>; Wed, 26 Aug 2020 10:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1598438857;
	bh=H9neYgmVln5Jffw34Ba87hP+ZPEB2N6fSYpwLjOWXRY=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=LsA2mMKsqiOUobGJxrIdLdl6uMfvcqWJTMFOFU3rpxlJF5WhwMhJsYn+PAEcVmsk3
	 BDUoc85FUtlyn1jMbKNn0LSlowaSnP+kzQJTqM33IkVMBPq+PIO+9FBgMekBryArOV
	 p7ondw1xrzeq9VAfa0B8PhryZHTXtj8jatw3PEw0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728647AbgHZKrg (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 26 Aug 2020 06:47:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:35694 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728630AbgHZKrb (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 26 Aug 2020 06:47:31 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EABF3206EB;
        Wed, 26 Aug 2020 10:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598438851;
        bh=H9neYgmVln5Jffw34Ba87hP+ZPEB2N6fSYpwLjOWXRY=;
        h=From:To:Cc:Subject:Date:From;
        b=wrh07LDfgn3OOJ5AAWFQ5S0iKdFQ0A/Khbu29hzidgCbl2oQCoPtBfSKI9+/PtTR2
         Wv7aH1BEuOrvM8ZkKrGUOEX7h8wY+G68kS1J3vxwTd8Uea5LcHiPWWMRHWSZHU77SG
         Q7OWqRWWkl+dTrzJbpYIz+gP53zj/ktwTfmHGuFQ=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kAsxk-002E7T-Tg; Wed, 26 Aug 2020 12:47:28 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH] MAINTAINERS: fix location of qlogic/LICENSE.qla3xxx
Date:   Wed, 26 Aug 2020 12:47:28 +0200
Message-Id: <20200826104728.530892-1-mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

ethernet/qlogic/LICENSE.qla3xxx -> qlogic/LICENSE.qla3xxx

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2cb818035d1d..6fd94d6b9126 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14279,7 +14279,7 @@ QLOGIC QLA3XXX NETWORK DRIVER
 M:	GR-Linux-NIC-Dev@marvell.com
 L:	netdev@vger.kernel.org
 S:	Supported
-F:	Documentation/networking/device_drivers/ethernet/qlogic/LICENSE.qla3xxx
+F:	Documentation/networking/device_drivers/qlogic/LICENSE.qla3xxx
 F:	drivers/net/ethernet/qlogic/qla3xxx.*
 
 QLOGIC QLA4XXX iSCSI DRIVER
-- 
2.26.2

