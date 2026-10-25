Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.167
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792934190;
	b=r7JBkxkE25ec/lOdfX9u6f2C80GTJwyxUnbrqG8yN+skZf11QU5Y3UVEHb4z/wkmZvYG
	 4xvz0XUP8oXfdlJHYskldGMPK5k2uLZ/6PjwixaM5Z8qRyAm4viNLR+Rnttxrl9Qndpw/
	 eGYZT1yMrMI67+qqiko2SMjfqTcE2PgvcH5c1jGsI0yA6Ilt/Ukp3CmTBjS/d5qHoJFpd
	 DnmqJLnNmyhK4Ttkf5QZc8IWGBNg8XL/jJ7qCiRK/0nDI9Y3HUWohFZhgYICcWizj4WDY
	 y+hg+7GRUnQYoBR8hYtjcA5LhWQuTSv1bwKrTjoxl7IYJ2KvD3YiSn1i1gpSAS1tsKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792934190;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=DEGQxXfH7Z3QoNaAAnq2yU/C/JRwT4M+74JxxIBZ28A=;
	b=AqvCLKYQhiKzs6RRs1TJa2exS5MBV23oyoNtAD3okokQT3AvZx2ZwbMKSleKA1l/BJCg
	 rfkwv/Z4fKIatTQ3Vf2aXPOB2Uq0rFR9hkUXAUUrohrH/EX9G1TkoSQEir3XRetfjtYU5
	 /1xkkOdpGU6MbD/HtXXq1Di/JJOPP539UkrqcdSIAYS5SPJ8LZRYHbIvd4EM+unW60Y9F
	 eV+1V1cjW0kNtRJDH8hoE2FOtJ0TCvycqUdWpi4H9NG9K+rSW7lRFJxuRknlhYyFGAqdM
	 pqdGTX4ehOlkZHJCKOqhGkhJxQNnCJc+0YXLQ66gyf8mJPCgwtYm2cfiGsFO2DQYyvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=a9xaXeUD;
	arc=none smtp.remote-ip=185.70.43.167
Received: from mail-43167.protonmail.ch (mail-43167.protonmail.ch [185.70.43.167])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B55606A31B
	for <linux-doc@vger.kernel.org>; Sun, 25 Oct 2026 13:16:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33B55606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=a9xaXeUD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1792934184; x=1793193384;
	bh=DEGQxXfH7Z3QoNaAAnq2yU/C/JRwT4M+74JxxIBZ28A=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=a9xaXeUDwZvmgX6JKLLUrp1o0xC+vP7+omEEw6P/Peh8Cybo90BkPPsdez3QK4KUC
	 50P3OdWAUqVz35FUUbqH8ZSm+9QXltZcLFvX5u76C3V1ZgjLCFr7I/QeZatyHWvMHC
	 luurvJEYMSSWBMFi8WfYhqoJSfElxwoeQp8P/yfgWQSl5kQJJHQad7zI0UP5geqezC
	 DulPIA7HtElUEvWcGxV6pk7pCWDwcV3lb926j6SU3Nbx78rdrm4jV3ad08avRuCSkF
	 SFsvLGVwsVvrA1511qlgrZDMWWApBmseYtf7viNPXyefookp7E2QuaQvGRvlSz//Qh
	 uch1tONeCwqZA==
Date: Sun, 25 Oct 2026 13:16:21 +0000
To: "linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>
From: dardaoe <dardaoe@proton.me>
Cc: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: [PATCH] Documentation: ext4: fix group descriptor and superblock  placement in meta_bg description
Message-ID: <cJaripqlNO272O1fNRgrozKg2ocrVAPYS9w-1c-x1ltKdOsoNw9hWVKawqm7CoIhYb1pOwrTf6xxju_RKzajEmy8T1be_FuyQKKQ-GPGvB0=@proton.me>
Feedback-ID: 203735097:user:proton
X-Pm-Message-ID: de9a74dfa5ea2d134db3d6f927e48fcc02b60b3b
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From 98cec88bdaae2fd790adad67f3abb1e11ebb5623 Mon Sep 17 00:00:00 2001From:=
 dardaoe <dardaoe@proton.me>
Date: Sun, 25 Oct 2026 13:03:01 +0000
Subject: [PATCH] Documentation: ext4: fix group descriptor and superblock
=C2=A0placement in meta_bg description

The Meta Block Groups section is imprecise in two places:

