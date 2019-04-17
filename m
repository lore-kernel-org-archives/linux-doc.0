Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 589AB7D099
	for <lwn-linux-doc@archive.lwn.net>; Wed, 17 Apr 2019 09:48:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731745AbfDQJsi (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 17 Apr 2019 05:48:38 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:44516 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731644AbfDQJqh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 17 Apr 2019 05:46:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=et9eXCe5ZAfSQ5mBgtr6YkPzKHB/bcQ3N5gbJc1LICw=; b=M9loXKwhDUJ/5g04e+LM81GOD9
        YYxJW+x6ca9seyVxSqxCgC8BSpvs+QbKVfWL+x62WyiDk15zxbAs2W/doSzXbQd7N1syeMQ4mLYbh
        8f5q4vJMStHM9zLz/75Gk6ZXY+Vd/VuIicVeVYlUw8WJwyp4rJjqru8TBmcKiD25TVhfb2hlRP5ZD
        XhbzQTgqFstXKfSmt4WIfotdleKQ6EpIHW6OT8ykdV315u5dwriIcripKsl7KRwkTkRlbp8pPu+EB
        OQr7LsF0vNGzJrsY9NtovVf4aZvDsprsw8IF2dd21ocUmT3WGuoIlCkGoyUabf4wi9U/egU0CZ2CY
        O3Rx2Qcg==;
Received: from 177.132.233.55.dynamic.adsl.gvt.net.br ([177.132.233.55] helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hGh9G-0000a5-JA; Wed, 17 Apr 2019 09:46:34 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1hGh9C-0003uO-St; Wed, 17 Apr 2019 06:46:30 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Subject: [PATCH v3 05/21] docs: hwmon: emc2103: convert to ReST format
Date:   Wed, 17 Apr 2019 06:46:13 -0300
Message-Id: <cc31c66f94243742893b670a7e3363c104551481.1555494108.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1555494108.git.mchehab+samsung@kernel.org>
References: <cover.1555494108.git.mchehab+samsung@kernel.org>
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

