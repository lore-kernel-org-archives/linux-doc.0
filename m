Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794981725;
	b=IIzwLHhe8Tuyc/Cnukxl58QVa67AZbuY0O/xyNB3gK1ejPYPyOj+7CTHuTDRyxVi5REQ
	 aOhaoB60d9fhNlAbYdHI1aLCxsyR+qclmQS2q8ESbUT8yn2KydjQQXEPnfwKxA6yt1qQK
	 SPjKRgNJYAm+NCwwl3tDXr/X3zNoHbkRdisPJ/5LZv0vuut7SNRtZXXhTMemKHcVC+H3b
	 zBYTYGDmbfF5peFgdXXbHVBwcBBXqd162owexIe/yMIj89GZiS+8VTDw0YegjZlhcV/R0
	 2KVzZRnKhAlTnaXBAM/7vEjcHWPaFQWU4vYibMhzxgNnvua/qHFS6U8vqQEiccpbQBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794981725;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=AxEJOEfcnyLje8ZmMvx2AZyT7iZftuKYAFChF/A8Hek=;
	b=G4uvW1kpVy/Qzb4ZyAbI//zPj4/6z/Vif6xoE1FZDHwRpCZSvRO++NrfFJFFRlaNcjk3
	 afkfAjm2I2hqex6GiLimneXrhnjimN/vCK4GHu+6azfL0/s/4Vq8z9VulfzcBUIi5e5NR
	 /p41Sos/P7v9RwgmtbirlpaSdm2rcmX21AmzQb5//rO5aCrxMo/WuUApVIpTA5lETYCgB
	 J3VW9PGJHxAe7gSzoaNmeLzulHoaF28FekaFEMPcQdq2+xzYyOlNPA4aS4P48UvADZYhz
	 k8Mh8EbZp+jM5MFOmDxLZ4XnAML4fM0APEz5CfRMncAxzQyjaRh5IOSz6+6EswDOcRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=OizJWoqO;
	arc=none smtp.remote-ip=209.85.215.226
