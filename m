Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C50C52F7EE5
	for <linux-doc@vger.kernel.org>; Fri, 15 May 2026 17:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778865640; cv=none; b=l3Z4qHRIRg5EYPRmGDyVyjlDz40mtug7p1+yMP/alrrFwHpmlTOn8Sk64dIGaTP2V1xFmr7N591XkipuqInV1TrzDy3MGBMvbKhn0GjLRP4wBqioGCMK2FMkyfjnlWrywhfGLY7rRKiEcAeZb4xbQxFcUYnZY1JnFj4WTixvp0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778865640; c=relaxed/simple;
	bh=m8YmuvX4TDlVB6bnCnutEvfah5hoA7EjIjLtjUPBIL4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XUY9Wd/zzcJNnDYInH12ry4JMLbzW5t2ZLKcvcqaOQzKjrsMiiu9eE9f72Ci8ub1NkXamOxNmGAyKsVrUgRQcPrXcBOAjrXh+qwtbw1tJDhnFu9FpuGAaAxaHYhlLQfwJo+JO4Hav3UDk+INh7w2fo0lp7i8tcoGqSYhfZvh78U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=SCfKnRyq; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="SCfKnRyq"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48896199cbaso465965e9.1
        for <linux-doc@vger.kernel.org>; Fri, 15 May 2026 10:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1778865637; x=1779470437; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j4eG0JthOt+VtfdBCLTuen3JmdYDXA8kaFqzMdS8pq8=;
        b=SCfKnRyqxevqPpByhKuCauzZGod4kQtwPsIHSh8qxk7AQkB9wAZ3ZbpbK5dgUE5TM+
         B0PW4SqUF8oCDUN3Gxu67xdfkcLULeox+yhzpezdwOmNQH8H5T52lBVKXJnLTzYYEQvG
         o3btQQDLqQcou7RD0ZsVT+hn5mEaNxfm7f426evVasFfhLmhHCUFfBw9DBk79Y4/VwU0
         uZF0ngsodAM4pdfW0uaqn7IAFbMQPGhGrTuc/PVgilSA020esWbVCTq8yJn9D6FrfBoc
         A5PIQ3yafdeb9+QWjyidQBxgBqkbROQKkEEnJEi+pY3gfbijW+OaFIvpKd90UvCiwBup
         O+YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778865637; x=1779470437;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j4eG0JthOt+VtfdBCLTuen3JmdYDXA8kaFqzMdS8pq8=;
        b=E1lNdjX2cU9vMq4CP4J8UqCjtpaHbwZSx6gNfUYrIgCgiMEp1A5Cg1m34bFWnCKZ1V
         dHUVlIBAvJDni5VGy3+YvEwyh1i8uXXgdeTv1ajISPux2ejHbNuryMkdrLyKWmkG4owX
         eqRiCZSCn68MTOUCBpZ6meoOY19bHEgvdwGreSvRSs4aExQjfhcdx3FFm/XwoTj69e4+
         rFekaOFLH/YPfRNXNaveaeSrqwZg98uKq0trMwcTxObGAlGox2/smXUurEGKqHiZY9Ua
         2dVUii7DIA2Zfh9HzzPWXsHmyaI6KZFfVSeq6qtdiq3r/aFP39kKE5/jfJUm8Ev873vB
         a3hA==
X-Gm-Message-State: AOJu0YxMl4DrVgupuyWTP2jFOiZPzBRCss/rIOr9NAS6rN9Ey7jnJQEl
	7xb5OtN1qWNZT2qYD1CpQ7VG314doDDFA2LfbTrn9TiAP79oxps3ub8ML4WJybsIwLR+8gCPJu2
	pA2g=
X-Gm-Gg: Acq92OHodpH+SFLo9RdBA8HnGNZw+l/Aprx686cqe15x8x5AHf+47N6Muejhzz3BeNG
	+iSEiZi/Wzl3ANXyYEc77oYvgGADXWXMLnZacHqTCi5oy//MkJTdmvTD1o2s8xrJJXDq1qsT0QT
	7w5c+rsx69qoWxU/weVqwkB6pIYMACFKtaTAMM0W4w058orOtUeAfqC7cAEX9haSnDTxC+QIbHb
	zPL8u2Z6Bnh83AJ3ZEVxaxP6VjYAU46ityaT+7hujDtJSJ9vnCk2SVaeff3Wv/oHuFReijDFHkH
	34xIHwHzJSNAdPTKago4QSbIRFztaSTJYdTuLLF2h6BE4z+RZls0d+QgPMRFANvjuywUpKF6QHK
	cn7Y7NC6aRdci+T1EEFOXGTyR5jsOBDif7qjynYP3wxFcQiXaLIzCDjY0I5nsG505WwYyr3IJ3Y
	UFu56/HAIzaXUVWYv7CiL3eYti68W8dtycDQCzLyo=
