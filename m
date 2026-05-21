Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3864F37EFF6;
	Thu, 21 May 2026 19:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779390906; cv=none; b=gBwAfzZuptw5kW1Ol06H5GDYmQLbvgZMbJ0Dk1hgJKbL0roFF+sL9O6cgSaH1BY6HOt/W/DitHwhwOB2MomEDsoZRVjHbY7nAO4KKfq1Ml8Kjt3oyHqroBmwhPVPyQYFiLYYBIchTGFqdYnDLbwQBVOIukVGjMkQlGuU/xgp9LM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779390906; c=relaxed/simple;
	bh=Wi2ekfEdq2VlIN2zWWAPgmURTS4dCQbJ2yAB9shBbE4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CWoNqXq1fxGvFQ2r8/y8iGGvBeH7Ti6Q4XRsP8n97RFT7vDadJcvzo3/Ml+9M+aRdqt1zvhlotbU3amIxGY9CrCr350JJnyQwfrZKDbt9G1+Y12FLqXgK2D93IBYevdG9Hi0hFN3bH5yVLlhtRJhmlVQ0F9Pjh6VvAqgAq+q5tI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=JQMSCeGm; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="JQMSCeGm"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=WlZfUQJHJCha00Uyb2Q/Ip5oQKZI6jLstLyrJNQoP2Q=; b=JQMSCeGm3ysq+mpZeWQM+Um9oL
	PoGAkyQmfs4+dtj/0L+OC5O+Z8vJP9KuSErOIRVUjOKJd9cj7YUt8ly4trsJn89Uma72ADmiHft2z
	gQMP1SDNhoeh3Z6O02X2Yz3A+zLLaZH84k5hBuokzlTxdFRj/2BpfMOAKzw1qNDglUW83AResiC8Z
	7Dpvlxl1q/Tqxq2rjMVuOIVyt87MyinUfqduuQnCtCiXSGw3IbOKlMim0nhvIh0OGXcw04ZyoojHA
	G4RnEvbS03YuB+eHTS52XLLtU4E04NpKAg5ydt56UgUOrLfietaoHv4PLQCGvfmD36G9jnjzfc1Vt
	H0/fa//g==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ8rD-00000008sTt-3Bac;
	Thu, 21 May 2026 19:14:59 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	=?UTF-8?q?Stefan=20D=C3=B6singer?= <stefandoesinger@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	linux-arm-kernel@lists.infradead.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org
Subject: [PATCH] ARM: zte: clean up zx297520v3 doc. warnings
Date: Thu, 21 May 2026 12:14:57 -0700
Message-ID: <20260521191458.177046-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix multiple documentation build warnings.
Improve punctuation and formatting of the rendered output.

Documentation/arch/arm/zte/zx297520v3.rst:66: WARNING: Title underline too short.
 3. Building for built-in U-Boot
 --------------------------- [docutils]
Documentation/arch/arm/zte/zx297520v3.rst:90: WARNING: Enumerated list ends without a blank line; unexpected unindent. [docutils]
Documentation/arch/arm/zte/zx297520v3.rst:116: WARNING: Inline literal start-string without end-string. [docutils]
Documentation/arch/arm/zte/zx297520v3.rst:137: ERROR: Unexpected indentation. [docutils]
Documentation/arch/arm/zte/zx297520v3.rst:138: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
Documentation/arch/arm/zte/zx297520v3.rst:164: WARNING: Inline literal start-string without end-string. [docutils]
Documentation/arch/arm/zte/zx297520v3.rst:164: WARNING: Inline interpreted text or phrase reference start-string without end-string. [docutils]
Documentation/arch/arm/zte/zx297520v3.rst:7: WARNING: Document or section may not begin with a transition. [docutils]

Fixes: 220ae5d36dba ("ARM: zte: Add zx297520v3 platform support")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Stefan Dösinger <stefandoesinger@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org

 Documentation/arch/arm/zte/zx297520v3.rst |  119 +++++++++-----------
 1 file changed, 59 insertions(+), 60 deletions(-)

