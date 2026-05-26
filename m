Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0051436379;
	Tue, 26 May 2026 14:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779807453; cv=none; b=s4he9/kfy2wnexK/LmCvimDbItleycFy3QVV9rdHbFqkCS+ndJMs5Xcyt9fDVGY/ZFAI9N9p3RC7FP0UzhP5DQK2aJXFJFHe5J6ez3hgpDFjUsvCxCWqjkntCoL/WfY/Glx9EeY9gkzSWctcHIowre617mEOLwkOrgkyB4PXvD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779807453; c=relaxed/simple;
	bh=U9l8kxLSbgBbyMir5hWaLCDPKJTvEDDH62/44KgUWu0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bbH+vOB9fDZtJ8sZvulNwzsOrDRE8kZ8JIO+1WPXFnwXsXUKFZ3v6SPBhMfd0no+t+ZXrcjA9foxiwnKb+ROL5zmxiwQWA9KXwY+vdZvvruxuflyuTO2RFhTn2ix+L0bO5Yu0gjO/f2uX/+LLUzhftOptcXnAf4vwCjtKEskINg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=KT+bv3ca; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="KT+bv3ca"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 6D01D4E42D60;
	Tue, 26 May 2026 14:57:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4278C6011D;
	Tue, 26 May 2026 14:57:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D9409108888D6;
	Tue, 26 May 2026 16:57:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779807449; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Br7XZk+SdOFgqMIoKmVyiUlnoijvY+FS2R84aZnT0Sw=;
	b=KT+bv3caa9mJrrCzCYAiytPiUCkjy5ClOYMRrLaQll4/J73fDbnrL6rfH8bM13uaYP2OzY
	7TSU9IoHLj0JJWczku51ZrHO+aWS6GpRzYTVbTVKBmFMY5R1hj922TNbyxNYCgjkLUde1t
	giZTXHsorMuZP5zeaIuKytclRKVIZEnGB8Ndn0Z7E29lH7r1pCnKVcjin/ycrJIoK5uXIl
	MyuNdIaxu06xlCUCN8/eEw6ehzK+X1qushRfyoPwOqr8zswAVUYeXp+OQchQ3+XzkwUfgr
	Gt/D9dbcSBeELFUzj/S8c2ILvikuoDT1z+DPIJI/bsjeFk+XotSjF++Dw7PhJw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 26 May 2026 16:56:46 +0200
Subject: [PATCH v6 22/28] mtd: spi-nor: Add steps for testing locking with
 CMP
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-winbond-v6-18-rc1-spi-nor-swp-v6-22-4092f1419f8f@bootlin.com>
References: <20260526-winbond-v6-18-rc1-spi-nor-swp-v6-0-4092f1419f8f@bootlin.com>
In-Reply-To: <20260526-winbond-v6-18-rc1-spi-nor-swp-v6-0-4092f1419f8f@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Jonathan Corbet <corbet@lwn.net>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: Sean Anderson <sean.anderson@linux.dev>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

