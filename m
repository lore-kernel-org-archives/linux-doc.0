Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 212B81CAAC
	for <linux-doc@vger.kernel.org>; Sat, 17 Feb 2024 00:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708131506; cv=none; b=fS+zP1k8fySarl81jkdwF0rYD7BLXZ9TLDSSFGeL5zDxTWEaWeTDW6tRgnFoLkUVfoJMWF6zk+ptfuGUmJBxOfc3QSg9QdVFQm9dvJW2SO8NeSrqhn0JG7OwaQfUmM4TkVsBdVAtIuRkSgj1mvRY3PzLkiecGn48s7+a5Q0f5Kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708131506; c=relaxed/simple;
	bh=wApsm5WI3b6ryt2xXhsST9JCFAgMEijoZLP8Q80/+38=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YNMqDFrRbGXGwtWcUpThz82aQ4eSqZDFgU64q93CMlg0WrwVWkBVHNbEwG1/5N1TQddSF1WQmQDEqUIPxlV0su5SsfM4rAI0IUtr1jaKRykT30P9DALp5z9gTAbPNjSWZxztZOrV1s9rO9uz2CqUFlltYkMyWQ1uWGUTClvUlDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=Xkx/aXIF; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="Xkx/aXIF"
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-21e3c16880fso1311875fac.2
        for <linux-doc@vger.kernel.org>; Fri, 16 Feb 2024 16:58:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1708131504; x=1708736304; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AGOhtuG2UaHnTQxcaDC8cd9FvgXaDTb+kFLo3H4sRjk=;
        b=Xkx/aXIFtLL4NOJc6WW/nbFdMM55wijiJf33fSfxT4oQ/0dI2L51iSNq5BqkJEQEIS
         kSl9FnspmGN/OXdOapUYOu2JtFO07t1BQFtSktvQgZAoxLMV95yE+GfMwCLxM0WLzueY
         DiLl7jQ6b/w2uOkwMwZP5C3zKk9FfL5LNjLlpcf85fVIPtR01XF1kwcKuzjUHbcUOW5a
         M6sHden2tY7WexLYgpwmwOYb90tKfpHgtMBqBrvUhJBrZ/AvqG23XFcDuElyRvFOo5PE
         roELP8VvyLjOlOP+lAvGPVi8m+yUiCEP6Ml2MBO8kEb/OT25ZAMyN3Ld6eGBSsHQbutN
         gpBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708131504; x=1708736304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AGOhtuG2UaHnTQxcaDC8cd9FvgXaDTb+kFLo3H4sRjk=;
        b=Kdtw75kMlX3SDKQEVlw5likHfJgLoqxiEl/SPL0oZO+clAtauBiNvbZCef7uG9HBh1
         PSXWK8CxZXlCk8P1+/c8zSDbzEtaI4uyGOsKL4k4WlNh0FFpdpJ6lVPyMN1Zfmp2V6rL
         1v3tClbizeLwORpoZODKBlviJLVfKRugIFVz+1RXfJmoV/BE4mCVsLsXWxMFZO5EoGkQ
         7KTwKouY7GRYIDdGITPBKnXjkRdcXMuycj+9aW4JNNCq5So8B/DuLcn9k9pEuhaX89EY
         UETaXqyBZrHEvHSleQCByjW7JGU/Vhd4rci7ikRkNEdLTjeNu8bgEXc8C4meF71UdSJ7
         bbbA==
X-Forwarded-Encrypted: i=1; AJvYcCWGjIW4SjzimARrPxlnY57YqkqXJnShOehbiiww52oGwHP/xd5OrJaaN0Hc2K0R+SuehUy6GVXOhWAeydSjrRFmReWVvClMpkjA
X-Gm-Message-State: AOJu0YwWfrCI+wrRY9Z12CwwhOb4VIyZnV8HQTImjTZ9zxsrNgz+XLTc
	9VmzLJettKoVHrMFTUP1OZqmsi+vUNUledD9+lKaMrd0rgXRcMte04UU4GrqgAY=
X-Google-Smtp-Source: AGHT+IHVmqRBo/P6TbzgA+IGRtey54aZ2Ug+NftR1Tt1j04Iczb8JXsSk87BBrBxRg2sWo4RpRMoyA==
X-Received: by 2002:a05:6870:40d3:b0:21e:7fba:1960 with SMTP id l19-20020a05687040d300b0021e7fba1960mr1993804oal.18.1708131504258;
        Fri, 16 Feb 2024 16:58:24 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d188-20020a6336c5000000b005dc89957e06sm487655pga.71.2024.02.16.16.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 16:58:23 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Atish Patra <atishp@atishpatra.org>,
	Christian Brauner <brauner@kernel.org>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Conor Dooley <conor@kernel.org>,
	devicetree@vger.kernel.org,
	Evan Green <evan@rivosinc.com>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Ian Rogers <irogers@google.com>,
	Ingo Molnar <mingo@redhat.com>,
	James Clark <james.clark@arm.com>,
	Jing Zhang <renyu.zj@linux.alibaba.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ji Sheng Teoh <jisheng.teoh@starfivetech.com>,
	John Garry <john.g.garry@oracle.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Kan Liang <kan.liang@linux.intel.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	Ley Foon Tan <leyfoon.tan@starfivetech.com>,
	linux-doc@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Rob Herring <robh+dt@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Weilin Wang <weilin.wang@intel.com>,
	Will Deacon <will@kernel.org>,
	kaiwenxue1@gmail.com,
	Yang Jihong <yangjihong1@huawei.com>
Subject: [PATCH RFC 04/20] dt-bindings: riscv: add Sxcsrind ISA extension description
Date: Fri, 16 Feb 2024 16:57:22 -0800
Message-Id: <20240217005738.3744121-5-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240217005738.3744121-1-atishp@rivosinc.com>
References: <20240217005738.3744121-1-atishp@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the S[m|s]csrind ISA extension description.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 .../devicetree/bindings/riscv/extensions.yaml      | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 63d81dc895e5..77a9f867e36b 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -134,6 +134,20 @@ properties:
             added by other RISC-V extensions in H/S/VS/U/VU modes and as
             ratified at commit a28bfae (Ratified (#7)) of riscv-state-enable.
 
+	- const: smcsrind
+          description: |
+            The standard Smcsrind supervisor-level extension extends the
+	    indirect CSR access mechanism defined by the Smaia extension. This
+	    extension allows other ISA extension to use indirect CSR access
+	    mechanism in M-mode.
+
+	- const: sscsrind
+          description: |
+            The standard Sscsrind supervisor-level extension extends the
+	    indirect CSR access mechanism defined by the Ssaia extension. This
+	    extension allows other ISA extension to use indirect CSR access
+	    mechanism in S-mode.
+
         - const: ssaia
           description: |
             The standard Ssaia supervisor-level extension for the advanced
-- 
2.34.1

