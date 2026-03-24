Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7432930EF8B
	for <linux-doc@vger.kernel.org>; Tue, 24 Mar 2026 06:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774333236; cv=none; b=XAqH6K6vDcrskMLkYJtovNBPXl8oDaUphV1CkY/9n/I28QIIfru2Wx6PlsCDla5hV2aTbiqyyKfxjaDU+EoOqx5REzTryzFqABP/tbGFjy+LENF4ffXsWphbwMmbhyrg6Wg7veEz99ax04jQF1FSnp5bxdD1js7QvMLFSdNG4wI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774333236; c=relaxed/simple;
	bh=7b1aDTSE0qRQSk30U9x92MpkGPkxm8eaUPvv8l2E0Gs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RtzrQpFFejqsejonTi7865GzzUvx43d4ldKcoYzBPRE/Ch1Ig1aefpVLltmScE53Hxoo+MvglaBmRLvVgIhv8qEYzuJI6LgLKO7RnbpJq6ULQmGEr7qkApAbp1yFwGTjH7FZTuWe2EjfAfscib2j9Nwn6E4paKRrxz8ivTDZ2Kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ets3LISb; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ets3LISb"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-35a1f549e7eso2046766a91.0
        for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2026 23:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774333234; x=1774938034; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8tWMba298e2gRxfQlq4zFMDhOWDqH8fZHMm6s7SJDP8=;
        b=Ets3LISb6w9SkWBs9LfK8gUovSeJxWTJfXngB01ZklhV2wFXtQcZlWpwB4jElnsa4h
         f3Y/2N9/FQZ05oEcsK5M7veGxekZiQPtJCwQjqd4s+WV+7LrO6tu7JD8aaz6egQZr/9e
         B6t9b2A9hcNOOVGG/K1NfxacJH6r1flfF/IqfQxEovRRlSoqM9y58tIe37ugT7vXcA70
         QfZsMW+hMO4noiJB9pb75DkKrQjt3ad9Tr9Vl8D4izT5X3zlGcgINp4wKGUFfcAirSAT
         5la3G/x/DxZBDEiTjwPGzKsK5VA+yBgKzYv6priIX1kvj1CO6/o37txqibUVQu4kIwz/
         DTaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774333234; x=1774938034;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8tWMba298e2gRxfQlq4zFMDhOWDqH8fZHMm6s7SJDP8=;
        b=G4xcWYBXvvNv8JLj67FY5rdd5/2xJSK3W+joxoNv2Vgsh6fzpPNTfkCV4d2f0B2TiQ
         GnvpZB4TZQM+3Gqr+OlyeKd3e66YcCS0O8Mu5weSup2HDjwc5ea0EKZlpATnQIj3mTT9
         H4SPtcTEhk7q/dTXeOhqak4vcqW1XcBhj4Y7kQdZZA+L2zyflDc3Gn2dBvmCtHDOA/1Z
         EM1GO0ip7rcUnTb4xfn3Nml5164pQd7xhNWxN/b2w9Q65PlykSJf45NMgu9AJNOCZGPl
         N38OxFSxnxHJT4MLY+mpb13pX/+fuf8/Z4VQZEatW/E85v94eKi5i61TiKMIaXVgJ+AC
         bsUA==
X-Forwarded-Encrypted: i=1; AJvYcCW8QCpdiRtfyi0WNGpSbiwSYpbPia0YLxJiZiJvKWPHmo6E3VJeIERTkqkQrDifOJXEfY4luHg40cU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6JdcEaDSqRrf1aSbRDwO0BQ9sDBofMEHHs4Yi61Dt+pJ0Ds6Q
	xtBOYhLlqdBq0tILsumCg/3ZdRGAR3Y/q0T+IDsYnGgjiH58DIRSb7wQ
