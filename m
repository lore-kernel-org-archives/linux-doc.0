Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794203275;
	b=ieRtDnT00oZCe3oytc+PCxXQ1bD93uiuN7Jv4xZVYfdnOwp1WMDH05WBBYImfGRjGH8t
	 YqNxdAdfIalUNOKKmYb6WFzoj53a5Eq169kngvfpUOJ/+wXGGvDdVH598wWHFdy0MFTdv
	 TzM3Z5RnX8gECOKTHKmQAEiHxkHlUAJCABy9kr/d4a7lO1E+hBxxeierq/+HFV077qsU1
	 9tQoX3SkMKtx9j8oWbeGWsYI8xCT9LBWKDwt8wzJITzJHjxoMWpmYfEdQNZ48SxdSFoEF
	 PnipVqFIFGe39WVdGg2yG44c2tdTqR2tEZL8yO3irnufN5n9EIQd9sxyRTbp+FxtU6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794203275;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=h/7KHZgrDOM2tA+GxXk56HAD/IPswfxy6WrliIOncNc=;
	b=py/xTfS8Issuf0fjcMl8TJQu8b03cDCnTZ9KmNWAU2ivQFyMw3FlcHuQ1IcytkuopUyG
	 zA/QINZaqDXwIRcluXHEDufDHi1vQfAwwPs1LLTEi+tyHN06ZryxWQM86CI4Yuu5jMqPW
	 qKPDRKzSa1VnYiSllLRFNJPMKK5R7pKyV1vc1oK3/jR83d4OJTvn7h9rCW5ODBa9Bri+C
	 nkokxXe4LLFLfTuRjZiChFchCaJeALOvWFjf5icNDjETaw9ZaSPlfT9y63KFea1hwdS86
	 F2XWkIRLsJQ48BNJEQOvezInbAgINi6Pk4xyM2AdXrfNHkAIX3451Yjrvgp7GNQRPnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=W+9rPuKc;
	arc=none smtp.remote-ip=209.85.215.225
