Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794342259;
	b=2ou/liidddUCFrRtxQvBug5OnvLq4FBy+qqJtKtw+7kmZSQkfc4V41/lxqtSzPrA6IcA
	 k2LeXLsYaCsKA9+GsOw83rWCaeSZJgDyC5ggX7NNh08v5OcZrY2dVHM9QvCHdvbAAQrNU
	 nuIIS/3W8R3fAUbdpv484lv2lYQUOBn+Eo7OHfSPfV8ps3VfIRmZeC32/0czj7ML9KFzQ
	 lPcBn4V4hLIqDhMGz8J+kI7xueW+kBNNvncs4zlf1rjsGylbQpNtW/aYNMw9DPcq1ba+M
	 uAgAYFl4ccnhphMPm3chzuOMcBvazS02Z8xE39KSg+S92+TQfp3v9RWTCxU2bGgYjwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794342259;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=U4CgF1MujLyKKs4MDsPCH+PRIQeRT4qSq6PrwqdYMBE=;
	b=UgMgqK/WkbTixyb6Nex0YXLDmNaaZ/ptxzYWjQzsEP4jAUAkCjFt4gVKij2kMYSxRlXs
	 5rGca0WRqVQ0DymbdjwC6dmn2qotkTu7XIZt1D3CFUEMe3xUqT/g53/iMc/Y2AwY0qPRJ
	 q0N3H9Y6zu5qSsIeOpNSrTsV75EHQm0z8oTgX81og+ihXL8otbEC3lXfauV5dQWLh6XkJ
	 2cW8FsFpzjhfxLuzjO0gYaBbfotZKvZKOHochQi0XTtoE8Y2puivtCnk7NY3Sc25v/5/X
	 NVieJlC0vP1ED1jzXR+S4b2gmfLRKCYZM7ZbBx7DCgacncr7P7OMcM/md2HmNhV1daA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=armoriq.io;
	spf=pass smtp.mailfrom=armoriq.io;
	dkim=pass header.d=armoriq-io.20260707.gappssmtp.com header.i=@armoriq-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=H4hDUkdU;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50590606A8B5
	for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 20:24:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50590606A8B5
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=armoriq.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=armoriq.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=armoriq-io.20260707.gappssmtp.com header.i=@armoriq-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=H4hDUkdU
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-33fb4680717so1837758eec.1
        for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 12:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=armoriq-io.20260707.gappssmtp.com; s=20260707; t=1794342257; x=1794947057; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U4CgF1MujLyKKs4MDsPCH+PRIQeRT4qSq6PrwqdYMBE=;
        b=H4hDUkdUIfu1aeYFa/L+wCqKQAJ0W4KsVOg5CzXESlt1fRutvTVtYX6HvPZVIukiIO
         9ZQslFrDJ/ij82d33lbDyU4lm3hmMo6nIxPv+EklBZBOgqEKd6WpxDDNonBK91F4NWqm
         yJmBkHqDm30KDaioG4f9vYO/ei5iwzPZrlK4OEbR1x825UVqbEO5q8dS6FPQDq4qTtAO
         EOmQzGzoF64BZh8t+lpu071QWr/0F4T5s/8zAAKXsT16PiV/fwwbfXRy/WpLSVfSw3Nk
         RTAJtZNQNuRHb40nWwdtrJO/D8Fw2pGjTRmWlT3X/bRkbsBFLpqJf++BrNFyFVsupyOs
         SIoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794342257; x=1794947057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=U4CgF1MujLyKKs4MDsPCH+PRIQeRT4qSq6PrwqdYMBE=;
        b=VvuRGG9qdse0m/Ige/F4rGjcDJsliptpJsCeXhL858/5rhpvIOc9WeynxxO24NMXaL
         Cx7Ia0F3Otz3AbMRqJmQF38IaTaxF+g4M1i0RDwja7LfGKGhSZRS683qb/z2IOprrJ5Q
         ySXDnZQdhbLzJNp9nrc1JuWeIfmkTlzOZdtiO0rN34b1Q3EegTytOK3e2RLo2Tvl16KR
         F8Rzyel860CyLDjNVkJi0pMqc/HxtBAAYbnT4DtqfCdWu5Rw73VlbvfBPccey+xnrKyh
         h9aWMtGU+hSCJPEaw5lWpMAaVYtxB2kouJnkmDurW9xlE8+1KcoPeqp/QIEXMld98LB+
         bGmg==
