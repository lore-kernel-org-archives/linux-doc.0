Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85EAC6FBF
	for <linux-doc@vger.kernel.org>; Sun, 22 Sep 2024 09:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726998913; cv=none; b=fUMpmONp+861mf8ldr2GbXJXOxu9qRaXeutTLhe+L3Dh8n3hPadYP3V6tQvhhBd7XHvMi6nL8FsH/yTF0cajfBR62zcU0n1kx0uywxLH3pH8/vjpzjGs9hn/KwtvzZmxEhxg19gUa0Owz0YDoHHD1gXDt6DPFmQCJtyHC5Cl0iA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726998913; c=relaxed/simple;
	bh=CeDes7R2LpfAXtOku2fbpjXobwbDrU0kfBqni3o6Stk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=C8HwkIN12VWQahUEVTrxw0tc2sOPsPQQA2DyzXd7c2MBSAL91lQVid8RXkh9B7k1lmRf0F8FG6LFJebzUAwmsYNm9m0VLLpG40Isj2fJ1hUXsMihUm27FUKaOa19TfRPdAxK7+vto5hMg0L2SNPX/iAFifTUYKmBv5c7nvOEDss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NYkQzKbV; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NYkQzKbV"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2068a7c9286so34846435ad.1
        for <linux-doc@vger.kernel.org>; Sun, 22 Sep 2024 02:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726998911; x=1727603711; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gGhASXP0YGE4ncucrvEzkGeI2BDKX774WZmNjI6QgXQ=;
        b=NYkQzKbVVq+6jbQwSM397Er/4gyjTJs7g5gWhu8kFluSJf0YcSXYlGTv97SnCily59
         xIg8RMuq34Tl4r3Fali/FYvJfmau2qvhMZrniOolTF8fdkRFtohrq98rcj91Xeufus3C
         tRqLuI7XMW8DNokrctD6FyM6ZhwvOnfVWhYDPF7B5Zadn9gpTd3+YI0bPJgAsFABFoKT
         iNrgHDv+wIWSU9rXTdidpWxXipN0pqmIaTn1UZLbgpYWVT/3/kcx/YmCtG6m8r6Tz9Om
         BxeYv6c+jOVvImCWAonkMTM+u+rBjmzRQHw9WnphlZXnWhlmeCvBW/vKwgto7P76Ena3
         RDng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726998911; x=1727603711;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gGhASXP0YGE4ncucrvEzkGeI2BDKX774WZmNjI6QgXQ=;
        b=Kvuo43OnMpBsfet84tZdlKHaEghzbDJ+OUnz7hpfNALltIdutEFcGL4szKvwNEinCy
         Na0y4/ZpQI2oX57TdhMeCOR6keBMbfP9cw7p+rpJVER0u7ewt6LjnN6ILev1iezJz6Sd
         EHpa5OQBRUhnFKOvCHKZJ+qnwf7rRJOBLJMPuRIuHYYHM1b+FKCVsdBWLZYlbQ+DkTIo
         h3peJNWa3bdf9SVKT3MLVh1gWBalqzvPhbv+tZAGWBOEzbJndfbzoTcsRt+MnrTA46Qv
         +qHVB5hdnV9SbaQeRI8fB+z5Gq7Z3Z8dgkSR053fLNJiEdfnHLJj7fXOcbsjlkRlDbFd
         vzFQ==
X-Gm-Message-State: AOJu0YzEwy61u0r/K4KQ7m8ZWbk6taaID4ppDGCg4QIQM8yZWgIz1qF3
	tQ0/LwtALs8580Q/FUj/5JrZY9aY7dBnfRmLsXrjXVtCrY6msMVq
X-Google-Smtp-Source: AGHT+IEpbyRywRFf64s8nwAH9zd5Hq67CIGz2ZoafpEw6hajqm3BfXSFfz0CsVyfqgLyPb/cH5v7tQ==
X-Received: by 2002:a17:903:24c:b0:207:625:cef1 with SMTP id d9443c01a7336-208d8339e94mr107679625ad.2.1726998910552;
        Sun, 22 Sep 2024 02:55:10 -0700 (PDT)
