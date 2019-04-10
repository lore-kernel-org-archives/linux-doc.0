Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 627117D912
	for <lwn-linux-doc@archive.lwn.net>; Wed, 10 Apr 2019 11:14:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731504AbfDJLNi (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 10 Apr 2019 07:13:38 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:44520 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731339AbfDJLMR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 10 Apr 2019 07:12:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=8RJrCFvgjEA458tX9IIajM9uGUDGFOBV5NTkReLqJm4=; b=TqRsurOFikrLuBBw0Av8sa/PXj
        SsFUsi6lNlhkkbCvbxGkB4wB9Z3mdD/PCb+F+LiueSK4ZnzvLL4y+QU9N5BzhXxXB2wHvlgmhV/ON
        9DiuElfYZ3rZKCCvrvtmJNmI4o96CWd5ydbP874wtQj560vW3vMv5FHGgckGr8saStICIvQHtmkB7
        CmyzaAl4xH6sPlv2GLsiyymiBWEeLeNI4lPCa6z4fopOwXr77937zy/spPJ0AzYIpXkBnjXTPKBQO
        B2p3e0PM5VRQJZTm9eg8PaKse0lKmRBmuNn9hYut1pGpQ90IsADPJT24RRqEHgrIRY6B8cj7VTCjt
        DHjO27CA==;
Received: from 177.41.129.23.dynamic.adsl.gvt.net.br ([177.41.129.23] helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hEB9L-0006n2-M6; Wed, 10 Apr 2019 11:12:15 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1hEB9J-0007Sx-F3; Wed, 10 Apr 2019 08:12:13 -0300
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
Subject: [PATCH 10/21] docs: hwmon: aspeed-pwm-tacho: convert to ReST format
Date:   Wed, 10 Apr 2019 08:12:00 -0300
Message-Id: <f622a82110bc1a73121425e30c37d8c9c77f6118.1554893882.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1554893881.git.mchehab+samsung@kernel.org>
References: <cover.1554893881.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Convert aspeed-pwm-tacho to ReST format, in order to allow it to
be parsed by Sphinx.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org
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

