Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 020397D910
	for <lwn-linux-doc@archive.lwn.net>; Mon, 22 Jul 2019 11:07:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729811AbfGVLH5 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 22 Jul 2019 07:07:57 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:35480 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727699AbfGVLH5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 22 Jul 2019 07:07:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=pZSG4xuJQweY6PCUMlH4rp5VCkVWJ38vw1kdn0RdtJY=; b=ejlMjBtIwfFFQ6lYNiY4acGGxP
        Z/rivTSsJzu2lZ6YU/klLXTX2WoiVO7tX55n+r4I2MnzTIyFbjU73g0ZCGFx9e5cbJ7ZRnMhsZmxy
        O1lQ9mtHppyzbVMGy/eSlHDzLBQ6hnSfIHn9gZsc/YOv8RpDBzcp7IoNPNyAQweulBXHePkZOa1HB
        7O+ibVpm6EQov3fC9n+kF5wv1yStnMpeCYSf5DBFcLhEBHIDj73LPZtmAHsBXZTzOjfwtKCwLmXf6
        ar0+mtonpuMEltbUDZfKy9C2qrp185KbnpLjQ89HJQap195/EzTVKA/FpJyGwI8xN5ub7jfudwY+A
        qtKzIqcA==;
Received: from 177.157.124.3.dynamic.adsl.gvt.net.br ([177.157.124.3] helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hpWAe-000251-HM; Mon, 22 Jul 2019 11:07:56 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1hpWAa-00040n-4L; Mon, 22 Jul 2019 08:07:52 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [PATCH 05/22] docs: ipmb: place it at driver-api and convert to ReST
Date:   Mon, 22 Jul 2019 08:07:32 -0300
Message-Id: <06bfb022780b01de5ca4e750286eda283f115cb3.1563792334.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1563792333.git.mchehab+samsung@kernel.org>
References: <cover.1563792333.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

No new doc should be added at the main Documentation/ directory.

Instead, new docs should be added as ReST files, within the
Kernel documentation body.

Fixes: 51bd6f291583 ("Add support for IPMB driver")
Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 Documentation/driver-api/index.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/driver-api/index.rst b/Documentation/driver-api/index.rst
index 37ac052ded85..38e638abe3eb 100644
--- a/Documentation/driver-api/index.rst
+++ b/Documentation/driver-api/index.rst
@@ -76,6 +76,7 @@ available subsections can be seen below.
    dell_rbu
    edid
    eisa
+   ipmb
    isa
    isapnp
    generic-counter
-- 
2.21.0

