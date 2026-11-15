Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.106
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794746811;
	b=z46s1sz95lhNKmT79cQUFZcMsQpyfeaE0n9tylsRnuD3rLLWkslkfyXyp3Qb62lzurM/
	 EkAxcr08gX2ACSGsAwS5CO6fsaNnB/0swmCvYTWwsPhp8dsFVoUgFCIdrSFk/WB/JOUOA
	 KLwjwq1HjDMaPb4q00bUflEQDvPs2W80BqmcqiZCxOB0+2aHcO2p+g3fy0B6T7ZC2KeZd
	 RKfCIw6vxDFQYpGqBie1Gwx0zg65zbThU6D5rz8EZo6TdqGoGnE6NN4W3PFv6FX+QilTQ
	 7SP35xhs1z/UsvPLLaQvboXln43ntrHfQELS3mCh1Wr7p0xmqq4sfg03LUVOTRivMzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794746811;
	h=DMARC-Filter:DKIM-Signature:X-Pm-Submission-Id:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=BF7Nl85Bxr5Zh4rYOV9vowwj1g8iWevEqtUlRpb404k=;
	b=u0gJ7BVaVJgbbpMvdm6NcjBQ8iQ0dOVP7HdDY+noL8RhF4bddKraDjydar9LFA7cmVks
	 gdMlO7+7VW5xWG1Ld582443R2r8JbNN/rEx6iEG3rq5yHbFh0YlHhpZhgDp/mK6DEhDFn
	 pmYqgLRDzTWGejneqEjRSzahdTj9QOTePU0Zt/qFngU1esiE59BtTPv9iEvj9zGA8XOUL
	 mjvBuFK4rMdtjjRx27HqopEeLQAg3+CsjvTN89FjMbJjyZOm/Neirfn/WVPDdhSlcwA5Q
	 S6mRUfIFEAHgu5mu4dNIzqRjC6/SoajcvZQys35/sox0q8U6dv+iQbP1bc1c57UU3Gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ianghel.com;
	spf=pass smtp.mailfrom=ianghel.com;
	dkim=pass header.d=ianghel.com header.i=@ianghel.com header.a=rsa-sha256 header.s=protonmail header.b=r7LdfQ+w;
	arc=none smtp.remote-ip=109.224.244.106
Received: from mail-244106.protonmail.ch (mail-244106.protonmail.ch [109.224.244.106])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8860B606A31E
	for <linux-doc@vger.kernel.org>; Sun, 15 Nov 2026 12:46:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8860B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ianghel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ianghel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ianghel.com header.i=@ianghel.com header.a=rsa-sha256 header.s=protonmail header.b=r7LdfQ+w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ianghel.com;
	s=protonmail; t=1794746806; x=1795006006;
	bh=BF7Nl85Bxr5Zh4rYOV9vowwj1g8iWevEqtUlRpb404k=;
	h=From:To:Cc:Subject:Date:Message-ID:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=r7LdfQ+wdY9rdSvq2nNEMDn26OubSpJg91R2Ej5FCjTtSqSfKwB1rCMI03ae18Up9
	 ehJnD62GiJt/wTHmlYypbP1BGtrAuLjlTwgcfaP/f+6VEybcIuGMjktSif+Oy+2vsu
	 c6n7NOtaoczPyyNPKRtqHfhutEO13SbR4h139uD8Wv0xASja4HS7Xnaflt3iLNDv9e
	 92SiDLL4AWKn2IJJzhQu90/TeAyqd32MYmryZqLDEfaMFlzHtqwZ1A4RjX8Ng/udbu
	 UWEFCpVK7W+gkBD6/AaOdAfKrZ9le9B9QkDk9lnqUJBXX/XNx62HyhK/WSEYdWxwNh
	 vMUcegodY8H9g==
X-Pm-Submission-Id: 4jS9jc0btfz1DDLT
From: Anghel Mihai-Alexandru <mih@ianghel.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org
Cc: Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Anghel Mihai-Alexandru <mih@ianghel.com>
Subject: [PATCH] Documentation: thinkpad-acpi: fix backlight power attribute name
Date: Sun, 15 Nov 2026 14:46:42 +0200
Message-ID: <20261115124642.983197-1-mih@ianghel.com>
X-Mailer: git-send-email 2.54.0
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sysfs notes called the thinkpad_screen attribute "power". The
generic backlight class names it "bl_power", so the docs now use that
name and describe its values (0 on, 4 off). The intro now points to
the backlight class documentation instead of saying it is poorly
documented.

AI-assisted: Claude Sonnet 5.5 and Claude Haiku 5.5.
Signed-off-by: Anghel Mihai-Alexandru <mih@ianghel.com>
---
 .../admin-guide/laptops/thinkpad-acpi.rst     | 29 ++++++++++++-------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/Documentation/admin-guide/laptops/thinkpad-acpi.rst b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
index db4588af0278..f6377fad3aa0 100644
--- a/Documentation/admin-guide/laptops/thinkpad-acpi.rst
+++ b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
@@ -1066,8 +1066,9 @@ The available commands are::
 Sysfs notes
 ^^^^^^^^^^^
 
-The interface is implemented through the backlight sysfs class, which is
-poorly documented at this time.
+The interface is implemented through the backlight sysfs class.  See
+Documentation/gpu/backlight.rst and
+Documentation/ABI/stable/sysfs-class-backlight for details.
 
 Locate the thinkpad_screen device under /sys/class/backlight, and inside
 it there will be the following attributes:
@@ -1082,17 +1083,23 @@ it there will be the following attributes:
 	brightness:
 		Writes request the driver to change brightness to the
 		given value.  Reads will tell you what brightness the
-		driver is trying to set the display to when "power" is set
-		to zero and the display has not been dimmed by a kernel
+		driver is trying to set the display to when "bl_power" is
+		zero and the display has not been dimmed by a kernel
 		power management event.
 
-	power:
-		power management mode, where 0 is "display on", and 1 to 3
-		will dim the display backlight to brightness level 0
-		because thinkpad-acpi cannot really turn the backlight
-		off.  Kernel power management events can temporarily
-		increase the current power management level, i.e. they can
-		dim the display.
+	bl_power:
+		Backlight power management mode, provided by the generic
+		backlight class.  0 (BACKLIGHT_POWER_ON) turns the display
+		on, and 4 (BACKLIGHT_POWER_OFF) powers the display down;
+		the driver decides how to blank the output.  1
+		(BACKLIGHT_POWER_REDUCED) is deprecated.  Any other
+		non-zero value is also treated as blank.  Kernel power
+		management events can temporarily blank the display.
+
+		thinkpad-acpi gets its brightness from
+		backlight_get_brightness(), which yields zero while the
+		display is blank, so the backlight level is set to zero
+		in that case.
 
 
 WARNING:
-- 
2.54.0

