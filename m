Received: from mail-dl1-f65.google.com (mail-dl1-f65.google.com [74.125.82.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C751E366553
	for <linux-doc@vger.kernel.org>; Sun,  3 May 2026 03:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777780728; cv=none; b=dqn3OQi4vy666Ki4CoST9HuefA1X9YWe1OieloQdba8RWl5Vitvf9XYjEE/PLlHdbnWPYXFCeYrlozVBb3aX4d7WKh9X6L/1g+UIuu8+CfkS2zLpT98AT8TeQh46KDLJ8Yw5mUpbwGGp44FLtFHIXh9JCBokkUWpqfgFehNgJGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777780728; c=relaxed/simple;
	bh=rjk6r+y8e+7mN1XlYul+v4hsjouUv1i3EhlTRI4VCYQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lUb/kvmefWVdUDLxtrC2UOKtZnTjCtojxgbWAQ0wHrKJNwyGK6g5pBvQFRM9GVmZR2aZaIv118lxORaRGBcRV18GdrYKwMt/VckWiMJNj0K4DORgXF/CcNt4gxAXxvkO9cl11SaA5DGirR/cD06jTXqpEvFmIfiaEgVVU3w7Cjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aJyp2TH0; arc=none smtp.client-ip=74.125.82.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aJyp2TH0"
Received: by mail-dl1-f65.google.com with SMTP id a92af1059eb24-12713e56abdso2114073c88.1
        for <linux-doc@vger.kernel.org>; Sat, 02 May 2026 20:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777780725; x=1778385525; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=80MeOMr4JwVlNk5M0E1IFTcnPqGxKPua5i/WvX6su/4=;
        b=aJyp2TH0q12w4hTow/+FkOlPnaw2omZsEhQ7o73yfqwgVyiJJ0PURBA2Y1WzPWpJAG
         zftI6LspyP8mqVmHErEchlad9h4ZGCXfOcacgdpYc+vw+gCVn5CNDuwgW5n8mErbZeaH
         VfXzZ4tdD2quo1Vob5IisO+Q/6UngVU8ErvjkTTto/xlq8r9eZOZM9eTmS+v3XWNTwfF
         7KautUvHud4P9eSz8N74hNnYWE0ZE6BGFrOXnWaXqCEEnu1cCOEPsikBjLEGKl8f1ZZ/
         visB6l+U/OzmW8Fp/g1AWuw/cecX5H6it1Ba7EhL12e310L/Sj045jVGCZfaBVqclMIp
         gQGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777780725; x=1778385525;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=80MeOMr4JwVlNk5M0E1IFTcnPqGxKPua5i/WvX6su/4=;
        b=NyPXfGrp6gjbmLohHDtAq/Dmr6chL+nS8BAx1CsmWsdUSkkMdDTwcOKIlyb0F6ZAUP
         Xbrl2rQhzy211tyQzMpJKearknI3JLHEpsRayLlvJ2VzLl6GfWN5Mz2QrlbNokGVrhDE
         6WWdUbE9XhYvOhdWguHPwpMXZfPjZv9N6cXyrzeRvpsmq5IPsbTXxcHDsT32TBp5qeW7
         yAzv6oW2ejxt6t/YhCXtltooNu5wC6EoLwwajOcTx8DbKr6AkthDvxX7MGWXsKqy1syN
         IeCKj90cR4KdDdU67BgcIFVqdyu9Xxizmhn39Gw83pyZDBoGx5roGdNrc3ZSyScE64uu
         ejCw==
X-Forwarded-Encrypted: i=1; AFNElJ9cvHNeEhVv9+9dTFCVQGnYew6+LyGdx0AlFoq19k4Dm4hMB9T7L1FMND8C5x9eMVsDdAHp3KuGTz0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw58K/U2dN346BQ2E836R6XuDYVzvliQMKLE1hELv34zkK6V/DE
	qNjFdUvrHRJ3mF2ALwIBwAenU2sRqVQ/Ny+MjIMykNsNlOUpWreaTsZv
X-Gm-Gg: AeBDiev8KKl1VlGWl2Y3+Pt30FhEiqgZ5obDs0x4Q5yYJyIXYWnqnrx3cnEfTIE1kqF
	YN+B8yDHw9GUtAJJxtJPPrBxqCvKWuIwyruhXrgU7ySKFb5xvxZFzJfwIG/jEWOslVQff+MtIkD
	fTpHbPLY+0zFDf/wxP+lgLDZzWshJvl8arXhARAueL3YMAdWPIC4Pkt5sqn6VobmZZSXpRciK5U
	nl5VO768SRRPLlZIFt/i9rUePtMvEuYtWVKAr6uy4O7+bgflqIAi/Smmt8kT5VZVk3f5j7TEFos
	FCVQo6LZHB4jkEMFMAw3+v2PHENSHrsH9fUOT2OcQeAORaXOZIWC/CbbGfPEs9qoLH4ME3aBiYA
	zwx6uOQ6JD3ttvPT4qB9gAQlwFN/JsX6LwXq/qGz5gbxjo5emFB2GwDKKGL/zJEogNMgWn6RSmI
	5S9GgB7Q8gsxXIHfBTMoDmsz4WJCn87IH3ek1VD2GyYyTt5+Egt7XqhgPXvDaBV64cCZv26f/Q1
	5Fqa3J9PVKDKISqypl8rGAqLHydeavrlMvkaDt7BnJrk+jOV6kFpcXBSe9jm/HGieC9GwPbvQFD
	VUxfoldpaRa+UI24AAMTPGqCQUgI
X-Received: by 2002:a05:7022:984:b0:12d:c3d8:1f95 with SMTP id a92af1059eb24-12dec5ff394mr5165318c88.4.1777780724535;
        Sat, 02 May 2026 20:58:44 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12df8424ef1sm13212564c88.9.2026.05.02.20.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 20:58:44 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Max Nikulin <manikulin@gmail.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>
Subject: [PATCH] char: applicom: remove low-quality, unused driver
Date: Sat,  2 May 2026 20:58:16 -0700
Message-ID: <20260503035824.24078-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The applicom driver supports PCI Profibus cards from Applicom, later
acquired by Molex. It has severe coding style issues and has attracted
a number of bug and security fixes over the years, despite the fact
that no one appears to be using it. It was broken from at least the
beginning of Git history (Linux 2.6.12-rc2 in April 2005) until October
2008, when a fatal bug was fixed in commit bc20589bf1c6 ("applicom.c:
fix apparently-broken code in do_ac_read()"). In the commit message,
the author commented that no one they knew was able to test the change.
Since then, there have been no commits that indicate the driver is
being used. Later PCI and PCI-Express Applicom Profibus cards only
officially support Windows [1], and even the PCI-Express cards have
been discontinued [2]. Given all these factors, remove the driver to
reduce future maintenance workload.

[1] https://www.sarcitalia.it/file_upload/prodotti//PCIE1500S7_PFB_987651-3769_0876250001505823933.pdf
[2] https://us.rs-online.com/product/molex-woodhead-brad/112011-5026/70631928/

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 Documentation/admin-guide/devices.txt |   1 -
 drivers/char/Kconfig                  |  15 -
 drivers/char/Makefile                 |   1 -
 drivers/char/applicom.c               | 857 --------------------------
 drivers/char/applicom.h               |  86 ---
 5 files changed, 960 deletions(-)
 delete mode 100644 drivers/char/applicom.c
 delete mode 100644 drivers/char/applicom.h

diff --git a/Documentation/admin-guide/devices.txt b/Documentation/admin-guide/devices.txt
index 440633642fea..f544399675fa 100644
--- a/Documentation/admin-guide/devices.txt
+++ b/Documentation/admin-guide/devices.txt
@@ -291,7 +291,6 @@
 		154 = /dev/pmu		Macintosh PowerBook power manager
 		155 =
 		156 = /dev/lcd		Front panel LCD display
-		157 = /dev/ac		Applicom Intl Profibus card
 		158 = /dev/nwbutton	Netwinder external button
 		159 = /dev/nwdebug	Netwinder debug interface
 		160 = /dev/nwflash	Netwinder flash memory
diff --git a/drivers/char/Kconfig b/drivers/char/Kconfig
index 2a3a37b2cf3c..a0e58be77aa0 100644
--- a/drivers/char/Kconfig
+++ b/drivers/char/Kconfig
@@ -220,21 +220,6 @@ config XILINX_HWICAP
 
 	  If unsure, say N.
 
-config APPLICOM
-	tristate "Applicom intelligent fieldbus card support"
-	depends on PCI
-	help
-	  This driver provides the kernel-side support for the intelligent
-	  fieldbus cards made by Applicom International. More information
-	  about these cards can be found on the WWW at the address
-	  <https://www.applicom-int.com/>, or by email from David Woodhouse
-	  <dwmw2@infradead.org>.
-
-	  To compile this driver as a module, choose M here: the
-	  module will be called applicom.
-
-	  If unsure, say N.
-
 config SONYPI
 	tristate "Sony Vaio Programmable I/O Control Device support"
 	depends on X86_32 && PCI && INPUT && HAS_IOPORT
diff --git a/drivers/char/Makefile b/drivers/char/Makefile
index 47bdc882797a..fb6aa6a5d2c7 100644
--- a/drivers/char/Makefile
+++ b/drivers/char/Makefile
@@ -17,7 +17,6 @@ obj-$(CONFIG_PRINTER)		+= lp.o
 obj-$(CONFIG_APM_EMULATION)	+= apm-emulation.o
 
 obj-$(CONFIG_DTLK)		+= dtlk.o
-obj-$(CONFIG_APPLICOM)		+= applicom.o
 obj-$(CONFIG_SONYPI)		+= sonypi.o
 obj-$(CONFIG_HPET)		+= hpet.o
 obj-$(CONFIG_XILINX_HWICAP)	+= xilinx_hwicap/
diff --git a/drivers/char/applicom.c b/drivers/char/applicom.c
deleted file mode 100644
index c138c468f3a4..000000000000
--- a/drivers/char/applicom.c
+++ /dev/null
@@ -1,857 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/* Derived from Applicom driver ac.c for SCO Unix                            */
-/* Ported by David Woodhouse, Axiom (Cambridge) Ltd.                         */
-/* dwmw2@infradead.org 30/8/98                                               */
-/* $Id: ac.c,v 1.30 2000/03/22 16:03:57 dwmw2 Exp $			     */
-/* This module is for Linux 2.1 and 2.2 series kernels.                      */
-/*****************************************************************************/
-/* J PAGET 18/02/94 passage V2.4.2 ioctl avec code 2 reset to les interrupt  */
-/* ceci pour reseter correctement apres une sortie sauvage                   */
-/* J PAGET 02/05/94 passage V2.4.3 dans le traitement de d'interruption,     */
-/* LoopCount n'etait pas initialise a 0.                                     */
-/* F LAFORSE 04/07/95 version V2.6.0 lecture bidon apres acces a une carte   */
-/*           pour liberer le bus                                             */
-/* J.PAGET 19/11/95 version V2.6.1 Nombre, addresse,irq n'est plus configure */
-/* et passe en argument a acinit, mais est scrute sur le bus pour s'adapter  */
-/* au nombre de cartes presentes sur le bus. IOCL code 6 affichait V2.4.3    */
-/* F.LAFORSE 28/11/95 creation de fichiers acXX.o avec les differentes       */
-/* addresses de base des cartes, IOCTL 6 plus complet                         */
-/* J.PAGET le 19/08/96 copie de la version V2.6 en V2.8.0 sans modification  */
-/* de code autre que le texte V2.6.1 en V2.8.0                               */
-/*****************************************************************************/
-
-
-#include <linux/kernel.h>
-#include <linux/module.h>
-#include <linux/interrupt.h>
-#include <linux/sched/signal.h>
-#include <linux/slab.h>
-#include <linux/errno.h>
-#include <linux/mutex.h>
-#include <linux/miscdevice.h>
-#include <linux/pci.h>
-#include <linux/wait.h>
-#include <linux/init.h>
-#include <linux/fs.h>
-#include <linux/nospec.h>
-
-#include <asm/io.h>
-#include <linux/uaccess.h>
-
-#include "applicom.h"
-
-
-/* NOTE: We use for loops with {write,read}b() instead of 
-   memcpy_{from,to}io throughout this driver. This is because
-   the board doesn't correctly handle word accesses - only
-   bytes. 
-*/
-
-
-#undef DEBUG
-
-#define MAX_BOARD 8		/* maximum of pc board possible */
-#define MAX_ISA_BOARD 4
-#define LEN_RAM_IO 0x800
-
-#ifndef PCI_VENDOR_ID_APPLICOM
-#define PCI_VENDOR_ID_APPLICOM                0x1389
-#define PCI_DEVICE_ID_APPLICOM_PCIGENERIC     0x0001
-#define PCI_DEVICE_ID_APPLICOM_PCI2000IBS_CAN 0x0002
-#define PCI_DEVICE_ID_APPLICOM_PCI2000PFB     0x0003
-#endif
-
-static DEFINE_MUTEX(ac_mutex);
-static char *applicom_pci_devnames[] = {
-	"PCI board",
-	"PCI2000IBS / PCI2000CAN",
-	"PCI2000PFB"
-};
-
-static const struct pci_device_id applicom_pci_tbl[] = {
-	{ PCI_VDEVICE(APPLICOM, PCI_DEVICE_ID_APPLICOM_PCIGENERIC) },
-	{ PCI_VDEVICE(APPLICOM, PCI_DEVICE_ID_APPLICOM_PCI2000IBS_CAN) },
-	{ PCI_VDEVICE(APPLICOM, PCI_DEVICE_ID_APPLICOM_PCI2000PFB) },
-	{ 0 }
-};
-MODULE_DEVICE_TABLE(pci, applicom_pci_tbl);
-
-MODULE_AUTHOR("David Woodhouse & Applicom International");
-MODULE_DESCRIPTION("Driver for Applicom Profibus card");
-MODULE_LICENSE("GPL");
-MODULE_ALIAS_MISCDEV(AC_MINOR);
-
-static struct applicom_board {
-	unsigned long PhysIO;
-	void __iomem *RamIO;
-	wait_queue_head_t FlagSleepSend;
-	long irq;
-	spinlock_t mutex;
-} apbs[MAX_BOARD];
-
-static unsigned int irq;	/* interrupt number IRQ       */
-static unsigned long mem;	/* physical segment of board  */
-
-module_param_hw(irq, uint, irq, 0);
-MODULE_PARM_DESC(irq, "IRQ of the Applicom board");
-module_param_hw(mem, ulong, iomem, 0);
-MODULE_PARM_DESC(mem, "Shared Memory Address of Applicom board");
-
-static unsigned int numboards;	/* number of installed boards */
-static volatile unsigned char Dummy;
-static DECLARE_WAIT_QUEUE_HEAD(FlagSleepRec);
-static unsigned int WriteErrorCount;	/* number of write error      */
-static unsigned int ReadErrorCount;	/* number of read error       */
-static unsigned int DeviceErrorCount;	/* number of device error     */
-
-static ssize_t ac_read (struct file *, char __user *, size_t, loff_t *);
-static ssize_t ac_write (struct file *, const char __user *, size_t, loff_t *);
-static long ac_ioctl(struct file *, unsigned int, unsigned long);
-static irqreturn_t ac_interrupt(int, void *);
-
-static const struct file_operations ac_fops = {
-	.owner = THIS_MODULE,
-	.read = ac_read,
-	.write = ac_write,
-	.unlocked_ioctl = ac_ioctl,
-};
-
-static struct miscdevice ac_miscdev = {
-	AC_MINOR,
-	"ac",
-	&ac_fops
-};
-
-static int dummy;	/* dev_id for request_irq() */
-
-static int ac_register_board(unsigned long physloc, void __iomem *loc, 
-		      unsigned char boardno)
-{
-	volatile unsigned char byte_reset_it;
-
-	if((readb(loc + CONF_END_TEST)     != 0x00) ||
-	   (readb(loc + CONF_END_TEST + 1) != 0x55) ||
-	   (readb(loc + CONF_END_TEST + 2) != 0xAA) ||
-	   (readb(loc + CONF_END_TEST + 3) != 0xFF))
-		return 0;
-
-	if (!boardno)
-		boardno = readb(loc + NUMCARD_OWNER_TO_PC);
-
-	if (!boardno || boardno > MAX_BOARD) {
-		printk(KERN_WARNING "Board #%d (at 0x%lx) is out of range (1 <= x <= %d).\n",
-		       boardno, physloc, MAX_BOARD);
-		return 0;
-	}
-
-	if (apbs[boardno - 1].RamIO) {
-		printk(KERN_WARNING "Board #%d (at 0x%lx) conflicts with previous board #%d (at 0x%lx)\n", 
-		       boardno, physloc, boardno, apbs[boardno-1].PhysIO);
-		return 0;
-	}
-
-	boardno--;
-
-	apbs[boardno].PhysIO = physloc;
-	apbs[boardno].RamIO = loc;
-	init_waitqueue_head(&apbs[boardno].FlagSleepSend);
-	spin_lock_init(&apbs[boardno].mutex);
-	byte_reset_it = readb(loc + RAM_IT_TO_PC);
-
-	numboards++;
-	return boardno + 1;
-}
-
-static void __exit applicom_exit(void)
-{
-	unsigned int i;
-
-	misc_deregister(&ac_miscdev);
-
-	for (i = 0; i < MAX_BOARD; i++) {
-
-		if (!apbs[i].RamIO)
-			continue;
-
-		if (apbs[i].irq)
-			free_irq(apbs[i].irq, &dummy);
-
-		iounmap(apbs[i].RamIO);
-	}
-}
-
-static int __init applicom_init(void)
-{
-	int i, numisa = 0;
-	struct pci_dev *dev = NULL;
-	void __iomem *RamIO;
-	int boardno, ret;
-
-	printk(KERN_INFO "Applicom driver: $Id: ac.c,v 1.30 2000/03/22 16:03:57 dwmw2 Exp $\n");
-
-	/* No mem and irq given - check for a PCI card */
-
-	while ( (dev = pci_get_class(PCI_CLASS_OTHERS << 16, dev))) {
-
-		if (!pci_match_id(applicom_pci_tbl, dev))
-			continue;
-		
-		if (pci_enable_device(dev)) {
-			pci_dev_put(dev);
-			return -EIO;
-		}
-
-		RamIO = ioremap(pci_resource_start(dev, 0), LEN_RAM_IO);
-
-		if (!RamIO) {
-			printk(KERN_INFO "ac.o: Failed to ioremap PCI memory "
-				"space at 0x%llx\n",
-				(unsigned long long)pci_resource_start(dev, 0));
-			pci_disable_device(dev);
-			pci_dev_put(dev);
-			return -EIO;
-		}
-
-		printk(KERN_INFO "Applicom %s found at mem 0x%llx, irq %d\n",
-		       applicom_pci_devnames[dev->device-1],
-			   (unsigned long long)pci_resource_start(dev, 0),
-		       dev->irq);
-
-		boardno = ac_register_board(pci_resource_start(dev, 0),
-				RamIO, 0);
-		if (!boardno) {
-			printk(KERN_INFO "ac.o: PCI Applicom device doesn't have correct signature.\n");
-			iounmap(RamIO);
-			pci_disable_device(dev);
-			continue;
-		}
-
-		if (request_irq(dev->irq, &ac_interrupt, IRQF_SHARED, "Applicom PCI", &dummy)) {
-			printk(KERN_INFO "Could not allocate IRQ %d for PCI Applicom device.\n", dev->irq);
-			iounmap(RamIO);
-			pci_disable_device(dev);
-			apbs[boardno - 1].RamIO = NULL;
-			continue;
-		}
-
-		/* Enable interrupts. */
-
-		writeb(0x40, apbs[boardno - 1].RamIO + RAM_IT_FROM_PC);
-
-		apbs[boardno - 1].irq = dev->irq;
-	}
-
-	/* Finished with PCI cards. If none registered, 
-	 * and there was no mem/irq specified, exit */
-
-	if (!mem || !irq) {
-		if (numboards)
-			goto fin;
-		else {
-			printk(KERN_INFO "ac.o: No PCI boards found.\n");
-			printk(KERN_INFO "ac.o: For an ISA board you must supply memory and irq parameters.\n");
-			return -ENXIO;
-		}
-	}
-
-	/* Now try the specified ISA cards */
-
-	for (i = 0; i < MAX_ISA_BOARD; i++) {
-		RamIO = ioremap(mem + (LEN_RAM_IO * i), LEN_RAM_IO);
-
-		if (!RamIO) {
-			printk(KERN_INFO "ac.o: Failed to ioremap the ISA card's memory space (slot #%d)\n", i + 1);
-			continue;
-		}
-
-		if (!(boardno = ac_register_board((unsigned long)mem+ (LEN_RAM_IO*i),
-						  RamIO,i+1))) {
-			iounmap(RamIO);
-			continue;
-		}
-
-		printk(KERN_NOTICE "Applicom ISA card found at mem 0x%lx, irq %d\n", mem + (LEN_RAM_IO*i), irq);
-
-		if (!numisa) {
-			if (request_irq(irq, &ac_interrupt, IRQF_SHARED, "Applicom ISA", &dummy)) {
-				printk(KERN_WARNING "Could not allocate IRQ %d for ISA Applicom device.\n", irq);
-				iounmap(RamIO);
-				apbs[boardno - 1].RamIO = NULL;
-			}
-			else
-				apbs[boardno - 1].irq = irq;
-		}
-		else
-			apbs[boardno - 1].irq = 0;
-
-		numisa++;
-	}
-
-	if (!numisa)
-		printk(KERN_WARNING "ac.o: No valid ISA Applicom boards found "
-				"at mem 0x%lx\n", mem);
-
- fin:
-	init_waitqueue_head(&FlagSleepRec);
-
-	WriteErrorCount = 0;
-	ReadErrorCount = 0;
-	DeviceErrorCount = 0;
-
-	if (numboards) {
-		ret = misc_register(&ac_miscdev);
-		if (ret) {
-			printk(KERN_WARNING "ac.o: Unable to register misc device\n");
-			goto out;
-		}
-		for (i = 0; i < MAX_BOARD; i++) {
-			int serial;
-			char boardname[(SERIAL_NUMBER - TYPE_CARD) + 1];
-
-			if (!apbs[i].RamIO)
-				continue;
-
-			for (serial = 0; serial < SERIAL_NUMBER - TYPE_CARD; serial++)
-				boardname[serial] = readb(apbs[i].RamIO + TYPE_CARD + serial);
-
-			boardname[serial] = 0;
-
-
-			printk(KERN_INFO "Applicom board %d: %s, PROM V%d.%d",
-			       i+1, boardname,
-			       (int)(readb(apbs[i].RamIO + VERS) >> 4),
-			       (int)(readb(apbs[i].RamIO + VERS) & 0xF));
-			
-			serial = (readb(apbs[i].RamIO + SERIAL_NUMBER) << 16) + 
-				(readb(apbs[i].RamIO + SERIAL_NUMBER + 1) << 8) + 
-				(readb(apbs[i].RamIO + SERIAL_NUMBER + 2) );
-
-			if (serial != 0)
-				printk(" S/N %d\n", serial);
-			else
-				printk("\n");
-		}
-		return 0;
-	}
-
-	else
-		return -ENXIO;
-
-out:
-	for (i = 0; i < MAX_BOARD; i++) {
-		if (!apbs[i].RamIO)
-			continue;
-		if (apbs[i].irq)
-			free_irq(apbs[i].irq, &dummy);
-		iounmap(apbs[i].RamIO);
-	}
-	return ret;
-}
-
-module_init(applicom_init);
-module_exit(applicom_exit);
-
-
-static ssize_t ac_write(struct file *file, const char __user *buf, size_t count, loff_t * ppos)
-{
-	unsigned int NumCard;	/* Board number 1 -> 8           */
-	unsigned int IndexCard;	/* Index board number 0 -> 7     */
-	unsigned char TicCard;	/* Board TIC to send             */
-	unsigned long flags;	/* Current priority              */
-	struct st_ram_io st_loc;
-	struct mailbox tmpmailbox;
-#ifdef DEBUG
-	int c;
-#endif
-	DECLARE_WAITQUEUE(wait, current);
-
-	if (count != sizeof(struct st_ram_io) + sizeof(struct mailbox)) {
-		static int warncount = 5;
-		if (warncount) {
-			printk(KERN_INFO "Hmmm. write() of Applicom card, length %zd != expected %zd\n",
-			       count, sizeof(struct st_ram_io) + sizeof(struct mailbox));
-			warncount--;
-		}
-		return -EINVAL;
-	}
-
-	if(copy_from_user(&st_loc, buf, sizeof(struct st_ram_io))) 
-		return -EFAULT;
-	
-	if(copy_from_user(&tmpmailbox, &buf[sizeof(struct st_ram_io)],
-			  sizeof(struct mailbox))) 
-		return -EFAULT;
-
-	NumCard = st_loc.num_card;	/* board number to send          */
-	TicCard = st_loc.tic_des_from_pc;	/* tic number to send            */
-	IndexCard = NumCard - 1;
-
-	if (IndexCard >= MAX_BOARD)
-		return -EINVAL;
-	IndexCard = array_index_nospec(IndexCard, MAX_BOARD);
-
-	if (!apbs[IndexCard].RamIO)
-		return -EINVAL;
-
-#ifdef DEBUG
-	printk("Write to applicom card #%d. struct st_ram_io follows:",
-	       IndexCard+1);
-
-		for (c = 0; c < sizeof(struct st_ram_io);) {
-		
-			printk("\n%5.5X: %2.2X", c, ((unsigned char *) &st_loc)[c]);
-
-			for (c++; c % 8 && c < sizeof(struct st_ram_io); c++) {
-				printk(" %2.2X", ((unsigned char *) &st_loc)[c]);
-			}
-		}
-
-		printk("\nstruct mailbox follows:");
-
-		for (c = 0; c < sizeof(struct mailbox);) {
-			printk("\n%5.5X: %2.2X", c, ((unsigned char *) &tmpmailbox)[c]);
-
-			for (c++; c % 8 && c < sizeof(struct mailbox); c++) {
-				printk(" %2.2X", ((unsigned char *) &tmpmailbox)[c]);
-			}
-		}
-
-		printk("\n");
-#endif
-
-	spin_lock_irqsave(&apbs[IndexCard].mutex, flags);
-
-	/* Test octet ready correct */
-	if(readb(apbs[IndexCard].RamIO + DATA_FROM_PC_READY) > 2) { 
-		Dummy = readb(apbs[IndexCard].RamIO + VERS);
-		spin_unlock_irqrestore(&apbs[IndexCard].mutex, flags);
-		printk(KERN_WARNING "APPLICOM driver write error board %d, DataFromPcReady = %d\n",
-		       IndexCard,(int)readb(apbs[IndexCard].RamIO + DATA_FROM_PC_READY));
-		DeviceErrorCount++;
-		return -EIO;
-	}
-	
-	/* Place ourselves on the wait queue */
-	set_current_state(TASK_INTERRUPTIBLE);
-	add_wait_queue(&apbs[IndexCard].FlagSleepSend, &wait);
-
-	/* Check whether the card is ready for us */
-	while (readb(apbs[IndexCard].RamIO + DATA_FROM_PC_READY) != 0) {
-		Dummy = readb(apbs[IndexCard].RamIO + VERS);
-		/* It's busy. Sleep. */
-
-		spin_unlock_irqrestore(&apbs[IndexCard].mutex, flags);
-		schedule();
-		if (signal_pending(current)) {
-			remove_wait_queue(&apbs[IndexCard].FlagSleepSend,
-					  &wait);
-			return -EINTR;
-		}
-		spin_lock_irqsave(&apbs[IndexCard].mutex, flags);
-		set_current_state(TASK_INTERRUPTIBLE);
-	}
-
-	/* We may not have actually slept */
-	set_current_state(TASK_RUNNING);
-	remove_wait_queue(&apbs[IndexCard].FlagSleepSend, &wait);
-
-	writeb(1, apbs[IndexCard].RamIO + DATA_FROM_PC_READY);
-
-	/* Which is best - lock down the pages with rawio and then
-	   copy directly, or use bounce buffers? For now we do the latter 
-	   because it works with 2.2 still */
-	{
-		unsigned char *from = (unsigned char *) &tmpmailbox;
-		void __iomem *to = apbs[IndexCard].RamIO + RAM_FROM_PC;
-		int c;
-
-		for (c = 0; c < sizeof(struct mailbox); c++)
-			writeb(*(from++), to++);
-	}
-
-	writeb(0x20, apbs[IndexCard].RamIO + TIC_OWNER_FROM_PC);
-	writeb(0xff, apbs[IndexCard].RamIO + NUMCARD_OWNER_FROM_PC);
-	writeb(TicCard, apbs[IndexCard].RamIO + TIC_DES_FROM_PC);
-	writeb(NumCard, apbs[IndexCard].RamIO + NUMCARD_DES_FROM_PC);
-	writeb(2, apbs[IndexCard].RamIO + DATA_FROM_PC_READY);
-	writeb(1, apbs[IndexCard].RamIO + RAM_IT_FROM_PC);
-	Dummy = readb(apbs[IndexCard].RamIO + VERS);
-	spin_unlock_irqrestore(&apbs[IndexCard].mutex, flags);
-	return 0;
-}
-
-static int do_ac_read(int IndexCard, char __user *buf,
-		struct st_ram_io *st_loc, struct mailbox *mailbox)
-{
-	void __iomem *from = apbs[IndexCard].RamIO + RAM_TO_PC;
-	unsigned char *to = (unsigned char *)mailbox;
-#ifdef DEBUG
-	int c;
-#endif
-
-	st_loc->tic_owner_to_pc = readb(apbs[IndexCard].RamIO + TIC_OWNER_TO_PC);
-	st_loc->numcard_owner_to_pc = readb(apbs[IndexCard].RamIO + NUMCARD_OWNER_TO_PC);
-
-
-	{
-		int c;
-
-		for (c = 0; c < sizeof(struct mailbox); c++)
-			*(to++) = readb(from++);
-	}
-	writeb(1, apbs[IndexCard].RamIO + ACK_FROM_PC_READY);
-	writeb(1, apbs[IndexCard].RamIO + TYP_ACK_FROM_PC);
-	writeb(IndexCard+1, apbs[IndexCard].RamIO + NUMCARD_ACK_FROM_PC);
-	writeb(readb(apbs[IndexCard].RamIO + TIC_OWNER_TO_PC), 
-	       apbs[IndexCard].RamIO + TIC_ACK_FROM_PC);
-	writeb(2, apbs[IndexCard].RamIO + ACK_FROM_PC_READY);
-	writeb(0, apbs[IndexCard].RamIO + DATA_TO_PC_READY);
-	writeb(2, apbs[IndexCard].RamIO + RAM_IT_FROM_PC);
-	Dummy = readb(apbs[IndexCard].RamIO + VERS);
-
-#ifdef DEBUG
-		printk("Read from applicom card #%d. struct st_ram_io follows:", NumCard);
-
-		for (c = 0; c < sizeof(struct st_ram_io);) {
-			printk("\n%5.5X: %2.2X", c, ((unsigned char *)st_loc)[c]);
-
-			for (c++; c % 8 && c < sizeof(struct st_ram_io); c++) {
-				printk(" %2.2X", ((unsigned char *)st_loc)[c]);
-			}
-		}
-
-		printk("\nstruct mailbox follows:");
-
-		for (c = 0; c < sizeof(struct mailbox);) {
-			printk("\n%5.5X: %2.2X", c, ((unsigned char *)mailbox)[c]);
-
-			for (c++; c % 8 && c < sizeof(struct mailbox); c++) {
-				printk(" %2.2X", ((unsigned char *)mailbox)[c]);
-			}
-		}
-		printk("\n");
-#endif
-	return (sizeof(struct st_ram_io) + sizeof(struct mailbox));
-}
-
-static ssize_t ac_read (struct file *filp, char __user *buf, size_t count, loff_t *ptr)
-{
-	unsigned long flags;
-	unsigned int i;
-	unsigned char tmp;
-	int ret = 0;
-	DECLARE_WAITQUEUE(wait, current);
-#ifdef DEBUG
-	int loopcount=0;
-#endif
-	/* No need to ratelimit this. Only root can trigger it anyway */
-	if (count != sizeof(struct st_ram_io) + sizeof(struct mailbox)) {
-		printk( KERN_WARNING "Hmmm. read() of Applicom card, length %zd != expected %zd\n",
-			count,sizeof(struct st_ram_io) + sizeof(struct mailbox));
-		return -EINVAL;
-	}
-	
-	while(1) {
-		/* Stick ourself on the wait queue */
-		set_current_state(TASK_INTERRUPTIBLE);
-		add_wait_queue(&FlagSleepRec, &wait);
-		
-		/* Scan each board, looking for one which has a packet for us */
-		for (i=0; i < MAX_BOARD; i++) {
-			if (!apbs[i].RamIO)
-				continue;
-			spin_lock_irqsave(&apbs[i].mutex, flags);
-			
-			tmp = readb(apbs[i].RamIO + DATA_TO_PC_READY);
-			
-			if (tmp == 2) {
-				struct st_ram_io st_loc;
-				struct mailbox mailbox;
-
-				/* Got a packet for us */
-				memset(&st_loc, 0, sizeof(st_loc));
-				ret = do_ac_read(i, buf, &st_loc, &mailbox);
-				spin_unlock_irqrestore(&apbs[i].mutex, flags);
-				set_current_state(TASK_RUNNING);
-				remove_wait_queue(&FlagSleepRec, &wait);
-
-				if (copy_to_user(buf, &st_loc, sizeof(st_loc)))
-					return -EFAULT;
-				if (copy_to_user(buf + sizeof(st_loc), &mailbox, sizeof(mailbox)))
-					return -EFAULT;
-				return tmp;
-			}
-			
-			if (tmp > 2) {
-				/* Got an error */
-				Dummy = readb(apbs[i].RamIO + VERS);
-				
-				spin_unlock_irqrestore(&apbs[i].mutex, flags);
-				set_current_state(TASK_RUNNING);
-				remove_wait_queue(&FlagSleepRec, &wait);
-				
-				printk(KERN_WARNING "APPLICOM driver read error board %d, DataToPcReady = %d\n",
-				       i,(int)readb(apbs[i].RamIO + DATA_TO_PC_READY));
-				DeviceErrorCount++;
-				return -EIO;
-			}
-			
-			/* Nothing for us. Try the next board */
-			Dummy = readb(apbs[i].RamIO + VERS);
-			spin_unlock_irqrestore(&apbs[i].mutex, flags);
-			
-		} /* per board */
-
-		/* OK - No boards had data for us. Sleep now */
-
-		schedule();
-		remove_wait_queue(&FlagSleepRec, &wait);
-
-		if (signal_pending(current))
-			return -EINTR;
-
-#ifdef DEBUG
-		if (loopcount++ > 2) {
-			printk(KERN_DEBUG "Looping in ac_read. loopcount %d\n", loopcount);
-		}
-#endif
-	} 
-}
-
-static irqreturn_t ac_interrupt(int vec, void *dev_instance)
-{
-	unsigned int i;
-	unsigned int FlagInt;
-	unsigned int LoopCount;
-	int handled = 0;
-
-	//    printk("Applicom interrupt on IRQ %d occurred\n", vec);
-
-	LoopCount = 0;
-
-	do {
-		FlagInt = 0;
-		for (i = 0; i < MAX_BOARD; i++) {
-			
-			/* Skip if this board doesn't exist */
-			if (!apbs[i].RamIO)
-				continue;
-
-			spin_lock(&apbs[i].mutex);
-
-			/* Skip if this board doesn't want attention */
-			if(readb(apbs[i].RamIO + RAM_IT_TO_PC) == 0) {
-				spin_unlock(&apbs[i].mutex);
-				continue;
-			}
-
-			handled = 1;
-			FlagInt = 1;
-			writeb(0, apbs[i].RamIO + RAM_IT_TO_PC);
-
-			if (readb(apbs[i].RamIO + DATA_TO_PC_READY) > 2) {
-				printk(KERN_WARNING "APPLICOM driver interrupt err board %d, DataToPcReady = %d\n",
-				       i+1,(int)readb(apbs[i].RamIO + DATA_TO_PC_READY));
-				DeviceErrorCount++;
-			}
-
-			if((readb(apbs[i].RamIO + DATA_FROM_PC_READY) > 2) && 
-			   (readb(apbs[i].RamIO + DATA_FROM_PC_READY) != 6)) {
-				
-				printk(KERN_WARNING "APPLICOM driver interrupt err board %d, DataFromPcReady = %d\n",
-				       i+1,(int)readb(apbs[i].RamIO + DATA_FROM_PC_READY));
-				DeviceErrorCount++;
-			}
-
-			if (readb(apbs[i].RamIO + DATA_TO_PC_READY) == 2) {	/* mailbox sent by the card ?   */
-				if (waitqueue_active(&FlagSleepRec)) {
-				wake_up_interruptible(&FlagSleepRec);
-			}
-			}
-
-			if (readb(apbs[i].RamIO + DATA_FROM_PC_READY) == 0) {	/* ram i/o free for write by pc ? */
-				if (waitqueue_active(&apbs[i].FlagSleepSend)) {	/* process sleep during read ?    */
-					wake_up_interruptible(&apbs[i].FlagSleepSend);
-				}
-			}
-			Dummy = readb(apbs[i].RamIO + VERS);
-
-			if(readb(apbs[i].RamIO + RAM_IT_TO_PC)) {
-				/* There's another int waiting on this card */
-				spin_unlock(&apbs[i].mutex);
-				i--;
-			} else {
-				spin_unlock(&apbs[i].mutex);
-			}
-		}
-		if (FlagInt)
-			LoopCount = 0;
-		else
-			LoopCount++;
-	} while(LoopCount < 2);
-	return IRQ_RETVAL(handled);
-}
-
-
-
-static long ac_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
-     
-{				/* @ ADG ou ATO selon le cas */
-	int i;
-	unsigned char IndexCard;
-	void __iomem *pmem;
-	int ret = 0;
-	static int warncount = 10;
-	volatile unsigned char byte_reset_it;
-	struct st_ram_io *adgl;
-	void __user *argp = (void __user *)arg;
-
-	/* In general, the device is only openable by root anyway, so we're not
-	   particularly concerned that bogus ioctls can flood the console. */
-
-	adgl = memdup_user(argp, sizeof(struct st_ram_io));
-	if (IS_ERR(adgl))
-		return PTR_ERR(adgl);
-
-	mutex_lock(&ac_mutex);	
-	IndexCard = adgl->num_card-1;
-	 
-	if (cmd != 6 && IndexCard >= MAX_BOARD)
-		goto err;
-	IndexCard = array_index_nospec(IndexCard, MAX_BOARD);
-
-	if (cmd != 6 && !apbs[IndexCard].RamIO)
-		goto err;
-
-	switch (cmd) {
-		
-	case 0:
-		pmem = apbs[IndexCard].RamIO;
-		for (i = 0; i < sizeof(struct st_ram_io); i++)
-			((unsigned char *)adgl)[i]=readb(pmem++);
-		if (copy_to_user(argp, adgl, sizeof(struct st_ram_io)))
-			ret = -EFAULT;
-		break;
-	case 1:
-		pmem = apbs[IndexCard].RamIO + CONF_END_TEST;
-		for (i = 0; i < 4; i++)
-			adgl->conf_end_test[i] = readb(pmem++);
-		for (i = 0; i < 2; i++)
-			adgl->error_code[i] = readb(pmem++);
-		for (i = 0; i < 4; i++)
-			adgl->parameter_error[i] = readb(pmem++);
-		pmem = apbs[IndexCard].RamIO + VERS;
-		adgl->vers = readb(pmem);
-		pmem = apbs[IndexCard].RamIO + TYPE_CARD;
-		for (i = 0; i < 20; i++)
-			adgl->reserv1[i] = readb(pmem++);
-		*(int *)&adgl->reserv1[20] =  
-			(readb(apbs[IndexCard].RamIO + SERIAL_NUMBER) << 16) + 
-			(readb(apbs[IndexCard].RamIO + SERIAL_NUMBER + 1) << 8) + 
-			(readb(apbs[IndexCard].RamIO + SERIAL_NUMBER + 2) );
-
-		if (copy_to_user(argp, adgl, sizeof(struct st_ram_io)))
-			ret = -EFAULT;
-		break;
-	case 2:
-		pmem = apbs[IndexCard].RamIO + CONF_END_TEST;
-		for (i = 0; i < 10; i++)
-			writeb(0xff, pmem++);
-		writeb(adgl->data_from_pc_ready, 
-		       apbs[IndexCard].RamIO + DATA_FROM_PC_READY);
-
-		writeb(1, apbs[IndexCard].RamIO + RAM_IT_FROM_PC);
-		
-		for (i = 0; i < MAX_BOARD; i++) {
-			if (apbs[i].RamIO) {
-				byte_reset_it = readb(apbs[i].RamIO + RAM_IT_TO_PC);
-			}
-		}
-		break;
-	case 3:
-		pmem = apbs[IndexCard].RamIO + TIC_DES_FROM_PC;
-		writeb(adgl->tic_des_from_pc, pmem);
-		break;
-	case 4:
-		pmem = apbs[IndexCard].RamIO + TIC_OWNER_TO_PC;
-		adgl->tic_owner_to_pc     = readb(pmem++);
-		adgl->numcard_owner_to_pc = readb(pmem);
-		if (copy_to_user(argp, adgl,sizeof(struct st_ram_io)))
-			ret = -EFAULT;
-		break;
-	case 5:
-		writeb(adgl->num_card, apbs[IndexCard].RamIO + NUMCARD_OWNER_TO_PC);
-		writeb(adgl->num_card, apbs[IndexCard].RamIO + NUMCARD_DES_FROM_PC);
-		writeb(adgl->num_card, apbs[IndexCard].RamIO + NUMCARD_ACK_FROM_PC);
-		writeb(4, apbs[IndexCard].RamIO + DATA_FROM_PC_READY);
-		writeb(1, apbs[IndexCard].RamIO + RAM_IT_FROM_PC);
-		break;
-	case 6:
-		printk(KERN_INFO "APPLICOM driver release .... V2.8.0 ($Revision: 1.30 $)\n");
-		printk(KERN_INFO "Number of installed boards . %d\n", (int) numboards);
-		printk(KERN_INFO "Segment of board ........... %X\n", (int) mem);
-		printk(KERN_INFO "Interrupt IRQ number ....... %d\n", (int) irq);
-		for (i = 0; i < MAX_BOARD; i++) {
-			int serial;
-			char boardname[(SERIAL_NUMBER - TYPE_CARD) + 1];
-
-			if (!apbs[i].RamIO)
-				continue;
-
-			for (serial = 0; serial < SERIAL_NUMBER - TYPE_CARD; serial++)
-				boardname[serial] = readb(apbs[i].RamIO + TYPE_CARD + serial);
-			boardname[serial] = 0;
-
-			printk(KERN_INFO "Prom version board %d ....... V%d.%d %s",
-			       i+1,
-			       (int)(readb(apbs[i].RamIO + VERS) >> 4),
-			       (int)(readb(apbs[i].RamIO + VERS) & 0xF),
-			       boardname);
-
-
-			serial = (readb(apbs[i].RamIO + SERIAL_NUMBER) << 16) + 
-				(readb(apbs[i].RamIO + SERIAL_NUMBER + 1) << 8) + 
-				(readb(apbs[i].RamIO + SERIAL_NUMBER + 2) );
-
-			if (serial != 0)
-				printk(" S/N %d\n", serial);
-			else
-				printk("\n");
-		}
-		if (DeviceErrorCount != 0)
-			printk(KERN_INFO "DeviceErrorCount ........... %d\n", DeviceErrorCount);
-		if (ReadErrorCount != 0)
-			printk(KERN_INFO "ReadErrorCount ............. %d\n", ReadErrorCount);
-		if (WriteErrorCount != 0)
-			printk(KERN_INFO "WriteErrorCount ............ %d\n", WriteErrorCount);
-		if (waitqueue_active(&FlagSleepRec))
-			printk(KERN_INFO "Process in read pending\n");
-		for (i = 0; i < MAX_BOARD; i++) {
-			if (apbs[i].RamIO && waitqueue_active(&apbs[i].FlagSleepSend))
-				printk(KERN_INFO "Process in write pending board %d\n",i+1);
-		}
-		break;
-	default:
-		ret = -ENOTTY;
-		break;
-	}
-
-	if (cmd != 6)
-		Dummy = readb(apbs[IndexCard].RamIO + VERS);
-
-	kfree(adgl);
-	mutex_unlock(&ac_mutex);
-	return ret;
-
-err:
-	if (warncount) {
-		pr_warn("APPLICOM driver IOCTL, bad board number %d\n",
-			(int)IndexCard + 1);
-		warncount--;
-	}
-	kfree(adgl);
-	mutex_unlock(&ac_mutex);
-	return -EINVAL;
-
-}
-
diff --git a/drivers/char/applicom.h b/drivers/char/applicom.h
deleted file mode 100644
index 282e08f159d5..000000000000
--- a/drivers/char/applicom.h
+++ /dev/null
@@ -1,86 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/* $Id: applicom.h,v 1.2 1999/08/28 15:09:49 dwmw2 Exp $ */
-
-
-#ifndef __LINUX_APPLICOM_H__
-#define __LINUX_APPLICOM_H__
-
-
-#define DATA_TO_PC_READY      0x00
-#define TIC_OWNER_TO_PC       0x01
-#define NUMCARD_OWNER_TO_PC   0x02
-#define TIC_DES_TO_PC         0x03
-#define NUMCARD_DES_TO_PC     0x04
-#define DATA_FROM_PC_READY    0x05
-#define TIC_OWNER_FROM_PC     0x06
-#define NUMCARD_OWNER_FROM_PC 0x07
-#define TIC_DES_FROM_PC       0x08
-#define NUMCARD_DES_FROM_PC   0x09
-#define ACK_FROM_PC_READY     0x0E
-#define TIC_ACK_FROM_PC       0x0F
-#define NUMCARD_ACK_FROM_PC   0x010
-#define TYP_ACK_FROM_PC       0x011
-#define CONF_END_TEST         0x012
-#define ERROR_CODE            0x016 
-#define PARAMETER_ERROR       0x018 
-#define VERS                  0x01E 
-#define RAM_TO_PC             0x040
-#define RAM_FROM_PC           0x0170
-#define TYPE_CARD             0x03C0
-#define SERIAL_NUMBER         0x03DA
-#define RAM_IT_FROM_PC        0x03FE
-#define RAM_IT_TO_PC          0x03FF
-
-struct mailbox{
-	u16  stjb_codef;		/* offset 00 */
-	s16  stjb_status;     		/* offset 02 */
-	u16  stjb_ticuser_root;		/* offset 04 */
-	u8   stjb_piduser[4];		/* offset 06 */
-	u16  stjb_mode;			/* offset 0A */
-	u16  stjb_time;			/* offset 0C */
-	u16  stjb_stop;			/* offset 0E */
-	u16  stjb_nfonc;		/* offset 10 */
-	u16  stjb_ncard;		/* offset 12 */
-	u16  stjb_nchan;		/* offset 14 */
-	u16  stjb_nes;			/* offset 16 */
-	u16  stjb_nb;			/* offset 18 */
-	u16  stjb_typvar;		/* offset 1A */
-	u32  stjb_adr;			/* offset 1C */
-	u16  stjb_ticuser_dispcyc;	/* offset 20 */
-	u16  stjb_ticuser_protocol;	/* offset 22 */
-	u8   stjb_filler[12];		/* offset 24 */
-	u8   stjb_data[256];		/* offset 30 */
-	};
-
-struct st_ram_io 
-{
-	unsigned char data_to_pc_ready;
-	unsigned char tic_owner_to_pc;
-	unsigned char numcard_owner_to_pc;
-	unsigned char tic_des_to_pc;
-	unsigned char numcard_des_to_pc;
-	unsigned char data_from_pc_ready;
-	unsigned char tic_owner_from_pc;
-	unsigned char numcard_owner_from_pc;
-	unsigned char tic_des_from_pc;
-	unsigned char numcard_des_from_pc;
-	unsigned char ack_to_pc_ready;
-	unsigned char tic_ack_to_pc;
-	unsigned char numcard_ack_to_pc;
-	unsigned char typ_ack_to_pc;
-	unsigned char ack_from_pc_ready;
-	unsigned char tic_ack_from_pc;
-	unsigned char numcard_ack_from_pc;
-	unsigned char typ_ack_from_pc;
-	unsigned char conf_end_test[4];
-	unsigned char error_code[2];
-	unsigned char parameter_error[4];
-	unsigned char time_base;
-	unsigned char nul_inc;
-	unsigned char vers;
-	unsigned char num_card;
-	unsigned char reserv1[32];
-};
-
-
-#endif /* __LINUX_APPLICOM_H__ */
-- 
2.43.0

