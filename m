Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C71447D919
	for <lwn-linux-doc@archive.lwn.net>; Wed, 17 Apr 2019 09:47:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731792AbfDQJrL (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 17 Apr 2019 05:47:11 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:45122 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731716AbfDQJqk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 17 Apr 2019 05:46:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=l7KuQXP8ekBrckKFuXPKEKBVP38Sacyqxjuqo4eD4aI=; b=trGi6bVsdxZwsVloKfaDN5Y4pX
        L+GXO5budAkrmzroxxu7fwHkH3ImYhHazQND17uPYZTKfTexvsPDvBlr1GPc5gNmeJwMkx9S/Talq
        IXCqfZDeQ9qD9z/k5zLR47hhroQ8d1IjKmZuGgm1IzWx5T5aIGuSxm72m0l90hdwzPW5xnfB921rm
        vHSaciMVTOf/OWSKqET/fkjoYm5GBtU6Lt/5R/O9oqSma7zcz/gI3wf/m5oTKucMLbfai5ko9NbL3
        iWU7wcePPH5k3j5mf3nU1/aoHH98/qx3YMUn0JwzDYqU3QJ5PoObkqP+4Q2AICofdpectjCEwVDlP
        uFPWlQxg==;
Received: from 177.132.233.55.dynamic.adsl.gvt.net.br ([177.132.233.55] helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hGh9K-0000aC-5s; Wed, 17 Apr 2019 09:46:38 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1hGh9D-0003uj-0t; Wed, 17 Apr 2019 06:46:31 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>, linux-hwmon@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
Subject: [PATCH v3 10/21] docs: hwmon: aspeed-pwm-tacho: convert to ReST format
Date:   Wed, 17 Apr 2019 06:46:18 -0300
Message-Id: <8461d6c50972d2e5ec90d71e3db18ac2f7edf455.1555494108.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1555494108.git.mchehab+samsung@kernel.org>
References: <cover.1555494108.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Convert aspeed-pwm-tacho to ReST format, in order to allow it to
be parsed by Sphinx.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 Documentation/hwmon/aspeed-pwm-tacho | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/hwmon/aspeed-pwm-tacho b/Documentation/hwmon/aspeed-pwm-tacho
index 7cfb34977460..6dcec845fbc7 100644
--- a/Documentation/hwmon/aspeed-pwm-tacho
+++ b/Documentation/hwmon/aspeed-pwm-tacho
@@ -15,8 +15,10 @@ controller supports up to 16 tachometer inputs.
 
 The driver provides the following sensor accesses in sysfs:
 
+=============== ======= =====================================================
 fanX_input	ro	provide current fan rotation value in RPM as reported
 			by the fan to the device.
 
 pwmX		rw	get or set PWM fan control value. This is an integer
 			value between 0(off) and 255(full speed).
+=============== ======= =====================================================
-- 
2.20.1

