Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2E578F2F
	for <linux-doc@vger.kernel.org>; Sun, 18 Jan 2026 01:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768699104; cv=none; b=gDh7wrvPS/HI6Q8rWxEGHiXOD3RClYGAER0IuSFh/wKqfmDGbh/sV+uTcfKA32SN7OEPBaQ+dj6T7yCptYnYbA57TB1wS6okrB7NTSlIORW5GVIZS0dkbJYDMn53/5b5lfIlIuNOZQiVBFilK7sMCuP0BzV/LFlBIaxiWpYXkIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768699104; c=relaxed/simple;
	bh=o255kqj9N8oeGK/I9xWWmtlxK6I+tQ2294asnIjtCKg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=okyS3rMTEFubvMEg/9R8KEBxSwTMA7x1bgqLly33DsKXQva08pEI9aN/DRMEqdrEISTwl1xgK13WsJlxho04O5Jg/IIp4WpxaCJ2yx/ks9ScNcHyMguw0JdgiCKktg4PekpZiBsVxASI70A73tPcA4lEyV6MlvMvemxV5UMBoJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nmc6wRa1; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nmc6wRa1"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-8c52c67f64cso349889285a.0
        for <linux-doc@vger.kernel.org>; Sat, 17 Jan 2026 17:18:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768699100; x=1769303900; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xHdYO4hylg5Fck4tzGsglyFOuT/7NqghvPt+ikirSH0=;
        b=Nmc6wRa1BxZf6HAPU0ZjvSP03equlZEDZ+2RxwoMXkSCvmMzJZmpNHg5hkcJl80AMs
         CMkiPLhzMp/f5PUBV9eZ1TmB8Oowu1EDKa4lCBhD0KDjdMdr3dW4AWVQq4tr5zOCMk4U
         98phJzvZhttnyPNI9LxU1sgMX0MjK0VdaAAgnfXio6eUQ4WDm1HkNUNtW9AcgC99O4wt
         kuyNIuNIxM7mYQuSc5bR1fvjHddY2MFJ34sJpYq8CkHMNrfxGenQCqhmJWWq/2AMRTLj
         oFSPFI/x+ykKdyCCs0QVmLfah+WaxDs1G161opInE80VZ/sFiBL9qTNFZdR3+SkRm+DD
         Fm5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768699100; x=1769303900;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xHdYO4hylg5Fck4tzGsglyFOuT/7NqghvPt+ikirSH0=;
        b=o+vsj2IvL3HTNi2NGNRbr3XmO6hvStlGIOkiTRwcmY9HGqYVY5nYAbiHGEx6kujLIm
         yt0P0rfFC9xW1Dwto/BVd01c0kaduF2zHNhSoreOgL634sUSRzY3qMDNZhna+xTqsho3
         tbIQPwjocn4md3z8dyMhLHG2dwxxqbOVsQG7bBZS/463l/08G8F/jdi5W9d2FBjK6Kyk
         V26sEFaU9RtNV84US2slZzQ+a45OxDTdZtdYKnXCYLrJAXRbgo54lybq4DCKETiFu9Pi
         vhJZBdyAdEL5c0Xtkbbp6equ5W0+59htbUHG9MBam3wUYcXHMz0CEzyzp8PW8XTIH6Vx
         jKTg==
X-Forwarded-Encrypted: i=1; AJvYcCVQyBP/42s4ARKaqwl6RRIMz9RGU9RxslVaYelF/WfXBnj06URakDloNyi+zG1Kjps0sDUh2hbanU8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoXCgrWzoD1q4ZK+HKBdmjU33xEH9XyAAk4hKGiNFilcZjfR/3
	xjBJ1JT9sR1MW3AeGLFsbY8vWvuBjYyGa5m/sc2yOxMpv99EuMsbeWBa
