Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BACEC3B810D
	for <linux-doc@vger.kernel.org>; Wed,  8 Jul 2026 02:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783477138; cv=none; b=DjjvdIA85U7AjVQhYINXwnYTf8ynJVunEAAoKbo2FkvYPQBAgDGttwqb2svkYx7gj/NYNkC8ZZ3tdEtIq43QfOKqbgaf/sz952qImSfAliBVY1+PdfuADVX6thMq+e+Hhv6bNzjQFAaeRE5XshFlk9qS791ZtFWMcHVoMQsmAAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783477138; c=relaxed/simple;
	bh=5spgXU4kgDNgBoy+8aa3tT4HXinOsojD5H8veWj6VKI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jGzehwftJAndRPnBIveQXbEF+XhKBIgQZ09JXSuIiACGZqA03u/dOoSK9FxRe7O19U8Tmny7bvifxWcowQ2hefKbnudkoxWkG32rzxUwMepJRZ0e3K6PTIXRAKOSdmA5R6mLFDHOKv5xtUeTdCicjUXMcjDud+LWiklSGnhu8os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iWWZhMPP; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iWWZhMPP"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-489795617e9so103292b6e.0
        for <linux-doc@vger.kernel.org>; Tue, 07 Jul 2026 19:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783477133; x=1784081933; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JKUFTzg0G70dO3HqLrBX7k0JpOC9/pO/bICFDvAx8Ek=;
        b=iWWZhMPPoEi9/VtY6wfJ2iZk93wcc+9fRzE8l29XuNrlnPzFQk3JrhP51CMnv1nH/0
         SAW7msaPGL7njE/qhq8crId5toI22fI/g3VI9ETc6+oTnONJmoQVIBnBtSlMp5T0GxY3
         UYykncGoDAsxLZVpEFJboSMtpAizf1YLEwEurWE2yJbNMkJ9FqqzbaVGJeCKAzfFl91V
         B6C1923lZajUOD2tEU2ty8Q6O+zCQuSZvhwk6iz4GhgOG3Baho6Wo6aetjbanGLrhSoD
         HHo+WPF10lQWWWpKKBppIRT67xP72ETIvkiygdta9onnYknwGv1yCAFV2CIKwlpFjPkT
         hJMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783477133; x=1784081933;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JKUFTzg0G70dO3HqLrBX7k0JpOC9/pO/bICFDvAx8Ek=;
        b=rv+6lN4XmdL3RaX/SfQ1o8WnF5hRjPURPoQ2Zu5OVD7Ixj8mA6N24j8FHhP3MIxdLD
         f3Ecid+As6EFkKXJ9Auh44l/CYB3bF3t7qP26+cpYjKpVMXtQX4WGY7MQmdtDFpHbo94
         5P9TYz/dTj4urS8gSaV6dHAhu3Xz+H/J6tNWe38CH9oPDsxkRtylJd1imtTJKUb9aPfO
         oBAK3+FSXJyNAMvndVk/XDeIn1JG/AP4HK+UhEjLU1W47k6wRf7sb5NYwX/hK5rOX5IZ
         sXslFWyCt4HTuvdnCZiFRJ0hd04yfcz5+Iyr58JmsbpcmXWSIJUfCI2qbM1XascP/Jdp
         doEQ==
X-Forwarded-Encrypted: i=1; AFNElJ9QE4hce5inpA00V5CGp/BmJQ0Fi2ZNSowlylV844Dtpfx4xrj6PP+Kswu90odIWfe1wjJWqAffD/o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9E4b02s4W+4M7zXWfTLhtyQHBJlEkjOo2a06AEKz6LTzsm3tV
	WApLqzxWHR1MUQ6zE3HxXrc/zPvhCPraY8F7WAEbnObvd7aP5IFvojYV
X-Gm-Gg: AfdE7cll6IzxXqm0fVjhZQbGIF+Qb2qT4HY3EJvLQGiHDCe7+Wc4nZxSatSYDqUL4Od
	/luSGlcvps2pIC5Xm0H5RSDEJocbGvFScVWztxi6kTri3sYyrN/9ajvlpCf0znNnvlWDd18uyNr
	ym8Q7P3smXnWVIEtAi0l/wFnUnNMEINNwqQkU1IXr/JO59rrtsDsvLPjc6lOYyg00Jmv6OK/A+a
	FowisLGro07/Fny2yu8vTrEksht9V6wAgdmilMSHQ2CkcmFBU003lQm885Yau1IgwnjHQ4jvxNC
	MQVrp9EAZhRv4v/fgBdogK7E7J2nA4vApS3UL968mNB1ahl5cVTFobJR2+RE2qQFHF68GTPq7DO
	1i+Ad2w9f0Zkx/TznXBtsKiZnBM3AUJDd2bY5Cf4jUaHV3qx9qZSZEevIEuTjDr28CPibyoWBko
	R6nLIa+KhsGk6RsEOpnNH17nq70Wmq54bg+Y6qZaTWFe0jq5k+ek0=
X-Received: by 2002:a05:6808:1528:b0:492:5684:7ab3 with SMTP id 5614622812f47-4a203dbf7e0mr332446b6e.21.1783477133285;
        Tue, 07 Jul 2026 19:18:53 -0700 (PDT)
Received: from [192.168.0.245] (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 5614622812f47-4a1aa006f74sm799975b6e.0.2026.07.07.19.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 19:18:52 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Date: Tue, 07 Jul 2026 20:18:15 -0600
Subject: [PATCH v6 15/24] dyndbg: refactor param_set_dyndbg_classes and
 below
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-dd-maint-2-v6-15-381f3edb0045@gmail.com>
References: <20260707-dd-maint-2-v6-0-381f3edb0045@gmail.com>
In-Reply-To: <20260707-dd-maint-2-v6-0-381f3edb0045@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>, 
 Jason Baron <jbaron@akamai.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Arnd Bergmann <arnd@arndb.de>, Luis Chamberlain <mcgrof@kernel.org>, 
 Petr Pavlu <petr.pavlu@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-arch@vger.kernel.org, 
 linux-modules@vger.kernel.org, Jim Cromie <jim.cromie@gmail.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783477102; l=6125;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=5spgXU4kgDNgBoy+8aa3tT4HXinOsojD5H8veWj6VKI=;
 b=IM5YfUy/gVnf8P+Id90JgQdcRUk6B2mNg+DUT9DRhrBL5g3XqL5wewP4tIFCKj5kallkfJbO9
 tRT9kSCznPRDRxWelmzihsYNf7d1+Jrz3x3cA9JOXecKv5+yg/YSeT5
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
2.55.0

