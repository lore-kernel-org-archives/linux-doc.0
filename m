Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88133A3E66
	for <linux-doc@vger.kernel.org>; Mon,  1 Jun 2026 12:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780315540; cv=none; b=MbrXovMT4FSUjtNT5ZraCK/oeAcpMs+OEHla0rzAwpUcdNsrGB2we+r2ltVCmkuUHGRybE1x7fJrh1o9BkPBti+lEuNFCJ66gdjTVUZzdBSIwtXnhjIPQEnRufEn5Gv3K/qmXkGel7nOFMRUtzQvyPfJXWtaQxOSrXs9syXha80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780315540; c=relaxed/simple;
	bh=qrUOU8qnHGg0JvQozawLRdf39GqEwr6BMsdBUWY+zJs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QXDS605yn88/kLrRGu2pJSsqaZwhEiBjnMoU3cOYXIQNi2yTB0kOxqGnNYT8+eF+sOtz6E8uremrJzmVdapZ29YxJAUdzd2dpkKvkDjczjIAbMlqDxxrXfI/lwFoGV2JtjhebGrZIW7FImZmcjHu6/t3UZzdxdvyNYtEFCUf8SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nykfcaGD; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nykfcaGD"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-490686877a1so58029925e9.0
        for <linux-doc@vger.kernel.org>; Mon, 01 Jun 2026 05:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780315537; x=1780920337; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LWYGhk2F/MyqS6FkLrsC1PXV1OSFLSJSVfJ4W+L2Bjw=;
        b=nykfcaGDKWiy6jwWwsuE+Z/ATaiThMTLv/3kiA2Eychw6D/wheSUN+crOSqf/sqb8A
         S8rxwOSqL/K2wvAxTXKV9nz/otQ40BA1roGeC/10oDEliigpZKZROPsXEcJdk3orUvGi
         32it+Pq1rDzMF5M5xuXuHcZF5lzOm9F44mznsI2K4tN1KePoI43fqWFcuzn5WIUyLmXk
         M5XvfU1/dkawxz0Wa/+8xsjV3/9mETt9BN3huUmlk7Js3SSoAm7Mmh8rJsdoDk+1hKTW
         9lcbpOcKJn0h07E2vlRsfTKPohg+G+vufEjjkLsI5aERbic1+CWgeUqIlPfNOinHs2iM
         sdxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780315537; x=1780920337;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LWYGhk2F/MyqS6FkLrsC1PXV1OSFLSJSVfJ4W+L2Bjw=;
        b=Xdg+po+5u8NkfAdr7Px2G7zn34vU/I5qfa2snm15Cy88HTJaKpN3kz3C591Ye7Rle9
         UVwe5IT/HZSU0GeIh1SfU9VpKe1pK4VrKthcRliU4A85RoIMILR+WQtUfanMBIIrmOEY
         AQePmPQpPzj89xBMrAyRLbucgLHQ+iB56FiMe2YFCZRmg/ZBvAox4s4465mXWmXhB0ZJ
         JuIasK0w3gY88yD33SFsFob8fXeQIizwaEgNQgu0fOL5YiOIswuG0TLkrZwA6S9cN3fl
         +C/vf2QQDJsTDf0gtti7QnGdZabicEhOEIvVljk0l8PhVGjwWNZiigzT7aTMCBkRLzuO
         0Z9w==
X-Gm-Message-State: AOJu0YwWoHciAFnGixpJf//B410pKa2fBxRdOOrgUpNYMdsxq8met8GY
	fjxs2OKBus+kUQikbRSD2a4B3goV63KNOxgznlcSmiCt+i0BwqkT+muc
X-Gm-Gg: Acq92OH2xtoHNSLOvfjF7dh1hHYPvUlmPHF296Zf8xX8WRYvMez0z5SPLlahaNWKYxo
	uzhNdB1btdgCiI3+h5ry7XomIrgGmAWz8o8C8bPc3CF7+GNhEbSPL80JTebCP5orP3GtlyBqfg/
	UiuGnIQn2lSYxmkljZPEIupUQTu7Or35tdXfG9fzJEzofmzSjvHXmrGhgwkZXFaNFI0zKeeFIw1
	BQ4QE4tuFKsr4EkznHEdEJP2piPc7zGlMdT0Zy9tsEo6oawbHDNzLSZn3aA5EhMe9NTu4NB/fpT
	4rntMIifBbUQ+wD/2iycMbbnjWpP4rmnZiCfu5tE1cFlqApuFTRgfB2ELC/XmnnqIHZ/YfgkfmF
	UPGD0Ijcs95qQdWZI7CqXVFkhs9CNOPTiV5xJLKdHgnejnvytWbAcGohzUJzw1kZaC3f99t8/nS
	BwFuSH0dFuWmKA78kFk+88rc4dtdOGNEdLah+gpmVkMQ==