X-Gm-Gg: AY/fxX5/4Kt3gDlZ+FjV/Csq0fBfvgoDw+QIyaKLqBMX/NWns+8k5IwZmkcutdX+k/Z
	SyepJiy2o4s8cjaNUdx0LApAkjKAfAhSpy2ViQAG5rNnSQSI34/eEph/2nEt+n/1hd9Ucfx2w2U
	zfzdd+aTWsLgmYW2Z4K8Fbai9+UQaKJbqGvEPQkDujepPjvHkA3npslWJh5LSWlyyS0SlA3/Lvv
	sWVSxjyoV1Bp/Qrk9p75we0FL2IOKA/DNu4geEdq078tw2cEth4TW4zFKUs9sHOshSfliEWra0F
	MHNFJMoKsVrynP3pn8N9/oR82P7YlvTlDFnkh/0hn28TOx7SlVhZKcFXKSZQCqn74K8zywvyTkb
	Ch87hZXJlkU0fKK9zikIheX3YHBSH5EBK3sibVhSfKoRz3TrxgYdWxOEv1Q+AwNwMGlzo+pud9N
	qVEdHcybwIiPFeMeMxKCb8xRtDVrf20TAutrdu/+c/+483Hgbn9Q+MiIKFz22BXvo5rkqS6XI=
X-Received: by 2002:a05:620a:3953:b0:8c6:a5aa:465c with SMTP id af79cd13be357-8c6a676df81mr1041091985a.55.1768699100327;
        Sat, 17 Jan 2026 17:18:20 -0800 (PST)
Received: from pc.tail882856.ts.net ([2600:4041:4491:2000:8a64:ec6b:4:f1])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6a72642fdsm512290285a.46.2026.01.17.17.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jan 2026 17:18:19 -0800 (PST)
From: "Seokwoo Chung (Ryan)" <seokwoo.chung130@gmail.com>
To: rostedt@goodmis.org,
	mhiramat@kernel.org,
	corbet@lwn.net,
	shuah@kernel.org
Cc: mathieu.desnoyers@efficios.com,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	"Seokwoo Chung (Ryan)" <seokwoo.chung130@gmail.com>
Subject: [PATCH v5 v5 0/3] tracing/fprobe: Support comma-separated symbols and :entry/:exit
Date: Sat, 17 Jan 2026 20:18:12 -0500
Message-ID: <20260118011815.56516-1-seokwoo.chung130@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series extends fprobe dynamic events to accept a comma-separated list of
symbols and explicit/suffixes.

Currently, fprobe only supports a single symbol (or wildcard) per event. This
series allow users to specify a comma-separated list of symbols, including
exclusions, and to select entry/exit explicitly using /

Examples:
- f:[GRP/][EVENT] func1,func2,func3
- f:[GRP/][EVENT] func1,!func2,func3 (exclude with '!')

Logic changes:
- Refactor parsing logic into parse_fprobe_spec()
- Support comma-separated lists and '!' exclusions
- Add / suffixes for explicit entry/exit selection
- Preserve legacy single-symbol behavior (single symbols still accept %return)
- Disable BTF-based signature lookup when list/wildcard is used, since one
  function signature cannot apply to multiple functions
- Reject mixed legacy/new syntax where applicable (e.g. list + %return)
- Update tracefs/README and fprobe documentation
- Add ftrace selftests covering accepted list syntax cases

*Patch order is adjusted: code first, then docs, then selftest

Changes in v5:
- Reordered patches (code->docs->selftests) as suggested
- Addressed review feedback on README help text to show both legacy and list
  syntaxes
- Added missing traceprobe error IDs used by the new validation and fixed
  parsing/bracing issues found by automated builds
- Removed the dedicated list_mode field and infer list behavior from presence of
  filter/nofilter and keep struct trace_probe as the last member
- Link to v4: https://lore.kernel.org/linux-trace-kernel/20251127151218.4763b25c751bb2aac4b1ee36@kernel.org/

I am not fully confident the runtime testing coverage that I did is sufficient
across configs/architectures, so additional verification would be appreciated.

Best regards,
Ryan Chung


Seokwoo Chung (Ryan) (3):
  docs: tracing/fprobe: Document list filters and :entry/:exit
  tracing/fprobe: Support comma-separated symbols and :entry/:exit
  selftests/ftrace: Add accept cases for fprobe list syntax

 Documentation/trace/fprobetrace.rst           |  17 +-
 kernel/trace/trace.c                          |   3 +-
 kernel/trace/trace_fprobe.c                   | 209 ++++++++++++++----
 .../ftrace/test.d/dynevent/fprobe_list.tc     |  92 ++++++++
 4 files changed, 269 insertions(+), 52 deletions(-)
 create mode 100644 tools/testing/selftests/ftrace/test.d/dynevent/fprobe_list.tc

-- 
2.43.0

