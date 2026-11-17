Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794951705;
	b=ekTHT5TedWyXRIp/c5deS2wcIkdPOSiJNO6BmH82amEApalK51N61vzo5FtKp+a7Si4K
	 S9aZKgaUdPIJeswNnfkN3xuJe0rGluen1U/ugq3N8w4lYP9c1oFzSqfPrduLev72pyWaE
	 hkNjps5gifIS+pCGRI85B3jT4Xh7vBUB8OSkQigm0YUuKFZ7ZCE25bSwPx4p35BeVdDYm
	 3/KOo0hlTGT2MdTInvKE9Z9VYrXJFS3wATDc16aLwss0GSdC5RXQTkSFXh/2gInMyycoL
	 eOo3uzMlB9YhwviQKlfBM8RAvnyXG5xXIrw55PwIpMsB91g9leqjyPOb8PxYU6GRVfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794951705;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cM8zYdFhYY7QMWD01wtMfnMSvgeVrmpAogUxeL6zgEY=;
	b=nk6qCiiR4XZWXbInoUnuxrQgBguJCSFGuUWYZj5Rxkl4NnQzCZAFcaJfyulj59QU3FwZ
	 fwFHwthV7a9NRC1RHBoqy9/1ThtrugwN7et59Sfgn6DnXRQzv/KUf0gfWnsefdVUK+7GG
	 uKgoER+Z7y8aq88mJnhAYC3X9JJ+5zv/2Q7usSPLjd3urCymhnI6QfHTK+Jv6XS7i3D9K
	 pC17bS5StBYQOpq0jgKhbXQKV9CxR7pqSuu610m3xjKQdFvQfRy7Se2Gp38Q5e+0dJHsD
	 ZXx9hNz4OQrkj4XSqIOOKWwRyIUOsA0yjWHaEmEkvAydFublJrD6vgWVo9j9p8qp69w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UCczWXoE;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F51D606A32A
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 21:41:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F51D606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UCczWXoE
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4a5506f09f5so155797f8f.0
        for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 13:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794951704; x=1795556504; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cM8zYdFhYY7QMWD01wtMfnMSvgeVrmpAogUxeL6zgEY=;
        b=UCczWXoEHF8KuF/aQ0hYm3w8jn3hiG90ZxdiLdSK8ze14XYx6sBcQmMd5Jm0qIveIz
         U4XFFxLOiEJGN1CwBBkvGenQWxhDj4YUk1oOkUHV4wHpZT+AMnumb1+mtCWB/qlUJqbJ
         hjQDQBOQN2Nwrco0ESz84VDuipfAdIbqQ+Yk9KMbGRHJNlwkJK3g0Umre961Xx2l29NS
         i+obFc80Roui6tK5buwYTtnL/SwO+6UVzIQ8qgCQSqxW87QI+PhM+ahr3uRBl5LoPMBB
         uaGNREfEZq/eSpypYk/RxKc9CPf1QneNvwRwN0/Kh6pZyoHckwfecChLnLsUL17x/0y2
         zEmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794951704; x=1795556504;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cM8zYdFhYY7QMWD01wtMfnMSvgeVrmpAogUxeL6zgEY=;
        b=p0mnZNKruX3JjVpj+UxrdQCst/KUtD24Pv3+aoeyLaIPRA9BUK5hdIPCmrX80J0R9r
         fOmOBUxi2AqMpiu8o/d4/Ur1yFlAz+tGpaBGwUTq7iB0QvXg0fQhRAYEurhH+nA8PO5N
         ZI9fKLftJAtPY17AaToRKlqU4isIMMAPYSfvnOW5zObpTXKyEkVqswxzil/6K3AxtbRE
         Jz1LZ4E0DDkjFdpAEYDJbxIdZtdQ4Xv4+jfAIsnpWPA/bL5I7I7xkI2KWQNYZ0krDHxk
         QILT0WVfzUeO5m2pZGnt/6RxSbFCKSrZdShMNLJRVX/xut1NGpJ2zgQ94hH72+gL4Fq4
         1/fg==
X-Forwarded-Encrypted: i=1; AL+hErFI3rs4XFBQG4rvoTo2zErIGLzyu0HmT78HBC2NAwXGri1mj/JdxGNPJC1ilN5aa2KL2qKNMCDoYIs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ATWry2ibQX/uG6ukD7IqSaSrZW6pFAAoyQkV4E6fbbCN26Y4g
	2UPe9rdYBUrEihfwWtTGKCjqMTBknPFbfZtfmp6TgydEqdz4QAEV6cX8
