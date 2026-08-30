Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E176D3B9617
	for <linux-doc@vger.kernel.org>; Sun, 30 Aug 2026 16:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788106363; cv=none; b=l1uE/w946xtjIcta7DqSBLmIhL1hC8Lrkq0s+YE1wU1dFBW0+xdr+NMFRy70GZmBHTM/uMK7eOxpbzIMAFWFW0X3iDw37a5vG/aZFECQokLvWJDtusNQqE20yO8juAGd2t+vDcfQj3z2QKXDiP7pW2njDSu28TixhbAvDP2FGh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788106363; c=relaxed/simple;
	bh=JGZgOh3NLnQ3zE3ReM7hQZC4iKeVrPllBAT/3U7VeAc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B2bgsLs9gGfllTn7/7dpO/0JyA79KBcNkLhypNpnS8zQAsCfBF9GMDBmVrJqDndH/IsrPqT1N+O/USO/BAq9u2oUBkMCgkuvxONzdzSU9b/q1m56GzxbQN3GAOKRxCmMyZH7nLFz5M9OvJgXIe5k26iQ5xBFDbIaH1dJoyltRtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eh3SVeDk; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eh3SVeDk"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2d9004f39d3so7697865ad.2
        for <linux-doc@vger.kernel.org>; Sun, 30 Aug 2026 09:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788106354; x=1788711154; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NdTRN44Y9INGZlIdKi2+i3Dw0ibf1fzMAsMfvmYvVnE=;
        b=eh3SVeDkcASA+OzGer+RuE0DcyA/Z7AwG/LgS8k0tKLzNk3Gjc343kvpqxinY9eps2
         sNQkpKxgJcpZE90lODYoh6ADaFtdRUmPWhAF1jOibWZ9prjWX4lPjvcnZTi6eAA/9/uR
         QJsBPMSh5WdHVseSoEyQaYSaF3EyTjNViy9w9BG1f8ic7S8id4mql7sN2BNU8Pw/QJfl
         7OB21SgLqvATM3QWYM26MFOCDsRO8ur4W1qxaw64PaSc+nZxUDNkiVDhG4POVnF3PJJ/
         JZdrBzrPQqD1tK5vyagt346JAawxRMwXmKUX9iJCh/trrt1h8m7Qu5b0Z2KhIFJ1A0Pa
         HxEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788106354; x=1788711154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NdTRN44Y9INGZlIdKi2+i3Dw0ibf1fzMAsMfvmYvVnE=;
        b=J3MA3MTcq9q4AeW2bxyV3T14qcTNqDxawr9dfRvjvzDnlDs9IGn6r1y/JrFmlWH+F1
         DwFz2yINjmqMBL70a/ZyyOiElgOJvuhGeKUpp8c3eB/bujDHe5xBAMcYxDjPrMrmSsVe
         /sdHL4mZ8PfDrlIwaJIALjUMiJ986qH70jaGNfsWMt1nRP8yT+fyVid1IwSuRZZNZ6I+
         QiDsP+k8nKafEo0hLON+Mpb6rZdoDsWIN69iCHnC3pfX93TmJQO2q8ImOnF9AfZl0g5e
         A3qqsZbZEMQuNT1SWyxPuEWSIN6Ex07lN0ELaRhFeEPpWL6fudYK+yXcEyqVwb9tXsEj
         Vl1A==
X-Forwarded-Encrypted: i=1; AKwUvByY6NxgWmaqUdYFjfS6wjEiV8KqW9HQBVywF7C1SM7qxslqyfDk4RqDxU5EeZbJ4pfL+cRFxAm/QRo=@vger.kernel.org
X-Gm-Message-State: AFuF++l7Ayj2k/dCqnErBgnRiL+apQh5CGMA+3GLgbBUn82QvXgpGD5Q
	8kA8Ax/FcmtLvj5ZSr6KP/jZowgXXiQkkUIw86XVaihSEkbGpm68ooVy
X-Gm-Gg: AYBFou3MPDoqCGJcSDBNoRdeHKwOLbO4iM/M1YEsVFuggj4eOTEo0RGbFRyEK9S9kml
	J8fUSVO6CKgd84Fg1sIx/wt40i8NFvW8CVqlenmTHZK3eDWLKXNdncYgPEOlE8EoLMWk1y2LnW3
	UAoPOGxX5hG7gtDTcx71qH5E/HobEbPuVQcrdtpteMW9Axei4UvOlSqsaSJbDwBgbJxSY8Yxa1k
	SJSD7kDjvZoWbeSNQgIp8ncdu/+4tRaGKaDu3P4dWykin57+g8xh6YA/DiCFuldINbQvvB+thhu
	DH0fl901f57ybgIHS/hLaAa5UIIIRRjXIabKtvIrotrbs7PVoH15Qjf5gpqeZ5xffPJjM15mX+t
	QGiH7rd8jnsHkF/k5uZed8YV9jCuRaTEbM1I6tBJnR8B+vBiLxwCh4u3jedOnWieQorjaa/2WMo
	QHrgKb5T25dRrUh3pdNc8D0lhDISCyWTkazbylHqsv7hNITo1nUHSj6O4qLsg1nQkS48ocX3N4b
	yVSXPrf8VgV8qQjPaddTqNs+TkddRTL4tg=
X-Received: by 2002:a17:903:1aec:b0:2d7:203b:9863 with SMTP id d9443c01a7336-2d74dc6e97fmr364985975ad.1.1788106354469;
        Sun, 30 Aug 2026 09:12:34 -0700 (PDT)
Received: from localhost.localdomain ([134.195.101.83])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32bdfd03e71sm5719005eec.1.2026.08.30.09.12.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 30 Aug 2026 09:12:34 -0700 (PDT)
From: Yu Jin <lambda.jinyu@gmail.com>
To: linux-riscv@lists.infradead.org
Cc: Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Yu Jin <lambda.jinyu@gmail.com>
Subject: [RFC PATCH 2/2] riscv: mm: correct the stale RV32 TASK_SIZE comment
Date: Mon, 31 Aug 2026 00:12:05 +0800
Message-ID: <20260830161205.80162-3-lambda.jinyu@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260830161205.80162-1-lambda.jinyu@gmail.com>
References: <20260830161205.80162-1-lambda.jinyu@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RV32 defines TASK_SIZE as FIXADDR_START. Its value depends on
VMEMMAP_SIZE, which in turn depends on the configured size of struct
page. The fixed 0x9fc00000 value in the comment is therefore stale.

Describe the macro relationship instead of replacing one
configuration-specific address with another.

Signed-off-by: Yu Jin <lambda.jinyu@gmail.com>
---
 arch/riscv/include/asm/pgtable.h | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 40b1ed4f3ea8..32348787462c 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -1231,10 +1231,8 @@ static inline pte_t pte_swp_clear_exclusive(pte_t pte)
 #endif
 
 /*
- * Task size is 0x4000000000 for RV64 or 0x9fc00000 for RV32.
- * Note that PGDIR_SIZE must evenly divide TASK_SIZE.
- * Task size is:
- * -        0x9fc00000	(~2.5GB) for RV32.
+ * For RV32, TASK_SIZE is FIXADDR_START and depends on VMEMMAP_SIZE.
+ * For RV64, task size is:
  * -      0x4000000000	( 256GB) for RV64 using SV39 mmu
  * -    0x800000000000	( 128TB) for RV64 using SV48 mmu
  * - 0x100000000000000	(  64PB) for RV64 using SV57 mmu
-- 
2.43.0

