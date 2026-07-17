Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8693FBB7E
	for <linux-doc@vger.kernel.org>; Fri, 17 Jul 2026 13:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784293366; cv=none; b=uplF6ZEJasOSSE6v1zNUT9q7557K4lx+Ox2SVT2C4dX969t4HZQ27QwenCqT4cQk6G6f2oq8zqoZQupY6+Fb2keKFUcuzkgl1PHM5cTtGqOLZmWBUVdrF99ab2POfQrn0Eg5Z9N5/0W41oHp5JKgB91NMk7eqZcZM8+otId9Y8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784293366; c=relaxed/simple;
	bh=PlLf3uatOB4V7qqPGolTM2wzfx6QOLYYVgfstlgW/F4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YsPkKygnphyQeou5YWi1+oo/bN6OrT8ZnAbByd6Mj2F9XIkVV/y9dIe3IJPfh7uTQQmpfyabvM1JskbJpszsUzxeKKH+/LMb1YvtETZX+WP3D7mujmMPTUJQc02O2UzkRq1KzlSBbGP6Q0y5ibbslDTWZUk3KSMThxWEffSwCL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pV8RY9KL; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pV8RY9KL"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2cc61541f8cso15831965ad.0
        for <linux-doc@vger.kernel.org>; Fri, 17 Jul 2026 06:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784293365; x=1784898165; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/HcjDBHsn65ZCZzOohF40VNQnTu2vZZX71z4vh7Fe7A=;
        b=pV8RY9KL5NRyhBdnkl8IhflMe9EB9vB18xcJdNOZOzs5/28McoDBlIreED8PiraNl3
         icWwx+gQYviKkZd21TqwHoP+bSrbsb3vuXqR1qssn/T5DfmSHm5V5LOQl4SFRj4SxuoU
         88+KfXf//S88mNSOGQW462CKES+QGc4kBiWNjLBpUhVZk5oRs8NBGAmFyQJvqoUF7puR
         J298s1Xg/px1lAHTjezol7Blq9gng0HEFsxox/x+m6ptq/OAY0sfEWcFLJ3kLEjDrEtU
         QJVV8m1mKlUwuOVD7RGoQ7dJC7ruqNXR9Da+eOjHvH4nCvffbaiacf5LCdEc8v4CTNhP
         GMPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784293365; x=1784898165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/HcjDBHsn65ZCZzOohF40VNQnTu2vZZX71z4vh7Fe7A=;
        b=UcgOgq9KKFQ1WTu2AnwLdzCZ46dLS9DjrMlcE1pAwuxmk/ZReWUZBBcpESC2mX1VmM
         Zi5UJ9xmlsuj6YUIiA7X0q7qzZDQQa8KsLP0/351OIW+RHILCELG6veHM9+iv0nF6UWb
         soVX12ksrWf5eejsGo2hE9+63sRwEnRLsDAFdlPJXzDBZRPi4V0t11YeGFYPio7Ca5YS
         Z0pMfnlEeJvF/gGOq87atRyRKL5iNK5kntnNN2o01sjV1fSffw5KkxMt3MQggu8dqcOH
         wD2jvcyMqxlOy7OYuXFBfsP3LnFRAZBAbFqfZZ4BBLK0q5jPHDILzp0CmyHdDdfYqPuB
         O0Eg==
X-Forwarded-Encrypted: i=1; AHgh+Rqd9N4J/Y9WryL9waq1GYCtSB7dOGLJuXWeqe7HP1BTMYq5Im+J642FYNYd124JxNFrpB+/eFkfASM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgeCtc2I1C7rcGp5/xLof7fPea7auw5FTkkTvyh7pFCPz/0pKI
	PbETOASGs4J0aWIRNJna4nwZI2imn1J00DexpnVr8D1c6JWnJdCL4VtVhKiL7Xh55+otkw==
X-Gm-Gg: AfdE7clsXuc9ldIUTOIa5ujriNIVozTQLcl+VkmUDwGtzQ/JYNy11X+HBf1gSdV/Jaz
	z3kvlVYiLrC3+nBslWusDGC/ewLA/gPJBQ6HjNuogk4LgWSryepNns3p5OjxB3gEeX8AKBfets7
	AAgC8sXSv5Wbgg4SDrPNm7i0nkWIbhE+y5d/t3wdNtAMIawtE/5zBFz2QOg441YbTsTsTjkewLj
	iSZchi7Uzu2Dm8SEp1IOyzl8R4VspodzknChtJyOsaz65qZFvRU3ZNsAUIehnBSZ1v1ruZeWmoJ
	k5c+VWq5nSJ48RTuphjuDy8Ea5ykHLIoJYApoZtwIBg3+SgdH47mbaDTh7oy1hp7FPvAj7Y10cU
	tZHw10+qQP4685la/AyoT4mgb3XKmpzcWQw+pvvGXdO0DNUG3Psrrwgh5ocgwos1uYS9bLopM4N
	Nc3A==
X-Received: by 2002:a17:90b:4e85:b0:380:86d8:8162 with SMTP id 98e67ed59e1d1-38e3d299be4mr7567812a91.18.1784293364383;
        Fri, 17 Jul 2026 06:02:44 -0700 (PDT)
Received: from localhost ([144.24.58.22])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1de301sm7390369eec.24.2026.07.17.06.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 06:02:42 -0700 (PDT)
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
	Alan Stern <stern@rowland.harvard.edu>,
	Randy Dunlap <rdunlap@infradead.org>,
	Alexander Potapenko <glider@google.com>,
	Marco Elver <elver@google.com>,
	Mike Rapoport <rppt@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-trace-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Jinchao Wang <wangjinchao600@gmail.com>
Subject: [RFC PATCH v2 01/13] arch: add HAVE_REINSTALL_HW_BREAKPOINT
Date: Fri, 17 Jul 2026 09:02:27 -0400
Message-ID: <20260717130227.1901488-1-wangjinchao600@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260717125023.1895892-1-wangjinchao600@gmail.com>
References: <20260717125023.1895892-1-wangjinchao600@gmail.com>
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

