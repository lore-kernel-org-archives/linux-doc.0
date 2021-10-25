Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E17DC433EF
	for <linux-doc@archiver.kernel.org>; Mon, 25 Oct 2021 02:58:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E1E636023F
	for <linux-doc@archiver.kernel.org>; Mon, 25 Oct 2021 02:58:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232314AbhJYDAl (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 24 Oct 2021 23:00:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232308AbhJYDAk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 24 Oct 2021 23:00:40 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A383C061767
        for <linux-doc@vger.kernel.org>; Sun, 24 Oct 2021 19:58:19 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id m26so9357203pff.3
        for <linux-doc@vger.kernel.org>; Sun, 24 Oct 2021 19:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nathanrossi.com; s=google;
        h=date:message-id:from:to:cc:subject:content-transfer-encoding
         :mime-version;
        bh=H/kXO5wOonCyGZmApPOrBkhxaaPKvU/ttbJczsp4UII=;
        b=MVQWdEfUaHIiFX9NrP+ZgS3e0PcMCIeiT1N2ayAHUXKezmpo0Z/MlXosil4D9Nr5V4
         P9aNkxbilgpXTnrg31zSJeeZCCDx4lWRuXvOhR0GZu36JcDvGl3WMmtEt8+syTknpya8
         8usRVjAB/cm5l2A2yh5m/AvT4Hb1YOcUkdK8pYaBFd5qFpXaaw6d63XpAjtXGDxUHBG8
         VaD0Rvvg1p+sD/xrCgr/R/DIVdpHW0CincY9BnO3yMcmgad7Y8KVCcAeib7YTRJCvHRf
         kpNKypNSVIDzWAtQ/HU1syVeGFlbDpU3kcHMKMdV8y1Z/vjSktTVGU8PRzp85qmZZu05
         Jj+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:from:to:cc:subject
         :content-transfer-encoding:mime-version;
        bh=H/kXO5wOonCyGZmApPOrBkhxaaPKvU/ttbJczsp4UII=;
        b=79JJi/2IEk6P59V/mLkvRfc3UoBgEDHJ1oroK5TAzGeS7Qc8vzWUQW78Bbo4IlKPnY
         GwLPJjsS5HVFby4ygcZuLXTmYtIA/0N+6r7wOadtGsCrOSVpZUYxdlRJ7INiVWfq0SPy
         5oz6/+tLS97i4SO8Slm0UVrkN9YlHisK5SqgjRTPpBb5sk2Iend0dVxo256LF7uB620y
         hHjjB2Q5X6LL9TpcWZ5L7wer7VawwNjs9s0a9Tvk4mlo2uaRJ5Cqh8tCvIJ6xevQQUhm
         yV3CLw2H0D3swWc5UtX5/alxTkE+p6Mn/uX990eWtbxy8z+fOsjCdDBpvTwkfJ6u84MF
         trcQ==
X-Gm-Message-State: AOAM530u9v868PpqDbD2jhs3dK/0RPMMsqJpU5sElv2sJnO2rvf3nd/v
        egvsPWHIcWsEn+pc/glw09K79Q==
X-Google-Smtp-Source: ABdhPJyhxAAh1BADJWLpfqRq3DeJhm6+jocSmJc62E5uJDhOa/fgXXMqSxtKYD7ft6zaIQjm/PuETw==
X-Received: by 2002:a05:6a00:14cc:b0:44d:ebab:2e16 with SMTP id w12-20020a056a0014cc00b0044debab2e16mr15269662pfu.23.1635130698866;
        Sun, 24 Oct 2021 19:58:18 -0700 (PDT)
Received: from [127.0.1.1] (117-20-69-24.751445.bne.nbn.aussiebb.net. [117.20.69.24])
        by smtp.gmail.com with UTF8SMTPSA id rm14sm19989676pjb.4.2021.10.24.19.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Oct 2021 19:58:18 -0700 (PDT)
Date:   Mon, 25 Oct 2021 02:58:05 +0000
Message-Id: <20211025025805.618566-0-nathan@nathanrossi.com>
From:   Nathan Rossi <nathan@nathanrossi.com>
To:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Cc:     Nathan Rossi <nathan@nathanrossi.com>,
        Nathan Rossi <nathan.rossi@digi.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 0/2] Driver for TI INA238 I2C Power Monitor
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Nathan Rossi <nathan.rossi@digi.com>


Nathan Rossi (2):
  dt-bindings: hwmon: ti,ina2xx: Document ti,ina238 compatible string
  hwmon: Driver for Texas Instruments INA238

 .../devicetree/bindings/hwmon/ti,ina2xx.yaml  |   1 +
 Documentation/hwmon/ina238.rst                |  57 +++
 drivers/hwmon/Kconfig                         |  12 +
 drivers/hwmon/Makefile                        |   1 +
 drivers/hwmon/ina238.c                        | 453 ++++++++++++++++++
 5 files changed, 524 insertions(+)
 create mode 100644 Documentation/hwmon/ina238.rst
 create mode 100644 drivers/hwmon/ina238.c
---
2.33.0
