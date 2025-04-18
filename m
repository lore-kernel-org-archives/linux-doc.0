Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A6B268FFB
	for <linux-doc@vger.kernel.org>; Fri, 18 Apr 2025 05:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744954460; cv=none; b=jup2PhK7KcCc2NYJ5Di5mZXcRNG/6RcGmjPXfyrmjNwe200mGpbvTYUAuUmnwl6EbV2WSUun2XSnMIKctu8RhSkn0mlfDE46AbRNdJNRVjIBoD1bEBtBUZxHk40teovYMi4yjwx4QcO6J/C/j37fP72Su1pOFiW9VRbQfVrv5Ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744954460; c=relaxed/simple;
	bh=AEjGsf4B7fjXDcOTA4JyH56TH+aa+OsicIkOUFMxAgw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Rlu915uABoshmpoH3IX3e9fibwHmsoSRHoFIjp1NrJu1ANKrzTu4Alj28jb4fm9J2FDUoaZfXBr9L450Zd1lE4acjoD9zJ7xO84wkuDwrqPMiTYOaSfRM9LcQ6/UKEpdDApPmlShvmb6POsUHxISlWvj6PJziEpgojdibs9z6G8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=iPBVwgMG; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="iPBVwgMG"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7376dd56eccso1606723b3a.0
        for <linux-doc@vger.kernel.org>; Thu, 17 Apr 2025 22:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1744954458; x=1745559258; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5S7MyiF2v0D0T6HQzf2B/6wNFEauO5Mud7nBe7aMlvo=;
        b=iPBVwgMGNRPGYZ3b62JPBckr43qDUX6XRqu4J6IQwwkEeGXk0i1EZV3i8pP5AeHVFo
         Cy/FcBat5NrfdhlLN5J8q/cDaPtBKqV9ZCdlTsKNHk6vmeIfJ3g5mOM/rJGrOJ+Ag3yX
         izdTmohpj/s1BFmPbq6YPO/wjU1hOuDRepB68wJg1UYkvVWwJLvKu8C9BpsMyN/sx3Vl
         cBSM/oNeTDEuAgSCxfKBo5ObHvV3WVWVA5ANwOh39Vkl086pe80/gIHJ7yVjkY+tAfAZ
         7u5KX4YGaW5GCjy/mMAaQksmCSn471G/40OhmUEhkdQvspF3cEQBfcKeVWsgWp+6825p
         XTqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744954458; x=1745559258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5S7MyiF2v0D0T6HQzf2B/6wNFEauO5Mud7nBe7aMlvo=;
        b=rtIPw8beaEwUonDpCNGW0x7hMkNPc+V67nDO61IFBZpk4S4fjYZcX20H3dOyu+UZ8H
         hto4BK0VlSG/bCpTv9i9bS37BxdRAE8e20J3OSJz7mfweqHodD/p0j4Hgb66gOa8/YM/
         LJp9lcxUoCHrurN9coqBnFvi+m7bGOxZuiAO0FalwQM8glQYWvRhf5pGjsJb2JXCrQQ2
         Ufd2xcVZCQSp3NoMayXK4tuGxOlapQ1yNANtrmgeDRWdNrUfEmtanKk7bxcgi5enzv0O
         Lotozq+FTzmp2EzjQvo4Yywe9Os/0viBua7eo0I/GRoZJMhhJ0oa6qmT+WStx7FyUp31
         9KXw==
X-Gm-Message-State: AOJu0YxOL8f/kYdd8SvZapMqX4J/kyWUZ+fjm9B91F8ItlXLRScYIro0
	ucQR3g6thYG6EcAEf+Q1xFLAGPBWfvUykTUGvEDcq2/HI0ZOS+fmeTvJgxTEZNM=
X-Gm-Gg: ASbGncv/A5jRIJGVBo4iAKnl8272+hpW6XoWkSdpBRWcR9J5jHoWP/Q+NqIgsC7AVxN
	lTq9yyFOXmBH//W8zIKO89DVarMLeZ84YnWU5EBgj0oHmkspl5SyjnDgvv1Ap1TI6++vL86OVh7
	S5rUzFJbIFlXUw5ggWFVB3ubGPqe1BzT6+V5LB5RExVyNIK804Y2MO4HmEZ2LxgZT72avxmO0d4
	hwSxaO5BfD7VtRCzGxC1dhfFGjFcF1GEsqo1vGhP7TZiAYYAObz+kIPfMZyYcmKByLf7wgLj8on
	n/IJSdqrTxuduhF1tMv0Gxlrm/9+vZH1dELPcCcIXeG+MW+4UArDf1ysNuV+cmvTPK7gTJKvCpZ
	B
