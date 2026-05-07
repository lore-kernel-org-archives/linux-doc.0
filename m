Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0096448035F;
	Thu,  7 May 2026 16:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778172458; cv=none; b=tgI7ZMxVppEV1g9lpAH5NiKtubACGBu6shw74Jc58+86EutqJ5jkf8bDCnxD6eRm+QRK88lHsAnGUYMqW2m+ZHoBCStm2yrbtAnTo4UfTGcSfZJW8hVGMe/UsQIH+2w0HnUhQ1Dw95NiMEghfG918qxJ0WcUscUHCGDEYXMuyzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778172458; c=relaxed/simple;
	bh=KkFHfbzf78CjeSvH4PpWgZ1YKz3MD7IvCuLnisx/0Y4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M0RUSJ06euf5MgFNEp0ioq5SepqSFTo2cN/ldaHmK2dMimyQdYd4moC6CnWD5NWyOn1P1sHHWYS8OrmTDuNlO/GhHwyHOEsxJZQ6SBjRfwKFVWc7qXTxpssaiPyYt4O75VJxOfp0WOs92EzblQAvLsyyQ8Mjd/pExtxP5jTn07k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=V79yClZ0; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="V79yClZ0"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id AF5124E42C37;
	Thu,  7 May 2026 16:47:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7A4BB605CF;
	Thu,  7 May 2026 16:47:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 31299108194ED;
	Thu,  7 May 2026 18:47:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778172454; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=yhA+2VgT+o8G4u2gJrAlTlAd70E3ujcNCL/mf5Wc020=;
	b=V79yClZ0ondZxWahZNR19BLo5lhNx3GWoRvbgMVf/jShRbtdrsRPvYz08hI6AxCxdwZL8k
	xDAoSKO7TIC3LMrVA6I1NyRXRKKRVLYVm/nS+RT0S0n+n1kqQ+x5qWNe9Fh1B93PGWldmR
	/CrAVfZTMWi0K2S+XrDdC3cOloI+exKo6uHuBdqPWD2o2ogyewJnBqalQ1qr5Nj7bLqvtF
	RZUHyuyrQVBEIt5k8Yssc95AiHFA0UbN+v8qHXDw/GmSAwrVyKe2wz0W5I24kg7hV/HRv5
	wT7I+7GqSkvww4OtQZj1F9rnEaYiOudQafbykExnPYbQ6ZxczcZKqpvK66AYKg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 07 May 2026 18:47:03 +0200
Subject: [PATCH v5 22/28] mtd: spi-nor: Add steps for testing locking with
 CMP
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-winbond-v6-18-rc1-spi-nor-swp-v5-22-93453e1a9597@bootlin.com>
References: <20260507-winbond-v6-18-rc1-spi-nor-swp-v5-0-93453e1a9597@bootlin.com>
In-Reply-To: <20260507-winbond-v6-18-rc1-spi-nor-swp-v5-0-93453e1a9597@bootlin.com>
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
index b42de32c6eba..896cff9c7675 100644
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