=C2=A0- Without meta_bg, it says all group descriptor copies are kept in
=C2=A0 =C2=A0the first block group. In fact the primary table lives in grou=
p 0
=C2=A0 =C2=A0and a backup of the whole table follows every superblock backu=
p.

=C2=A0- With meta_bg, it says the superblock and a group descriptor block
=C2=A0 =C2=A0are placed at the start of the first, second and last groups o=
f
=C2=A0 =C2=A0each meta-block group. Only the descriptor block is; superbloc=
k
=C2=A0 =C2=A0backups still follow the sparse_super placement rules
=C2=A0 =C2=A0(ext4_bg_has_super()), independent of meta_bg.

Fix the wording and describe the interaction.

Assisted-by: LLM
Signed-off-by: dardaoe <dardaoe@proton.me>
---
=C2=A0Documentation/filesystems/ext4/blockgroup.rst | 43 ++++++++++++------=
-
=C2=A01 file changed, 27 insertions(+), 16 deletions(-)

diff --git a/Documentation/filesystems/ext4/blockgroup.rst b/Documentation/=
filesystems/ext4/blockgroup.rst
index 7cbf0b2..d33d1c4 100644
--- a/Documentation/filesystems/ext4/blockgroup.rst
+++ b/Documentation/filesystems/ext4/blockgroup.rst
@@ -83,11 +83,13 @@ flex_bg is given by 2 ^ ``sb.s_log_groups_per_flex``.
=C2=A0Meta Block Groups
=C2=A0~~~~~~~~~~~~~~~~~

-Without the option META_BG, for safety concerns, all block group
-descriptors copies are kept in the first block group. Given the default
-128MiB(2^27 bytes) block group size and 64-byte group descriptors, ext4
-can have at most 2^27/64 =3D 2^21 block groups. This limits the entire
-filesystem size to 2^21 * 2^27 =3D 2^48bytes or 256TiB.
+Without the option META_BG, the group descriptors for all block groups
+are stored together in a single table that follows the superblock in
+the first block group, with a backup copy of the whole table following
+each superblock backup. Given the default 128MiB(2^27 bytes) block
+group size and 64-byte group descriptors, ext4 can have at most
+2^27/64 =3D 2^21 block groups. This limits the entire filesystem size to
+2^21 * 2^27 =3D 2^48bytes or 256TiB.

=C2=A0The solution to this problem is to use the metablock group feature
=C2=A0(META_BG), which is already in ext3 for all 2.6 releases. With the
@@ -104,17 +106,26 @@ to the hard limit 2^32, allowing support for a 512PiB=
 filesystem.

=C2=A0The change in the filesystem format replaces the current scheme where
=C2=A0the superblock is followed by a variable-length set of block group
-descriptors. Instead, the superblock and a single block group descriptor
-block is placed at the beginning of the first, second, and last block
-groups in a meta-block group. A meta-block group is a collection of
-block groups which can be described by a single block group descriptor
-block. Since the size of the block group descriptor structure is 64
-bytes, a meta-block group contains 16 block groups for filesystems with
-a 1KB block size, and 64 block groups for filesystems with a 4KB
-blocksize. Filesystems can either be created using this new block group
-descriptor layout, or existing filesystems can be resized on-line, and
-the field s_first_meta_bg in the superblock will indicate the first
-block group using this new layout.
+descriptors. Instead, a single block group descriptor block is placed
+at the beginning of the first, second, and last block groups in a
+meta-block group (immediately after the superblock, if that group has
+one), regardless of the sparse_super feature. A meta-block group is a
+collection of block groups which can be described by a single block
+group descriptor block. Since the size of the block group descriptor
+structure is 64 bytes, a meta-block group contains 16 block groups for
+filesystems with a 1KB block size, and 64 block groups for filesystems
+with a 4KB blocksize. Filesystems can either be created using this new
+block group descriptor layout, or existing filesystems can be resized
+on-line, and the field s_first_meta_bg in the superblock will indicate
+the first block group using this new layout.
+
+Superblock backups continue to follow the ordinary sparse_super
+placement rule (block group 0, 1, or a power of 3, 5, or 7)
+independently of meta-block group boundaries; without sparse_super,
+every block group carries one. As a result, a block group at one of the
+three meta-block-group positions above will carry a superblock backup
+only if its group number also satisfies that rule; otherwise it holds
+only the group descriptor block.

=C2=A0Please see an important note about ``BLOCK_UNINIT`` in the section ab=
out
=C2=A0block and inode bitmaps.
--
2.43.0
Sent with Proton Mail secure email.
