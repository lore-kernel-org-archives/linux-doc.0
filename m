Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C511339A4
	for <linux-doc@vger.kernel.org>; Sat, 13 Sep 2025 00:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757724596; cv=none; b=IEqKy5ojm0tacYjxwvcQEn5FKgaBm6OkcJntHOKjBLdxhvG8L5r0k465xaeFz2IEG8Yyp8JHmPxOE5n/3HQeLOeluKKHcLvUqg9HvySEiAc6MGFiakHquT7ng05PazqARXee6S9vCsNQLtbQ0nw9fJPIueiOoWyVX/mZzGd2IpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757724596; c=relaxed/simple;
	bh=aIH0UEBp9jrH7zT+VD2BpCtGu5L0ukANS11y+zY/wiQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NZ9AaN3RIZi9krkFcuI2RhivqHKu8WxQ0KD/LyEDzAeLtzYBTg0jo9XeblkLPUwk41j/UsmfhYIzZToeK+T6xSMUl6AacmeroL4wDNMZUNkYG4MFxO7al+FhDVbNtM1nGLRXl/WSWIaCKsOu3I9TfWp0GZWCmpHyS62zdbX0jzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bnalPX+q; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bnalPX+q"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-620724883e6so4839180a12.2
        for <linux-doc@vger.kernel.org>; Fri, 12 Sep 2025 17:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757724592; x=1758329392; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k6cH8q1TrVQNxjzjuQXybOp7uw+/s7mQTk4MQOvceKM=;
        b=bnalPX+qyvgr51ymiDlUfPxoeZUYWgEFDy0cQeYqymsBCvCezOGrJ3U8Al89pGPiSi
         SSyRFcIuh3aPN7d3nbj3vFvet/FtixGvtToqVpvbhZnl71bJcjH55pysGpeFLsxcJClr
         Bt/m6pOWSQS3nswISqsPVyKXarq9cHQAiqrIJRpMDOcq4sXGJxOcdj37SQNsEzQrAS07
         ojQ1n2EnI2YZzsJI23mG6otl+nP4GjF3XGApnMXBOQzVVuhDymKpXPgfAkD7IJvdXDnj
         ysQ8Cd7j3XqEpnxg98FXaz0YvfYwLiaeShFJBYv68hPUadpXC9ulul209mPf00t/7nOW
         Yx9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757724592; x=1758329392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k6cH8q1TrVQNxjzjuQXybOp7uw+/s7mQTk4MQOvceKM=;
        b=b41U7QQVN0DjAAVHkMkOQyoqEb9eCcjGZF7DdY5S6hWfTYrQfgkM25wFBtHPXxDcj1
         +MQ2tHKhg5xiv67FvKy+7r1bzJ0BBt63SQ0ZytQnEE8q22mpj5A9ofnhsj8FHVoxT6lj
         tRdxT+CTn6LbYi0A8PE6FT0tbmvJmRqBaDHTKZ7MZjKp3a0GW8gJBng6WfCokK4r7f+n
         X8rwQtHJsFVZlyzQleTtlduhqA/QkXJgjObjV5mJQ5n8y0wBBvabWwb391XwN+ZCupn0
         6Ezk2Bx8BepeCVpq2t9NIDZJZ4DNS3iItSInvfGfSZXvj53ap5zdM5An/IEuL7ez25C6
         hb0g==
X-Forwarded-Encrypted: i=1; AJvYcCXlcqr1OBwQkVqKels9Xl44UliI2pJwekCjJW958Jp7eUhf3E9z60sDdAAGg2EwM4jSY3ZT7rgr0mY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9CCWteUkL7tvuay/RHznly+ssl5BurgAePl/+GLrA+Pr8zEVG
	lFDRXAMBd0seR46Hyfv1f0M3227bBE0h77JKva4pSXBDem5nPP3slyJL
X-Gm-Gg: ASbGncuSofEON9T6sdGCmbGSk4orK/t728NhYCmF1p2v/6wLOo5fKiu+0leIhS7HZmN
	AdH6HpNwamZD7rzPOjdrJWEsOJznZW6xUrqSFa4jC8HOl0OV9f3AcO/XZiBLLgHhIUSlYvVpYqr
	avdYYUdKw+stiYvCIB3cWTsEJFHmkumBk7rostZQ9r8GqzJ+Hi3EA3na2uurepWO4nIJfTCdgf5
	cpgJzQnQNVg3VqLzhDNr5xvJ+pjzoYsPrMKzXMoY7Lnm1xNswBoFFE/ZeD+3ihlDf4RW1ZxpV/D
	Rb9LopW3JPER12IASDzvrhjeXJZTFoEAoBDx6Kh/5ca+3ShOCMfo14PK6bbJaUbh09v8SA8xW+y
	GmSGusO2mthEw5vHO4BT9lWq4M3dFmg==
X-Google-Smtp-Source: AGHT+IFuaD6uE53o0kMUFqkBYFUIpIv4YZNYfnndGaXs7B0K4+B96SRU2dTVgEWhisS3xuLKgCtRtQ==
X-Received: by 2002:a05:6402:4316:b0:62e:df3b:79a6 with SMTP id 4fb4d7f45d1cf-62edf3b81cemr3814693a12.1.1757724591635;
        Fri, 12 Sep 2025 17:49:51 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-62ec33f3b6csm4149162a12.32.2025.09.12.17.49.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 17:49:51 -0700 (PDT)
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
Subject: [PATCH RESEND 09/62] arm: init: document rd_start (in param_struct) as obsolete
Date: Sat, 13 Sep 2025 00:37:48 +0000
Message-ID: <20250913003842.41944-10-safinaskar@gmail.com>
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

It is unused now

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 Documentation/arch/arm/setup.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/arch/arm/setup.rst b/Documentation/arch/arm/setup.rst
index be77d4b2aac1..01257f30d489 100644
--- a/Documentation/arch/arm/setup.rst
+++ b/Documentation/arch/arm/setup.rst
@@ -86,7 +86,7 @@ below:
    initial ramdisk.
 
  rd_start
-   Start address in sectors of the ramdisk image on a floppy disk.
+   This is now obsolete, and should not be used.
 
  system_rev
    system revision number.
-- 
2.47.2

