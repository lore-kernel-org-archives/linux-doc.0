Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795434295;
	b=3hkw2dzuzgXbGt03xbRf66I9KBbnvS77JuUWi+wCfwkpjNdL8cUcGvzBUq+qQRtkG0o9
	 v4E2UPQMkj9AZNLwvUH+LWEST8fxzJOREuNJHFZPh9znVKTI2qrr00q/dZ0JODSvqnO7J
	 BAcRMrt6DHnyhmgsyMqmHsIhg02yMV99HMVollBhxfry8NJkhIDWIBlULY5tAggePvL4y
	 KZZdMo2EP+tt/3bCinc+jnpK8BFNqvOx4CEyDm4GaRyt9BPbANpmCgsoz8NI6++m9PY05
	 1ZgTuLp/8AL7r+oq5HEIHwEoCOhhvU/b93iw/RVKQRZXZ9ijOJoit8FDQzeITsYi2oA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795434295;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wao1lDLNbUFd8H98o11hNOXj6BtvvuLII7zQ8aDHCoA=;
	b=fBFE4eNsLrJnew9L2f69szWLJdBRpLW8JAnWVbLaktViXAhHaniXXuHflesyAa854wsA
	 45eyNrhKcjxQfv6FG/dT0ctjfoOSKR6d8Az3HEnic9zFeRxAfVG/RlURm+GJmUbuXblBC
	 yfXhbgoREUS0DNbOyiFd0HKB1KuRwnvxL339UF+e1UofJci3RzLVan1iOs9XnJ5eYX7tK
	 j0Jcx4E9IcBUbA4Ue6dh6BlcbtZzLJOw+xZgouDUe9ZZ7ojPKgjjppiXOsTCxk/vzUpcr
	 ceJQhZr4KalYUNBwPu5cQSx9wa6+1mPvFdLgADc6XGkqy8p3Z7aO7zXKm9RgXbgr/gQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=armoriq.io;
	spf=pass smtp.mailfrom=armoriq.io;
	dkim=pass header.d=armoriq-io.20260707.gappssmtp.com header.i=@armoriq-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="uX/T6Jvp";
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D1D7606A31A
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 11:44:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D1D7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=armoriq.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=armoriq.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=armoriq-io.20260707.gappssmtp.com header.i=@armoriq-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=uX/T6Jvp
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso6909477eec.0
        for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 03:44:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=armoriq-io.20260707.gappssmtp.com; s=20260707; t=1795434294; x=1796039094; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wao1lDLNbUFd8H98o11hNOXj6BtvvuLII7zQ8aDHCoA=;
        b=uX/T6Jvpgqm1tJlOq8nd1n3yBngZOJJsWljAE8ngjJ67WjO4XcppJpZfI9LcuZjO77
         QMzuIZtP23iIDtYgHN4p9h1zhO1JKDoGN4t6lsyrSG9EDI3t8GTLyjWGhV1PTfVHB+54
         CUxMOF/uoHWZ6c+JuONYE2YtLDmoxCSwGiCsTZq8ENXKvGGBaYamhtETB4BBmyA2qkRz
         p6drrH4nAoZe+ndXq4r9t4H7kpC7P/4t4v7uWGf66RqWNJtsK7aEDadnMhewlwC3KNS5
         YPnUzwofxCDqc3rgq7ybcAhFbhK0oF16fThefr54y7ipHGq+t3sdDMOYzVAaj3L2BDlS
         hzOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795434294; x=1796039094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wao1lDLNbUFd8H98o11hNOXj6BtvvuLII7zQ8aDHCoA=;
        b=xEFEpz1FdL/5Y+T+kS99HSP8dwhuhaz7tvllltxg8LnL4ZpdeiMl7Lbhw/7xvsjPv9
         YYZB8kRgCnVKxyQff7xsLnft5Z8udvCEzus++efizQhZsYh/+d6zjER7G07Zhc3uPu5h
         VQnCYeCQCtb7eFfNNPRkSPrIjaXJzft6iTXSsI1brXjPGVA1Iv6Nrlzp6HWOAVSNsdY7
         UaV6LojYDSurHboAMPDobixDI1qyCyONDAUyr+HagRHR63BogilWh1qYBW9zgdGoIr5m
         OTgMPXHX2a5hcOICgPGdFZLBkfiTZoEoY8cnRp3RTgEym/oeXjE7d1432BGjRDg7G60w
         eTnQ==
X-Forwarded-Encrypted: i=1; AL+hErHkgugjl6OzBStrq26Jyc7XnWc22orI7IM44xMDeVnCF19NjdoYL604CPpuj1qD6FRyU5N9MSVnDFg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9zsNzs54W3TkStWHhYS6CKhqzWXWuJJbBjzr575qPbMmTRXUrn
	W0Ja/PsAHMZ1h0EqYEeR98JHIju8+Jz+yXkKGgEK3EuxC0BlYfDOaHb30uRrp4ZykwzC
