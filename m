Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795683551;
	b=AzRL57ocrh2XITMKpuUoZQ1A+G6mhtL+yH4cmg5UI7b7R6iL6B2cWqUvA7N+REUjgF/n
	 zY8WW1JGZ/g0Y9D0iZXg5WZIROEDxcjdxk2Pi5yoQ2j2o3JzZf1NtlX3VgJiY+bxx5PeY
	 S8t/ityhh5m2bIQtwcTq5NJy46IBkHYdGForI/p5cvmNqmf4e5vqjXl2HP9Op2AmhluCY
	 J3YwH+JBs5+ikxiKdMEXGEgOuAkhUI383pW/ubj/kh36BmWf2aXdZSsLm7K9deCUP/SnV
	 R9gLeKqnjFbVQTvexQ9OBLqNFW5R7ulDb++q6v63YYCIxqtVE8YVwL4yn3I4Fu6x7Wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795683551;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jQc/CTIKgLFqNg7/EqVB3eWhheGznFwlbWTqinE5lFo=;
	b=KQAlUFjN0bLn9qhKOXkVbbzDIr3Qfwq+MJxL7XKpiHOev2R/rWALezdpQW3dYxRzfBKP
	 c9rubE/L5DAsj1k+XBNKWH+a+WYxbK5b/Qq6VBIEIu3HxnqpkgbymUsL3CjMF2TH0X50e
	 fQGgQNhxuIp26TQQAU1p9JntKVa9dYlxylWZWWFCeEth4pvvThRK3W4pUyR2/K+t4imvx
	 HZ5J16QWC20N3Vz4hGx2h6u/h0uDxGjb+rjqNP4pPbXcrdlkBS7RE2Ms2L+8RRFeOtNkN
	 q3VpzHItife86Uh2HM7gzR3vzk1kaOcCqAVSkjpTBJ/8bFWHLuXD/BT57GfYkXsFcXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dFxc3MO3;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6CC606A31E
	for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2026 08:59:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D6CC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dFxc3MO3
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so62980135e9.2
        for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2026 00:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795683549; x=1796288349; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jQc/CTIKgLFqNg7/EqVB3eWhheGznFwlbWTqinE5lFo=;
        b=dFxc3MO30YtmMEUfQjjqkHJLr+EbHSnZNHH8tZKjIJN3dcUHmp0qnA3QpfmW2JLafl
         +QU3HmBAu6tKqTEffZiuFGb5MfpKeybOpmS3t1LtXNbM75purZ9Zrdvmp9Sbfw9Qv5ua
         ETBCK5gDnnitPh81ui4WT1Y5QcYujGmDt/yq8oZzRRPn+4wV53mld5Ss0vgTOA5cR3K5
         Chehx+uMB454+2gT8AVVIlvDLGL+COIMB8QcPvwtcbKdPXcHmUPbj9kxRyt9nqV4NMGU
         DC4vYhEONf43QVbm0k+Pb3cnNLbtbrqbhDpyNKZOgSCTJAezKc7h6iD/aaeZZqbM8ZL1
         oxYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795683549; x=1796288349;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jQc/CTIKgLFqNg7/EqVB3eWhheGznFwlbWTqinE5lFo=;
        b=ovEFTWM/J+nuUjAgNN2mEBOpbib0drkHbhjnN19r321zkjgqSAvwL5QV/lVbVioF4M
         YI1hOk5FPZ6obRnMg9fFys9LufxGl6RV+pxUisCkGE59zHWbvLBpLSkmXLn1NQS9ay5D
         8FNeip6ZQoru2/lTa/droh7GCAvTNKsJk9v97mQEsFSzn8JpbjqL9ThsHkp33lIYQ8s0
         rBLX0N4hC5nSXLv4tgHO/g0Pru8xxKkgroINlZbXKtSk6RSzQ3e4YsivXip+l9SBrG8q
         m19nfwW7IzQQdavz/HKjdSDzH1EnBNhCQjfSuko02w5P3psEOY457Cgcn+wOnSxk2HwK
         PdYw==
X-Forwarded-Encrypted: i=1; AL+hErEemDZ04kL9tfA2L/XK2ee8/ZnBjkhHXRS0r8W0G4/jphEgSkZ0345icadIfE8DUH27C1PmKBIYMBM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8XMSmRyU5XXxud6POzlV+fQ+yXFHYyVGyH90hODO1IDR1dnS0Q
	MVLhSf5BUzLyX+otgNwbt7DNh5cQqM9XqIX7f1Kqu/I2Afk2posdhDqM
