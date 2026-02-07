Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB4C31077A
	for <linux-doc@vger.kernel.org>; Sat,  7 Feb 2026 10:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770460111; cv=none; b=rsL/W7hKKUZv/ZU7UTfNwpmnUKIIYyt7DA5itHtXsOemOCDAiNvF6yVXe93zoAAsjoVW8MFsMyfMbQOmMjYd6J50/DwH30poF3O1/J98pOvVSATSSZlwVI/TF9ZxxX0VbPzMYwIxkkMtzOL8iFCF153lu7OyK8M5aTx0/l13wb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770460111; c=relaxed/simple;
	bh=cVrHJe8Y/KMCj3Ohbg9UPU8HNnno0Otsj0HG68y+L2U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g6DTlao5EHJv2+AjdSN+MMuLJnx7fOpEWCGIZ4mEhmsENSvDdX6ntVxpSLHi2Hkz1O05CxkPd8WUIcQoMWgkbkemahI7D7LAp8ijVtrv33AXW8i47ZWg/BkiMRDXwnKtpYpjxPiRGxTEYJmxZik0UZpHxQoAefZZd5QPZ/xjJNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=CbdTlygL; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="CbdTlygL"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2a91215c158so21073785ad.0
        for <linux-doc@vger.kernel.org>; Sat, 07 Feb 2026 02:28:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1770460111; x=1771064911; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uOAi1IprK4L7LlGye/6aTRdwhXY6j5aC3PdeMBsR3Ls=;
        b=CbdTlygLxHBL7qASKaLAZ/WrbIjUkkaq3PqviStZrMgZQjGoSD+JmnXBIF0lLfFV0M
         VMY0ReWMosZJptt2i+qhgIdV/LhtqYt5tqWqlA68yDtZlCLqC4kPAVoG7ZUYAE5X62Ea
         4jxm2nRzwvfrougLBEZNFkVmsByP20PvUla6WF+CsTHfG0qjN0Zg/eTlIU+EroTOCLP2
         Y6Shr0ywMyau3ktE8zNSYPg5/WMdleHiZ6HwWwthIjE9Or2WbwqS04tF9YJ4q4iSj2Qu
         6Z7RlkFykR/+E9bpAFmCTgWn0k6/qZpMWunZ4lGip9MkXFmeymZq/do2JfpoP34Y6pXh
         eNEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770460111; x=1771064911;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uOAi1IprK4L7LlGye/6aTRdwhXY6j5aC3PdeMBsR3Ls=;
        b=O4g9h8eJcyHGgLHwq8QOiRSq6TRPv6bqUdTpfKt1ZIG5nNHJB3wsqKxQ1NFMdIOZ9s
         2UeABMq8J7lN5GtsZBCOkxkOOwSg6LF0M4VcqdKE9zMDcPRSYY11+tsZ0BnM+EEGpS7I
         7r3+HfPrnHvh6mflhX2Lr6uXTj8YfH4ufYkW+2KWxFqPDRYYPWZ0sBWhp9JIty+vInHU
         Gf4Rwavd4/ESNM8tG3S4hO0CQr87Am9PL9iBZirXxK/wvXaD/R9DAK71t9oAVBhWn6qa
         V7u7WtZgEtZb4ZseADPZqpIAXtnTGtLeHYj5pJcP7Km8aa4uWlBgDVrCEHavWMnLhXWL
         08xw==
X-Forwarded-Encrypted: i=1; AJvYcCWPH/0V8fGdYWqlb/WoeyqHm0rmBVEn11UeMGdbf8lT/99KnLa6RRQBYT5ztp2dVGpxYzmOB0OP084=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf/qVWry2XXHYem5ZqxPDgZj1TRMIAOH7GZrS+C+emjjf52FHu
	yUM2I7dugLE2a6sBAxDdtq48glpPh9ahk2nJ3CHGAWuyUMDFClkjo8S4q2Oh9TnmZdo=
