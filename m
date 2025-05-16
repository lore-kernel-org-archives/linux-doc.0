Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2924C25FA38
	for <linux-doc@vger.kernel.org>; Fri, 16 May 2025 03:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747364759; cv=none; b=aP5gJcHnP56ilKQkX7MTuHoygBfDDEJp7fE6jHXYKIgeMoSHOryJBxz/JR/lMGcskxlVMMDzjP7Prr2bgFByxFyD2O+afqE15qNz+jORdTa9ffwD3yU8aBeAArS1H5iaoK/4qiiWKVIJVKLKP+8/I04g0kmYwkri+ospZhbG9Ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747364759; c=relaxed/simple;
	bh=nsgtSaTn5UMmzY8W/ttdkLr3ZbgDZmLHCd+an0LcguI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lz5Rw579YAuK3CnpVMcsLgjvsMV8EAqbE8EwWZ64LvYKlzsHNSkzRQ+zJLwBR0F7M7aO5gy3pTKx/U8OHGrlp2KAxM64a0/JBtkJ/FWXMf3qCtd7nHQ+D29cFG8MkB+yqe+OGlMQ1Ng4F36fGmPdQqVTziHu95iO3FQsmMamMmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=mKIIiEd0; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="mKIIiEd0"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b0b2d1f2845so1144108a12.3
        for <linux-doc@vger.kernel.org>; Thu, 15 May 2025 20:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1747364757; x=1747969557; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a5/PDhz3AlgX3PPZzfN/Kg9kUFezGYCGeqp5UVya4gU=;
        b=mKIIiEd0a3CbzOyO8COl1IW0UTYIjEpHMEEtPc7QZJ6obtCDhwHqtD2+LOx5OhrDJs
         t4HXaKg2CCltjRxMebVVEWkIsZrRARVuHdxiE8djAGWrjccR09Nmsr4AFMtsAARbK1BL
         eePmHp8BYmQX/cDigy8YCsBiA9W+gyOL/Bijv97oXk2idx5LvFii8LjuRBeFWNldHoog
         AjPPN+gqqS0YjnBDICT66T0pywZSSfAQX6m8t7dtmGxgdDRDAncA6Gz3n2C+sfmMe20S
         Cafyer2EyFzBGeBzJCzk0a0B/fQx08Je38Rgr5gMfanlSG7cjIxACl//EVPDug35uGdy
         BGlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747364757; x=1747969557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a5/PDhz3AlgX3PPZzfN/Kg9kUFezGYCGeqp5UVya4gU=;
        b=daCDavsY918x4eZw1bH/IYHFReTPc1CFXpnzLAdQMJVeZ5ecsrjegAw7377+FgoTRx
         wXl2v9gy0IuXUwLIGQq/9cS4IEjbWQ3Pbk9E8joTz9cmFZTnXR9zJQ+FQmzVZA89ETud
         DHz0is/q/M4NVt9QE41PWTtXDWtFH/6sRsiHAKOGAqzLHs/THpS06Wqj+Wcvw1s8GKyl
         pQzcUREDBgII5N4RlkkEmDqyVOqf8YP4g6wsqeb6ayI3rJqG64VTONeNoJx2I69SaIu8
         F9AOn+jIwUHCMvfxYgJ9R1Vu2XI6YMGT4UtfNyF5XfNjim5s0gqK12eAMJ5L7cVR7d0v
         z3Sg==
X-Gm-Message-State: AOJu0YwiynVEb6qrYopQCfqgdLqidOG1bg7IYALV679IQ8SxlUMRKAs4
	NKwxIixtT8QHb0T6MWn6OdsepOdWCkTIEqhxexjGod7Lnorsi29TC99h6QAQHG43Yxc=
X-Gm-Gg: ASbGncstqDtS44+I39I6Pkj3by0yAZnnix77h/0dGiOXWz/6/nlKbucAGCyPtuWMUAL
	GtAW15iTr82N+V7h/TkwmfPMunlTY9Uoe24jBg8OwqSpDHgIwLM599+LlAvSrmOmtFJXJRk0C94
	K/aCuOVuDGGTPs2gGVOyVYPRfB3J+xzLxpeU+YWeWpj3Zax4SwYSCFA/EZAGanPkk9CvaHg4Lrr
	xX5/zo8BXXScP9fYH6VFhj8t13ucRWfU3CpHzpw8lfg4p2UGu9fSkydXU+eHAnKmOAGEceEjAz/
	OWXif9ujBYBypWOD/nQYfheGVPizBmiS3JJwn1zMybafGaS01FAXYGAMYTmTxRf7xTDL8DsIBLU
	3iyrhTyOuamQ=
X-Google-Smtp-Source: AGHT+IFJbPUK4tMDRuGc+co241YfBHz7E/gRc2tzvQ+RafzudJUC0EH4MsxgVnUHPIA3yanX+bcZ3A==
X-Received: by 2002:a17:903:2306:b0:223:5124:a16e with SMTP id d9443c01a7336-231d438a1c6mr23919555ad.5.1747364757539;
        Thu, 15 May 2025 20:05:57 -0700 (PDT)
Received: from cyan-mbp.internal.sifive.com ([136.226.240.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ebb084sm4804405ad.201.2025.05.15.20.05.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 15 May 2025 20:05:56 -0700 (PDT)
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
Subject: [PATCH v2 07/12] riscv: hwprobe: Document SiFive xsfvfnrclipxfqf vendor extension
Date: Fri, 16 May 2025 11:03:05 +0800
Message-Id: <20250516030310.16950-8-cyan.yang@sifive.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250516030310.16950-1-cyan.yang@sifive.com>
References: <20250516030310.16950-1-cyan.yang@sifive.com>
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

