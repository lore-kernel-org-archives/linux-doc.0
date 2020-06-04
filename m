Return-Path: <SRS0=2xrs=7R=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50CA3C433E0
	for <linux-doc@archiver.kernel.org>; Thu,  4 Jun 2020 07:00:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1EA902072E
	for <linux-doc@archiver.kernel.org>; Thu,  4 Jun 2020 07:00:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WNeCSo/6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727806AbgFDHAH (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 4 Jun 2020 03:00:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727110AbgFDHAE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 4 Jun 2020 03:00:04 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0545C03E96D
        for <linux-doc@vger.kernel.org>; Thu,  4 Jun 2020 00:00:02 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id b5so2849407pfp.9
        for <linux-doc@vger.kernel.org>; Thu, 04 Jun 2020 00:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=ehnvTHrC4FiL82yKM8mB6k6smyhfZQn4QW5Pmpjoujo=;
        b=WNeCSo/6X9jnPJN+T6rzzS/5NWS+b/GuJrQza+Ug291tJqT3pqMSPUgcJNsT7tyGVq
         5axyUMwjNCuEOcXMe48YN9w1FgT5IQHFUGed5OYfeIpXkxi7IqOkuauXJcUVkWoX6YSu
         jxf01kqpxgW0PEOpm1vz3SsmzWE/ywFVLNBEBdgIJwBYQoqBH0pVUMDGVwDNcAuJHvXw
         /2uk5Xlo4tEqO/pgcD6onbxG5eSa6yoggwvBNr1sTV/ui0RNLVsVHofGmIAqWUQx9Izd
         TTt0S+vlo925mKxLXv2VLDyU2saDLBsbCBywYEkd7YAER6DRg0epJAq8PL/KwxGmafsn
         S/7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=ehnvTHrC4FiL82yKM8mB6k6smyhfZQn4QW5Pmpjoujo=;
        b=WAgb/ym7jygod9WrqN5e1VY1sTgJUBogScEJ+D3A0xsXDf5Bg9xB/HhjivN1lZTn6+
         rjpTvA5JxGFI6VBQP2Nb5MF6O+2LS4MiD8RRb2d0I6yhlVCDa1WK4b1png6r+wf8UAq/
         kgyTdxHTIxVioiyUTPBV/o1iTZ6IGiFk4PLVEO7rm89sJdbYEUJhvOOpwUKSAdrmIyaD
         6g8M6gfjHcUfipDzI3E+VDijDJRK1YUB6Bz4TlM1DqU76vUBmIkjsAHHk8ATSaHQ0t5o
         HQStjIHhHzUW3F4sYn2J5wyeNaCJFKD8JittiqOuvLVhcWZiCRMargLFiqjxqyg1Z3h3
         oY6g==
X-Gm-Message-State: AOAM5337+XbXkdnIVlWV4SAAU7/rJKfihv1nQ6YVOJsFzLeq7lHeAPLN
        4+iTXHDxflahpGab4m5e+rNuNw==
X-Google-Smtp-Source: ABdhPJykEG0SED6v8LSCoEE9WQwCMwwXMzcJGMOaYd65TAXcNdkwIlReguS5Z7Rth31A8lHbXUQkcg==
X-Received: by 2002:a05:6a00:843:: with SMTP id q3mr2764044pfk.107.1591254002252;
        Thu, 04 Jun 2020 00:00:02 -0700 (PDT)
Received: from localhost.localdomain ([117.252.66.248])
        by smtp.gmail.com with ESMTPSA id q6sm1703309pff.163.2020.06.03.23.59.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Jun 2020 00:00:01 -0700 (PDT)
From:   Sumit Garg <sumit.garg@linaro.org>
To:     jens.wiklander@linaro.org, corbet@lwn.net
Cc:     maxim.uvarov@linaro.org, jarkko.sakkinen@linux.intel.com,
        tee-dev@lists.linaro.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, op-tee@lists.trustedfirmware.org,
        Sumit Garg <sumit.garg@linaro.org>
Subject: [PATCH v2] Documentation: tee: Document TEE kernel interface
Date:   Thu,  4 Jun 2020 12:29:39 +0530
Message-Id: <1591253979-29067-1-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Update documentation with TEE bus infrastructure which provides an
interface for kernel client drivers to communicate with corresponding
Trusted Application.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---

Changes in v2:
- Add TEE client driver example snippet.

 Documentation/tee.txt | 68 +++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/Documentation/tee.txt b/Documentation/tee.txt
index c8fad81..350dd40 100644
--- a/Documentation/tee.txt
+++ b/Documentation/tee.txt
@@ -53,6 +53,66 @@ clients, forward them to the TEE and send back the results. In the case of
 supplicants the communication goes in the other direction, the TEE sends
 requests to the supplicant which then sends back the result.
 
+The TEE kernel interface
+========================
+
+Kernel provides a TEE bus infrastructure where a Trusted Application is
+represented as a device identified via Universally Unique Identifier (UUID) and
+client drivers register a table of supported device UUIDs.
+
+TEE bus infrastructure registers following APIs:
+-  match(): iterates over the client driver UUID table to find a corresponding
+   match for device UUID. If a match is found, then this particular device is
+   probed via corresponding probe API registered by the client driver. This
+   process happens whenever a device or a client driver is registered with TEE
+   bus.
+-  uevent(): notifies user-space (udev) whenever a new device is registered on
+   TEE bus for auto-loading of modularized client drivers.
+
+TEE bus device enumeration is specific to underlying TEE implementation, so it
+is left open for TEE drivers to provide corresponding implementation.
+
+Then TEE client driver can talk to a matched Trusted Application using APIs
+listed in include/linux/tee_drv.h.
+
+TEE client driver example
+-------------------------
+
+Suppose a TEE client driver needs to communicate with a Trusted Application
+having UUID: ``ac6a4085-0e82-4c33-bf98-8eb8e118b6c2``, so driver registration
+snippet would look like::
+
+	static const struct tee_client_device_id client_id_table[] = {
+		{UUID_INIT(0xac6a4085, 0x0e82, 0x4c33,
+			   0xbf, 0x98, 0x8e, 0xb8, 0xe1, 0x18, 0xb6, 0xc2)},
+		{}
+	};
+
+	MODULE_DEVICE_TABLE(tee, client_id_table);
+
+	static struct tee_client_driver client_driver = {
+		.id_table	= client_id_table,
+		.driver		= {
+			.name		= DRIVER_NAME,
+			.bus		= &tee_bus_type,
+			.probe		= client_probe,
+			.remove		= client_remove,
+		},
+	};
+
+	static int __init client_init(void)
+	{
+		return driver_register(&client_driver.driver);
+	}
+
+	static void __exit client_exit(void)
+	{
+		driver_unregister(&client_driver.driver);
+	}
+
+	module_init(client_init);
+	module_exit(client_exit);
+
 OP-TEE driver
 =============
 
@@ -112,6 +172,14 @@ kernel are handled by the kernel driver. Other RPC messages will be forwarded to
 tee-supplicant without further involvement of the driver, except switching
 shared memory buffer representation.
 
+OP-TEE device enumeration
+-------------------------
+
+OP-TEE provides a pseudo Trusted Application: drivers/tee/optee/device.c in
+order to support device enumeration. In other words, OP-TEE driver invokes this
+application to retrieve a list of Trusted Applications which can be registered
+as devices on the TEE bus.
+
 AMD-TEE driver
 ==============
 
-- 
2.7.4

