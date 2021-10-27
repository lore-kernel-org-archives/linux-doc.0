Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F14A9C433EF
	for <linux-doc@archiver.kernel.org>; Wed, 27 Oct 2021 07:42:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DB4B4610A4
	for <linux-doc@archiver.kernel.org>; Wed, 27 Oct 2021 07:42:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240574AbhJ0How (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 27 Oct 2021 03:44:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240582AbhJ0Hov (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 27 Oct 2021 03:44:51 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D479FC0613B9
        for <linux-doc@vger.kernel.org>; Wed, 27 Oct 2021 00:42:26 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id w16so1412157plg.3
        for <linux-doc@vger.kernel.org>; Wed, 27 Oct 2021 00:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nathanrossi.com; s=google;
        h=date:message-id:in-reply-to:references:from:to:cc:subject
         :content-transfer-encoding:mime-version;
        bh=EvWO9/aP2UYkWDRoMSk+UDHZ7nRats7jMQJQZIEXWAU=;
        b=k0uypuoa/tSMIoB+UArjlA7+U5joF88Bjt7a/jjC+VozJJHJorpHFAPYgUAv3TcPb5
         IooaM7AQRTLfNG1fcIu0e+jKw6OYKnqD2klEG0e6Y1J8UI+NZQso5uCGvvRU8KbsenWu
         sWpWZzr69WDdZI5fvIKdRC3bBZ0E2mpKmANl1KUdnqgL64Yv6QZM14xXeJVHhpdiR5Ix
         A92BxQ8OL9PrwpFB2L9HX6x75a1aDw89wSHnH4B4awmYMA58jqXMF8NHXvL3BFfIDd8S
         11hgRoSD//YWuA8GCLsggL0PkUXx92NPm1AstguVi9m8fPjndlhC6XLGETnX+bzlKyGH
         BFyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
         :cc:subject:content-transfer-encoding:mime-version;
        bh=EvWO9/aP2UYkWDRoMSk+UDHZ7nRats7jMQJQZIEXWAU=;
        b=XszIutqT2nfblUkAbvNlNqgOm0fWAiassrlaE1X4sp6molEyUYF6/I/sK3673jatzb
         DWFe3/bgfEb7msPFUkxu2gtTPU0GulbouX91dXkrt2qL+AkTis12tYfxQS9Grjoj3x8t
         VeRyXZYbNJUPS6Fm+cEWahwrGsZBVFps/uFmgG/4gdI1NKLrJ4CeUMOsTg4mL/pLctNI
         tRmJ46jP8TvX+Qd6Li9oFM3zAHgT/q5X+qEnSNxet/t21ZLKh/d5rpD5Cb3c2XMJaw/8
         d8iJmdiLJps34lRgvXF6ZfRpT2PlNL9PZl7qEO8vS3CJbHCIXKZIsSADf6tmuUCStaNy
         yZSw==
X-Gm-Message-State: AOAM533fFYUToLPwLpVwrqU6fCxUBTmVzssKjChVXdCDewgw10ab/XHQ
        J6DzscPo9pMDpUri42mA0e41aA==
X-Google-Smtp-Source: ABdhPJyf8nYG8qW81/yolRdeZUerGGa9z3mseuZofnD2TXanUqJezx9SKGVMO/KNngkgyBfXtZQpCA==
X-Received: by 2002:a17:90a:cc05:: with SMTP id b5mr4099506pju.71.1635320546280;
        Wed, 27 Oct 2021 00:42:26 -0700 (PDT)
Received: from [127.0.1.1] (117-20-69-24.751445.bne.nbn.aussiebb.net. [117.20.69.24])
        by smtp.gmail.com with UTF8SMTPSA id c85sm10272618pfc.146.2021.10.27.00.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Oct 2021 00:42:25 -0700 (PDT)
Date:   Wed, 27 Oct 2021 07:42:12 +0000
Message-Id: <20211027074212.690611-0-nathan@nathanrossi.com>
In-Reply-To: <20211025025805.618566-0-nathan@nathanrossi.com>
References: <20211025025805.618566-0-nathan@nathanrossi.com>
From:   Nathan Rossi <nathan@nathanrossi.com>
To:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Cc:     Nathan Rossi <nathan@nathanrossi.com>,
        Nathan Rossi <nathan.rossi@digi.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v2 0/3] Driver for TI INA238 I2C Power Monitor
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Nathan Rossi <nathan.rossi@digi.com>

Changes in v2:
- Added device tree binding for ti,shunt-gain to specify the target
  ADCRANGE for the ina238
- Reworked ina238 driver to use hwmon_chip_info API, and addressed
  various review comments

Nathan Rossi (3):
  dt-bindings: hwmon: ti,ina2xx: Document ti,ina238 compatible string
  dt-bindings: hwmon: ti,ina2xx: Add ti,shunt-gain property
  hwmon: Driver for Texas Instruments INA238

 .../devicetree/bindings/hwmon/ti,ina2xx.yaml  |   7 +
 Documentation/hwmon/ina238.rst                |  56 ++
 Documentation/hwmon/index.rst                 |   1 +
 drivers/hwmon/Kconfig                         |  12 +
 drivers/hwmon/Makefile                        |   1 +
 drivers/hwmon/ina238.c                        | 672 ++++++++++++++++++
 6 files changed, 749 insertions(+)
 create mode 100644 Documentation/hwmon/ina238.rst
 create mode 100644 drivers/hwmon/ina238.c
---
2.33.0
