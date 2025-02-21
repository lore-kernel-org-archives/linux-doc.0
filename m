Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C5524634F
	for <linux-doc@vger.kernel.org>; Fri, 21 Feb 2025 17:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740157380; cv=none; b=m0XFAQro9zxQaI1kfCt2eQBlwLdEO4K418qC3RnPCjPBwv4lZajppY8LI+fWnNOXkNVOaXwTsAxe+9WOH0ioI6YXFN4ki5e08qNeIS8oOdPQ3gKgw93hYIePAL9LAy6lJZk+cUyFU2Vkm6KRP2Z8cjNjXuEkyq7PBMBdzRuT+6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740157380; c=relaxed/simple;
	bh=p26yxnUhbdMRoiqj6XHxuH9YLkbrUj4rKzuTeUEX3o0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HHzFRgvVAUkdSCPSlZayaEQY79HisP/CcE6qfXFmyJNSPBs40yz2yhr4P7680gSWhY2tUXyIaM++IVr0SdzzE2aS4th1/OSRhgwrnKB1Zs9OznIos2ntCMLjwNxpEClGUPnk7wvQJyDbqdimZ+MzG8S3WaEoWpPmAN+nyOjGLt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=f7m7PSE7; arc=none smtp.client-ip=209.85.218.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="f7m7PSE7"
Received: by mail-ej1-f68.google.com with SMTP id a640c23a62f3a-abadccdfe5aso400466066b.0
        for <linux-doc@vger.kernel.org>; Fri, 21 Feb 2025 09:02:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740157376; x=1740762176; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wWszliNKbmL8VUqL0WBW3MKacH8rbha5eqW1pX7oPq8=;
        b=f7m7PSE7CbLc5EfFMwi5bGPy2nHJYOCJBaGL6ffvkTB9gNxh8RPdvhw6SoImkvRQRN
         ppTnnJB3oEsFvS/iontAf7ZowZOBsuduoBpYirzmGlq9EuoSFS54zH0M9862jk0kZQ1M
         gV5wLfKv4HKCQFP6bCkB5DKdcl0AHCjHnhrC81t1CSHw3q1lwzQsmlhmsvC8FWL0XBSh
         6pfT6EMt6cuFMoWo/0GNS+oQIQ9GWL+fkN1eKOTinNeq/6olFn/Ilr8m31DoFOMhd54k
         2z7Re/sfPj4BMsnNebyo3I5IhbPdlLoXVqYKHK9lik+dj/Ryv+huwsAKr7OvwfTobhQr
         DlkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740157376; x=1740762176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wWszliNKbmL8VUqL0WBW3MKacH8rbha5eqW1pX7oPq8=;
        b=I1bKZjCCGaMLi7NxO/6JacIw3c1Tw/7Cm14M9JWYQIRnVzD1ZeJPPQ94X3sJANt1+F
         2sMlhgrGHgdz6tpDt14ulcsHeuKnqfjhxgSd8Vhr38J10dnX/QZbcdOTh+BVx+4tWgHv
         F+WCDFBvlkbDIurK1xXsfoBHjjY8T+fnRtx2urt9MMyftsrD5+XkFKDgGsknJladlHtw
         JP132i8R6qlkMNWqvDj7Tr5owZvTixfGgyQP+5FbDXaGMiy1yfu8zr/iJIcanpnxFzrR
         Hon1AE4SGGWWvk2x0q08Abio5FwDgXofqU6syVVwTmC88zLhgCi/hhI6cfmlGakBeRzb
         r7+g==
X-Forwarded-Encrypted: i=1; AJvYcCUiC27ZGMe7Gvshk8M1Ziso6ocH1kzF3I6wG0h7JUyaUbZOz2L16/2RhflY27RFSpjCFuYAJXmEzrY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIA20LkDraFR+y1kVmYr5VvPaDQcCOJ2PhztXfrgtXCvIkR4Uq
	C7N1fM6Fk/5Nxqr/nt0xno+/biiXyT87L+Z5HmEmMsReyiZ0I/apm4s9Snls8bk=