--- linux-next.orig/Documentation/arch/arm/zte/zx297520v3.rst
+++ linux-next/Documentation/arch/arm/zte/zx297520v3.rst
@@ -4,15 +4,13 @@
 Booting Linux on ZTE zx297520v3 SoCs
 ====================================
 
-...............................................................................
-
 Author:	Stefan Dösinger
 
 Date  : 27 Jan 2026
 
 1. Hardware description
 ---------------------------
-Zx297520v3 SoCs use a 64 bit capable Cortex-A53 CPU and GICv3, although they
+Zx297520v3 SoCs use a 64-bit capable Cortex-A53 CPU and GICv3, although they
 run in arm32 mode only. The CPU has support EL3, but no hypervisor (EL2) and
 it seems to lack VFP and NEON.
 
@@ -27,7 +25,7 @@ Some devices, especially the stationary
 Ethernet switch.
 
 Usually the devices have LEDs for status indication, although some have SPI or
-I2C connected displays
+I2C connected displays.
 
 Some have an SD card slot. If it exists, it is a better choice for the root
 file system because it easily outperforms the built-in NAND.
@@ -39,7 +37,7 @@ IRQs on either ends.
 
 There is also a Cortex M0 CPU, which is responsible for early HW initialization
 and starting the Cortex A53 CPU. It does not have any essential purpose once
-U-Boot is started. A SRAM-Based handover protocol exists to run custom code on
+U-Boot is started. An SRAM-based handover protocol exists to run custom code on
 this CPU.
 
 2. Booting via USB
@@ -63,13 +61,13 @@ Contains an U-Boot version that can be u
 CPU and interrupt controller to comply with Linux's booting requirements.
 
 3. Building for built-in U-Boot
----------------------------
+-------------------------------
 The devices come with an ancient U-Boot that loads legacy uImages from NAND and
 boots them without a chance for the user to interrupt. The images are stored in
 files ap_cpuap.bin and ap_recovery.bin on a jffs2 partition named imagefs,
 usually mtd4. A file named "fotaflag" switches between the two modes.
 
-In addition to the uImage header, those files have a 384 byte signature header,
+In addition to the uImage header, those files have a 384-byte signature header,
 which is used for authenticating the images on some devices. Most devices have
 this authentication disabled and it is enough to pad the uImage files with 384
 zero bytes.
@@ -88,7 +86,7 @@ So to build an image that boots from NAN
 6) dd if=/dev/zero bs=1 count=384 of=ap_recovery.bin
 7) cat uimg >> ap_recovery.bin
 8) Place this file onto imagefs on the device. Delete ap_cpuap.bin if the
-free space is not enough.
+   free space is not enough.
 9) Create the file fotaflag: echo -n FOTA-RECOVERY > fotaflag
 
 For development, booting ap_recovery.bin is recommended because the normal boot
@@ -113,55 +111,56 @@ the binary blobs.
 
 The assembly code below is given as an example of how to achieve this:
 
