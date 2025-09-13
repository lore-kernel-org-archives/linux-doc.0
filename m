Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DCD814A60F
	for <linux-doc@vger.kernel.org>; Sat, 13 Sep 2025 00:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757724859; cv=none; b=AYSJTBVCGelmoYnDkwyQ8L1OAu6cKIJgrqEbD9pvu/OFdMCxxwG03L6069O2MEA1fWzmnhZxOa7B1KyGTVqPfe8tkfat3Ks1LJHmIfHXqeVPYByRfv+mogfpnvr+fOhY3wJRmqNWlSk7RgShH0eh1dma09whXp93JRRZyy9wwSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757724859; c=relaxed/simple;
	bh=Jkxu5ZUI0H6ttWYEi4Z84BWe03GXjUbvUo6lUIoM5rY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R9VeNS3wEBEU1X+d7llddPMN6qF934TdPNR42UThFGSH+SCutPMpcb31x71U48a5u5aCD8hrOsD1KGDW+NUO9bc5tfLgZziMritj3z+rl8cODI5YpIOx0+dF9hPGVl4MO1MhkLW46SpVqzzZAetNiu8BCT+yFx4MoDK7W9oWZeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NvT6e3Ob; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NvT6e3Ob"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-62ed68313b6so2383513a12.3
        for <linux-doc@vger.kernel.org>; Fri, 12 Sep 2025 17:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757724853; x=1758329653; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HNaBVV0FpkKN0cdUwxCZ8fQss5eC0TEeX4co/5GJ2YQ=;
        b=NvT6e3ObjPoqqPnxCS60GcwK+yLdOlfN22Jnv2lY67RA/U1al/OIo3S4BwG/GKULue
         oTCpL8coYPSgHWTBgX54uuCFQcUq1LHojhq2vj1SU0MSap61BLXAyUIZVC9Wm8MNNSKQ
         ZIJvpWkRvAUlrww9wJU5tj83FxL3UGf6dcaoDZIF/lsSYItI6HG6gpZSxJDoVbVfCCvt
         rdp0lb5dDw4ls+bnlyJn6EDojFmBWvllBN5GBV9Xi95j5sjAnNZnWIgr/IlHDyt1nZ0I
         q0ApG2FWKiKptbJBqBpWqvJuz2WEwrbOtYPrqw9HMraW/wyXa/GoD5KUhkMKAT0DY+iW
         pwww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757724853; x=1758329653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HNaBVV0FpkKN0cdUwxCZ8fQss5eC0TEeX4co/5GJ2YQ=;
        b=Q8dQml5eKcZV73v5fUEHBTX1TfHwNtxPZ5unvDUz4Al2ATtX0mdgFuu+5r98fPgKsA
         4zZi7J0AU/j7QFK3SfjjwSGttObmMSrLqGRPLKSLSyUGr9/RiFxvkYE2RwrnByZX4nGw
         1kfD+C0JBtbORvo+rpKNGuYKwhY7S8qVMZOYvUO38o/NRS1x+OIC+mTdaMQsdSnZTlpA
         ZvXuxyHhmPalr/fgfWj+pBvsjSzr53rw4eii3s4w0Ertq/VUS74JHhoWApfoEyFVKwHb
         92ox9hyt0F9NUddfHfKa+caIo7vIrejSIUs/16K6BQ7rflQLirQRxReUx1fdKQ0ymmFX
         eNFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkzzFVvMnGRUdmoWmP1sKzi2XIx70kciQfUTTH25LrOtRbO8rF2viWnmgqT0ZqEKfweTETaYk8Ipc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwIq9d7B51DdcChepCbolMf/A1SKckpye22pRtxZlTAFTTb7Df
	fO73r0S5ODdd0eOTC3Ob7VfVr4y+lg0oDOc+ivdKycdODUV/2hs4uTGQ
X-Gm-Gg: ASbGncuo5U8A+DosgDzZbObbR9nCbYUNsjgG5zLHXQQmURwAf9UDIF0bw4cRfbPYzXe
	etx5a3P/Pup5skHGoGQUEmDzliL8N6Bh6pZBugdM5Tuzb/n5/m3UyQ4kC8o+pt1sqf75sJimGKM
	yU+APuTYro1hiVWc4W9iG0rt8mpkZX7iSFKoDID64+2N0/Es+o8agrehdVctzMPGVUrv9i63Mju
	x18oCj1zv3sicrI5Qh7f2aU1nRxNfAKmftnMXZJJHcbveUNh8PiIQgc5fssytmuHTM9c8TZFkue
	6tksoguVSqVOOTEsd+nYW/7/JRwiXmDY+Uf78PMrVoVtNqzI1kmtw6I3RD+39e14M+bWUSFidfz
	MQbwexn0XViuwi9HwVYmq6U5cVj4iew==
