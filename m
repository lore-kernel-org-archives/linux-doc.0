Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A383D9022
	for <linux-doc@vger.kernel.org>; Sun, 11 Oct 2026 06:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791700153; cv=none; b=set9X8XA6niZYiR0I0ntj4TBlkG2vgwbPQuaxpW6S4+nupfqT8Q3JRLF0af4fiOpfZYJHL3CsRW57ERWEN0cB05fziMwgaYyesctny+RylKSQ7FY7IGh5AdwT1DNWZbDz6Gt/Ye6nhDTesrfByI50me+P6u9G1NBDxxlU6LjbkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791700153; c=relaxed/simple;
	bh=o4gGH5tyhBW0yVZv3CFpWcbdWHQRb+igsQyior7IF+8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dw41gz91btSM/QMtN/VoqJAk4jjIBvh/1vijohOTGsTME0M7B2CBG1lILxYfGQZRvzgONi9U6iWbvgr4KrJxz629xrntl4WrKc8osBo2S3SFG1um/1Hg50F396jPiABu9qmjwz1F3trUsd2Lz3BDg5PvWBeCHfFn1YJZnQGNMxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZtcEtsBI; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZtcEtsBI"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a01933b584so8504955e9.0
        for <linux-doc@vger.kernel.org>; Sat, 10 Oct 2026 23:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791700150; x=1792304950; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kBtQan1uSc108PxGt8KEILazDPgl7luxnl4pqbr4mVs=;
        b=ZtcEtsBI9ys3BitPo5Ei3dIl7XW+BHOnZ/enX2hYZYAY+yD4y2xhtqdyLJVk7U7jZB
         ik3IZSGheX4fGjH3Q/z1ZeZNAlJmzG+y9BoSs76RTpZ7A1/Q5VKY/k8sPEd6uvMi856E
         PjQnuMKPRXEQw9RJZcVvLeT13lKyvVO5LxpP24avoRIIbQU2IRzhyMFsbnrMOmRfWeEV
         oYWKISZCQME2oTE/C2SAtXjRXPP34SeJYxZy6diQNzJp990tQGY4Kq4GpdirXrvXRCHt
         GF8Df8L3kKlJgvfUqUnFNw0T/zR4NA6fg0DkQFflDY0hWunI0+XawBfgOxsM1JSBTuyW
         Iq3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791700150; x=1792304950;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kBtQan1uSc108PxGt8KEILazDPgl7luxnl4pqbr4mVs=;
        b=CNndX8DqcCYNdaqndzrftruNF2G/LL1mczJPKpVw3MMTwzBchiRi3F1lgYPFSlX9+A
         9fU/zrx9egrNHdLR1DG3Zk2f1R1iUvt1V8AUvXypWKWZEzYcZO3+WEqjyCiTF46nNXxZ
         j9lcfPndSHaGLhrHEx2iSk4jKFdPEK0wYnGkXQtqrs7NnmQ6ymxKOm3jGUKDK77SgdSN
         sPPb8p/fsBmTDtklch6XyrmNlAurciVOfl+3Kq4t1ZD1BUVlYpdtJShMjGeoHvL6/o7J
         3Y6GJtCiWbbnBVskE9MyZiTC1rA9OtpwRjHK5yTsmnWcKF8JJKhGc66DFHJt7ygvpTJg
         HGZw==
X-Forwarded-Encrypted: i=1; AKwUvByLhdK/Nx7H5Ca+vyfvroln8e2KaoBdLzPbwQLNy5hSeJn8UVySWPMSNKlgoqw+G9iFmDipEQFxuiQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJuT2crI7tXqXtppVHKDDeCWMQ5QiE4LM7LzuEvubyboP159jvA
	+Cgbw0q8Dz+MD/+ljOCdaakLpN8yo71hKNfJeMymGgqnOCXUrjfCYkPc
X-Gm-Gg: AYBFou2L9XblRLGsVZx6tEHUKpSKwPLUa3WV6805V7125f1tX+0f2IOuRIAkFnQZ9HW
	p5qk7SwQ8vGSVrsg1m9dyjjXnTkZfcUrO7uQSQivmpDErKSLv9XCEOcl8IhB1qjGKtAwWYKOkeL
	Drmm1xz3+2iZU6U2FoG0gXqT/tty+/5sWzDpO2HnknZdf9KPN8LT0uoAstqEihdaK2/lr1S0CjC
	b5QhVnCb1Frgwnt7w2r1dl0JaWwlV8fNs4rsx6ZWyV6bB2DK/Eg9ZoAT4yryJQYgcOSTMf+1cKk
	rtCXkvSPVdit6Bu0pJFq4CvJ3W7qAhYOYv6XiYyBfL5fBqdtVJgfKEZa6IOsg9T9juJevO+skmK
	dVjQ8FDi43rkLtEK3+YDT/xEM2uX8jIHC3rgteZteT+s6ZKTDMF1KXDiopEtQEVl2Ivn4Ncieh+
	LPfE9qD2uUF/jfOfuRNya702RxdaLdUeBtgkkm3dKhbKdT4tBoAdjZ9coE0hh2n22fM+xh5CbZk
	X/KhPuUWo3cqLs/6crHEq3zQ7dNm2c4HxMeFw+hRY1S8+KwhTW4gVgQixvf/vGWCKNnQwfp7lM9
	G6lCxgazXO7qz/7p
X-Received: by 2002:a05:600c:609b:b0:49f:ce78:356d with SMTP id 5b1f17b1804b1-4a18e4c9944mr106707295e9.30.1791700149633;
        Sat, 10 Oct 2026 23:29:09 -0700 (PDT)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18f3b43efsm222579135e9.1.2026.10.10.23.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 23:29:09 -0700 (PDT)
