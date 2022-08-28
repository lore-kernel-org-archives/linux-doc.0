Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2548FECAAD5
	for <linux-doc@archiver.kernel.org>; Sun, 28 Aug 2022 13:44:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229747AbiH1No4 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 28 Aug 2022 09:44:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229700AbiH1Noz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 28 Aug 2022 09:44:55 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1EA410FC0
        for <linux-doc@vger.kernel.org>; Sun, 28 Aug 2022 06:44:53 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id 2so7306366edx.2
        for <linux-doc@vger.kernel.org>; Sun, 28 Aug 2022 06:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=VbCX9XubVSIS6lTvl0e6wTGkJVjRlu08SVzA0UTpaoM=;
        b=K6rX2ZPfLK1q9Pv1KtrjxsGOT7e3NnEHARkA1R1THBe1jfD1c1DMdN4yuahkSvJXlS
         9Q4hLEmoz/SPzv4gJ6mzzqOk4BpN5JF7ws48IXWhfftTZt5yhDGHNiJlpQc4RfooBAbA
         Nb+sDZtP8el8EtXJSihjSRci4Lz9ryKTyL/q0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=VbCX9XubVSIS6lTvl0e6wTGkJVjRlu08SVzA0UTpaoM=;
        b=gaCKb37AF/yD195AyuE1OFGeCmMayX+O6v+d+uvWFGK2+xCm4G7LTALWO0t7uAjjWH
         Jb6hfu2mtfpXmVhluCGuA/HqtFcVSctyvJ/aOZv3PSCoJdBb8cWqC0v3BiDutj4+a+/N
         D8aMUM0zhORoHu4zm2cMQAeS2LhDJQSQSN8wqAaW4eQQ0W2ebx1ZARxFRDTSLD1bTcdx
         bjqVF5LKsXrAp9ZEZVt2dBMZwyj3x7dp/l0FAUE7vrv5o3GfgAx3R4PZbpfYcnCRGeW1
         LcnKi0cVxS6xybpKYFCH8j/ayvxXo49UieWsCWAqiPw9YhM0S2c0NTCb9tUGCPb9ZvvR
         EN4Q==
X-Gm-Message-State: ACgBeo1pzqR0Q1XZsqclTyLaUHnf5ctSkxGo2Ky7H6lmUJAruseenRd+
        U1bEXi+SHk8ZjUMkH6J+j75olg==
X-Google-Smtp-Source: AA6agR52Epic1B/JYaaxh0T/Atkfb5p7+3G+bqTOCsJYsgT4g4xDmu7wKaTQowXPT1T/0YI0/L6Nww==
X-Received: by 2002:a05:6402:248f:b0:440:9bb3:5936 with SMTP id q15-20020a056402248f00b004409bb35936mr13631145eda.178.1661694292459;
        Sun, 28 Aug 2022 06:44:52 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-79-31-31-9.retail.telecomitalia.it. [79.31.31.9])
        by smtp.gmail.com with ESMTPSA id wj7-20020a170907050700b0073d5948855asm3269766ejb.1.2022.08.28.06.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Aug 2022 06:44:52 -0700 (PDT)
From:   Dario Binacchi <dario.binacchi@amarulasolutions.com>
To:     linux-kernel@vger.kernel.org
Cc:     Dario Binacchi <dario.binacchi@amarulasolutions.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Marc Kleine-Budde <mkl@pengutronix.de>,
        Paolo Abeni <pabeni@redhat.com>, linux-doc@vger.kernel.org,
        netdev@vger.kernel.org
Subject: [PATCH] docs: networking: device drivers: flexcan: fix invalid email
Date:   Sun, 28 Aug 2022 15:44:42 +0200
Message-Id: <20220828134442.794990-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The Amarula contact info email address is wrong, so fix it up to use the
correct one.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 .../networking/device_drivers/can/freescale/flexcan.rst         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/networking/device_drivers/can/freescale/flexcan.rst b/Documentation/networking/device_drivers/can/freescale/flexcan.rst
index 4e3eec6cecd2..106cd2890135 100644
--- a/Documentation/networking/device_drivers/can/freescale/flexcan.rst
+++ b/Documentation/networking/device_drivers/can/freescale/flexcan.rst
@@ -5,7 +5,7 @@ Flexcan CAN Controller driver
 =============================
 
 Authors: Marc Kleine-Budde <mkl@pengutronix.de>,
-Dario Binacchi <dario.binacchi@amarula.solutions.com>
+Dario Binacchi <dario.binacchi@amarulasolutions.com>
 
 On/off RTR frames reception
 ===========================
-- 
2.32.0

