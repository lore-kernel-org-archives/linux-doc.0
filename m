Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF543D0C07
	for <linux-doc@vger.kernel.org>; Tue,  2 Jun 2026 23:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780442101; cv=none; b=AriukCDH/i9TNfC8o8gViZfapLxL3G7sLcTvpxT5zNjJKZ2YGqrAJIQ0X14gJDxrlBx7PpB63jKeAhFWNxAupx5s/x0rFZvba2B4RbWc6l2hWwL0p5+3rApdH3hwot8pNu9zdL5KcXEtwi1VjKzEadsJXbUik95p96aRk5fmxME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780442101; c=relaxed/simple;
	bh=tvhH0zhqIk8afs9rDuWoi/YmPHardg/YTAjvWDHKFDM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Pew5BibOUEs5AG1TeHI5TSTByn3v7kwC8GKYv86b+vsDgVuWxOeCHJcJW05Iv3rWPjuqOn8u8hzrcxU0zzc9qySEQgVPHpTa7d5WBjcKe1t6wXrJZRPeodiEuNyYV58hM2uLxZuyKrjUrhXSV1lICRAVjq1vAwLCex8BknzWOzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mIu9obkX; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mIu9obkX"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2bf1cda2b17so454455ad.1
        for <linux-doc@vger.kernel.org>; Tue, 02 Jun 2026 16:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780442100; x=1781046900; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7boHfA/wFrzsz1sM7I2UAXGjLvkEYWGhZgOkDT/r/jQ=;
        b=mIu9obkXctdRPWMLpieHtxU5GC2buiKGV2RExejH9FKPguZyrNyGTZ960qcyljvZqF
         iWA8yApg8axJ364z/CurCnxv9nrOGFw5sDUukNYxzPRbFKiQ2Bd+Cy1Xx+6FpNcqxLna
         UFtXbTqpsCSdLvLjiU8VjFe7xqGRDRLy0olfOd9VAfPNsNDVONhbthiXEHuqlw4p9Vom
         sMk9EDAey+fW3cpAcLNOy+qkg1upsGhkXT2HSaVNik7DjRxSI+bqEUDKdMR7Y2yguMAW
         O4jmBlmOrVwJR08Up4Lrn8/HhqNDbgEGsBKaJo7gXyInat9rUZEJQkx5WhAVerqmVOzS
         elqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780442100; x=1781046900;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7boHfA/wFrzsz1sM7I2UAXGjLvkEYWGhZgOkDT/r/jQ=;
        b=YWUFbE5rbRN4zvcr52uBU/RpjRkVvzZGb6be9TWED80sPUv7uyQlfxpzYdVsC1es4O
         iv1gKFcvVgcN6iOj58vRsDxmGO6bp425T59ttHufo0txtcT55eZ2lv+oMUJmI3cHfT3c
         BMiRCSfkrW4qipPtY07BZAY21i2Oxl4CHP0+1HitnVVGPwa1H0GO/1cyMQANNTyYRKM6
         G2PaHfoF+JtPUhY2GHc9IsZj4Wpc/zCzIfjAgia7hCAr4MlhRMVDIpjmszuIoLWFPb3D
         vQdMRKCxtaZA79PejqbNBys6FfIY+QqabVnmZ5+5gmN1V+oQ56RtZHZ8RFutnn/OLT8/
         8FVw==
X-Gm-Message-State: AOJu0YwqPZFNHaiGrunYynemj87Z99jX503tMrdDtLSdpwTO0+ncWYSk
	6X9gYncJljFsnuJJDcWabY0OMQtuyfkebMZLYb6WKu6q5v5Rg8LdxmM/
X-Gm-Gg: Acq92OGtWVZYd4Zjcouc9/kFA8YuwcJJCi8yfm5abj+eFrWAbyIXGxO7CxtGI7Qz2SE
	MTHJHOe+rWXED7WPDImvtmC51x3H8lbfMuDxbnudRdJHdAhhTsF4xPh+Tqcz++qz1ZH6zbDHPk6
	pAay5zP8f3mzgJFDbA8LR7GB39o0kVUqxYYGqKibhnZ267P0U9f10rLPLgq5mWS3Ef9vrPbCmO1
	K6C+TDHFPcR73awKLqzGE2kZTkS4xvEJm7t/NPUMwCnPa4T1XjN8oIj70Fm6an8ZWmQp1m0qubh
	oJaDDGHVfuCJd9lzIoAAwjC1KmA8zfezWXzr91ut5/MW2dSXKShxlMOkQnUrGrtc1gQGR73AcI4
	BSstNmA9rjsOArYc7+N2CMtrkehZMRwByXRcBAXBSmUog7di/jJs50XDwZhYrASOeXE0zu2+p3w
	nz0cRTlZjj5g==