Received: from localhost ([183.226.245.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20794601083sm118459785ad.71.2024.09.22.02.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Sep 2024 02:55:10 -0700 (PDT)
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
Subject: [PATCH v3 1/2] panic: add option to dump task maps info in panic_print
Date: Sun, 22 Sep 2024 17:55:03 +0800
Message-Id: <20240922095504.7182-1-qiwu.chen@transsion.com>
X-Mailer: git-send-email 2.25.1
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

This patch adds an option to dump task maps info in panic_print.

Signed-off-by: qiwu.chen <qiwu.chen@transsion.com>
---
 .../admin-guide/kernel-parameters.txt         |  1 +
 Documentation/admin-guide/sysctl/kernel.rst   |  1 +
 kernel/panic.c                                | 82 +++++++++++++++++++
 3 files changed, 84 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 8337d0fed311..f76709deef6c 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -4253,6 +4253,7 @@
 			bit 5: print all printk messages in buffer
 			bit 6: print all CPUs backtrace (if available in the arch)
 			bit 7: print only tasks in uninterruptible (blocked) state
+			bit 8: print task maps info
 			*Be aware* that this option may print a _lot_ of lines,
 			so there are risks of losing older messages in the log.
 			Use this option carefully, maybe worth to setup a
diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
index f8bc1630eba0..558e365b76a9 100644
--- a/Documentation/admin-guide/sysctl/kernel.rst
+++ b/Documentation/admin-guide/sysctl/kernel.rst
@@ -872,6 +872,7 @@ bit 4  print ftrace buffer
 bit 5  print all printk messages in buffer
 bit 6  print all CPUs backtrace (if available in the arch)
 bit 7  print only tasks in uninterruptible (blocked) state
+bit 8  print task maps info
 =====  ============================================
 
 So for example to print tasks and memory info on panic, user can::
diff --git a/kernel/panic.c b/kernel/panic.c
index 753d12f4dc8f..5b76ff92a6fc 100644
--- a/kernel/panic.c
+++ b/kernel/panic.c
@@ -77,6 +77,8 @@ EXPORT_SYMBOL_GPL(panic_timeout);
 #define PANIC_PRINT_ALL_PRINTK_MSG	0x00000020
 #define PANIC_PRINT_ALL_CPU_BT		0x00000040
 #define PANIC_PRINT_BLOCKED_TASKS	0x00000080
+#define PANIC_PRINT_TASK_MAPS_INFO	0x00000100
+
 unsigned long panic_print;
 
 ATOMIC_NOTIFIER_HEAD(panic_notifier_list);
@@ -208,6 +210,83 @@ void nmi_panic(struct pt_regs *regs, const char *msg)
 }
 EXPORT_SYMBOL(nmi_panic);
 
+/*
+ * This function is called in panic proccess if the PANIC_PRINT_TASK_MAPS_INFO
+ * flag is specified in panic_print, which is helpful to debug panic issues due
+ * to an unhandled falut in user mode such as kill init.
+ */
+static void dump_task_maps_info(struct task_struct *tsk)
+{
+	struct pt_regs *user_ret = task_pt_regs(tsk);
+	struct mm_struct *mm = tsk->mm;
+	struct vm_area_struct *vma;
+
+	if (!mm || !user_mode(user_ret))
+		return;
+
+	pr_info("Dump task %s:%d maps start\n", tsk->comm, task_pid_nr(tsk));
+	mmap_read_lock(mm);
+	VMA_ITERATOR(vmi, mm, 0);
+	for_each_vma(vmi, vma) {
+		struct file *file = vma->vm_file;
+		int flags = vma->vm_flags;
+		unsigned long long pgoff = ((loff_t)vma->vm_pgoff) << PAGE_SHIFT;
+		struct anon_vma_name *anon_name = NULL;
+		struct mm_struct *mm = vma->vm_mm;
+		char buf[256] = {0};
+		const char *name = NULL;
+
+		if (mm)
+			anon_name = anon_vma_name(vma);
+
+		if (file) {
+			if (anon_name) {
+				snprintf(buf, sizeof(buf), "[anon_shmem:%s]", anon_name->name);
+				name = buf;
+			} else {
+				char *f_path = d_path(file_user_path(file), buf, sizeof(buf));
+
+				name = IS_ERR(f_path) ? "?" : f_path;
+			}
+			goto print;
+		}
+
+		if (vma->vm_ops && vma->vm_ops->name) {
+			name = vma->vm_ops->name(vma);
+			if (name)
+				goto print;
+		}
+
+		name = arch_vma_name(vma);
+		if (!name) {
+			if (mm) {
+				if (vma_is_initial_heap(vma))
+					name = "[heap]";
+				else if (vma_is_initial_stack(vma))
+					name = "[stack]";
+			} else
+				name = "[vdso]";
+
+			if (anon_name) {
+				snprintf(buf, sizeof(buf), "[anon:%s]", anon_name->name);
+				name = buf;
+			}
+		}
+
+print:
+		if (name)
+			pr_info("%08lx-%08lx %c%c%c%c %08llx %s\n",
+				vma->vm_start, vma->vm_end,
+				flags & VM_READ ? 'r' : '-',
+				flags & VM_WRITE ? 'w' : '-',
+				flags & VM_EXEC ? 'x' : '-',
+				flags & VM_MAYSHARE ? 's' : 'p',
+				pgoff, name);
+	}
+	mmap_read_unlock(mm);
+	pr_info("Dump task %s:%d maps end\n", tsk->comm, task_pid_nr(tsk));
+}
+
 static void panic_print_sys_info(bool console_flush)
 {
 	if (console_flush) {
@@ -233,6 +312,9 @@ static void panic_print_sys_info(bool console_flush)
 
 	if (panic_print & PANIC_PRINT_BLOCKED_TASKS)
 		show_state_filter(TASK_UNINTERRUPTIBLE);
+
+	if (panic_print & PANIC_PRINT_TASK_MAPS_INFO)
+		dump_task_maps_info(current);
 }
 
 void check_panic_on_warn(const char *origin)
-- 
2.25.1