Received: from mail-pg1-f226.google.com (mail-pg1-f226.google.com [209.85.215.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8D4606A325
	for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 06:02:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C8D4606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=OizJWoqO
Received: by mail-pg1-f226.google.com with SMTP id 41be03b00d2f7-cddc597d062so378796a12.3
        for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 22:02:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794981724; x=1795586524;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AxEJOEfcnyLje8ZmMvx2AZyT7iZftuKYAFChF/A8Hek=;
        b=B62F+TSjrcU4Mb9G13cZY5PPj5Lgw2bvZC6HuwHIFihmwIn/EZF8wjOSSJ4Mo/7BHU
         5XWQsKrvsaO1Istqb+0OYhgVbf/i/QReywG4HqbQTzNJgHF3Aquqcl02dK/kywqt7Lew
         cDJTg5z9SxgGmJFDV8AVufNwrrD3Dbka+RQFn6dQIjAsPGJVAMfE+4E9YkkjMsWj/1LE
         yNZXlsjnowdG3YWIEjcaTC60x7xdAthdSU9K1iqicznpdr/+Gp5Fn5p8zIi8VmTf2mJv
         zFqEhscd8nYOvN16AoZwVnq7JC8FHk2hCCpVD9hVC3UibS4HVXFICoRwSslgXVYv4+0d
         6YyA==
X-Forwarded-Encrypted: i=1; AL+hErGYgQDmRwNScImE4q5/QpLSpI0s2WntF/iyJUpmwNqc6A7B6Tka/AjbMbu2gYsIxkxwhwIP3Pyb/aA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+xquCJ6RRbLDxH19y5rZevQqvx7yw6ngPwnn0bcIoPJ2K6VcaE
	tD66+4/sz8rqOVDcNSkuMz0gZzRFtCk87/+v+EwlDWEyDOMJzm9iDl50ozPocpC3bt+bdsJzuze
	EBb2Qr98djBM1jO2Xi9R1OnqgJz6T6u1gdr7+oOhXAqiWNGzXIqkrvLaYtCQnMfA/PZa6SEraxX
	aLsMxzYWsW7Sa+M/A36790/vzKieEHi5tePTDZqdaicCKMS7Vy/CgusexM2aVc0meM/pSqCXPEf
	pZ6BKl5e4RB
X-Gm-Gg: AZFdTZe+GREtn/EATvHQTeoKa9SQzg4UdreV++ObukGp7rLbkXmozctniyf0zzXHAc1
	J1z3kit+nTL75582lpdKLEzviGXNXoWRwt5xRvWd06qzwbilKuaQynsfVvlTtcQan74qCjlvD7e
	6QghPp7YkS1t7HHWABt7EtPsqDQIqK4obhS/oBLxvFMyGeEwc53O47k9lO2PST+fvAzOi4WlYyX
	E2w3ZtEeIf6IHTiQHG6m2MWwDnaTLAvneqNgh3JfhJCh5MxE3Mo6P5Eud3tZuYsEBhddSN7VNA3
	ODNvgIwH8VhnGinUHzGQYIFh092hMS5JG13EMQrm2Xfkms8D3SyOlz5dmdVyoQ7EoMmQwGFrNGW
	VVoG6KE7RKh9dDJJwb681zjlT+wo7BlzKJAJFvykz+2jw+Ky2WijmI4FHETmTV8PDr8JDGaBMDA
	GbcqWC9LD8mak0HlAF33tKDuPd8LI2Gdz8
X-Received: by 2002:a17:90a:e7c1:b0:3b3:b0e5:57ee with SMTP id 98e67ed59e1d1-3b3d07e0c97mr1864422a91.54.1794981724466;
        Tue, 17 Nov 2026 22:02:04 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3d172c018sm644733a91.0.2026.11.17.22.01.57
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Nov 2026 22:02:04 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-542fc619afaso8252981cf.2
        for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 22:01:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794981717; x=1795586517; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AxEJOEfcnyLje8ZmMvx2AZyT7iZftuKYAFChF/A8Hek=;
        b=OizJWoqODaIb4n+f18M2B89f+yEv0LPexoIKqjSd2SAblHASna5g4d5qF837ZeRDrq
         TJQWPbIZ0J44/yC76I4P7Ls2GbVC8HfmLOma9zV9FTEN0u9xLHNH8nKk0xP4z7yIL/eU
         g651w8vsB+3sF/CFXRKf7ChGNkYJUH48G+7AE=
X-Forwarded-Encrypted: i=1; AL+hErERi7qhQ9auWPdKMkW6CfKrmPWXM8wVfQCXgpgdZdE4kLuF4+ZI5sevccW0q1p0vb4kBcdAPNxncto=@vger.kernel.org
X-Received: by 2002:ac8:6f0b:0:b0:54a:755d:6fcc with SMTP id d75a77b69052e-55d5a2c46b1mr26201581cf.4.1794981716710;
        Tue, 17 Nov 2026 22:01:56 -0800 (PST)
X-Received: by 2002:ac8:6f0b:0:b0:54a:755d:6fcc with SMTP id d75a77b69052e-55d5a2c46b1mr26201071cf.4.1794981716159;
        Tue, 17 Nov 2026 22:01:56 -0800 (PST)
Received: from vertex.localdomain (pool-173-49-113-140.phlapa.fios.verizon.net. [173.49.113.140])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d58ff0065sm14886841cf.5.2026.11.17.22.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:01:55 -0800 (PST)
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
Subject: [PATCH v4 0/4] panic, x86/vmware: Preserve crash logs before kdump
Date: Wed, 18 Nov 2026 01:01:47 -0500
Message-ID: <cover.1794980455.git.zack.rusin@broadcom.com>
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

Changes since v3:
- Call the platform list before taking the kexec lock in __crash_kexec(),
  so a callback that panics on a direct crash_kexec() can still enter
  kdump (reported by Sashiko).
- Rebase onto v7.4-rc3.

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

v3:
https://lore.kernel.org/r/cover.1794201807.git.zack.rusin@broadcom.com
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
 kernel/crash_core.c                           |   8 +
 kernel/panic.c                                |  51 ++++
 7 files changed, 346 insertions(+)


base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