X-Received: by 2002:a17:903:37ce:b0:2c0:d29b:34ff with SMTP id d9443c01a7336-2c1646eaeacmr5471065ad.10.1780442099816;
        Tue, 02 Jun 2026 16:14:59 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::40e9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16649d2dfsm3302965ad.75.2026.06.02.16.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 16:14:59 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Date: Wed, 03 Jun 2026 07:12:07 -0400
Subject: [PATCH v3 12/15] riscv: Add a getter for user PMLEN support
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-rva23u64-hwprobe-v2-v3-12-5529a7b28384@gmail.com>
References: <20260603-rva23u64-hwprobe-v2-v3-0-5529a7b28384@gmail.com>
In-Reply-To: <20260603-rva23u64-hwprobe-v2-v3-0-5529a7b28384@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Zong Li <zong.li@sifive.com>, 
 Deepak Gupta <debug@rivosinc.com>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@linux.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>, Shuah Khan <shuah@kernel.org>, 
 Christian Brauner <brauner@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 devicetree@vger.kernel.org, spacemit@lists.linux.dev, 
 sophgo@lists.linux.dev, linux-kselftest@vger.kernel.org, 
 Andrew Jones <andrew.jones@oss.qualcomm.com>, 
 Charles Jenkins <thecharlesjenkins@gmail.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Guodong Xu <docular.xu@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1911; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=EL8rlxjtR8czox+vDhBwL1idMRjEpfUrJqNmOC0hv58=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhiwFHrZY9+q9B3v8ZK6p7otLtTvI4VC+6oT7t0uLhDc13
 /XllYvtKGVhEONikBVTZDl8tCV76yufaN/nnD9g5rAygQxh4OIUgIm4SzEyzDZ3u9ASoOlvfSuw
 pOCJRaxy6cHlb+Zqq85+p/fB6qJvGyPD/E0qV+YFOtwqmPx9rvh/8bKo3NgHqXcrN6WX3/cPMJn
 PCwA=
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE

From: Andrew Jones <andrew.jones@oss.qualcomm.com>

Querying whether a given user PMLEN is supported is needed for
RVA23U64 base detection from outside arch/riscv/kernel/process.c.
Add riscv_have_user_pmlen() to expose this.

Link: https://lore.kernel.org/linux-riscv/rfuwa7a3ebe76udmnwyrssjy7shkkgxntvhwzn6oquysj4tuyp@xzvpylcfhz53/
Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
[Guodong: replace exported booleans with getter per Andrew's suggestion]
Signed-off-by: Guodong Xu <docular.xu@gmail.com>
---
v3: No change.
v2: Add a getter for user PMLEN.
---
 arch/riscv/include/asm/processor.h |  4 ++++
 arch/riscv/kernel/process.c        | 12 ++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index 812517b2cec13..febf51e127f70 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -214,6 +214,10 @@ long set_tagged_addr_ctrl(struct task_struct *task, unsigned long arg);
 long get_tagged_addr_ctrl(struct task_struct *task);
 #define SET_TAGGED_ADDR_CTRL(arg)	set_tagged_addr_ctrl(current, arg)
 #define GET_TAGGED_ADDR_CTRL()		get_tagged_addr_ctrl(current)
+
+bool riscv_have_user_pmlen(u8 len);
+#else
+static inline bool riscv_have_user_pmlen(u8 len) { return false; }
 #endif
 
 #endif /* __ASSEMBLER__ */
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index b2df7f72241a5..5d9cb108a6232 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -302,6 +302,18 @@ enum {
 static bool have_user_pmlen_7;
 static bool have_user_pmlen_16;
 
+bool riscv_have_user_pmlen(u8 len)
+{
+	switch (len) {
+	case PMLEN_7:
+		return have_user_pmlen_7;
+	case PMLEN_16:
+		return have_user_pmlen_16;
+	default:
+		return false;
+	}
+}
+
 /*
  * Control the relaxed ABI allowing tagged user addresses into the kernel.
  */

-- 
2.43.0

