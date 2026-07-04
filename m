Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ABFD1F3B8A
	for <linux-doc@vger.kernel.org>; Sat,  4 Jul 2026 01:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783130355; cv=none; b=KIK5s8/3/OjHwN6vY0Q2HmnVE7Qx7bssZTFjevv/2N9pfKL9JQRD3LfmnQjav7zyy1B68xT1LtxdHEx5jb7HJdqHD/8Elwa1kJcuq1cly0y/mFkPPHYeUbLpTHtUriT8k4/pSqc9xP51atfos5lJIbx8pX69Wl1trVVI8czh3Mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783130355; c=relaxed/simple;
	bh=lkMf6Q9+mb/bVqXmwUoV+DS2uLOMHf5NrZ61KPmI+mM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Vy3eG7xHo09XUuZzr7zK7NzkKmb4BmLOlalNPRK/Ao3YCpNbB7sBZYdFPgtuQH9W+4mf+eRGaE1Zv+ec9PikqypDLrl5L07BnxadvDjdUYjM467FjIDC5PyaRxmIucH1/v9VU4pWYELT4iksKdrKZxWWDBuFeLhvcfbIMmrK7N4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=j8DR21ar; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="j8DR21ar"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-8f2509d6becso12149076d6.2
        for <linux-doc@vger.kernel.org>; Fri, 03 Jul 2026 18:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1783130351; x=1783735151; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3BT1mee9DxiTDK8I6m/0XO6Fu6pZNrDjaCXOr3qDTyw=;
        b=j8DR21ariEssIt6aberdJTVu3SXuQoyv7jvvP2a4p8QEI9G+Tk4rg/9VHpCztFSk97
         KUAWgcdrhIMZYuqATYz0YaE47SBHNLETdlhgbkCDOBmm1IFJaKiVzlqJN4QjkMdZt4SS
         gXJWLxDbM/aw/c6UCm89hX0HlW+T/rZ3I/miiQ+7l3GOkpC8Ta07SaibABRYy+c9XXkw
         OHube5mR2evec9hFXsxz8Po8IW4uFmYPxe02fjdU2YPCGzAcnh/gHOD7EuQqqRGMVvLW
         CKCrRiUGFOFLL8rnvBAjFN5xLbyqAX/SSicfTAOMc/OX8dXt/S2raFzTOGYWr/js74cR
         Ko7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783130351; x=1783735151;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3BT1mee9DxiTDK8I6m/0XO6Fu6pZNrDjaCXOr3qDTyw=;
        b=VY6OYZ0kDljy5EW7Ty5rIhy0coKa8xdWhalAf/IvuNwVQQ8UVLBudhmEmUaJFllF6o
         z4sp0m6ZQfjzIdLlwKT7XmJu9PnwRFhlA/n98yTUV6SV2XJ7RTUolSlbqF3X5PMfJnjs
         90cDPk1eIT5BYFSH4MLNyUVqejwAqXFIiCl+OUxWER4zA8pwBgWLvDhl4T9SAEyZDsCD
         c/vP2DQjYTpOSgJyGYwZzUhROzyCfrTn4W3UKSmgxNT2vbfx8O1j+3alJBokrEVJAVQo
         OBt1/6mM0koEpuaKGkkueflZuZmia0zEzvnzXZfa4pYgxuunLDv6JNDSh/oX6Kyh8j0d
         J03w==
X-Gm-Message-State: AOJu0YzRzvVP15zbBou1bWp4z6xbI0M9uGPRn8PSC1/sPG7a9Iten3Bj
	soB881dckziWm2KNwiUj38k66gdFBRhF3blfCRNOiONflp1CbYnLjAKhexJEmhLm8xY=
X-Gm-Gg: AfdE7ckyHQq3MOcWHHpjxYO3KDG7J2Mmex6j5JrUGTiae+hUT0xSDOvJtweLVkJi+NP
	GRKay2rbOtDkNCG/93nV6xcSW37BJLmeWUO4L1g2NgRzEGMHf4pjED+2iwpwSfPhiNe98n0CcbZ
	aMWefSGvJe79diIaOlNESa1xus+UdkrAQiaeOkQHwBgLvUkgAKWNA7RZVXqROSnmICuxcviKZGv
	wWehkEcjIlmyE1xnqXv2MmAmNRaZOvHB5GQeeZlZkiagw/MSipTNtm3akLBIbSLLOhhhmZzHuAE
	TnYQ5Xf6QG9thB0XrDH986Ak1NcrQjH7ZnUYkYE0citsIk5nFZv19tanglsMGtnu5GOFGXpvMsK
	f98X0t1NCwd6H/fIGoaqi7IR4fo9dHJBcz+MuyH3kTTvkszWMChjnUh6teM4cJd6WaOXrttqXS1
	RKiQtWyUbrg6df81xMZUBO5gdw9qdka03Mo9oSUcfeLxdQMokR2R9gLA==
X-Received: by 2002:a05:622a:1e0d:b0:51c:239:42da with SMTP id d75a77b69052e-51c4c1f0d1bmr31865881cf.15.1783130351465;
        Fri, 03 Jul 2026 18:59:11 -0700 (PDT)
Received: from fedora (50-32-2-77.vng01.dlls.pa.frontiernet.net. [50.32.2.77])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51c41e084e8sm28109311cf.28.2026.07.03.18.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 18:59:10 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	tglx@kernel.org,
	peterz@infradead.org,
	luto@kernel.org,
	akpm@linux-foundation.org,
	feng.tang@linux.alibaba.com,
	pmladek@suse.com,
	lance.yang@linux.dev,
	marc.herbert@linux.intel.com,
	kees@kernel.org,
	leitao@debian.org,
	gourry@gourry.net,
	joel.granados@kernel.org,
	lirongqing@baidu.com,
	nathan@kernel.org,
	xur@google.com,
	lukas.bulwahn@redhat.com,
	ryan.roberts@arm.com
Subject: [PATCH v2 0/2] syscall_user_dispatch: add build/runtime configs
Date: Fri,  3 Jul 2026 21:58:57 -0400
Message-ID: <20260704015859.536580-1-gourry@gourry.net>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Syscall User Dispatch is presently compiled in by default for all
architectures enabling CONFIG_GENERIC_SYSCALL, and some users may
not wish to have the feature functional at runtime.

Add CONFIG_SYSCALL_USER_DISPATCH and kernel.syscall_user_dispatch
to make it a configurable feature at both build and runtime.

CONFIG_SYSCALL_USER_DISPATCH depends on CONFIG_GENERIC_SYSCALL
but is separately configurable.

The sysctl is enabled by default, and disabling the feature while a
task has already enabled it does not cause it to become inactive in
that task's conetxt. Instead it remains active until the user attempts
to disable/re-enable via prctl or ptrace.  On the next attempt to
re-enable, the prctl/ptrace call fails gracefully.

Gregory Price (2):
  syscall_user_dispatch: Make it configurable in Kconfig
  syscall_user_dispatch: add kernel.syscall_user_dispatch sysctl

 Documentation/admin-guide/sysctl/kernel.rst | 16 ++++++++++++
 arch/Kconfig                                | 11 ++++++++
 include/linux/entry-common.h                |  6 ++---
 include/linux/syscall_user_dispatch.h       | 28 +++++++++++++++++++--
 include/linux/syscall_user_dispatch_types.h |  2 +-
 kernel/entry/Makefile                       |  3 ++-
 kernel/entry/syscall_user_dispatch.c        | 28 +++++++++++++++++++++
 7 files changed, 86 insertions(+), 8 deletions(-)

-- 
2.54.0

