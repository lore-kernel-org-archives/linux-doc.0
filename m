Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F7F3D1CA2;
	Tue,  3 Feb 2026 17:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770138104; cv=none; b=afb1k5o3qO0T6sOVNmacb8WEHHIsW5EtJYBXRfYRXifU2LXb//UJv0LrF2hR88yk25a1Qv7QwuNzC6u16SuG17zNKquI9tF+R+GKUFeQrdRqah9Oy9wDzC1Lq3kOgHxwyfmdDolK3aMaMbCJbC7Xl/O+yAOHh0E971EBNzRRgbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770138104; c=relaxed/simple;
	bh=YSMWlAaU4G2FlU+BAt3H42AFroY02eoeprN0wTt0LXA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=d457PXqrdHKLG4npDCZrl8up/FFKs6YP7hWWhCzNBIeg33vCCa0nN1ZYX7syXVbXIFqPArZx8b8+zTWwqrSE+U8uK3WtuIHuY3rdFucDgNEo1p1ayZ5BYB1sQLRYLYhMDSEmtP/wPJ1Mm57VpV2i8kRgD0g4UAaa7KhsQI49Y1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=none smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=Evy2tldH; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="Evy2tldH"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=OlEZyx4aVLzRvJt+fPFaBQrAn6cf5meuhES7fKpb0S8=; b=Evy2tldHRh4AMQ1J6PGwR22hWc
	2VaZUQPP/GdTDBDlTXYSQzbRZ3r3D5QitneeOPkr2KaPvNn0x+lQY2Nx3kaOOkE6Obdgfvjm6hdvb
	LgUhcYf+7/4YBxe3nkUZ3lf4gW9rHphnJA1LyI7+cU+LoWxbp/nrDc96dynQr7fKiSuOqQAvhBwYk
	dV+MGsK/z2w+qnt+0orQCOf0rB5BAo0Dicl3un/tWfCZn6sSGIzA+B1Y20KRGFM5nFtrg4N3v5LHA
	QOZfMhd5S2VqeBlYQlbvw6K2CVMJr41V0E2qZYyNfMcbJEqkAkZma3r+ja225hfUdJM4MLo109jJk
	W0fAOd4A==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <leitao@debian.org>)
	id 1vnJmQ-004yKe-Ua; Tue, 03 Feb 2026 17:01:35 +0000
From: Breno Leitao <leitao@debian.org>
Date: Tue, 03 Feb 2026 09:01:17 -0800
Subject: [PATCH] workqueue: add CONFIG_BOOTPARAM_WQ_STALL_PANIC option
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260203-workqueue-v1-1-ccf163b83187@debian.org>
X-B4-Tracking: v=1; b=H4sIAN0pgmkC/yXMTQ6CMBAG0KtMvjVN6kAw9iqEBbSDjib8tBRNC
 Hc36PJt3o4kUSXB0Y4omyadRji6FAT/6Ma7GA1wBLZcW7aleU/xtWTJYsKt6q881Bw6j4IwRxn
 087ua9u+U+6f49QxwHF8wEgVDbQAAAA==
X-Change-ID: 20260203-workqueue-d94b72f62dac
To: Jonathan Corbet <corbet@lwn.net>, Tejun Heo <tj@kernel.org>, 
 Lai Jiangshan <jiangshanlai@gmail.com>, 
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 lirongqing@baidu.com, rneu@meta.com, kernel-team@meta.com, 
 Breno Leitao <leitao@debian.org>
X-Mailer: b4 0.15-dev-f4305
X-Developer-Signature: v=1; a=openpgp-sha256; l=3741; i=leitao@debian.org;
 h=from:subject:message-id; bh=YSMWlAaU4G2FlU+BAt3H42AFroY02eoeprN0wTt0LXA=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBpginqiDbG8rN0G34bSmJJDgw/Ul8hk5MzweeVF
 cMufgZeLAiJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaYIp6gAKCRA1o5Of/Hh3
 bTpDD/0UESqBmnm8PlOKccu29Thr4B7+wIBaOx5SZaL61gwRSqCAglD8F7+XNMU5nN6VGbqfVyM
 FLY5d/wz12nHNsjptArcA1YxdafcbkvNmdM5LALlUBXHDCHFyb2h1vQtgb8ED+3srTtHCKxqxCg
 KN4qWdGw8J6p5NvGdFv4w7uAGoOvjIdnvNgqPXbwZGDQ0pk9ipyYS99nHfECcEQweH6ltD7p22t
 0j36ajMO21J00l6eTzVNgWd7MYiYTWvvEmw0yvVQa4PXXxu0e20OyBVbnASxkuW1vURaaOMuj0M
 xNmz1O1q61kxDzUawrRzAQoPvx2p+pmPJeb+13HO+nYeudlLewbdNm2iap/CTMttQXL+Dc5YAfU
 KXoVYX+Z7vY6IdwOZeBS7Y+ENR0YqDIId+2UhLDogIohHMhqcVJR9FtUz3tVGSVXMDrG8RURyDn
 M1mGrsgeo5gixQoM6fywzMu33kY5QD4OpQs3ZFgjcX7cJCgWQvCC51NfUP5oco4jxKciFVeeoaz
 xCKaGYqlfWG3CljfzIVZQbXK0Qx7skr/uvtPnm+yNixgVdKSP40NUYwpIWiePNRtSz3Pmu3uWet
 KmT3zYd1kpcbzZnfqKcfnpSSNrzX5g3ZhOimdsQk70g8BV2Z8qVBrB0hFUjIjbWUmoGQcSZp8Gv
 zZ53MNkenKwoawA==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

