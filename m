Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F0323655D5
	for <linux-doc@vger.kernel.org>; Thu,  2 Jul 2026 16:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783010498; cv=none; b=Z//8VeyIKvOXF/GV/1gWE8X2NPd4kvTpgRS9wLfJQaIfAqh7NZCoxI3UbGolABV0J+OE4e7aWGVzLfNudSf7JtaUZwhijnwzGMKn+0PKLuJXJsIk5gsq1NpsufO91au3V/n9IsGeuYEPI0oIDsieQPv8MJYOLtKFFH6YvmnwXpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783010498; c=relaxed/simple;
	bh=4KqGsTMMsJJljJeP6ttyEAUpGBzmOi4l2xwVMuxhVXY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bM/F7h2azIld4U8Obc5zJQ26Fy0TEgZUlIwNu+fPTJ5puZf3Iy0iiAKTiQptF9rERxzWMCz52K/g4A0fdcq1DZjfTJaROYm7jbrTpM6aL1AyMU3Uw+6C1YvRu+9os4K782VmubviF3PGe/aY+pERt0am8XrcT5ialGAKD1F/ppE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m8ozBAjd; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m8ozBAjd"
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-6a30bcadd96so1055380eaf.2
        for <linux-doc@vger.kernel.org>; Thu, 02 Jul 2026 09:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783010488; x=1783615288; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SGvNxIePFhdPaKSxZVsqeF3+4BUaix9pbxYEBuSqfXA=;
        b=m8ozBAjdW0gKnk+mNKPkfhUwtdxSChpOQTJIAcDL30tJgGPhr33qypy8px9UE7Zu8b
         LnP7hYgc4/uijOyxp/Z/MssgjEB2eJCaGvVEIuMLWixsPAQtaqz2iOrClSGJgReMSHeu
         UbqLC8iT53AeYa5FD+vRU5pKhirioV0o7HE2+MbsT0tDqMZx9nl/m5x0uz3oqCdsuaZC
         gfZzwU1E/zLPJHBbz8lD2n/8CfIaC2I0rXN0M69fO6nj/tAN5zqemndwg4bmzk5bgjVc
         Wh5VQ0G56XBqUDKWyjkAKaFcz1r/BSdIen/KKbC8d87kxQyjLyDAhHh1H5tbG9BXeGI4
         vetQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783010488; x=1783615288;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SGvNxIePFhdPaKSxZVsqeF3+4BUaix9pbxYEBuSqfXA=;
        b=Uanb52xrK1alstb3X7O/XxZKx8QAGfJTfbr9wfOOxXuzQPElpjGgB4q2iCP+ecsmG9
         EGrjDxj8cQT06NhVaw89x2usEprjbkP/SBi6WJpkVWe6vpOGDC2Y3oHOjOLrub+jZdIO
         6HEfhA4KkkgCA6MjYQHA0wwFZB6gATTqZ/fkgrAqJLE2xtxu3+hk/AG9Mirz7BOtBSD6
         tNVFwX+18At1RpDCIy4BVxkIatc9Bz+TroRIFK63aGYdE95lTS29wvrqusq2HYRgprYj
         L4bmJ+oZ7puphcXbC2s/VCkOkHQbe+lnRPJ7PeFWncBoKIzXoNcLTVuSwt6o8FmHIQqJ
         HI0Q==
X-Forwarded-Encrypted: i=1; AFNElJ8QugRv9+qPK731ue+uWgnKG1CHRaDx9SWzVegGqws1e1V2lYp5xsw9XV/hTtOcQVoN2EumIbhW9/s=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHC9iqrrCWnEPuvpKXr6plJvEwsQadACUoitueQXlFkxFhgxZT
	Rr36N6C6zNxDPO2lr3LVzRAXdwGBgcFyRhaCicR4tA2EVKDN021Ry4Xt
