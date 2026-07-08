Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B3A2F6904
	for <linux-doc@vger.kernel.org>; Wed,  8 Jul 2026 02:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783477132; cv=none; b=SbkLke5LyRMQBWKh6TVOSRvlu70boNFOGdGR8po5VisnbDIozllaH4GGOivkh/5DVpFaYAIICbzVbvMAnEBOQETKLNRuZmzdDL6KolDNs0h8d2vPW46L1HiuL4fjhOmqkVcTQCF2bczuCCnCFm8rcGIkMoYsFkBTdMlHLE336fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783477132; c=relaxed/simple;
	bh=XQqP3CGhUC4Qf0a8iBvGk8T4hUKPih4ej2z5w1J7I+A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sFeWYt7uKYfn5kqxNx2m4+j2KWYUPS4x1bu490MlFGP3zO6NJYPztelpDobjr8ALINyJEGPyBNSuyWZzFSlsS95I0TPq0o5ZxSlbueGfoe5ik9iw7MBBbE3Q99VmM6Vmfhu3s+QI7q7YV+Kv8y/ahAC5nzprBGISmWGXKhGAsMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nf8v918M; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nf8v918M"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-489795617e9so103261b6e.0
        for <linux-doc@vger.kernel.org>; Tue, 07 Jul 2026 19:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783477123; x=1784081923; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+bZZkJn8HHk752QXiuM3ujnnoUYImIUksTU2DD+Ftzs=;
        b=Nf8v918M2+Z62IGnLRn19S+z4+Z4i57o87Fn96CocehkVDpFXvbd7EUoJfOoaT+n+G
         /x6+hzo/XcigxKcKw6u2D8LTcxWQj2tZn2aNBmufvKDyyQsJtqAuhNMXl0IQWZ+oTdVl
         mxcKn66a1/KXFzlzgt3aRWzU2lgGl2pqBTvSN1LvHJq86SuouC6tS+rQNx6KJ6Z+KH8v
         n2+eSl3vNRwGGnhjqtLPsq/D+/uSjyOB0KisB37bQnPOJQOQKiAOsS3pF0TCRtxwR0bB
         a/YEQpZU1tJEE2i7QEm/FCxFyWWI9d3DV1Pfo5p5CMwv9mSxixdmm/u2WysBBaROYnkO
         uqwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783477123; x=1784081923;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+bZZkJn8HHk752QXiuM3ujnnoUYImIUksTU2DD+Ftzs=;
        b=SV7FGzOoBg1GwiAIexZyYB9Z0GFNzQvho0GDSZa7VDtV/GQ63D2y7J3IXdFKqCl4G5
         apGOzREkpJf5JX0pkUUZX9p+E8r2chOIV4Wll01d1HkuhudgIg/ZYEwugC8bPy2w+2It
         qgAxxjY2YUo4IcIL2zL1KPtJ229/l7JMt/IExU3X2o01DtW8f1XHEisq4hWVgGB2G9fB
         tFA5FpqKxSMPvVCGagW1c/LFx+XUbuOqXz9uRyHCU0Ic5MGcKvQsBBm/tJVf6nLubGKP
         fPXfG3bDz9+DHC4K4D1ukntqLGnP7ggoUNNeuvxfJ/PL6xGwh1+sz68KUxZtYrZPLxV2
         vjtA==
X-Forwarded-Encrypted: i=1; AFNElJ+FAoHT98PIURJQmbU9HgIDk86O5RbYHe17YEYl1kO8w4q8hYmMg6qM4aw8PbNIrJsDsGO0rxjDs4g=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEfq6CzgMUG3qcYiR9BxzSmhVvbyUy9POJGq6Nkyzk9QYZ6yEB
	g68tpSUsZxLDJXnRuUyoC+E8mJlqoczCibZ4C57y4JGEs0cFspxe27gR
X-Gm-Gg: AfdE7cmj+VpPT8JCEvl225rlSjoqmzEv+EdiwLQmgJEcD9s792bFKOiGnm8JjMvog+X
	CK3B2ktF4+qQKz4A6PcRLOZT7q+2fCCAsJv21l3RtZsxrizDRU/lNIbdE2vdYklmqzHxw8+GIN+
	lYAZc65SnncF+mFamr++9kxnGDns63XTf7G4AlXZRm+Rk3OSI1Mig2squmcFzLkVBWXjmtpR+Wq
	EpWBlfRj3zeykIk4HE+QlxWfQ9B7f5lDtKh66BRG8qoWc4trs3nlODTlxBHPORDlIUtxHUy3GKY
	F5alJZo6P1cPkk5qetUsqC2SD/yAkwPwCSbrJQh6avenIKBAahZPPdVmVqsg9+HaKz2suUXW/43
	ysJCiyTkfEqSJbwHTT8YkoqoCGvhXScU81Lo3h9KbJgoMDraOTQBZFmIrjH3s5DPZmUe7ZWie+W
	KzyrBS0hotGOD+oRQnWvvUef3/Dn2yjgbTffkbq/H9T7dlMXFmMoI=
X-Received: by 2002:a05:6808:4489:b0:4a0:96df:d25b with SMTP id 5614622812f47-4a2043cd022mr314410b6e.30.1783477123155;
        Tue, 07 Jul 2026 19:18:43 -0700 (PDT)
Received: from [192.168.0.245] (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 5614622812f47-4a1aa006f74sm799975b6e.0.2026.07.07.19.18.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 19:18:42 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Date: Tue, 07 Jul 2026 20:18:10 -0600
Subject: [PATCH v6 10/24] dyndbg: drop NUM_TYPE_ARGS
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-dd-maint-2-v6-10-381f3edb0045@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783477102; l=1538;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=XQqP3CGhUC4Qf0a8iBvGk8T4hUKPih4ej2z5w1J7I+A=;
 b=PIPrAECRZ0zDaTF7+iZRCBuVAOdGqa69o6EfhQnrslAWBa5zAEuRMzEDoA8dnHoDXD/9BWJ4V
 6EUQyIE1KtYAbI3nCiqpaQWMNLdmPAheFdFtxbTDgxWqtYEFjbJO8Ah
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=

ARRAY_SIZE almost works here, since array decl is complete.
But define it locally, named __DDEBUG_ARRAY_SIZE, to avoid
include conflicts with  boot/<something> on some arch.

no functional change

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
v5: drop include, it causes redefined probs in /boot/* for some arch.
v2: include linux/array_size.h, correct commit subject, review after sob
---
 include/linux/dynamic_debug.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 9607121c3072..9ae1accb9bf6 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -8,6 +8,8 @@
 
 #include <linux/build_bug.h>
 
+#define __DDEBUG_ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))
+
 /*
  * An instance of this structure is created in a special
  * ELF section at every dynamic debug callsite.  At runtime,
@@ -122,11 +124,9 @@ struct ddebug_class_param {
 		.mod_name = KBUILD_MODNAME,				\
 		.base = _base,						\
 		.map_type = _maptype,					\
-		.length = NUM_TYPE_ARGS(char*, __VA_ARGS__),		\
+		.length = (sizeof(_var##_classnames) / sizeof(_var##_classnames[0])), \
 		.class_names = _var##_classnames,			\
 	}
-#define NUM_TYPE_ARGS(eltype, ...)				\
-	(sizeof((eltype[]) {__VA_ARGS__}) / sizeof(eltype))
 
 extern __printf(2, 3)
 void __dynamic_pr_debug(struct _ddebug *descriptor, const char *fmt, ...);

-- 
2.55.0

