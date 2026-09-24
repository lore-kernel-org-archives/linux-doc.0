Received: from mail-dy2-f12.google.com (mail-dy2-f12.google.com [74.125.229.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A51554BE434
	for <linux-doc@vger.kernel.org>; Thu, 24 Sep 2026 20:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790282543; cv=none; b=QEZxKDKeltwuMcFuleUc+ugStS1SepRfdg+3ULkgo981TZHjQJhjXGK1yXoswwy3ki5fAc7damiexA9C2aHvOiiW244yGrLJKDxJjeOBniZETZlRhWSl32Gl3WRWswrOVhsuD6dTPLAIp6tW4TnWSt2T++VUnBMaTqeQO5vpWZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790282543; c=relaxed/simple;
	bh=sFEfDwCsqFHzU2Y+YA436nNi5yktEf0TjQJTML5xEGo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MMoTirFfKOaHMhT1H7yYiWH3oPd4bd678oEyewzzp/CL0uMgZCHunG521BJHHfLL0CHte9S8wvLDMI8HkqF1KlvvY9tu7HVTf7LyhjTWB4PJ9s02/zPT0G89LxGEK0QANP0BJRr5UPKaYMZAUP2nbKnWNDyp5qqgMAn40TCwpjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QTNMslEi; arc=none smtp.client-ip=74.125.229.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QTNMslEi"
Received: by mail-dy2-f12.google.com with SMTP id 5a478bee46e88-328664ef791so78649eec.3
        for <linux-doc@vger.kernel.org>; Thu, 24 Sep 2026 13:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790282533; x=1790887333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iCF2SZ2ebGxhM1cZHR0OwJClfn3gE8zIunp5Y9QwAvU=;
        b=QTNMslEie1/lLfjCQSxqVPA7RneS9obrsmb64kSQvYqqiXwz4jV3pkZoOwgRfY/B/S
         MRFEkRBixd0h/ri2KGWA0vlDNEfkWvo1idy7phhz/TCUKm5V9ZXsGhkVaAb48YmPi0f4
         XPjw0HMPpByfEgc0vOopD4K31Lx0v7x7iqag0gFUmJv8++PS4pPGmZNMQ9M/HeghCJ+V
         fDrlaBN0gJWhW933kgW7J/BlVJzCl+I8FyRB8xQPvwLjSVvWZeVdxTLgAIbgSD9Q/0mr
         CdLveKridtzJrPrMQfQHh/OGe+dx2DwKKc7yRpu8SRv9idNw+GpiFxHVLqJbMr+qd34Q
         JwYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790282533; x=1790887333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iCF2SZ2ebGxhM1cZHR0OwJClfn3gE8zIunp5Y9QwAvU=;
        b=kTdUpJxPSzfvYSgcJh2w4OjoqZcMAHygKZZ3daEjWsuC/Gfd/y89xl7rFZCcFjFHXd
         O/ltZ+wamZ7TVMte6Z1uoTvU2h9GVuuk3OQBNExBBzheG4VB//BBlnKMH4NkJWKTVTiK
         GKnmYkwGj/61apuL+qD2NQ7W1talH8G/ioXUgtO93rTvwnHC9SB4LCvIqKRdte1e+HIW
         s7CYy92ue0O2Vkx1j+Ia0uAHPpNUq2hx3oBk1JzVujXsuH7lCfj8znY5ts0bn6jVHl9u
         jHSXH5rSBKMb4cVWUenZxhF604O08GaS+4EgI8OAeq+BypKxOY4DG68HyTMUHQdr/GhM
         38NQ==
X-Forwarded-Encrypted: i=1; AKwUvBxK56hNTxXXArcCIElTwVU41cZn3wILwJJ9rx75Y+BPR6WXQswgrphaessvypnor/pIOQ6MrxKoDAc=@vger.kernel.org
X-Gm-Message-State: AFuF++mgRxWm+hOZpx1JydzGLgFZL7RR3gsUPJdMIL1+Y1/3wNg0Gxnt
	WmdK7LiYj2iE2e6yk2PSdevpsMDPNfLXB/I8IWAjRU7eUio9ymylm6ya
X-Gm-Gg: AYBFou27LBTCGhw5A3aR7dH32d1J3tuNrjwdIBF5IzTA//GGXBZdXxlDqX0LaUqdoaA
	yKuQmJgCzN9mIXkI9K8Zez1uEoxmZ0SAAB4QmLzEzZ3GzoPDBZzCKAITfYBI3A2du/OXBM4nPPc
	wq04somkNVHcgK+31bj+bjoub6NPEDvKF6aThoiMG3Ic0kfHWHkT8OvSg3HjntLjFf/Zn5/R44W
	cyQx8nZ3f+Z0bne8pFZtqw923bHmumol+9+KM6tkpnMXDhXLbhYIYuAITPBcp+XiUitJb1qgRbw
	5ndR4AVXYvCrMK8yN1JF4Zp4DzQYumJralzvcHT26SYblcropxm9eJdsbEYiTjRwYa/1V3bqWh5
	LKDWGuDuVjCkFGkbOQ+sAZfrDLy55sfpWKY3AKeEPfUnjNTqShoJQyVbihXSb7zc20Woqcl6nQi
	tZMeOi9KCZ02ZLGSa6lwmZpKZIUuWEVGl/W/XQc/WbmxuIZ3LLTSMZIrIY/AmDYFOTf+jIhF7kQ
	8WvSjEBTEDTUPy9ikUB7sZe7Bx1n6jQ/ErMmbSBYA==
X-Received: by 2002:a05:7300:8d14:b0:33b:e264:362a with SMTP id 5a478bee46e88-34004a89a19mr3212793eec.13.1790282533196;
        Thu, 24 Sep 2026 13:42:13 -0700 (PDT)
Received: from pop-os.scu.edu ([129.210.115.107])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34141d2fe4bsm1073470eec.4.2026.09.24.13.42.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 13:42:12 -0700 (PDT)
From: Cong Wang <xiyou.wangcong@gmail.com>
To: Kees Cook <kees@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Will Drewry <wad@chromium.org>,
	Christian Brauner <brauner@kernel.org>,
	Andy Lutomirski <luto@amacapital.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 1/3] seccomp: allow restarting interrupted unreceived notifications
Date: Thu, 24 Sep 2026 13:42:07 -0700
Message-ID: <20260924204209.477694-2-xiyou.wangcong@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924204209.477694-1-xiyou.wangcong@gmail.com>
References: <20260924204209.477694-1-xiyou.wangcong@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Cong Wang <cwang@multikernel.io>

An interrupted user notification wait returns ERESTARTSYS before the
syscall body has run. If the notifying task's handler for the delivered
signal was installed without SA_RESTART, that task sees EINTR even for
calls whose callers do not expect it. This can make fork fail
unexpectedly or make close report EINTR while leaving the descriptor
open. A leaked pipe write end can prevent readers from seeing EOF.

The supervisor cannot repair this result once the interrupted task
removes the notification. If removal happens before receipt, the
supervisor never receives that request; a reply using its ID would fail
with ENOENT. Receiving notifications eagerly only narrows the scheduling
window. WAIT_KILLABLE_RECV protects supervisor processing after receipt,
but deliberately leaves the pre-receive wait interruptible.

A sandbox also cannot transparently fix this in the target. It cannot
require arbitrary workloads to retry calls such as fork and close.
Retrying close on EINTR is unsafe when the native syscall has already
released the descriptor. Forcing SA_RESTART on application handlers
would change cancellation behavior for other blocking calls.

Sandlock encounters this while mediating process creation to enforce
process limits. For example, dash installs its SIGCHLD handler without
SA_RESTART. While dash is creating a pipeline, an earlier child can exit
and generate SIGCHLD while dash waits for a fork notification to be
received. The interrupted wait then makes fork return EINTR, causing
dash to report "Cannot fork". Removing fork from notification mediation
would bypass the process-limit enforcement that sandlock needs.

Add SECCOMP_FILTER_FLAG_RESTART_BEFORE_RECV, requiring NEW_LISTENER.
Under notify_lock, convert an interrupted wait's ERESTARTSYS to
ERESTARTNOINTR only while the notification remains INIT. The notifying
task's signal handler still runs; if it returns normally, syscall entry
and the filter are evaluated again.

Keep this opt-in because commit c2aa2dfef243 ("seccomp: Add
wait_killable semantic to seccomp user notifier") deliberately preserved
pre-receipt interruption so workloads could abandon requests before the
supervisor starts processing them. The flag can be combined with
WAIT_KILLABLE_RECV to defer non-fatal signals after receipt. Neither
supervisor-supplied errors nor the native syscall's restart behavior is
changed.

Assisted-by: Codex:gpt-6
Signed-off-by: Cong Wang <cwang@multikernel.io>
---
 include/linux/seccomp.h            |  3 ++-
 include/uapi/linux/seccomp.h       |  1 +
 kernel/seccomp.c                   | 16 ++++++++++++----
 tools/include/uapi/linux/seccomp.h |  1 +
 4 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/include/linux/seccomp.h b/include/linux/seccomp.h
index fcb3eb9825e5..3b6cc376fff5 100644
--- a/include/linux/seccomp.h
+++ b/include/linux/seccomp.h
@@ -10,7 +10,8 @@
 					 SECCOMP_FILTER_FLAG_SPEC_ALLOW | \
 					 SECCOMP_FILTER_FLAG_NEW_LISTENER | \
 					 SECCOMP_FILTER_FLAG_TSYNC_ESRCH | \
-					 SECCOMP_FILTER_FLAG_WAIT_KILLABLE_RECV)
+					 SECCOMP_FILTER_FLAG_WAIT_KILLABLE_RECV | \
+					 SECCOMP_FILTER_FLAG_RESTART_BEFORE_RECV)
 
 /* sizeof() the first published struct seccomp_notif_addfd */
 #define SECCOMP_NOTIFY_ADDFD_SIZE_VER0 24
