Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9095AC433FE
	for <linux-doc@archiver.kernel.org>; Mon, 14 Nov 2022 13:19:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237593AbiKNNTz (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 14 Nov 2022 08:19:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237996AbiKNNTi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 14 Nov 2022 08:19:38 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4ACB2BB2D
        for <linux-doc@vger.kernel.org>; Mon, 14 Nov 2022 05:19:08 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id ud5so28253207ejc.4
        for <linux-doc@vger.kernel.org>; Mon, 14 Nov 2022 05:19:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YBDqrK6ZdWq2OzrZLHJQraMMoPoinvhQP0W8u+3GcTk=;
        b=l+SRhUtVZVJ0JfZqzT7bi1gWoeK5gqgOT1cfNOL0iydr9/ACO4IBVNXucMwfahDafq
         CcjyAjAzeje8N09iCbh4cC4KqMlln1mN4sbG6gBrvQZZ4jUrmqPsT0sGID2YHiZfN3pG
         CoywAWz6UY5pqFVZHhmTJBgeSD1qak/cqkiWI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YBDqrK6ZdWq2OzrZLHJQraMMoPoinvhQP0W8u+3GcTk=;
        b=dS8A5fi2hnnx/yHhL3ewUNA2Mro0yVuNKurxVtsAw2F5fr22JjxsaGpP95EtevRdV0
         FAjlobXdNhDzlSWGVNu4mE7Zh1f2saPdn+pX72fuc9dT4va9+qhEDVNw0b4mThHzGJIq
         c+qNUi7YXtqRTncmy+qzzIQCjOq7VsTSD365w28MaKTU1SkO9PTAUJIH4rkb2JRlOc+d
         HdRKmLwe5ap8ZJvDzveCK6fBpnqyCzednyGrjdAVLctjQ06K1I6xQJWNFIWWMDCV2zP6
         HomX3oFH2QUcxlvFpjHNL1u7o9eBrMnnMyIQKsNbm/A7I+J2hq0rl1qUF4IVopnQ32+o
         zQjQ==
X-Gm-Message-State: ANoB5pkc6OMUSneaK1b+zqMFsJdgiMp7m2lDIil5c70mjWZ/527TbKqu
        xT5qw/rAQAP24gMAFRNDOAnxlg==
X-Google-Smtp-Source: AA0mqf5XEPlCqCerbKFCDqW7Ii2ijdR3SvE9imxd10P/fR2NMfFIZ1DEoLE/yUsvtR/op0wt/ZWzBA==
X-Received: by 2002:a17:906:f208:b0:7ae:2277:9fec with SMTP id gt8-20020a170906f20800b007ae22779fecmr9990574ejb.623.1668431947306;
        Mon, 14 Nov 2022 05:19:07 -0800 (PST)
Received: from alco.roam.corp.google.com ([2620:0:1059:10:c205:5c4e:7456:c8cc])
        by smtp.gmail.com with ESMTPSA id g13-20020a50ec0d000000b0045b3853c4b7sm4802061edr.51.2022.11.14.05.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 05:19:06 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Mon, 14 Nov 2022 14:18:39 +0100
Subject: [PATCH v1 2/2] kexec: Introduce kexec_reboot_disabled
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221114-disable-kexec-reset-v1-2-fb51d20cf871@chromium.org>
References: <20221114-disable-kexec-reset-v1-0-fb51d20cf871@chromium.org>
In-Reply-To: <20221114-disable-kexec-reset-v1-0-fb51d20cf871@chromium.org>
To:     Eric Biederman <ebiederm@xmission.com>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        linux-kernel@vger.kernel.org, kexec@lists.infradead.org,
        Ross Zwisler <zwisler@kernel.org>, linux-doc@vger.kernel.org,
        "Joel Fernandes (Google)" <joel@joelfernandes.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.11.0-dev-d93f8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3808; i=ribalda@chromium.org;
 h=from:subject:message-id; bh=dblSayUsSfEKi8F2aGC75NJql5jVZbhwpLBwKIyAUtI=;
 b=owEBbQKS/ZANAwAKAdE30T7POsSIAcsmYgBjckBFo6eu9Gtv5tVzghpwemmGVrmtXYcngm/W6RxM
 3Cx6NGiJAjMEAAEKAB0WIQREDzjr+/4oCDLSsx7RN9E+zzrEiAUCY3JARQAKCRDRN9E+zzrEiKEID/
 4te8B7uFehLdBDS2AiqR+VMunRK2lzXEeuVXblaP3r9ExwUMnGbUtAWttF2wal25J7+bvvo5sQnQWQ
 /BbODeZY+8zGMtVVZGYXtwZ9uGeX53xvh1fheLmkHVHxuKwB7TC3SsPxSIhDj+6M+9YbmEbrJe1YB5
 VcCdjYyjDHo9YFjKOXDIQ/zrsYzhCpCX1xND0zKYlIe58zE+LkT6EGs47rw9I0GUdqRvbWDIa6MrlO
 cKE8iQAOX9ihR5wGRJVBO1O8+GBbq+3x7xfeEo4qYfJv64ne4t/TUXRAajUAg8mIZRlWp0/r9vAqB4
 siXhXif6Sbr0P7D3ND5d5/e3A7vCy4jnIEAFnyoA2bMZp8lPtKa0OZ/CkIYVygBbymXYiwgMmqhs89
 01cb4w3UOj810NTpXb1nR/D5wnH1A5jtHvp+09F+Js/8q5GPEDGqdaglAlE2fnATD07PdX/GD4xsDz
 vsqnw7M4vpGHQuPPzFizXXK8vTJIcJnmVpZJG7nX+s3QHH7FgAaUFC6yKYcFw/5aKqYEtHD1rCuLBf
 xPmpZ8s6CIzKx0kfixlh9mmR+pbwFC9QqULyccreqPocelwhaHSZXUZRvABk1AAkrFWRt39ChNVEOr
 g7LSeqsxViMsBQgX/QuEcRq4LGx/aHZOplyG/1DFFpu9P86p7zYC8a3U7sdw==
X-Developer-Key: i=ribalda@chromium.org; a=openpgp;
 fpr=9EC3BB66E2FC129A6F90B39556A0D81F9F782DA9
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Create a new toogle that disables LINUX_REBOOT_CMD_KEXEC, reducing the
attack surface to a system.

Without this toogle, an attacker can only reboot into a different kernel
if they can create a panic().

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
index 97394bd9d065..25d019682d33 100644
--- a/Documentation/admin-guide/sysctl/kernel.rst
+++ b/Documentation/admin-guide/sysctl/kernel.rst
@@ -462,6 +462,17 @@ altered.
 Generally used together with the `modules_disabled`_ sysctl.
 
 
+kexec_reboot_disabled
+=====================
+
+A toggle indicating if ``LINUX_REBOOT_CMD_KEXEC`` has been disabled.
+This value defaults to 0 (false: ``LINUX_REBOOT_CMD_KEXEC`` enabled),
+but can be set to 1 (true: ``LINUX_REBOOT_CMD_KEXEC`` disabled).
+Once true, kexec can no longer be used for reboot and the toggle
+cannot be set back to false.
+This toggle does not affect the use of kexec during a crash.
+
+
 kptr_restrict
 =============
 
diff --git a/include/linux/kexec.h b/include/linux/kexec.h
index 41a686996aaa..15c3fad8918b 100644
--- a/include/linux/kexec.h
+++ b/include/linux/kexec.h
@@ -407,6 +407,7 @@ extern int kimage_crash_copy_vmcoreinfo(struct kimage *image);
 extern struct kimage *kexec_image;
 extern struct kimage *kexec_crash_image;
 extern int kexec_load_disabled;
+extern int kexec_reboot_disabled;
 
 #ifndef kexec_flush_icache_page
 #define kexec_flush_icache_page(page)
diff --git a/kernel/kexec.c b/kernel/kexec.c
index cb8e6e6f983c..43063f803d81 100644
--- a/kernel/kexec.c
+++ b/kernel/kexec.c
@@ -196,6 +196,10 @@ static inline int kexec_load_check(unsigned long nr_segments,
 	if (!capable(CAP_SYS_BOOT) || kexec_load_disabled)
 		return -EPERM;
 
+	/* Check if the system admin has disabled kexec reboot. */
+	if (!(flags & KEXEC_ON_CRASH) && kexec_reboot_disabled)
+		return -EPERM;
+
 	/* Permit LSMs and IMA to fail the kexec */
 	result = security_kernel_load_data(LOADING_KEXEC_IMAGE, false);
 	if (result < 0)
diff --git a/kernel/kexec_core.c b/kernel/kexec_core.c
index ca2743f9c634..fe82e2525705 100644
--- a/kernel/kexec_core.c
+++ b/kernel/kexec_core.c
@@ -929,6 +929,7 @@ int kimage_load_segment(struct kimage *image,
 struct kimage *kexec_image;
 struct kimage *kexec_crash_image;
 int kexec_load_disabled;
+int kexec_reboot_disabled;
 #ifdef CONFIG_SYSCTL
 static struct ctl_table kexec_core_sysctls[] = {
 	{
@@ -941,6 +942,16 @@ static struct ctl_table kexec_core_sysctls[] = {
 		.extra1		= SYSCTL_ONE,
 		.extra2		= SYSCTL_ONE,
 	},
+	{
+		.procname	= "kexec_reboot_disabled",
+		.data		= &kexec_reboot_disabled,
+		.maxlen		= sizeof(int),
+		.mode		= 0644,
+		/* only handle a transition from default "0" to "1" */
+		.proc_handler	= proc_dointvec_minmax,
+		.extra1		= SYSCTL_ONE,
+		.extra2		= SYSCTL_ONE,
+	},
 	{ }
 };
 
@@ -1138,7 +1149,7 @@ int kernel_kexec(void)
 
 	if (!kexec_trylock())
 		return -EBUSY;
-	if (!kexec_image) {
+	if (!kexec_image || kexec_reboot_disabled) {
 		error = -EINVAL;
 		goto Unlock;
 	}
diff --git a/kernel/kexec_file.c b/kernel/kexec_file.c
index 45637511e0de..583fba6de5cb 100644
--- a/kernel/kexec_file.c
+++ b/kernel/kexec_file.c
@@ -333,6 +333,11 @@ SYSCALL_DEFINE5(kexec_file_load, int, kernel_fd, int, initrd_fd,
 	if (!capable(CAP_SYS_BOOT) || kexec_load_disabled)
 		return -EPERM;
 
+	/* Check if the system admin has disabled kexec reboot. */
+	if (!(flags & (KEXEC_FILE_ON_CRASH | KEXEC_FILE_UNLOAD))
+	    && kexec_reboot_disabled)
+		return -EPERM;
+
 	/* Make sure we have a legal set of flags */
 	if (flags != (flags & KEXEC_FILE_FLAGS))
 		return -EINVAL;

-- 
b4 0.11.0-dev-d93f8
