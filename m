Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794989630;
	b=mOnI4kCnV6n3uteFON5J/fuibJayt+PzdfiI+L9QjMnz/koXzMntaF8L99EjeBt78oI6
	 E5QFv6qqqK4Mxj+BK0zp2/t+zEpo2zq1sbmx7WDnvGsAdlHuUPKHnZcONa8b157cI28qt
	 pfdcdI+2YwDIkvIIeEHA98CmxtUUexT20IA2N1uALUHh9rE9pOADWQhfyp50AdfQrO6fx
	 kIdeWHwyAFn7vzaljXpCHkwMXBeqlgHPf3cahSiLmqKZ8U8lYBT6K/oLlbIWbk9W34jyF
	 ecbpVtwkbxAg6cIN3z6S60gcYfcelqTPddRubmoMkkkptao68tB+WQKcabohS2/DeJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794989630;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=LrvbirXIkv4em6QifUd4OnpixRUwowvXHi+8bl2oRk4=;
	b=dkIMcsJDhMsuu3lcyr4pzJjlUs00EMd43MMPRVovCxuySrpSMMkWuNBh+cdoC9vId2fJ
	 9lnk+1BvUphJWxhwQEbMISEu7lW/v0ygmtiMenR5MKYe+sAGJi4LM3u0GWk8sMvZXJ4sj
	 +imXeLT7PjF8jsFpKyoL8/GTxy4r5Kuj8DvSukpG+C1fi33Iy6SCImGMhm1B9kTnNLsVF
	 s0wge6zg5EJmgEYqhSSvGHZndRVd4NW/S6qsSxKjG07jxcBMWa0CjmCcmC873RyWwQuPS
	 tcEXTvRb650P5UTLveK4SkzmAygR5joOd36W2Fpe6Fw1kEKCUoZyc9nA/AwOVer/y6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b="F16/qyxe";
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF2D9606A335
	for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 08:13:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF2D9606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=F16/qyxe
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cdac6d19ddaso366173a12.2
        for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 00:13:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794989629; x=1795594429; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LrvbirXIkv4em6QifUd4OnpixRUwowvXHi+8bl2oRk4=;
        b=F16/qyxeJCnpp8cEUhvsIzwqbJ3dET3mcVkZCGuvG84FDRLSUKSXvBkFC/dcL95h3O
         nH+PR4V5h9u/CXPhFMsj2uTIAQIRtXn9Cs1Qc/obD1SHjPm/7cFXYoBKt0lWew4PsVZv
         Nkpu6WKaEpUTkfV/bxzun+N3aGLK08cjIVlgVcr3l+1DTbZCgg/jynXsSXRv4Tb1f8Wd
         0jYwQESDhgu9TfRoJ8wWU03yiHbjIPY74faHqETp1xJiWE+6/NB0rxJ7NGS/x48BzyGh
         1H1KNf+bmnqCe57I/4C9YZGtKmqRqeBA9oS2Uu+UmUlnQiI0uSKN2Rv8yBHqPAacLIN0
         yjgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794989629; x=1795594429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LrvbirXIkv4em6QifUd4OnpixRUwowvXHi+8bl2oRk4=;
        b=0hjFnYlzGBtkVd91jXM8h9fAPvkT82GbiGr5L0pzRjocWoEYm1vJxenD8kpR5ALhVk
         8r0h3od8/45DawlbgkIN33dpJLDgGe5W8oocDoo64lcRP0QguRUWbHwip0VQsJdmyMAc
         icKLq2OpvfLBR0G5s0UZVeXJl0MpLGWJ4J/GOmHVhLHtEzODmxCqJN+KsldQoo1y5BDh
         G3MK7duXq1qQOTiB7fsrZO4KSv/zeuLx5dOZqIPHpRwQ1RulsbycksU9wf3K/MU8apie
         ESSg8mRif/rcmht3u0b9M7mPpUkOEKnNtnCbL/ZR84YSINU1BP158DZXdgReGFAZFqdg
         3jYg==
X-Forwarded-Encrypted: i=1; AL+hErGn8e3BHiWxi7RngteIb98/lQV4B11OIYNY1movsaPPlVz7hQTl+Ct10bkW6C27Uqf3vfDmmIdAALY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9c4GytnYELed/Ir0heMEPOx6K/aMFNEbkvXJl0fPfjUSwDyGqI
	Csam7NzBEa8Gbly7D1iW7DWlNyTubF6SxYWXi0eVlBwL2HRNnDIM5xeoZ+5esprvYt0=
