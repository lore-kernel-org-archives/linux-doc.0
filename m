Received: from mail-dl1-f66.google.com (mail-dl1-f66.google.com [74.125.82.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F2AC38DD3
	for <linux-doc@vger.kernel.org>; Sat,  2 May 2026 04:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777696463; cv=none; b=re+qPzjinM6Uf1CkalSmFPH/HNFU2/FvGEYGmO6Dku6dvbCJ9q63MBrwTeH3U789GN3DY9FXphzaJLMxLDKuA3xahn5t4xGI66JCuu9cetJEPaW85fJzST8IRB1MQr+Jj827TE6ULWwbTljjWfe27Xb7F2gyY0f1SxQV8wELU98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777696463; c=relaxed/simple;
	bh=vxcKD9h8PEF2Jwkez019r0F8ybIDm4JjveYmVkFnbFc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qcxgKnfCLIUnY8qsAHXIk2hCAZ/7FXjDmM0JU4EU90ClP4N2kD2pd49XldKCctZKQ9mUgWdzhK6z6H85mhJpEgP8R1tNqg+79tVYOtBfrP3sOizVIJg5snQ7R6FTe7G6twB+x4e7/uhmlSVukco28EUfqh9M0KFn5LnZkyPMbbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HibDMof9; arc=none smtp.client-ip=74.125.82.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HibDMof9"
Received: by mail-dl1-f66.google.com with SMTP id a92af1059eb24-12dbd0f7ecaso5626099c88.0
        for <linux-doc@vger.kernel.org>; Fri, 01 May 2026 21:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777696460; x=1778301260; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vDlLTga7Uq1+JIyHStGNlfEm2POjgFBbdXr3L5J3VDg=;
        b=HibDMof9QheoRp5YBhXZSlq1zTgy0OaBTvbpPKdo73CBK/AG5cspUf+E9XHbKaFmm9
         JhrXPOVlmnP/vyT5RH5FTjy1fBdmMVCuQlpRHYY8PGblMe+E+BQFkBRSSiC3jTJXOGDX
         sKj9BQJ0/cfAdc/f11mszHqUz4nVErQOzZLELflVafZ9twtSLGi+s41tp1fssuOAb1eJ
         2GDqjMjc5epXu1AlaY6KksvntHEdjT3CdcNtkWh6DU+n3kSSJkqfvaTBi7t0UmwmKe9A
         /xipFosn92MAouyEC7pxaGt9g1nVqzDg7M5MKOJXwm+YQayeZRpCnjy4IJJyZpUdgYCz
         vpyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777696460; x=1778301260;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vDlLTga7Uq1+JIyHStGNlfEm2POjgFBbdXr3L5J3VDg=;
        b=mhBz4k8cTSoEcWD72nxJISa+aA6jZK8NXAaRXCIaEkSEnDcdu0O4GnzRIBOq7uKRd+
         jqXNJclIk+nM/Ms4Sb6ZHFUaLmFY3uG65EKeafa7C32yOC8YyGZt/Nj16ZBtakuWVYK2
         xEygrFay7zHOUFxKmoQN6taskeE/gkGdsX4X1tUbv7ySZMRwMp29DoTFWhCynZD7/Bvv
         Qyz8NKu9kZ3Ir3Gv2z6xrAk0wpbD23+mJ83IYPtjrWddPrTzx4toc99XmfOvA3Rhx7pk
         GynNMB5dBgZdw9n4bYWST4QD77yRsUuMSMuipWVfdZBaW6Zul5SThETb+X6LFUHeWihh
         xjXg==
X-Forwarded-Encrypted: i=1; AFNElJ+P5UJGu1VPpr3dQro0avfdffcN0//4pE0V12Wi5QTZmEbvP3W+VWLPMWTa/xdb89MQMuT916tM1H4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzRdxiCn9Mh4yv32LfybpRB9UxkCRz8+tGXBhvrhdX9fCt/Kzj
	t2ed69pdAImWFSPS5uk3JA+5wyV6NYqMLFQgBw36wl2K1e03tF7p0bI1
X-Gm-Gg: AeBDiesJNqiAUpLYb5LK3z4/WWBbxhtMGxcrRteuHS54jue8jm6IhUWjzF6OdCyAe1S
	Xe3q6b/S+uTjGp6AUIT9rICtDyyudYjjSUs9CC3EjhxL6G1wsG8HsGqFkpKps/I4T+uLsrG6+2f
	QrFXo/lkSQNQODPTCMIICIuYdwCFCuz7ayfxg01Jt0a6FWyLXJJXbuHlksSrMKzq4otzrrApPMx
	em3hNgbPLa/hrV5V0xRxZ0UIkkG8HmzQCOkuciV84JrBaOy8Xcnrj2RyUlK2CwNFiymN65MJxxb
	Gi5Ey62RI5W1jN0kJTiK8Vynsn0b2vUCe8GU4EW0JDXWJvR0kCmVAwyaC/s0LEEfTu+PvUlM5N7
	bvKB9voJ3LzbCKA9awfbcsmMZL7BAhbghtNpbRtxYrq7iKLk4xl308qNkzU95w4L+c7KMh++uot
	h+co5gLAsVa+TG4q4cVAmD6PjwmyKYHujOrWkQsSj4qzKEuRBGS3DSAxY5b9N1rfqRLRpbqrbEt
	YV8+Zvh/86PaMvUVlgNUgX3bOZ4dYE0ZkGFGoKAIHaGLoadS0GHMQpZX4yO/17Ogqeyqlk5+RUS
	QXSi4A+QvbqryzhxqZJDEPIYT7wX
X-Received: by 2002:a05:7022:618c:b0:12d:de3f:d842 with SMTP id a92af1059eb24-12dfd872f9emr986694c88.37.1777696460071;
        Fri, 01 May 2026 21:34:20 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12df84250f1sm6173687c88.11.2026.05.01.21.34.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 21:34:19 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: "James R. Van Zandt" <jrv@vanzandt.mv.com>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Haren Myneni <haren@linux.ibm.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH] char: dtlk: remove driver for ISA speech synthesizer card
Date: Fri,  1 May 2026 21:33:28 -0700
Message-ID: <20260502043341.34324-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The dtlk driver supports the RC Systems DoubleTalk PC ISA speech
synthesizer card. It has severe coding style issues and has only
received tree-wide fixes and drive-by cleanups in the entire Git
history (since Linux 2.6.12-rc2). The same hardware is supported by
drivers/accessibility/speakup for screen reader use, but that
implementation does not share any code with this driver. Given all of
these factors, it is likely the driver is entirely unused. Remove it to
reduce future maintenance workload.

Note: The removed maintainer is already listed in CREDITS.
Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 .../userspace-api/ioctl/ioctl-number.rst      |   1 -
 MAINTAINERS                                   |   7 -
 arch/powerpc/configs/ppc6xx_defconfig         |   1 -
 drivers/char/Kconfig                          |  11 -
 drivers/char/Makefile                         |   1 -
 drivers/char/dtlk.c                           | 663 ------------------
 include/linux/dtlk.h                          |  86 ---
 7 files changed, 770 deletions(-)
 delete mode 100644 drivers/char/dtlk.c
 delete mode 100644 include/linux/dtlk.h

diff --git a/Documentation/userspace-api/ioctl/ioctl-number.rst b/Documentation/userspace-api/ioctl/ioctl-number.rst
index 331223761fff..23ca772fbdf0 100644
--- a/Documentation/userspace-api/ioctl/ioctl-number.rst
+++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
@@ -342,7 +342,6 @@ Code  Seq#    Include File                                             Comments
 0xA2  all    uapi/linux/acrn.h                                         ACRN hypervisor
 0xA3  80-8F                                                            Port ACL  in development:
                                                                        <mailto:tlewis@mindspring.com>
-0xA3  90-9F  linux/dtlk.h
 0xA4  00-1F  uapi/linux/tee.h                                          Generic TEE subsystem
 0xA4  00-1F  uapi/asm/sgx.h                                            <mailto:linux-sgx@vger.kernel.org>
 0xA5  01-05  linux/surface_aggregator/cdev.h                           Microsoft Surface Platform System Aggregator
diff --git a/MAINTAINERS b/MAINTAINERS
index 882214b0e7db..9b61010c80d3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7721,13 +7721,6 @@ T:	git git://linuxtv.org/media.git
 F:	Documentation/devicetree/bindings/media/i2c/dongwoon,dw9807-vcm.yaml
 F:	drivers/media/i2c/dw9807-vcm.c
 
-DOUBLETALK DRIVER
-M:	"James R. Van Zandt" <jrv@vanzandt.mv.com>
-L:	blinux-list@redhat.com
-S:	Maintained
-F:	drivers/char/dtlk.c
-F:	include/linux/dtlk.h
-
 DPAA2 DATAPATH I/O (DPIO) DRIVER
 M:	Roy Pledge <Roy.Pledge@nxp.com>
 L:	linux-kernel@vger.kernel.org
diff --git a/arch/powerpc/configs/ppc6xx_defconfig b/arch/powerpc/configs/ppc6xx_defconfig
index ccabc6e17168..0763da873eb0 100644
--- a/arch/powerpc/configs/ppc6xx_defconfig
+++ b/arch/powerpc/configs/ppc6xx_defconfig
@@ -576,7 +576,6 @@ CONFIG_PPDEV=m
 CONFIG_HW_RANDOM=y
 CONFIG_HW_RANDOM_VIRTIO=m
 CONFIG_NVRAM=y
-CONFIG_DTLK=m
 CONFIG_IPWIRELESS=m
 CONFIG_I2C_CHARDEV=m
 CONFIG_I2C_HYDRA=m
diff --git a/drivers/char/Kconfig b/drivers/char/Kconfig
index 2a3a37b2cf3c..3063b337907b 100644
--- a/drivers/char/Kconfig
+++ b/drivers/char/Kconfig
@@ -199,17 +199,6 @@ config NWFLASH
 
 source "drivers/char/hw_random/Kconfig"
 
-config DTLK
-	tristate "Double Talk PC internal speech card support"
-	depends on ISA
-	help
-	  This driver is for the DoubleTalk PC, a speech synthesizer
-	  manufactured by RC Systems (<https://www.rcsys.com/>).  It is also
-	  called the `internal DoubleTalk'.
-
-	  To compile this driver as a module, choose M here: the
-	  module will be called dtlk.
-
 config XILINX_HWICAP
 	tristate "Xilinx HWICAP Support"
 	depends on MICROBLAZE
diff --git a/drivers/char/Makefile b/drivers/char/Makefile
index 47bdc882797a..c9060054ddbc 100644
--- a/drivers/char/Makefile
+++ b/drivers/char/Makefile
@@ -16,7 +16,6 @@ obj-$(CONFIG_PRINTER)		+= lp.o
 
 obj-$(CONFIG_APM_EMULATION)	+= apm-emulation.o
 
-obj-$(CONFIG_DTLK)		+= dtlk.o
 obj-$(CONFIG_APPLICOM)		+= applicom.o
 obj-$(CONFIG_SONYPI)		+= sonypi.o
 obj-$(CONFIG_HPET)		+= hpet.o
diff --git a/drivers/char/dtlk.c b/drivers/char/dtlk.c
deleted file mode 100644
index 16618079298a..000000000000
--- a/drivers/char/dtlk.c
+++ /dev/null
@@ -1,663 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*                                              -*- linux-c -*-
- * dtlk.c - DoubleTalk PC driver for Linux
- *
- * Original author: Chris Pallotta <chris@allmedia.com>
- * Current maintainer: Jim Van Zandt <jrv@vanzandt.mv.com>
- * 
- * 2000-03-18 Jim Van Zandt: Fix polling.
- *  Eliminate dtlk_timer_active flag and separate dtlk_stop_timer
- *  function.  Don't restart timer in dtlk_timer_tick.  Restart timer
- *  in dtlk_poll after every poll.  dtlk_poll returns mask (duh).
- *  Eliminate unused function dtlk_write_byte.  Misc. code cleanups.
- */
-
-/* This driver is for the DoubleTalk PC, a speech synthesizer
-   manufactured by RC Systems (http://www.rcsys.com/).  It was written
-   based on documentation in their User's Manual file and Developer's
-   Tools disk.
-
-   The DoubleTalk PC contains four voice synthesizers: text-to-speech
-   (TTS), linear predictive coding (LPC), PCM/ADPCM, and CVSD.  It
-   also has a tone generator.  Output data for LPC are written to the
-   LPC port, and output data for the other modes are written to the
-   TTS port.
-
-   Two kinds of data can be read from the DoubleTalk: status
-   information (in response to the "\001?" interrogation command) is
-   read from the TTS port, and index markers (which mark the progress
-   of the speech) are read from the LPC port.  Not all models of the
-   DoubleTalk PC implement index markers.  Both the TTS and LPC ports
-   can also display status flags.
-
-   The DoubleTalk PC generates no interrupts.
-
-   These characteristics are mapped into the Unix stream I/O model as
-   follows:
-
-   "write" sends bytes to the TTS port.  It is the responsibility of
-   the user program to switch modes among TTS, PCM/ADPCM, and CVSD.
-   This driver was written for use with the text-to-speech
-   synthesizer.  If LPC output is needed some day, other minor device
-   numbers can be used to select among output modes.
-
-   "read" gets index markers from the LPC port.  If the device does
-   not implement index markers, the read will fail with error EINVAL.
-
-   Status information is available using the DTLK_INTERROGATE ioctl.
-
- */
-
-#include <linux/module.h>
-
-#define KERNEL
-#include <linux/types.h>
-#include <linux/fs.h>
-#include <linux/mm.h>
-#include <linux/errno.h>	/* for -EBUSY */
-#include <linux/ioport.h>	/* for request_region */
-#include <linux/delay.h>	/* for loops_per_jiffy */
-#include <linux/sched.h>
-#include <linux/mutex.h>
-#include <asm/io.h>		/* for inb_p, outb_p, inb, outb, etc. */
-#include <linux/uaccess.h>	/* for get_user, etc. */
-#include <linux/wait.h>		/* for wait_queue */
-#include <linux/init.h>		/* for __init, module_{init,exit} */
-#include <linux/poll.h>		/* for EPOLLIN, etc. */
-#include <linux/dtlk.h>		/* local header file for DoubleTalk values */
-
-#ifdef TRACING
-#define TRACE_TEXT(str) printk(str);
-#define TRACE_RET printk(")")
-#else				/* !TRACING */
-#define TRACE_TEXT(str) ((void) 0)
-#define TRACE_RET ((void) 0)
-#endif				/* TRACING */
-
-static DEFINE_MUTEX(dtlk_mutex);
-static void dtlk_timer_tick(struct timer_list *unused);
-
-static int dtlk_major;
-static int dtlk_port_lpc;
-static int dtlk_port_tts;
-static int dtlk_busy;
-static int dtlk_has_indexing;
-static unsigned int dtlk_portlist[] =
-{0x25e, 0x29e, 0x2de, 0x31e, 0x35e, 0x39e, 0};
-static wait_queue_head_t dtlk_process_list;
-static DEFINE_TIMER(dtlk_timer, dtlk_timer_tick);
-
-/* prototypes for file_operations struct */
-static ssize_t dtlk_read(struct file *, char __user *,
-			 size_t nbytes, loff_t * ppos);
-static ssize_t dtlk_write(struct file *, const char __user *,
-			  size_t nbytes, loff_t * ppos);
-static __poll_t dtlk_poll(struct file *, poll_table *);
-static int dtlk_open(struct inode *, struct file *);
-static int dtlk_release(struct inode *, struct file *);
-static long dtlk_ioctl(struct file *file,
-		       unsigned int cmd, unsigned long arg);
-
-static const struct file_operations dtlk_fops =
-{
-	.owner		= THIS_MODULE,
-	.read		= dtlk_read,
-	.write		= dtlk_write,
-	.poll		= dtlk_poll,
-	.unlocked_ioctl	= dtlk_ioctl,
-	.open		= dtlk_open,
-	.release	= dtlk_release,
-};
-
-/* local prototypes */
-static int dtlk_dev_probe(void);
-static struct dtlk_settings *dtlk_interrogate(void);
-static int dtlk_readable(void);
-static char dtlk_read_lpc(void);
-static char dtlk_read_tts(void);
-static int dtlk_writeable(void);
-static char dtlk_write_bytes(const char *buf, int n);
-static char dtlk_write_tts(char);
-/*
-   static void dtlk_handle_error(char, char, unsigned int);
- */
-
-static ssize_t dtlk_read(struct file *file, char __user *buf,
-			 size_t count, loff_t * ppos)
-{
-	unsigned int minor = iminor(file_inode(file));
-	char ch;
-	int i = 0, retries;
-
-	TRACE_TEXT("(dtlk_read");
-	/*  printk("DoubleTalk PC - dtlk_read()\n"); */
-
-	if (minor != DTLK_MINOR || !dtlk_has_indexing)
-		return -EINVAL;
-
-	for (retries = 0; retries < loops_per_jiffy; retries++) {
-		while (i < count && dtlk_readable()) {
-			ch = dtlk_read_lpc();
-			/*        printk("dtlk_read() reads 0x%02x\n", ch); */
-			if (put_user(ch, buf++))
-				return -EFAULT;
-			i++;
-		}
-		if (i)
-			return i;
-		if (file->f_flags & O_NONBLOCK)
-			break;
-		msleep_interruptible(100);
-	}
-	if (retries == loops_per_jiffy)
-		printk(KERN_ERR "dtlk_read times out\n");
-	TRACE_RET;
-	return -EAGAIN;
-}
-
-static ssize_t dtlk_write(struct file *file, const char __user *buf,
-			  size_t count, loff_t * ppos)
-{
-	int i = 0, retries = 0, ch;
-
-	TRACE_TEXT("(dtlk_write");
-#ifdef TRACING
-	printk(" \"");
-	{
-		int i, ch;
-		for (i = 0; i < count; i++) {
-			if (get_user(ch, buf + i))
-				return -EFAULT;
-			if (' ' <= ch && ch <= '~')
-				printk("%c", ch);
-			else
-				printk("\\%03o", ch);
-		}
-		printk("\"");
-	}
-#endif
-
-	if (iminor(file_inode(file)) != DTLK_MINOR)
-		return -EINVAL;
-
-	while (1) {
-		while (i < count && !get_user(ch, buf) &&
-		       (ch == DTLK_CLEAR || dtlk_writeable())) {
-			dtlk_write_tts(ch);
-			buf++;
-			i++;
-			if (i % 5 == 0)
-				/* We yield our time until scheduled
-				   again.  This reduces the transfer
-				   rate to 500 bytes/sec, but that's
-				   still enough to keep up with the
-				   speech synthesizer. */
-				msleep_interruptible(1);
-			else {
-				/* the RDY bit goes zero 2-3 usec
-				   after writing, and goes 1 again
-				   180-190 usec later.  Here, we wait
-				   up to 250 usec for the RDY bit to
-				   go nonzero. */
-				for (retries = 0;
-				     retries < loops_per_jiffy / (4000/HZ);
-				     retries++)
-					if (inb_p(dtlk_port_tts) &
-					    TTS_WRITABLE)
-						break;
-			}
-			retries = 0;
-		}
-		if (i == count)
-			return i;
-		if (file->f_flags & O_NONBLOCK)
-			break;
-
-		msleep_interruptible(1);
-
-		if (++retries > 10 * HZ) { /* wait no more than 10 sec
-					      from last write */
-			printk("dtlk: write timeout.  "
-			       "inb_p(dtlk_port_tts) = 0x%02x\n",
-			       inb_p(dtlk_port_tts));
-			TRACE_RET;
-			return -EBUSY;
-		}
-	}
-	TRACE_RET;
-	return -EAGAIN;
-}
-
-static __poll_t dtlk_poll(struct file *file, poll_table * wait)
-{
-	__poll_t mask = 0;
-	unsigned long expires;
-
-	TRACE_TEXT(" dtlk_poll");
-	/*
-	   static long int j;
-	   printk(".");
-	   printk("<%ld>", jiffies-j);
-	   j=jiffies;
-	 */
-	poll_wait(file, &dtlk_process_list, wait);
-
-	if (dtlk_has_indexing && dtlk_readable()) {
-	        timer_delete(&dtlk_timer);
-		mask = EPOLLIN | EPOLLRDNORM;
-	}
-	if (dtlk_writeable()) {
-	        timer_delete(&dtlk_timer);
-		mask |= EPOLLOUT | EPOLLWRNORM;
-	}
-	/* there are no exception conditions */
-
-	/* There won't be any interrupts, so we set a timer instead. */
-	expires = jiffies + 3*HZ / 100;
-	mod_timer(&dtlk_timer, expires);
-
-	return mask;
-}
-
-static void dtlk_timer_tick(struct timer_list *unused)
-{
-	TRACE_TEXT(" dtlk_timer_tick");
-	wake_up_interruptible(&dtlk_process_list);
-}
-
-static long dtlk_ioctl(struct file *file,
-		       unsigned int cmd,
-		       unsigned long arg)
-{
-	char __user *argp = (char __user *)arg;
-	struct dtlk_settings *sp;
-	char portval;
-	TRACE_TEXT(" dtlk_ioctl");
-
-	switch (cmd) {
-
-	case DTLK_INTERROGATE:
-		mutex_lock(&dtlk_mutex);
-		sp = dtlk_interrogate();
-		mutex_unlock(&dtlk_mutex);
-		if (copy_to_user(argp, sp, sizeof(struct dtlk_settings)))
-			return -EINVAL;
-		return 0;
-
-	case DTLK_STATUS:
-		portval = inb_p(dtlk_port_tts);
-		return put_user(portval, argp);
-
-	default:
-		return -EINVAL;
-	}
-}
-
-/* Note that nobody ever sets dtlk_busy... */
-static int dtlk_open(struct inode *inode, struct file *file)
-{
-	TRACE_TEXT("(dtlk_open");
-
-	switch (iminor(inode)) {
-	case DTLK_MINOR:
-		if (dtlk_busy)
-			return -EBUSY;
-		return stream_open(inode, file);
-
-	default:
-		return -ENXIO;
-	}
-}
-
-static int dtlk_release(struct inode *inode, struct file *file)
-{
-	TRACE_TEXT("(dtlk_release");
-
-	switch (iminor(inode)) {
-	case DTLK_MINOR:
-		break;
-
-	default:
-		break;
-	}
-	TRACE_RET;
-	
-	timer_delete_sync(&dtlk_timer);
-
-	return 0;
-}
-
-static int __init dtlk_init(void)
-{
-	int err;
-
-	dtlk_port_lpc = 0;
-	dtlk_port_tts = 0;
-	dtlk_busy = 0;
-	dtlk_major = register_chrdev(0, "dtlk", &dtlk_fops);
-	if (dtlk_major < 0) {
-		printk(KERN_ERR "DoubleTalk PC - cannot register device\n");
-		return dtlk_major;
-	}
-	err = dtlk_dev_probe();
-	if (err) {
-		unregister_chrdev(dtlk_major, "dtlk");
-		return err;
-	}
-	printk(", MAJOR %d\n", dtlk_major);
-
-	init_waitqueue_head(&dtlk_process_list);
-
-	return 0;
-}
-
-static void __exit dtlk_cleanup (void)
-{
-	dtlk_write_bytes("goodbye", 8);
-	msleep_interruptible(500);		/* nap 0.50 sec but
-						   could be awakened
-						   earlier by
-						   signals... */
-
-	dtlk_write_tts(DTLK_CLEAR);
-	unregister_chrdev(dtlk_major, "dtlk");
-	release_region(dtlk_port_lpc, DTLK_IO_EXTENT);
-}
-
-module_init(dtlk_init);
-module_exit(dtlk_cleanup);
-
-/* ------------------------------------------------------------------------ */
-
-static int dtlk_readable(void)
-{
-#ifdef TRACING
-	printk(" dtlk_readable=%u@%u", inb_p(dtlk_port_lpc) != 0x7f, jiffies);
-#endif
-	return inb_p(dtlk_port_lpc) != 0x7f;
-}
-
-static int dtlk_writeable(void)
-{
-	/* TRACE_TEXT(" dtlk_writeable"); */
-#ifdef TRACINGMORE
-	printk(" dtlk_writeable=%u", (inb_p(dtlk_port_tts) & TTS_WRITABLE)!=0);
-#endif
-	return inb_p(dtlk_port_tts) & TTS_WRITABLE;
-}
-
-static int __init dtlk_dev_probe(void)
-{
-	unsigned int testval = 0;
-	int i = 0;
-	struct dtlk_settings *sp;
-
-	if (dtlk_port_lpc | dtlk_port_tts)
-		return -EBUSY;
-
-	for (i = 0; dtlk_portlist[i]; i++) {
-#if 0
-		printk("DoubleTalk PC - Port %03x = %04x\n",
-		       dtlk_portlist[i], (testval = inw_p(dtlk_portlist[i])));
-#endif
-
-		if (!request_region(dtlk_portlist[i], DTLK_IO_EXTENT, 
-			       "dtlk"))
-			continue;
-		testval = inw_p(dtlk_portlist[i]);
-		if ((testval &= 0xfbff) == 0x107f) {
-			dtlk_port_lpc = dtlk_portlist[i];
-			dtlk_port_tts = dtlk_port_lpc + 1;
-
-			sp = dtlk_interrogate();
-			printk("DoubleTalk PC at %03x-%03x, "
-			       "ROM version %s, serial number %u",
-			       dtlk_portlist[i], dtlk_portlist[i] +
-			       DTLK_IO_EXTENT - 1,
-			       sp->rom_version, sp->serial_number);
-
-                        /* put LPC port into known state, so
-			   dtlk_readable() gives valid result */
-			outb_p(0xff, dtlk_port_lpc); 
-
-                        /* INIT string and index marker */
-			dtlk_write_bytes("\036\1@\0\0012I\r", 8);
-			/* posting an index takes 18 msec.  Here, we
-			   wait up to 100 msec to see whether it
-			   appears. */
-			msleep_interruptible(100);
-			dtlk_has_indexing = dtlk_readable();
-#ifdef TRACING
-			printk(", indexing %d\n", dtlk_has_indexing);
-#endif
-#ifdef INSCOPE
-			{
-/* This macro records ten samples read from the LPC port, for later display */
-#define LOOK					\
-for (i = 0; i < 10; i++)			\
-  {						\
-    buffer[b++] = inb_p(dtlk_port_lpc);		\
-    __delay(loops_per_jiffy/(1000000/HZ));             \
-  }
-				char buffer[1000];
-				int b = 0, i, j;
-
-				LOOK
-				outb_p(0xff, dtlk_port_lpc);
-				buffer[b++] = 0;
-				LOOK
-				dtlk_write_bytes("\0012I\r", 4);
-				buffer[b++] = 0;
-				__delay(50 * loops_per_jiffy / (1000/HZ));
-				outb_p(0xff, dtlk_port_lpc);
-				buffer[b++] = 0;
-				LOOK
-
-				printk("\n");
-				for (j = 0; j < b; j++)
-					printk(" %02x", buffer[j]);
-				printk("\n");
-			}
-#endif				/* INSCOPE */
-
-#ifdef OUTSCOPE
-			{
-/* This macro records ten samples read from the TTS port, for later display */
-#define LOOK					\
-for (i = 0; i < 10; i++)			\
-  {						\
-    buffer[b++] = inb_p(dtlk_port_tts);		\
-    __delay(loops_per_jiffy/(1000000/HZ));  /* 1 us */ \
-  }
-				char buffer[1000];
-				int b = 0, i, j;
-
-				mdelay(10);	/* 10 ms */
-				LOOK
-				outb_p(0x03, dtlk_port_tts);
-				buffer[b++] = 0;
-				LOOK
-				LOOK
-
-				printk("\n");
-				for (j = 0; j < b; j++)
-					printk(" %02x", buffer[j]);
-				printk("\n");
-			}
-#endif				/* OUTSCOPE */
-
-			dtlk_write_bytes("Double Talk found", 18);
-
-			return 0;
-		}
-		release_region(dtlk_portlist[i], DTLK_IO_EXTENT);
-	}
-
-	printk(KERN_INFO "DoubleTalk PC - not found\n");
-	return -ENODEV;
-}
-
-/*
-   static void dtlk_handle_error(char op, char rc, unsigned int minor)
-   {
-   printk(KERN_INFO"\nDoubleTalk PC - MINOR: %d, OPCODE: %d, ERROR: %d\n", 
-   minor, op, rc);
-   return;
-   }
- */
-
-/* interrogate the DoubleTalk PC and return its settings */
-static struct dtlk_settings *dtlk_interrogate(void)
-{
-	unsigned char *t;
-	static char buf[sizeof(struct dtlk_settings) + 1];
-	int total, i;
-	static struct dtlk_settings status;
-	TRACE_TEXT("(dtlk_interrogate");
-	dtlk_write_bytes("\030\001?", 3);
-	for (total = 0, i = 0; i < 50; i++) {
-		buf[total] = dtlk_read_tts();
-		if (total > 2 && buf[total] == 0x7f)
-			break;
-		if (total < sizeof(struct dtlk_settings))
-			total++;
-	}
-	/*
-	   if (i==50) printk("interrogate() read overrun\n");
-	   for (i=0; i<sizeof(buf); i++)
-	   printk(" %02x", buf[i]);
-	   printk("\n");
-	 */
-	t = buf;
-	status.serial_number = t[0] + t[1] * 256; /* serial number is
-						     little endian */
-	t += 2;
-
-	i = 0;
-	while (*t != '\r') {
-		status.rom_version[i] = *t;
-		if (i < sizeof(status.rom_version) - 1)
-			i++;
-		t++;
-	}
-	status.rom_version[i] = 0;
-	t++;
-
-	status.mode = *t++;
-	status.punc_level = *t++;
-	status.formant_freq = *t++;
-	status.pitch = *t++;
-	status.speed = *t++;
-	status.volume = *t++;
-	status.tone = *t++;
-	status.expression = *t++;
-	status.ext_dict_loaded = *t++;
-	status.ext_dict_status = *t++;
-	status.free_ram = *t++;
-	status.articulation = *t++;
-	status.reverb = *t++;
-	status.eob = *t++;
-	status.has_indexing = dtlk_has_indexing;
-	TRACE_RET;
-	return &status;
-}
-
-static char dtlk_read_tts(void)
-{
-	int portval, retries = 0;
-	char ch;
-	TRACE_TEXT("(dtlk_read_tts");
-
-	/* verify DT is ready, read char, wait for ACK */
-	do {
-		portval = inb_p(dtlk_port_tts);
-	} while ((portval & TTS_READABLE) == 0 &&
-		 retries++ < DTLK_MAX_RETRIES);
-	if (retries > DTLK_MAX_RETRIES)
-		printk(KERN_ERR "dtlk_read_tts() timeout\n");
-
-	ch = inb_p(dtlk_port_tts);	/* input from TTS port */
-	ch &= 0x7f;
-	outb_p(ch, dtlk_port_tts);
-
-	retries = 0;
-	do {
-		portval = inb_p(dtlk_port_tts);
-	} while ((portval & TTS_READABLE) != 0 &&
-		 retries++ < DTLK_MAX_RETRIES);
-	if (retries > DTLK_MAX_RETRIES)
-		printk(KERN_ERR "dtlk_read_tts() timeout\n");
-
-	TRACE_RET;
-	return ch;
-}
-
-static char dtlk_read_lpc(void)
-{
-	int retries = 0;
-	char ch;
-	TRACE_TEXT("(dtlk_read_lpc");
-
-	/* no need to test -- this is only called when the port is readable */
-
-	ch = inb_p(dtlk_port_lpc);	/* input from LPC port */
-
-	outb_p(0xff, dtlk_port_lpc);
-
-	/* acknowledging a read takes 3-4
-	   usec.  Here, we wait up to 20 usec
-	   for the acknowledgement */
-	retries = (loops_per_jiffy * 20) / (1000000/HZ);
-	while (inb_p(dtlk_port_lpc) != 0x7f && --retries > 0);
-	if (retries == 0)
-		printk(KERN_ERR "dtlk_read_lpc() timeout\n");
-
-	TRACE_RET;
-	return ch;
-}
-
-/* write n bytes to tts port */
-static char dtlk_write_bytes(const char *buf, int n)
-{
-	char val = 0;
-	/*  printk("dtlk_write_bytes(\"%-*s\", %d)\n", n, buf, n); */
-	TRACE_TEXT("(dtlk_write_bytes");
-	while (n-- > 0)
-		val = dtlk_write_tts(*buf++);
-	TRACE_RET;
-	return val;
-}
-
-static char dtlk_write_tts(char ch)
-{
-	int retries = 0;
-#ifdef TRACINGMORE
-	printk("  dtlk_write_tts(");
-	if (' ' <= ch && ch <= '~')
-		printk("'%c'", ch);
-	else
-		printk("0x%02x", ch);
-#endif
-	if (ch != DTLK_CLEAR)	/* no flow control for CLEAR command */
-		while ((inb_p(dtlk_port_tts) & TTS_WRITABLE) == 0 &&
-		       retries++ < DTLK_MAX_RETRIES)	/* DT ready? */
-			;
-	if (retries > DTLK_MAX_RETRIES)
-		printk(KERN_ERR "dtlk_write_tts() timeout\n");
-
-	outb_p(ch, dtlk_port_tts);	/* output to TTS port */
-	/* the RDY bit goes zero 2-3 usec after writing, and goes
-	   1 again 180-190 usec later.  Here, we wait up to 10
-	   usec for the RDY bit to go zero. */
-	for (retries = 0; retries < loops_per_jiffy / (100000/HZ); retries++)
-		if ((inb_p(dtlk_port_tts) & TTS_WRITABLE) == 0)
-			break;
-
-#ifdef TRACINGMORE
-	printk(")\n");
-#endif
-	return 0;
-}
-
-MODULE_DESCRIPTION("RC Systems DoubleTalk PC speech card driver");
-MODULE_LICENSE("GPL");
diff --git a/include/linux/dtlk.h b/include/linux/dtlk.h
deleted file mode 100644
index 27b95e70bde3..000000000000
--- a/include/linux/dtlk.h
+++ /dev/null
@@ -1,86 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#define DTLK_MINOR	0
-#define DTLK_IO_EXTENT	0x02
-
-	/* ioctl's use magic number of 0xa3 */
-#define DTLK_INTERROGATE 0xa390	/* get settings from the DoubleTalk */
-#define DTLK_STATUS 0xa391	/* get status from the DoubleTalk */
-
-
-#define DTLK_CLEAR 0x18		/* stops speech */
-
-#define DTLK_MAX_RETRIES (loops_per_jiffy/(10000/HZ))
-
-	/* TTS Port Status Flags */
-#define TTS_READABLE     0x80	/* mask for bit which is nonzero if a
-				   byte can be read from the TTS port */
-#define TTS_SPEAKING     0x40	/* mask for SYNC bit, which is nonzero
-				   while DoubleTalk is producing
-				   output with TTS, PCM or CVSD
-				   synthesizers or tone generators
-				   (that is, all but LPC) */
-#define TTS_SPEAKING2    0x20	/* mask for SYNC2 bit,
-				   which falls to zero up to 0.4 sec
-				   before speech stops */
-#define TTS_WRITABLE     0x10	/* mask for RDY bit, which when set to
-             			   1, indicates the TTS port is ready
-             			   to accept a byte of data.  The RDY
-             			   bit goes zero 2-3 usec after
-             			   writing, and goes 1 again 180-190
-             			   usec later. */
-#define TTS_ALMOST_FULL  0x08	/* mask for AF bit: When set to 1,
-				   indicates that less than 300 free
-				   bytes are available in the TTS
-				   input buffer. AF is always 0 in the
-				   PCM, TGN and CVSD modes. */
-#define TTS_ALMOST_EMPTY 0x04	/* mask for AE bit: When set to 1,
-				   indicates that less than 300 bytes
-				   of data remain in DoubleTalk's
-				   input (TTS or PCM) buffer. AE is
-				   always 1 in the TGN and CVSD
-				   modes. */
-
-	/* LPC speak commands */
-#define LPC_5220_NORMAL 0x60	/* 5220 format decoding table, normal rate */
-#define LPC_5220_FAST 0x64	/* 5220 format decoding table, fast rate */
-#define LPC_D6_NORMAL 0x20	/* D6 format decoding table, normal rate */
-#define LPC_D6_FAST 0x24	/* D6 format decoding table, fast rate */
-
-	/* LPC Port Status Flags (valid only after one of the LPC
-           speak commands) */
-#define LPC_SPEAKING     0x80	/* mask for TS bit: When set to 1,
-				   indicates the LPC synthesizer is
-				   producing speech.*/
-#define LPC_BUFFER_LOW   0x40	/* mask for BL bit: When set to 1,
-				   indicates that the hardware LPC
-				   data buffer has less than 30 bytes
-				   remaining. (Total internal buffer
-				   size = 4096 bytes.) */
-#define LPC_BUFFER_EMPTY 0x20	/* mask for BE bit: When set to 1,
-				   indicates that the LPC data buffer
-				   ran out of data (error condition if
-				   TS is also 1).  */
-
-				/* data returned by Interrogate command */
-struct dtlk_settings
-{
-  unsigned short serial_number;	/* 0-7Fh:0-7Fh */
-  unsigned char rom_version[24]; /* null terminated string */
-  unsigned char mode;		/* 0=Character; 1=Phoneme; 2=Text */
-  unsigned char punc_level;	/* nB; 0-7 */
-  unsigned char formant_freq;	/* nF; 0-9 */
-  unsigned char pitch;		/* nP; 0-99 */
-  unsigned char speed;		/* nS; 0-9 */
-  unsigned char volume;		/* nV; 0-9 */
-  unsigned char tone;		/* nX; 0-2 */
-  unsigned char expression;	/* nE; 0-9 */
-  unsigned char ext_dict_loaded; /* 1=exception dictionary loaded */
-  unsigned char ext_dict_status; /* 1=exception dictionary enabled */
-  unsigned char free_ram;	/* # pages (truncated) remaining for
-                                   text buffer */
-  unsigned char articulation;	/* nA; 0-9 */
-  unsigned char reverb;		/* nR; 0-9 */
-  unsigned char eob;		/* 7Fh value indicating end of
-                                   parameter block */
-  unsigned char has_indexing;	/* nonzero if indexing is implemented */
-};
-- 
2.43.0

