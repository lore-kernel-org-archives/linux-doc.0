Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95950C76196
	for <linux-doc@archiver.kernel.org>; Thu,  6 Apr 2023 20:34:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240117AbjDFUeh (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 6 Apr 2023 16:34:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239643AbjDFUd7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 6 Apr 2023 16:33:59 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E109C172
        for <linux-doc@vger.kernel.org>; Thu,  6 Apr 2023 13:32:32 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id sg7so4215587ejc.9
        for <linux-doc@vger.kernel.org>; Thu, 06 Apr 2023 13:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680813150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i6JbQJiorXC7teiECO3hQBxt4FlCv2MlUvUkFyuxz0k=;
        b=U1ICoYYwYwbOimkM7r9J3JON/FvSAKmAqIWF9gCVuWs3wiDIFQtgPQz/XK8W4diEsB
         eg5lQiZ+HP2WyZaBwXj8GEJlu4Q+QJPlmnOZGF0MguHwBvS2/iMP2yirU9rim7RbHAE3
         /ZDGABwquYh9GoCpLqOUunF/XtxxBCtJIq2RWwO9j1NR3GbtQwNrSW/ehxBTIuyY9Q9j
         lw6F/flDtl6Q4JW1pX0P1zj6gnu5Y8WrlTo9KrZtebRMn/OJr7yTONxCwePVGAypeYjN
         0aFTLsdhT4TcNHCGg3HPEmOHIWIvxb1kOfWf0EKAUE18sxqvCXvLTz7rt4JC0XSVzEKi
         +CgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680813150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i6JbQJiorXC7teiECO3hQBxt4FlCv2MlUvUkFyuxz0k=;
        b=UKnsqkKT0pIPDjp18j7fvHXd9JQJ29467o3uGomQXoYV4m1WjaxvMqpRLzKbS4sqY/
         ALCc4mlw7yv+vkz8JC3thxfGpbG+JOKXh8KMoQzuJoFZ/YNHdealx4/Kz/MkLE985nve
         t6J+OFl0X6P6Mn1e73F/ZfIaEY5ow9fipSqJWNQKQGjeR+cq3IXFPdqeL9/tJFSjhIfu
         BIgmW24JmEjSPSSiFFxR3DRIN4BzHg+xYZzQGn8l1CXDXFr8FiAeGHfTObNor33MUoA4
         vKv3RnX3ALNaSMnwPByzBwGU3ttHi/7K6gxgkhBLrWQDh0pHra4qKdYIpmAIlkEt/sCe
         JO/A==
X-Gm-Message-State: AAQBX9cOoBk09jutM+/PRhFUtqIzV+XOI2ywhJBJkfvCjioyN7zJCQUo
        H0wCrT8oDf+ecsL0GXP/hh3dKQ==
X-Google-Smtp-Source: AKy350bZbUwgdfxxvOH7aNNMLToPrjoY0uU/pjuSpPG3PsJDbgm/81WmB/eULaoFO7UA7TtjwHBtSQ==
X-Received: by 2002:a17:906:cc5d:b0:932:ac6c:7ef9 with SMTP id mm29-20020a170906cc5d00b00932ac6c7ef9mr142631ejb.22.1680813150619;
        Thu, 06 Apr 2023 13:32:30 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed])
        by smtp.gmail.com with ESMTPSA id s4-20020a1709067b8400b0092bea699124sm1210330ejo.106.2023.04.06.13.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 13:32:30 -0700 (PDT)
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
Subject: [PATCH 32/68] hwmon: ltc2992: constify pointers to hwmon_channel_info
Date:   Thu,  6 Apr 2023 22:30:27 +0200
Message-Id: <20230406203103.3011503-33-krzysztof.kozlowski@linaro.org>
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
 drivers/hwmon/ltc2992.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/ltc2992.c b/drivers/hwmon/ltc2992.c
index 69341de397cb..429a7f5837f0 100644
--- a/drivers/hwmon/ltc2992.c
+++ b/drivers/hwmon/ltc2992.c
@@ -812,7 +812,7 @@ static const struct hwmon_ops ltc2992_hwmon_ops = {
 	.write = ltc2992_write,
 };
 
-static const struct hwmon_channel_info *ltc2992_info[] = {
+static const struct hwmon_channel_info * const ltc2992_info[] = {
 	HWMON_CHANNEL_INFO(chip,
 			   HWMON_C_IN_RESET_HISTORY),
 	HWMON_CHANNEL_INFO(in,
-- 
2.34.1

