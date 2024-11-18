Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E12271BD9FB
	for <linux-doc@vger.kernel.org>; Mon, 18 Nov 2024 22:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731968748; cv=none; b=M9wXDFKEV1+0Mmfv7SCHHAMcdOZQXqC8YHem3G59P8S76I3cPbKz8Ivj4JDl4OTocngYRo3nj9HzaJMhN/eNVbda66xWmt4K9H+1dDhLWvEOswBDlSb8F1TJGr2SHZYB0D6gssdZ0NM+t2oE9APj+4ivhvNY3W05zGNX/tJWLZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731968748; c=relaxed/simple;
	bh=gP4UrWxmVwADGYWCtmu+TyIRa/S+bnajwdjRKoNwMvg=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=eimWUhyEUuF0VDyxY6UaDKXeDlknCD/nwVzLt0tA1a/HEC0pMABbxRvm8rV8rbR5VfZeg55CSt9fNnrE6AD47gtqmLsWsRjGJ26y51UD7wsdaoIoZ2W4IY/WDRZIQKF6egZ8uoNVVJSRhRUNu3daPOtYEZF8J1Z9KoJncwvQjpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--yabinc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wSMucEB5; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--yabinc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wSMucEB5"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6eea70c89cbso7400567b3.1
        for <linux-doc@vger.kernel.org>; Mon, 18 Nov 2024 14:25:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731968745; x=1732573545; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=14OsMhdGfdcpS80IHQ9XNfdJp63ZxqrrUOpqJIR6RjE=;
        b=wSMucEB54wQK64K2/YAfcjNw4fzLmbmujoJNfeIn2j2dwFyxEmkkFWZeiQKOAb7k22
         IVkNF8bNFzTFTolD2GPCsrpr2kQdXsz8+3lUO5c+m+kan0mHROxyYmx+EcbZ3RzxM+n0
         TZLTdA/WHU0tl7SzaFpkYkzRXtBGX44Y3NiMVvCGOD17vDQFp0hk0aiyo0Kq0YN+58ln
         rRZtKVkkLr3Qijf6zI07056XgjDrx+t2qV8cwFLYhwSiXifbeEIRUmb9ml6ESXBZ3xT+
         8hZVrFnjhOYK4E0yWdYLMetBc39smYIoniHaXC9r0+t63ixqjrwPwKSFVntzpk9kL0pN
         G0Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731968745; x=1732573545;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=14OsMhdGfdcpS80IHQ9XNfdJp63ZxqrrUOpqJIR6RjE=;
        b=g9uY5kAitFO2UrHbSrKpCMVVvS1vHq89sHwe7GIGDwS3ArnYioNGcD9HNgrmKIJSwq
         3npT7KSQ6oY5tMqYdUPTH8hLecd6hpwNprOHbtqcVa+foJJzUjK9OF78cwIi9E/1lJc6
         3bna6krL3aQbeECEYz/7m4xCRNnErYJOBxnWVqNQO0gUvi963hAL187xtnU+gqwmOk6f
         z62jPbmi0nB3auX/OF9kCcFx0gmhy8JmYVX4XqqMtYgOiRDOQyzLnjbvQUFdlcPKh69D
         cnwCiZO36WQ3mHahjGGN4hFtko2bUeM/f/TMif+LGmw07v7bUr8rNu9638fz8zbUeN7t
         9CSg==
X-Forwarded-Encrypted: i=1; AJvYcCUJfQ7W1PFFIh85fErPb4yUOSZ5QSn72vivixLtAoe0IRuVuOnEyoFtcZVDu2ZDm60dp0KN8QIxmLg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhSI1j3pxJlLChJrd62dPYG5OTgzkHx9QRpVUXlwDNJtucHg74
	cvY2lYWUcawKHBFmtnmlrBLZ9IvWxJkZiPlRfDk4NPvQa97G5gIvBfTSU9DmOnwP3bxB9LsZtgy
	x
