Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5118F327C08
	for <linux-doc@vger.kernel.org>; Sat, 10 Oct 2026 17:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791652907; cv=none; b=UW1NxX+efvP6jf7eDQgq2f86f7oo5KyWP8+WPqUGZiYeoXI8h9lfgkMsjQYif48NNY3HrrTqtI2k0QUZy21jLuKZrPt6KEqxHOKZaIHkiWYP/0j1G86+ntbznTnusOvZHP9sHf2lMsvApWVdjaul4RylKUspAtFpu1tiijuR5tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791652907; c=relaxed/simple;
	bh=QDzKbGVhT0iQaMhfqVz+PDxyGNf4k2FWJsrJ6MN3ESA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eI4eF9zuNr18pHw8KU5rxJWMr7tvx2145PdWwn3ua3iUGRbKQpbWLhGjKRnkIuA+gG/Xqg2nle1dqJ+zagKdgevmDJFF0nmFP2ikWnhfsFA/fhd2MBq2wqHYpUA9IjI67kMiVhiMwB+9R0mzC1MD6LnpMfq8phyfAEPktmoZ4oY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CeKhzGay; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CeKhzGay"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a171b677d2so4654415e9.0
        for <linux-doc@vger.kernel.org>; Sat, 10 Oct 2026 10:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791652904; x=1792257704; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qzwaUnI7IRPLhxyFnbCvNhosRBqBfqx+J3GlDpy+vjk=;
        b=CeKhzGay8bytaVTO9QG+Tr7MTkNlzdlqi+kkHgxRSDu6TUX0KJrFb7UMWO9AWQjZBv
         a8RFdVo7nMijv5OhnNVovSeRtdbZHSf070O7H4oZlOPJ8W62exBEub1GPJgywWsmslgv
         TasaKkGRwUc7emRlbR85qzzG+l0NpC9fCRAB14V+vNxXvq0ITW9GVA6QsS/Nf4e08ywC
         xa7PhacFeXheUBhsTH+/G5WaqdTLmz7lJSlo2IWeKR8jt6FP9p8rdtq7m4T66lXYVXKU
         TDeCOSQ06Dy/yGvqtzC8MWIHMg1gUFRzq/w9gL3HgNYBT5xnW0ge6FBE7oKbwFMDAKZ7
         4Z0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791652904; x=1792257704;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qzwaUnI7IRPLhxyFnbCvNhosRBqBfqx+J3GlDpy+vjk=;
        b=xy/t4uHxFvlMSS1OvZA9Y1O/M5G81/AKZ0uv7A7QYFTpJUGntDPPemETFMGEsNEn2A
         e+GucBlZuX9XEko4ecWr8SFVTBxVMYYSXsVi7qpkIRI0MzaXWHXzz7wz+hoOzmOPtTl/
         G9Nj0DPnjfgRCnzoVogIknAOy2A7zjQWavz0k/XhZD+TZPjXugsbJRCHelKmw5uE0YJ8
         qUv4EDTF0WNsyOA5veD84Jvv2bMRCd5NxYtPBIgqW1LHbvb8Tl0EpHbKlHTBrKD69Ez+
         MNzUKnW39Ss9t37hIdnJzv36KamCj/4HIWYjmLWKUvU4rm7ZB54d5KrSrRlugB0+0/vn
         PABg==
X-Forwarded-Encrypted: i=1; AKwUvByYGx1cSEfYhCF4urmLjhbHg/w5Fpi0TWhN587Pxd9dI9CAQArMdrFhuDjcruDEGQkxCoDeasRW8jA=@vger.kernel.org
X-Gm-Message-State: AFq9FYL3X87uF0U21rL148/ePiIOlDWBPeuIjA+0YZlOFMBjfADKUUK/
	K9U5lJ1Y+0/yOl4LfYGR1dCq0o+sFGyk231bxGewFRbkNh6jyzos20Xi
X-Gm-Gg: AYBFou1cI75uxAlyU8dmtRq8vmB4rpOqYye+truuttjfdqBB9NlE5XweNkAvvW0VuXD
	KeydCPtEQqBypw6eNTVVcgV5RUizEIZHQ1FjXrH/g4q0O3V6fbKqPH7iFybQw0dD7b7tVSeadj/
	KYodKQFvQWe7Dkvo0b2t0kGEDeIVZtnFfWD4G0bec0mVcy0MNN40WFmuU8ONR3f5imVmwtjAkWB
	gLKjpF9rHcGsi0aN0C/OWnQXMWg34EgCivMV0oI2GEyPmyqEV01jJNiDSO5GWfp5c8aRM/yssBE
	8mGSQtcHfxmRiaOx1ZRKUt+V+IdGSKYeRlXow2cSjnUQttxQ8FPAbj1fhVSAGj6qrihEQQKFEMH
	YIWhHt1GE2RGOt1Bm6VUOgNa1HvOGebLK/MkRmCrep2XDgc4zumvruAvfxcemp3u95CBS6Zswa8
	cfHBEeDXfZqWGuBbvlTHHbR2iSTvjNNncKDC7RObDpaCSzv4n8Wv5O3ACds46W9v8QAId9QVrPf
	774KoaEMyFCqmnHgu+y6RUXaamYC2xZaQM/Po0J+aqd3pED832Y1G4sNik8G3XC9vaJ16pbkplr
	vzg/ruOGVHW3R71R
X-Received: by 2002:a05:600c:3e8c:b0:49e:6861:50f7 with SMTP id 5b1f17b1804b1-4a18e49d251mr95380695e9.5.1791652904195;
        Sat, 10 Oct 2026 10:21:44 -0700 (PDT)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18c85009csm114159655e9.2.2026.10.10.10.21.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 10:21:43 -0700 (PDT)
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
Subject: [PATCH 0/3] mtd: point() for cfi_cmdset_0002, on simple maps only
Date: Sat, 10 Oct 2026 17:21:39 +0000
Message-ID: <20261010172142.2138956-1-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
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

Orgad Shaneh (3):
  mtd: maps: only point() maps read through the simple accessors
  mtd: cfi_cmdset_0002: implement point() for simple linear maps
  MIPS: Octeon: flash: use the simple map accessors without a shared
    eMMC

 Documentation/filesystems/cramfs.rst  |  11 +-
 arch/mips/cavium-octeon/flash_setup.c |  37 +++++-
 drivers/mtd/chips/cfi_cmdset_0001.c   |   2 +-
 drivers/mtd/chips/cfi_cmdset_0002.c   | 156 +++++++++++++++++++++++++-
 drivers/mtd/maps/map_funcs.c          |  12 ++
 include/linux/mtd/map.h               |   2 +
 6 files changed, 207 insertions(+), 13 deletions(-)

--
2.53.0

