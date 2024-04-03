Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C524157A6C
	for <linux-doc@vger.kernel.org>; Wed,  3 Apr 2024 23:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712187703; cv=none; b=p0hfE5tIkhE1wupj9ZaCFmmHiB9WfdWnq/wdUWdVbpNAKCc3C/L52TZFEm6YQ8cZ0cmsO+FiXeM6r9rGJagGI7oS0iLR3ZrYhiTsY9EA0sx1pKIvLz33EIHrcpzovus9sWkTPEruJHX3Rkf80o8tr4CD8bxce/gO6jrf1T9UHXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712187703; c=relaxed/simple;
	bh=J89q9o6s6HqxbEZ6ljGjC0aJm6z4lMiWud5hMQgiuBw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AZslVpM1f6KNFqPFXTi0fL5fM/fEeolitIZIv75PIiv3GW5ie96x5xVjsF8cNRS6LddzfNOOfPj2YSu2qJCXtjQ2F4+9sLZUvNeK/fSgV8H4tlRVxyV5uB7HM26AEgBkO1HGpkKAfcrvMmPCxgIbUYzBna+Rxb12zpJU/WyNLMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=mTG+xJHH; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="mTG+xJHH"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1e0d8403257so3257425ad.1
        for <linux-doc@vger.kernel.org>; Wed, 03 Apr 2024 16:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712187701; x=1712792501; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=orqHimAqeIVvjnhm+Lh8YT/bDSQ5kt/uWL0O/MbcU4M=;
        b=mTG+xJHHkSNXluhuTNXNcLAt5ecDKHwA0gaXd7JrpPDne5+qSTWIVILo1n0KKQTz68
         Q03GKkaE55tLxNhpQtdk2ILD4s931BjN5AewwTG2sqF5y3UYbHzpo2I2Qs9AzCGWG0f3
         SJO4aj58OQTcYbny+4vw1CAKrUFKPCRQ738CKXXqdxa+9e8wapDULkVfxLZXjKRcWlzd
         GPx3TZy6+/0jtuUvedaKNVic8C7AJdU9XS56hU+/xgTIVvu8kiKqZmCkdWnYuCaP5g/7
         RY8R5F0X4xjnJrlsEX9hIHyZW3z3Fq+EeXG2x8Bs3usTqY9ym7jRQvILMrjhdiCzMcSX
         WSZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712187701; x=1712792501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=orqHimAqeIVvjnhm+Lh8YT/bDSQ5kt/uWL0O/MbcU4M=;
        b=WUqT+7eW6CENirD0nXk+/6IKCvarPWZJYzbVAKkrxmfsAfgZj1EDwuXaxRyAutUjst
         rjnndp0rFylZHmcInFDhzQY9LsfsQIsREEo45bt6O15Ki1iKFfWPdUE0ZfLs3Qpn0U3N
         iicCwKHEKdcv4wVR5GZHh7Q0FrILStSQRd6mIx0WRFLNdJwCX7rNpK1Gy+ZQVrv+o/SJ
         dpQMt4DcOVMmm8K2UmevVkBodMwuIyWTHNqSOeBWKHH0oVEkRTe/zhKX7FvpwETG1jJ9
         6k2YEbAOdqkUp8dlDFMqELz+3FGhXXbISsaVp4GuzFJpoSsxQ1GKn/yjHy+ThxyUzlAZ
         eU/A==
X-Gm-Message-State: AOJu0Yy47ia2ts2ULurSLU1GwPYYQTi7y0vMHptXvjvGPzAhaNYc6Dcg
	F1IV9o1Yn8aOCURQoJzr8r0IDmBDIyJf7OtrDsRCrorrVImffbSdtxGMIl/xZBo=
