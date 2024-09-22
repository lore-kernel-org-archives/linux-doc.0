Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D627DA7D
	for <linux-doc@vger.kernel.org>; Sun, 22 Sep 2024 09:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726998922; cv=none; b=avcry5RR28EuPJC3pqXUp78oBZo2IIQQOkwykn5bEqqqxH1UdWDRnBgaTSJ0F6TT0ZdgEADKqph0qLHcwxpFEmqDQSR++8Hp57E2TJyTT2HoPVlRSftQVoAy6SPDRjRkDaqRI3qUSfOxyV8F/Y4LzWxVtkIl3vjjpG+AcrJXC14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726998922; c=relaxed/simple;
	bh=wuv7+JwtweqlA7E4xEcIpyTvVOFs4uq0OJAbjF6zJyU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Hq/5ugYpsoH/4x3sLndN4hQ2bUh75PfYY1BbLwhAiFPrvUYmGigF7rJ8S58xY56OYSWrGg/Io9u50QsZaful95qBAZE095Mhx+zzPWW08loCsHTP2yF3B7IQN7iqbApRRxDwbEU0FDVnHhzvsoztIu57unbc9cFfvXls8Ss5M1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cwP8Xs4F; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cwP8Xs4F"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-71970655611so3098005b3a.0
        for <linux-doc@vger.kernel.org>; Sun, 22 Sep 2024 02:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726998921; x=1727603721; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DwgcHZw0wCTOHw2oCAXY4D9699s3eqaUVeXqCIWB5XY=;
        b=cwP8Xs4F1qRyjNvzwQj9s/VgXSpJKMEdFfVsZ38NIV9Q7mByaExU3nnEABPk2ZlgfI
         6TBQpbRomdtiJbmSvuHhfpp8HUdipP0SSCZ1iFQPWItnm0UTWFM+6/Np4QPb4Q4EAjXY
         bfBO7YGCF6IOZbHz17ditRcwR3GcZJktWu6srWSdzbv2jlC+XgMd2pIohGmnAREjYXL5
         M2jgUIKpmwdEuRBbz0ym8aAG0OYMml1awrIDqc6KoSm0HBdO75n7yJCel2f3Py0ELoGZ
         QI3wfh6BsDcCme6OxhVEeu74DlygQMuFE8WimOS8bLTGdDadOlMtbXz6FHRTM2DLe3uD
         F4TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726998921; x=1727603721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DwgcHZw0wCTOHw2oCAXY4D9699s3eqaUVeXqCIWB5XY=;
        b=elu+cN8kShWvwgFl8Q92c1YzbiLjhgkF0Zrm1QT4cfbuwHJ0A55RnCX4nS7MKUg3sf
         JHbaFPGZ4WL69NjJkGRqn+vfCkAWaTlj1pJEll9MfceeARX1rOKsMek39YyBe5d4oWnh
         EY3IcmFDedqFd2Jq9eS06sKzu5Drg7Qmuy9/bous4pjk+YLP60dGVuc7az35I6AUc12Z
         n1HLKI3fNHedztXxttOU5ZsZ7ZY5VyLMqeTTJ3t8DJT8z6WL4uqg4LncP6LW6ySiFbzw
         9x1uh/vYbQFmRJdMsL4CDeFIG/ZoAPewIGfjrYMhhoNfHs/V03AHmCggF190ZWFNbGXo
         27vA==
X-Gm-Message-State: AOJu0YwAwGiJIBk3RmUrAYpn3SUZmt3W48TxnfaDKOyA3m45G+5WybHK
	fB666MQGqY8SfrUDMjTdARO+rulaKHdka3p6C72kTc7+BG+7UXqI
X-Google-Smtp-Source: AGHT+IG2HPoD68I6fVcXY2ofHsU2tBH+VL6+qjeByJnKe7280g+ZpoJqvao3wF/y+9G5EhY1PFrNEQ==
X-Received: by 2002:a05:6a00:92a2:b0:710:da27:f176 with SMTP id d2e1a72fcca58-7199cd6bbc4mr14414955b3a.12.1726998920598;
        Sun, 22 Sep 2024 02:55:20 -0700 (PDT)
Received: from localhost ([183.226.245.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944a97e7bsm12285984b3a.7.2024.09.22.02.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Sep 2024 02:55:19 -0700 (PDT)
From: "qiwu.chen" <qiwuchen55@gmail.com>
X-Google-Original-From: "qiwu.chen" <qiwu.chen@transsion.com>
To: corbet@lwn.net,
	oleg@redhat.com,
	mhocko@suse.com,
	jani.nikula@intel.com,
	akpm@linux-foundation.org,
	brauner@kernel.org,
	paulmck@kernel.org
Cc: linux-doc@vger.kernel.org,
	"qiwu.chen" <qiwu.chen@transsion.com>
Subject: [PATCH v3 2/2] exit: dump current pt_regs info on global init exit
Date: Sun, 22 Sep 2024 17:55:04 +0800
Message-Id: <20240922095504.7182-2-qiwu.chen@transsion.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240922095504.7182-1-qiwu.chen@transsion.com>
References: <20240922095504.7182-1-qiwu.chen@transsion.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, it's hard to debug panic issues caused by kill init,
since there is no debug info from user mode in current panic msg
such as the user_regs and maps info.

This patch dumps current pt_regs info on global init exit for debugging.

Signed-off-by: qiwu.chen <qiwu.chen@transsion.com>
---
 kernel/exit.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/kernel/exit.c b/kernel/exit.c
index 0d62a53605df..3d5aa88ba517 100644
--- a/kernel/exit.c
+++ b/kernel/exit.c
@@ -11,6 +11,7 @@
 #include <linux/sched/mm.h>
 #include <linux/sched/stat.h>
 #include <linux/sched/task.h>
+#include <linux/sched/debug.h>
 #include <linux/sched/task_stack.h>
 #include <linux/sched/cputime.h>
 #include <linux/interrupt.h>
@@ -847,10 +848,12 @@ void __noreturn do_exit(long code)
 		 * If the last thread of global init has exited, panic
 		 * immediately to get a useable coredump.
 		 */
-		if (unlikely(is_global_init(tsk)))
+		if (unlikely(is_global_init(tsk))) {
+			/* dump the pt_regs of current thread for debugging. */
+			show_regs(task_pt_regs(tsk));
 			panic("Attempted to kill init! exitcode=0x%08x\n",
 				tsk->signal->group_exit_code ?: (int)code);
-
+		}
 #ifdef CONFIG_POSIX_TIMERS
 		hrtimer_cancel(&tsk->signal->real_timer);
 		exit_itimers(tsk);
-- 
2.25.1