-```
-#include <linux/irqchip/arm-gic-v3.h>
-#include <asm/assembler.h>
-#include <asm/cp15.h>
-
-@ Detect sane bootloaders and skip the hack
-ldr	r3, =0xf2000000
-ldr	r3, [r3]
-ldr	r4, =(GICD_CTLR_ARE_NS | GICD_CTLR_DS)
-cmp	r3, r4
-beq	skip_zx_hack
-@ This allows EL1 to handle ints hat are normally handled by EL2/3.
-ldr	r3, =0xf2000000
-str     r4, [r3]
-
-cps     #MON_MODE
-
-@ Work in non-secure physical address space: SCR_EL3.NS = 1. At least the UART
-@ seems to respond only to non-secure addresses. I have taken insipiration from
-@ Raspberry pi's armstub7.S here.
-mov	r3, #0x131			@ non-secure, Make F, A bits in CPSR writeable
-					@ Allow hypervisor call.
-mcr     p15, 0, r3, c1, c1, 0
-
-@ AP_PPI_MODE_REG: Configure timer PPIs (10, 11, 13, 14) to active-low.
-ldr	r3, =0xF22020a8
-ldr	r4, =0x50
-str	r4, [r3]
-ldr	r3, =0xF22020ac
-ldr	r4, =0x14
-str	r4, [r3]
-
-@ Enable EL2 access to ICC_SRE (bit 3, ICC_SRE_EL3.Enable). Enable system reg
-@ access to GICv3 registers (bit 0, ICC_SRE_EL3.SRE) for EL1 and EL3.
-mrc	p15, 6, r3, c12, c12, 5         @ ICC_SRE_EL3
-orr	r3, #0x9                        @ FIXME: No defines for SRE_EL3 values?
-mcr	p15, 6, r3, c12, c12, 5
-mrc	p15, 0, r3, c12, c12, 5         @ ICC_SRE_EL1
-orr	r3, #(ICC_SRE_EL1_SRE)
-mcr	p15, 0, r3, c12, c12, 5
-
-@ Like ICC_SRE_EL3, enable EL1 access to ICC_SRE and system register access
-@ for EL2.
-mrc	p15, 4, r3, c12, c9, 5          @ ICC_SRE_EL2 aka ICC_HSRE
-orr	r3, r3, #(ICC_SRE_EL2_ENABLE | ICC_SRE_EL2_SRE)
-mcr	p15, 4, r3, c12, c9, 5
-isb
-
-@ Back to SVC mode
-cps	#SVC_MODE
-skip_zx_hack:
-```
+::
+
+ #include <linux/irqchip/arm-gic-v3.h>
+ #include <asm/assembler.h>
+ #include <asm/cp15.h>
+
+ @ Detect sane bootloaders and skip the hack
+ ldr	r3, =0xf2000000
+ ldr	r3, [r3]
+ ldr	r4, =(GICD_CTLR_ARE_NS | GICD_CTLR_DS)
+ cmp	r3, r4
+ beq	skip_zx_hack
+ @ This allows EL1 to handle ints hat are normally handled by EL2/3.
+ ldr	r3, =0xf2000000
+ str     r4, [r3]
+
+ cps     #MON_MODE
+
+ @ Work in non-secure physical address space: SCR_EL3.NS = 1. At least the UART
+ @ seems to respond only to non-secure addresses. I have taken insipiration from
+ @ Raspberry pi's armstub7.S here.
+ mov	r3, #0x131			@ non-secure, Make F, A bits in CPSR writeable
+ @ Allow hypervisor call.
+ mcr     p15, 0, r3, c1, c1, 0
+
+ @ AP_PPI_MODE_REG: Configure timer PPIs (10, 11, 13, 14) to active-low.
+ ldr	r3, =0xF22020a8
+ ldr	r4, =0x50
+ str	r4, [r3]
+ ldr	r3, =0xF22020ac
+ ldr	r4, =0x14
+ str	r4, [r3]
+
+ @ Enable EL2 access to ICC_SRE (bit 3, ICC_SRE_EL3.Enable). Enable system reg
+ @ access to GICv3 registers (bit 0, ICC_SRE_EL3.SRE) for EL1 and EL3.
+ mrc	p15, 6, r3, c12, c12, 5         @ ICC_SRE_EL3
+ orr	r3, #0x9                        @ FIXME: No defines for SRE_EL3 values?
+ mcr	p15, 6, r3, c12, c12, 5
+ mrc	p15, 0, r3, c12, c12, 5         @ ICC_SRE_EL1
+ orr	r3, #(ICC_SRE_EL1_SRE)
+ mcr	p15, 0, r3, c12, c12, 5
+
+ @ Like ICC_SRE_EL3, enable EL1 access to ICC_SRE and system register access
+ @ for EL2.
+ mrc	p15, 4, r3, c12, c9, 5          @ ICC_SRE_EL2 aka ICC_HSRE
+ orr	r3, r3, #(ICC_SRE_EL2_ENABLE | ICC_SRE_EL2_SRE)
+ mcr	p15, 4, r3, c12, c9, 5
+ isb
+
+ @ Back to SVC mode
+ cps	#SVC_MODE
+ skip_zx_hack:
+
