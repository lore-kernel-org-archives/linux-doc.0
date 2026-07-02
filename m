Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C613A6B9C
	for <linux-doc@vger.kernel.org>; Thu,  2 Jul 2026 16:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783010499; cv=none; b=myi9n4V8cJ39dcv3lg/0GPolgdNDH/PzE2lpD2MS35qlh968BFID/rbN2K2mKt3g2hPDdu2hJeb17U4aaT8aLW6efjbZmYaBtiJcQdzDg2fKvWrSNFg3pQmGZ6RhkrqIO5s/dc53mJfkwHyGrfv7Twg4SZAc2IOm37mPGgPoErw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783010499; c=relaxed/simple;
	bh=tqt5MwiD6HrQDvcR6oykSbqGC2S5kT6zF+EiGPTLOLQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UQVk0SYoHWrA2WnK6P0Ymxa8nGU+ZAXQEVu5gQVtPkTdInTGqfym9yL6kicTi047OP15Y5sYb7n/YTF+RiOZ+rRkFiiE6PhzcG19/ZZbjODxIoQgKkqUQBXnxgrC9/Uq1l7o4NYqsK9v7uZZRyok1wEVWXR3a28BrqnpnZ4f+ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BVZtfy3n; arc=none smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BVZtfy3n"
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-6a0c7c4f55fso1402253eaf.2
        for <linux-doc@vger.kernel.org>; Thu, 02 Jul 2026 09:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783010490; x=1783615290; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z7bxxo1B+K2xgi+Y8TLpeTHXA6asmMdj2sriPZDg0Jo=;
        b=BVZtfy3nYf9Qz6wxNxRNWnF/SG6hfhEbWrzTI5JMJ38ugsz5nnhg0m0PNkni8ZLbCZ
         BaWiZcdZOiOgtMf6ZvZhvgdj5nNiaY19IAICOiTicE3TKCAIWCIcnN7SB5KBZuhamti8
         4yvD+/EhWIrPRnB0Uob1pQpbvBzEKZBWM9ky+Z5I5Y8FF29X7kqrrO5MdnNrl04xovMo
         J1VMDJJPwYa97ufEfLRc8arT8fPomZg3A0PEWC0KnA+h39esUEaP88hOQEwBNqwoWCy9
         X1sSZb4CUqGZOebnSDnbgZfLUQJvcdHYtwqSxoh7OuKOBBgUCdPWwJCpTvbTtkSclhej
         A6Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783010490; x=1783615290;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z7bxxo1B+K2xgi+Y8TLpeTHXA6asmMdj2sriPZDg0Jo=;
        b=QujL3p6eryFeKzw4zN42IgiO0FlO23PXiiAaK4ndnoC3leCeGtUibbgWmYvRlddDez
         34PmX+IN4BKnBd4il9UeEoFbKQtNlHMak6ggeWwiHNYwrfhtPiwJgYeG8Of9k0GjsV+j
         FIrCTBaCznzV2Bo0J8qZRh20N51aSf3aL/yd1E/++Bhcs7dmJzTxUVgIPTeEkmTscmny
         xnTSoeIdT1zmB1NSokUrvODWgg/gFph/SfmfWONzaN2dgEzLugvtl+CP3UgjIqoFyt0D
         1gG9DbjhL5agDMN72yR2xMnRbRcez6E5OXM8+CCtTsaxqSiHwqeqn7uwqHRXObkAgFPO
         /LgA==
X-Forwarded-Encrypted: i=1; AFNElJ8j1b96WJZruDNyRB/6DO+XQWRHsyrLz36uXp4WMHfAyIK85Th3ufIoFkrGbRm/glSUP0tYN6UwqH4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+kU5Xu/fiMRRBWI8fcy4amlUx4+br9N3IdXfxsreqSwMyOrOv
	AuFjg3Bs60kZhkhVPoxjYHfZmwI+Fo9k3VOQJKZgLTt+FNFuM0sDzpO2
