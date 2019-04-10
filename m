Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1F5387D918
	for <lwn-linux-doc@archive.lwn.net>; Wed, 10 Apr 2019 19:23:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726073AbfDJTXI (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 10 Apr 2019 15:23:08 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:44020 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726181AbfDJTXH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 10 Apr 2019 15:23:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=et9eXCe5ZAfSQ5mBgtr6YkPzKHB/bcQ3N5gbJc1LICw=; b=KT9kmZWYV1w4j1dcwdzIVvdD3v
        H+/nXgqqlVeXrgFkgyRviZMaOh8pmSkvIY7isG3K9YssAqInxOuegxvfGVPASD4mdRg52Kt6/PKG1
        2sBjdwW1grXJddZU6PLNKN0MiwEcloJAnZ4K6St6EOymgllqfO/TvII82w/hxtIqyzwlk2+zGVtYe
        MY7kL/pfzKsCQN3uPDDvU02QngzncXxjd6JyEeTbc6A7F2GS+CvmmckLG4qQnVBJ6sicoumk2aRH+
        8tImzfqdPotRtVI0wJ9E4j1G3/pTX4lNBlldUOt8aOcGpjUdvcFH1ep/yrQyu1K4PHX2No8mXJ5c0
        MtSM1DzA==;
Received: from 177.41.129.23.dynamic.adsl.gvt.net.br ([177.41.129.23] helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hEIoM-0003R7-Id; Wed, 10 Apr 2019 19:23:06 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1hEIoI-0000yk-R4; Wed, 10 Apr 2019 16:23:02 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Subject: [PATCH v2 05/21] docs: hwmon: emc2103: convert to ReST format
Date:   Wed, 10 Apr 2019 16:22:42 -0300
Message-Id: <5a244cb70924d821a2a3b93dfd5ba3f78fea3ab7.1554923967.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1554923967.git.mchehab+samsung@kernel.org>
References: <cover.1554923967.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Convert emc2103 to ReST format, in order to allow it to
be parsed by Sphinx.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 Documentation/hwmon/emc2103 | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/hwmon/emc2103 b/Documentation/hwmon/emc2103
index a12b2c127140..6a6ca6d1b34e 100644
--- a/Documentation/hwmon/emc2103
+++ b/Documentation/hwmon/emc2103
@@ -2,13 +2,17 @@ Kernel driver emc2103
 ======================
 
 Supported chips:
+
   * SMSC EMC2103
+
     Addresses scanned: I2C 0x2e
+
     Prefix: 'emc2103'
+
     Datasheet: Not public
 
 Authors:
-        Steve Glendinning <steve.glendinning@smsc.com>
+	Steve Glendinning <steve.glendinning@smsc.com>
 
 Description
 -----------
-- 
2.20.1