diff --git a/include/uapi/linux/seccomp.h b/include/uapi/linux/seccomp.h
index dbfc9b37fcae..30b76aa48355 100644
--- a/include/uapi/linux/seccomp.h
+++ b/include/uapi/linux/seccomp.h
@@ -25,6 +25,7 @@
 #define SECCOMP_FILTER_FLAG_TSYNC_ESRCH		(1UL << 4)
 /* Received notifications wait in killable state (only respond to fatal signals) */
 #define SECCOMP_FILTER_FLAG_WAIT_KILLABLE_RECV	(1UL << 5)
+#define SECCOMP_FILTER_FLAG_RESTART_BEFORE_RECV	(1UL << 6)
 
 /*
  * All BPF programs must return a 32-bit value.
diff --git a/kernel/seccomp.c b/kernel/seccomp.c
index 86cf4460d69e..0d83cd848036 100644
--- a/kernel/seccomp.c
+++ b/kernel/seccomp.c
@@ -205,6 +205,7 @@ static inline void seccomp_cache_prepare(struct seccomp_filter *sfilter)
  * @log: true if all actions except for SECCOMP_RET_ALLOW should be logged
  * @wait_killable_recv: Put notifying process in killable state once the
  *			notification is received by the userspace listener.
+ * @restart_before_recv: Restart interrupted syscalls before notification receipt.
  * @prev: points to a previously installed, or inherited, filter
  * @prog: the BPF program to evaluate
  * @notif: the struct that holds all notification related information
@@ -226,6 +227,7 @@ struct seccomp_filter {
 	refcount_t users;
 	bool log;
 	bool wait_killable_recv;
+	bool restart_before_recv;
 	struct action_cache cache;
 	struct seccomp_filter *prev;
 	struct bpf_prog *prog;
@@ -953,6 +955,8 @@ static long seccomp_attach_filter(unsigned int flags,
 	/* Set wait killable flag, if present. */
 	if (flags & SECCOMP_FILTER_FLAG_WAIT_KILLABLE_RECV)
 		filter->wait_killable_recv = true;