From: Orgad Shaneh <orgads@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	tsbogend@alpha.franken.de
Cc: linux-mtd@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linusw@kernel.org,
	kaloz@openwrt.org,
	ulli.kroll@googlemail.com,
	john@phrozen.org,
	nico@fluxnic.net,
	dwmw2@infradead.org,
	corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH v3 0/3] mtd: point() for cfi_cmdset_0002, on simple maps only
Date: Sun, 11 Oct 2026 06:29:05 +0000
Message-ID: <20261011062908.2365879-1-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261010172142.2138956-1-orgads@gmail.com>
References: <20261010172142.2138956-1-orgads@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

jffs2 scans a flash in place through mtd_point() when the chip driver
offers it, and copies every used eraseblock through mtd_read()
otherwise. cfi_cmdset_0002 never had point(), so every jffs2 mount on
an AMD-style NOR copies the whole used area. On an Octeon CN6635 board
with a 100 MB jffs2 partition on an 8-bit M29EW that takes 15-30 s at
every boot.

1/3 tightens the existing gate first. map_is_linear() only checks for
a physical address, so cfi_cmdset_0001 already points at maps whose
own accessors swap bytes (IXP4xx), switch pins (Gemini) or lock the
bus (lantiq). The new map_is_simple() also requires the simple
accessors.

2/3 adds point()/unpoint() to cfi_cmdset_0002 behind the same gate,
modeled on cfi_cmdset_0001, and lists it in the cramfs documentation.

3/3 lets the Octeon flash map use the simple accessors when no eMMC
host shares its boot bus. Without it, 2/3 changes nothing on Octeon.
It builds without 1/3 and 2/3 but only pays off once they are in, so
taking all three through mtd with an ack from Thomas seems simplest.

Tested on that board with 7.2.9: the mount drops to 0.6-0.8 s. The
md5s of the images on the jffs2 partition held across reboots and
across ten 8 MB write/delete rounds. The series applies to v7.3-rc4
and to mtd/next.

Separately, for the MTD maintainers to judge: the write-buffer count
truncation that cfc5ebc9540e ("mtd: cfi_cmdset_0002: cap the
write-buffer chunk at 256 bytes on an x8 device") fixed in
cfi_cmdset_0002 has two siblings. do_write_buffer() in cfi_cmdset_0001
writes CMD(words) and the one in cfi_cmdset_0020 writes
CMD(len / map_bankwidth(map) - 1). On an x8 device CMD() keeps only
the low 8 bits of the count in each device lane, so a write buffer
larger than 256 bytes per device would be programmed with a truncated
count. I have no x8 Intel or ST part to test on, so I have not touched
either; I do not know whether such a part exists.

Changes in v3, from sashiko's review of v2:
- 2/3: an XIP erase (FL_XIP_WHILE_ERASING) no longer lets a point
  through either; v2 only covered FL_ERASING.
- 2/3: the changelog now states the cost of that rule: jffs2 points at
  a data node the first time it checks its CRC, so a read that meets a
  garbage-collection erase waits for that sector erase instead of
  suspending it. It also names what really blocks behind a cramfs
  point: jffs2's umount calls mtd_sync(); sync(2) does not reach the
  chip driver.
- Assisted-by in the form Documentation/process/coding-assistants.rst
  now asks for.
- Not changed: sashiko notes that 3/3 keeps the static flash_map,
  which a second probe overwrites, and leaks the mapping when
  do_map_probe() fails. Both are as in mainline today; v2 removed the
  iounmap() v1 added because, with the shared instance, it could unmap
  a registered device's window. Making the map per device would fix
  both, and I can send that separately if wanted.

Changes in v2, all from sashiko's review of v1:
- 2/3: a point no longer suspends an erase in progress. cramfs holds its
  point for the whole mount, so the erase - and the task waiting on it,
  and the reboot reset - would stay suspended until umount.
- 3/3: the bank width is checked before ioremap(), and the iounmap()
  calls v1 added are gone; flash_map is a single static instance, so
  on a second probe they could unmap what the first one registered.
- Not changed: sashiko also asked about writers sleeping
  uninterruptibly behind a long-held point. That is how
  cfi_cmdset_0001 has always behaved, and 2/3 describes the cramfs
  consequence: a cramfs mounted from /dev/mtdblockN on AMD flash
  today falls back to the block device, and after this series it
  takes the direct path, so writes to other partitions of the same
  chip wait until it is unmounted. If you would rather not change
  that, I can make point() in cfi_cmdset_0002 opt-in.

v2: https://lore.kernel.org/all/20261010180840.2152492-1-orgads@gmail.com/
v1: https://lore.kernel.org/all/20261010172142.2138956-1-orgads@gmail.com/

Orgad Shaneh (3):
  mtd: maps: only point() maps read through the simple accessors
  mtd: cfi_cmdset_0002: implement point() for simple linear maps
  MIPS: Octeon: flash: use the simple map accessors without a shared
    eMMC

 Documentation/filesystems/cramfs.rst  |  11 +-
 arch/mips/cavium-octeon/flash_setup.c |  36 +++++-
 drivers/mtd/chips/cfi_cmdset_0001.c   |   2 +-
 drivers/mtd/chips/cfi_cmdset_0002.c   | 167 +++++++++++++++++++++++++-
 drivers/mtd/maps/map_funcs.c          |  12 ++
 include/linux/mtd/map.h               |   2 +
 6 files changed, 214 insertions(+), 16 deletions(-)

-- 
2.53.0