X-Google-Smtp-Source: AGHT+IHS90cA+AgUmlXmCnhm/ecMbFJNWD0dZq3yi8zpTRzaElJ0z3lk+4PPNraXYIXlpU0z512YdA==
X-Received: by 2002:a17:902:d4d1:b0:1e2:8bce:b338 with SMTP id o17-20020a170902d4d100b001e28bceb338mr994151plg.5.1712187700925;
        Wed, 03 Apr 2024 16:41:40 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id b18-20020a170902d51200b001deeac592absm13899117plg.180.2024.04.03.16.41.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 16:41:40 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
To: paul.walmsley@sifive.com,
	rick.p.edgecombe@intel.com,
	broonie@kernel.org,
	Szabolcs.Nagy@arm.com,
	kito.cheng@sifive.com,
	keescook@chromium.org,
	ajones@ventanamicro.com,
	conor.dooley@microchip.com,
	cleger@rivosinc.com,
	atishp@atishpatra.org,
	alex@ghiti.fr,
	bjorn@rivosinc.com,
	alexghiti@rivosinc.com,
	samuel.holland@sifive.com,
	conor@kernel.org
Cc: linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	corbet@lwn.net,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	oleg@redhat.com,
	akpm@linux-foundation.org,
	arnd@arndb.de,
	ebiederm@xmission.com,
	Liam.Howlett@oracle.com,
	vbabka@suse.cz,
	lstoakes@gmail.com,
	shuah@kernel.org,
	brauner@kernel.org,
	debug@rivosinc.com,
	andy.chiu@sifive.com,
	jerry.shih@sifive.com,
	hankuan.chen@sifive.com,
	greentime.hu@sifive.com,
	evan@rivosinc.com,
	xiao.w.wang@intel.com,
	charlie@rivosinc.com,
	apatel@ventanamicro.com,
	mchitale@ventanamicro.com,
	dbarboza@ventanamicro.com,
	sameo@rivosinc.com,
	shikemeng@huaweicloud.com,
	willy@infradead.org,
	vincent.chen@sifive.com,
	guoren@kernel.org,
	samitolvanen@google.com,
	songshuaishuai@tinylab.org,
	gerg@kernel.org,
	heiko@sntech.de,
	bhe@redhat.com,
	jeeheng.sia@starfivetech.com,
	cyy@cyyself.name,
	maskray@google.com,
	ancientmodern4@gmail.com,
	mathis.salmen@matsal.de,
	cuiyunhui@bytedance.com,
	bgray@linux.ibm.com,
	mpe@ellerman.id.au,
	baruch@tkos.co.il,
	alx@kernel.org,
	david@redhat.com,
	catalin.marinas@arm.com,
	revest@chromium.org,
	josh@joshtriplett.org,
	shr@devkernel.io,
	deller@gmx.de,
	omosnace@redhat.com,
	ojeda@kernel.org,
	jhubbard@nvidia.com
Subject: [PATCH v3 04/29] riscv: zicfilp / zicfiss in dt-bindings (extensions.yaml)
Date: Wed,  3 Apr 2024 16:34:52 -0700
Message-ID: <20240403234054.2020347-5-debug@rivosinc.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240403234054.2020347-1-debug@rivosinc.com>
References: <20240403234054.2020347-1-debug@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make an entry for cfi extensions in extensions.yaml.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 .../devicetree/bindings/riscv/extensions.yaml          | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 63d81dc895e5..45b87ad6cc1c 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -317,6 +317,16 @@ properties:
             The standard Zicboz extension for cache-block zeroing as ratified
             in commit 3dd606f ("Create cmobase-v1.0.pdf") of riscv-CMOs.
 
+        - const: zicfilp
+          description:
+            The standard Zicfilp extension for enforcing forward edge control-flow
+            integrity in commit 3a20dc9 of riscv-cfi and is in public review.
+
+        - const: zicfiss
+          description:
+            The standard Zicfiss extension for enforcing backward edge control-flow
+            integrity in commit 3a20dc9 of riscv-cfi and is in publc review.
+
         - const: zicntr
           description:
             The standard Zicntr extension for base counters and timers, as
-- 
2.43.2

