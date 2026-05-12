Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A9FE3FBEC7
	for <linux-doc@vger.kernel.org>; Mon, 11 May 2026 13:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778506648; cv=none; b=AyCwNnTCekubSwULRDeJT6mBYcbz7Z0rLfEpabILnAZJh4A0vIJQu4DLC+6KXAooEdnY8uSeHlDLpUBwVmtqURMWd2YtWp6VnWUxzHDZ8tUPNSYM5sUq/N9/k2Uj+GabXogdWUfkbxwNW/GmLMTeCqQkiRTrsrnHfL2AVpGaB3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778506648; c=relaxed/simple;
	bh=za0Q2DBBwn8oNKrdQTKd8mR/Stu6UZMpfYtUm8GQrWc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TddpjTaD8opB7PDzMLmvn8t8yamrhZatu+6A8WO6fY0ghus2kHCaP8dbwZZAl8Umdjln2eeJS4B0fTjND74aZ18rrnGf89NgMrOKUE6DhdmPI4bzTqZwHGZU6HBayWekhywZEYKHhKznKu266XONUK+UUWdeuQykyIUL6vihoRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=syRlvOkJ; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="syRlvOkJ"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3665b67ed66so1774117a91.1
        for <linux-doc@vger.kernel.org>; Mon, 11 May 2026 06:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1778506647; x=1779111447; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rF0QJW1ZAjssXoiundVFLweMgiG/T0aai6kUTr9Xtgg=;
        b=syRlvOkJrue1nt9eiwJ3fkov2tSWvaSRVPATbTzlgT9uoUxLH+H3JFU6s09sGglGH3
         5Yn5An1NWj3SDcj8UuDgGsJTllz5tqD0eRk+cwoPIO4dBlXdh67ORi29+Lc4Y6jnbp6K
         mPrNGHUlU7XOGOXTpqGbjLJQmbCR1G0Vt8J8iW/bZIarxoYyxNCtUoUY/PWOkGlPRhTf
         WtVakMQdUr6U/TOwjjzPayzb4xIn9pr2dtJZza7gH1YAEjy4vgzUw+GlPETe5466C8Nj
         cxjnelJ12tBVgKXSbh1isDrpVJudJAMAmHI22UVa1GwBM4Z8boyD0JQd6izKREYfOTk1
         yaJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778506647; x=1779111447;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rF0QJW1ZAjssXoiundVFLweMgiG/T0aai6kUTr9Xtgg=;
        b=PbNWs0xyF1DOz8YvpRnDdcwaNImC+0zEJ1z1vfBWyAuoL+JWcqxibNsds6hJhjvB++
         280zY6Hcuq7Gf7y+Qp2waAYLOSIVpq9gfTYy4xoeWi5xwEnkpUk2BPyQlegp3uUduH97
         NpC1tSAxvPTC70rMDcwYD7xV4CnLR03U1cZ5e7c40M5B0dy1fHgCvldkAlEtVvflELBC
         n6kgu6kDsWqZihiSos/J3yzoTZ8gAy8f39lZWoiu7Y9K9A2Jnz2znv+CXEKC1Z9MsHPd
         MM86YJeDdCSnNiRrBB2KvOELWM8J3wn0UhyGywEMETB+sIjEo9AZEdkcnYpl996j4T5R
         Q2Tg==
X-Forwarded-Encrypted: i=1; AFNElJ9xgLaNVpjyXiFQOTKB6Rhr+JKxE5jVx+fi6wp54bw8dsmR446acKfjEAUT7LwBuwYtceEdDFqabo0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyl1ef3DJzAuIUIJk75km3hiyJVhDlF5UJnnGPTob4tAyDkBi96
	UhL4IuVB3+gI2qOukswmY7FD3OxQBjxON3ryPUzj/Ai0pVbsbG0A3NKdmCLi8ie+0LY=
X-Gm-Gg: Acq92OGmVyJNn5JvemethGh2P0kYomFDpI1rWtJyEmhJj6TgxCnHcbPA9e25dFUnDWj
	X661Xz1qg8uQ9sa+Q5hEXaPu5KwswK+97J/ZE4AAoANyHofGvq/um1sVNRHK5anCYRHd+lSnB9V
	M2yMBEcCq6oj4h5EemPDe6DfxS5Yf4ezcNSbI9NubRcEuQKa5nCwV0E8eCkFo5jrtalw2HnH6Sd
	uMG/tNVApLslfObe3z16UJV06V+PZONoMpYwjgNegcnhd2923Cydk+Our2054HvhpKXES5M1J3v
	F+vIU/DgQRdx+de/o5eLjzHagDQgynfIUG/z8n0njhcSvVCqH/hoozQEc00BU1uNlefaTMOyIAz
	WBhICvjzECbtmO3IILiZueZChEgHXjEZcS8ZoPE1UcV/I0BwvNby0p0OkoGoklJbPnIDYLIYNpI
	fnAYZVRYgpbt1aWJ6s1yODKp0kDgU1IppLVyPStNTl1uQ=
