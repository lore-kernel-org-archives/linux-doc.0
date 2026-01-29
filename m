Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com [209.85.167.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85D837A4AA
	for <linux-doc@vger.kernel.org>; Thu, 29 Jan 2026 07:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769671823; cv=none; b=FrCTYm7CZGzLMCLQ8YqukMEU/vC25y3mMcSZzvBJO73lWTTREABrxqFZCCuKXuop//arhB3a7EBcIlwae93GyVdke2Dd8yb1afJgFLWaqgk98dauvRTq0oD826s51hdixGywH8AKYzBubV3iYbOonhJe+uDfFu+eX3FBrDr+tPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769671823; c=relaxed/simple;
	bh=awXqyY30KZp9uCYjoergwYxo1W9o2w+ZqIhz8GNp/Mg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C+K2FBmAtYyzL0okpcl0Ou8FZFR5CSZ4XV/dLDGh9vfvjC9eji5qO/x2h6mG/3V0YgyKNrsd2Ar5SpXP6GPIoR7cyqjnXQjK8+Qa0ZF44CuiivKKrb/aqlB2dbQJHPlIbfLgdcehJVLhhlyUSnjtVR9THIrRVhWMoGZc8U4Rt40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R5mpU2x+; arc=none smtp.client-ip=209.85.167.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R5mpU2x+"
Received: by mail-oi1-f195.google.com with SMTP id 5614622812f47-45c9f47e1e8so258455b6e.0
        for <linux-doc@vger.kernel.org>; Wed, 28 Jan 2026 23:30:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769671820; x=1770276620; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=go+flHjCFj5QaaQiPaxub6cNyzDZojFZJyQzORscVMw=;
        b=R5mpU2x+nlX54uF9S4NxFdR6TCWwXWNLVlHE+nXaccPdSj5pkOB5hZ+8iQ7UVy1zwb
         lKmrgOeJpwMPKCR0iUmuQH77NPVXbDrJS/9IsThwz56xXp0XisgsT+mg+ww+yUK8kwi+
         uJpWUKt+WYVasrbI4cvHvmoVYPzR3m2wX38BYZzJJzfpxGmENSus7NIX4NwHk2gbkOik
         8zv3RNg5qqydEzZWYfT/0iDsF6Kyb7NFou/H2HRx6I50MzSzD6GWIrzRGB30XlfmMmXr
         Tk/fUWPw2oSkVZ26P3hVc21nkVcnjz8eVOiR6QTs00POvBmnjaxQl0xjqIUoWV4xBsy+
         Q8mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769671820; x=1770276620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=go+flHjCFj5QaaQiPaxub6cNyzDZojFZJyQzORscVMw=;
        b=Iy+bZ3VzlrVgYiu86PBVpaR+tLsof1N2rGsRCNy/xlr9qfvKnotJ4+LeLfP69K8yUl
         UhCHRXkA4rZ2167UUmAyuuTpPj+cTRzA4w7hWauuYbeYpGkTSkwZeisrCr5tmiRR6fac
         ee3f6xF3hjO8OSVwD//HTVQAy0x5y2EMIGflVQuQVKnkh5dEBWL9lSUNqYRSk4kY8LDK
         RciNdd6s6cLz3FDsPGXeH9+dfRcNii7TTUbvm0vv6RyrtO8moYpQ55lBtFvSJrVJTd4k
         fup/1vCMRHSAqMBf0fQbJoGQRCCC4kl3BvZPkV0+O3nlQ1CZ5vDVsP62Wty+6VTbLhXz
         nZ+w==
X-Forwarded-Encrypted: i=1; AJvYcCWpRK+QzS/NtvCxxDsOf6ZBRHpM68mMr4mNIO/pBw9/zcXdOT4jUUdSV76IkWKiR4hfthB5Iu4Jrk0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBfWqLp3cnCUiWP9X8Qo9CTc+QeuUfETHv4vKHVFhmaPNOsn3+
	tPF2YnB5K829eGh1PiIIWCUlvfNBjRmj65lo8adqXucX6Nk1TwccKZBr
X-Gm-Gg: AZuq6aKUgb3PfGlFeQh/TPUrXlHWJT2o54D4tyNUhwog44n5crY8WM2J688lOGLhXaV
	MAr1XNSm3iJyhuHjyEpHxChN9QfcRpPIm2gFzOC412nGm5XuKjKLMVvSrOCyFwt3dDR2Pl1kc0x
	4lN73cUa0XLyh1uwtMnqiSlE2ig7pau8NLIFYKgHA7mV5m4t94T+5WzDUUX/qCwIdQaCVu0KQuE
	v0qr2qryUrkdFzj9Gfful+BZ5lWkJu8cHDD53VnT+g4z/aG97kKz+r+VoUX3L2KE1Ik2b0oZMYK
	K2HlC68sPEuV6wkFnL4kuNgh1k9HHPKuP/2XNYy+gPndlEO7FgC0CEhW9/EFE30iik3YOB+BCU/
	E/y7xNYQYEzzBVHhPuJOS9c+2neQ/IgLGU4QQOIsIkHpU3wdrx/ylexYo1U1z90AScqRnYkPlxs
	vX35C9YhrMQIHxTmmm+iGENjNKnUdimk++3TdtfY5T
X-Received: by 2002:a05:6808:1a08:b0:45e:6697:b7cd with SMTP id 5614622812f47-45efc5d1a5amr4649291b6e.20.1769671820601;
        Wed, 28 Jan 2026 23:30:20 -0800 (PST)
Received: from godzilla (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 5614622812f47-45f08f73625sm2638135b6e.18.2026.01.28.23.30.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 23:30:20 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: gregkh@linuxfoundation.org
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
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 08/32] dyndbg: make ddebug_class_param union members same size
Date: Thu, 29 Jan 2026 00:28:54 -0700
Message-ID: <20260129072932.2190803-9-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260129072932.2190803-1-jim.cromie@gmail.com>
References: <20260129072932.2190803-1-jim.cromie@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

struct ddebug_class_param keeps a ref to the state-storage of the
param; make both class-types use the same unsigned long storage type.

ISTM this is simpler and safer; it avoids an irrelevant difference,
and if 2 users somehow get class-type mixed up (or refer to the wrong
union member), at least they will both see the same value.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 2 +-
 lib/dynamic_debug.c           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index a10adac8e8f0..441305277914 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -104,7 +104,7 @@ struct _ddebug_info {
 struct ddebug_class_param {
 	union {
 		unsigned long *bits;
-		unsigned int *lvl;
+		unsigned long *lvl;
 	};
 	char flags[8];
 	const struct ddebug_class_map *map;
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 55e07b706c84..1d13e3ee3e12 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -811,7 +811,7 @@ int param_get_dyndbg_classes(char *buffer, const struct kernel_param *kp)
 
 	case DD_CLASS_TYPE_LEVEL_NAMES:
 	case DD_CLASS_TYPE_LEVEL_NUM:
-		return scnprintf(buffer, PAGE_SIZE, "%d\n", *dcp->lvl);
+		return scnprintf(buffer, PAGE_SIZE, "%ld\n", *dcp->lvl);
 	default:
 		return -1;
 	}
-- 
2.52.0