X-Gm-Gg: AZFdTZf2tWUxKSdtYz1dF8dIrXjavTnozhjsPlQHhudDAu9Ptk/tepDCt4au7noNgkL
	Nge77XVajIIHUHX0DD43w57yLCX96HZbOlJ0Qe854AFVvXdQqzo0R1w3fMBrOQDD09FO2y48lSn
	baJz87xgg3Njlc8GzSQaz6LuBsO3oraar+RblPVl+5GPleOV8c6mLo3+rPo3GIoS3kkVg47WvxB
	JH2OXnPMBYCrEM7FlmKNFK8oEsDdmBEx/9D7QMVd2vIFpW24WYuwH0Hu04N0DuapoS2UyXPQQ5V
	oKrV+mFiBP7YsP/3ZSNF1WZjEdHPY3UoXZ8jyvngaT3Wi5EwXgMtx1f0tAM+YrgWHrNelPRwTS4
	CP1XnuDR+pae/Dr5KyzZ8llmk8wEQCnq+YxAgd2PVyNFBPk7kwo+dFq4PlT/AyKUy50y7ZnkzTo
	h4pFTTdqeF58fE4TSoDDLR1Hw+Q+tR3mViDr/t3Dg6Mfd8/xsaiQjTUbaJOe0mkIX072OKJKMj9
	Kf2tUkA8hHmsqplnI7G6t1CvCW4mhqe6cwF78IQGOQZV9o8GuI8TgYI6IA/JzPB4T5DOeWQ9iSg
	Px/Ov7+ne/BJM4tvAExDTo2sHn+YrkfVFsvDW4W+L6a1ipswpUR0hbPrS39GHj5qWqGFAEWmJCN
	P26GpPYYuBIXu6Z026GKKNP+E/ZA5yYC6uGEej3SOqYRxw9vvQFFejg==
X-Received: by 2002:a05:7300:f797:b0:386:95e7:848c with SMTP id 5a478bee46e88-38695e79009mr9525592eec.7.1795434294209;
        Mon, 23 Nov 2026 03:44:54 -0800 (PST)
Received: from localhost.localdomain ([2409:40f4:14e:94e0:654e:d7ff:13d2:447d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd40c5sm41943583eec.10.2026.11.23.03.44.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 03:44:53 -0800 (PST)
From: "HARIHARA SUDHAN. R" <harisudhan@armoriq.io>
To: bpf@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-security-module@vger.kernel.org
Cc: "HARIHARA SUDHAN. R" <harisudhan@armoriq.io>,
	"Liam R. Howlett" <liam@infradead.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ben Segall <bsegall@google.com>,
	David Hildenbrand <david@kernel.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ingo Molnar <mingo@redhat.com>,
	James Morris <jmorris@namei.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Juri Lelli <juri.lelli@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Kees Cook <kees@kernel.org>,
	Ketan Bhardwaj <ketan@armoriq.io>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Mel Gorman <mgorman@suse.de>,
	Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Paul Moore <paul@paul-moore.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Valentin Schneider <vschneid@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Vlastimil Babka <vbabka@kernel.org>
Subject: [RFC PATCH v4 5/6] kernel: add KAP checks for unshare and setns
Date: Mon, 23 Nov 2026 17:13:07 +0530
Message-ID: <20261123114308.8103-6-harisudhan@armoriq.io>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261123114308.8103-1-harisudhan@armoriq.io>
References: <20261123114308.8103-1-harisudhan@armoriq.io>
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

Check unshare and setns against the bound task's authority. Neither
has an LSM hook, so they call KAP directly. Every namespace type is
checked, and setns checks the type of the namespace it is given.

Unbound tasks are not checked.

Assisted-by: Claude
Co-developed-by: Ketan Bhardwaj <ketan@armoriq.io>
Signed-off-by: Ketan Bhardwaj <ketan@armoriq.io>
Signed-off-by: HARIHARA SUDHAN. R <harisudhan@armoriq.io>
---
 kernel/fork.c    | 4 ++++
 kernel/nsproxy.c | 5 +++++
 2 files changed, 9 insertions(+)

diff --git a/kernel/fork.c b/kernel/fork.c
index eb198c8df..4216a2de3 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -52,6 +52,7 @@
 #include <linux/cpu.h>
 #include <linux/cgroup.h>
 #include <linux/security.h>
+#include <linux/kap.h>
 #include <linux/hugetlb.h>
 #include <linux/seccomp.h>
 #include <linux/swap.h>
@@ -3276,6 +3277,9 @@ int ksys_unshare(unsigned long unshare_flags)
 			 current->fs != current->real_fs);
 
 	err = check_unshare_flags(unshare_flags);
+	if (err)
+		goto bad_unshare_out;
+	err = kap_check_namespace_flags(unshare_flags, "unshare");
 	if (err)
 		goto bad_unshare_out;
 	/*
diff --git a/kernel/nsproxy.c b/kernel/nsproxy.c
index 3fb1595a4..d41d7f5e9 100644
--- a/kernel/nsproxy.c
+++ b/kernel/nsproxy.c
@@ -25,6 +25,7 @@
 #include <linux/proc_ns.h>
 #include <linux/file.h>
 #include <linux/syscalls.h>
+#include <linux/kap.h>
 #include <linux/cgroup.h>
 #include <linux/perf_event.h>
 #include <linux/nstree.h>
@@ -589,6 +590,10 @@ SYSCALL_DEFINE2(setns, int, fd, int, flags)
 	if (err)
 		goto out;
 
+	err = kap_check_namespace_flags(flags, "setns");
+	if (err)
+		goto out;
+
 	err = prepare_nsset(flags, &nsset);
 	if (err)
 		goto out;
-- 
2.43.0