X-Gm-Gg: AfdE7ckEWP4hyFGI73XcUDb5cdY84T9oUnFXmmX6t9y41bZ7A36pLAYNX5f4S6ITRqX
	YWcRQ5xQeSQPOTd2/dalA+M2bn8zquFVMI5PDIDvgMZT0c+tEtzldDbQ4leEm30+2qgXsokr1ZT
	brxud2avGHQwmYeU6Xclzj7nHV12+gBacoLHxVBZ5xyDQOWs2K34c57x/9QJW/GFpRFw0u0l9fj
	r6FXfIrEpGePRjmyemCDAVkic+Ol23EMWtCIejJF7GgoDwwLOMHE6RW65HIi3/eirlVCZ49fD5I
	HAzkYD4m+ErX95otNLUOE6Zdr48CX02bx8HDyZlU1q7a0oDgac+gGQog/Z3PbQhA4hcU6zrdfSG
	Eh7tiq0xPsB3pg/rXJ8DcFsiGTYE3rxMVDTF2ghf8uqxXyq4laMIDNtUnN1zygW9gFDiJxurP5I
	CStbXry0UKUuUgwcqrxsaPZarJpiBWpQXBOXoqw5VLEyY9NantPYb1mxmpYPIduw==
X-Received: by 2002:a05:6820:151c:b0:6a1:3e91:dcad with SMTP id 006d021491bc7-6a309974cdamr4260572eaf.29.1783010489767;
        Thu, 02 Jul 2026 09:41:29 -0700 (PDT)
Received: from [192.168.0.245] (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 586e51a60fabf-44cbec93702sm3189652fac.12.2026.07.02.09.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 09:41:29 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Date: Thu, 02 Jul 2026 10:41:02 -0600
Subject: [PATCH v5 10/18] dyndbg: refactor param_set_dyndbg_classes and
 below
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-dd-maint-2-v5-10-24f22b052bf2@gmail.com>
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
 linux-modules@vger.kernel.org, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783010473; l=6125;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=tqt5MwiD6HrQDvcR6oykSbqGC2S5kT6zF+EiGPTLOLQ=;
 b=dtCmCUkIoPQyPYUkmr/tIhrdAZAkTruYS8RLcJJsPFM2W/MJ8aSTSu3o3jka6HXYcJGj2EFzb
 n6Z4WZZ41aDBc92CXsRJa3H8g9D+rPox8CYU4Ywq9+x8JepISk3xy1l
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=

Refactor the callchain below param_set_dyndbg_classes(1) to allow
mod-name specific settings.  Split (1) into upper/lower fns, adding
modname param to lower, and passing NULL in from upper.  Below that,
add the same param to ddebug_apply_class_bitmap(), and pass it thru to
_ddebug_queries(), replacing NULL with the param.

This allows the callchain to update the classmap in just one module,
vs just all as currently done.  While the sysfs param is unlikely to
ever update just one module, the callchain will be used for modprobe
handling, which should update only that just-probed module.

In ddebug_apply_class_bitmap(), also check for actual changes to the
bits before announcing them, to declutter logs.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
v2: move RvB after SoB
---
 lib/dynamic_debug.c | 51 +++++++++++++++++++++++++++++++++++++++------------
 1 file changed, 39 insertions(+), 12 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index ce42e03f1600..0fc9cd14e2d2 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -615,9 +615,10 @@ static int ddebug_exec_queries(char *query, const char *modname)
 	return nfound;
 }
 
-/* apply a new bitmap to the sys-knob's current bit-state */
+/* apply a new class-param setting */
 static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
-				     unsigned long *new_bits, unsigned long *old_bits)
+				     unsigned long *new_bits, unsigned long *old_bits,
+				     const char *query_modname)
 {
 #define QUERY_SIZE 128
 	char query[QUERY_SIZE];
@@ -625,7 +626,9 @@ static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
 	int matches = 0;
 	int bi, ct;
 
-	v2pr_info("apply: 0x%lx to: 0x%lx\n", *new_bits, *old_bits);
+	if (*new_bits != *old_bits)
+		v2pr_info("apply bitmap: 0x%lx to: 0x%lx for %s\n", *new_bits,
+			  *old_bits, query_modname ?: "'*'");
 
 	for (bi = 0; bi < map->length; bi++) {
 		if (test_bit(bi, new_bits) == test_bit(bi, old_bits))
@@ -634,12 +637,16 @@ static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
 		snprintf(query, QUERY_SIZE, "class %s %c%s", map->class_names[bi],
 			 test_bit(bi, new_bits) ? '+' : '-', dcp->flags);
 
-		ct = ddebug_exec_queries(query, NULL);
+		ct = ddebug_exec_queries(query, query_modname);
 		matches += ct;
 
 		v2pr_info("bit_%d: %d matches on class: %s -> 0x%lx\n", bi,
 			  ct, map->class_names[bi], *new_bits);
 	}
+	if (*new_bits != *old_bits)
+		v2pr_info("applied bitmap: 0x%lx to: 0x%lx for %s\n", *new_bits,
+			  *old_bits, query_modname ?: "'*'");
+
 	return matches;
 }
 
