Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9EE33B6C5
	for <linux-doc@vger.kernel.org>; Sat,  7 Feb 2026 10:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770460123; cv=none; b=ktYdfiqaIaIdL87VlvzEG8j2+Z9fdkR9D3uShl4MbAvME/1QARnx0uwwFAY8nCrv0d+NcK9h3OFGusbw48i93VvhVWT/eNBW0pmhgAcN65/Xopw03DdpQ7wh9lHkPGDi0eecyWJZkreDmrtSmgbWbDYn0jjJ8b5wpCWT21q+MH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770460123; c=relaxed/simple;
	bh=xMuXYybQ3qwdlXyIpDdaaE2++R43obocwS91t/TkUwQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mGskq+2qqhprZslkHP9avyDZDm0UHGvd3CncWjT27Kgq6ZsJtq9OPQPyL0WmObLzlsYDucHRtSDGzeTRtwcobPbPPKZ1V3QpnuiFqkxneg45Tpxe/8yQ1pRPxabl0zGAKUW5UAbFBa+g/7GEm7y7iponuecUixBNNaAx2bMeo7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=foc6JIwR; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="foc6JIwR"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-bd1ce1b35e7so1893840a12.0
        for <linux-doc@vger.kernel.org>; Sat, 07 Feb 2026 02:28:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1770460123; x=1771064923; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fDg5moTLZBDcuSKrclVF6M9QumyUxl2nytvSuElrSC0=;
        b=foc6JIwRuUoUwJP3fqNeXnUA2N7a9TE/w2SIx87NTd24zlgO56ZStH6PJFEl8FsNW8
         vIcqZlivH3p40M7cQTLe5kkUGxQYt52O4GTQZKu+yG3AcMqVwud0YkPW+aEu3i0Ybp8s
         gJ32DWZuj0zeVMxO1TfVd06sEAazUUWNo43Ndn2MkuiR8Eb4NPNKW55j1i+tVumVcqc4
         C8R+H+qvnnGJ+DA8scZ0lU4P9HZwRtEoHpMLeKX3KWyy6VT+PxCzGiXWe2pP3UIp1dgk
         5S7dP6sJ5geCaK1QISpyZdVrINnU2rS2GlA0yI+vtr10GrXfXPRzJ/5MOfw/jPUWCFNd
         G6gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770460123; x=1771064923;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fDg5moTLZBDcuSKrclVF6M9QumyUxl2nytvSuElrSC0=;
        b=Q8G+ajMTRQDpnC2Vsds8H94/mkQEt4efXLH/is5Z1J3gtt2idqeWqNryrWzf1S811W
         PVpOkjKZyyImeyVw4iMfQOZ5OwswkA5XO3bUslHVkzdiI+IMpeeuPdJugIhai5VLpJ3V
         vMQcZtDAs58G7JDh3ukxh3B2/aMfkaJuGVUjsbVks38FwaJyx0OBb8vhuEcIgOXJ5U0Z
         aT0Tk0Bbw1QrR0BbmRuQvUySG4RMDKAsAYR/OeF+1+ziGCGxZoKEY3cpR9idtF+X6YsI
         o6kIugTyJMNQt7wfMq009Rbrv/RA/oJR0N6q9KVfotuHFgtM54/tOVr3j/uP+8IZuQMk
         ztlw==
X-Forwarded-Encrypted: i=1; AJvYcCXdHlqFB06yjidx9ZfQAlFXHGfbZVpZ+tkBwTm6HlI3SySGagctbv1aeGik0fLLLjG61JYz6uNcAaw=@vger.kernel.org
X-Gm-Message-State: AOJu0YymC448+qWg+pmyhhlumBgr/75Ux9lEr6yIYgjM/m+KdMBn7UDc
	DA/lCpg0qnunvSzlTWzOOil4XlRrfAAM0pTtCWhpwvY69zaHfF5cnwu3ccnEThbw+nU=
X-Gm-Gg: AZuq6aKXVckpqcEnqve7sSs3mg6/bV50OeM0gfx2lVAP04iCNpSWbc08c6tKreIv+lg
	o5v6JO3h4HoNzBKce9vnmSJCHpQR8oY7x6efrd8xW3b9UPqaCn5/puUtaxVkazR7Blg4f9lsCzy
	cpBQSVQ4ZwVKlGVhlz0ldbDlPRPH6Pgiq3McoKzde4OkYRSh5yRpN2o12a97JupOywkOrKSF1k3
	+Aq6B/O2mgYdNt+t8E5ref+BfMF3W+ccGLmzVc1WS4Ci7rPjn2SIrxweA2M2sxl1OmlQEEf2pi8
	hqBmq8QOv12BdabKNJRrVNRVLZaUM7TZfKM/ZGzUg6ZKgNlL6jJEG5ni9+M5sFEmpF8bTZGcT9A
	aOfdknzFgxsXskIhZwUe+aUHE9tuk2B9qXZ0TF0FnznHJ7Ea1TJBocJpsuKEhwJs1nkjb0hX4de
	mFXhygnodoFQF8subEIM1ehYjSLCpqrn6BAn1/3s4F8SptyXJ/Z4ykTA==
X-Received: by 2002:a05:6a21:a98:b0:38f:df47:87a0 with SMTP id adf61e73a8af0-393ad386587mr6157848637.61.1770460123273;
        Sat, 07 Feb 2026 02:28:43 -0800 (PST)
