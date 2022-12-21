Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D02BC4708D
	for <linux-doc@archiver.kernel.org>; Wed, 21 Dec 2022 19:46:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229578AbiLUTqS (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 21 Dec 2022 14:46:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229728AbiLUTqQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 21 Dec 2022 14:46:16 -0500
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5315C248D1
        for <linux-doc@vger.kernel.org>; Wed, 21 Dec 2022 11:46:14 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id m18so19434eji.5
        for <linux-doc@vger.kernel.org>; Wed, 21 Dec 2022 11:46:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8WMtn3c3gpWE05X13XBtql1qRSWe7APE4L2Sbgmggnc=;
        b=kfWUeKObDucY3ttXwvmnW6H3aQHW7MbPw2qZSiY5uhfCg9F6pDBSHjdJtUpiwekPqs
         D7f5wfCCqLn/FNRDgUnFCPcX19UsTEybjftvnd4T9uR+u5sbuji5WA/ogtq7hg5RBoM9
         GsRHxRJAsY1snXXf943+/bcTHc8KgXL2fODG0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8WMtn3c3gpWE05X13XBtql1qRSWe7APE4L2Sbgmggnc=;
        b=z1KQzM5p5k4Vz1DAjMlYNqHpZVDZn9ie4MilWZnNVcj0+Wm9e2KgKR9ZDWvDbIMn5b
         hYd3wlmWVaU2ST74tqWo8HsKUXFo0b99Zo/6cUq+tkq8FStj8QpV7+TSHnbRviPi0WOO
         VDBLOsSFcUCIugk6GA2thStPxiqAC6p6VObQdf+SKf7Pk251t/lIw2Lg1EpxNS/r4bVO
         eUEusys3KhNYKc89drau6RTzHJdFxKpBOJp09UqwPRAF6XyW6fN/zwmCljdjDiVqKNhv
         p5rfGs+qZG2Z3dC/hbnh1AEXoA3rqUozBx1/RakvUdGr1OFhWh4yC9rNoNqCbE5TeSrc
         gp0w==
X-Gm-Message-State: AFqh2kq/rgxC/NQOsflO5vN2i7S3ZQg0AgFAUBVaj7K+NM3nURMYlFRH
        QE9HuqMm9VpGW4+ccUUG0ZG+ug==
X-Google-Smtp-Source: AMrXdXvqm/hjHK2/Cq/JHqL0odBTJSYzliyDaR7yI8SPc8P0LtE87Qs/kwf9hFeD6FMzrUe4m9nC/g==
X-Received: by 2002:a17:906:c34d:b0:78d:f455:b5de with SMTP id ci13-20020a170906c34d00b0078df455b5demr2255047ejb.30.1671651972842;
        Wed, 21 Dec 2022 11:46:12 -0800 (PST)
Received: from alco.roam.corp.google.com (80.71.134.83.ipv4.parknet.dk. [80.71.134.83])
        by smtp.gmail.com with ESMTPSA id f24-20020a056402005800b0046cbcc86bdesm7382008edu.7.2022.12.21.11.46.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Dec 2022 11:46:12 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Wed, 21 Dec 2022 20:45:59 +0100
Subject: [PATCH v5 3/3] kexec: Introduce sysctl parameters kexec_load_limit_*
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221114-disable-kexec-reset-v5-3-1bd37caf3c75@chromium.org>
References: <20221114-disable-kexec-reset-v5-0-1bd37caf3c75@chromium.org>
In-Reply-To: <20221114-disable-kexec-reset-v5-0-1bd37caf3c75@chromium.org>
To:     "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        Eric Biederman <ebiederm@xmission.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Philipp Rudo <prudo@redhat.com>
Cc:     Ross Zwisler <zwisler@kernel.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        kexec@lists.infradead.org, Ricardo Ribalda <ribalda@chromium.org>,
        "Joel Fernandes (Google)" <joel@joelfernandes.org>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.11.0-dev-696ae
X-Developer-Signature: v=1; a=openpgp-sha256; l=7080; i=ribalda@chromium.org;
 h=from:subject:message-id; bh=wjOv1kjeZCTcr83lBBKlpshLnU6euVnomopYZ4Y2tkg=;
 b=owEBbQKS/ZANAwAKAdE30T7POsSIAcsmYgBjo2J/jUTf5Bub+D3fWzqRqf9/P57dD764DcRO2C+6
 /CmMFZyJAjMEAAEKAB0WIQREDzjr+/4oCDLSsx7RN9E+zzrEiAUCY6NifwAKCRDRN9E+zzrEiBYwD/
 0doNCURaknqHC+qQW+dsQrYiP3jY0XwQQqM72OhAZNNy4MlvEwIoyeOkbV3GDBSRPAKeduCFLVzy55
 NQmb+W9f3A1h0nhimYEbI+N+Csch1GYhL1uYnuskt9EhTY8yAKixxL+VO5FaAlFPU4I+CtiFaox11z
 efiKTNI4aUu3PLNHZ+IEiLSsZSncw/+JTXEasIbJ2g0KlX5kt15MnkfnItriuibnjaXfD8OKWzXCth
 QVK8S2h0/KmTR1CiCdoynGo+BJXiYYxXWUpLbIz7rhJ1lAh1Gm3eyga+6wROZOiS4q5w0htQNk6S9g
 h0JnaWvXIYa0/WzAi7czsje+qhgdN2EjmewdUWfkBT2gV+g+Zb3Pb9DoVLBfJ7Yu0bCFp59sSIKh2s
 jXqIvh4/sIS9nqr4OOcVMjXXKpnHF7ewnWw6bXGe9V1BfuVzrvqm3Ukd85tP4v3KpRiV+fs7PFTgl8
 fzJ/ipFCibsgkXZboA5aDlKFY7KTppUfsB85XO4F/3CpHPfNnZ0yAQXrEeLvIhoFMGP0/GFEwc3WxA
 ww0cn81HBQfVTtKv6231eDe4cBuZM3iSQGGOzJSlq8QjKafMzWEuW7QW9lxy0443G0nYuV9N5tsYL5
 Ybi+b2NVHSVlFn+yT7xp8ynf9LQ3VUVY5nzmoeuvwkRbdoynhFVRBnvYoXUA==
X-Developer-Key: i=ribalda@chromium.org; a=openpgp;
 fpr=9EC3BB66E2FC129A6F90B39556A0D81F9F782DA9
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add two parameters to specify how many times a kexec kernel can be loaded.

The sysadmin can set different limits for kexec panic and kexec reboot
kernels.

The value can be modified at runtime via sysctl, but only with a value
smaller than the current one (except -1).

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 Documentation/admin-guide/sysctl/kernel.rst | 18 ++++++
 include/linux/kexec.h                       |  2 +-
 kernel/kexec.c                              |  4 +-
 kernel/kexec_core.c                         | 87 ++++++++++++++++++++++++++++-
 kernel/kexec_file.c                         | 11 ++--
 5 files changed, 114 insertions(+), 8 deletions(-)

diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
index 97394bd9d065..a3922dffbd47 100644
--- a/Documentation/admin-guide/sysctl/kernel.rst
+++ b/Documentation/admin-guide/sysctl/kernel.rst
@@ -461,6 +461,24 @@ allowing a system to set up (and later use) an image without it being
 altered.
 Generally used together with the `modules_disabled`_ sysctl.
 
+kexec_load_limit_panic
+======================
+
+This parameter specifies a limit to the number of times the syscalls
+``kexec_load`` and ``kexec_file_load`` can be called with a crash
+image. It can only be set with a more restrictive value than the
+current one.
+
+=  =============================================================
+-1 Unlimited calls to kexec. This is the default setting.
+N  Number of calls left.
+=  =============================================================
+
+kexec_load_limit_reboot
+======================
+
+Similar functionality as ``kexec_load_limit_panic``, but for a crash
+image.
 
 kptr_restrict
 =============
diff --git a/include/linux/kexec.h b/include/linux/kexec.h
index 182e0c11b87b..791e65829f86 100644
--- a/include/linux/kexec.h
+++ b/include/linux/kexec.h
@@ -407,7 +407,7 @@ extern int kimage_crash_copy_vmcoreinfo(struct kimage *image);
 extern struct kimage *kexec_image;
 extern struct kimage *kexec_crash_image;
 
-bool kexec_load_permitted(void);
+bool kexec_load_permitted(int kexec_image_type);
 
 #ifndef kexec_flush_icache_page
 #define kexec_flush_icache_page(page)
diff --git a/kernel/kexec.c b/kernel/kexec.c
index ce1bca874a8d..92d301f98776 100644
--- a/kernel/kexec.c
+++ b/kernel/kexec.c
@@ -190,10 +190,12 @@ static int do_kexec_load(unsigned long entry, unsigned long nr_segments,
 static inline int kexec_load_check(unsigned long nr_segments,
 				   unsigned long flags)
 {
+	int image_type = (flags & KEXEC_ON_CRASH) ?
+			 KEXEC_TYPE_CRASH : KEXEC_TYPE_DEFAULT;
 	int result;
 
 	/* We only trust the superuser with rebooting the system. */
-	if (!kexec_load_permitted())
+	if (!kexec_load_permitted(image_type))
 		return -EPERM;
 
 	/* Permit LSMs and IMA to fail the kexec */
diff --git a/kernel/kexec_core.c b/kernel/kexec_core.c
index a1efc70f4158..951541d78ca8 100644
--- a/kernel/kexec_core.c
+++ b/kernel/kexec_core.c
@@ -926,10 +926,64 @@ int kimage_load_segment(struct kimage *image,
 	return result;
 }
 
+struct kexec_load_limit {
+	/* Mutex protects the limit count. */
+	struct mutex mutex;
+	int limit;
+};
+
+static struct kexec_load_limit load_limit_reboot = {
+	.mutex = __MUTEX_INITIALIZER(load_limit_reboot.mutex),
+	.limit = -1,
+};
+
+static struct kexec_load_limit load_limit_panic = {
+	.mutex = __MUTEX_INITIALIZER(load_limit_panic.mutex),
+	.limit = -1,
+};
+
 struct kimage *kexec_image;
 struct kimage *kexec_crash_image;
 static int kexec_load_disabled;
+
 #ifdef CONFIG_SYSCTL
+static int kexec_limit_handler(struct ctl_table *table, int write,
+			       void *buffer, size_t *lenp, loff_t *ppos)
+{
+	struct kexec_load_limit *limit = table->data;
+	int val;
+	struct ctl_table tmp = {
+		.data = &val,
+		.maxlen = sizeof(val),
+		.mode = table->mode,
+	};
+	int ret;
+
+	if (write) {
+		ret = proc_dointvec(&tmp, write, buffer, lenp, ppos);
+		if (ret)
+			return ret;
+
+		if (val < 0)
+			return -EINVAL;
+
+		mutex_lock(&limit->mutex);
+		if (limit->limit != -1 && val >= limit->limit)
+			ret = -EINVAL;
+		else
+			limit->limit = val;
+		mutex_unlock(&limit->mutex);
+
+		return ret;
+	}
+
+	mutex_lock(&limit->mutex);
+	val = limit->limit;
+	mutex_unlock(&limit->mutex);
+
+	return proc_dointvec(&tmp, write, buffer, lenp, ppos);
+}
+
 static struct ctl_table kexec_core_sysctls[] = {
 	{
 		.procname	= "kexec_load_disabled",
@@ -941,6 +995,18 @@ static struct ctl_table kexec_core_sysctls[] = {
 		.extra1		= SYSCTL_ONE,
 		.extra2		= SYSCTL_ONE,
 	},
+	{
+		.procname	= "kexec_load_limit_panic",
+		.data		= &load_limit_panic,
+		.mode		= 0644,
+		.proc_handler	= kexec_limit_handler,
+	},
+	{
+		.procname	= "kexec_load_limit_reboot",
+		.data		= &load_limit_reboot,
+		.mode		= 0644,
+		.proc_handler	= kexec_limit_handler,
+	},
 	{ }
 };
 
@@ -952,13 +1018,30 @@ static int __init kexec_core_sysctl_init(void)
 late_initcall(kexec_core_sysctl_init);
 #endif
 
-bool kexec_load_permitted(void)
+bool kexec_load_permitted(int kexec_image_type)
 {
+	struct kexec_load_limit *limit;
+
 	/*
 	 * Only the superuser can use the kexec syscall and if it has not
 	 * been disabled.
 	 */
-	return capable(CAP_SYS_BOOT) && !kexec_load_disabled;
+	if (!capable(CAP_SYS_BOOT) || kexec_load_disabled)
+		return false;
+
+	/* Check limit counter and decrease it.*/
+	limit = (kexec_image_type == KEXEC_TYPE_CRASH) ?
+		&load_limit_panic : &load_limit_reboot;
+	mutex_lock(&limit->mutex);
+	if (!limit->limit) {
+		mutex_unlock(&limit->mutex);
+		return false;
+	}
+	if (limit->limit != -1)
+		limit->limit--;
+	mutex_unlock(&limit->mutex);
+
+	return true;
 }
 
 /*
diff --git a/kernel/kexec_file.c b/kernel/kexec_file.c
index 29efa43ea951..da9cfbbb0cbd 100644
--- a/kernel/kexec_file.c
+++ b/kernel/kexec_file.c
@@ -326,11 +326,13 @@ SYSCALL_DEFINE5(kexec_file_load, int, kernel_fd, int, initrd_fd,
 		unsigned long, cmdline_len, const char __user *, cmdline_ptr,
 		unsigned long, flags)
 {
-	int ret = 0, i;
+	int image_type = (flags & KEXEC_FILE_ON_CRASH) ?
+			 KEXEC_TYPE_CRASH : KEXEC_TYPE_DEFAULT;
 	struct kimage **dest_image, *image;
+	int ret = 0, i;
 
 	/* We only trust the superuser with rebooting the system. */
-	if (!kexec_load_permitted())
+	if (!kexec_load_permitted(flags & KEXEC_FILE_ON_CRASH))
 		return -EPERM;
 
 	/* Make sure we have a legal set of flags */
@@ -342,11 +344,12 @@ SYSCALL_DEFINE5(kexec_file_load, int, kernel_fd, int, initrd_fd,
 	if (!kexec_trylock())
 		return -EBUSY;
 
-	dest_image = &kexec_image;
-	if (flags & KEXEC_FILE_ON_CRASH) {
+	if (image_type == KEXEC_TYPE_CRASH) {
 		dest_image = &kexec_crash_image;
 		if (kexec_crash_image)
 			arch_kexec_unprotect_crashkres();
+	} else {
+		dest_image = &kexec_image;
 	}
 
 	if (flags & KEXEC_FILE_UNLOAD)

-- 
2.39.0.314.g84b9a713c41-goog-b4-0.11.0-dev-696ae