X-Google-Smtp-Source: AGHT+IFRAhwUW5zsVWdQl7rom9u+xngcdJiQFGIxNb9yv6sUT2JdEwHxw5AIwBj5WkuunZa0hzcUAQ==
X-Received: by 2002:a17:907:7e8c:b0:b04:3513:5138 with SMTP id a640c23a62f3a-b07c37fca87mr474198766b.41.1757724853144;
        Fri, 12 Sep 2025 17:54:13 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07b30da310sm465332066b.20.2025.09.12.17.54.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 17:54:12 -0700 (PDT)
From: Askar Safin <safinaskar@gmail.com>
To: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Christian Brauner <brauner@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Jan Kara <jack@suse.cz>,
	Christoph Hellwig <hch@lst.de>,
	Jens Axboe <axboe@kernel.dk>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Aleksa Sarai <cyphar@cyphar.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Julian Stecklina <julian.stecklina@cyberus-technology.de>,
	Gao Xiang <hsiangkao@linux.alibaba.com>,
	Art Nikpal <email2tema@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Eric Curtin <ecurtin@redhat.com>,
	Alexander Graf <graf@amazon.com>,
	Rob Landley <rob@landley.net>,
	Lennart Poettering <mzxreary@0pointer.de>,
	linux-arch@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-um@lists.infradead.org,
	x86@kernel.org,
	Ingo Molnar <mingo@redhat.com>,
	linux-block@vger.kernel.org,
	initramfs@vger.kernel.org,
	linux-api@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-efi@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	"Theodore Y . Ts'o" <tytso@mit.edu>,
	linux-acpi@vger.kernel.org,
	Michal Simek <monstr@monstr.eu>,
	devicetree@vger.kernel.org,
	Luis Chamberlain <mcgrof@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Heiko Carstens <hca@linux.ibm.com>,
	patches@lists.linux.dev
Subject: [PATCH RESEND 13/62] ext2: remove ext2_image_size and associated code
Date: Sat, 13 Sep 2025 00:37:52 +0000
Message-ID: <20250913003842.41944-14-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250913003842.41944-1-safinaskar@gmail.com>
References: <20250913003842.41944-1-safinaskar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It is not used anymore

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 fs/ext2/ext2.h          |  9 ---------
 include/linux/ext2_fs.h | 13 -------------
 2 files changed, 22 deletions(-)

diff --git a/fs/ext2/ext2.h b/fs/ext2/ext2.h
index cf97b76e9fd3..d623a14040d9 100644
--- a/fs/ext2/ext2.h
+++ b/fs/ext2/ext2.h
@@ -608,15 +608,6 @@ struct ext2_dir_entry_2 {
 					 ~EXT2_DIR_ROUND)
 #define EXT2_MAX_REC_LEN		((1<<16)-1)
 
-static inline void verify_offsets(void)
-{
-#define A(x,y) BUILD_BUG_ON(x != offsetof(struct ext2_super_block, y));
-	A(EXT2_SB_MAGIC_OFFSET, s_magic);
-	A(EXT2_SB_BLOCKS_OFFSET, s_blocks_count);
-	A(EXT2_SB_BSIZE_OFFSET, s_log_block_size);
-#undef A
-}
-
 /*
  * ext2 mount options
  */
diff --git a/include/linux/ext2_fs.h b/include/linux/ext2_fs.h
index 1fef88569037..e5ebe6cdf06c 100644
--- a/include/linux/ext2_fs.h
+++ b/include/linux/ext2_fs.h
@@ -27,17 +27,4 @@
  */
 #define EXT2_LINK_MAX		32000
 
-#define EXT2_SB_MAGIC_OFFSET	0x38
-#define EXT2_SB_BLOCKS_OFFSET	0x04
-#define EXT2_SB_BSIZE_OFFSET	0x18
-
-static inline u64 ext2_image_size(void *ext2_sb)
-{
-	__u8 *p = ext2_sb;
-	if (*(__le16 *)(p + EXT2_SB_MAGIC_OFFSET) != cpu_to_le16(EXT2_SUPER_MAGIC))
-		return 0;
-	return (u64)le32_to_cpup((__le32 *)(p + EXT2_SB_BLOCKS_OFFSET)) <<
-		le32_to_cpup((__le32 *)(p + EXT2_SB_BSIZE_OFFSET));
-}
-
 #endif	/* _LINUX_EXT2_FS_H */
-- 
2.47.2