X-Gm-Gg: AfdE7cl60Vl4+jT1sy5x+TS9RwAwKjlkZt2vkEs+M25WOt1B7JxDyXzE6Fz1MbsUfKD
	dMLi/pvHNWocwVEG9IcRL04CZGuWOkG6tmn1aFWuvPn/eylqFDvUKuABRm3YYwMZtjI+NSxqZRx
	FhaW7aYcYNYIUZRe55FXouIMg76j8Y0RpnjG63JqLEndg+WnR/XXl+ybchhRSkrELUJV7t2S3/A
	GWT2uDQQolsqkbAo/crpkn9njEZxj0tgQR/N+f0q6fIeI5p2DlBRFs8lBVxbzxrgm4Y5NZw/9h0
	R6ASHcM6E+MTo+ezvtz8R7mjK7A4Wv7v8Rnpm1eVeRIdChhsp8xKDplLIqMkjeW6PzvvvDdlr7w
	6OLXp3GVsBxgS/tulGosAqlpSXb+pROia687diN2Y2sLW8viajXc5VvYCjfu79lq6oAlVYy62SE
	ZTlO2jwQjlUYF5PFw0JK0SA3ve+iDNjzfrTKXu6VQ8tqnZjWEaoFg=
X-Received: by 2002:a05:6820:c2cc:20b0:6a3:ad2:ce12 with SMTP id 006d021491bc7-6a30ad2d1a0mr2853945eaf.57.1783010488358;
        Thu, 02 Jul 2026 09:41:28 -0700 (PDT)