Extend the test coverage by giving guidelines to verify the CMP bit acts
according to our expectations.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
The instructions listed in this file target people adding support for
new chips, however here are below extra steps that I also ran with the
same W25H512NWxxAM chip. They are here to prove core correctness.

    $ flash_lock -u /dev/mtd0
    $ flash_lock -l /dev/mtd0 0 1008
    $ show_sectors
    software locked sectors
     region (in hex)   | status   | #sectors
     ------------------+----------+---------
     00000000-03efffff |   locked | 1008
     03f00000-03ffffff | unlocked | 16
    $ flash_lock -l /dev/mtd0 0 1009
    $ show_sectors # should not change
    software locked sectors
     region (in hex)   | status   | #sectors
     ------------------+----------+---------
     00000000-03efffff |   locked | 1008
     03f00000-03ffffff | unlocked | 16
    $ flash_lock -l /dev/mtd0 0 1015
    $ show_sectors # should not change
    software locked sectors
     region (in hex)   | status   | #sectors
     ------------------+----------+---------
     00000000-03efffff |   locked | 1008
     03f00000-03ffffff | unlocked | 16
    $ flash_lock -l /dev/mtd0 0 1016
    $ show_sectors # should cover more
    software locked sectors
     region (in hex)   | status   | #sectors
     ------------------+----------+---------
     00000000-03f7ffff |   locked | 1016
     03f80000-03ffffff | unlocked | 8
    $ flash_lock -u /dev/mtd0 $((1015 * $bs)) 1
    $ show_sectors # should not change
    software locked sectors
     region (in hex)   | status   | #sectors
     ------------------+----------+---------
     00000000-03f7ffff |   locked | 1016
     03f80000-03ffffff | unlocked | 8
    $ flash_lock -u /dev/mtd0 $((1009 * $bs)) 7
    $ show_sectors # should not change
    software locked sectors
     region (in hex)   | status   | #sectors
     ------------------+----------+---------
     00000000-03f7ffff |   locked | 1016
     03f80000-03ffffff | unlocked | 8
    $ flash_lock -u /dev/mtd0 $((1008 * $bs)) 8
    $ show_sectors # range should reduce down to initial value
    software locked sectors
     region (in hex)   | status   | #sectors
     ------------------+----------+---------
     00000000-03efffff |   locked | 1008
     03f00000-03ffffff | unlocked | 16

    [Similar situations, on the other side of the device]

    $ flash_lock -u /dev/mtd0
    $ flash_lock -l /dev/mtd0 $((16 * $bs)) 1008
    $ show_sectors
    software locked sectors
     region (in hex)   | status   | #sectors
     ------------------+----------+---------
     00000000-000fffff | unlocked | 16
     00100000-03ffffff |   locked | 1008
    $ flash_lock -l /dev/mtd0 $((15 * $bs)) 1009
    $ show_sectors # should not change
    software locked sectors
     region (in hex)   | status   | #sectors
     ------------------+----------+---------
     00000000-000fffff | unlocked | 16
     00100000-03ffffff |   locked | 1008
    $ flash_lock -l /dev/mtd0 $((9 * $bs)) 1015
    $ show_sectors # should not change
    software locked sectors
     region (in hex)   | status   | #sectors
     ------------------+----------+---------
     00000000-000fffff | unlocked | 16
     00100000-03ffffff |   locked | 1008
    $ flash_lock -l /dev/mtd0 $((8 * $bs)) 1016
    $ show_sectors # should cover more
    software locked sectors
     region (in hex)   | status   | #sectors
     ------------------+----------+---------
     00000000-0007ffff | unlocked | 8
     00080000-03ffffff |   locked | 1016
    $ flash_lock -u /dev/mtd0 $((8 * $bs)) 1
    $ show_sectors # should not change
    software locked sectors
     region (in hex)   | status   | #sectors
     ------------------+----------+---------
     00000000-0007ffff | unlocked | 8
     00080000-03ffffff |   locked | 1016
    $ flash_lock -u /dev/mtd0 $((8 * $bs)) 7
    $ show_sectors # should not change
    software locked sectors
     region (in hex)   | status   | #sectors
     ------------------+----------+---------
     00000000-0007ffff | unlocked | 8
     00080000-03ffffff |   locked | 1016
    $ flash_lock -u /dev/mtd0 $((8 * $bs)) 8
    $ show_sectors # range should reduce down to initial value
    software locked sectors
     region (in hex)   | status   | #sectors
     ------------------+----------+---------
     00000000-000fffff | unlocked | 16
     00100000-03ffffff |   locked | 1008
---
 Documentation/driver-api/mtd/spi-nor.rst | 37 ++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/Documentation/driver-api/mtd/spi-nor.rst b/Documentation/driver-api/mtd/spi-nor.rst
index 9cc7e4b2c809..f906e597a9a4 100644
--- a/Documentation/driver-api/mtd/spi-nor.rst
+++ b/Documentation/driver-api/mtd/spi-nor.rst
@@ -335,3 +335,40 @@ section, after the ``---`` marker.
      ------------------+----------+---------
      00000000-0000ffff |   locked | 1
      00010000-03ffffff | unlocked | 1023
+
+   If the flash features a Complement (CMP) bit, we can protect with
+   more granularity above half of the capacity. Let's lock all but one
+   block, then unlock one more block::
+
+    root@1:~# all_but_one=$((($size / $bs) - ($ss / $bs)))
+
+    root@1:~# flash_lock -u /dev/mtd0
+    root@1:~# flash_lock -l /dev/mtd0 $ss $all_but_one # all but the first
+    root@1:~# show_sectors
+    software locked sectors
+     region (in hex)   | status   | #sectors
+     ------------------+----------+---------
+     00000000-0000ffff | unlocked | 1
+     00010000-03ffffff |   locked | 1023
+    root@1:~# flash_lock -u /dev/mtd0 $ss $(($ss / $bs)) # all but the two first
+    root@1:~# show_sectors
+    software locked sectors
+     region (in hex)   | status   | #sectors
+     ------------------+----------+---------
+     00000000-0001ffff | unlocked | 2
+     00020000-03ffffff |   locked | 1022
+    root@1:~# flash_lock -u /dev/mtd0
+    root@1:~# flash_lock -l /dev/mtd0 0 $all_but_one # same from the other side
+    root@1:~# show_sectors
+    software locked sectors
+     region (in hex)   | status   | #sectors
+     ------------------+----------+---------
+     00000000-03feffff |   locked | 1023
+     03ff0000-03ffffff | unlocked | 1
+    root@1:~# flash_lock -u /dev/mtd0 $(($size - (2 * $ss))) $(($ss / $bs)) # all but two
+    root@1:~# show_sectors
+    software locked sectors
+     region (in hex)   | status   | #sectors
+     ------------------+----------+---------
+     00000000-03fdffff |   locked | 1022
+     03fe0000-03ffffff | unlocked | 2

-- 
2.53.0

