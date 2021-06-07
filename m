Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE4C0C47095
	for <linux-doc@archiver.kernel.org>; Mon,  7 Jun 2021 10:35:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C8408611AD
	for <linux-doc@archiver.kernel.org>; Mon,  7 Jun 2021 10:35:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230266AbhFGKhp (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 7 Jun 2021 06:37:45 -0400
Received: from mail-ed1-f43.google.com ([209.85.208.43]:35613 "EHLO
        mail-ed1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230252AbhFGKho (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 7 Jun 2021 06:37:44 -0400
Received: by mail-ed1-f43.google.com with SMTP id ba2so17990214edb.2
        for <linux-doc@vger.kernel.org>; Mon, 07 Jun 2021 03:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vgsncdvLmdHsU/1c1h0SAn08txT9+pvHmgBRKaZGxnU=;
        b=Y5+sYcP12AU9+nSL0rR24Tm+WCMD6ByYuo/k6ES3uomE0fKDJ/gtc+GnLCYf94OkVJ
         Pa/ZWB+1ueMshsQimx8jXXo0KRg+sJUVw06w70HBb8XxnsUIo/d3SR9Paj/RQl4iWHrh
         9v+my4x8gN/HM4sM4tYv43PL5E1eE+V0emvn7dwRmvES4wNzRE/nO7+YAkhfbHPsk456
         8OgFqIMuTToDbniBWzoBh0CfMmPnJ28IBjr+J55l7Pz+Qd8lNeyJQ/R9vHc1zY9fX+Z+
         o5HtIT965jQ5byQEsVpuShiPD3KUiomQeUeQ3OGw+Mk8VgvA3qlWZCb9cIlJetM7yoJP
         +0eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vgsncdvLmdHsU/1c1h0SAn08txT9+pvHmgBRKaZGxnU=;
        b=ZV+3VFpJx7iE/NBaDFmJMAqUMMFuoxMHI/P5eBcXBnAxtgX70a+9YYAFjyw1YBrwPv
         /GT9J+LpFfrmxl80qFd1W9I78L29KmP4/4OYpreVrDVrLrmnBz/4FFQVMU+U+aDvI9yp
         rWoV0Fi0fjAvMhaM/MiRXV1A6UU3DUDQ3ZwvfVHHSz8vWnYvjtSC7tkpjfYrFgAAkFdB
         Jbi9eBfFxC7+r1J5hzl4+4Apd5tVh2ftxTTqkehk4xb/0dICMcT2zkDVxEeeBD2Kjtz1
         XZkWZSZKL8VrndHSVl9+DlpFvQecbM9Uj+5BmJvOSz0bqUUb3BWkPApeFrCEOBD/Gy/B
         4PEw==
X-Gm-Message-State: AOAM530rMi39v1eudjHZk5/yngDfmQ7EK7MOpbKiKylep/tiRdbfLw+f
        UVoT1OCv+Jjtwb1HK3BMomaMFA==
X-Google-Smtp-Source: ABdhPJz+jLvE5NKH5gEqXje/mFle1nM9LSCeJiOfsSqvHNWYSi82AU4IlfFsbyKOw0XIedpyBsljuQ==
X-Received: by 2002:a50:ee18:: with SMTP id g24mr19439130eds.11.1623062078574;
        Mon, 07 Jun 2021 03:34:38 -0700 (PDT)
Received: from localhost.localdomain (dh207-96-76.xnet.hr. [88.207.96.76])
        by smtp.googlemail.com with ESMTPSA id b25sm7521037edv.9.2021.06.07.03.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jun 2021 03:34:38 -0700 (PDT)
From:   Robert Marko <robert.marko@sartura.hr>
To:     robh+dt@kernel.org, jdelvare@suse.com, linux@roeck-us.net,
        corbet@lwn.net, trivial@kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-doc@vger.kernel.org
Cc:     luka.perkov@sartura.hr, jmp@epiphyte.org, pmenzel@molgen.mpg.de,
        buczek@molgen.mpg.de, Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v4 2/3] dt-bindings: trivial-devices: Add Delta DPS920AB
Date:   Mon,  7 Jun 2021 12:34:30 +0200
Message-Id: <20210607103431.2039073-2-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210607103431.2039073-1-robert.marko@sartura.hr>
References: <20210607103431.2039073-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add trivial device entry for Delta DPS920AB PSU.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v2:
* Drop custom bindings file and use trivial-devices

 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index a327130d1faa..1cb6c1fc0903 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -68,6 +68,8 @@ properties:
           - dallas,ds4510
             # Digital Thermometer and Thermostat
           - dallas,ds75
+          # Delta Electronics DPS920AB 920W 54V Power Supply
+          - delta,dps920ab
             # 1/4 Brick DC/DC Regulated Power Module
           - delta,q54sj108a2
             # Devantech SRF02 ultrasonic ranger in I2C mode
-- 
2.31.1

