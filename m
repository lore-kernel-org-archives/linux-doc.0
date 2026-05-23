Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 065DB3451AF
	for <linux-doc@vger.kernel.org>; Sat, 23 May 2026 07:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779520515; cv=none; b=LF9zk1qKksJhANLoD5xEZDC0CsRtXtKOaFitPA1M6OJ4HWbEYBQ1+G2+0IR4IV38e+2AsZ9oe3yaL3JpT5+2CM4ChPcXgrSY5kYDOfdadwd6XqcHbfTpDGg0yrZ7uu5VVcOW9p6fWqMOWmu5zVQP/G8bAvtuBZik5IGFnqPiHEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779520515; c=relaxed/simple;
	bh=ifMjdOv9s5iBVhpB9m4hzA/NaIvmwyfWNqe78zgQbz8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JpeGY7EIYOvJwDHEmKP5IMnolU0V5BmF0gZxNPmErLHef/jFktkwUtKGz7tPlgna7CUTX/rip5dEOXBcbdhM+bu0u6ivzUzKfiK4TtfwcfXm+9Z4N3+yP2GO4/f4nvL6elUGzDyN4u3ZOkZrxa9Hv99NB91AFlIg66i0glAt3dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qZUgjL3i; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qZUgjL3i"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-449de065cb3so7666871f8f.2
        for <linux-doc@vger.kernel.org>; Sat, 23 May 2026 00:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779520507; x=1780125307; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x+DQN3gI8cDIPCl5342KuGjmmS7ZUCk1xMik8PQu+to=;
        b=qZUgjL3iv//xwuJlIrY389JLxW3S6fZBEJgpnFbI35vm+BN4NMXNWVQk1zap98s4F8
         E0Mh9Vm2ddKzFl4ZtWTjaYVWJ2y4kNXgZSXks7VznjJoRAbHux5b5yMkLZ5JXn12gLL7
         AvzWg02SKE/AUZZPn+AepYaTPIBDjVGibYJQRpDXJvIUHXcA5rrS6z7ipP4/nCv8vgWJ
         a6gPgvH+CM1Q4nPqFwnvQCEQBGrRIaH1znz3DX8zC0hbXy2obrFr7pstshsDhnA3ebiu
         aYXiKsNFpWqpHAcKFMtyz603HObbilaLSm4hyVOYadJx6atfSVkon8XI8bt1n5FYqR5s
         PTMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779520507; x=1780125307;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=x+DQN3gI8cDIPCl5342KuGjmmS7ZUCk1xMik8PQu+to=;
        b=Q800w3H3BFsIZygwfdVzzER/55ixtpT4LTAUCqmWcj73WTGuWMFZ9KH/7InfcoolpO
         R5pFAWQOeIxVXu39YYlv4atTV1dNA3o//t6pRgqh82ZpX3jTUZcn8DhLLi3oOfr9onpw
         EIcwHU+9f4J04zBBcKeZXVbrs7SX/ALu+/6f1XyrevU8oybwZ+bhrrZ1yWCjKtq3FiGV
         uxP6Cqu+v85TXtXJ1HCnbApir8XYZXt7R1FWl4xU/aLDjmVDrnGUe3VwXQVt/wTfL0re
         9O7IMi6IOLmLERYZbYAPpkhyCJtu5BVD1XpPlDq93D0R5OQl51L8/j+AhDjbmT5djbUk
         pAZw==
X-Gm-Message-State: AOJu0YyKPHsEqD1997bbErz+xgp4QGJGAiThG/iawFpKr1T9iU7WFeDz
	yRUKYCccwPgOqoyACa5xOFGmqzXO5uOlVJm98LJSPTMOn0Cygp7Xjl2O
X-Gm-Gg: Acq92OGQxbZUr5rymvH5dXrTkHlArrxJmDsd4KZ95oNinWXKPZH2Flerx9qYYfweQYc
	Ye2SGrwUH2dYOUlfGzJm1JMAkqfwNOn6KNmwvSEdDHthsJmtMDKFeae4/tEQbFfYFmDANvh/JWv
	L4N9okzyh2qYBQ8v5x3XQdw+qp8MF0pG/MuNT256+m6IrNGUS0wl3cfw5k2m5U/0AnMdNKiuDXX
	6CR1x2Qvo1cUGCmcJ+sVc2jNLaMtuLz0hzcpzKlfP3e7W5rOyfvqVmlZYF924nhwdSowNDuzc1g
	sVFsZxlRoAanRaRXzoWpInpPGqetToNJwLf+cgIy+GHsA7qjFAu0XrMga4qeaqSTNQYR4740Rjc
	InIp9DmVB1TqL8dLHL+kk9qsFdEsiJQSytMVAfse4nXUYw8QgDGd5PzseDHt2iv1TL9rBRG8VpY
	tHpt6//67EHtBK9Tf8Fu6ou7qzHAuz
X-Received: by 2002:a05:600c:a402:b0:488:a882:c7 with SMTP id 5b1f17b1804b1-490426ddc0fmr71710015e9.25.1779520506947;
        Sat, 23 May 2026 00:15:06 -0700 (PDT)