X-Gm-Gg: AZuq6aJNrJdJIV95M7s1jzqOcYqhntVwRIbKp0fb0FnbdwrXyOEZrjjps8rx1xkHNcN
	Du02rU/B1imNhLvWoQpoKEM7mIKkCMlIxyKirHeE0GB1KpFf0lIb6HuVC9oQQgsgl8pG/VKNcNF
	2HnIblyP0034ZdeLCORsY5E51RsZuaR6umJZo5nL2zL0XhpPlqFIXkV9jNl6EwI3rRAgffT9ikB
	XH9QKdBeaDFRJd29ZPY3n09RXDJ1Tu7v9I+M7qMsrxbzjha6NlAUAcNZ1KIm23wTbve3GxKMG0X
	+OoNhe8iznY3k2d/0XdP4qbu6YKHaS8cHhuwkHtC/w5/15QcDPmpiH/RLyQymKjAlJue2d3/Mps
	gDh+GtQuA8tUG9DqED9kmZiCcumFdJIlZoCIeqbcIzsT8/KqNFKfdE5U5f7FEfttbV+o/NHs6MF
	pMvn4BwTa6BWdlOQrcFBZApvtlDXjiO2hWf+feE4Rrd8BxyB88Jv5mDg==
X-Received: by 2002:a17:903:2f08:b0:2aa:d671:fdf9 with SMTP id d9443c01a7336-2aad671fe76mr373235ad.26.1770460111138;
        Sat, 07 Feb 2026 02:28:31 -0800 (PST)
Received: from [127.0.1.1] ([45.8.220.216])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a951a638a1sm46516555ad.17.2026.02.07.02.28.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 02:28:30 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Sat, 07 Feb 2026 18:27:59 +0800
Subject: [PATCH 5/8] riscv: hwprobe: Add support for probing Zicclsm
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260207-isa-ext-parse-export-v1-5-a64d3a8bc20a@riscstar.com>
References: <20260207-isa-ext-parse-export-v1-0-a64d3a8bc20a@riscstar.com>
In-Reply-To: <20260207-isa-ext-parse-export-v1-0-a64d3a8bc20a@riscstar.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.2

Zicclsm guarantees that misaligned loads and stores to main memory
regions are supported. This is a mandatory extension in the RVA23U64
user-mode profile.

Export Zicclsm through hwprobe to help userspace check the existence of
this capability.

"Misaligned vector accesses are only supported if Zicclsm extension
is supported", as clarified in:

commit 982a7eb97be6 ("Documentation: RISC-V: uabi: Only scalar
misaligned loads are supported")

Link: https://lore.kernel.org/all/20240524185600.5919-1-palmer@rivosinc.com/
Link: https://lore.kernel.org/all/20240524-ruckus-trickily-1cda26c1a455@spud/
Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
 Documentation/arch/riscv/hwprobe.rst  | 4 ++++
 arch/riscv/include/uapi/asm/hwprobe.h | 1 +
 arch/riscv/kernel/sys_hwprobe.c       | 1 +
 3 files changed, 6 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 8430bc94fdba073e1e3ded973322c773c598a0b5..198b31bc9a20c2739988849cf7d2948a4fe1bdc4 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -395,3 +395,7 @@ The following keys are defined:
   * :c:macro:`RISCV_HWPROBE_IMA_B`: The B extension is supported, as defined
     by version 20240411 of the RISC-V Instruction Set Manual, Volume I
     Unprivileged Architecture.
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZICCLSM`: The Zicclsm extension for main
+    memory that must support misaligned loads and stores, as ratified in
+    RISC-V Profiles Version 1.0.
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index e7bd2e9ea33459572d01495f4063e32e3207e48f..323c488de5548883ddceac256bf312ec854ee899 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -117,6 +117,7 @@ struct riscv_hwprobe {
 #define RISCV_HWPROBE_KEY_IMA_EXT_1		16
 #define		RISCV_HWPROBE_EXT_ZICFISS	(1ULL << 0)
 #define		RISCV_HWPROBE_IMA_B		(1ULL << 1)
+#define		RISCV_HWPROBE_EXT_ZICCLSM	(1ULL << 2)
 
 /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
 
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 491af3c5b66a0cb30471dafc8b31c70df2f9bed1..6997c6007a8e86dff85b5b83d14924e7c2466eb2 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -208,6 +208,7 @@ static void hwprobe_isa_ext1(struct riscv_hwprobe *pair,
 		 * in the hart_isa bitmap, are made.
 		 */
 		EXT_KEY(isainfo->isa, ZICFISS, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZICCLSM, pair->value, missing);
 	}
 
 	/* Now turn off reporting features if any CPU is missing it. */

-- 
2.43.0

