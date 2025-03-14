Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F155214225
	for <linux-doc@vger.kernel.org>; Fri, 14 Mar 2025 21:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741988422; cv=none; b=Lg2gxPGWJsW9kBUN1qU3+7APKMFom9fuOhPE4sNiRZQBWaBczYZ9BR1fF/LLcfj4HHshotPZoKUPEkvbEMuVDOZNt4rrWauRDkwpOmHpMMmYhFkDGW2eHCNRyHx9bGtDTrChC82+N2Kx5qi80DZeXnBNaBmgA33idGGYI/SIplE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741988422; c=relaxed/simple;
	bh=0dX52Y443DeRNN0WFPCjetYDG1hNhb+yk25hqK0FOMg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FMOUg9rt0igioiutZrQ8nrZmLnWWIsWc04UEB6K1SnxtRm1xyViExIq+pkHBNVB82D7BNwwY7vpugURa+58GNtyY1msjNK7jNaVsAbErci9rO255Om7JrQMSMMdR7HAnV+I020MC+6VE/O2oJx4GlHJWinJZ4mpiq9tbCHUOSH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=qUEwchQJ; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="qUEwchQJ"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-22113560c57so51675715ad.2
        for <linux-doc@vger.kernel.org>; Fri, 14 Mar 2025 14:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741988420; x=1742593220; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vuh2Ubzjjn4sOmi3QJw6bgfZV88K7WLhUaWOfvtqDdM=;
        b=qUEwchQJho2wUWpXUDwEbj7awMpeUFpD1YzNsHIzgFPG8YzvjG1DmIlTGcyDe+Bwxa
         A7rbRm9xh+A183+AzJrZDFBGaRdCL2gcAY5rHa3AYdRzEosabOcRAAmCxrbaoV760jUr
         v5BVOLwisrIYRoEQB7u4KNev/BTRPBR5sLr4F0ssNtB/yhedRo/KWH7MzSgIKZXJaP9s
         UGBM5y1B7RYp9MPxAckjg2mNfmmUsIL9XA1SOmD2NmsqbWpr4GXQGpT4ApGYzl9nyBSc
         PeGKYfOeesL3vLeQBjNGjQ0dgiaqlebgmYX/1nJzc5nqOOv1WIZYN7ivhFSLNgtbvhRp
         8V1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741988420; x=1742593220;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vuh2Ubzjjn4sOmi3QJw6bgfZV88K7WLhUaWOfvtqDdM=;
        b=F02r33JX522BBEacaTuUq2g7HQGnLrF7RRZKzyFmutmODW/ftrIc1SE2BHqBH5SNy6
         4IVnXHuCz3TpVx3DtqaiC/UUTEuS5vroEKKxxl/ZFDQcqNjzopovvoMcDRwU+fpl1hay
         rjkaXDZqk9uRDmL40ywdpnFB38RlaFt+9opY/9WpzFhfVlSzxOxb3SW17zsw8ldLEfSy
         4CoqxwoDSTMXqh3TsFuOkRcfyAOsBCQVCpkaegrvb96ggwbybRAk+XIQnBWfh+UOiqxU
         l8wH3rlt4fcDut7lhdUC38n1aBQ1NjylHaLhhyOD8LBtaTW9ss3pY2Dnub4c6YlLnQsH
         3Fmg==
X-Forwarded-Encrypted: i=1; AJvYcCWFzBQMjTkuDPsMxsMQo/1ZHCwm6Tzu3XU2qI9nDy99IorEXKzDNd0z8W7daP7s/BimDQsRGeWdETs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+YvTxaBaUk11Kh7e329JqD76nxcWEM3D+15F2iSrvI0UggZYN
	pb3SzzKSsj5Dlj/qUL/+W0bFDVqoIasAixATpeDdRF5USsmoSTtMRuYBM1cf8t8=
X-Gm-Gg: ASbGncv4CTyqg0xdSR1lbcICn5o1hYShs1FFtEf3r6HcrzEA0weLX86F4udAr8p0xAJ
	6F/zCmSMQhzfx31gd8QSygTggtfKdnAMdnXD0VVfaC2UZvy7Ymg49ggdhZJppWKb0TU9xxgX4We
	yFG1OWIHbinWd8SYrArWD0uL0HsNgP9IbhhdcjN/psMSKLEVEZNYGyrrhrgve2SAYcERbLos7yu
	SuOE0bI5H7m+CrIY67enDaftNeeVfzoOx60TvffPsY1YLfbJMoTyTTPj6bwK1OyyPL1QzZlb76T
	Eqcps6WNkyaHlesCrfNpjwQpEcDFLLH3o09pWVJYUSTHeCXwR6mSEQ8=
X-Google-Smtp-Source: AGHT+IFEy8ShegH7q+9OBJ6uPIx07DqrMw8WFpOVCCYLkkSk1e6aSP/3QYX2LQ2zeOkBSAdDiCkRtw==
X-Received: by 2002:a17:902:d50e:b0:215:94eb:adb6 with SMTP id d9443c01a7336-225e0aee9bbmr48850065ad.40.1741988419768;
        Fri, 14 Mar 2025 14:40:19 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c68a6e09sm33368855ad.55.2025.03.14.14.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 14:40:19 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Fri, 14 Mar 2025 14:39:39 -0700
Subject: [PATCH v12 20/28] riscv/hwprobe: zicfilp / zicfiss enumeration in
 hwprobe
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250314-v5_user_cfi_series-v12-20-e51202b53138@rivosinc.com>
References: <20250314-v5_user_cfi_series-v12-0-e51202b53138@rivosinc.com>
In-Reply-To: <20250314-v5_user_cfi_series-v12-0-e51202b53138@rivosinc.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Christian Brauner <brauner@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Oleg Nesterov <oleg@redhat.com>, 
 Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
 Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com, 
 andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com, 
 atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com, 
 alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org, 
 rick.p.edgecombe@intel.com, Zong Li <zong.li@sifive.com>, 
 Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.14.0

Adding enumeration of zicfilp and zicfiss extensions in hwprobe syscall.

Reviewed-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/uapi/asm/hwprobe.h | 2 ++
 arch/riscv/kernel/sys_hwprobe.c       | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index c3c1cc951cb9..c1b537b50158 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -73,6 +73,8 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZCMOP		(1ULL << 47)
 #define		RISCV_HWPROBE_EXT_ZAWRS		(1ULL << 48)
 #define		RISCV_HWPROBE_EXT_SUPM		(1ULL << 49)
+#define		RISCV_HWPROBE_EXT_ZICFILP	(1ULL << 50)
+#define		RISCV_HWPROBE_EXT_ZICFISS	(1ULL << 51)
 #define RISCV_HWPROBE_KEY_CPUPERF_0	5
 #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index bcd3b816306c..d802ff707913 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -108,6 +108,8 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 		EXT_KEY(ZCB);
 		EXT_KEY(ZCMOP);
 		EXT_KEY(ZICBOZ);
+		EXT_KEY(ZICFILP);
+		EXT_KEY(ZICFISS);
 		EXT_KEY(ZICOND);
 		EXT_KEY(ZIHINTNTL);
 		EXT_KEY(ZIHINTPAUSE);

-- 
2.34.1

