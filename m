Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795250399;
	b=ne7TaBDYT58Z/AWCO8WunHeY6oR52KDnvv+JhqCheo9YE/tsMBF7zaoJ7jpUgj1VNL4l
	 jD18Jhf4SZHf5fPKfwE8KBdMbMDw8pUB6xJgPYaJYWqTDx+NMG3nlrCUk7dYlPxwIEnr4
	 s+BT1YxECsQaAL05tVB7sBtNvYLyR38nnzAVM6Qbbpl3xcp3Rs3zPba44ov+HPNcPoBuk
	 AU0hSioyQzZpihGEz60v0plB19qm8PoIgx+uO6wXmMznEEjN0x7ChPcVAsM5qBUh2dy9Z
	 cKphnEASjn0/4WPNg8TNzmN9A3ZgL22sLdHUmYGHrjhT78e21M94GwJLC8TDkKuSoYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795250399;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qnUmBWM7OQjc7vI6DcTZCPpSFxVlwkP7wP8mWeAtaQA=;
	b=E0Rj+Fn6PpmxerMwdu9nGv7INt73Y1VAOLIz/ks+0aST6o6P+GLA5C5y5IOOtsUUSWPx
	 eTGaJD+h4J97fELOY7VmvNgzwa+raksKVxCNnEoJb88bkd47fDdOwydh6j5RAlc3sV6rW
	 eGlVs+7tNrRCx9owOPYi3Qm9Pz19JxHtk0rg4AKC80RAtze6oYxBD1Kz5teOKTizqu/fT
	 FVDWAVftKqVSQLJ+h/WNw+pFIT2ajCD01b/4mHSpdQ1Ws845ti2akIMojK7QTfGaxm1sq
	 7dkc/wb6RJH3Q5eh37ydUAX4twW4YZteWPOXc8hNaOFov5npigVdU9xV8hP3XR+f6ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pzKN3r2G;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D89E2606A332
	for <linux-doc@vger.kernel.org>; Sat, 21 Nov 2026 08:39:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D89E2606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pzKN3r2G
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-38190551625so3133312eec.1
        for <linux-doc@vger.kernel.org>; Sat, 21 Nov 2026 00:39:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795250398; x=1795855198; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qnUmBWM7OQjc7vI6DcTZCPpSFxVlwkP7wP8mWeAtaQA=;
        b=pzKN3r2Gn9fyGasRv7kFd2gYeFury8nRc9seYNJSrnxhFfm2HQZUTiEJrvROw3Szhh
         VimU+6vj0a8DG+VvRlScPCOYbFKU1IkzAGornZKdPgiCfXUA0WfYUQDbgEMTLMydttwl
         y3NO7yCZqwV29YoE8YE28y7L/d4CfyR3lc+gLIcDrOJV18IynRsjj612xZYuz6r3Jble
         duK2OYyI8r16DBu48OHh+1v2nFXk3EQxLMmXscLcr/7ftm+Yf9Mh7pjO3skaFFxpPmIE
         BWZlOTVaP62NOmcvmUx6YXHHbelnOEetJW4nMcwsIRj4k9S1qkFa6h7AZlvs1y2nlblB
         WG0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795250398; x=1795855198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qnUmBWM7OQjc7vI6DcTZCPpSFxVlwkP7wP8mWeAtaQA=;
        b=AHEk62wDFu0frsMH/v7DlEX8eT+dkKlm+giZXGgQWiVNkuOOdd109WpbxSt6XyExJw
         RGT/FDUh/X5M+rfMYWEgz3bHnTF42MDuvioh0qyGWn6PJVYFOftIc2U4RtOMLgG/2itt
         xvOQH1svAbjE/h7ldKvmuQ4EXgLZIq6wluAcrZAJxeVFevWBIXuR1VfuFy7SM1mvZ35g
         WKqlyVFs+4BkdWa7DZDduLCvG24pY90gslMvTJXIBFBZewAxLbaSBnof+mHKKJ6q/QWk
         LgdLsMWmbEcwfymsqeYli/OY1IKWfeir40uc4qtHmuXkFGUit69JLIapU937o35WL7ik
         hFcg==
X-Forwarded-Encrypted: i=1; AL+hErHYXQsF7I0yw0NrkSz9gcvSHjFWrgC3qIReO2FbrUynUKPJVfFymb0wiU0oX/ovkPeURVs29l6WiHs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/u5kCIEY0JpuEF7+r4Fw28Tp5grexN+pp9bV4pWdeE6ffILvBA
	foZ/mAW0jhSKGz+OYX1l0fxZEfpn7N9C4GMbG7/Sds4iCi6rsrywJgWg
