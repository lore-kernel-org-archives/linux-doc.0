Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB0134678B
	for <linux-doc@vger.kernel.org>; Fri, 14 Nov 2025 17:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763142843; cv=none; b=hi8slmO1JBXK6TFBAOMCDRe8Ypx0OwJDzOdZTG2Fx/upKMkHfVCmLRrfg7t7hdjoaF2+lCUVoB7ygy8nMhscUk1FTLHSm/E9+IUTA05vJzRN4UZGJihfKizQS4VRULRKgSC+cP5nt6I+8dcRxRrzL+vkGNcMt8HA2pl5279MdY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763142843; c=relaxed/simple;
	bh=LECpL+34lUo5gv6Vw5d7tauDa2B8JxBSGA+IG+Eo7W8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=boX48wYSeK88B/eGkDZCBZqYkbN7M9vaLBqd3BbG7UIbgsFm9KvABRJ2MT5E0vn7jncxFbI0A8A/aCcoTMjooWr/TBUOt18Zekq4JSHzM1rRMdchn8WlvXtfA5xlVEruPRK9QEmF8rCRyUzuo01C71JxtnR2LO5dhyfHOY8/zIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=k1gnBFwP; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="k1gnBFwP"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 6C18B4E416BA;
	Fri, 14 Nov 2025 17:53:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2FF616060E;
	Fri, 14 Nov 2025 17:53:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 30EC3103719A2;
	Fri, 14 Nov 2025 18:53:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763142832; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=gbHlPo/urpEuGhl8aobjg6DeDbSRcy+KPKJUqpt9iT8=;
	b=k1gnBFwPNMt4gm/RK3FMGZNc07rAAR71s8EkPqTV0J5vcsvJF6q+J5FUQO8HKVXuNZGuVc
	W2EH6AP9YG2/oXsDt733f4WOKpIGiMyXHfbeyLSpcicGsCyO8SjS/c06ONZXfEsbdi834k
	CfPb8MzTrjTftlPvuPS/r3f5dvgizWeslqPmHqRKKLVFR/lycoylGfNzx3W7Ve5/Q7gJjI
	0YOG6Hahc4s8/MAgipiqNpBc+ewVw8/K30BgHgOrSU11xBlBZ6jsdMJNt619L8Kcf/QS38
	orucJh8eiUf3D41ekBze7wNawr5TXZ7aQnLhVBhMXYOTs0tWdLIvGfIRSAcnsg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 14 Nov 2025 18:53:19 +0100
