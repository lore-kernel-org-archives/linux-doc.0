Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C37F2C77B70
	for <linux-doc@archiver.kernel.org>; Thu,  6 Apr 2023 20:33:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239910AbjDFUdS (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 6 Apr 2023 16:33:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239803AbjDFUcp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 6 Apr 2023 16:32:45 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBFD6BBBD
        for <linux-doc@vger.kernel.org>; Thu,  6 Apr 2023 13:32:04 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id qb20so4217886ejc.6
        for <linux-doc@vger.kernel.org>; Thu, 06 Apr 2023 13:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680813123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y2mVQ5empood++BDorTJ/weXm8Mrumxl4wyeCMmuFPc=;
        b=DRP5f0xCBkopIx7BmxPv6s1+3FId1k68mLGA9qo2Ng8EZstP3Sy+utxgejlyUM/RcI
         EsKNucC0AtqH8zTLd7M+LjOzpl/Mz2ZgGFwbDXqLWo24co2uqs4y08qAPGD0epTPmUDn
         HqbghHxgsKm2QGnpbFyDEjWpRJqlqR2VA0YIYYuVb3ug34fTs78bGdoN6T7iz+xcPavI
         eEZLasfB8HV22tARMLXazLczPKWcfXzyRpJX/RRm/ftFCizli/zRyzL7zdvp+RJZJwWP
         sKPh4Ii4UelEha6smoN1/1l2X1RzB4E9iLl1hxkgjT6138duMap5w2dVkOmyLbZ2FjsU
         opug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680813123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y2mVQ5empood++BDorTJ/weXm8Mrumxl4wyeCMmuFPc=;
        b=jFIqmFCbkWfPzqgKEGuxnjukevQLSWG50cpBnqrEVdSZxtJe84PPHU0omsRDYv5Caw
         nKTYPEa0DwJ0gwCynAki1Ngj/x3UoHoMbtfO6PbVBwulOfvP/G9s4AuR3q25czNPQ/hP
         Jj8UfasAFyboDXxTnA1X5gSC48azYYHkiaONoEgZRZwTW9qnn1tbUAo1fpCuM60mnoqX
         scYsLO6+pqIflIWxrEyL16JlSt5u44lhHfK3JB+NlC3l1c779T6QOfG1+OKp4ux1X+9f
         Ddh6gSzgUR74rmdy0KQRMMwD7H97h7fGwhiFGEeVljOLQVI23H8EmeeTZIttMqnFGQZ/
         bBjw==
X-Gm-Message-State: AAQBX9fod3IJQsv/YiITuD7H5msZn6s3aHJt773TE9Y7e0zqW1WToIoz
        3PGnArQuDSmLodp2ErTWtg7U5A==
X-Google-Smtp-Source: AKy350at4RVASepxc3SPs3+U+hY5w5cRaraJu7UW9VBSvb5rm8OUubA+yjerPfhwRUJ+h3KdjE6snA==
X-Received: by 2002:a17:906:46da:b0:949:8772:8195 with SMTP id k26-20020a17090646da00b0094987728195mr134045ejs.38.1680813123383;
        Thu, 06 Apr 2023 13:32:03 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed])
        by smtp.gmail.com with ESMTPSA id s4-20020a1709067b8400b0092bea699124sm1210330ejo.106.2023.04.06.13.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 13:32:02 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Oded Gabbay <ogabbay@kernel.org>,
        Michael Hennerich <Michael.Hennerich@analog.com>,
        Aleksa Savic <savicaleksa83@gmail.com>,
        Jack Doan <me@jackdoan.com>,
        =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
        Marius Zachmann <mail@mariuszachmann.de>,
        Wilken Gottwalt <wilken.gottwalt@posteo.net>,
        =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
        Jean-Marie Verdun <verdun@hpe.com>,
        Nick Hawkins <nick.hawkins@hpe.com>,
        Xu Yilun <yilun.xu@intel.com>, Tom Rix <trix@redhat.com>,
        Clemens Ladisch <clemens@ladisch.de>,
        Rudolf Marek <r.marek@assembler.cz>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Ibrahim Tilki <Ibrahim.Tilki@analog.com>,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Jonas Malaco <jonas@protocubo.io>,
        Aleksandr Mezin <mezin.alexander@gmail.com>,
        Derek John Clark <derekjohn.clark@gmail.com>,
        =?UTF-8?q?Joaqu=C3=ADn=20Ignacio=20Aramend=C3=ADa?= 
        <samsagax@gmail.com>, Iwona Winiarska <iwona.winiarska@intel.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Michael Walle <michael@walle.cc>,
        Lars Povlsen <lars.povlsen@microchip.com>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Daniel Machon <daniel.machon@microchip.com>,
        UNGLinuxDriver@microchip.com,
        Agathe Porte <agathe.porte@nokia.com>,
        Eric Tremblay <etremblay@distech-controls.com>,
        Robert Marko <robert.marko@sartura.hr>,
        Luka Perkov <luka.perkov@sartura.hr>,
        linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        patches@opensource.cirrus.com, openbmc@lists.ozlabs.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 21/68] hwmon: intel-m10-bmc: constify pointers to hwmon_channel_info