X-Gm-Gg: AZFdTZee2tTPQ8X4LNMrIs4rgUHCMUrZdSym3KtkzOxQWc2uMgu/RPgwoW+bkI9sQVt
	lA/SPCrqcMU8VJlYTkc0dHFMhsj7BRVmMtXf2WmLZrF9/LltKWSare1uD5F1vY238u9d6vXAGYV
	K6NOZQlpaP2LTjCxxJiHlLDQ1eC0FW6zW+7piIhgSSEt+c+/jG1uYyx88slEHAdVknfP6FTiBXN
	Fd/IPbBoIpxF64uFiPWTlb1daSZZxdYWwt6211uE9Sw6z6YzSA6yDFImz6+EYO7Nms5PGu0nn+C
	gI7IqwjN8deOFkw1a9zWBtVk4llChBfJzERTO3/U0q+H2tZbURsNFbhrEriLziabv3EX8sD6ZeD
	OYZsw160+JIsitpX3AlQovM1Oun4OaBimTiKMziSM0RCkKxDpj5JKfy1vw6ChDsjNXEsq2xWuiV
	EC27GqWNyvtFJhe4K2J2fP/CE3oxjXBLJYDkFFy2hBkGLr6gEW7G2l3AulPz3LjC1c6CW1LpzAN
	jaNQtq8MDTcmBgp3WtqrzMH2gbChGXm9ut1Md1zIxeqE1PUk2VYp7OEMxZbrC/OnUe6JULw7NZQ
	UG4HG+IJa2PuTTGl79ipqq+Ie8cRguLFCututVE1Rws/bgBNMhMWccwEQzn0fRX02O0ecIJ1s0n
	sh1m1/K+UmJmV2Rmt78FGOmyHau6NWyuC1OY36gCitrNQDBvA
X-Received: by 2002:a05:6000:2798:b0:48d:f99d:a0d3 with SMTP id ffacd0b85a97d-4a63b137aa8mr951124f8f.46.1794951703521;
        Tue, 17 Nov 2026 13:41:43 -0800 (PST)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65560b5f1sm978391f8f.21.2026.11.17.13.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 13:41:42 -0800 (PST)
From: Orgad Shaneh <orgads@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	tsbogend@alpha.franken.de
Cc: linux-mtd@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linusw@kernel.org,
	kaloz@kernel.org,
	ulli.kroll@googlemail.com,
	john@phrozen.org,
	nico@fluxnic.net,
	dwmw2@infradead.org,
	corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH v4 0/4] mtd: point() for cfi_cmdset_0002, on simple maps only
Date: Tue, 17 Nov 2026 21:41:37 +0000
Message-ID: <20261117214141.3826637-1-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
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

jffs2 scans a flash in place through mtd_point() when the chip driver
offers it, and copies every used eraseblock otherwise. cfi_cmdset_0002
has no point(), so an Octeon CN6635 board with a 100 MB jffs2
partition on an 8-bit M29EW spends 15-30 s mounting it at every boot.

1/4 lets point() through only for maps read through the simple
accessors; cfi_cmdset_0001, lpddr, map_ram and map_rom point today at
maps whose own accessors swap bytes, switch pins or lock the bus.
2/4 adds point() to cfi_cmdset_0002 behind that gate.
3/4 gives each Octeon flash device its own map.
4/4 lets that map use the simple accessors when no eMMC shares the
boot bus. 3/4 and 4/4 build alone, but 4/4 only pays off with 1/4 and
2/4, so taking all four through mtd with an ack from Thomas seems
simplest.

Tested on that board with 7.3.4: the mount drops to 0.55-0.6 s, and
an 8 MB file written to the jffs2 partition keeps its md5 across a
reboot. v3 held its md5s across ten 8 MB write/delete rounds on 7.2.9.
The series applies to v7.4-rc1.

One question: a cramfs on AMD flash falls back to the block device
today. After 2/4 it keeps its image pointed while mounted, as it does
on Intel flash, so jffs2 writes to the same chip wait until cramfs is
unmounted. Is that acceptable, or should point() in cfi_cmdset_0002
be opt-in?

Changes in v4:
- 1/4 also gates lpddr, map_ram and map_rom (compile-tested only).
- New 3/4: the per-device map sashiko asked for on v2 and v3.
- Rebased onto v7.4-rc1; Assisted-by dropped (an LLM helped write
  this series).

Earlier changes, in v4 numbering:
- v3: in 2/4, an XIP erase no longer lets a point through either.
- v2: in 2/4, a point no longer suspends an erase in progress; 4/4
  checks the bank width before ioremap().

v3: https://lore.kernel.org/all/20261011062908.2365879-1-orgads@gmail.com/
v2: https://lore.kernel.org/all/20261010180840.2152492-1-orgads@gmail.com/
v1: https://lore.kernel.org/all/20261010172142.2138956-1-orgads@gmail.com/

Orgad Shaneh (4):
  mtd: maps: only point() maps read through the simple accessors
  mtd: cfi_cmdset_0002: implement point() for simple linear maps
  MIPS: Octeon: flash: allocate the map per device
  MIPS: Octeon: flash: use the simple map accessors without a shared eMMC

  Documentation/filesystems/cramfs.rst  |  11 ++-
  arch/mips/cavium-octeon/flash_setup.c |  73 +++++++++++----
  drivers/mtd/chips/cfi_cmdset_0001.c   |   2 +-
  drivers/mtd/chips/cfi_cmdset_0002.c   | 167 +++++++++++++++++++++++++++++++++-
  drivers/mtd/chips/map_ram.c           |   4 +-
  drivers/mtd/chips/map_rom.c           |   6 +-
  drivers/mtd/lpddr/lpddr_cmds.c        |   2 +-
  drivers/mtd/maps/map_funcs.c          |  12 +++
  include/linux/mtd/map.h               |   2 +
  9 files changed, 245 insertions(+), 34 deletions(-)

-- 
2.53.0