Subject: [PATCH 18/19] mtd: spi-nor: Add steps for testing locking with CMP
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-winbond-v6-18-rc1-spi-nor-swp-v1-18-487bc7129931@bootlin.com>
References: <20251114-winbond-v6-18-rc1-spi-nor-swp-v1-0-487bc7129931@bootlin.com>
In-Reply-To: <20251114-winbond-v6-18-rc1-spi-nor-swp-v1-0-487bc7129931@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: Sean Anderson <sean.anderson@linux.dev>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.2
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
     region (in hex)   | status   | #blocks
     ------------------+----------+--------
     00000000-03efffff |   locked | 1008
     03f00000-03ffffff | unlocked | 16
    $ flash_lock -l /dev/mtd0 0 1009
    $ show_sectors # should not change
    software locked sectors
     region (in hex)   | status   | #blocks
     ------------------+----------+--------
     00000000-03efffff |   locked | 1008
     03f00000-03ffffff | unlocked | 16
    $ flash_lock -l /dev/mtd0 0 1015
    $ show_sectors # should not change
    software locked sectors
     region (in hex)   | status   | #blocks
     ------------------+----------+--------
     00000000-03efffff |   locked | 1008
     03f00000-03ffffff | unlocked | 16
    $ flash_lock -l /dev/mtd0 0 1016
    $ show_sectors # should cover more
    software locked sectors
     region (in hex)   | status   | #blocks
     ------------------+----------+--------
     00000000-03f7ffff |   locked | 1016
     03f80000-03ffffff | unlocked | 8
    $ flash_lock -u /dev/mtd0 $((1015 * $bs)) 1
    $ show_sectors # should not change
    software locked sectors
     region (in hex)   | status   | #blocks
     ------------------+----------+--------
     00000000-03f7ffff |   locked | 1016
     03f80000-03ffffff | unlocked | 8
    $ flash_lock -u /dev/mtd0 $((1009 * $bs)) 7
    $ show_sectors # should not change
    software locked sectors
     region (in hex)   | status   | #blocks
     ------------------+----------+--------
     00000000-03f7ffff |   locked | 1016
     03f80000-03ffffff | unlocked | 8
    $ flash_lock -u /dev/mtd0 $((1008 * $bs)) 8
    $ show_sectors # range should reduce down to initial value
    software locked sectors
     region (in hex)   | status   | #blocks
     ------------------+----------+--------
     00000000-03efffff |   locked | 1008
     03f00000-03ffffff | unlocked | 16

    [Similar situations, on the other side of the device]

    $ flash_lock -u /dev/mtd0
    $ flash_lock -l /dev/mtd0 $((16 * $bs)) 1008
    $ show_sectors
    software locked sectors
     region (in hex)   | status   | #blocks
     ------------------+----------+--------
     00000000-000fffff | unlocked | 16
     00100000-03ffffff |   locked | 1008
    $ flash_lock -l /dev/mtd0 $((15 * $bs)) 1009
    $ show_sectors # should not change
    software locked sectors
     region (in hex)   | status   | #blocks
     ------------------+----------+--------
     00000000-000fffff | unlocked | 16
     00100000-03ffffff |   locked | 1008
    $ flash_lock -l /dev/mtd0 $((9 * $bs)) 1015
    $ show_sectors # should not change
    software locked sectors
     region (in hex)   | status   | #blocks
     ------------------+----------+--------
     00000000-000fffff | unlocked | 16
     00100000-03ffffff |   locked | 1008
    $ flash_lock -l /dev/mtd0 $((8 * $bs)) 1016
    $ show_sectors # should cover more
    software locked sectors
     region (in hex)   | status   | #blocks
     ------------------+----------+--------
     00000000-0007ffff | unlocked | 8
     00080000-03ffffff |   locked | 1016
    $ flash_lock -u /dev/mtd0 $((8 * $bs)) 1
    $ show_sectors # should not change
    software locked sectors
     region (in hex)   | status   | #blocks
     ------------------+----------+--------
     00000000-0007ffff | unlocked | 8
     00080000-03ffffff |   locked | 1016
    $ flash_lock -u /dev/mtd0 $((8 * $bs)) 7
    $ show_sectors # should not change
    software locked sectors
     region (in hex)   | status   | #blocks
     ------------------+----------+--------
     00000000-0007ffff | unlocked | 8
     00080000-03ffffff |   locked | 1016
    $ flash_lock -u /dev/mtd0 $((8 * $bs)) 8
    $ show_sectors # range should reduce down to initial value
    software locked sectors
     region (in hex)   | status   | #blocks
     ------------------+----------+--------
     00000000-000fffff | unlocked | 16
     00100000-03ffffff |   locked | 1008
---
 Documentation/driver-api/mtd/spi-nor.rst | 36 ++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/Documentation/driver-api/mtd/spi-nor.rst b/Documentation/driver-api/mtd/spi-nor.rst
index d56ff5c42a98af23a65097c9b77cd20ef2504a49..e00ca19e7dd6cb3a118b81f8a1fe36470355fa42 100644
--- a/Documentation/driver-api/mtd/spi-nor.rst
+++ b/Documentation/driver-api/mtd/spi-nor.rst
@@ -321,3 +321,39 @@ section, after the ``---`` marker.
      ------------------+----------+--------
      00000000-0000ffff |   locked | 1
      00010000-03ffffff | unlocked | 1023
+
+   If the flash features a Complement (CMP) bit, we can protect with
+   more granularity above half of the capacity. Let's lock all but one
+   block, then unlock one more block::
+
+    root@1:~# all_but_one=$((($size / $bs) - 1))
+    root@1:~# flash_lock -u /dev/mtd0
+    root@1:~# flash_lock -l /dev/mtd0 $bs $all_but_one # all but the first
+    root@1:~# show_sectors
+    software locked sectors
+     region (in hex)   | status   | #blocks
+     ------------------+----------+--------
+     00000000-0000ffff | unlocked | 1
+     00010000-03ffffff |   locked | 1023
+    root@1:~# flash_lock -u /dev/mtd0 $bs 1 # all but the two first
+    root@1:~# show_sectors
+    software locked sectors
+     region (in hex)   | status   | #blocks
+     ------------------+----------+--------
+     00000000-0001ffff | unlocked | 2
+     00020000-03ffffff |   locked | 1022
+    root@1:~# flash_lock -u /dev/mtd0
+    root@1:~# flash_lock -l /dev/mtd0 0 $all_but_one # same from the other side
+    root@1:~# show_sectors
+    software locked sectors
+     region (in hex)   | status   | #blocks
+     ------------------+----------+--------
+     00000000-03feffff |   locked | 1023
+     03ff0000-03ffffff | unlocked | 1
+    root@1:~# flash_lock -u /dev/mtd0 $(($size - (2 * $bs))) 1 # all but two
+    root@1:~# show_sectors
+    software locked sectors
+     region (in hex)   | status   | #blocks
+     ------------------+----------+--------
+     00000000-03fdffff |   locked | 1022
+     03fe0000-03ffffff | unlocked | 2

-- 
2.51.0

