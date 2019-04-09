Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1F3E37D04D
	for <lwn-linux-doc@archive.lwn.net>; Tue,  9 Apr 2019 18:50:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726787AbfDISuR (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 9 Apr 2019 14:50:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:57440 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726517AbfDISuQ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 9 Apr 2019 14:50:16 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id ACA3D217F9;
        Tue,  9 Apr 2019 18:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1554835815;
        bh=oEU5ytGpRd18sV1X4W+sdoHtg/1YNmvFgiDMeskFDDM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=RzQt7BIVGiPpfHoYsxBTSiE0yh9/7pvOcwK0UqRTLzBUrFm6YI25OrSsXIfQwXdc8
         1gS7fnou26oZNTGOhUpUSH6rr08MYeXMP6AZw1L4rLqc3lfkWSE6iznzuywL4UcgEf
         Xp501dkOirSGQYac5bCPoD4WHiftngqbjnfriHko=
From:   Sasha Levin <sashal@kernel.org>
To:     peterhuewe@gmx.de, jarkko.sakkinen@linux.intel.com, jgg@ziepe.ca
Cc:     mark.rutland@arm.com, corbet@lwn.net, robh+dt@kernel.org,
        arnd@arndb.de, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-integrity@vger.kernel.org, linux-kernel@microsoft.com,
        thiruan@microsoft.com, bryankel@microsoft.com,
        Sasha Levin <sashal@kernel.org>
Subject: [PATCH v2 1/3] ftpm: dt-binding: add dts documentation for fTPM driver
Date:   Tue,  9 Apr 2019 14:49:56 -0400
Message-Id: <20190409184958.7476-2-sashal@kernel.org>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190409184958.7476-1-sashal@kernel.org>
References: <20190409184958.7476-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The parameters are similar to the ones used by IBM's vTPM and the
various I2C tpm drivers.

Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../bindings/security/tpm/tpm_ftpm_tee.txt          | 13 +++++++++++++
 .../devicetree/bindings/vendor-prefixes.txt         |  1 +
 2 files changed, 14 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/security/tpm/tpm_ftpm_tee.txt

diff --git a/Documentation/devicetree/bindings/security/tpm/tpm_ftpm_tee.txt b/Documentation/devicetree/bindings/security/tpm/tpm_ftpm_tee.txt
new file mode 100644
index 000000000000..20fca67a56c4
--- /dev/null
+++ b/Documentation/devicetree/bindings/security/tpm/tpm_ftpm_tee.txt
@@ -0,0 +1,13 @@
+Required properties:
+- compatible: should be "microsoft,ftpm"
+- linux,sml-base: 64-bit base address of the reserved memory allocated
+		  for the firmware event log
+- linux,sml-size: size of the memory allocated for the firmware event log
+
+Example:
+
+tpm@0 {
+	compatible = "microsoft,ftpm";
+	linux,sml-base = <0x0 0xC0000000>;
+	linux,sml-size = <0x10000>;
+};
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 8162b0eb4b50..902798bcb9a5 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -249,6 +249,7 @@ micrel	Micrel Inc.
 microchip	Microchip Technology Inc.
 microcrystal	Micro Crystal AG
 micron	Micron Technology Inc.
+microsoft	Microsoft Corporation
 mikroe		MikroElektronika d.o.o.
 minix	MINIX Technology Ltd.
 miramems	MiraMEMS Sensing Technology Co., Ltd.
-- 
2.19.1