Date:   Thu,  6 Apr 2023 22:30:16 +0200
Message-Id: <20230406203103.3011503-22-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230406203103.3011503-1-krzysztof.kozlowski@linaro.org>
References: <20230406203103.3011503-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Statically allocated array of pointed to hwmon_channel_info can be made
const for safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/hwmon/intel-m10-bmc-hwmon.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/intel-m10-bmc-hwmon.c b/drivers/hwmon/intel-m10-bmc-hwmon.c
index 2f0323c14bab..6512f4bec79a 100644
--- a/drivers/hwmon/intel-m10-bmc-hwmon.c
+++ b/drivers/hwmon/intel-m10-bmc-hwmon.c
@@ -24,7 +24,7 @@ struct m10bmc_sdata {
 
 struct m10bmc_hwmon_board_data {
 	const struct m10bmc_sdata *tables[hwmon_max];
-	const struct hwmon_channel_info **hinfo;
+	const struct hwmon_channel_info * const *hinfo;
 };
 
 struct m10bmc_hwmon {
@@ -67,7 +67,7 @@ static const struct m10bmc_sdata n3000bmc_power_tbl[] = {
 	{ 0x160, 0x0, 0x0, 0x0, 0x0, 1000, "Board Power" },
 };
 
-static const struct hwmon_channel_info *n3000bmc_hinfo[] = {
+static const struct hwmon_channel_info * const n3000bmc_hinfo[] = {
 	HWMON_CHANNEL_INFO(temp,
 			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MAX_HYST |
 			   HWMON_T_CRIT | HWMON_T_CRIT_HYST | HWMON_T_LABEL,
@@ -154,7 +154,7 @@ static const struct m10bmc_hwmon_board_data n3000bmc_hwmon_bdata = {
 	.hinfo = n3000bmc_hinfo,
 };
 
-static const struct hwmon_channel_info *d5005bmc_hinfo[] = {
+static const struct hwmon_channel_info * const d5005bmc_hinfo[] = {
 	HWMON_CHANNEL_INFO(temp,
 			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MAX_HYST |
 			   HWMON_T_CRIT | HWMON_T_CRIT_HYST | HWMON_T_LABEL,
@@ -280,7 +280,7 @@ static const struct m10bmc_sdata n5010bmc_curr_tbl[] = {
 	{ 0x1a0, 0x0, 0x0, 0x0, 0x0, 1, "CVL2 0.8V Current" },
 };
 
-static const struct hwmon_channel_info *n5010bmc_hinfo[] = {
+static const struct hwmon_channel_info * const n5010bmc_hinfo[] = {
 	HWMON_CHANNEL_INFO(temp,
 			   HWMON_T_INPUT | HWMON_T_CRIT | HWMON_T_LABEL,
 			   HWMON_T_INPUT | HWMON_T_CRIT | HWMON_T_LABEL,
@@ -432,7 +432,7 @@ static const struct m10bmc_sdata n6000bmc_power_tbl[] = {
 	{ 0x724, 0x0, 0x0, 0x0, 0x0, 1, "Board Power" },
 };
 
-static const struct hwmon_channel_info *n6000bmc_hinfo[] = {
+static const struct hwmon_channel_info * const n6000bmc_hinfo[] = {
 	HWMON_CHANNEL_INFO(temp,
 			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_CRIT |
 			   HWMON_T_LABEL,
-- 
2.34.1

