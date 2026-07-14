Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0818E3CF96B
	for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 18:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784053394; cv=none; b=o3cV8wa5ArpAPgJaUzRNL362ihKgXfEhhhgZO3jW7B6PjXBdMriNVjz56YT1L2s/HAB2D6WYWZ2dXhYKOpWydxOyL/PH2BZckgEF/SA4CFDldBAz6cPuvMrWR1pnhk3EtdLfp4IzI/AVYrOsPi4FZZiVYr+SSrYgVh3TmXhzzJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784053394; c=relaxed/simple;
	bh=PlLf3uatOB4V7qqPGolTM2wzfx6QOLYYVgfstlgW/F4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WhR8R1uo2rZYtipYVD6Yi5LlkXkn5S662/g+dwPF5pXnXjbU1WkjLhbQUVnMdRXyN+RvdjQdFOXSnN0lFg8kAW9vABLdL0yICKKKHza7/iU997DVJpzxJjzsNAtISPTTBgusvKRlT2jXXezVdLtFq61yL8GT1XfC0WNcOuC5JOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qtxUn+nj; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qtxUn+nj"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-51c04bf4711so42655871cf.2
        for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 11:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784053391; x=1784658191; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/HcjDBHsn65ZCZzOohF40VNQnTu2vZZX71z4vh7Fe7A=;
        b=qtxUn+nj2yOaLXO2zhqCCEQWZOcuK2JwB81wvo5O9JN/UkLt2LrJ5W256pSWcbnBJ7
         uuMGNjFYVbHUM9xe4CRaJiXjDwpF6rz5R1QjXPvnUsDcFa3zDhzPaHMH/20h8R94hRxI
         2q2u3868r17JVddrGy9Vht2HRenX/AZj8kpAW3GXJVDkG+zlWSkvA4/ldKtm103PxlnV
         6KaPj5WZuO9uFUdCKndgqLMDdaGH4GjhufT0hdEJ5b60+vWRj/jh/1hVQzypv8V2D69Q
         9/g3FqGjODqs3X4UkD3dJJk1Gb9PYGLWDLuDw7OvsuNQnupk28RB0UfiG/JopIBHzFkp
         YrVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784053391; x=1784658191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/HcjDBHsn65ZCZzOohF40VNQnTu2vZZX71z4vh7Fe7A=;
        b=J0+aYV+5BvlyXGcXMm0fTJ1pTBuOJvnA4k2G5d0Tl0x3MAJ0HdHHEnQv0rNOiWn9aH
         jAPxqu2N6ubjhP63OCS7yJ51tmbRuzUb9NrVLyZGl+IIu8rsm+NGYEY6hDsqHZxWFflf
         RybGq5Ghc6KYJHukFv/G5/x8falu2f15kKjstCM/qk5f2RHTk9Jhn04X8vFsNbG7b06y
         x3I+QfRwctlltNL6YqTElV0qntUnnRaZmQYliqrQW7/NkEk2eL1w3oS0weBW9xz+KjZr
         nkR8lJhk8zrTo2kqJlCBoxEANiT3FHIUZ6fLuCqfUIUdvIL6rRc+i31ALBZKQ9CxSZIb
         N+XA==
X-Forwarded-Encrypted: i=1; AHgh+Rp53xyLsssmqHk8IyHq8DssnN0Vv9ptmJny2mZzTl01Q7V/8B3r/2jgcB0orIDGfuHnYDh0IYwRElI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ3lxfwrOoL/uY1K3GvhDe99DibjSRhXqWKAy9lTO6Ab92ee4v
	gjI2U4+svj3XByUwOHWgcezqMZ+8aXFo5oPodDsHL/vCQUQVpY7dOqwP
X-Gm-Gg: AfdE7clBO51u4t6LhE28NHwaHEbV2vtKX9eaVJCzwR4uFfuz8oBmWRKz/e8ZeINNaxg
	sl9JlRZzg8LBUKtX6w1HN79TYb5RMKXKv+rCMx7+dbV95F+bkJtIAWSiXOtsdzCS6rqj2UgqUFi
	Q3/JdQv1yBpo3qgBqvawkkhRrHxPwCdeHwAqYz4i+0HYhxjNxbBH3PFEnfEZJq7+nYINCd6yMkO
	QWHWruqVqq7lonLayhFytBzNzmqWRtSgdhV81pJGQjAx06pAqyy5m6SlpcXE28L+XvMvS9eLJCd
	DznWDilMqaAPECzvVOCmfrW9QHzX92OsF31caswNfg2V9Ud56q9VXZmplJOsSekWiRq8A7J8TYY
	h6Mb+d++yXk6pKqrLiJVpMiC3dH4EB09egDRHKuCnxWAsc7CKUXlHGe8eHqXSW45pycxt6SWsxu
	/bu2L4xcMBDWByNHoXtdptps2/hz552fVpNLNOOPMKtQVc/2/ATyo=
X-Received: by 2002:ac8:5cd4:0:b0:51c:7b12:5fce with SMTP id d75a77b69052e-51cbf311623mr144967821cf.74.1784053390733;
        Tue, 14 Jul 2026 11:23:10 -0700 (PDT)
Received: from localhost ([48.45.163.146])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51caab6ed34sm116210141cf.4.2026.07.14.11.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 11:23:10 -0700 (PDT)
From: Jinchao Wang <wangjinchao600@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	x86@kernel.org,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	David Hildenbrand <david@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Matthew Wilcox <willy@infradead.org>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-trace-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Jinchao Wang <wangjinchao600@gmail.com>
Subject: [RFC PATCH 01/13] arch: add HAVE_REINSTALL_HW_BREAKPOINT
Date: Wed, 15 Jul 2026 02:22:31 +0800
Message-ID: <20260714182243.10687-2-wangjinchao600@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260714182243.10687-1-wangjinchao600@gmail.com>
References: <20260714182243.10687-1-wangjinchao600@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some architectures can update the address, length or type of an
installed hardware breakpoint in place, without releasing and
re-reserving its slot. Add an opt-in Kconfig symbol so generic code
can offer such an operation on architectures that implement
arch_reinstall_hw_breakpoint().

This is a prerequisite for KWatch, which re-points preallocated
per-CPU breakpoints from atomic context, where the register/release
path (which may sleep and rebalances slot constraints) cannot be
used.

Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
---
 arch/Kconfig | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/Kconfig b/arch/Kconfig
index fa7507ac8e13..41b3784e0ddd 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -457,6 +457,16 @@ config HAVE_MIXED_BREAKPOINTS_REGS
 	  Select this option if your arch implements breakpoints under the
 	  latter fashion.
 
+config HAVE_REINSTALL_HW_BREAKPOINT
+	bool
+	depends on HAVE_HW_BREAKPOINT
+	help
+	  Depending on the arch implementation of hardware breakpoints,
+	  some of them are able to update the breakpoint configuration
+	  without release and reserve the hardware breakpoint register.
+	  What configuration is able to update depends on hardware and
+	  software implementation.
+
 config HAVE_USER_RETURN_NOTIFIER
 	bool
 
-- 
2.53.0