X-Gm-Gg: ASbGncsx856QES80vtwImJdxtSHfW1CjK3lsDlVr3LrLvyTj7krO7ljvNBZGIdmp5BG
	wbTWErvVaUxXJSiDLqXAE5r0OJLEa/sx8pQNVc5fpbf/4wJ4ueeMfZ8tv2pOf9AwcJQZGaWiHlj
	NPgimkHSuMUuRWqUNOcd+DKM1IXfH25RPyxi3nrq+5lP+l2zQQFFVa+abPAYUXYRa7y/gpk+iKv
	PbtK8/e0F9FAJorAhQPtUJlSU2CUmR7ukMYavvYUOu1H7jTt/5fvOGCYVP9GOkKMbZBnokncKnT
	3Gk+BRF+ddiOVaz/GRxpaFa+ZLg5
X-Google-Smtp-Source: AGHT+IEwCTRlvyl71solhDgWaKxLp5oopUTcMtwHu3YJJA/SVMpLmQ33tXa83ctCiJhFUIO1Qd60bg==
X-Received: by 2002:a17:906:314d:b0:ab7:9df1:e562 with SMTP id a640c23a62f3a-abc0de55dbcmr343145666b.48.1740157375725;
        Fri, 21 Feb 2025 09:02:55 -0800 (PST)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb8eea4d65sm1105668766b.161.2025.02.21.09.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 09:02:55 -0800 (PST)
From: =?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>
To: Christian Brauner <brauner@kernel.org>,
	Alexander Mikhalitsyn <alexander@mihalicyn.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>,
	Kees Cook <kees@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Eric W . Biederman" <ebiederm@xmission.com>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Oleg Nesterov <oleg@redhat.com>
Subject: [PATCH 2/2] pid: Optional first-fit pid allocation
Date: Fri, 21 Feb 2025 18:02:49 +0100
Message-ID: <20250221170249.890014-3-mkoutny@suse.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250221170249.890014-1-mkoutny@suse.com>
References: <20250221170249.890014-1-mkoutny@suse.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Noone would need to use this allocation strategy (it's slower, pid
numbers collide sooner). Its primary purpose are pid namespaces in
conjunction with pids.max cgroup limit which keeps (virtual) pid numbers
below the given limit. This is for 32-bit userspace programs that may
not work well with pid numbers above 65536.

Link: https://lore.kernel.org/r/20241122132459.135120-1-aleksandr.mikhalitsyn@canonical.com/
Signed-off-by: Michal Koutný <mkoutny@suse.com>
---
 Documentation/admin-guide/sysctl/kernel.rst |  2 ++
 include/linux/pid_namespace.h               |  3 +++
 kernel/pid.c                                | 12 +++++++--
 kernel/pid_namespace.c                      | 28 +++++++++++++++------
 4 files changed, 36 insertions(+), 9 deletions(-)

diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
index a43b78b4b6464..f5e68d1c8849f 100644
--- a/Documentation/admin-guide/sysctl/kernel.rst
+++ b/Documentation/admin-guide/sysctl/kernel.rst
@@ -1043,6 +1043,8 @@ The last pid allocated in the current (the one task using this sysctl
 lives in) pid namespace. When selecting a pid for a next task on fork
 kernel tries to allocate a number starting from this one.
 
+When set to -1, first-fit pid numbering is used instead of the next-fit.
+
 
 powersave-nap (PPC only)
 ========================
diff --git a/include/linux/pid_namespace.h b/include/linux/pid_namespace.h
index f9f9931e02d6a..10bf66ca78590 100644
--- a/include/linux/pid_namespace.h
+++ b/include/linux/pid_namespace.h
@@ -41,6 +41,9 @@ struct pid_namespace {
 #if defined(CONFIG_SYSCTL) && defined(CONFIG_MEMFD_CREATE)
 	int memfd_noexec_scope;
 #endif
+#ifdef CONFIG_IA32_EMULATION
+	bool pid_noncyclic;
+#endif
 } __randomize_layout;
 
 extern struct pid_namespace init_pid_ns;