X-Forwarded-Encrypted: i=1; AL+hErH/CsvctikCg8V8UtSvNGPODvh2yHFJL1GHyoAQw+6nBWLEXCwpzCljbjrzXHMSjdylOZ86r24rwII=@vger.kernel.org
X-Gm-Message-State: APuU4Z/VoxcNYychkbrlqduGuyIa7/xJyjK3D3gpWA2JHUaoVrbDuTjB
	YiOTaeBV7OVjrbgMoRyXtAIDlpzpRwSuduwZwT8yxZUFlxxYtAv4SNwWKUegFC37bC37
X-Gm-Gg: AYBFou0eHf7xN8j+dnZfvsgvsvmownbfV0i+IU5Q4o2qihtIV6/fm72oP5lRCDpRC5B
	uyUWPZB6uMUdFpr+RECoOVoKsu9uuo3HEMvicWJvwvdU6Sglw9vQ6dxeOmS0XdhDhCfhFNpgW+M
	oZlPhOlQrmdZ/pitqMwXxABkBZkwGnLNmncmBLbPtcubudkX1ZVcLFrewUMECukA6mSu6BTd+UZ
	HT6zmMIBjDkT39eY6qYSSfsz9+aiVuo4OSVcosbMTkjoeXXIYGjIW/qu0w1I2sEdIKNk30ws7F8
	2vyijn0ncJFaS17B1OszGhxyXlpxaf8Vv4fJ6qxXt+MeOUHtdXrlmz/bALP3KtyJ0mHUaukEOLw
	xVH5rMW7lEMjnrldn+SOCxO0y1bLD7OAsLsF5bHMdvlMUQ2vaedPB0A9JbeY9bVsd5EOtX1jS1r
	4T7eLFz2aYqT+0yg00RDBQZs0P/cF9Cgvl9ftR8bQjvHVgvbcbVAJJWykg1lkTxMAGK419fkt3+
	n5GYjTQPWRG4BLB/JFF1FuwR1qaFXuH3jxYuPcHo7HqhnCcN8fIRfv63VreJuBWb8FGyTHt80Ql
	bzllUznt5or0OIFnISkelYz9pt5iMowpU73j3iBn5xB6O1GNNtPF083oMR42CBBj5EMjfQLANUw
	WuHD0JMobS4j2yC7UciRnY+OHBXJbFLtz+i4JrHe+yywRjpmpTnXuJQ==
X-Received: by 2002:a05:7300:b282:b0:368:2548:c08b with SMTP id 5a478bee46e88-37685896be0mr560200eec.21.1794342257246;
        Tue, 10 Nov 2026 12:24:17 -0800 (PST)
Received: from localhost.localdomain ([2409:40f4:147:2742:6545:702a:2431:7dca])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfe29fsm10076615eec.21.2026.11.10.12.24.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Nov 2026 12:24:16 -0800 (PST)
From: "HARIHARA SUDHAN. R" <harisudhan@armoriq.io>
To: linux-kernel@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	Paul Moore <paul@paul-moore.com>,
	Kees Cook <kees@kernel.org>,
	James Morris <jmorris@namei.org>,
	"Serge E . Hallyn" <serge@hallyn.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Michal Hocko <mhocko@suse.com>,
	Mel Gorman <mgorman@suse.de>,
	Suren Baghdasaryan <surenb@google.com>,
	Ben Segall <bsegall@google.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Valentin Schneider <vschneid@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Ketan Bhardwaj <ketan@armoriq.io>,
	bpf@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-mm@kvack.org,
	"HARIHARA SUDHAN . R" <harisudhan@armoriq.io>
Subject: [RFC PATCH v3 5/6] kernel: add KAP checks for unshare and setns
Date: Wed, 11 Nov 2026 01:52:45 +0530
Message-ID: <20261110202246.274-6-harisudhan@armoriq.io>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110202246.274-1-harisudhan@armoriq.io>
References: <20261110202246.274-1-harisudhan@armoriq.io>
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
index eb198c8..4216a2d 100644
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
index 3fb1595..d41d7f5 100644
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
2.53.0

