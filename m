Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD3937CD48
	for <linux-doc@vger.kernel.org>; Mon,  1 Jun 2026 12:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780315524; cv=none; b=Rq6kqHn6Qh0z7MSYfKxp4LVXS4gjfsNQ4bs4ODdN0SBpKBbuwSR48UZZprnyi+oN/REsCQBiXM3tw/HTSyGXP5rCddMw4BjmxmVdRDWe2AFjMAtWTgbTBU4LjtS9a1dYl/P+m/TmdkVuwY6c8ghGRWCDPpvspCdGohu1IrHKWtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780315524; c=relaxed/simple;
	bh=ifMjdOv9s5iBVhpB9m4hzA/NaIvmwyfWNqe78zgQbz8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fpW7LgkqNFdrhF8nqBPgCK+0yhhF+rAV6spYS2/BLUiZ5SgMzwu74wbmjEAR465qpHFcJT0zmQgWr2c9tlMMKgWvTRmxmK/+m+yIOImrKLDe1edfM9lQcZYNqLk/223i9JdF00cpec6hjXIeflmIjQ1RiMACCCV5gvlrBbfUl0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XrVkg5PV; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XrVkg5PV"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490a76757e5so9472195e9.2
        for <linux-doc@vger.kernel.org>; Mon, 01 Jun 2026 05:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780315522; x=1780920322; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x+DQN3gI8cDIPCl5342KuGjmmS7ZUCk1xMik8PQu+to=;
        b=XrVkg5PVXznwg+aZbATtdN20I56gUrgwh/58hv9+pbGMqiXAj7xaJlpwUSrtO+SBOb
         JAVoNltbKlw3b/YCgBZD+y1DXNrOqtZB36PP9d8RlJ0O0aHTdYLDf6f47VFtXAgVdR8V
         oNFvVZD6UbD4Eqe3VI5Gn6BicX41otlW5QhvbP06MNrk3oOFOzjNBqCdVZdbd0SQkI8h
         lORe39oEXgUOwKHe8/P0x0Ewrey0+zR0Dl1iPbnd/wZK15gP5mpBiCAWZSN0lTXwK8g1
         tVk6mzW9JJ44HxXF5sIeHHNoS7loHOCuxPSgzSjefizyO7rmcNll7R2+g/6UXC7TrFpN
         CaFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780315522; x=1780920322;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=x+DQN3gI8cDIPCl5342KuGjmmS7ZUCk1xMik8PQu+to=;
        b=HijQNWUT3BKIGTPbiQX1/1KRCfUK2l66uTSjOyGDzll2AUt3HigqLSDOQIab3qIq2H
         cj6rvpJ84CuJcphU+xvWosyKLUwe8lGW2peIZkBQgTm25iSUVT09i6g8YyfRhkQ7gFOm
         C+54WDhzv5pmnddkDzhj938ujKMistLqf69/8QfVKWh9ChlQnlDuubnam2ijQ8mZ1bK6
         YmPS0Ot8Rp2dPCI05hi73wzfAe61nKqc0n7Sg8WqEGW/wQqRBMfd7K4UJUf40R3hRt0Z
         1SwaBclKrwoFGrtLyU+ySYXqwjsuK8ODhYwAESYRVoch09Rn5a/CSKnx/yVUr1ucIL0V
         4pmg==
X-Gm-Message-State: AOJu0YzTHlQ1Boifu087wOBV1zUcP7Uz2PEqG6iIYf+No/adq1zaCEr/
	F7irZqlkGG1QSfOlUg/4DQdCCnj/FIUTTqrQQtRPYPcUJHaI26EkQ36mSHyV3g==
X-Gm-Gg: Acq92OGvjkthXlu1xp72DJaowHb7c2P7jsBhWVeVBpRwlFpgNZyCXFlxnJDWylSRBOD
	Elm/UN5mZW18KSFDYYTXLxyj77lAgUqhWl77vV+7W2HE1kqUnTEBmcfTReBVpwt/3NaAQLD8UhZ
	PWC8glHwqShQvyrIgyFnnuEoj+NSplLtiPj6+c3FMrGF1pvVwGPmuVNbr5d2SzXTA/8sWDUCrJX
	oVA28S8/Dk9MmT6U0NnxF1m8y7IO7MFRpfm3jF3sISao2P0zhOYaAs6QPQoB95VIMVYv2RVfU2q
	1nVf+Lbn/SNOqYXpLWOPoEotpno5EKLC6CB3PsXhCPNE3tOZ+g1XQQ5gEVXEiJOH3TTil/FmlFK
	BuBqLWKnzYPGK5IU/RdLr0kCyCj4SxILUNqeKhG/syjVW1AfSAXx6tw49RHGwVgwPyhYUGOL50A
	YZXWL1pErMfH2grr1l4JQ/2J6lVODJ7AW5FaFzry9sgEsOj/ox4jDT
X-Received: by 2002:a05:600c:c0d2:10b0:48e:7854:1608 with SMTP id 5b1f17b1804b1-490a2938f7cmr143236735e9.25.1780315521656;
        Mon, 01 Jun 2026 05:05:21 -0700 (PDT)
Received: from [172.16.188.153] ([213.181.114.83])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4909c152570sm103972805e9.9.2026.06.01.05.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 05:05:21 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Date: Mon, 01 Jun 2026 12:04:55 +0000
Subject: [PATCH v3 09/24] dyndbg: add stub macro for
 DECLARE_DYNDBG_CLASSMAP
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-dd-maint-2-v3-9-4a15b241bd3c@gmail.com>
References: <20260601-dd-maint-2-v3-0-4a15b241bd3c@gmail.com>
In-Reply-To: <20260601-dd-maint-2-v3-0-4a15b241bd3c@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
 Jason Baron <jbaron@akamai.com>, Luis Chamberlain <mcgrof@kernel.org>, 
 Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
 Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-modules@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Jim Cromie <jim.cromie@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780315495; l=3163;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=ifMjdOv9s5iBVhpB9m4hzA/NaIvmwyfWNqe78zgQbz8=;
 b=mCaalRPbwAZWy05AH+RmNzLnWg9gvB9Y7Zw40ICDhFM/JPQZF0PXJjeUPFSkOZHwyr2XgFYzH
 m1Cpsj0zzBUCiL+DlEjp+UVmoRnPewyX4K7Im0+VZ4vutjmBmnyF51m
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

