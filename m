Return-Path: <SRS0=MEEV=7Y=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 284DBC433E4
	for <linux-doc@archiver.kernel.org>; Thu, 11 Jun 2020 17:31:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 09FE7206DC
	for <linux-doc@archiver.kernel.org>; Thu, 11 Jun 2020 17:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1591896698;
	bh=lyxE0SkxoLi9C/lcq7nGrXiWGlEfL27aiqppL+Vzp9U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=XUvsk3z+hpEwBMUl9/uXhoyafF/t2IBcIceqXxDiAvW5qvHk70ju4qrJCmFoE7eDH
	 12Xy/9pXGyWLOnOzjlF1+nUzfd93XP/tzYJvUMMpNxs+rVZlZ9vZ6xvlyts9Wlj6d2
	 Y8Piua6HskBu6Li1Qps1Q/QZp+TzYWYpHEQ/EmyY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726848AbgFKRbZ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 11 Jun 2020 13:31:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:55232 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726842AbgFKRbY (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 11 Jun 2020 13:31:24 -0400
Received: from kicinski-fedora-PC1C0HJN.thefacebook.com (unknown [163.114.132.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D0E8920882;
        Thu, 11 Jun 2020 17:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591896684;
        bh=lyxE0SkxoLi9C/lcq7nGrXiWGlEfL27aiqppL+Vzp9U=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Btq2osW5T/PwSLeeyl1RxsZ4qEiyugKcLJUCeR4VeTEIrSxcfcEdgtzPCCTJV0ok9
         hvm0opYWSVXlv3GPQ8T4O96kSQKaMAclOdkKNYzVNKGlXrv+7Ia1EyRhAa1AwY8Izp
         hrS4siZBobjDteRUHS5H38/NxBRahSRAXMN6qr5E=
From:   Jakub Kicinski <kuba@kernel.org>
To:     davem@davemloft.net
Cc:     netdev@vger.kernel.org, linux-doc@vger.kernel.org,
        Jakub Kicinski <kuba@kernel.org>, luobin9@huawei.com
Subject: [RFC 5/8] docs: networking: move remaining Ethernet driver docs to the hw section
Date:   Thu, 11 Jun 2020 10:30:07 -0700
Message-Id: <20200611173010.474475-6-kuba@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200611173010.474475-1-kuba@kernel.org>
References: <20200611173010.474475-1-kuba@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Move docs for hinic and altera_tse under device_drivers/ethernet.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
--
CC: luobin9@huawei.com
---
 .../{ => device_drivers/ethernet/altera}/altera_tse.rst         | 0
 .../networking/{ => device_drivers/ethernet/huawei}/hinic.rst   | 0
 Documentation/networking/device_drivers/ethernet/index.rst      | 2 ++
 Documentation/networking/index.rst                              | 2 --
 MAINTAINERS                                                     | 2 +-
 5 files changed, 3 insertions(+), 3 deletions(-)
 rename Documentation/networking/{ => device_drivers/ethernet/altera}/altera_tse.rst (100%)
 rename Documentation/networking/{ => device_drivers/ethernet/huawei}/hinic.rst (100%)

diff --git a/Documentation/networking/altera_tse.rst b/Documentation/networking/device_drivers/ethernet/altera/altera_tse.rst
similarity index 100%
rename from Documentation/networking/altera_tse.rst
rename to Documentation/networking/device_drivers/ethernet/altera/altera_tse.rst
diff --git a/Documentation/networking/hinic.rst b/Documentation/networking/device_drivers/ethernet/huawei/hinic.rst
similarity index 100%
rename from Documentation/networking/hinic.rst
rename to Documentation/networking/device_drivers/ethernet/huawei/hinic.rst
diff --git a/Documentation/networking/device_drivers/ethernet/index.rst b/Documentation/networking/device_drivers/ethernet/index.rst
index fd3873024da8..cbb75a1818c0 100644
--- a/Documentation/networking/device_drivers/ethernet/index.rst
+++ b/Documentation/networking/device_drivers/ethernet/index.rst
@@ -13,6 +13,7 @@ Device drivers for Ethernet and Ethernet-based virtual function devices.
    3com/3c509
    3com/vortex
    amazon/ena
+   altera/altera_tse
    aquantia/atlantic
    chelsio/cxgb
    cirrus/cs89x0
@@ -24,6 +25,7 @@ Device drivers for Ethernet and Ethernet-based virtual function devices.
    freescale/dpaa2/index
    freescale/gianfar
    google/gve
+   huawei/hinic
    intel/e100
    intel/e1000
    intel/e1000e
diff --git a/Documentation/networking/index.rst b/Documentation/networking/index.rst
index 9f8230c325af..9bc8ecc79d94 100644
--- a/Documentation/networking/index.rst
+++ b/Documentation/networking/index.rst
@@ -38,7 +38,6 @@ Linux Networking Documentation
    nfc
    6lowpan
    6pack
-   altera_tse
    arcnet-hardware
    arcnet
    atm
@@ -62,7 +61,6 @@ Linux Networking Documentation
    generic_netlink
    gen_stats
    gtp
-   hinic
    ila
    ipddp
    ip_dynaddr
diff --git a/MAINTAINERS b/MAINTAINERS
index 4d31e9401b84..ab1b55a1f50e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7893,7 +7893,7 @@ HUAWEI ETHERNET DRIVER
 M:	Bin Luo <luobin9@huawei.com>
 L:	netdev@vger.kernel.org
 S:	Supported
-F:	Documentation/networking/hinic.rst
+F:	Documentation/networking/device_drivers/ethernet/huawei/hinic.rst
 F:	drivers/net/ethernet/huawei/hinic/
 
 HUGETLB FILESYSTEM
-- 
2.26.2

