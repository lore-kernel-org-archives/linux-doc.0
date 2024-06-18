Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5554213AD25
	for <linux-doc@vger.kernel.org>; Tue, 18 Jun 2024 11:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718711227; cv=none; b=STTTzEj6oxBD3BpIGi0+OpuM3tzGjVAwKMTbbS0/l7vhpAG9FKCEFT7BMRWq2rRPXcRiq1CPVAd+NdtTjs0pzdYT0g8+n3OeD77uvLcIMUuyp8ovaSldDB8j11bp1RMwul9msAygGbcpnjeHo+jCAkuoM6TcN6FghOyj2kJVL6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718711227; c=relaxed/simple;
	bh=ZHcxqMe2wl7XXw0sTwxebYt93dT7YO9q83kwx2ZKj6U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XQti1zWwfXWmm5c82FByTiNueSQT5nZS1nVePbZKC4UE+7WA+eLrdSt/naiWRKONZZXhu55RmFVsUERC1zbROItLuci3WNl2Om35Q4DvJxQYXkaeK25gUM+zu4gMWXO7BroY/6+6jf9bx25fqA8gIHCJxPztb+5IkjbcgxsxOeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=eJFSyRuJ; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="eJFSyRuJ"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-6e7e23b42c3so3472627a12.1
        for <linux-doc@vger.kernel.org>; Tue, 18 Jun 2024 04:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1718711224; x=1719316024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N8+RGABEO6lna9EhwFH7VWtP9seFYP+2PecyhqqiBFA=;
        b=eJFSyRuJUovruTCikD4RZh4+0NZwMqyftAgMYKyrE0XKA03kCRWoiOFOu3N9ays6IT
         qee6cidxJyWBhxMHEek7ADNpD//59ckgA06kXtAw97Y6cSSoNDod6QvQMCnWvTY4Wncs
         unLFjv67qA0tikSmgJvWjKTqcxoMquHEG3SRT8hzfB7GGI0E1DyO9L5GiGeR0d6SiJaO
         KunXzVa+xiJAegH/jT4CCoOVI/S3UYvdEgmi0Z8UQnUw6y56Bh2ZCe8oyVG5yipbufCr
         PZYZoVkuSGvAdL8ZXRJimaGG71JcZjUb0Ievr5TZ4sg68V8MyIbyUKGxKhGQoM+xDdXd
         EAaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718711224; x=1719316024;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N8+RGABEO6lna9EhwFH7VWtP9seFYP+2PecyhqqiBFA=;
        b=xRL0gDC/DaVKNKq5slOOcFxMnNIrXHeWsVCNcEojMNXHsbFUjoY02E9W9nHOUo7h5F
         YSAkNzOHESqmeHa7qWVSF/JRDkIc5juw0OE3Y+AQG0uW/4wQ6AA9iHWl4+1PZVVNG7li
         0OP4rN7F5LUR+PqBa0p0x7XI0/NtbZsijarw2nVwGX72/n59gysfSYOCjlxKQsXZc5vX
         ccZvb5nyDpqvtL0S5pUDcBBnN2CsusyqFep5vG3teT+Tu33hgjTgWolmId5rGYLQ62Ox
         uE8ryBTDSOvOaO3Oej3gLl0cWgJZet+hoPNdN628HjSmV6goRBTBGmMexWXZymrO4lq5
         /O2g==
X-Forwarded-Encrypted: i=1; AJvYcCX9tbhzq6YJU2s7ZQec6b54XfuULH98uvZfw1Aqsr4/HSyWHWqp5iR5KjUPn9tR3Q/sTClAcIFXdC1BfYw74WKBJjTBst5wKR5q
X-Gm-Message-State: AOJu0YxLF2SfEJ++ZPjpHPJcBrP3WGFl2xZEC/ZGJ2PmDN8pVOX+db52
	h84bwkbU5sBcClS6+7wa8UugOhEONMTxQHtHOHUMmBbfhvfpRRphN9rXL0bTe2Q=
X-Google-Smtp-Source: AGHT+IGFDOB6kB9pshWCoiP1FpV8JeCOOgnEc3F8axKP2a4fh9M2ef6HmKlyehClnbcRTMajNGf0mQ==
X-Received: by 2002:a05:6a21:81a9:b0:1b5:69cd:87e with SMTP id adf61e73a8af0-1bae7eb46afmr9188496637.21.1718711224523;
        Tue, 18 Jun 2024 04:47:04 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.245])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855eeff53sm95717365ad.181.2024.06.18.04.46.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 18 Jun 2024 04:47:04 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: corbet@lwn.net,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	cleger@rivosinc.com,
	evan@rivosinc.com,
	conor.dooley@microchip.com,
	cuiyunhui@bytedance.com,
	costa.shul@redhat.com,
	andy.chiu@sifive.com,
	samitolvanen@google.com,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH] RISC-V: Provide the frequency of mtime via hwprobe
Date: Tue, 18 Jun 2024 19:46:53 +0800
Message-Id: <20240618114653.12485-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Palmer Dabbelt <palmer@rivosinc.com>

A handful of user-visible behavior is based on the frequency of the
machine-mode time.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 Documentation/arch/riscv/hwprobe.rst  | 2 ++
 arch/riscv/include/asm/hwprobe.h      | 2 +-
 arch/riscv/include/uapi/asm/hwprobe.h | 1 +
 arch/riscv/kernel/sys_hwprobe.c       | 5 +++++
 4 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index fc015b452ebf..0cc3ef5b5541 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -229,3 +229,5 @@ The following keys are defined:
 
 * :c:macro:`RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE`: An unsigned int which
   represents the size of the Zicboz block in bytes.
+
+* :c:macro:`RISCV_HWPROBE_KEY_MTIME_FREQ`: Frequency (in Hz) of `mtime`.
diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hwprobe.h
index 630507dff5ea..150a9877b0af 100644
--- a/arch/riscv/include/asm/hwprobe.h
+++ b/arch/riscv/include/asm/hwprobe.h
@@ -8,7 +8,7 @@
 
 #include <uapi/asm/hwprobe.h>
 
-#define RISCV_HWPROBE_MAX_KEY 6
+#define RISCV_HWPROBE_MAX_KEY 7
 
 static inline bool riscv_hwprobe_key_is_valid(__s64 key)
 {
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 7b95fadbea2a..f7d9646ff4ba 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -73,6 +73,7 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_MISALIGNED_UNSUPPORTED	(4 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_MASK		(7 << 0)
 #define RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE	6
+#define RISCV_HWPROBE_KEY_MTIME_FREQ	7
 /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
 
 /* Flags */
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 83fcc939df67..3fa519035416 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -8,6 +8,7 @@
 #include <asm/cacheflush.h>
 #include <asm/cpufeature.h>
 #include <asm/hwprobe.h>
+#include <asm/delay.h>
 #include <asm/sbi.h>
 #include <asm/switch_to.h>
 #include <asm/uaccess.h>
@@ -226,6 +227,10 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
 			pair->value = riscv_cboz_block_size;
 		break;
 
+	case RISCV_HWPROBE_KEY_MTIME_FREQ:
+		pair->value = riscv_timebase;
+		break;
+
 	/*
 	 * For forward compatibility, unknown keys don't fail the whole
 	 * call, but get their element key set to -1 and value set to 0
-- 
2.20.1

