Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D29702F3620
	for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 01:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768355958; cv=none; b=fhOlo8dIOx/vNHDzjy29vNSEd8fBJyEz7gDDU4lG9QhO7B+ZYUkL4NXhMiBID7urbxeTW2yxqIAqxazYOk9Miycp25ynYQdOMvRjMU9Cfbm7UWk3KKPDoJU3Raqlai7yqN/aBTU9G+ghL4G0KDS6MrBveO5X6O7YTekig8qyv10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768355958; c=relaxed/simple;
	bh=wepq2o8x4t8iETVUIn8EzyPUIPyNNDfZPTFTI/EzHMA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i57x1okqE0HlGbe43EiSLUl4oOO6OCRaEs/awFFm2IdEKM4pzO9ey9GTvWgjMcKy80Rx7ckUsyzLVvWZ58BWx9OabXwvtrfZw6mKa8Dtup9aykbLanoPe+oD5inrr/NHu5itaDnwqI/iEH3R89mjq6QceWsuvSftYKbKB1MMekM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YY51IqhK; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YY51IqhK"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-3f13043e2fdso3061372fac.1
        for <linux-doc@vger.kernel.org>; Tue, 13 Jan 2026 17:59:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768355956; x=1768960756; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kbNTI65sKfDeAaHShpwIIW/4QzYcWu3sc0P4jYcnBH4=;
        b=YY51IqhKspdcJj6FNE+ZxMqs0uqzgji/iYLdJtf46HEy6xkTMDPk5EFo2H9UekueP7
         eNQJ+lAaQyqn3hcAWN3txWtvvqmRBw+g/tXxE3lkgSy6XKeShWzUAOo9MNpvEXkpO3B6
         WBHEjpz2+QdNnRYgV8A+oNK+Ze/PpyUCxbBUamC4Wbx/S1WcJ2Ym1VECuXuvLtn5uq/X
         PJf0bmCL/XcWk3mOCkKZmJFRepEROstuJrtfwQHS+UUhglVF7C4RvZJSHC28KExOYyZX
         uZdKDg/Q5Nx71XF2g7WJdYbFCsDZ/44VLYQZqBBdlF4SNcmg4b6OT2K94b4rCFLf0qTC
         h1tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768355956; x=1768960756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kbNTI65sKfDeAaHShpwIIW/4QzYcWu3sc0P4jYcnBH4=;
        b=bxzbIXEBbLM3a1+EOH9MfHp5cMWWGGMnRox4itg93oPuKGULc9MT8WPNM3vhFLNQFy
         2AaiuaXVJBOyDGVXRJq7aPVx0+5OrxvmeAsYA3sHh7Jb+XxZGK1bpZp3+39N7/QbxjZp
         piDoTPKwSmN0uDbvKln5yVwpJ/8k2sVVDV2ISwls8WKUDhQ0/tRIzAuBE3wk0NWt90AR
         k5tAI8vUILOwzii7DqU3Ei3SFaKaJYs0Gew3nBKvUvvdj3xrlvkkzYrJU2kFkZDiYAK8
         mhPndeR5ASR2UONmnvnobJ65L/McR6+kuntWuVGaTMIS8tSdE2QbtCVFvhmZ6wJjmg9g
         hsbw==
X-Forwarded-Encrypted: i=1; AJvYcCWuC01/xgzvabole6psZYBmnIaCRKYVeQz5J/gesXel7TAEh/lh1vcZaaeZP1FHkCVEEF+B8r4W9wY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpKp9aT7zjS3Xy2VPUMEFggqWMTKtgyPRAiX1iCG0ZyKHxATFG
	bvsCbsgyOg3dFrXfHoCOUCRoI3KTV3jQVYCRguG+E5M41yysDTyN0VVq
X-Gm-Gg: AY/fxX4QR7tba5u+74QsErHjvni2R04BG33jPTrRDXRD6HDZg4OPrdu81P+HPa5hvYe
	Vz2b+kMsSBPJ9iCKsGFvGQHMeqavHfIJZFWhbsm5WSm2mN2KW5ApYiyXnK+XunqRKZ09BccDGU/
	l+TgBXEDflzB2oRqBREYiU8qXR+zezIv/6o2vVwwZnYTZSkI5k734YiD0ITcdCRa0On303N11wT
	/9ldRkoglHc2ySL2OgutliF6S9ALaN6WkqDVbZqVhWee7G4tB7WxGhRxK5w1PCgohy3278jri6H
	6ndpHBChe5AlerCWx13KOWWBRxERBz8ILi8VoIoWc4PFvUhsdYVgCUaW0FQnrJfD3ZDP1UDJzrk
	oTz7Bt4HP3AToYnprh0AEPv4zaj5DyMAfryYMQiJfUcJi+tFp1LMEJcCp7sYprb4iPw0Q+81lIC
	E2tBqUGCWWSCRTu3pc0SC8ie7Tx2BqxLAqML8L
X-Received: by 2002:a05:6871:4e4c:b0:3f5:4172:21d with SMTP id 586e51a60fabf-4040c0cbaeamr399585fac.56.1768355955607;
        Tue, 13 Jan 2026 17:59:15 -0800 (PST)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 586e51a60fabf-3ffa4e3a7bfsm15083510fac.8.2026.01.13.17.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 17:59:15 -0800 (PST)
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
Subject: [PATCH v8 08/31] dyndbg: drop NUM_TYPE_ARRAY
Date: Tue, 13 Jan 2026 18:57:24 -0700
Message-ID: <20260114015815.1565725-9-jim.cromie@gmail.com>
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

ARRAY_SIZE works here, since array decl is complete.

no functional change

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 4b7c3b997657..c4ae79f934d9 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -131,11 +131,9 @@ struct ddebug_class_param {
 		.mod_name = KBUILD_MODNAME,				\
 		.base = _base,						\
 		.map_type = _maptype,					\
-		.length = NUM_TYPE_ARGS(char*, __VA_ARGS__),		\
+		.length = ARRAY_SIZE(_var##_classnames),		\
 		.class_names = _var##_classnames,			\
 	}
-#define NUM_TYPE_ARGS(eltype, ...)				\
-	(sizeof((eltype[]) {__VA_ARGS__}) / sizeof(eltype))
 
 extern __printf(2, 3)
 void __dynamic_pr_debug(struct _ddebug *descriptor, const char *fmt, ...);
-- 
2.52.0

