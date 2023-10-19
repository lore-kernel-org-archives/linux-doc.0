Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44ED414F6D
	for <linux-doc@vger.kernel.org>; Thu, 19 Oct 2023 09:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DAEA18D
	for <linux-doc@vger.kernel.org>; Thu, 19 Oct 2023 02:46:50 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:2008:f423:365a:a88b])
	by andre.telenet-ops.be with bizsmtp
	id zlml2A0071ooZrg01lmlUF; Thu, 19 Oct 2023 11:46:47 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1qtPc0-006w32-Vm;
	Thu, 19 Oct 2023 11:46:45 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1qtPc5-00D4Zv-9M;
	Thu, 19 Oct 2023 11:46:45 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Jonathan Corbet <corbet@lwn.net>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Paul Gortmaker <paul.gortmaker@windriver.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-doc@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/2] sh: bios: Revive earlyprintk support
Date: Thu, 19 Oct 2023 11:46:43 +0200
Message-Id: <c40972dfec3dcc6719808d5df388857360262878.1697708489.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697708489.git.geert+renesas@glider.be>
References: <cover.1697708489.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SuperH BIOS earlyprintk code is protected by CONFIG_EARLY_PRINTK.
However, when this protection was added, it was missed that SuperH no
longer defines an EARLY_PRINTK config symbol since commit
e76fe57447e88916 ("sh: Remove old early serial console code V2"), so
BIOS earlyprintk can no longer be used.

Fix this by reviving the EARLY_PRINTK config symbol.

Fixes: d0380e6c3c0f6edb ("early_printk: consolidate random copies of identical code")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/sh/Kconfig.debug | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/sh/Kconfig.debug b/arch/sh/Kconfig.debug
index c449e7c1b20ff5b5..8bcd6c1431a95be9 100644
--- a/arch/sh/Kconfig.debug
+++ b/arch/sh/Kconfig.debug
@@ -22,6 +22,17 @@ config STACK_DEBUG
 	  every function call and will therefore incur a major
 	  performance hit. Most users should say N.
 
+config EARLY_PRINTK
+	bool "Early printk"
+	depends on SH_STANDARD_BIOS
+	help
+	  Say Y here to redirect kernel printk messages to the serial port
+	  used by the SH-IPL bootloader, starting very early in the boot
+	  process and ending when the kernel's serial console is initialised.
+	  This option is only useful while porting the kernel to a new machine,
+	  when the kernel may crash or hang before the serial console is
+	  initialised.  If unsure, say N.
+
 config 4KSTACKS
 	bool "Use 4Kb for kernel stacks instead of 8Kb"
 	depends on DEBUG_KERNEL && (MMU || BROKEN) && !PAGE_SIZE_64KB
-- 
2.34.1