X-Gm-Gg: AZFdTZe9+//N+FXWezRFFaLqBq8MafGG0bUK/IA05RPB/YRN8fIGvaJbDiRTyu8Rn+y
	rS6lifqkt+lh9KLOsnNQAyukLZZlduUKzlC/PkiSrJgnks0/AtW404vSiVV8ozR7PXgcYU5Gu90
	T0eeN2wJqLKvQ/0gZBTeiKrqVqq2Js85WJrxVK8oL7aH/hipepiAD6Si9+N3ya0W6WQlK1A5CNJ
	afjo7VUI6TdWCDdQjvWHKFJfuSLW7gdKNVbqgY079PSDgAakw1ckL8j21ky4W2oYA0QKNkekUjf
	QSkmGyy6ejjxEor8MaL+7B3HVsfIboNqbfxNzHdP/DtJA0fpmbBBfb+fIo5OSFlz09KQ+v4CnJ0
	L9tnGKZ/1+5MABck8ieXaa4Xp5mvgQ/mlpcffo4R1e0jm3af1Ey4ZXfLus44tHJs7A8tTf/EV3t
	x0wJZnW7CyWMxC6rDNO8vyMSIqj/UH3WjR/K9BhGYihPKmpvnRXZBEbol+oq44yq0Dsb3CnwUcc
	Q50Dex4KtuHFmxPMciroX1znEPzcay0rNDz9geea50iWEh96eT4tsmWgL/fYV8xQA7T0/K9Xvf/
	tL+eLZ211BCEdesIwTyCpAuzu0Jw3JUI3V8GNa7klLHnMtVa/kT4BQ==
X-Received: by 2002:a05:600c:154c:b0:4a2:729:f7ce with SMTP id 5b1f17b1804b1-4bb8881c378mr415302325e9.8.1795683548507;
        Thu, 26 Nov 2026 00:59:08 -0800 (PST)
Received: from center.. ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c61f558sm40313744f8f.58.2026.11.26.00.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 00:59:07 -0800 (PST)
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
	linux-doc@vger.kernel.org,
	Orgad Shaneh <orgads@gmail.com>
Subject: [PATCH v5 0/4] mtd: point() for cfi_cmdset_0002, on simple maps only
Date: Thu, 26 Nov 2026 08:59:02 +0000
Message-ID: <20261126085906.814373-1-orgads@gmail.com>
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

Tested on that board with 7.3.4: the mount drops to 0.55-0.6 s, and an
8 MB file written to the jffs2 partition keeps its md5 across a
reboot. v5 was booted on another Octeon board with 7.3.4; its code
changes since v4 touch only a failed point() and little-endian
kernels. v3 held its md5s across ten 8 MB write/delete rounds on
7.2.9. The series applies to v7.4-rc1.

One question: a cramfs on AMD flash falls back to the block device
today. After 2/4 it keeps its image pointed while mounted, as it does
on Intel flash, so jffs2 writes to the same chip wait until cramfs is
unmounted. Is that acceptable, or should point() in cfi_cmdset_0002
be opt-in?

Changes in v5:
- 2/4: no pointer is returned when nothing could be pointed (sashiko);
  the changelog now also states the slower first CRC check of jffs2
  data and that lock and OTP operations wait for an unpoint.
- 3/4: Fixes tag (sashiko).
- 4/4: little-endian kernels keep the semaphore accessors; their boot
  bus needs the address swizzle of the I/O accessors (sashiko).

Changes in v4:
- 1/4 also gates lpddr, map_ram and map_rom (compile-tested only).
- New 3/4: the per-device map sashiko asked for on v2 and v3.
- Rebased onto v7.4-rc1; Assisted-by dropped (an LLM helped write
  this series).

Earlier changes, in v4 numbering:
- v3: in 2/4, an XIP erase no longer lets a point through either.
- v2: in 2/4, a point no longer suspends an erase in progress; 4/4
  checks the bank width before ioremap().

v4: https://lore.kernel.org/all/20261117214141.3826637-1-orgads@gmail.com/
v3: https://lore.kernel.org/all/20261011062908.2365879-1-orgads@gmail.com/
v2: https://lore.kernel.org/all/20261010180840.2152492-1-orgads@gmail.com/
v1: https://lore.kernel.org/all/20261010172142.2138956-1-orgads@gmail.com/

Orgad Shaneh (4):
  mtd: maps: only point() maps read through the simple accessors
  mtd: cfi_cmdset_0002: implement point() for simple linear maps
  MIPS: Octeon: flash: allocate the map per device
  MIPS: Octeon: flash: use the simple map accessors without a shared
    eMMC

 Documentation/filesystems/cramfs.rst  |  11 +-
 arch/mips/cavium-octeon/flash_setup.c |  78 +++++++++---
 drivers/mtd/chips/cfi_cmdset_0001.c   |   2 +-
 drivers/mtd/chips/cfi_cmdset_0002.c   | 174 +++++++++++++++++++++++++-
 drivers/mtd/chips/map_ram.c           |   4 +-
 drivers/mtd/chips/map_rom.c           |   6 +-
 drivers/mtd/lpddr/lpddr_cmds.c        |   2 +-
 drivers/mtd/maps/map_funcs.c          |  12 ++
 include/linux/mtd/map.h               |   2 +
 9 files changed, 256 insertions(+), 35 deletions(-)

-- 
2.53.0

