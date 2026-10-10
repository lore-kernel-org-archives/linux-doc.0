Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434F63515DC
	for <linux-doc@vger.kernel.org>; Sat, 10 Oct 2026 18:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791655726; cv=none; b=oCCo2ZCTb0iiRZCNDWU56nzdfVEISewraahJaXm+wFKSIJ0ZvYSdQqOREd7PyCdy/1e3nP0JP44bYi9+1qHsISES0P6zesWaZAFw6QSdu5U4/ZXzbINh6hGV9yLxMREZAh1AKHu+jE5ft3gQckILGgIzVGrG7Wt8S5OAvxEl2AQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791655726; c=relaxed/simple;
	bh=RGIcDyDx0BJX1dV79kkHkskveBYrqKzj8PwX8+l9R+k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D8no06JX7YwRljUG5zVKSWK7mh7odb3GNymc20IljWzcKS+8XEUNcC5gEbPLWH0lHvT6L/ZrXrbp+IWFcTsWQLFhQ9jT3QGJvutqvvbwnudDo6iMcKdtZv0EYf/AT/tlBZz5E7rsW5Vr30Wo1SxaIDOmYyAm1GbDwMwjhdNICHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SpLEwBsP; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SpLEwBsP"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a161d9b8c7so4436675e9.3
        for <linux-doc@vger.kernel.org>; Sat, 10 Oct 2026 11:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791655723; x=1792260523; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nqJzHpBsOkwbCuifN5JxVshD70grUK+B6gcyk5nzdLY=;
        b=SpLEwBsPCi2ZTYmSlEtksFMJpHw+qRBo+vgA18TmX2fLppqG1cEz1lGZLMt+TYLfVD
         7FeMJcKODhuQwvIn+TcOD7cYCZCsgMllr1Rwdyq8txTj2gxeMq0JXZrqJ5KSzrxu09QY
         c2noiE02vfd0BvdwwEIWcU46692HWhWI7yGSyESWWfoPZKQVu3m+BtfgSXSnAjPvFh3H
         7ote5duLUdmisK7+63aahJ3YNRO73hQlMQHj2bjbaZGZ3DtxDuUBCmkuBaLQln98JncH
         r296qzMSEk9rVcD4akq7ACFFlfeTUdVEObbNjAHkjyZCC58CAAEBu7dy9bLPosoKccV0
         tdyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791655723; x=1792260523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nqJzHpBsOkwbCuifN5JxVshD70grUK+B6gcyk5nzdLY=;
        b=TVQHmpPjkoJK/ITnNFuh1/jJ6Xka6+5ohTe+qp34OvESDnv7Qd+CMQPxC07arFkBvX
         LBM7TyyBBkt4z68ZnY5oY69wMfLpbsXzCOlh40zaWH7oYPu5wxxMAD5S6n/d43bAe7nv
         rabmhxAf/+9adwcH1Z3AY2vZ+Gr0HcAJN/G6b/YA/JzdwppD/RYVlGCAW+eD+xSN8+qZ
         JHFwi628EKmfNmAr3h0ZE6yByK4maDn/9BjLMq+d5owJJfY2WJiRHx8wSfEtynUQ2GWE
         CmGlvJzLc07iZJUxMWhK9KDhWYSDB/sJkIuIeRrtazz00GXFqt/L0P1Lnd5C3yLdNUOn
         HG7A==
X-Forwarded-Encrypted: i=1; AKwUvBzenH2oduoA8hRn5+1JdZJV7taqN9e7SSSbW/DOmFLKQm6FNs1qtuCRVuZCiSUrGCwHa80C3Tpmkv8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJpnkS71bJMuu+hPCqqRnq6X2H5LGeA2rR1lfMXZhi3K39wFmxQ
	UfI4sA2c2HGdpCP854RxiIFOBafstBQ28hAeRpSo5BU1KOlDFl/JUAOI
X-Gm-Gg: AYBFou0HCr/JBBaCqRpkAZaMh26qYyrqAuJpFjhbdsEe392TSfu0LUckA4GFblPK8FK
	q5aR+lCxsWB28foj1no78VaqsYN93J6Du8wRQF1FiBjvl2pFgbqThwSj9bBK2rTflROTEWKzARq
	orZGh0rssTgZitlLJZCinGNKZbelE76nzNeLBy2dIjr8zHVDX4ywl/wia/kyHn6EzF6rj5fK6Tl
	sqWh0vib/t+SNyTey0JOdAMlLTxZeBZV9CuHMwDZV1cp5RuaoFd2p66sXlL4vNwRDRyUh9C043c
	V/+NRfqKcxZYtScu6/225EnZT4rl6TFBJGyG/vhe8QL6MoWfwEkkFNb7XCN4MfkPJDBd1eN3Axo
	xPSVbnz8VbhWqI0OgMgbih5NyJb8gy8gjUi7TaZtMTju3u9gz3BzQmRiLUlatt0FBPYzpBH16ss
	aJHLJrLAumcqdvcwXiBcCwzSG5R/EWNZE+w7QJTdlXfzD4e7uRHGt7bugpmBl36bkYHlfp9jC9f
	LzjuihsYO3T0ie+93L0K01VrePAnwiuN2reyd0Y0qjxh2BYstdlvjD0JWWTHsNpCpLIyrFTpe3r
	My3EAQnWc8OAMkPK
X-Received: by 2002:a05:600c:548e:b0:4a0:1aa0:7cfa with SMTP id 5b1f17b1804b1-4a18e4aa724mr101228615e9.12.1791655723242;
        Sat, 10 Oct 2026 11:08:43 -0700 (PDT)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db97ce3aasm10187163f8f.21.2026.10.10.11.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 11:08:41 -0700 (PDT)
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
Subject: [PATCH v2 0/3] mtd: point() for cfi_cmdset_0002, on simple maps only
Date: Sat, 10 Oct 2026 18:08:37 +0000
Message-ID: <20261010180840.2152492-1-orgads@gmail.com>
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

v1: https://lore.kernel.org/all/20261010172142.2138956-1-orgads@gmail.com/

Orgad Shaneh (3):
  mtd: maps: only point() maps read through the simple accessors
  mtd: cfi_cmdset_0002: implement point() for simple linear maps
  MIPS: Octeon: flash: use the simple map accessors without a shared
    eMMC

 Documentation/filesystems/cramfs.rst  |  11 +-
 arch/mips/cavium-octeon/flash_setup.c |  36 +++++-
 drivers/mtd/chips/cfi_cmdset_0001.c   |   2 +-
 drivers/mtd/chips/cfi_cmdset_0002.c   | 162 +++++++++++++++++++++++++-
 drivers/mtd/maps/map_funcs.c          |  12 ++
 include/linux/mtd/map.h               |   2 +
 6 files changed, 211 insertions(+), 14 deletions(-)

-- 
2.53.0

