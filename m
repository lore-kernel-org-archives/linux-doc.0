Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 143B13AA1BA
	for <linux-doc@vger.kernel.org>; Thu,  2 Jul 2026 16:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783010500; cv=none; b=fS9/R9HRb/rvpeE0s3u73vSY9G+VG9FI30WszQ3JM55h5LepTozHpwxzaC5G1HpqK8y1gv6m06jUOTBDUNWJzvw3H7Fkmey5qyefz8UdM88uoEbPyEpnfHTSeYSRI7etVXLPovDi5AXHNWJBm0sblqZdo30GGOxcgHBqaWUVVY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783010500; c=relaxed/simple;
	bh=DkA2pTZNQqVs9Nrf7TD5N2m0l0e3VhiWsrxu2lYAwiU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R/KcJo+hKuodViEhRrYUfhYHtvMdWtNTCgsZBKT+ptcW9nKpXk7+xvnoTvGwNklfQeGpdjkW5X+8MlNUmkLaLgE+ZSI5mvySw23bPhguMbCXGX3Cy0grpAQVuDZVfxCk/oME2C0LPLcBbLKl+KBCtAVMTvhH4boMj0yR51rGk6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ck9EjMWR; arc=none smtp.client-ip=209.85.160.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ck9EjMWR"
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-44c9f8c9c4aso539048fac.3
        for <linux-doc@vger.kernel.org>; Thu, 02 Jul 2026 09:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783010491; x=1783615291; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Erf+9mXLsSsdoKA6DDUH191uMINCSbpojgzEHl3ic+4=;
        b=ck9EjMWRHwKsQJZXO8/AXxJ/O6/F9axpvFpJbW7hLkJAA1iNffiampm4jm+tYc4fnj
         vJ/bKsAXAmXOVNDRu99e8CcgHPl1qX1v6AXmgG1EQkttJfiQoy65mwAVquba8MyI57jX
         0dmB6DEvQbxepauj0iSQgT6GwK92wJw67WkauCrIUjcimTaQ8uQfyqzx8yiMhzU7x+21
         ZedCnFGl2SvOK9riLJIJE3MQVWE8abw12Lm6aOk7nr8dc3SjvSCithFKuqDrXQSQ5IGT
         /lrXbWRxrR0kvkYFJA3a831CaQHyOsnzkRNoWRQ+0SiBus5Vt/u4j0HelV86fT2YaWb1
         0HEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783010491; x=1783615291;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Erf+9mXLsSsdoKA6DDUH191uMINCSbpojgzEHl3ic+4=;
        b=ZEcVbCY92veNAusQkW9UYwaZ1YaYMmAsy1GDPRDhDigF90XoNwgySfxCJBE3JXqT6E
         5YZIbVyEeWYGU7paSAAQa/lBjRVlgixWPZ6M7GmqS4u6MPc7QCzHjq+9pxUCp5MTFJU9
         hNDcia/HJR+eUelkBFV1zt7B00HsTALzjzndEYmtkh7WGVWgscYS1bBsk1fvdX0iCjMG
         aGIc3uOV15cM3FCK0zfm99NiNX8nOzlQTPKftdJ8c2pYZrThSbjwVoCPrHZkj/A+RSIj
         Rr+6tTw0JMu/udRVQo0V8lYAYbAO43HDAPDVXzel0btRkj85PCRSVd22yywYmQu5jMnp
         oE9g==
X-Forwarded-Encrypted: i=1; AHgh+Rrh7QBvypU7AUjw6CMINON+t6OhcZpIE5HoR+3jZevpnAAjVBqf6221RqYTUdYy946jaUCnodVazWQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7qXU9nDYpkWNslpTzOxVi3rKzPu+zBRAXCdRFJQO871Ss/oOH
	8MHs6BbVBg5r0/njUG0+T5419pglBWVf0XmaWifWxU0kku6Gbm2C4G5okvAyyEHc
X-Gm-Gg: AfdE7clj+oveROvd22BFFe7NUDzkHXbYNaOvSBy6ZUkJT7C1XmvpiBT6C3guJEQw4m/
	/Qu9HkB/VZ0bfCgXchRrcr5V0T9nrofktwYaE/z6J8ae/VRVC8lmDoRtVreWPT0ETpLslWNtqiP
	jHxvzIIteLDXfjJ+ioObwqfcjDI2SrQ8eFSt2bSCSaRdMx3hbEL4b9SAnw8tIX//W0xQFsBsOJH
	xYr/3IkvZg6lKa+7NgwHlfZ43nCMMK9QGRl1VfUqOjHGbNuJWcn3YE1UIhY2Cpmx1YQ3rbWsxT0
	/H8tZ771beH1D5ElNiQf6iSDJo65zQyWKkrcGq2e/4lsfIGRkB/fD4vV88HMUnXLV20ZAx8OkFv
	cCaDuYWGpW9KfDMDQaf7elo1KMpI4MVAKlj29PLhvFEgPb5s2HLYTU1hIXOa43H7jKF0j9p/XKK
	BVnZpJKWba646cNpP0HF+r2h47QIERg9GzX5AaG7mMX6GEBTkSDJs=
X-Received: by 2002:a05:6870:e0d2:b0:44c:a364:fea8 with SMTP id 586e51a60fabf-44cabc88b37mr3590704fac.41.1783010491169;
        Thu, 02 Jul 2026 09:41:31 -0700 (PDT)
Received: from [192.168.0.245] (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 586e51a60fabf-44cbec93702sm3189652fac.12.2026.07.02.09.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 09:41:30 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Date: Thu, 02 Jul 2026 10:41:03 -0600
Subject: [PATCH v5 11/18] dyndbg: tighten fn-sig of
 ddebug_apply_class_bitmap
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-dd-maint-2-v5-11-24f22b052bf2@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783010473; l=2913;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=DkA2pTZNQqVs9Nrf7TD5N2m0l0e3VhiWsrxu2lYAwiU=;
 b=8qVdQFuygCFOI55ytb23VvBu9ZTlSpFhxL0vul4wxXXXDard415mjlNzyLE9vOheQ5VjLSith
 GgQNUK30WNDBHOz/OQHVK/eeYsBfjNOG8IDQcKcLTTIGM/82SHFKPQw
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
index 0fc9cd14e2d2..8c3b29904346 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -617,7 +617,8 @@ static int ddebug_exec_queries(char *query, const char *modname)
 
 /* apply a new class-param setting */
 static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
-				     unsigned long *new_bits, unsigned long *old_bits,
+				     const unsigned long *new_bits,
+				     const unsigned long old_bits,
 				     const char *query_modname)
 {
 #define QUERY_SIZE 128
@@ -626,12 +627,12 @@ static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
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
@@ -643,9 +644,9 @@ static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
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
@@ -693,7 +694,7 @@ static int param_set_dyndbg_module_classes(const char *instr,
 			inrep &= CLASSMAP_BITMASK(map->length);
 		}
 		v2pr_info("bits:0x%lx > %s.%s\n", inrep, mod_name ?: "*", KP_NAME(kp));
-		totct += ddebug_apply_class_bitmap(dcp, &inrep, dcp->bits, mod_name);
+		totct += ddebug_apply_class_bitmap(dcp, &inrep, *dcp->bits, mod_name);
 		*dcp->bits = inrep;
 		break;
 	case DD_CLASS_TYPE_LEVEL_NUM:
@@ -706,7 +707,7 @@ static int param_set_dyndbg_module_classes(const char *instr,
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

