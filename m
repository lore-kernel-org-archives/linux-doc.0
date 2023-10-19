Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E827F15ADA
	for <linux-doc@vger.kernel.org>; Thu, 19 Oct 2023 09:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D98B18B
	for <linux-doc@vger.kernel.org>; Thu, 19 Oct 2023 02:46:50 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:2008:f423:365a:a88b])
	by michel.telenet-ops.be with bizsmtp
	id zlml2A00J1ooZrg06lmlMP; Thu, 19 Oct 2023 11:46:47 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1qtPc0-006w31-Vm;
	Thu, 19 Oct 2023 11:46:45 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1qtPc5-00D4Zs-7l;
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
Subject: [PATCH 0/2] sh: Revive BIOS earlyprintk support
Date: Thu, 19 Oct 2023 11:46:42 +0200
Message-Id: <cover.1697708489.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi all,

SuperH BIOS earlyprintk support was accidently disabled.
This series revives it, and records its existence in the documentation.

This was tested on landisk using "earlyprintk=bios" and
"earlyprintk=bios,keep".

Thanks for your comments!

Geert Uytterhoeven (2):
  sh: bios: Revive earlyprintk support
  Documentation: kernel-parameters: Add earlyprintk=bios on SH

 Documentation/admin-guide/kernel-parameters.txt |  3 +++
 arch/sh/Kconfig.debug                           | 11 +++++++++++
 2 files changed, 14 insertions(+)

-- 
2.34.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
