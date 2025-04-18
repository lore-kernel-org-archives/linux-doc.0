Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E27FE269CE5
	for <linux-doc@vger.kernel.org>; Fri, 18 Apr 2025 05:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744954473; cv=none; b=R5zBOcfiOy97v8H0Vbj2RORkDqCwLOk/XgkF8UgG2OYvjY1wY0S3DqIeK/Ry1ISdEiZLWB12k4NI6238Ows2YPVAAK/ndxjF16WS9gcEEePvPBMLDOLWkk1PVF9Yff1LSIF1/+GNJwTp3uRlsLEeCJcEywMa/H9xoeI4U2zD4Kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744954473; c=relaxed/simple;
	bh=nsgtSaTn5UMmzY8W/ttdkLr3ZbgDZmLHCd+an0LcguI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=owuXjCGVK5FVkWdsvXy11SCvanIwZLjgTY4pNbzk7ijeOg5tgT2yHGsCUxVMK9xZA8NdHpIjtUZX9bjtC4R1GxdrUG7qMRfcT1ThG833TMHxxuwAR5iXZal7YLR/T7cUAcVxkDngmImVQPFYD5EswbbypYFxETsOlIwBVZpwfIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=glSC3f+F; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="glSC3f+F"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7399838db7fso1602834b3a.0
        for <linux-doc@vger.kernel.org>; Thu, 17 Apr 2025 22:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1744954471; x=1745559271; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a5/PDhz3AlgX3PPZzfN/Kg9kUFezGYCGeqp5UVya4gU=;
        b=glSC3f+FXGGAEcfwu1cN6338oW48FWN9u8Im3Lxnr2CTzL9slfAZLo2vODc//eX5Eh
         JZ4ayhTNTJ+tf5FwgxFuUW+8D336GL0To/ZUZP8lu6GKH7xsg5LfNis9wwJOhU4XdNGu
         1XWZGVqbo1y22lWiNVNDJkSd5SKq++585Tpf3FU8w64L0r2YEXtOYml7MjzV6nPGjwsK
         nwwlmM+baQ+dmwKGzNa0Zdac+xIz4zspbc2FjEeWXQ6h2pFQUFhwVQVQbxSCMzpOgjnB
         VBpMgn+IAbaPW6IxnLnGlujoIXNl6h8Y48koy5f/TiG7blBxSR5XySwUP4/Mo57RAKP/
         eLdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744954471; x=1745559271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a5/PDhz3AlgX3PPZzfN/Kg9kUFezGYCGeqp5UVya4gU=;
        b=irZXz+aFBMYTGznCFktYpH3Fx2jZvHr1U6YoVR16tUX853OeoowYtirgCygudVy8xb
         Jgm4SVomv10LYLx0Qd/+oEDKYZLPHTq4Suruwwi44lsqD7CJmAGpVRqnEzFWZlf3WCEV
         ci894xRweS9qnbur1qhSfGCWRAoDlymyjVdv/XLPeCAhN2VzaAyef2pCXYQolva4nO8e
         ih2hWyGJOYwYGEKbpDr6285qxHEaqr1V/h0jF55mHOOuhKXOfSH6AKC/7iyJ7Zg8Hgkp
         oRU/EinlVMqiASc0D2H4o0sotOOUXby+UPA7CDKNivZdmroNl4RHu/tEdH6VjPkoMbbE
         B6PQ==
X-Gm-Message-State: AOJu0YwH1V+pSjCNkV4Wcp/o5Q7jvyHh8Mp/OgE7T4kA4yco1TDlgiX2
	g50CrL3mxLhAGX2vkJ4Et3MAG/vSMvRxLZ2WDBt9jJ+2PxgD3D+vI8NPaBH9qU8=
X-Gm-Gg: ASbGncu3NG0zyPqNX7EgCfr3fIuGiK90t0ThEvI67/vfBPcNFGFTDmLnNowsKXb1ZT7
	fKCHocfwWBpcaREJ45/VHgwwDCRa7uyNU7rJZqrg2C93FvstA4sLAeM4hUBXYPTIXNJd1ualmHP
	LvW7AyveSkRbj6MIZfHAYT8W68/4UdCESQvc6kYT9ok+2wru9oIgeOJ06dWLJG+YBlPHtCtjHni
	SxHZRq1K9lyyaQjao7vMNZ4SuApUAwFnluxWgVTG0PZDgFZAP0AtHSkqbhB9JxmAy6+NWuBEYnx
	jqL6zuAGr3MZvXJpIBIZlPGAhuh2hNksb+2XO3mNQIFy++NDTtH+wCk2X1wkI1Mtg4A9Ez4Grhr
	1l9ijrJZjG5o=
X-Google-Smtp-Source: AGHT+IEvgHp/iuM5AJD/5ZHF+wg4U+RuhgPDEKuSLIEcrDWYUKCuRuyXlRuVUFNg8sIvdQmur1T+cw==
X-Received: by 2002:a05:6a00:23c6:b0:734:26c6:26d3 with SMTP id d2e1a72fcca58-73dbe52053dmr4292403b3a.5.1744954471081;
        Thu, 17 Apr 2025 22:34:31 -0700 (PDT)
Received: from cyan-mbp.internal.sifive.com ([136.226.240.168])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbfaed86csm834555b3a.180.2025.04.17.22.34.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 17 Apr 2025 22:34:30 -0700 (PDT)
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
Subject: [PATCH 07/12] riscv: hwprobe: Document SiFive xsfvfnrclipxfqf vendor extension
Date: Fri, 18 Apr 2025 13:32:34 +0800
Message-Id: <20250418053239.4351-8-cyan.yang@sifive.com>
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

Document the support for SiFive vendor extensions for
FP32-to-int8 Ranged Clip Instructions using
RISCV_HWPROBE_VENDOR_EXT_XSFVFNRCLIPXFQF.

Signed-off-by: Cyan Yang <cyan.yang@sifive.com>
---
 Documentation/arch/riscv/hwprobe.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 16085b2ee64e..e15405e12239 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -349,3 +349,7 @@ The following keys are defined:
     * :c:macro:`RISCV_HWPROBE_VENDOR_EXT_XSFVQMACCQOQ`: The Xsfqmaccqoq vendor
         extension is supported in version 1.1 of SiFive Int8 Matrix Multiplication
 	Instruction Extensions Specification.
+
+    * :c:macro:`RISCV_HWPROBE_VENDOR_EXT_XSFVFNRCLIPXFQF`: The Xsfvfnrclipxfqf
+        vendor extension is supported in version 1.0 of SiFive FP32-to-int8 Ranged
+	Clip Instructions Extensions Specification.
-- 
2.39.5 (Apple Git-154)

