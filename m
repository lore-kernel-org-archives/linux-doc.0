Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 09CB97D2F0
	for <lwn-linux-doc@archive.lwn.net>; Fri,  6 Sep 2019 09:59:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729928AbfIFJ67 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 6 Sep 2019 05:58:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:41154 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727171AbfIFJ67 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 6 Sep 2019 05:58:59 -0400
Received: from sasha-vm.mshome.net (unknown [62.28.240.114])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C26B2206CD;
        Fri,  6 Sep 2019 09:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567763939;
        bh=X3IxBTle7tracFMlrlHUU2pIyGkY3/ulvpNFy5+cm6o=;
        h=From:To:Cc:Subject:Date:From;
        b=z+ASPmB9QCACyRiBSNgurWMWeOkmW4nJQg0D4ykoMYcTiLj/Q8lY+iVqyY0F7QbE6
         UNzMIl146HPuqBahy03RUUk+itjblvXZRf5bVdSF5AMiF0jurw9GgPjVwO/W8t9771
         lVFOLYVTXDz6Gnjs1bRzFqRip2Uz1FwecwzLnQ5s=
From:   Sasha Levin <sashal@kernel.org>
To:     tglx@linutronix.de, corbet@lwn.net
Cc:     gregkh@linuxfoundation.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.wilk@oracle.com,
        jkosina@suse.cz, tyhicks@canonical.com, linux-kernel@microsoft.com,
        Sasha Levin <sashal@kernel.org>,
        Sasha Levin <alexander.levin@microsoft.com>
Subject: [PATCH] Documentation/process/embargoed-hardware-issues: Microsoft ambassador
Date:   Fri,  6 Sep 2019 05:58:52 -0400
Message-Id: <20190906095852.23568-1-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add Sasha Levin as Microsoft's process ambassador.

Signed-off-by: Sasha Levin <alexander.levin@microsoft.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 Documentation/process/embargoed-hardware-issues.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/process/embargoed-hardware-issues.rst b/Documentation/process/embargoed-hardware-issues.rst
index d37cbc502936d..9a92ccdbce74e 100644
--- a/Documentation/process/embargoed-hardware-issues.rst
+++ b/Documentation/process/embargoed-hardware-issues.rst
@@ -219,7 +219,7 @@ an involved disclosed party. The current ambassadors list:
   Intel
   Qualcomm
 
-  Microsoft
+  Microsoft	Sasha Levin <sashal@kernel.org>
   VMware
   XEN
 
-- 
2.20.1