Received: from [127.0.1.1] ([45.8.220.216])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a951a638a1sm46516555ad.17.2026.02.07.02.28.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 02:28:42 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Sat, 07 Feb 2026 18:28:02 +0800
Subject: [PATCH 8/8] riscv: cpufeature: Add parsing for Sha and its
 comprised extensions
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260207-isa-ext-parse-export-v1-8-a64d3a8bc20a@riscstar.com>
References: <20260207-isa-ext-parse-export-v1-0-a64d3a8bc20a@riscstar.com>
In-Reply-To: <20260207-isa-ext-parse-export-v1-0-a64d3a8bc20a@riscstar.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.2

Sha is a profile-defined extension introduced in RVA23 Profiles
Version 1.0 that captures the full set of features mandated to be
supported along with the H extension. The augmented hypervisor
extension was optional in RVA22 and mandatory in RVA23.

Sha comprises: H, Shcounterenw, Shgatpa, Shtvala, Shvsatpa, Shvstvala,
Shvstvecd, and Ssstateen.

Add Sha as a superset extension so that when "sha" is encountered in
the ISA string, its sub-extensions are automatically enabled. Also add
individual parsing for each of the comprised extensions.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
 arch/riscv/include/asm/hwcap.h |  8 ++++++++
 arch/riscv/kernel/cpufeature.c | 24 ++++++++++++++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 75f64f5b7355db6ea5218f544ceda3be9619a58a..8cc1d47b1068637fabb94a3f8defb1d6fe3bc180 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -123,6 +123,14 @@
 #define RISCV_ISA_EXT_SSTVALA		113
 #define RISCV_ISA_EXT_SSTVECD		114
 #define RISCV_ISA_EXT_SSU64XL		115
+#define RISCV_ISA_EXT_SHA		116
+#define RISCV_ISA_EXT_SHCOUNTERENW	117
+#define RISCV_ISA_EXT_SHGATPA		118
+#define RISCV_ISA_EXT_SHTVALA		119
+#define RISCV_ISA_EXT_SHVSATPA		120
+#define RISCV_ISA_EXT_SHVSTVALA		121
+#define RISCV_ISA_EXT_SHVSTVECD		122
+#define RISCV_ISA_EXT_SSSTATEEN		123
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index fff35a3e85db70f5610df2667f2b4f45f091cb2b..13fa5dd555c4cb40831f75c3a0e0c4c5b518864b 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -498,6 +498,22 @@ static const unsigned int riscv_supm_exts[] = {
 	RISCV_ISA_EXT_SUPM
 };
 
+/*
+ * The Sha extension captures the full set of features mandated along with the
+ * H extension. Sha comprises: H, Shcounterenw, Shgatpa, Shtvala, Shvsatpa,
+ * Shvstvala, Shvstvecd, and Ssstateen.
+ */
+static const unsigned int riscv_sha_exts[] = {
+	RISCV_ISA_EXT_h,
+	RISCV_ISA_EXT_SHCOUNTERENW,
+	RISCV_ISA_EXT_SHGATPA,
+	RISCV_ISA_EXT_SHTVALA,
+	RISCV_ISA_EXT_SHVSATPA,
+	RISCV_ISA_EXT_SHVSTVALA,
+	RISCV_ISA_EXT_SHVSTVECD,
+	RISCV_ISA_EXT_SSSTATEEN,
+};
+
 /*
  * The B extension comprises Zba, Zbb, and Zbs.
  */
@@ -638,6 +654,13 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA_VALIDATE(zvksh, RISCV_ISA_EXT_ZVKSH, riscv_ext_vector_crypto_validate),
 	__RISCV_ISA_EXT_BUNDLE_VALIDATE(zvksg, riscv_zvksg_bundled_exts, riscv_ext_vector_crypto_validate),
 	__RISCV_ISA_EXT_DATA_VALIDATE(zvkt, RISCV_ISA_EXT_ZVKT, riscv_ext_vector_crypto_validate),
+	__RISCV_ISA_EXT_SUPERSET(sha, RISCV_ISA_EXT_SHA, riscv_sha_exts),
+	__RISCV_ISA_EXT_DATA(shcounterenw, RISCV_ISA_EXT_SHCOUNTERENW),
+	__RISCV_ISA_EXT_DATA(shgatpa, RISCV_ISA_EXT_SHGATPA),
+	__RISCV_ISA_EXT_DATA(shtvala, RISCV_ISA_EXT_SHTVALA),
+	__RISCV_ISA_EXT_DATA(shvsatpa, RISCV_ISA_EXT_SHVSATPA),
+	__RISCV_ISA_EXT_DATA(shvstvala, RISCV_ISA_EXT_SHVSTVALA),
+	__RISCV_ISA_EXT_DATA(shvstvecd, RISCV_ISA_EXT_SHVSTVECD),
 	__RISCV_ISA_EXT_DATA(smaia, RISCV_ISA_EXT_SMAIA),
 	__RISCV_ISA_EXT_DATA(smmpm, RISCV_ISA_EXT_SMMPM),
 	__RISCV_ISA_EXT_SUPERSET(smnpm, RISCV_ISA_EXT_SMNPM, riscv_supm_exts),
@@ -647,6 +670,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
 	__RISCV_ISA_EXT_DATA(sscounterenw, RISCV_ISA_EXT_SSCOUNTERENW),
 	__RISCV_ISA_EXT_SUPERSET(ssnpm, RISCV_ISA_EXT_SSNPM, riscv_supm_exts),
+	__RISCV_ISA_EXT_DATA(ssstateen, RISCV_ISA_EXT_SSSTATEEN),
 	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
 	__RISCV_ISA_EXT_DATA(sstvala, RISCV_ISA_EXT_SSTVALA),
 	__RISCV_ISA_EXT_DATA(sstvecd, RISCV_ISA_EXT_SSTVECD),

-- 
2.43.0

