Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com [209.85.210.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4BE8309DAF
	for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 02:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768356014; cv=none; b=geBqruqQH7ZeNs8tbzJu4opxd6ywgsAUu1yXLqnECsxcMJKNLqZ430xsBeX6ULZq+PpQJf6itHDz2j5MK6Wqy3Ygk/n9g+F7HxfQDEIF2lwFfzTLofElpJ6SqsHcjbFHOID/1dcuo7FcRXiBGjSAGgiLzYZPvY8UbiJyQ6+pEos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768356014; c=relaxed/simple;
	bh=1sM428IcCo3LF0ivOmThhJmgO0lyRvaBC5WHALmVNys=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AGCFuTVCK9RrsAkGpQZtN9O73YO4ZplEYcE6OZMxRFsvJoNgE4ULHlRcs8LL9b45K5bRjLj4UovhB6VjMqDhf4AFN5r6Zd1LiF06q1WcBcwEzD703ZnnGD1VKC6S6wlxI74Nuynum1Yo7UCoBSfezqwtBhOioVT/OmKrtLbV0xY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BMiIfe/4; arc=none smtp.client-ip=209.85.210.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BMiIfe/4"
Received: by mail-ot1-f67.google.com with SMTP id 46e09a7af769-7c6cc366884so4256146a34.1
        for <linux-doc@vger.kernel.org>; Tue, 13 Jan 2026 18:00:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768356012; x=1768960812; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m6OB9Pa9Gle2V+EOSWrg2iFtsBZdBFQQ3jPBPibwDk8=;
        b=BMiIfe/4rNwL/GniPiW2ar2IwANZhjPN+PKflpPEZ9SFem+T93FK1IotmTLl09tedl
         i91bOi32ng0tcsyAQ5kDPO8rbAlETRlNGdbg8V0EKThCH4Z/wg1UyLk4MYl4WNf0NpCf
         vuZ5y4p8C7rw2sUbj9VBDa/6RMnZcN18BZbJCSLCATYRxD/LKfHvt0lqLMTpL2Xx4SkY
         qvwC+1VLLIJTstz5DYoxjsJPKVeVne72tBFTUPdtjDQHzcSXMEvjH9pxp79373FeSHd8
         8/qn8OE7LtwGgyoons1SuIPadKJdQ27nRMxMwNY4SpK0i23jBXevXVLVS1XIx43B+KBI
         x4Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768356012; x=1768960812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m6OB9Pa9Gle2V+EOSWrg2iFtsBZdBFQQ3jPBPibwDk8=;
        b=eIlln+aWbgTCaRN9ex/SWZnOOgMSzaDSg3fA8O54S0Kz53KkiTm+RgI4MZXZ7TZjmV
         Oqc+at9R1OG9W2oTrIq28yk/W4/mbnQwPlvqpOoxIJtfcco0vp7O4bUq3ojhkOOZw1ae
         0BMlZ5LtK51/j68Zn30V8BKXTG9J76+t+H7Ca05C9WXTityxDE33PnkfiXIQ6YNr6s3N
         3U8lJn5vewev2otEQhzlwlvpQ+FCr0EZJ5Fg4CP1CL28zSmR3cwwTBHsBn+LmVgRNCOH
         8jzfEd8Exg8t9dlXOEyhCcGcd5EfeNJaZUN+YJyMunq9UMgHNs7Ch0Bw0KuwijnKebz1
         jx7A==
X-Forwarded-Encrypted: i=1; AJvYcCWrzxffSMQgSmpyAwRJ04cgkV6QheVW6tGn/+QxEtPA/xO0PHqm6omvxO1NrvedFX/GWWcsp27VPPE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpyYkSqH+EuIsNxG76RSVbR9kLj/pJLXVMO6jtXIAYOJ+kkOKi
	J8Xeh3yqn8cHP488A5n3Jt26RRFr4sPhFRrisR/ZzJHBMJGtVIFaQ0v6
X-Gm-Gg: AY/fxX5ASIViZ30dn6VfGYVi8ZcTUNc0tdVLYcQJ9P9OyK1VAOU25CqiPpgc9fWP2kx
	tXwAtzgYXFAZzL9PAOnthVuQkUE06PCg7arUqU2PxNBahTDwAFDTMpgyhtwq9w+X2UESFOYoh9z
	AhzaD/pmljvua0Txm/jYus4KX8ubBzZorUr53zb1CspXtfjD6ea5Zfr72mK0+Hst0bPDcTXWcvL
	qtjfJp55e9QUG7xDlzkHQdgFbckDMRhVnKyg7GdafcD6GitiBW7LpF55EdjZRB+XX5jnyUPg9KH
	Srzsuh4Cz9dzmD9BtnyBMdvwlRc379h7SVXvIPyluUfWGBB30nUIITsB5S5z9Ir4AZPKR69Xq3q
	grPy/75V92Dnfd2liw6TsSngAmAtHzDtL6GtwIpnfzj1UG5W/CpqaZFDBpKGrN7DD6cl5LkA6FA
	Gju7ISGencILLCS1v4UeTyglL5LemLUaHtgndEtYhEknqubRg=
X-Received: by 2002:a05:6830:4393:b0:7ca:e8bf:8c4a with SMTP id 46e09a7af769-7cfc8a7b27emr879644a34.12.1768356011430;
        Tue, 13 Jan 2026 18:00:11 -0800 (PST)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 46e09a7af769-7ce478af813sm17036674a34.19.2026.01.13.18.00.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 18:00:11 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org
Cc: Jim Cromie <jim.cromie@gmail.com>,
	Jason Baron <jbaron@akamai.com>,
	=?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>,
	Louis Chauvet <louis.chauvet@bootlin.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Dave Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org,
	Petr Mladek <pmladek@suse.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	Steven Rostedt <rostedt@goodmis.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>
Subject: [PATCH v8 22/31] dyndbg: detect class_id reservation conflicts
Date: Tue, 13 Jan 2026 18:57:38 -0700
Message-ID: <20260114015815.1565725-23-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260114015815.1565725-1-jim.cromie@gmail.com>
References: <20260114015815.1565725-1-jim.cromie@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If a module _DEFINEs 2 or more classmaps, it must devise them to share
the per-module 0..62 class-id space; ie their respective base,+length
reservations cannot overlap.

To detect conflicts at modprobe, add ddebug_class_range_overlap(),
call it from ddebug_add_module(), and WARN and return -EINVAL when
they're detected.

This insures that class_id -> classname lookup has just 1 answer, so
the 1st-found search in find-class-name works properly.

test_dynamic_debug.c:

If built with -DFORCE_CLASSID_CONFLICT, the test-modules invoke 2
conflicting DYNAMIC_DEBUG_CLASSMAP_DEFINE() declarations, into parent
and the _submod.  These conflict with one of the good ones in the
parent (D2_CORE..etc), causing the modprobe(s) to warn

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c      | 10 ++++++++++
 lib/test_dynamic_debug.c |  8 ++++++++
 2 files changed, 18 insertions(+)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index c60c2142f8ac..e5a18a7d3780 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -1317,6 +1317,7 @@ static int ddebug_add_module(struct _ddebug_info *di)
 	struct ddebug_table *dt;
 	struct _ddebug_class_map *cm;
 	struct _ddebug_class_user *cli;
+	u64 reserved_ids = 0;
 	int i;
 
 	if (!di->descs.len)
@@ -1341,6 +1342,11 @@ static int ddebug_add_module(struct _ddebug_info *di)
 	dd_mark_vector_subrange(i, cli, &dt->info, users, dt);
 	/* now di is stale */
 
+	/* insure 2+ classmaps share the per-module 0..62 class_id space */
+	for_subvec(i, cm, &dt->info, maps)
+		if (ddebug_class_range_overlap(cm, &reserved_ids))
+			goto cleanup;
+
 	mutex_lock(&ddebug_lock);
 	list_add_tail(&dt->link, &ddebug_tables);
 	mutex_unlock(&ddebug_lock);
@@ -1353,6 +1359,10 @@ static int ddebug_add_module(struct _ddebug_info *di)
 	vpr_info("%3u debug prints in module %s\n",
 		 dt->info.descs.len, dt->info.mod_name);
 	return 0;
+cleanup:
+	WARN_ONCE("dyndbg multi-classmap conflict in %s\n", di->mod_name);
+	kfree(dt);
+	return -EINVAL;
 }
 
 /* helper for ddebug_dyndbg_(boot|module)_param_cb */
diff --git a/lib/test_dynamic_debug.c b/lib/test_dynamic_debug.c
index 6c4548f63512..1ba4be9a403a 100644
--- a/lib/test_dynamic_debug.c
+++ b/lib/test_dynamic_debug.c
@@ -128,6 +128,14 @@ DYNAMIC_DEBUG_CLASSMAP_DEFINE(map_level_num, DD_CLASS_TYPE_LEVEL_NUM,
 DYNAMIC_DEBUG_CLASSMAP_PARAM(disjoint_bits, p);
 DYNAMIC_DEBUG_CLASSMAP_PARAM(level_num, p);
 
+#ifdef FORCE_CLASSID_CONFLICT
+/*
+ * Enable with -Dflag on compile to test overlapping class-id range
+ * detection.  This should warn on modprobes.
+ */
+DYNDBG_CLASSMAP_DEFINE(classid_range_conflict, 0, D2_CORE + 1, "D3_CORE");
+#endif
+
 #else /* TEST_DYNAMIC_DEBUG_SUBMOD */
 
 /*
-- 
2.52.0

