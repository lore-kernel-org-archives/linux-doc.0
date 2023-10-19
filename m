Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E82B4171DE
	for <linux-doc@vger.kernel.org>; Thu, 19 Oct 2023 09:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D7E310F
	for <linux-doc@vger.kernel.org>; Thu, 19 Oct 2023 02:46:50 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:2008:f423:365a:a88b])
	by michel.telenet-ops.be with bizsmtp
	id zlml2A00H1ooZrg06lmlMN; Thu, 19 Oct 2023 11:46:47 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1qtPc1-006w34-0Y;
	Thu, 19 Oct 2023 11:46:45 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1qtPc5-00D4Zy-An;
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
Subject: [PATCH 2/2] Documentation: kernel-parameters: Add earlyprintk=bios on SH
Date: Thu, 19 Oct 2023 11:46:44 +0200
Message-Id: <febc920964f2f0919d21775132e84c5cc270177e.1697708489.git.geert+renesas@glider.be>
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

Document the use of the "earlyprintk=bios[,keep]" kernel parameter
option on SuperH systems with a SuperH standard BIOS.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/admin-guide/kernel-parameters.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 657bb0b54e2fc6cf..8e7f6be051a0e1d3 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -1331,6 +1331,7 @@
 			earlyprintk=dbgp[debugController#]
 			earlyprintk=pciserial[,force],bus:device.function[,baudrate]
 			earlyprintk=xdbc[xhciController#]
+			earlyprintk=bios
 
 			earlyprintk is useful when the kernel crashes before
 			the normal console is initialized. It is not enabled by
@@ -1361,6 +1362,8 @@
 
 			The sclp output can only be used on s390.
 
+			The bios output can only be used on SuperH.
+
 			The optional "force" to "pciserial" enables use of a
 			PCI device even when its classcode is not of the
 			UART class.
-- 
2.34.1

