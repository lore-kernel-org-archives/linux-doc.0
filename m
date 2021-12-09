Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DDB2C433EF
	for <linux-doc@archiver.kernel.org>; Thu,  9 Dec 2021 09:26:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233367AbhLIJ3j (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 9 Dec 2021 04:29:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231706AbhLIJ3j (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 9 Dec 2021 04:29:39 -0500
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02488C061746
        for <linux-doc@vger.kernel.org>; Thu,  9 Dec 2021 01:26:06 -0800 (PST)
Received: by mail-pg1-x534.google.com with SMTP id l64so4549594pgl.9
        for <linux-doc@vger.kernel.org>; Thu, 09 Dec 2021 01:26:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rXmcTC3zLzmTGeq11CVVuFcJb4cN2vyDWbgAzHd1dVs=;
        b=XTquP9+rRPD1MBBJ375AOHsQGPMg9qREVWVyecGZgvJq5iMsqYRtuwYAu0Z9UXnHUI
         ydO9L8IpByVK+WbAyzfWy/ecg2QnKl/xnhvo5QAbkHOyppJyjGLbIV4byzdMrzNV+B9D
         spzllDgvtME6vtkisHa+5/2qbcuqpoSAVOZBALLxNuiwE/IzcbWbmL1WlT0r1kEIMrfe
         OCbNHMOv6BwC1/6IGriuQwnjpJnI90hf4TsDPW1TiFF0YrJyyuNTfrH7d/LKWXMVidXp
         EYU9ABca8ylPZupPm/Fk4kSb+iX7YNiSD/JmhxBZ5B5zdOUdEPLVNHNFUsbsi/Pk1yef
         Skug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rXmcTC3zLzmTGeq11CVVuFcJb4cN2vyDWbgAzHd1dVs=;
        b=BTR26+OEZUY6tJ31iwFeUgCxuGVEtv3Ej67G9MZYvOyA5mPbYNCXcfr44U8tPlWOGa
         2cbML10v7Q1DyQRVyvEzNB9hGgKAhpzTZkPIA8UZWHbOkcsuCYYNJzbhCU51VYFWVPdR
         XZed6vcLSOuQH6Oi6ycuRMlUPczxc1i9jr1p8q1LOacDKKcV3l5vxKz6A3w3rrZ7Ijha
         g7qPQ67zstC0z8hWl+t/odL1/49c1lIWGagqF9pMKZju3FS9+K2bP90qvU5yWcMyfUeP
         +vF1Zqgwa2L46OyH0Kq3+16CHUfRSVGDIsJ2CnmYYEpjaxg4N9jwtsY3F8Bdud8d2zAU
         PYpA==
X-Gm-Message-State: AOAM532YQVomr87UhcxK//OTO9h7od7Um7HWPNIUsb7+kWzt2eGVv0sk
        1sIiltz2oeCwD0BbNUIHmYk=
X-Google-Smtp-Source: ABdhPJzN9N1C4g3imvoQOaaSjN1HAc92axb2hzuGtVOoTq2saNuqR0Y7FXuqLc9NaNX9gMrYEI/6mg==
X-Received: by 2002:a05:6a00:2af:b0:4a2:a6f0:8eec with SMTP id q15-20020a056a0002af00b004a2a6f08eecmr10522313pfs.23.1639041965483;
        Thu, 09 Dec 2021 01:26:05 -0800 (PST)
Received: from localhost.localdomain ([8.31.2.21])
        by smtp.gmail.com with ESMTPSA id n16sm6250218pfv.123.2021.12.09.01.26.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 01:26:05 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     Zhenguo.Zhao1@unisoc.com
Cc:     gregkh@linuxfoundation.org, corbet@lwn.net,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com,
        Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH] docs/driver-api: Replace a comma in the n_gsm.rst with a double colon
Date:   Thu,  9 Dec 2021 17:24:39 +0800
Message-Id: <20211209092439.562433-1-siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Since b9e851cd4a87 ("tty: n_gsm: Add some instructions and code for requester") which
introduced a warning:

linux/Documentation/driver-api/serial/n_gsm.rst:23: WARNING: Definition list ends without a blank line; unexpected unindent.
linux/Documentation/driver-api/serial/n_gsm.rst:100: WARNING: Definition list ends without a blank line; unexpected unindent.
linux/Documentation/driver-api/serial/n_gsm.rst:115: WARNING: Inline emphasis start-string without end-string.
linux/Documentation/driver-api/serial/n_gsm.rst:118: WARNING: Inline emphasis start-string without end-string.
linux/Documentation/driver-api/serial/n_gsm.rst:120: WARNING: Inline emphasis start-string without end-string.
linux/Documentation/driver-api/serial/n_gsm.rst:122: WARNING: Inline emphasis start-string without end-string.
linux/Documentation/driver-api/serial/n_gsm.rst:125: WARNING: Inline emphasis start-string without end-string.
linux/Documentation/driver-api/serial/n_gsm.rst:139: WARNING: Inline emphasis start-string without end-string.

A paragraph consisting of two colons ("::") signifies that the following text block(s) comprise a literal block.
Add soome blank lines.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 Documentation/driver-api/serial/n_gsm.rst | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/driver-api/serial/n_gsm.rst b/Documentation/driver-api/serial/n_gsm.rst
index 8fe723ab9c67..49956509ad73 100644
--- a/Documentation/driver-api/serial/n_gsm.rst
+++ b/Documentation/driver-api/serial/n_gsm.rst
@@ -18,9 +18,12 @@ How to use it
 1.1 initialize the modem in 0710 mux mode (usually AT+CMUX= command) through
     its serial port. Depending on the modem used, you can pass more or less
     parameters to this command.
+
 1.2 switch the serial line to using the n_gsm line discipline by using
     TIOCSETD ioctl.
+
 1.3 configure the mux using GSMIOC_GETCONF / GSMIOC_SETCONF ioctl.
+
 1.4 obtain base gsmtty number for the used serial port.
 
 Major parts of the initialization program :
@@ -95,10 +98,13 @@ Major parts of the initialization program :
 
 2.1 receive string "AT+CMUX= command" through its serial port,initialize
     mux mode config
+
 2.2 switch the serial line to using the n_gsm line discipline by using
     TIOCSETD ioctl.
+
 2.3 configure the mux using GSMIOC_GETCONF / GSMIOC_SETCONF ioctl.
-2.4 obtain base gsmtty number for the used serial port,
+
+2.4 obtain base gsmtty number for the used serial port::
 
   #include <stdio.h>
   #include <stdint.h>
-- 
2.27.0