X-Gm-Gg: ATEYQzxpHM8TXAGHBlMRnngEhcEZXfsdmZ6RrglQd1/UVIFn5jNBbhbZREOth9eGdjI
	RxDUvx253mgnBeWBRglDyya55JGnoV6Ui0LsyejKdrJlTZNpGeOEGsUamDxthYrw/tZSyaAWXXT
	DGoIiUElSXNGgySyJz6ojKKqLv156EZUmpQDsToUWvZX+pwRBWueHuUur2DSsarGfN+VrJ16onH
	m2zpqsq0tbpR5uMnOuM3eVmSZqRye4HYYgdJe3ZNNaE3knSTAs2U5ATexoSt4FkG4s/txb4uT1s
	oCfWwBWZpVZFQGfqqsOtwHwY0e4/BxhfILYJ876BRRkI76FvMAy0q/+VVrlVc9Py2paoLDxszue
	GDr0Tn2Yph2jydug9CW/ACLcQgfilc+hP/yc1BIb3yyGcgYvT0fZGj6tZd+s0s/5cgs2GCnv3Mp
	pJQdMZn9aRKePwgABVqMobZQkt6EQTkQe8vbGTQLT0Z6sn0KDTw+mP4fJGogLf1OEo3S8NLfOxQ
	GujFgJXZFEmeQ==
X-Received: by 2002:a17:90b:5107:b0:34e:63c1:4a08 with SMTP id 98e67ed59e1d1-35bd2c98e30mr11242780a91.20.1774333233828;
        Mon, 23 Mar 2026 23:20:33 -0700 (PDT)
Received: from mi-HP-ProDesk-680-G6-PCI-Microtower-PC.mioffice.cn ([43.224.245.226])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c0312f1cbsm1091367a91.4.2026.03.23.23.20.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 23:20:33 -0700 (PDT)
From: zhidao su <soolaugust@gmail.com>
X-Google-Original-From: zhidao su <suzhidao@xiaomi.com>
To: Jonathan Corbet <corbet@lwn.net>,
	workflows@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	bpf@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	zhidao su <suzhidao@xiaomi.com>
Subject: [PATCH] docs: Document pahole v1.26 requirement for KF_IMPLICIT_ARGS kfuncs
Date: Tue, 24 Mar 2026 14:20:28 +0800
Message-ID: <20260324062028.2479059-1-suzhidao@xiaomi.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since Linux 7.0, kfuncs annotated with KF_IMPLICIT_ARGS require pahole
v1.26 or later. Without it, such kfuncs have incorrect BTF prototypes in
vmlinux, causing BPF programs to fail with 'func_proto incompatible with
vmlinux' error.

This affects all sched_ext kfuncs (e.g. scx_bpf_create_dsq,
scx_bpf_dispatch) and other KF_IMPLICIT_ARGS kfuncs across the kernel.
Ubuntu 24.04 LTS ships pahole v1.25 by default, causing 23/30 sched_ext
selftests to fail on affected systems.

Document this requirement in Documentation/process/changes.rst so users
understand the failure mode and can upgrade pahole appropriately.

Signed-off-by: zhidao su <suzhidao@xiaomi.com>
---
 Documentation/process/changes.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/process/changes.rst b/Documentation/process/changes.rst
index 6b373e193548..141a4576c24d 100644
--- a/Documentation/process/changes.rst
+++ b/Documentation/process/changes.rst
@@ -145,6 +145,11 @@ Since Linux 5.2, if CONFIG_DEBUG_INFO_BTF is selected, the build system
 generates BTF (BPF Type Format) from DWARF in vmlinux, a bit later from kernel
 modules as well.  This requires pahole v1.22 or later.
 
+Since Linux 7.0, kfuncs annotated with KF_IMPLICIT_ARGS require pahole v1.26
+or later.  Without it, such kfuncs will have incorrect BTF prototypes in
+vmlinux, causing BPF programs to fail to load with a "func_proto incompatible
+with vmlinux" error.  Many sched_ext kfuncs are affected.
+
 It is found in the 'dwarves' or 'pahole' distro packages or from
 https://fedorapeople.org/~acme/dwarves/.
 
-- 
2.43.0

