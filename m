Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE1AAC47099
	for <linux-doc@archiver.kernel.org>; Fri,  4 Jun 2021 15:37:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C833261406
	for <linux-doc@archiver.kernel.org>; Fri,  4 Jun 2021 15:37:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229809AbhFDPjX (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 4 Jun 2021 11:39:23 -0400
Received: from mail-ej1-f45.google.com ([209.85.218.45]:37848 "EHLO
        mail-ej1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230108AbhFDPjX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 4 Jun 2021 11:39:23 -0400
Received: by mail-ej1-f45.google.com with SMTP id ce15so15160671ejb.4
        for <linux-doc@vger.kernel.org>; Fri, 04 Jun 2021 08:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vgsncdvLmdHsU/1c1h0SAn08txT9+pvHmgBRKaZGxnU=;
        b=WxFvvZ7ytpu8pbbafBQ3vDj5PCFFeuHUAbbuMy++NR52CT2AZDkMax9W5ei9Rsovta
         NIC7XdfLDCqP4wxj5HeM3CtxzlPc3sBPG8ZeIndDS0Etvi6vqaf7W5/j7OMCTMEFmNqV
         4XjugU7I0yc4UVAdg5iJ4FWKL30/x4GwN7+PVb70pMPR/tkODslVprpBr8Q7ceHrXGiu
         +ZmueAkrRbBNiiMrlL7gJSsVrMjHwHo05Y9iXxJh1OHhRDHdCQIbzbB6WhKzhLz+39Jr
         QG+q3zPWLxjvY+LftG618RXcyMFydQFfPyHh9PkOMYugun0mvVTzLH2c2vRjWdqYh1xB
         pYgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vgsncdvLmdHsU/1c1h0SAn08txT9+pvHmgBRKaZGxnU=;
        b=lA9PTPteuYOAg3w9Da5IbFy9aqZZnhZ2j0rlDDy9KpkRv9cFHw19RsQT7vdlHeP9r3
         QFJPJiyvTxu//70Jj8vRrFoT7KTxSjkTXg4p3wa5qb6JYAgezKHeNAAaEDK/aqscOegd
         SGi9q6qnC6do9NZj+yhgCkVxzz1IC2DyIUtiTNhgEoHWBXzH+e/+M49FcedTpHI0IRod
         TQ9bfqAeGFdMIAK9JYiEPZxi30Onv57EKX6ZCwGehDjo39dsOl4HgQxbsGwNLD+Boyge
         JqtV9eDX63Dy01mHBmi4J12t4bOVAzSy5xrxSH/skcvSZxi7AFUVDclrHyk9HB61gIvq
         ruNg==
X-Gm-Message-State: AOAM532rcNrCKVKdWjbZ4JPn6aaMMVawNGCqrr65V1Fz7AZJFpjgO2VA
        yVIx44dxHoY+ZBAxBOHKZ7h0LA==
X-Google-Smtp-Source: ABdhPJy6yowrPH6iOmmolwxffXLnUaq1Su9DUF6BRwcefj17ww5Q/sb+ufd4qxCN/Myl9zkHQFi/Yg==
X-Received: by 2002:a17:906:b2d6:: with SMTP id cf22mr4786557ejb.29.1622820980221;
        Fri, 04 Jun 2021 08:36:20 -0700 (PDT)
Received: from localhost.localdomain (dh207-96-250.xnet.hr. [88.207.96.250])
        by smtp.googlemail.com with ESMTPSA id d25sm2909038ejd.59.2021.06.04.08.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 08:36:19 -0700 (PDT)
From:   Robert Marko <robert.marko@sartura.hr>
To:     robh+dt@kernel.org, jdelvare@suse.com, linux@roeck-us.net,
        corbet@lwn.net, trivial@kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-doc@vger.kernel.org
Cc:     luka.perkov@sartura.hr, jmp@epiphyte.org, pmenzel@molgen.mpg.de,
        buczek@molgen.mpg.de, Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v3 2/3] dt-bindings: trivial-devices: Add Delta DPS920AB
Date:   Fri,  4 Jun 2021 17:36:11 +0200
Message-Id: <20210604153612.2903839-2-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210604153612.2903839-1-robert.marko@sartura.hr>
References: <20210604153612.2903839-1-robert.marko@sartura.hr>
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