X-Received: by 2002:a05:600c:4047:b0:490:afd9:93e0 with SMTP id 5b1f17b1804b1-490afd99800mr2527795e9.0.1780315537003;
        Mon, 01 Jun 2026 05:05:37 -0700 (PDT)
Received: from [172.16.188.153] ([213.181.114.83])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4909c152570sm103972805e9.9.2026.06.01.05.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 05:05:36 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Date: Mon, 01 Jun 2026 12:05:01 +0000
Subject: [PATCH v3 15/24] dyndbg: tighten fn-sig of
 ddebug_apply_class_bitmap
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-dd-maint-2-v3-15-4a15b241bd3c@gmail.com>
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
 Jim Cromie <jim.cromie@gmail.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780315495; l=2913;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=qrUOU8qnHGg0JvQozawLRdf39GqEwr6BMsdBUWY+zJs=;
 b=XmNB1fBFswv081gt/z1FJsg1wqGy9IGRATjjRtwSJGRi+5lebAnhlFPLse3F6qDEwV+zvZ0GH
 iOECBesKIdkB+6EBhmJin69PnZREkOeg/nCqW3L12Y0nksUfKl9Fqce
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=

old_bits arg is currently a pointer to the input bits, but this could
allow inadvertent changes to the input by the fn.  Disallow this.
And constify new_bits while here.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
v2: move RvB after SoB
---
 lib/dynamic_debug.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 182b84b6f6c5..bb7e16d38f19 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -610,7 +610,8 @@ static int ddebug_exec_queries(char *query, const char *modname)
 
 /* apply a new class-param setting */
 static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
-				     unsigned long *new_bits, unsigned long *old_bits,
+				     const unsigned long *new_bits,
+				     const unsigned long old_bits,
 				     const char *query_modname)
 {
 #define QUERY_SIZE 128
@@ -619,12 +620,12 @@ static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
 	int matches = 0;
 	int bi, ct;
 
-	if (*new_bits != *old_bits)
+	if (*new_bits != old_bits)
 		v2pr_info("apply bitmap: 0x%lx to: 0x%lx for %s\n", *new_bits,
-			  *old_bits, query_modname ?: "'*'");
+			  old_bits, query_modname ?: "'*'");
 
 	for (bi = 0; bi < map->length; bi++) {
-		if (test_bit(bi, new_bits) == test_bit(bi, old_bits))
+		if (test_bit(bi, new_bits) == test_bit(bi, &old_bits))
 			continue;
 
 		snprintf(query, QUERY_SIZE, "class %s %c%s", map->class_names[bi],
@@ -636,9 +637,9 @@ static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
 		v2pr_info("bit_%d: %d matches on class: %s -> 0x%lx\n", bi,
 			  ct, map->class_names[bi], *new_bits);
 	}
-	if (*new_bits != *old_bits)
+	if (*new_bits != old_bits)
 		v2pr_info("applied bitmap: 0x%lx to: 0x%lx for %s\n", *new_bits,
-			  *old_bits, query_modname ?: "'*'");
+			  old_bits, query_modname ?: "'*'");
 
 	return matches;
 }
@@ -686,7 +687,7 @@ static int param_set_dyndbg_module_classes(const char *instr,
 			inrep &= CLASSMAP_BITMASK(map->length);
 		}
 		v2pr_info("bits:0x%lx > %s.%s\n", inrep, mod_name ?: "*", KP_NAME(kp));
-		totct += ddebug_apply_class_bitmap(dcp, &inrep, dcp->bits, mod_name);
+		totct += ddebug_apply_class_bitmap(dcp, &inrep, *dcp->bits, mod_name);
 		*dcp->bits = inrep;
 		break;
 	case DD_CLASS_TYPE_LEVEL_NUM:
@@ -699,7 +700,7 @@ static int param_set_dyndbg_module_classes(const char *instr,
 		old_bits = CLASSMAP_BITMASK(*dcp->lvl);
 		new_bits = CLASSMAP_BITMASK(inrep);
 		v2pr_info("lvl:%ld bits:0x%lx > %s\n", inrep, new_bits, KP_NAME(kp));
-		totct += ddebug_apply_class_bitmap(dcp, &new_bits, &old_bits, mod_name);
+		totct += ddebug_apply_class_bitmap(dcp, &new_bits, old_bits, mod_name);
 		*dcp->lvl = inrep;
 		break;
 	default:

-- 
2.54.0

