Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9919CC47082
	for <linux-doc@archiver.kernel.org>; Mon,  7 Jun 2021 10:34:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 878A4611BD
	for <linux-doc@archiver.kernel.org>; Mon,  7 Jun 2021 10:34:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230481AbhFGKgr (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 7 Jun 2021 06:36:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230396AbhFGKgr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 7 Jun 2021 06:36:47 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72E5CC061766
        for <linux-doc@vger.kernel.org>; Mon,  7 Jun 2021 03:34:42 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id g18so17714433edq.8
        for <linux-doc@vger.kernel.org>; Mon, 07 Jun 2021 03:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=18khHUA2AJ3ib5wXxPFFaQIfHWGb1QOUw5+Na90fAf4=;
        b=n4oXtQgnDbe6I7n8UhQvti9n25PNkA+8CaB7/gRPiiU3ZyE93Zst5Lo98mfSLLITrQ
         m+Sm2IiZ4+HBfyRQSFd1677F5fwG2ouPOfavvFFcQYOR13rX4RsL8Yz3vUBFDQQeXYMd
         MD2zqP/28PRP+IfgT3IOgucxndZGyt6c/LIqEFq1zO1ZL9a6S8VLzo54oQFvctiQzp3s
         sJqxCQppIhK2QaWgg6L06Mtp85vchsoV6xYDCcwx68AjI1iyw5irnFTWFujkoZTqDFcL
         0PUk1z/BnIGy7xjf+qyFpNm9ROOAI2pXvK8nl5IVyA9Sx2ZmDaYoeRb9ZHdAuT/NVCX/
         T72A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=18khHUA2AJ3ib5wXxPFFaQIfHWGb1QOUw5+Na90fAf4=;
        b=QjUaJEHnzTsDx8OU7vxPGbw05QpXPo9HMiTBgbVnbX6zMi7PqR2ZKFR5oOjQ3379vK
         fY7ba1YvkOxA9NcQisSH7chSF3XbEAem1fIY/v5PyLuUOlxsibX6bb99NklQ1oBNvo15
         OdHiYUHZyY60Xir3st5+nzG6VWiszodnz8a3biqsb1rl4BUNH2V6GgHCh90w6HPpVj9Z
         uFioI0b5w8qcBZTJjr458INMsyG0g6PCgREA/Fu9bViJYWC4GiZcLeaf3AiA+tS8nwnp
         P4W+ZUvKFvojghemOqP7PeXIzouwNRXlIvUoOMlt7mrI7icc0hlGHTxZcN5gc7a0nc2Q
         CKwQ==
X-Gm-Message-State: AOAM532TRtUz/dmFZvEhsp0PWZL5v8Gd3twKjt7MAOverxOBEY7e8IaC
        hcXBMznp45YpnoVyzsRXD3q/NO+fRCb+Wg==
X-Google-Smtp-Source: ABdhPJyBBEVMU+l3zZzaxsGHeW4GrlFSXJO8KYLsFCW+34uBpPVt4npJyi0x8cFnKWTER2OPtMwc+Q==
X-Received: by 2002:a05:6402:548:: with SMTP id i8mr19605259edx.344.1623062080229;
        Mon, 07 Jun 2021 03:34:40 -0700 (PDT)
Received: from localhost.localdomain (dh207-96-76.xnet.hr. [88.207.96.76])
        by smtp.googlemail.com with ESMTPSA id b25sm7521037edv.9.2021.06.07.03.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jun 2021 03:34:39 -0700 (PDT)
From:   Robert Marko <robert.marko@sartura.hr>
To:     robh+dt@kernel.org, jdelvare@suse.com, linux@roeck-us.net,
        corbet@lwn.net, trivial@kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-doc@vger.kernel.org
Cc:     luka.perkov@sartura.hr, jmp@epiphyte.org, pmenzel@molgen.mpg.de,
        buczek@molgen.mpg.de, Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v4 3/3] MAINTAINERS: Add Delta DPS920AB PSU driver
Date:   Mon,  7 Jun 2021 12:34:31 +0200
Message-Id: <20210607103431.2039073-3-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210607103431.2039073-1-robert.marko@sartura.hr>
References: <20210607103431.2039073-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add maintainers entry for the Delta DPS920AB PSU driver.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v2:
* Drop YAML bindings

 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 82d9c2943c34..0707986e9bb1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5105,6 +5105,13 @@ F:	Documentation/devicetree/bindings/reset/delta,tn48m-reset.yaml
 F:	drivers/gpio/gpio-tn48m.c
 F:	include/dt-bindings/reset/delta,tn48m-reset.h
 
+DELTA DPS920AB PSU DRIVER
+M:	Robert Marko <robert.marko@sartura.hr>
+L:	linux-hwmon@vger.kernel.org
+S:	Maintained
+F:	Documentation/hwmon/dps920ab.rst
+F:	drivers/hwmon/pmbus/dps920ab.c
+
 DENALI NAND DRIVER
 L:	linux-mtd@lists.infradead.org
 S:	Orphan
-- 
2.31.1