Received: from mail-pg1-f225.google.com (mail-pg1-f225.google.com [209.85.215.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C30606A321
	for <linux-doc@vger.kernel.org>; Mon,  9 Nov 2026 05:47:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35C30606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=W+9rPuKc
Received: by mail-pg1-f225.google.com with SMTP id 41be03b00d2f7-cdd4dafdce9so151831a12.2
        for <linux-doc@vger.kernel.org>; Sun, 08 Nov 2026 21:47:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794203273; x=1794808073;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=h/7KHZgrDOM2tA+GxXk56HAD/IPswfxy6WrliIOncNc=;
        b=vkla0tPCTyrMNYNEjADauoAezfAKBqeJrQ++3qUPcQUGtZyQyhLbjsnBj7huVeLBcR
         /kav5vFFqjsLwwJgeBASMT0nnrZslGg3wpKu7DvMp/ZGGdWU0X8x1yp69qki+lgUodC4
         NgjlRbgg5clI+FaTKon2Zrq53IaUpuC1KeqpjuCx2Dhr5JU4MGRJHGc4WjJddgJzjFQB
         y3IpM2dR61oD64fuuWRQbZcqrJbgZGtSRngw7ZPC/SbqJEwOAwYdomwfXcZE4Q8kNKo5
         srRbRw6jc28pBLmPDsnnWexVqFspQ87cu5zEoCF3uHRbmIVvvKHC+Wn4EElOjTwZz55e
         VZkQ==
X-Forwarded-Encrypted: i=1; AL+hErH1/qLdqRTuNVCt0BNrOwF7ZxfKU7kiSsCziBxirhlNH6RQVIxJEVkGlK/ih+f9J6GJqbccBK85+5k=@vger.kernel.org
X-Gm-Message-State: APuU4Z+5C/WSDdOovh8srPotieV9+0AuALMnnd+lcWcOJVpHikwhnapx
	snnpviYOd1OxhkE/6ULvuWqNeu2FHrlQJ+0DU3cc2tW8QfwNmVL2wuaRX80gaJId9C+CznHqOp2
	wiKDf4GrTxVOSiBKaysXeA38SvGYb76gAlKbw/oF7YdK9QNK6hTg9KQK8cbWB7iPkjsNRjOSZGL
	mN4+yEXW8YZQxelPJmm5DDzxtkMbmBNfeOoJY5m5VUeTcodaaZ6kzzm4JbQa3iitv6cX2bkGY4Z
	IxMEQ0+Qmt9
X-Gm-Gg: AYBFou3cvLVzO1dlQxlpP2Ny4asG7NBQTUHX4n2FOCw8pjxxB1P95g/it398tSRO58W
	w0AKEUTiKigFRtDzeL8K3zvD4lTc10Ky9ykI0KiAKVxJ8uBOwc7akCqyqeuWxSoKDQnjZSJXf1U
	68A21mZY15X4eyiixNluaV0sFxCgdJsMv03nI6rhtyg7601rYu51Bj0pCoUsUwBk2O+ceffUqg7
	ZYYHGpIWepIOoUK4LDHWg52cIvouTe06sBRSWAP6CIoAt+Qe/uI5pKNOFava/vuayP2y4aQc1DQ
	A1mz5C1nOucnsTjcn8il/QJuZlFDrz+MpRdsoj8d0Oj49euZmQUekbuLWyP8D9MkZX77zD18ram
	pWBnZNPw1jQtQt3hYeBilvp4QPeoYSsxcoXcb79fP5TuOmigciL2FMXTtEFzJQOzokKtFpxqEOL
	UhN3cIy9Tf351NTiIp3HLKeLNQXQYD8/Cm
X-Received: by 2002:a17:90b:17cd:b0:3b0:ad59:7199 with SMTP id 98e67ed59e1d1-3b12d36c333mr2838956a91.32.1794203273482;
        Sun, 08 Nov 2026 21:47:53 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-17.dlp.protect.broadcom.com. [144.49.247.17])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b0fc23a5aasm2466242a91.0.2026.11.08.21.47.52
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 08 Nov 2026 21:47:53 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-37390b2989bso1879423eec.0
        for <linux-doc@vger.kernel.org>; Sun, 08 Nov 2026 21:47:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794203271; x=1794808071; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=h/7KHZgrDOM2tA+GxXk56HAD/IPswfxy6WrliIOncNc=;
        b=W+9rPuKcJGMZGzYOBjbdWgNueaAw2e5ot9Bf0ScHKAojAI+sy5eba4+i22mtGeF4is
         1XNCegruzNNf4jBdzbrbvfQW5ItM1OKtIAXSVWCfjaJfEaP30HVTFW5Hsk2h6hwcACm8
         8D+Z+Tm9cCtNjrO/J7SR1MwFVcBq1FS7U7nNg=
X-Forwarded-Encrypted: i=1; AL+hErHYZJKp7P26JvwhyhB7E0c/Wvzb+j4U6B/SiLnFlQ494oNPX9dm6Q4fBH2Ih3IopLNtgshPzkcS8Cc=@vger.kernel.org
X-Received: by 2002:a05:7022:1407:b0:145:287:ce91 with SMTP id a92af1059eb24-1b39fe87be0mr5170881c88.14.1794203271470;
        Sun, 08 Nov 2026 21:47:51 -0800 (PST)
X-Received: by 2002:a05:7022:1407:b0:145:287:ce91 with SMTP id a92af1059eb24-1b39fe87be0mr5170811c88.14.1794203270668;
        Sun, 08 Nov 2026 21:47:50 -0800 (PST)
Received: from vertex.localdomain (pool-173-49-113-140.phlapa.fios.verizon.net. [173.49.113.140])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b37314626dsm13745136c88.1.2026.11.08.21.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 21:47:49 -0800 (PST)
From: Zack Rusin <zack.rusin@broadcom.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Petr Mladek <pmladek@suse.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Dave Young <ruirui.yang@linux.dev>
Cc: Borislav Petkov <bp@alien8.de>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	x86@kernel.org,
	Joel Granados <joel.granados@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	virtualization@lists.linux.dev,
	bcm-kernel-feedback-list@broadcom.com,
	linux-kernel@vger.kernel.org,
	John Ogness <john.ogness@linutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Kees Cook <kees@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Bo Gan <bo.gan@broadcom.com>,
	Brennan Lamoreaux <brennan.lamoreaux@broadcom.com>,
	kexec@lists.infradead.org,
	linux-doc@vger.kernel.org,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Maaz Mombasawala <maaz.mombasawala@broadcom.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Stephen Brennan <stephen.s.brennan@oracle.com>,
	Michael Kelley <mhklinux@outlook.com>,
	Ian Forbes <ian.forbes@broadcom.com>,
	Bradley Morgan <brads@mainlining.org>
Subject: [PATCH v3 0/4] panic, x86/vmware: Preserve crash logs before kdump
Date: Mon,  9 Nov 2026 00:47:36 -0500
Message-ID: <cover.1794201807.git.zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.53.0
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

This series lets VMware guests copy the end of their kernel log to
the host's vmware.log when they crash, before entering kdump. This
preserves diagnostic information even if the guest cannot save its
own logs or the crash dump fails.

Using the existing panic notifier list for this would require
crash_kexec_post_notifiers=1, which also runs unrelated callbacks
before kdump. Following Petr's suggestion, v3 instead adds a separate
platform panic notifier list for callbacks that need to run early.
It runs before kdump and before stopping the other CPUs. It also
covers fatal oopses that enter kdump without going through panic().
The callbacks run at most once, and the list can be disabled for
debugging with disable_panic_notifiers_platform_list.
crash_kexec_post_notifiers, the existing panic notifiers and the
kmsg dumpers are unchanged.

The VMware log sender is the first user. It uses a preallocated
8 KiB buffer and limits both the transfer size and the number of
retries. Logging is enabled by default in ordinary guests; encrypted
guests must opt in through kernel.vmware_record_panic_msg. The copy
is best-effort: kdump and reboot do not depend on it succeeding.

The separate VMware guest-crash notification, which can cause the
host to terminate the VM, is a kmsg dumper registered late in boot,
so it runs after the built-in log dumpers. It is suppressed while a
crash kernel is loaded.

Changes since v2:
- Replace the pre-kdump list and postponement parameter with the
  platform list and a debugging switch to disable it.
- Run the list in vpanic() before the other CPUs are stopped,
  instead of just before the kmsg dumpers.
- Correct the sysctl documentation heading.
- Rebase onto v7.4-rc1.

Tested on x86-64 guests on VMware Workstation, ESXi (ordinary,
SEV-SNP and TDX) and QEMU/KVM.

Platform list proposal:
https://lore.kernel.org/r/ateYxCu63pRY9EGq@pathway.suse.cz

v2:
https://lore.kernel.org/r/cover.1790014793.git.zack.rusin@broadcom.com
v1:
https://lore.kernel.org/r/cover.1788414671.git.zack.rusin@broadcom.com

Zack Rusin (4):
  panic: Add a platform panic notifier list
  x86/vmware: Add a bounded panic log sender
  x86/vmware: Add the vmware_record_panic_msg sysctl
  x86/vmware: Report guest crashes after kmsg dumpers

 .../admin-guide/kernel-parameters.txt         |  12 +
 Documentation/admin-guide/sysctl/kernel.rst   |  20 ++
 arch/x86/include/asm/vmware.h                 |   2 +
 arch/x86/kernel/cpu/vmware.c                  | 250 ++++++++++++++++++
 include/linux/panic_notifier.h                |   3 +
 kernel/crash_core.c                           |   3 +
 kernel/panic.c                                |  50 ++++
 7 files changed, 340 insertions(+)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
