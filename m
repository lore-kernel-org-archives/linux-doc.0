Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id F04247D00B
	for <lwn-linux-doc@archive.lwn.net>; Tue, 28 Aug 2018 13:02:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728145AbeH1QxZ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 28 Aug 2018 12:53:25 -0400
Received: from esa1.microchip.iphmx.com ([68.232.147.91]:37735 "EHLO
        esa1.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728126AbeH1QxY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 28 Aug 2018 12:53:24 -0400
X-IronPort-AV: E=Sophos;i="5.53,299,1531810800"; 
   d="scan'208";a="19626759"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-SHA; 28 Aug 2018 06:01:50 -0700
Received: from m18063-ThinkPad-T460p.mchp-main.com (10.10.76.4) by
 chn-sv-exch04.mchp-main.com (10.10.76.105) with Microsoft SMTP Server id
 14.3.352.0; Tue, 28 Aug 2018 06:01:49 -0700
From:   Claudiu Beznea <claudiu.beznea@microchip.com>
To:     <thierry.reding@gmail.com>, <shc_work@mail.ru>,
        <robh+dt@kernel.org>, <mark.rutland@arm.com>, <corbet@lwn.net>,
        <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>
CC:     <linux-pwm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: [RESEND PATCH v5 3/9] pwm: cros-ec: populate PWM mode in of_xlate function
Date:   Tue, 28 Aug 2018 16:01:20 +0300
Message-ID: <1535461286-12308-4-git-send-email-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1535461286-12308-1-git-send-email-claudiu.beznea@microchip.com>
References: <1535461286-12308-1-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Populate PWM mode in of_xlate function to avoid pwm_apply_state() failure.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 drivers/pwm/pwm-cros-ec.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pwm/pwm-cros-ec.c b/drivers/pwm/pwm-cros-ec.c
index 9c13694eaa24..78d28d60a468 100644
--- a/drivers/pwm/pwm-cros-ec.c
+++ b/drivers/pwm/pwm-cros-ec.c
@@ -147,6 +147,7 @@ cros_ec_pwm_xlate(struct pwm_chip *pc, const struct of_phandle_args *args)
 
 	/* The EC won't let us change the period */
 	pwm->args.period = EC_PWM_MAX_DUTY;
+	pwm->args.mode = pwm_mode_get_valid(pc, pwm);
 
 	return pwm;
 }
-- 
2.7.4

