Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E15379973
	for <linux-doc@vger.kernel.org>; Thu, 29 Jan 2026 07:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769671826; cv=none; b=qjUwL3Dingf/ToQUgs0RZLrNMZuLyAzRTkRh9aUIerkbAQ7TiVN5bSHsY1jYyNpURJH9VtWC2gZH3mCRUwgcIT2ez4JM4spBRPDgHfB4vjOXPXWKrb5bvrGJqzK3B9ZNaaxeGW+EnINnKmMw1I5bPp+eLrsSN+ceJF64jL9vSKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769671826; c=relaxed/simple;
	bh=Tcb8OWesD2RRJSc/qHmqIYrbJmHmDyNZwGeNJwwuhUs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hsODBwbZ8G/VkhXir7qPgd4n+fA5Z1naXhTOS3+f8y+sGhDb0Cu3AdupO+3cMmvKbFONu/sdl/Q+y5n9on4gQuFGHfm4Tl8K8mpYoNsqHap8d1ZDU/wOyc1NH05GbKAEea/0XX1wBRhKwxg8dpqMqWrCcIxM2juEuFku9hVYzzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QKQ3NBI9; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QKQ3NBI9"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-45f004e7d71so1116924b6e.1
        for <linux-doc@vger.kernel.org>; Wed, 28 Jan 2026 23:30:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769671824; x=1770276624; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lWBgactQrIZ1su7qA+LsEPA2s9t2/HSNvP/FFiyIdUA=;
        b=QKQ3NBI9UV01Y5CNjhR7evQcc8uOpX89fyb5Eli7L8kt01zr5ECq5Fzmo1tiwumZNg
         gFZ7svr73zp86fMEzH+GWftdVvZXU7Nmfi9D3LcvQke/xOArokD30qGHwQAy2zhcOWdA
         BmiNZR9nokhmEek0LH9FzqrwU4GMvYowXivVUDcmMsFgBFqasymn7CKSEBLvmH8KX7Qt
         QAJdNT8PGz0QVHp3fye7zKGSrXgQC7rqEN/FFkIkPiQLCbTEEuflYulHkryMFavVPFih
         lz9D5KxuhYueuqfq0rKt/uJSrfUG5PQ17KpsiszMtK7yaHez8ak9+xPI665eOiGeoe8U
         fdUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769671824; x=1770276624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lWBgactQrIZ1su7qA+LsEPA2s9t2/HSNvP/FFiyIdUA=;
        b=omqCzoeO2O32aW008Zvi9GzIWdrpdDYwgwzYmfS9S5r1AoEOPSRX0UFWoaFhEBn3zP
         /PSbDN5VPcwfSFggd+Fjnto8NnOI0OlgVf1hiMc/04ypEY9wa/MAUFlibt65n17hKblF
         ToHAE9BZI77ImW2htp0yhoQag57APEKH+WNTYIYlT0Xr3kXBAi+MtO4uKQjtV/7BWeAN
         uJXj3wK8S5wVYDWRPG8BESOg3o3vsZc/EmcE0/qciIYE1JQfxcRSucWPf/l+KTw746cr
         BH/MDv7TdLuPhXtPYiWgSx+D3hPqO5UtuBaU/BDFTLf+e3SD2OBK+HEtiHBL+2T3/sis
         yjQA==
X-Forwarded-Encrypted: i=1; AJvYcCVTlF+l/FptP/Z6gzqzP4OIybHJr/VitAzWO+Zohy65T/QU2SQ4fr136/WUjf9QowBGLWw86wlEzN0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7oH7Hjhjs6d2zSoxIjiF1rxn+zWQ7vFeaDdkTRSH+8egL6mX4
	RLdDnGOySQh0QHN74yopSv8vfyUBmQ3JAOeBWlZ4dlToocxdL/phZdkE
X-Gm-Gg: AZuq6aKQp4B/PspD+e2OmG848nU+wvxQDO36hMxchs2wR6yEFV84eoEpBw1K1aumLv6
	Trf/+o6Ebad59Ab9GnAFxsDMwlfN55HUq3RagLCXW82yljnrPVYG0Gg+Q2LR4oc/A6FrCzxEepq
	+sRB7bflHbtxpPXq4oW7kQfVzLBmdEZeBE59Qa78qef7Jfgu/aC5NyzFZFg/aK8fF3oQHKMOc8s
	XTYj2zseI2Dkbf9TYRFnbs5GU7yZHn05t2tuzr4tUSHRyxPiyzU80nxz82TcCXrc3H9uy8pd2xS
	2m0tMuvYNuRp5r8VnC1tMrnCTZNDEgYMYev1FxxakHSGa5miaPaz483q9xx7LydvcZWptllN9AD
	m/V3oD1OmXHrwRawx92ZmidlBdxyLue63NsqqjcWMymBJ52hNaTan1BXB9u4yykh2zwM7AjcMjm
	8VHQ98XPjQnmBhsCXlOGleLtmdlRc0cZ4JJhHmXeC3
X-Received: by 2002:a05:6808:3a07:b0:45f:13fe:4a2e with SMTP id 5614622812f47-45f1e352fb0mr985931b6e.17.1769671823662;
        Wed, 28 Jan 2026 23:30:23 -0800 (PST)
Received: from godzilla (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 5614622812f47-45f08d894f5sm2741734b6e.5.2026.01.28.23.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 23:30:23 -0800 (PST)
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
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 09/32] dyndbg: drop NUM_TYPE_ARRAY
Date: Thu, 29 Jan 2026 00:28:55 -0700
Message-ID: <20260129072932.2190803-10-jim.cromie@gmail.com>
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

ARRAY_SIZE works here, since array decl is complete.

no functional change

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 441305277914..92627a03b4d1 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -132,11 +132,9 @@ struct ddebug_class_param {
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