+	if (flags & SECCOMP_FILTER_FLAG_RESTART_BEFORE_RECV)
+		filter->restart_before_recv = true;
 
 	/*
 	 * If there is an existing filter, make it the prev and don't drop its
@@ -1208,8 +1212,12 @@ static int seccomp_do_user_notification(int this_syscall,
 			 * Check to see whether we should switch to wait
 			 * killable. Only return the interrupted error if not.
 			 */
-			if (!(!wait_killable && should_sleep_killable(match, &n)))
+			if (!(!wait_killable && should_sleep_killable(match, &n))) {
+				if (err == -ERESTARTSYS && match->restart_before_recv &&
+				    n.state == SECCOMP_NOTIFY_INIT)
+					err = -ERESTARTNOINTR;
 				goto interrupted;
+			}
 		}
 
 		addfd = list_first_entry_or_null(&n.addfd,
@@ -1977,10 +1985,10 @@ static long seccomp_set_mode_filter(unsigned int flags,
 		return -EINVAL;
 
 	/*
-	 * The SECCOMP_FILTER_FLAG_WAIT_KILLABLE_SENT flag doesn't make sense
-	 * without the SECCOMP_FILTER_FLAG_NEW_LISTENER flag.
+	 * Notification wait flags require a userspace listener.
 	 */
-	if ((flags & SECCOMP_FILTER_FLAG_WAIT_KILLABLE_RECV) &&
+	if ((flags & (SECCOMP_FILTER_FLAG_WAIT_KILLABLE_RECV |
+		      SECCOMP_FILTER_FLAG_RESTART_BEFORE_RECV)) &&
 	    ((flags & SECCOMP_FILTER_FLAG_NEW_LISTENER) == 0))
 		return -EINVAL;
 
diff --git a/tools/include/uapi/linux/seccomp.h b/tools/include/uapi/linux/seccomp.h
index dbfc9b37fcae..30b76aa48355 100644
--- a/tools/include/uapi/linux/seccomp.h
+++ b/tools/include/uapi/linux/seccomp.h
@@ -25,6 +25,7 @@
 #define SECCOMP_FILTER_FLAG_TSYNC_ESRCH		(1UL << 4)
 /* Received notifications wait in killable state (only respond to fatal signals) */
 #define SECCOMP_FILTER_FLAG_WAIT_KILLABLE_RECV	(1UL << 5)
+#define SECCOMP_FILTER_FLAG_RESTART_BEFORE_RECV	(1UL << 6)
 
 /*
  * All BPF programs must return a 32-bit value.
-- 
2.43.0