X-Gm-Gg: AZFdTZdBdZ5oxYYk6bPxVec+DICcP/WU77Zocu0TPjJr4FmLRKHhSeGNMlNlDINxwZd
	US1LnjAA8jWqSr5D6WngES0CCuJlxg4OPNckbKvhWlLz20/d4gKhiNuOeqIhIBfG/dyoE8Udo3b
	Hs7a5WhFwWE39+gTJzEfhkx8Ewrd91eEt/BMMU1Hl5MMLCoTlUiXRlSRx0Y9Gm5bH2Q+fi+3Ke8
	8YmjLHvHIcpEi8kz17NKcWERoZA7h3uPO+xjyqGhapB176NlnOpCktdTRhDn4wAoo6gjuX/lwcH
	kqgYQ9AMBpl0MKhhIHSEmm7YDMXuqf2ldUxdpZOG9YN19vYeKJ2N9jJlVR3jylCGmlp88KJptdU
	b/dx72dL3Q51aSi0bbansge5W7wDaS7iQC193IReHyj2eqUuRAMAYzYm+YHvWOpHQxmzyNqCAMT
	+vlUmobcSEwOngbUCu+cREbZIvxd0jz+d9BBWSvkG+biLR0RVygwdfTwv/D71PTFXwekvjOUPRn
	M6wKP6aSEHxwqesJOpnI7tjjBSU9mXSkd7Rl2DD0A0EH05mcrcumHxSIm35VXeV8ddIwxDR6iLi
	1L4t5t+GB1+hkpcqoEQ9NF8lLRxpAikbi1HtDuqlMZwFQ0WfCm/PXJzKTq7NLc4gR8WrLNy8yeU
	oyFWMXkE=
X-Received: by 2002:a17:90b:3943:b0:3b0:a7b5:c046 with SMTP id 98e67ed59e1d1-3b3d07e09f4mr2098689a91.54.1794989628976;
        Wed, 18 Nov 2026 00:13:48 -0800 (PST)
Received: from FJ7FR2JRQ3.bytedance.net ([186.240.245.239])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d1acde50sm3254680a91.14.2026.11.18.00.13.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 00:13:48 -0800 (PST)
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
To: linux-riscv@lists.infradead.org,
	linux-perf-users@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	andrew.jones@linux.dev,
	linux-doc@vger.kernel.org,
	corbet@lwn.net,
	atish.patra@linux.dev,
	anup@brainfault.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	yuanzhu@bytedance.com,
	cuiyunhui@bytedance.com,
	peterz@infradead.org,
	mingo@redhat.com,
	acme@kernel.org,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	will@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Subject: [RFC PATCH v1 1/5] dt-bindings: riscv: Add Smpdis and Sspdis ISA extensions
Date: Wed, 18 Nov 2026 16:13:29 +0800
Message-ID: <20261118081327.10684-8-zhangzhanpeng.jasper@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261118081327.10684-7-zhangzhanpeng.jasper@bytedance.com>
References: <20261118081327.10684-7-zhangzhanpeng.jasper@bytedance.com>
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

Describe the machine and supervisor PDIS extensions using the pinned
sampling draft. Machine support alone does not grant supervisor access.
These are draft bindings, not ratified extension or CSR allocations.

Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
---
 .../devicetree/bindings/riscv/extensions.yaml | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 79491ef8f86a..afda76b9c7c4 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -214,6 +214,15 @@ properties:
             ratified at commit d70011dde6c2 ("Update to ratified state")
             of riscv-j-extension.
 
+        - const: smpdis
+          description: |
+            The draft Smpdis machine-level extension for Precise Decoded
+            Instruction Sampling, as described at commit
+            2de60e18118ce78e2da82ec33296345c94d8560c of the
+            riscv-performance-event-sampling specification. It defines
+            instruction selection, filtering and sample collection across
+            privilege levels. This does not imply supervisor access to PDIS.
+
         - const: smstateen
           description: |
             The standard Smstateen extension for controlling access to CSRs
@@ -269,6 +278,16 @@ properties:
             ratified at commit d70011dde6c2 ("Update to ratified state")
             of riscv-j-extension.
 
+        - const: sspdis
+          description: |
+            The draft Sspdis supervisor-level extension for Precise Decoded
+            Instruction Sampling, as described at commit
+            2de60e18118ce78e2da82ec33296345c94d8560c of the
+            riscv-performance-event-sampling specification. It provides the
+            supervisor-visible PDIS registers and behavior, excluding the
+            machine-only state. Firmware must make this state accessible to
+            supervisor software before reporting this extension.
+
         - const: ssqosid
           description: |
             The standard Ssqosid extension for Quality of Service ID is
-- 
2.50.1 (Apple Git-155)

