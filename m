Received: from mail-dl1-f74.google.com (mail-dl1-f74.google.com [74.125.82.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F15734D4D3
	for <linux-doc@vger.kernel.org>; Fri, 16 Jan 2026 18:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768589070; cv=none; b=Mr6iTLTZ4nVtQPOKRkH+mshQDIfcymDulTKfkpkEm9WYW1IHYjQ1/5PiLXffsIldeI2oT1LvwGURU/0Ek6zr629IZrFJffBL96MMWVSTZ1HsSh/nUlAB8JXbkv4c1Ux+4acLJA6ed3MO8yummO0ZwmArScMj57ejx3xlsJjciEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768589070; c=relaxed/simple;
	bh=2cjH3BeJKr7kySKTSNu9Jkp6nte4kPc6qcz0FqlQDnU=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=WFEy72dJOI+3JSvx8hl0ZKNjb9SDRh4Dx/OKm6RHNVoz18S1C5jme5OuSpUkehZY+UWSLifKtl1hemg6Jhuv+Szwq4wKNz8QPt4ukLqX/IzbGFgYOVIR4Ykw06X++zBVAZCYlBsZffFmofJa61/7XhmE+yzjO6vaOc45xBq6B/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=w0PZAKZc; arc=none smtp.client-ip=74.125.82.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="w0PZAKZc"
Received: by mail-dl1-f74.google.com with SMTP id a92af1059eb24-1233b91de6bso4302333c88.1
        for <linux-doc@vger.kernel.org>; Fri, 16 Jan 2026 10:44:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768589067; x=1769193867; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vR+hsRwa2XjjiaLZeoNzi5LCSQhiLxUxHN38JIbsMBo=;
        b=w0PZAKZcWBRBakOutw8zklWtbO7j9/e1fFwLJ/9OEsODNJwZ0BjMWgP/GBp3vLlaaZ
         wvAoc6yLahCpHqh6fsX160Udk4dEixfU2RtTJs56bbcfkemILMZKecV6aa7rvN6dlIcr
         D6xZauu0FZl1S4pFuB1yXKnPJPkyWXCDYlNiKkydXW9ilW3ZgtiylZS0q9pU7PurPzLM
         RLwXFox9N3kWW05a9p2AxlwZ7Stbup0is8Oey3hDrVM/oBT5ULVwWhFUyiDGXZpwYIgY
         hy0gE7sbd0XRTcMboi4JqWjF3nRmDKjrbTBkfhY7s6JgasKsl/HdtQsQzkwiNn+UNejg
         Gp4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768589067; x=1769193867;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vR+hsRwa2XjjiaLZeoNzi5LCSQhiLxUxHN38JIbsMBo=;
        b=S7vlcVuPdpAyzZZagPsGaips+L1NN8k319EwdKE8WFma2kTr4mV9d8LZF0YqXpTa3v
         56rhFSCvwcbHTt2twHDrLt7x2/9M3i6L7Ngcuy0dAgdzT/9BIM1BFr1JO/mNtHBNowKQ
         7GCA0Ln1WLOKztJQe+7e4WCwfm11qcLGfHgXJRJO9eJ5p3j+4Je28Fw2nQCb1wL6uNOi
         42uLnfnL7yt5BgferzbaVZ0drZqBO1r6r1eS7Mr4L7RrxqpDp8KPI+TweGACOnYd0j85
         Dxmre2Gy5e6dTpV9OCek9UOOKZyCziLANjbSzU28jOMjJ/m+cnhxqNCE2dV9dEP9vApA
         +aKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjsHzzqZ+SYDmQYOIapOwiyeaiK1uxch2VV9hDZHAt+UvjdTnnqS7UX2uTtz4TELPBpZZGASZwHRY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb7hfxT9cVGklB6AMwxWmtDLXXff0/FzKjiP03tNH0BiS1/MMP
	qmLSCHiAlOjCorBeGzzXDVwtFSb7PpArUDToq216lfGkkUXWadKh+g1oLlczsp4J/kHgNtcl9PM
	Um0SoaA==
X-Received: from dlbps11.prod.google.com ([2002:a05:7023:88b:b0:123:2dd9:db4])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:e16:b0:11a:342e:8a98
 with SMTP id a92af1059eb24-1244b282f14mr3555854c88.0.1768589066553; Fri, 16
 Jan 2026 10:44:26 -0800 (PST)
Date: Fri, 16 Jan 2026 10:44:23 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260116184423.2708363-1-surenb@google.com>
Subject: [PATCH v2 1/1] Docs/mm/allocation-profiling: describe sysctrl
 limitations in debug mode
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Cc: kent.overstreet@linux.dev, corbet@lwn.net, willy@infradead.org, 
	sj@kernel.org, ranxiaokai627@163.com, ran.xiaokai@zte.com.cn, 
	surenb@google.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

When CONFIG_MEM_ALLOC_PROFILING_DEBUG=y, /proc/sys/vm/mem_profiling is
read-only to avoid debug warnings in a scenario when an allocation is
made while profiling is disabled (allocation does not get an allocation
tag), then profiling gets enabled and allocation gets freed (warning due
to the allocation missing allocation tag).

Fixes: ebdf9ad4ca98 ("memprofiling: documentation")
Reported-by: Andrew Morton <akpm@linux-foundation.org>
Signed-off-by: Suren Baghdasaryan <surenb@google.com>
Acked-by: SeongJae Park <sj@kernel.org>
Cc: stable@vger.kernel.org
---
Based on mm-new

Changes since v1 [1]:
- Fixed a typo, per Matthew Wilcox
- Added Acked-by, per SeongJae Park

[1] https://lore.kernel.org/all/20260115054557.2127777-1-surenb@google.com/

 Documentation/admin-guide/sysctl/vm.rst   |  4 ++++
 Documentation/mm/allocation-profiling.rst | 10 ++++++++++
 2 files changed, 14 insertions(+)

diff --git a/Documentation/admin-guide/sysctl/vm.rst b/Documentation/admin-guide/sysctl/vm.rst
index 9096e2d77c2a..b98ccb5cb210 100644
--- a/Documentation/admin-guide/sysctl/vm.rst
+++ b/Documentation/admin-guide/sysctl/vm.rst
@@ -487,6 +487,10 @@ memory allocations.
 
 The default value depends on CONFIG_MEM_ALLOC_PROFILING_ENABLED_BY_DEFAULT.
 
+When CONFIG_MEM_ALLOC_PROFILING_DEBUG=y, this control is read-only to avoid
+warnings produced by allocations made while profiling is disabled and freed
+when it's enabled.
+
 
 memory_failure_early_kill
 =========================
diff --git a/Documentation/mm/allocation-profiling.rst b/Documentation/mm/allocation-profiling.rst
index 316311240e6a..5389d241176a 100644
--- a/Documentation/mm/allocation-profiling.rst
+++ b/Documentation/mm/allocation-profiling.rst
@@ -33,6 +33,16 @@ Boot parameter:
 sysctl:
   /proc/sys/vm/mem_profiling
 
+  1: Enable memory profiling.
+
+  0: Disable memory profiling.
+
+  The default value depends on CONFIG_MEM_ALLOC_PROFILING_ENABLED_BY_DEFAULT.
+
+  When CONFIG_MEM_ALLOC_PROFILING_DEBUG=y, this control is read-only to avoid
+  warnings produced by allocations made while profiling is disabled and freed
+  when it's enabled.
+
 Runtime info:
   /proc/allocinfo
 

base-commit: eeb33083cc4749bdb61582eaeb5c200702607703
-- 
2.52.0.457.g6b5491de43-goog