X-Google-Smtp-Source: AGHT+IFzBMKUz83vOCswwis98Y2gJZDeCmgG70swUr/qCZuSWaYO74i1Y9Ohxb7CG+IkshNDInqiMg==
X-Received: by 2002:a05:6a00:e14:b0:731:737c:3224 with SMTP id d2e1a72fcca58-73dc14a56dbmr1687999b3a.10.1744954457781;
        Thu, 17 Apr 2025 22:34:17 -0700 (PDT)
Received: from cyan-mbp.internal.sifive.com ([136.226.240.168])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbfaed86csm834555b3a.180.2025.04.17.22.34.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 17 Apr 2025 22:34:16 -0700 (PDT)
From: Cyan Yang <cyan.yang@sifive.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	samuel.holland@sifive.com
Cc: linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Cyan Yang <cyan.yang@sifive.com>
Subject: [PATCH 03/12] riscv: hwprobe: Document SiFive xsfvqmaccdod and xsfvqmaccqoq vendor extensions
Date: Fri, 18 Apr 2025 13:32:30 +0800
Message-Id: <20250418053239.4351-4-cyan.yang@sifive.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250418053239.4351-1-cyan.yang@sifive.com>
References: <20250418053239.4351-1-cyan.yang@sifive.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the support for sifive vendor extensions using the key
RISCV_HWPROBE_KEY_VENDOR_EXT_SIFIVE_0 and two vendor extensions for SiFive
Int8 Matrix Multiplication Instructions using
RISCV_HWPROBE_VENDOR_EXT_XSFVQMACCDOD and
RISCV_HWPROBE_VENDOR_EXT_XSFVQMACCQOQ.

Signed-off-by: Cyan Yang <cyan.yang@sifive.com>
---
 Documentation/arch/riscv/hwprobe.rst  | 14 ++++++++++++++
 arch/riscv/include/asm/hwprobe.h      |  2 +-
 arch/riscv/include/uapi/asm/hwprobe.h |  1 +
 3 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 53607d962653..16085b2ee64e 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -335,3 +335,17 @@ The following keys are defined:
 
 * :c:macro:`RISCV_HWPROBE_KEY_ZICBOM_BLOCK_SIZE`: An unsigned int which
   represents the size of the Zicbom block in bytes.
+
+* :c:macro:`RISCV_HWPROBE_KEY_VENDOR_EXT_SIFIVE_0`: A bitmask containing the
+  sifive vendor extensions that are compatible with the
+  :c:macro:`RISCV_HWPROBE_BASE_BEHAVIOR_IMA`: base system behavior.
+
+  * SIFIVE
+
+    * :c:macro:`RISCV_HWPROBE_VENDOR_EXT_XSFVQMACCDOD`: The Xsfqmaccdod vendor
+        extension is supported in version 1.1 of SiFive Int8 Matrix Multiplication
+	Extensions Specification.
+
+    * :c:macro:`RISCV_HWPROBE_VENDOR_EXT_XSFVQMACCQOQ`: The Xsfqmaccqoq vendor
+        extension is supported in version 1.1 of SiFive Int8 Matrix Multiplication
+	Instruction Extensions Specification.
diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hwprobe.h
index 1f690fea0e03..1c6977305776 100644
--- a/arch/riscv/include/asm/hwprobe.h
+++ b/arch/riscv/include/asm/hwprobe.h
@@ -8,7 +8,7 @@
 
 #include <uapi/asm/hwprobe.h>
 
-#define RISCV_HWPROBE_MAX_KEY 12
+#define RISCV_HWPROBE_MAX_KEY 13
 
 static inline bool riscv_hwprobe_key_is_valid(__s64 key)
 {
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 3c2fce939673..9c70101f021b 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -104,6 +104,7 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED	4
 #define RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0	11
 #define RISCV_HWPROBE_KEY_ZICBOM_BLOCK_SIZE	12
+#define RISCV_HWPROBE_KEY_VENDOR_EXT_SIFIVE_0	13
 /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
 
 /* Flags */
-- 
2.39.5 (Apple Git-154)

