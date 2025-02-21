Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D8B210F6D
	for <linux-doc@vger.kernel.org>; Fri, 21 Feb 2025 14:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740149854; cv=none; b=H3E7Q5y4q5PqlnUb3CoZYDutM8S41I8PiiJcgBFwbfI73gxsHZ5DtMvtYT3lJ+XbaMpUTKOb+VEaEyiS4EGwkBMhMeMxPNNdLi4StSuW98zQyhYBPcz3cckNekYeS2pL7Pzo/KmujaUGIEU7o5zKxVPxITzh9HTBeZNTpm3AgRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740149854; c=relaxed/simple;
	bh=HCTDVZLc27RfB3QlgUMKi3V9KsZa8/51pTH+CsMD1z4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M1LHK+wj6IPscpT8M5y9axUfo6ocbLUT1HMysS9V9mMOhy1hEM3jmdGMCZGSMlWGBcsatMqVjihjMCoHCavQxatFbi7mb2AEbigBW/D3MADTO3SNHz1BC6dgfpiqnfLxWhTXAuLQH/OG8I3lmS17pL5xx5AUDBy8dowEQ7r2T/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=Pk0i6+Z0; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="Pk0i6+Z0"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-38f2f748128so1058539f8f.1
        for <linux-doc@vger.kernel.org>; Fri, 21 Feb 2025 06:57:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1740149851; x=1740754651; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KvHP2BboCGauKM0TvBqQfBu7j1TlN9OaRIMMc+Vl6gA=;
        b=Pk0i6+Z0qSTHDbSi7KKQaSTvabwve26HdAs2xo9c8VJs1vDK/aFQFj2BRzyT6C1MdO
         CB4WJxlwuAH6H6GvmnVD0tSstSeEuUeqFz3Yy1rbEIBfGgln7TWG3oaN9iag00MimKf4
         Neg3LYXep9ZHVwn9XECMs+Lxb8b6oAcj430OdMvcwy9rE9SneHAwjTaTbldi6S44cgIE
         4gDtwHTax/D1NY5yjP0UWDJLvhy5MCKAb9jSsD3cxj85ncj+OpdBSdpgSqSV2ZrQyJlV
         BXNW6wy3qzUD/ifB4yHNe72mhkibLOv5gZupwbj0+PReW7MwjC65HYhEF0iqX2SwUz+0
         1Cgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740149851; x=1740754651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KvHP2BboCGauKM0TvBqQfBu7j1TlN9OaRIMMc+Vl6gA=;
        b=p2BfVwpyrMWps99FysJCmtKOrRG+XrilEKQbjrKMjMhrlgoV863CFmYDV47Unv+K8G
         gzkjM3Hm9/vXYqMZ1d4m+dSdjpTJQEQ794voOz6w/Su0s+Lgx46pIndgmJCv35bFjnIb
         ugahQdO0GKGLsiNKhMhhLUAeyJiG1o/QPxOXit6arfuVK+S5SwwqNVrHJoRular+c5cU
         NufYRKrp5D1mrAsYo3Cb9jGZt64M2PtHFsXhdW7OFn+L/dK9WT7NF4DeN/ZQ59fjye2T
         IUYZV0vcdCYLm5kDTzCsbDODZQD7RvAZYdkw3xFobGNLNXPmaLc2Zs2J/ipcF451ksGb
         XStQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKCtEX5KFfPc0pJzQE10KSsqlRKvjOLcMthlwGnCdPqkGM+R5/N4iLKWp0NlsmAjWBMOIKAihlAdI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyA1v/nWSrrfc9/52wN2MtE9ZJEGuvuZju3FTuuES+MjSSttejC
	x3pG/IPT0trBfgvke+zdMDCEjmluijH5q26mZbIx6Kk83cWIz2jrEJh0nNWLRjY=
X-Gm-Gg: ASbGncs2OEa79DYnJbBya/e2Cpvk4y+pStsSu0LgVY7B6MODwyQwazWRBWK0J+OX1yB
	a3C9gQU35kJUVPirb3oktde9Tu0R78oSiLhJvkXxqvjtQ6uOLSduknsik9di2T8qazGlDNvISNU
	EMhYBKGuvx19/V2pz+MgZCNElmTykRKeUdvfyGozTSxFx7IUk7R3QI7vjUMT+Cgn0+pILx8Mvi4
	KXCMExz28n7WekwpIIVzWHGewWAnFQrH5NhyINM1v+njLVY7N6DnEc0WQSwiUlHVBZ+it95KntR
	lajadJt0OCiPxA==
X-Google-Smtp-Source: AGHT+IHcoDd+Wx7yCfHbXvCGdFs5uIccGxXcfrSZqLhmSwNHn36B0PnuR7cIJZPeqdU6yBBLobUiMA==
X-Received: by 2002:a05:6000:1a8c:b0:38f:2113:fba0 with SMTP id ffacd0b85a97d-38f6f0c3acfmr3393343f8f.50.1740149850872;
        Fri, 21 Feb 2025 06:57:30 -0800 (PST)
Received: from localhost ([2a02:8308:a00c:e200::766e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439b02d6974sm19479585e9.14.2025.02.21.06.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 06:57:30 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	charlie@rivosinc.com,
	cleger@rivosinc.com,
	alex@ghiti.fr,
	Anup Patel <apatel@ventanamicro.com>,
	corbet@lwn.net
Subject: [PATCH v2 8/8] Documentation/kernel-parameters: Add riscv unaligned speed parameters
Date: Fri, 21 Feb 2025 15:57:27 +0100
Message-ID: <20250221145718.115076-18-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250221145718.115076-10-ajones@ventanamicro.com>
References: <20250221145718.115076-10-ajones@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document riscv parameters used to select scalar and vector unaligned
access speeds.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index fb8752b42ec8..9e3c5fecfa52 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -7477,6 +7477,22 @@
 			Note that genuine overcurrent events won't be
 			reported either.
 
+	unaligned_scalar_speed=
+			[RISCV]
+			Format: {slow | fast | unsupported}
+			Allow skipping scalar unaligned access speed tests. This
+			is useful for testing alternative code paths and to skip
+			the tests in environments where they run too slowly. All
+			CPUs must have the same scalar unaligned access speed.
+
+	unaligned_vector_speed=
+			[RISCV]
+			Format: {slow | fast | unsupported}
+			Allow skipping vector unaligned access speed tests. This
+			is useful for testing alternative code paths and to skip
+			the tests in environments where they run too slowly. All
+			CPUs must have the same vector unaligned access speed.
+
 	unknown_nmi_panic
 			[X86] Cause panic on unknown NMI.
 
-- 
2.48.1

