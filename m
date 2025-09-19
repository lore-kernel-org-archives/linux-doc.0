Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E249C2D5944
	for <linux-doc@vger.kernel.org>; Fri, 19 Sep 2025 07:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758267473; cv=none; b=IH6xVNgdercUVwtznt0/vIoA10bw3T3J8G9MIXa16oymUrMpTLekcYo/IXwLEh4k6yTwcsXrW9FY4Pdp4kk9+KQ8Y8AxhY8mivch7s47CB5buTaIrz3ceRMtvhc3PyVOm2bWudi0zf3UbDmdy9dcvA7d6HNLIizIU5SH4tWhdqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758267473; c=relaxed/simple;
	bh=+YpuvhJCI/yShT1rtWNvOFpxGI7l/ehsFRhKIaNPItU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rysCvEEMee3Xpdudaet25WA0SqhF4+ch9LOjq3p8aHov6vwA3tu7+7j/S3iloVosc6d9JzsweBLpd9ls3i5HF1W98MArbhYTHWwKCmLL2OkTL7uuspYBjT2UYDTnEaHuT1dkDacgualJ5ZVpyw2qhhc2bsJVctXdIySCZu+e8gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=ILMwbVmv; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="ILMwbVmv"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-777ea9fa8fdso1865122b3a.0
        for <linux-doc@vger.kernel.org>; Fri, 19 Sep 2025 00:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1758267470; x=1758872270; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kcpuRb5Zady/Ndj7TK1NVXuo7wdyupAjCmRtQU7qg78=;
        b=ILMwbVmvePhwb63VcL6xWvyq86V2LqZ5vXnadEgJSykWDZwrQbtAnlaKSLd3nA6aMV
         jjV2urD+9mkl06Sa4OQeeh7HWIPO0kMaFmaEAXwdo2FOU60uZ4RIqvqs0I8QlAOBoBxT
         9axFeZevbtti6CXIFJ0keSVca9dPy7hVEEoe1iHCa5009KqC2o7FtDiXeVWQUJOJUvZb
         Lt1y55GTQZmmN1H8cm3gYunoYcwbpSViiSdjlmuPTwSpG+TvAmJzVz6zuk9aIX2gMFCj
         0auPMTS8G7O/CtzigwFHBUHWa9W30oulwiCRzilvQtvO3eJtrZtv0yciY/YDCRyhwVpk
         dTLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758267470; x=1758872270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kcpuRb5Zady/Ndj7TK1NVXuo7wdyupAjCmRtQU7qg78=;
        b=Od305dkSRTW2wwIbH131Ut+1igBQBrKu66rnkN8wtVr3sEkncz3I2cyXUu0yJZfAoC
         dIpaxM62Z+4hBgRgBXvpRKdzIhEhl3GwBdcuNL19oQYo3Rh+7gQtZ8AN/qTocAZKGR4O
         28BXJqdK0om2h1pxwQ9J9hMQVuMLbVbZyfaJyYvgcEwglcRWDHaS4jIiqynolWJLXc72
         wjXVHzI0JUtpYVeWeoaweexGFPlIjcpy54n0xeY4BnnVnZHZqs6w4Fyijp02ofMZQPXt
         1GIyNyzyxMrCHqUEsijsO4KiPtQK9Sr3UhnJyz+Yqbg8jHl7dSwWWBP9Ym8jWh7ILPMW
         Yfxw==
X-Forwarded-Encrypted: i=1; AJvYcCU8gzHmtsqKq9B+3JLwjvBaWkMghnEND7TWKU6q3cQtwb/6onSYYgqNmq92AhS9ouo9R4dwVffDhCM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJnaqefxNYjCJYUZd9fMv9nTZ2QNoXq4KZHTtpwkTlqj0SzS7l
	Ea9cGsjh7yRsyn+hobCmd2+GqSZQys97TjoeWcExpS7aBofNZYX6Lkop6eQDrh9g7Zw=
X-Gm-Gg: ASbGncv2idO4azlWLAdBzY+1xu7CQTUOhRut7Hpxa2rIg7TqNrHT6WBACmTosd8wynZ
	VBByF0iSDEx6fvUyVoULoZ7Y4GHPAhvtmgBJZAPwnqZ8g8JNQapCuzCFNMbmrOQpk/+lZ8VMl2d
	ntJ8KweiSA20q2K6UAtUsAuL8h0ZhDcwQ4+J7yX0UF4VP6fzWuny3G9m759ps/dL7r3v4ge5PQO
	phC1m/Wzp/D0hX/rIssTgoj4uTK68iS0ZyYrpRGxMRWAIqjS6SUT89AMVkhuNtnKUaSVVZtgtlK
	OZ2gsR9r5xD/DgnPIfwg6zPreyPdU3m/FQ4P3NlKeZB5ak4djXToyICLjadz7ZIUrUVqFajwgFN
	A3OejkRqV8EwFujvIYs26N3X6v3CxF8Jd9c9p6DY48Y3JLMBibcMHuLhNGN9dySwmaRF30NM/XN
	14OMPYN7xAnfeArZl7jToSYMDeSjEum3pYGx/PZViFyw==
X-Google-Smtp-Source: AGHT+IEgACB1Se8zkEhUh/liD5ZfRMe2E7bZVsNaOovjpda2dN5kxeT40rB2jna9QVBQYl1FDLn0SQ==
X-Received: by 2002:a05:6a20:258e:b0:248:f6f1:200a with SMTP id adf61e73a8af0-2844b5ca29cmr7654865637.1.1758267470068;
        Fri, 19 Sep 2025 00:37:50 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.57])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b550fd7ebc7sm2679096a12.19.2025.09.19.00.37.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 19 Sep 2025 00:37:49 -0700 (PDT)
From: Xu Lu <luxu.kernel@bytedance.com>
To: corbet@lwn.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	will@kernel.org,
	peterz@infradead.org,
	boqun.feng@gmail.com,
	mark.rutland@arm.com,
	parri.andrea@gmail.com,
	ajones@ventanamicro.com,
	brs@rivosinc.com,
	anup@brainfault.org,
	atish.patra@linux.dev,
	pbonzini@redhat.com,
	shuah@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	apw@canonical.com,
	joe@perches.com,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [PATCH v3 2/8] dt-bindings: riscv: Add Zalasr ISA extension description
Date: Fri, 19 Sep 2025 15:37:08 +0800
Message-ID: <20250919073714.83063-3-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250919073714.83063-1-luxu.kernel@bytedance.com>
References: <20250919073714.83063-1-luxu.kernel@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add description for the Zalasr ISA extension

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index ede6a58ccf534..100fe53fb0731 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -242,6 +242,11 @@ properties:
             is supported as ratified at commit 5059e0ca641c ("update to
             ratified") of the riscv-zacas.
 
+        - const: zalasr
+          description: |
+            The standard Zalasr extension for load-acquire/store-release as frozen
+            at commit 194f0094 ("Version 0.9 for freeze") of riscv-zalasr.
+
         - const: zalrsc
           description: |
             The standard Zalrsc extension for load-reserved/store-conditional as
-- 
2.20.1