diff --git a/kernel/pid.c b/kernel/pid.c
index aa2a7d4da4555..e9da1662b8821 100644
--- a/kernel/pid.c
+++ b/kernel/pid.c
@@ -191,6 +191,10 @@ struct pid *alloc_pid(struct pid_namespace *ns, pid_t *set_tid,
 
 	for (i = ns->level; i >= 0; i--) {
 		int tid = 0;
+		bool pid_noncyclic = 0;
+#ifdef CONFIG_IA32_EMULATION
+		pid_noncyclic = READ_ONCE(tmp->pid_noncyclic);
+#endif
 
 		if (set_tid_size) {
 			tid = set_tid[ns->level - i];
@@ -235,8 +239,12 @@ struct pid *alloc_pid(struct pid_namespace *ns, pid_t *set_tid,
 			 * Store a null pointer so find_pid_ns does not find
 			 * a partially initialized PID (see below).
 			 */
-			nr = idr_alloc_cyclic(&tmp->idr, NULL, pid_min,
-					      pid_max, GFP_ATOMIC);
+			if (likely(!pid_noncyclic))
+				nr = idr_alloc_cyclic(&tmp->idr, NULL, pid_min,
+						      pid_max, GFP_ATOMIC);
+			else
+				nr = idr_alloc(&tmp->idr, NULL, pid_min,
+						      pid_max, GFP_ATOMIC);
 		}
 		spin_unlock_irq(&pidmap_lock);
 		idr_preload_end();
diff --git a/kernel/pid_namespace.c b/kernel/pid_namespace.c
index 0f23285be4f92..ceda94a064294 100644
--- a/kernel/pid_namespace.c
+++ b/kernel/pid_namespace.c
@@ -113,6 +113,9 @@ static struct pid_namespace *create_pid_namespace(struct user_namespace *user_ns
 	ns->pid_allocated = PIDNS_ADDING;
 #if defined(CONFIG_SYSCTL) && defined(CONFIG_MEMFD_CREATE)
 	ns->memfd_noexec_scope = pidns_memfd_noexec_scope(parent_pid_ns);
+#endif
+#ifdef CONFIG_IA32_EMULATION
+	ns->pid_noncyclic = READ_ONCE(parent_pid_ns->pid_noncyclic);
 #endif
 	return ns;
 
@@ -260,7 +263,7 @@ void zap_pid_ns_processes(struct pid_namespace *pid_ns)
 	return;
 }
 
-#ifdef CONFIG_CHECKPOINT_RESTORE
+#if defined(CONFIG_CHECKPOINT_RESTORE) || defined(CONFIG_IA32_EMULATION)
 static int pid_ns_ctl_handler(const struct ctl_table *table, int write,
 		void *buffer, size_t *lenp, loff_t *ppos)
 {
@@ -271,12 +274,23 @@ static int pid_ns_ctl_handler(const struct ctl_table *table, int write,
 	if (write && !checkpoint_restore_ns_capable(pid_ns->user_ns))
 		return -EPERM;
 
-	next = idr_get_cursor(&pid_ns->idr) - 1;
+	next = -1;
+#ifdef CONFIG_IA32_EMULATION
+	if (!pid_ns->pid_noncyclic)
+#endif
+		next += idr_get_cursor(&pid_ns->idr);
 
 	tmp.data = &next;
 	ret = proc_dointvec_minmax(&tmp, write, buffer, lenp, ppos);
-	if (!ret && write)
-		idr_set_cursor(&pid_ns->idr, next + 1);
+	if (!ret && write) {
+		if (next > -1)
+			idr_set_cursor(&pid_ns->idr, next + 1);
+		else if (!IS_ENABLED(CONFIG_IA32_EMULATION))
+			ret = -EINVAL;
+#ifdef CONFIG_IA32_EMULATION
+		WRITE_ONCE(pid_ns->pid_noncyclic, next == -1);
+#endif
+	}
 
 	return ret;
 }
@@ -288,11 +302,11 @@ static const struct ctl_table pid_ns_ctl_table[] = {
 		.maxlen = sizeof(int),
 		.mode = 0666, /* permissions are checked in the handler */
 		.proc_handler = pid_ns_ctl_handler,
-		.extra1 = SYSCTL_ZERO,
+		.extra1 = SYSCTL_NEG_ONE,
 		.extra2 = &pid_max,
 	},
 };
-#endif	/* CONFIG_CHECKPOINT_RESTORE */
+#endif	/* CONFIG_CHECKPOINT_RESTORE || CONFIG_IA32_EMULATION */
 
 int reboot_pid_ns(struct pid_namespace *pid_ns, int cmd)
 {
@@ -449,7 +463,7 @@ static __init int pid_namespaces_init(void)
 {
 	pid_ns_cachep = KMEM_CACHE(pid_namespace, SLAB_PANIC | SLAB_ACCOUNT);
 
-#ifdef CONFIG_CHECKPOINT_RESTORE
+#if defined(CONFIG_CHECKPOINT_RESTORE) || defined(CONFIG_IA32_EMULATION)
 	register_sysctl_init("kernel", pid_ns_ctl_table);
 #endif
 
-- 
2.48.1

