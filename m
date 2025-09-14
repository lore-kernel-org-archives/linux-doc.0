Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 145F325C822
	for <linux-doc@vger.kernel.org>; Sun, 14 Sep 2025 03:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757822375; cv=none; b=Fl+pgSCvdJhO2Vb2AgRf3OvI49vGb0ovwQ079wLlCqFBYRfzOlRZjaiOv9RiNclGZuA8Y29tD/e04Z8kpfVXa7H94hGOxsPpzh7Q6QFuRRePJI4MPOPMnwdeqwXnsG34g5f33mSOm2UemhXZsWTcXaY5qaf1HJJS9j9VjZuPQTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757822375; c=relaxed/simple;
	bh=dWOevKs33KVPp7BfwW01lTdoAaIwqA9A0zVQ5+zAb7o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QsIPvQ9Xg2v8RLE4OxtRR/UGaLQpksHhBJcE0/BlUtpb3pjSjUJrLPXd5SEYPC4XFXGu4i+5O4+LXqx/nCkZk6f6Pz+pHvs95PKyXcrkbtyx87agt5kdAeH6wygSpttyXh3I7sAv0W/IBj0zKijLoTKeCvCrDTQ5q8qovJs2JDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NrO6Dva4; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NrO6Dva4"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-afcb7ae6ed0so479128666b.3
        for <linux-doc@vger.kernel.org>; Sat, 13 Sep 2025 20:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757822371; x=1758427171; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O9abWz0+AALTE1DyE86pUo1tihrL6Hn8wt7mMTmG960=;
        b=NrO6Dva4wPAGaeFNN7il7aL1kcNhTD/kXZSqeaO7MpBzFdgEGF7io2Id4R2p/xcAtB
         IhFiGiDJ5jpuYu9D3dzCpYk7QZCGg/f7IReCoaftYHsNb+xLwcyDciuRMZKBlFq9gtLU
         Uh4l+/GodSClEZ7UfI4Q4dmPgEm5hnugLd4JjffCREANrbViB53jCYu+mbWqXoHbhvTK
         TYS01n1cq9o68pWzYNIxqzhpSPYtBxIsQauT9jrI78nQaxJ32SV7thUSVU8hNI4Uwm1R
         KkXFrDzmxAspa+v0SnGnftYv9jfyub2c4ZF2TimEB5B4nEIEHn0lZfRxMJXO21de1ZxC
         CBNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757822372; x=1758427172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O9abWz0+AALTE1DyE86pUo1tihrL6Hn8wt7mMTmG960=;
        b=DCzg3i+OfgNR/s4vDZwcVT1+s0BdIBV3hKkzb1OLpNx4Xd7hzUJgWUa2/NFcqkU3MF
         xXlWQt5eYcXrY69EPoYJQRUNoExDsTSPtB8NgCZqT9uPBYeQPpRkTHONzimphgjpRRtz
         WMScmWiv0oEfhgJq+wQvCg2cyVGK6E7NWocIRFCuNJ+WkRewfa8b9R1HaE7pFxL+tADU
         HG0AxyFKPiAWhk5NzeWdgQC/Z9J43mN4ZEzw7BNwr3e6nWj/Z//IzeK7hm+jBsvekUCr
         qwdisSOk9OCLr3V76NIazYWGMjS52fOLDY1yZl2ORITrKzZiREs/rHQrdkFdIRvDU2zx
         nm6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVSOfx7w73Z0mLjT2zJW+hHLpN4BRGbNIPnqNBX/rX7yZsJZeV+x22sSeFUSxH3d5MIM4XLMLVCmDQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQ1yuAYlX06JeH3T+Bj+FNr0vou4nor7mq4pscSQ/lihSsSTGL
	13/BlRsUD3KbePJrzTO2ThvvQ2Y5EveAKIA0XUzYX9ZabnVtznDGJ3Vo
X-Gm-Gg: ASbGnct2oU6k4Gr7YsVmoK8V+2bi5Wov1erxYC7WxEJcRaBhh41CTjr1DqtZ7x++4gG
	kmaVpUoAxQbk72H6Mh+lpFZpOWnBsIVz3+uahNbZUZafMDngNbkPe8uMNY7NM8y2ellzZrDuFoZ
	AdfjIZotBFAJKOZlgQ6bWLm2Md2ZssKoNgYNE9JpHuBgHJTcOAssic7tAvM+0FypQKfip/2Qthe
	xTu1e+YPucXispkts6sbxB1m31B/6E2QPuTsaJD0Dua9tS4dCn8ZKp+9pdWFgW9HS9+6BaoOlnm
	YNuuVwIe+BbOYalRkR+riwcD9Qgs/uf3q4c6Ze6RYlDLN9uA+QqtgNffXld/nvdscFRaVxmf4mX
	6FY9O3yGdFKzFOGUSFto=
X-Google-Smtp-Source: AGHT+IHIaNmlQUOqaI2XvHaD2x2sJJCA+iwXMxeIqgPaozK4MzRrxS2gXxwIxVkINaRf0GrOSh3U1Q==
X-Received: by 2002:a17:907:3ea6:b0:b09:48c6:b7ad with SMTP id a640c23a62f3a-b0948c6c6a4mr387666066b.57.1757822371514;
        Sat, 13 Sep 2025 20:59:31 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07de03d93csm287001766b.12.2025.09.13.20.59.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Sep 2025 20:59:31 -0700 (PDT)
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
Subject: [PATCH RESEND 53/62] init: rename kexec_free_initrd to kexec_free_initramfs
Date: Sun, 14 Sep 2025 06:59:26 +0300
Message-ID: <20250914035926.3770703-1-safinaskar@gmail.com>
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

This is cleanup after initrd removal

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 init/initramfs.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/init/initramfs.c b/init/initramfs.c
index 40c8e4b05886..d52314b17c25 100644
--- a/init/initramfs.c
+++ b/init/initramfs.c
@@ -690,7 +690,7 @@ void __weak __init free_initramfs_mem(unsigned long start, unsigned long end)
 }
 
 #ifdef CONFIG_CRASH_RESERVE
-static bool __init kexec_free_initrd(void)
+static bool __init kexec_free_initramfs(void)
 {
 	unsigned long crashk_start = (unsigned long)__va(crashk_res.start);
 	unsigned long crashk_end   = (unsigned long)__va(crashk_res.end);
@@ -713,7 +713,7 @@ static bool __init kexec_free_initrd(void)
 	return true;
 }
 #else
-static inline bool kexec_free_initrd(void)
+static inline bool kexec_free_initramfs(void)
 {
 	return false;
 }
@@ -743,7 +743,7 @@ static void __init do_populate_rootfs(void *unused, async_cookie_t cookie)
 	 * If the initrd region is overlapped with crashkernel reserved region,
 	 * free only memory that is not part of crashkernel region.
 	 */
-	if (!retain_initramfs && virt_external_initramfs_start && !kexec_free_initrd()) {
+	if (!retain_initramfs && virt_external_initramfs_start && !kexec_free_initramfs()) {
 		free_initramfs_mem(virt_external_initramfs_start, virt_external_initramfs_end);
 	} else if (retain_initramfs && virt_external_initramfs_start) {
 		bin_attr_initrd.size = virt_external_initramfs_end - virt_external_initramfs_start;
-- 
2.47.2