X-Google-Smtp-Source: AGHT+IHaqSLX7qNc1UhlL7DMMonDFnZRihYI5SIMh0lBI+T2x10S5W6DAGbzQyiEudeWnrky5v96GHNZfoI=
X-Received: from yabinc-desktop.mtv.corp.google.com ([2a00:79e0:2e3f:8:bc56:3202:f6e1:c119])
 (user=yabinc job=sendgmr) by 2002:a05:690c:2e08:b0:6ee:9a08:7686 with SMTP id
 00721157ae682-6eeaa3a3e90mr127907b3.4.1731968744961; Mon, 18 Nov 2024
 14:25:44 -0800 (PST)
Date: Mon, 18 Nov 2024 14:25:40 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241118222540.27495-1-yabinc@google.com>
Subject: [PATCH v2] arm64: Allow CONFIG_AUTOFDO_CLANG to be selected
From: Yabin Cui <yabinc@google.com>
To: Rong Xu <xur@google.com>, Han Shen <shenhan@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Kees Cook <kees@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Cc: Yabin Cui <yabinc@google.com>
Content-Type: text/plain; charset="UTF-8"

Select ARCH_SUPPORTS_AUTOFDO_CLANG to allow AUTOFDO_CLANG to be
selected.

On ARM64, ETM traces can be recorded and converted to AutoFDO profiles.
Experiments on Android show 4% improvement in cold app startup time
and 13% improvement in binder benchmarks.

Signed-off-by: Yabin Cui <yabinc@google.com>
---

Change-Logs in V2:

1. Use "For ARM platforms with ETM trace" in autofdo.rst.
2. Create an issue and a change to use extbinary format in instructions:
   https://github.com/Linaro/OpenCSD/issues/65
   https://android-review.googlesource.com/c/platform/system/extras/+/3362107

 Documentation/dev-tools/autofdo.rst | 18 +++++++++++++++++-
 arch/arm64/Kconfig                  |  1 +
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/Documentation/dev-tools/autofdo.rst b/Documentation/dev-tools/autofdo.rst
index 1f0a451e9ccd..a890e84a2fdd 100644
--- a/Documentation/dev-tools/autofdo.rst
+++ b/Documentation/dev-tools/autofdo.rst
@@ -55,7 +55,7 @@ process consists of the following steps:
    workload to gather execution frequency data. This data is
    collected using hardware sampling, via perf. AutoFDO is most
    effective on platforms supporting advanced PMU features like
-   LBR on Intel machines.
+   LBR on Intel machines, ETM traces on ARM machines.
 
 #. AutoFDO profile generation: Perf output file is converted to
    the AutoFDO profile via offline tools.
@@ -141,6 +141,22 @@ Here is an example workflow for AutoFDO kernel:
 
       $ perf record --pfm-events RETIRED_TAKEN_BRANCH_INSTRUCTIONS:k -a -N -b -c <count> -o <perf_file> -- <loadtest>
 
+   - For ARM platforms with ETM trace:
+
+     Follow the instructions in the `Linaro OpenCSD document
+     https://github.com/Linaro/OpenCSD/blob/master/decoder/tests/auto-fdo/autofdo.md`_
+     to record ETM traces for AutoFDO::
+
+      $ perf record -e cs_etm/@tmc_etr0/k -a -o <etm_perf_file> -- <loadtest>
+      $ perf inject -i <etm_perf_file> -o <perf_file> --itrace=i500009il
+
+     For ARM platforms running Android, follow the instructions in the
+     `Android simpleperf document
+     <https://android.googlesource.com/platform/system/extras/+/main/simpleperf/doc/collect_etm_data_for_autofdo.md>`_
+     to record ETM traces for AutoFDO::
+
+      $ simpleperf record -e cs-etm:k -a -o <perf_file> -- <loadtest>
+
 4) (Optional) Download the raw perf file to the host machine.
 
 5) To generate an AutoFDO profile, two offline tools are available:
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index fd9df6dcc593..c3814df5e391 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -103,6 +103,7 @@ config ARM64
 	select ARCH_SUPPORTS_PER_VMA_LOCK
 	select ARCH_SUPPORTS_HUGE_PFNMAP if TRANSPARENT_HUGEPAGE
 	select ARCH_SUPPORTS_RT
+	select ARCH_SUPPORTS_AUTOFDO_CLANG
 	select ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH
 	select ARCH_WANT_COMPAT_IPC_PARSE_VERSION if COMPAT
 	select ARCH_WANT_DEFAULT_BPF_JIT
-- 
2.47.0.338.g60cca15819-goog