Add a kernel config option to set the default value of
workqueue.panic_on_stall, similar to CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC,
CONFIG_BOOTPARAM_HARDLOCKUP_PANIC and CONFIG_BOOTPARAM_HUNG_TASK_PANIC.

This allows setting the number of workqueue stalls before triggering
a kernel panic at build time, which is useful for high-availability
systems that need consistent panic-on-stall, in other words, those
servers which run with CONFIG_BOOTPARAM_*_PANIC=y already.

The default remains 0 (disabled). Setting it to 1 will panic on the
first stall, and higher values will panic after that many stall
warnings. The value can still be overridden at runtime via the
workqueue.panic_on_stall boot parameter or sysfs.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 Documentation/admin-guide/kernel-parameters.txt |  3 ++-
 kernel/workqueue.c                              |  2 +-
 lib/Kconfig.debug                               | 23 +++++++++++++++++++++++
 3 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 1058f2a6d6a8c..85a6d0e410213 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -8371,7 +8371,8 @@ Kernel parameters
 			CONFIG_WQ_WATCHDOG. It sets the number times of the
 			stall to trigger panic.
 
-			The default is 0, which disables the panic on stall.
+			The default is set by CONFIG_BOOTPARAM_WQ_STALL_PANIC,
+			which is 0 (disabled) if not configured.
 
 	workqueue.cpu_intensive_thresh_us=
 			Per-cpu work items which run for longer than this
diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index 253311af47c6d..606f933665767 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -7505,7 +7505,7 @@ static struct timer_list wq_watchdog_timer;
 static unsigned long wq_watchdog_touched = INITIAL_JIFFIES;
 static DEFINE_PER_CPU(unsigned long, wq_watchdog_touched_cpu) = INITIAL_JIFFIES;
 
-static unsigned int wq_panic_on_stall;
+static unsigned int wq_panic_on_stall = CONFIG_BOOTPARAM_WQ_STALL_PANIC;
 module_param_named(panic_on_stall, wq_panic_on_stall, uint, 0644);
 
 /*
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index ba36939fda79b..ce25a8faf6e9e 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -1297,6 +1297,29 @@ config WQ_WATCHDOG
 	  state.  This can be configured through kernel parameter
 	  "workqueue.watchdog_thresh" and its sysfs counterpart.
 
+config BOOTPARAM_WQ_STALL_PANIC
+	int "Panic on Nth workqueue stall"
+	default 0
+	range 0 100
+	depends on WQ_WATCHDOG
+	help
+	  Set the number of workqueue stalls to trigger a kernel panic.
+	  A workqueue stall occurs when a worker pool doesn't make forward
+	  progress on a pending work item for over 30 seconds (configurable
+	  using the workqueue.watchdog_thresh parameter).
+
+	  If n = 0, the kernel will not panic on stall. If n > 0, the kernel
+	  will panic after n stall warnings.
+
+	  The panic can be used in combination with panic_timeout,
+	  to cause the system to reboot automatically after a
+	  stall has been detected. This feature is useful for
+	  high-availability systems that have uptime guarantees and
+	  where a stall must be resolved ASAP.
+
+	  This setting can be overridden at runtime via the
+	  workqueue.panic_on_stall kernel parameter.
+
 config WQ_CPU_INTENSIVE_REPORT
 	bool "Report per-cpu work items which hog CPU for too long"
 	depends on DEBUG_KERNEL

---
base-commit: 6bd9ed02871f22beb0e50690b0c3caf457104f7c
change-id: 20260203-workqueue-d94b72f62dac

Best regards,
--  
Breno Leitao <leitao@debian.org>

