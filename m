Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20043B8407
	for <linux-doc@vger.kernel.org>; Tue, 21 Jul 2026 20:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784667450; cv=none; b=mQMJrGNXOwJ49x8tksYCCQlXyH4IReMt+xVOYW8E49XTd94nZbxHYfuwUCdb4g9sJ/u9IsbHn6+xEE+wJCd1wQHVdVGU+D3XPhszA5W6RAabtJ/BYTcVeiVjAcZFXdeq4Z1In4JLbFAFinnftmF8KHUMkbjauA8GvSLSXzN5o3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784667450; c=relaxed/simple;
	bh=ZuzqA3zGt/j9kYmFGfFlaL94NbjSKGlzcBcWBUqAWbM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=upe21xFyIC4nn5SVhvKPHJTokuQZToyAhOSmPaB5sY3LKUBYTLkK1PrEb4flsXND+7kMyB5V88x/zLaeYmpVn4UsGNo+MvlwEHKFwLJAUp0wUV7wjapqZZE27r3AYquW7p5nEfGFjYd5jk6qKKBNWnXVjqjjC9jqPPMbLwH6STk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kqBqpmgW; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kqBqpmgW"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7eb64371a2aso5147632a34.0
        for <linux-doc@vger.kernel.org>; Tue, 21 Jul 2026 13:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784667446; x=1785272246; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z8dUvDJ5uj/iqj7Hr1Y3Cg7XHwt3DLPAXGIUQMEXgMI=;
        b=kqBqpmgW8yFLVWmB52SiO1XgDrTZa697YXWQHZvb/Dhj6bzSFLWwfCprGdEocpPApy
         vyhLdsjgXp/rj5lnAtS5X7nxnXkCONNe9AsshX2FMcUaQGQo9S/re8YV9ZQDPO8sekSz
         diKNGVgJNxSh/dOt+m5kmntYnefOGJVytGumiboR05JczK1gdQcV3ZN8CylSWnx5zvHX
         X8U5o7tQbmGmtd9Ciei+0g1Kst6/nfkphB9d1QxevMUwT2+zRFeZH9DvqOEAsDtvPN3n
         6zvP6UoEslvUfWUYYH+IFqSVqBZvTJh7AnJdOJCxBivAttEGSvouYxnU8qOcmw75cX1z
         T8yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784667446; x=1785272246;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z8dUvDJ5uj/iqj7Hr1Y3Cg7XHwt3DLPAXGIUQMEXgMI=;
        b=GCbwdDsHoMwS3NJ+w0uY6972gbbl2q6LbQp3hiMuQ+q3UXKFpaz6+k9EQ9My59npo+
         MMeb5Tj1LTeUNMhFy8de63lISA+2rLvd6WX90vUtiAKqV7TpJ9DPIM7bIeUfeIQdaLDp
         crl8U2EGqTRGafpH08kiw1rwAXBjFnORl9hNJ1uvZFBp1R1baTogOk0TtsqzSVkHmU6S
         XE53Zw+JTnFZIF7Q4iAcEsiGcJnKAW2RvhHED9F7ZhlhFkfiaVWLj6Ds2v5m6y8vw12C
         JMf5J69yxUmxLWNkAPbyAMhWwjWRdi0d1bQDj71j2ANNPn7H8BJLgq6xzLJmvKPQuPWN
         uQjA==
X-Forwarded-Encrypted: i=1; AHgh+Roff07Gb2JLdJaVWhh6SBKpo/fCvkiINy4Tqn24Q2L3glqtrkHPPd1FvMYq+OYlsnmPvrDTwKZVMzg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4y/YvqsL/EFbH4+naqL5pL+8G42K42WCA9Byy9ufTeLXl17UX
	u9oj/2WrEbvmN/DruR6Bq8JqH7BSRGpT0LY+jUP1mdt/lH1U2B2KVm10
X-Gm-Gg: AfdE7ckDCDRlxitLb+5BtYtSeevYuWaanXLvWWqN2TBuG+hBiEBDrFqL9hbleQzuECs
	ZBCIkGZC/NmgXgTwaftBBNSbdz8gcEceYYv009lXDTj1En7LUvHCpnv9VwQWEWrxUXe4HCs7glb
	iARSBEiGDr9Z82238ja0nbpLP2J3vW8SUBVBApPGbaGmCySnf3b/i6LNYTol/n1I6mg5QoNzET+
	IKwfbsISYcMwu5p93RD2YbvWlnLZAwXQJdca1B3GRfPTRahMMXkJP1/VVxyHiIQj5khnzex+B7D
	Tw01N9ed3OCpYoO5vf1Qjqh36zFry5+SQYB8udSv9cilI2h/4uMxHSUnjgTwbu3LsWh0QXpkKXP
	jNCSLp8QYAEk1paLcfKwkYOYqdlESmNPjRoGLR5CCojA9r0/TzpmSZB0bDWPfMoOkh3yimjEDU9
	7/oD9ylrPk9KcrVtnlKEu0A5Rw9cHBjU1RTJkIlOc9Vmn8O/Fl4jQgiZsCj6cy4XXml1u0/BvJ2
	qJtSoUo00OfbWnNXftvxsbkig==
X-Received: by 2002:a05:6830:8d0:b0:7e9:f8e8:d905 with SMTP id 46e09a7af769-7eda08f5dd2mr11421608a34.16.1784667446035;
        Tue, 21 Jul 2026 13:57:26 -0700 (PDT)
Received: from [192.168.0.245] (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 46e09a7af769-7edaf94a494sm11134501a34.13.2026.07.21.13.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 13:57:25 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Date: Tue, 21 Jul 2026 14:57:01 -0600
Subject: [PATCH v7 12/29] dyndbg: add stub macro for
 DECLARE_DYNDBG_CLASSMAP
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-dd-maint-2-v7-12-010fbe73b311@gmail.com>
References: <20260721-dd-maint-2-v7-0-010fbe73b311@gmail.com>
In-Reply-To: <20260721-dd-maint-2-v7-0-010fbe73b311@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>, 
 Jason Baron <jbaron@akamai.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Shuah Khan <skhan@linuxfoundation.org>, Simona Vetter <simona@ffwll.ch>, 
 Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-arch@vger.kernel.org, 
 linux-modules@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Jim Cromie <jim.cromie@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784667429; l=3163;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=ZuzqA3zGt/j9kYmFGfFlaL94NbjSKGlzcBcWBUqAWbM=;
 b=cmjG1wuVFQ3XeBJO9nnXcth44nNR224HlVxlEIfZaMRweihCUg7g+TJnOA1kkcfy9eKicXJmj
 oPA6pA/V2aUBYis47EkzWfSFRMoDQfmCdKNGmQyTivc2nl++knJC2DY
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
2.55.0