@@ -652,6 +659,7 @@ static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
  * param_set_dyndbg_classes - class FOO >control
  * @instr: string echo>d to sysfs, input depends on map_type
  * @kp:    kp->arg has state: bits/lvl, map, map_type
+ * @mod_name: module name or null for all modules with the classes
  *
  * Enable/disable prdbgs by their class, as given in the arguments to
  * DECLARE_DYNDBG_CLASSMAP.  For LEVEL map-types, enforce relative
@@ -659,7 +667,9 @@ static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
  *
  * Returns: 0 or <0 if error.
  */
-int param_set_dyndbg_classes(const char *instr, const struct kernel_param *kp)
+static int param_set_dyndbg_module_classes(const char *instr,
+					   const struct kernel_param *kp,
+					   const char *mod_name)
 {
 	const struct ddebug_class_param *dcp = kp->arg;
 	const struct ddebug_class_map *map = dcp->map;
@@ -682,8 +692,8 @@ int param_set_dyndbg_classes(const char *instr, const struct kernel_param *kp)
 				KP_NAME(kp), inrep, CLASSMAP_BITMASK(map->length));
 			inrep &= CLASSMAP_BITMASK(map->length);
 		}
-		v2pr_info("bits:%lx > %s\n", inrep, KP_NAME(kp));
-		totct += ddebug_apply_class_bitmap(dcp, &inrep, dcp->bits);
+		v2pr_info("bits:0x%lx > %s.%s\n", inrep, mod_name ?: "*", KP_NAME(kp));
+		totct += ddebug_apply_class_bitmap(dcp, &inrep, dcp->bits, mod_name);
 		*dcp->bits = inrep;
 		break;
 	case DD_CLASS_TYPE_LEVEL_NUM:
@@ -696,7 +706,7 @@ int param_set_dyndbg_classes(const char *instr, const struct kernel_param *kp)
 		old_bits = CLASSMAP_BITMASK(*dcp->lvl);
 		new_bits = CLASSMAP_BITMASK(inrep);
 		v2pr_info("lvl:%ld bits:0x%lx > %s\n", inrep, new_bits, KP_NAME(kp));
-		totct += ddebug_apply_class_bitmap(dcp, &new_bits, &old_bits);
+		totct += ddebug_apply_class_bitmap(dcp, &new_bits, &old_bits, mod_name);
 		*dcp->lvl = inrep;
 		break;
 	default:
@@ -706,16 +716,33 @@ int param_set_dyndbg_classes(const char *instr, const struct kernel_param *kp)
 	vpr_info("%s: total matches: %d\n", KP_NAME(kp), totct);
 	return 0;
 }
+
+/**
+ * param_set_dyndbg_classes - classmap kparam setter
+ * @instr: string echo>d to sysfs, input depends on map_type
+ * @kp:    kp->arg has state: bits/lvl, map, map_type
+ *
+ * enable/disable all class'd pr_debugs in the classmap. For LEVEL
+ * map-types, enforce * relative levels by bitpos.
+ *
+ * Returns: 0 or <0 if error.
+ */
+int param_set_dyndbg_classes(const char *instr, const struct kernel_param *kp)
+{
+	return param_set_dyndbg_module_classes(instr, kp, NULL);
+}
 EXPORT_SYMBOL(param_set_dyndbg_classes);
 
 /**
- * param_get_dyndbg_classes - classes reader
+ * param_get_dyndbg_classes - classmap kparam getter
  * @buffer: string description of controlled bits -> classes
  * @kp:     kp->arg has state: bits, map
  *
- * Reads last written state, underlying prdbg state may have been
- * altered by direct >control.  Displays 0x for DISJOINT, 0-N for
- * LEVEL Returns: #chars written or <0 on error
+ * Reads last written state, underlying pr_debug states may have been
+ * altered by direct >control.  Displays 0x for DISJOINT classmap
+ * types, 0-N for LEVEL types.
+ *
+ * Returns: ct of chars written or <0 on error
  */
 int param_get_dyndbg_classes(char *buffer, const struct kernel_param *kp)
 {

-- 
2.54.0