X-Gm-Gg: AZFdTZeBTQNkU2CH0XoZ6iM2A8oxJr9xjHob9yTyUdqcWzP/KTc5ZtNgIkh1u+9BwLg
	Nwzr2Q9XQttScN2dmYkx2yn6q7e53Cnl0kccMBangUgOl8XGPmXLw4lJaFFHOymWo1gDMLbs+y0
	U0O4hluQRzeu7zHuQwmaMBBro7/jAQkpFgMtEIJ+na0SkuGm9JRKG3ghiTTVH6iSjZdRYJ0oUoh
	yI9ygJSHrPRWnaFh4Gazi9A6jev02yjQlKPDlq6Trvy9wbZQhAH733iL52wi89r0y9OMwlyHzzL
	q9W0RYtHFNjF4LWNNjNQSk5LpGRreEZaTf8R25FIDddPI58UbXNzQ0P1KyS32MPbhBCYhbxMSMS
	Asunqp4W9oDnztGpxzSGtEFTuYrJmzaDdJ+8Cyo5JoNTmvVAZMuPCf0L+GQk+Pz8/g4J9AuS++I
	itFGoKloJJ87H/l9RJkcOiCOYRTy1w8qoUU5NRJTq0Xz2g87Jkz4sp40IOjgf3r6qSAuzMqr3tB
	cEGeD4rjfoqGtmUU3bY5NjACd/0bmF3OCMW/tV4IzyKJ8YRsY15f2C4qmf71nCkpDadtJBxocMY
	buG1SQkI/MHmXPWftmuSEt9jPm/Ahxq090u9R9zzMA==
X-Received: by 2002:a05:7300:6da7:b0:384:5885:2f81 with SMTP id 5a478bee46e88-3856c0c7c05mr7915169eec.5.1795250397903;
        Sat, 21 Nov 2026 00:39:57 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3856456e6c6sm14113093eec.2.2026.11.21.00.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 00:39:57 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-arm-kernel@lists.infradead.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	TAKANO Mitsuhiro <takano32@gmail.com>
Subject: [PATCH v2 2/2] arm64: errata: Fix Falkor E1041 Kconfig name
Date: Sat, 21 Nov 2026 08:39:50 +0000
Message-ID: <20261121083950.1957044-3-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261121083950.1957044-1-takano32@gmail.com>
References: <20261121083950.1957044-1-takano32@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Falkor E1041 entry in the arm64 silicon-errata table names
QCOM_FALKOR_ERRATUM_1041, but the symbol is QCOM_FALKOR_ERRATUM_E1041: it
is defined in arch/arm64/Kconfig and used in
arch/arm64/include/asm/assembler.h.  Correct the name in the table.

The E1003 and E1009 rows name QCOM_FALKOR_ERRATUM_1003 and
QCOM_FALKOR_ERRATUM_1009; the E in the erratum ID is not part of either
symbol name, so an E-less name in the E1041 row looked consistent.
QCOM_FALKOR_ERRATUM_E1041 is the only Falkor symbol that carries the E.

The symbol in arch/arm64/Kconfig is spelled correctly; only the table
entry is wrong.

No functional change; this only touches Documentation, so no build was
run.  The change and this changelog were written with the help of an LLM
assistant (Hermes Agent); I reviewed both and am responsible for them.

Fixes: 932b50c7c1c6 ("arm64: Add software workaround for Falkor erratum 1041")
Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
---
v2: the change is the same as in v1; only the index and hunk line
numbers moved with the rebase.  One changelog sentence is replaced in
each patch: in 1/2 v1 called the table row the tree's only record of
the erratum, but irq-gic-v3.c records it in gic_quirks[]; in 2/2 the
sentence about the symbol is reworded to name arch/arm64/Kconfig.
Both changelogs now say that no build was run.
v1: https://lore.kernel.org/all/20261106234541.1474324-1-takano32@gmail.com/
A duplicate submission went out the same night with different subjects
on 1/2 and 2/2 (20261106235616.1533003); please ignore it.

 Documentation/arch/arm64/silicon-errata.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
index 4bb5707a880a..cc7bf2b6a09b 100644
--- a/Documentation/arch/arm64/silicon-errata.rst
+++ b/Documentation/arch/arm64/silicon-errata.rst
@@ -378,7 +378,7 @@ stable kernels.
 +----------------+-----------------+-----------------+-----------------------------+
 | Qualcomm Tech. | QDF2400 ITS     | E0065           | QCOM_QDF2400_ERRATUM_0065   |
 +----------------+-----------------+-----------------+-----------------------------+
-| Qualcomm Tech. | Falkor v{1,2}   | E1041           | QCOM_FALKOR_ERRATUM_1041    |
+| Qualcomm Tech. | Falkor v{1,2}   | E1041           | QCOM_FALKOR_ERRATUM_E1041   |
 +----------------+-----------------+-----------------+-----------------------------+
 | Qualcomm Tech. | Kryo4xx Gold    | N/A             | ARM64_ERRATUM_1463225       |
 +----------------+-----------------+-----------------+-----------------------------+
-- 
2.53.0

