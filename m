Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 623577D923
	for <lwn-linux-doc@archive.lwn.net>; Mon,  8 Apr 2019 17:00:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727039AbfDHQ7O (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 8 Apr 2019 12:59:14 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:58916 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729248AbfDHQ6i (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 8 Apr 2019 12:58:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=VAMFAFAKujLSv3Qur+yCPXsO8JE9Zm7EVPPt0xUnG4w=; b=VI741FL6dzywKgE6gi9TIgSHLd
        x6pLjFIhFmybKr7l5qKbMVmd3WkeuI7Z9/Sy7ZV1kJ1LNTGcAOWSAkz22En3L7wLbEhkL7Pxde9PR
        q8kDtwfEHieLWVpwdropZF/W02WtK2Z0N3b9oGg66a/ShpCbDcRdVZ2wWT2fIJCOOLl7HeRyeF74H
        HKkP22F6rBNg9bGHHjCXfS2i0E52rWWHYMwtbusV5ZVgxYdjCvUn/VIxTxnD5f0J/7X93s1O+19ry
        gVqof729iU7bCYEdzY8moATyezf7IoIobnfxaKS2vMEJDBmmvefU3zEfMq5OrOesAgpcEIXltpY1Z
        FW9JS2/Q==;
Received: from [179.95.33.162] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hDXbQ-0005Su-LF; Mon, 08 Apr 2019 16:58:36 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1hDXbI-0005n1-5x; Mon, 08 Apr 2019 13:58:28 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 01/10] docs: DMA-API-HOWTO: add a missing "="
Date:   Mon,  8 Apr 2019 13:58:17 -0300
Message-Id: <3799c957f95603f90ea2f3119b550a9810d0dc79.1554742526.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1554742526.git.mchehab+samsung@kernel.org>
References: <cover.1554742526.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The === line is shorter than the section title.

As this will generate a warning with rst build, fix it.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 Documentation/DMA-API-HOWTO.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/DMA-API-HOWTO.txt b/Documentation/DMA-API-HOWTO.txt
index 1a721d0f35c8..db48c6fd3162 100644
--- a/Documentation/DMA-API-HOWTO.txt
+++ b/Documentation/DMA-API-HOWTO.txt
@@ -147,7 +147,7 @@ networking subsystems make sure that the buffers they use are valid
 for you to DMA from/to.
 
 DMA addressing capabilities
-==========================
+===========================
 
 By default, the kernel assumes that your device can address 32-bits of DMA
 addressing.  For a 64-bit capable device, this needs to be increased, and for
-- 
2.20.1