X-Received: by 2002:a05:600c:3b21:b0:48a:f18:ece4 with SMTP id 5b1f17b1804b1-48fe6514dd6mr67304695e9.24.1778865636698;
        Fri, 15 May 2026 10:20:36 -0700 (PDT)
Received: from [192.168.2.212] ([185.209.196.194])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe537ccf5sm77251515e9.14.2026.05.15.10.20.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 10:20:36 -0700 (PDT)
From: Michal Gorlas <michal.gorlas@9elements.com>
Date: Fri, 15 May 2026 19:20:20 +0200
Subject: [PATCH 2/2] module: restrict autoload to CAP_SYS_ADMIN if
 CONFIG_MODULE_RESTRICT_AUTOLOAD
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-autoload_restrict-v1-2-40b7c03ddd04@9elements.com>
References: <20260515-autoload_restrict-v1-0-40b7c03ddd04@9elements.com>
In-Reply-To: <20260515-autoload_restrict-v1-0-40b7c03ddd04@9elements.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
 Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
 Aaron Tomlin <atomlin@atomlin.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-modules@vger.kernel.org, Michal Gorlas <michal.gorlas@9elements.com>
X-Mailer: b4 0.15.0

Restrict module auto-loading to CAP_SYS_ADMIN if
CONFIG_MODULE_RESTRICT_AUTOLOAD is enabled, cmdline parameter
modrestrict=true, or kernel.modrestrict=1 is set with sysctl.

Signed-off-by: Michal Gorlas <michal.gorlas@9elements.com>
---
 kernel/module/internal.h |  1 +
 kernel/module/kmod.c     |  5 +++++
 kernel/module/main.c     | 11 +++++++++++
 3 files changed, 17 insertions(+)

diff --git a/kernel/module/internal.h b/kernel/module/internal.h
index 061161cc79d9..496d8703f0c6 100644
--- a/kernel/module/internal.h
+++ b/kernel/module/internal.h
@@ -46,6 +46,7 @@ struct kernel_symbol {
 
 extern struct mutex module_mutex;
 extern struct list_head modules;
+extern bool module_autoload_restrict;
 
 extern const struct module_attribute *const modinfo_attrs[];
 extern const size_t modinfo_attrs_count;
diff --git a/kernel/module/kmod.c b/kernel/module/kmod.c
index a25dccdf7aa7..58b28c23f571 100644
--- a/kernel/module/kmod.c
+++ b/kernel/module/kmod.c
@@ -156,6 +156,11 @@ int __request_module(bool wait, const char *fmt, ...)
 	if (ret)
 		return ret;
 
+	if (module_autoload_restrict && !capable(CAP_SYS_ADMIN)) {
+		pr_alert("denied attempt to auto-load module %s\n", module_name);
+		return -EPERM;
+	}
+
 	ret = down_timeout(&kmod_concurrent_max, MAX_KMOD_ALL_BUSY_TIMEOUT * HZ);
 	if (ret) {
 		pr_warn_ratelimited("request_module: modprobe %s cannot be processed, kmod busy with %d threads for more than %d seconds now",
diff --git a/kernel/module/main.c b/kernel/module/main.c
index 46dd8d25a605..a293b75ce9b7 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -130,6 +130,10 @@ static void mod_update_bounds(struct module *mod)
 static int modules_disabled;
 core_param(nomodule, modules_disabled, bint, 0);
 
+/* Restrict auto-loading? */
+bool module_autoload_restrict = IS_ENABLED(CONFIG_MODULE_RESTRICT_AUTOLOAD);
+core_param(modrestrict, module_autoload_restrict, bool, 0);
+
 static const struct ctl_table module_sysctl_table[] = {
 	{
 		.procname	= "modprobe",
@@ -148,6 +152,13 @@ static const struct ctl_table module_sysctl_table[] = {
 		.extra1		= SYSCTL_ONE,
 		.extra2		= SYSCTL_ONE,
 	},
+	{
+		.procname	= "modrestrict",
+		.data		= &module_autoload_restrict,
+		.maxlen		= sizeof(bool),
+		.mode		= 0644,
+		.proc_handler   = proc_dobool,
+	},
 };
 
 static int __init init_module_sysctl(void)

-- 
2.54.0