Received: from [192.168.0.174] ([31.96.183.250])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-45eb6d5cb76sm8639838f8f.25.2026.05.23.00.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 00:15:05 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Date: Sat, 23 May 2026 01:14:42 -0600
Subject: [PATCH v2 09/24] dyndbg: add stub macro for
 DECLARE_DYNDBG_CLASSMAP
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260523-dd-maint-2-v2-9-b937312aa083@gmail.com>
References: <20260523-dd-maint-2-v2-0-b937312aa083@gmail.com>
In-Reply-To: <20260523-dd-maint-2-v2-0-b937312aa083@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
 Jason Baron <jbaron@akamai.com>, Luis Chamberlain <mcgrof@kernel.org>, 
 Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
 Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-modules@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Jim Cromie <jim.cromie@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779520485; l=3163;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=ifMjdOv9s5iBVhpB9m4hzA/NaIvmwyfWNqe78zgQbz8=;
 b=LeMzd2IbaJ/MfJTQ8bBott6YzzK/865ef38iQIRe1CPdRfS1+ivfNf7LDpy3XOiDG+YorXBjg
 f4f4T/LpU6FCIfIwOpBiTzv+K7o8iQSsvt2GsNwVVpUWk1TbcwvciNF
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=

Add the stub macro for !DYNAMIC_DEBUG builds, after moving the
original macro-defn down under the big ifdef.  Do it now so future
changes have a cleaner starting point.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 43 ++++++++++++++++++++++---------------------
 1 file changed, 22 insertions(+), 21 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 05743900a116..a10adac8e8f0 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -93,27 +93,6 @@ struct ddebug_class_map {
 	enum class_map_type map_type;
 };
 
-/**
- * DECLARE_DYNDBG_CLASSMAP - declare classnames known by a module
- * @_var:   a struct ddebug_class_map, passed to module_param_cb
- * @_type:  enum class_map_type, chooses bits/verbose, numeric/symbolic
- * @_base:  offset of 1st class-name. splits .class_id space
- * @classes: class-names used to control class'd prdbgs
- */
-#define DECLARE_DYNDBG_CLASSMAP(_var, _maptype, _base, ...)		\
-	static const char *_var##_classnames[] = { __VA_ARGS__ };	\
-	static struct ddebug_class_map __aligned(8) __used		\
-		__section("__dyndbg_classes") _var = {			\
-		.mod = THIS_MODULE,					\
-		.mod_name = KBUILD_MODNAME,				\
-		.base = _base,						\
-		.map_type = _maptype,					\
-		.length = NUM_TYPE_ARGS(char*, __VA_ARGS__),		\
-		.class_names = _var##_classnames,			\
-	}
-#define NUM_TYPE_ARGS(eltype, ...)				\
-        (sizeof((eltype[]){__VA_ARGS__}) / sizeof(eltype))
-
 /* encapsulate linker provided built-in (or module) dyndbg data */
 struct _ddebug_info {
 	struct _ddebug *descs;
@@ -138,6 +117,27 @@ struct ddebug_class_param {
 #if defined(CONFIG_DYNAMIC_DEBUG) || \
 	(defined(CONFIG_DYNAMIC_DEBUG_CORE) && defined(DYNAMIC_DEBUG_MODULE))
 
+/**
+ * DECLARE_DYNDBG_CLASSMAP - declare classnames known by a module
+ * @_var:   a struct ddebug_class_map, passed to module_param_cb
+ * @_type:  enum class_map_type, chooses bits/verbose, numeric/symbolic
+ * @_base:  offset of 1st class-name. splits .class_id space
+ * @classes: class-names used to control class'd prdbgs
+ */
+#define DECLARE_DYNDBG_CLASSMAP(_var, _maptype, _base, ...)		\
+	static const char *_var##_classnames[] = { __VA_ARGS__ };	\
+	static struct ddebug_class_map __aligned(8) __used		\
+		__section("__dyndbg_classes") _var = {			\
+		.mod = THIS_MODULE,					\
+		.mod_name = KBUILD_MODNAME,				\
+		.base = _base,						\
+		.map_type = _maptype,					\
+		.length = NUM_TYPE_ARGS(char*, __VA_ARGS__),		\
+		.class_names = _var##_classnames,			\
+	}
+#define NUM_TYPE_ARGS(eltype, ...)				\
+	(sizeof((eltype[]) {__VA_ARGS__}) / sizeof(eltype))
+
 extern __printf(2, 3)
 void __dynamic_pr_debug(struct _ddebug *descriptor, const char *fmt, ...);
 
@@ -314,6 +314,7 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
 
 #define DEFINE_DYNAMIC_DEBUG_METADATA(name, fmt)
 #define DYNAMIC_DEBUG_BRANCH(descriptor) false
+#define DECLARE_DYNDBG_CLASSMAP(...)
 
 #define dynamic_pr_debug(fmt, ...)					\
 	no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)

-- 
2.54.0