X-Received: by 2002:a17:90b:2e0f:b0:368:9da3:c496 with SMTP id 98e67ed59e1d1-3689da3c65dmr934112a91.24.1778506646935;
        Mon, 11 May 2026 06:37:26 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::30f3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367be3daafesm3034326a91.8.2026.05.11.06.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 06:37:26 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
Date: Mon, 11 May 2026 21:34:54 -0400
Subject: [PATCH v2 09/10] riscv: cpu: Output isa bases lines in cpuinfo
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-rva23u64-hwprobe-v2-v2-9-21c5a544f1dc@riscstar.com>
References: <20260511-rva23u64-hwprobe-v2-v2-0-21c5a544f1dc@riscstar.com>
In-Reply-To: <20260511-rva23u64-hwprobe-v2-v2-0-21c5a544f1dc@riscstar.com>
To: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Shuah Khan <shuah@kernel.org>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@linux.dev>, Shuah Khan <skhan@linuxfoundation.org>, 
 Deepak Gupta <debug@rivosinc.com>, Zong Li <zong.li@sifive.com>, 
 Christian Brauner <brauner@kernel.org>
Cc: Andrew Jones <andrew.jones@oss.qualcomm.com>, 
 Charlie Jenkins <charlie@rivosinc.com>, 
 Samuel Holland <samuel.holland@sifive.com>, linux-doc@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.15.1

Output two new lines per processor in /proc/cpuinfo:

  isa bases       : <bases that all harts conform to>
  hart isa bases  : <bases that this specific hart conforms to>

These read directly from the cached riscv_isa_bases and
hart_isa[cpu].isa_bases bitmaps populated at boot by
riscv_init_isa_bases().

Example output on qemu booted with -cpu rva23s64,sv39=on,pmp=on
(showing only the new lines plus their neighbors for context):

  processor       : 0
  hart            : 4
  isa bases       : rv64ima rva23u64
  isa             : rv64imafdcbvh_zicbom_zicbop_...
  mmu             : sv39
  ...
  mimpid          : 0x0
  hart isa bases  : rv64ima rva23u64
  hart isa        : rv64imafdcbvh_zicbom_zicbop_...

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v2:
- Read from the cached riscv_isa_bases and hart_isa[cpu_id].isa_bases
  bitmaps populated by riscv_init_isa_bases() at init time.
---
 arch/riscv/kernel/cpu.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index 3dbc8cc557dd1..31e2857dcdcf1 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -305,6 +305,26 @@ static void print_mmu(struct seq_file *f)
 	seq_printf(f, "mmu\t\t: %s\n", sv_type);
 }
 
+static const char * const riscv_isa_base_names[] = {
+#ifdef CONFIG_32BIT
+	[RISCV_ISA_BASE_IMA] = "rv32ima",
+#else
+	[RISCV_ISA_BASE_IMA] = "rv64ima",
+#endif
+	[RISCV_ISA_BASE_RVA23U64] = "rva23u64",
+};
+
+static void print_isa_bases(struct seq_file *m, const unsigned long *isa_bases)
+{
+	unsigned int i;
+
+	for (i = 0; i < RISCV_NR_ISA_BASES; i++) {
+		if (test_bit(i, isa_bases))
+			seq_printf(m, " %s", riscv_isa_base_names[i]);
+	}
+	seq_puts(m, "\n");
+}
+
 static void *c_start(struct seq_file *m, loff_t *pos)
 {
 	if (*pos == nr_cpu_ids)
@@ -336,6 +356,9 @@ static int c_show(struct seq_file *m, void *v)
 	seq_printf(m, "processor\t: %lu\n", cpu_id);
 	seq_printf(m, "hart\t\t: %lu\n", cpuid_to_hartid_map(cpu_id));
 
+	seq_puts(m, "isa bases\t:");
+	print_isa_bases(m, riscv_isa_bases);
+
 	/*
 	 * For historical raisins, the isa: line is limited to the lowest common
 	 * denominator of extensions supported across all harts. A true list of
@@ -360,6 +383,9 @@ static int c_show(struct seq_file *m, void *v)
 	seq_printf(m, "marchid\t\t: 0x%lx\n", ci->marchid);
 	seq_printf(m, "mimpid\t\t: 0x%lx\n", ci->mimpid);
 
+	seq_puts(m, "hart isa bases\t:");
+	print_isa_bases(m, hart_isa[cpu_id].isa_bases);
+
 	/*
 	 * Print the ISA extensions specific to this hart, which may show
 	 * additional extensions not present across all harts.

-- 
2.43.0