Received: from [192.168.0.245] (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 586e51a60fabf-44cbec93702sm3189652fac.12.2026.07.02.09.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 09:41:27 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Date: Thu, 02 Jul 2026 10:41:01 -0600
Subject: [PATCH v5 09/18] dyndbg: use KBUILD_MODFILE for unique builtin
 module names
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-dd-maint-2-v5-9-24f22b052bf2@gmail.com>
References: <20260702-dd-maint-2-v5-0-24f22b052bf2@gmail.com>
In-Reply-To: <20260702-dd-maint-2-v5-0-24f22b052bf2@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>, 
 Jason Baron <jbaron@akamai.com>, Jim Cromie <jim.cromie@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Arnd Bergmann <arnd@arndb.de>, Luis Chamberlain <mcgrof@kernel.org>, 
 Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
 Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-arch@vger.kernel.org, 
 linux-modules@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783010473; l=8685;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=4KqGsTMMsJJljJeP6ttyEAUpGBzmOi4l2xwVMuxhVXY=;
 b=S7cMEnh4bnTDSy0NYZbaX3REywJOWghDIZuuvaLC8zdTBpta5JeLLPgbN+RQL4xybnXtjy/Ho
 neHRDApZSIPBL88bVEPtr7KDY5CpZAxRfYhQ13YQtvDiyfvba80iTrT
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=

Historically dynamic-debug gets its module names from KBUILD_MODNAME.
This works well for loadable modules, as the module loader has always
required them to have unique names, but for builtins it is basically
kbasename(srcfile), which sadly gives us many modules named "main".

IOW, it makes this ambiguous:
  bash-5.3# echo module main +m > /proc/dynamic_debug/control

since it would affect all 4 independent modules named main:
  bash-5.3# ddgrep =m
  init/main.c:1265 [main]initcall_blacklist =m "blacklisting initcall %s\n"
  kernel/power/main.c:49 [main]pm_restore_gfp_mask =m "GFP mask restored\n"
  kernel/module/main.c:2862 [main]move_module =m "\t0x%lx 0x%.8lx %s\n"
  drivers/base/power/main.c:149 [main]device_pm_add =m "Adding info for %s:%s\n"

We can improve this by using KBUILD_MODFILE for dyndbg's modname in
builtins (which is unique), and KBUILD_MODNAME for loadables (which is
already required/guaranteed to be unique by module-loader):

The above control-file entries then become:
  init/main.c:1265 [init/main]initcall_blacklist ...
  kernel/power/main.c:49 [kernel/power/main]pm_restore_gfp_mask ...
  kernel/module/main.c:2862 [kernel/module/main]move_module ...
  drivers/base/power/main.c:149 [drivers/base/power/main]device_pm_add ...

While this is a user visible change; [params] becomes [kernel/params]
etc, it is not a behavior change; we now match the query-module
against the subsystem/module name or its kbasename (the
simple-modname), which as before, matches all 4 modules.

This allows queries to be specific when desired: "module init/main",
while preserving the existing meaning of "module main"

The deeper reason for this change is not obvious.  If any builtin
"main" module were to add a classmap, it would attach to all "main"
modules.  If 2 "main" modules defined separate classmaps, both modules
would inadvertently share both classmaps.  Since classmaps map
classnames to 0..62, and independently defined classmaps are most
likely to start at 0 (unless author is planning to share the 0..62
range with other classmaps), we have a setup for later reserved range
conflicts.  Having unique names prevents future conflicts.

This solution isn't perfect:
1. it changes displayed [params] to [kernel/params] etc
2. its mostly redundant with "filename */main.*"
3. Ideally, queries like "module power", "module module", "module
   base/power" might be better but would break old queries.

Adjust Documentation with "simple modname" and "subsystem modname".

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
v5: move ahead of array-slice patch to silence sashiko complaint about it
v4: call match_wildcard_hyphen() to allow dash vs underscore modname equivalence
v3: use KBUILD_MODFILE to give unique modnames for builtins
---
 Documentation/admin-guide/dynamic-debug-howto.rst | 42 +++++++++++++----------
 include/linux/dynamic_debug.h                     | 15 ++++++--
 lib/dynamic_debug.c                               |  3 +-
 3 files changed, 38 insertions(+), 22 deletions(-)

diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
index 9c2f096ed1d8..99bbae37d34e 100644
--- a/Documentation/admin-guide/dynamic-debug-howto.rst
+++ b/Documentation/admin-guide/dynamic-debug-howto.rst
@@ -38,12 +38,12 @@ You can view the currently configured behaviour in the *prdbg* catalog::
 
   :#> head -n7 /proc/dynamic_debug/control
   # filename:lineno [module]function flags format
-  init/main.c:1179 [main]initcall_blacklist =_ "blacklisting initcall %s\n"
-  init/main.c:1218 [main]initcall_blacklisted =_ "initcall %s blacklisted\n"
-  init/main.c:1424 [main]run_init_process =_ "  with arguments:\n"
-  init/main.c:1426 [main]run_init_process =_ "    %s\n"
-  init/main.c:1427 [main]run_init_process =_ "  with environment:\n"
-  init/main.c:1429 [main]run_init_process =_ "    %s\n"
+  init/main.c:1179 [init/main]initcall_blacklist =_ "blacklisting initcall %s\n"
+  init/main.c:1218 [init/main]initcall_blacklisted =_ "initcall %s blacklisted\n"
+  init/main.c:1424 [init/main]run_init_process =_ "  with arguments:\n"
+  init/main.c:1426 [init/main]run_init_process =_ "    %s\n"
+  init/main.c:1427 [init/main]run_init_process =_ "  with environment:\n"
+  init/main.c:1429 [init/main]run_init_process =_ "    %s\n"
 
 The 3rd space-delimited column shows the current flags, preceded by
 a ``=`` for easy use with grep/cut. ``=p`` shows enabled callsites.
@@ -59,10 +59,10 @@ query/commands to the control file.  Example::
 
   :#> ddcmd '-p; module main func run* +p'
   :#> grep =p /proc/dynamic_debug/control
-  init/main.c:1424 [main]run_init_process =p "  with arguments:\n"
-  init/main.c:1426 [main]run_init_process =p "    %s\n"
-  init/main.c:1427 [main]run_init_process =p "  with environment:\n"
-  init/main.c:1429 [main]run_init_process =p "    %s\n"
+  init/main.c:1424 [init/main]run_init_process =p "  with arguments:\n"
+  init/main.c:1426 [init/main]run_init_process =p "    %s\n"
+  init/main.c:1427 [init/main]run_init_process =p "  with environment:\n"
+  init/main.c:1429 [init/main]run_init_process =p "    %s\n"
 
 Error messages go to console/syslog::
 
@@ -161,17 +161,21 @@ file
 	file kernel/freezer.c	# ie column 1 of control file
 	file drivers/usb/*	# all callsites under it
 	file inode.c:start_*	# parse :tail as a func (above)
-	file inode.c:1-100	# parse :tail as a line-range (above)
+	file inode.c:1-100	# parse :tail as a line-range (below)
 
 module
-    The given string is compared against the module name
-    of each callsite.  The module name is the string as
-    seen in ``lsmod``, i.e. without the directory or the ``.ko``
-    suffix and with ``-`` changed to ``_``.  Examples::
-
-	module sunrpc
-	module nfsd
-	module drm*	# both drm, drm_kms_helper
+    The query string is compared against the subsystem module name of
+    each callsite, as shown in the control file, or its simple name.
+    The simple module name is the string as seen in ``lsmod``,
+    i.e. without the directory or the ``.ko`` suffix and with ``-``
+    changed to ``_``.
+    Examples::
+
+        module nfsd        # simple modname (as from lsmod)
+	module init/main   # subsystem modname (as in control file)
+	module */main	   # any subsystem ending in main
+        module main	   # simple modname, selects same as above
+	module drm*	   # both drm, drm_kms_helper
 
 format
     The given string is searched for in the dynamic debug format
diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 9ae1accb9bf6..da9e5c35bc43 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -10,6 +10,17 @@
 
 #define __DDEBUG_ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))
 
+/*
+ * Pick the best name for the module:
+ * KBUILD_MODFILE includes the path (e.g., drivers/usb/core/usbcore) for built-ins.
+ * Fall back to KBUILD_MODNAME for modules (loader requires unique names).
+ */
+#ifdef KBUILD_MODFILE
+# define DDEBUG_MODNAME KBUILD_MODFILE
+#else
+# define DDEBUG_MODNAME KBUILD_MODNAME
+#endif
+
 /*
  * An instance of this structure is created in a special
  * ELF section at every dynamic debug callsite.  At runtime,
@@ -121,7 +132,7 @@ struct ddebug_class_param {
 	static struct ddebug_class_map __aligned(8) __used		\
 		__section("__dyndbg_classes") _var = {			\
 		.mod = THIS_MODULE,					\
-		.mod_name = KBUILD_MODNAME,				\
+		.mod_name = DDEBUG_MODNAME,				\
 		.base = _base,						\
 		.map_type = _maptype,					\
 		.length = (sizeof(_var##_classnames) / sizeof(_var##_classnames[0])), \
@@ -160,7 +171,7 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
 #define DEFINE_DYNAMIC_DEBUG_METADATA_CLS(name, cls, fmt)	\
 	static struct _ddebug  __aligned(8)			\
 	__section("__dyndbg") name = {				\
-		.modname = KBUILD_MODNAME,			\
+		.modname = DDEBUG_MODNAME,			\
 		.function = __func__,				\
 		.filename = __FILE__,				\
 		.format = (fmt),				\
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 2e321b7eb957..ce42e03f1600 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -239,7 +239,8 @@ static int ddebug_change(const struct ddebug_query *query,
 
 		/* match against the module name */
 		if (query->module &&
-		    !match_wildcard(query->module, dt->mod_name))
+		    !match_wildcard_hyphen(query->module, dt->mod_name) &&
+		    !match_wildcard_hyphen(query->module, kbasename(dt->mod_name)))
 			continue;
 
 		if (query->class_string) {

-- 
2.54.0

