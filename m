Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 520D57D57F
	for <lwn-linux-doc@archive.lwn.net>; Fri, 21 Sep 2018 20:13:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391251AbeIVCD0 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 21 Sep 2018 22:03:26 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:41555 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390726AbeIVCD0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 21 Sep 2018 22:03:26 -0400
Received: by mail-pg1-f195.google.com with SMTP id z3-v6so1556169pgv.8;
        Fri, 21 Sep 2018 13:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=JmJnwgzqo/oZAiSurYldFDuuAW8Na+dBrzrglmTsWSU=;
        b=jlkBcZvNAdQuZoBAn9s3b9GT5hiLddVBK0l/CI8nElJ/sachr3QloT/KRivWN9rv3X
         tm0TS6tLrvyQdE23S3tIENQ0tGkuRR70xXPEtpOmkVaxVrQVHIico4IMmKqfLyuDMu61
         1e7dX6nVLge82ijWmEralK5uvErj8eqVe5WYznOyAfPiU2SciMw0bLfLCB3lzki4XFkE
         RCCSGEv9SnEqpUx7dR3dO2Gc6VkUvuJOy+JnomMU42VsrYTz6JIAr0rszlq+LwPvi8/f
         TCfC5SiMDMsZZQ9wqkbiEosu6QvdEIoGHymnVgGcdED1Q5ZhHSYTnQgHCIuAqscffmjm
         zjKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=JmJnwgzqo/oZAiSurYldFDuuAW8Na+dBrzrglmTsWSU=;
        b=ZOdyuPqMCRatjAKmd9vBL5/Da/68lJ7c1ELebHAQDyq6VZQkDU/YiA/bPVseIKk1xs
         8H8Fl2SBJ6z8FZjgZ7nWltCVjtdugGIojyZNnb63ABcyoxYYL6vKMiFCTtp7MfZH57UJ
         glOh3gEPrGN0/zfUnNDK98CUraaNn0hYCI32qOY5T7ZCAveEAkDaWHaaY9We6mXPZHbd
         hlewd8ATO1nzlbS30DkpXUKd8s9Q7TKgk+UAWR0gffKtWIAopF6I6TRPxCgG/CEwYYvn
         70zMvC8UKXFbm0PcfRMAicaBekLrD7mRe6+Ox5f9IthijJHctmLiXPGlhkRQUWdANLQR
         ggLA==
X-Gm-Message-State: APzg51BxyropT4ucKd7LO1gy37o2r2jwDmd9ueSpwWHwiVPibLNXfTCs
        Ru+JH/UBAt1PUsqejvYPThU=
X-Google-Smtp-Source: ANB0VdYhARt/6/XPCmT+Qgd2DI7HjEDOD5EhrtJi12kLnm4G65r+RfmdfPqe5ZkvHaiIwngfqg600w==
X-Received: by 2002:a62:cd3:: with SMTP id 80-v6mr48746846pfm.184.1537560778621;
        Fri, 21 Sep 2018 13:12:58 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id 132-v6sm783231pgh.67.2018.09.21.13.12.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 Sep 2018 13:12:58 -0700 (PDT)
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     jdelvare@suse.com, linux@roeck-us.net, robh+dt@kernel.org,
        mark.rutland@arm.com, corbet@lwn.net
Cc:     afd@ti.com, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: [PATCH v2 0/2] Add an initial DT binding doc for ina3221
Date:   Fri, 21 Sep 2018 13:12:50 -0700
Message-Id: <20180921201252.12875-1-nicoleotsuka@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This series adds a initial DT binding doc for ina3221. It defines
a child node to describe the input source of each ina3221 channel.
Then it changes the driver to handle the information properly.

Changelog
v1->v2:
 * Redefined DT bindings (detail in PATCH-1)
 * Changed the driver code accordingly (detail in PATCH-2)

 .../devicetree/bindings/hwmon/ina3221.txt     |  38 ++++++
 Documentation/hwmon/ina3221                   |   1 +
 drivers/hwmon/ina3221.c                       | 126 ++++++++++++++++--
 3 files changed, 155 insertions(+), 10 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/ina3221.txt

-- 
2.17.1

