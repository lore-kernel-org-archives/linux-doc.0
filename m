Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCED6267B90
	for <linux-doc@vger.kernel.org>; Sun, 14 Sep 2025 03:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757821426; cv=none; b=iEtbp2CIGbc67oE62qipLiuBPeQGQgyN2/KAeJAXHPgmvdRusGmM1nljtHzq9xEyyDmy1QbUJf8sR0lQPUYOfqLZC53xnFTWR8AbBGdUYU3uU0rWsNENTMRacCT6x3LpI+yAs4VwRb7FZPO77i3OVyexOvF5OyUx2LzRcq/xFXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757821426; c=relaxed/simple;
	bh=Rey/ebl7WFu2BHJpZO0tlGb9Yvux/yHNtNSpgXJUf3k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YyLexTSkvGkJo3wPN4RcdD6/AAhwevEOzhZ+gtdRY1O1it1W5xYS9ipxKPeYcijps/h9Ov/TWHtgwX0IMv0NqvvjQa7atrF2GnpYEEkSdxzsIpdGteljcQLvguVSJaV0uST4GnLuNXbn3HWLnN8UnWlsmRmnq49+0p8kvS0cxUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Meuoho8s; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Meuoho8s"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-62f24b7be4fso693066a12.0
        for <linux-doc@vger.kernel.org>; Sat, 13 Sep 2025 20:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757821422; x=1758426222; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Edp+OfqM1e00xcpSWGvAGWC/LGQGu+BMiq7TC0KqX/w=;
        b=Meuoho8stdCgQ03Hoq6UgAr03TaN96IypV+PgLqP/nGA44yo2zt6U929mjRx+HCq13
         FPWIoc3jiMY7qBRlszyNQbvaQVxYynf3mcVS4ZUqM9DXZXSglG7vOuDf+9BPpKpwhOE5
         esyrIr1LmwK1sh8FW8bsMCVhqfrrjJWn3/4I8UakoSU28KzFPHuQL9W0/2J7g0A8nZ1O
         T5RsV+SSGzPKnwo1gUBPlfDSkMXh66xIdqSXJL7EHd2oWfyzikGuiq7xGrG+i6kSggsO
         7dLhiHDpmeMEhTiC4sxGkbT4o1wUK7rDi6kWKBKQROziCBkBfVzJywQs93poRxb5DR22
         ZxIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757821422; x=1758426222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Edp+OfqM1e00xcpSWGvAGWC/LGQGu+BMiq7TC0KqX/w=;
        b=mQLoHQakOa5t6P70ZrYYU7sBkYQTm3jzkBt+4Xo85OmB6On0ea4pdl5Gy58URV3sbs
         fTkF59RGr4yU/ibWgTquv/KIOT5hSILrM1pXXVMLvq9hiN7Hmd7XfhJqcp0LqTUqGK+Q
         z2y13WvwSs87HZD3RQ141wQQx0cGuzMI78wW7m1cD2pdBvtK3viE14m8uVzgJ8IslRXg
         lVwFubypSOeRGBh3psxk4dP54X7iIVB7pPcVdzH1gB+qSNBFEYlEazNcuNIQdlDR6X7Q
         anw5N7bxqfQY1kMQWybNYhKBWgqnplmt6Z7Um1ocijXzuvieGEVv7li2ENwxvjWS0uI0
         voDA==
X-Forwarded-Encrypted: i=1; AJvYcCUyB7wrMzLX5Zcl2T67t4BwkQmTovsbEBYvBOM9sf/vMa4LutUTFjcElBCT9qeE/uhtaOgmT8TFoZQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi9PITpSgXUKrqHH23d8o5zVXKsR9H3Bq0q/PARRrv1ID2U5HF
	9B+bvw1n2dtPSXaqP/OoA8huOZddoqHa64E45RjmRARG9N+8iqAX66s9
X-Gm-Gg: ASbGncvZKOajLNGHCSdyJqI/7o1gbRZEU9OtFppx743o7lTp1Lh87zqcKbWcNKXzpyV
	V2tWuNnttnaX09nsVos2R6ExYm3ADKn1IZG4i05i5DAbA5v2+VuODgD/4zghV6Arer0wjQ0gAiY
	oQqgBfBZW46rqS4kwWdOAnkqud9wj/HmVxYWCIiofnWw5CbFeh+TiVCNKcfgNPlIxgXa9oMScdW
	UmVzCcxY8ZO88N1b5WQejPJ0B1WN29cm57ypsB8csPc+Bg1Fvq9HnWOTm2S/2PtluaQx9qnWAHi
	RDvG9IFTWqS6c79oBlELShUYSMKmXJTyJhU6w6LUukGMion/TbTnxJjyzwVNY0jQfV9h2O8UYNO
	w8qdQzUL0RxfM1ayI/co=
X-Google-Smtp-Source: AGHT+IET6lw3qY9XyvNvb3pybcnRN4nnQ2bci5TeiF0EBvfDGIL/USbY9x3ZkIUotRlW6z+hFZZ7Dw==
X-Received: by 2002:a17:907:72c9:b0:af9:6bfb:58b7 with SMTP id a640c23a62f3a-b07c354e9b4mr721980466b.5.1757821422077;
        Sat, 13 Sep 2025 20:43:42 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07d2870da1sm345137366b.13.2025.09.13.20.43.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Sep 2025 20:43:40 -0700 (PDT)
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
Subject: [PATCH RESEND 37/62] init: remove root_mountflags from init/do_mounts.h
Date: Sun, 14 Sep 2025 06:43:35 +0300
Message-ID: <20250914034335.3506706-1-safinaskar@gmail.com>
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

It is already declared in include/linux/kernel.h

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 init/do_mounts.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/init/do_mounts.h b/init/do_mounts.h
index 90422fb07c02..e225d594dd06 100644
--- a/init/do_mounts.h
+++ b/init/do_mounts.h
@@ -12,8 +12,6 @@
 #include <linux/task_work.h>
 #include <linux/file.h>
 
-extern int root_mountflags;
-
 /* Ensure that async file closing finished to prevent spurious errors. */
 static inline void init_flush_fput(void)
 {
-- 
2.47.2

