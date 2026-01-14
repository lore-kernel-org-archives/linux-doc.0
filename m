Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F200A2F5A0C
	for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 01:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768355938; cv=none; b=tjKj93lNCRoaRaTvvsLiqQv+tSGAsFr56qHO6hNyIT8A2WewvG0Egxzmscaijxfl+KSBzjlpnZBno+DtO/PTYNGJIMtL/dYx/8yO/Y9qpT1dw8QASxNfTYNpr5ZTlEtqggHbxUIrDowv34vN03Dw2ppqTg67v/z4c4PVsyWA0EM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768355938; c=relaxed/simple;
	bh=Dl6cNQBg3u7SGfQmdKJXxn3my2NuuDbw75ihDoc9xW4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bd0dUFFHvBynudZhnu761CIck6vg3uPnn7ju8SspzHi/RUmM6ARiM1bAVlDFYfH2LvojPSpJnGZCnnXAssoOdxpWNMONwwhjY3fTlPwbm2F1wvaLT2ej6VKgx1m/mMbDggbOLh5+8EoltURF/7JiotlUd/AvXRynHcpolIarAHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YKvNYgJ7; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YKvNYgJ7"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-3f9ebb269c3so3790289fac.3
        for <linux-doc@vger.kernel.org>; Tue, 13 Jan 2026 17:58:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768355936; x=1768960736; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oa5wcVDeV5J5v7vkbrVOxP4Roi/4nUDRF2hheke3WoM=;
        b=YKvNYgJ7pxNABYu3ET3TqbUOcbI4Cmtt5k4DjxlMUso2hWTF40mwZ0SWFc4rX2ozjR
         eTylGhosevmasLg0EB3QSTC/X+Jjn06AA8R33IdyRJsqDFMdK/BCAwP9nZmH8R9FfXxs
         bXPZmLrCYahULm2zO+u+BGSq46xuxfXJyXoDFxXA0E42aNWHsy2PV36o84T49d0ZAInf
         /ceNZmzoLKYrv4rM+D4DsKbCvkoxrORikR+xcMsxZHMZujthWhj8OeE4YqeZrjtuAlj2
         MBlRQPATHkejTOpiSUYf3XTdLaqgMNnccY4cxb3FwEkr/wfFQd4cN5va5SGXeT80Sidy
         AjBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768355936; x=1768960736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Oa5wcVDeV5J5v7vkbrVOxP4Roi/4nUDRF2hheke3WoM=;
        b=LtkZl/oiTpl2lus1/kW9obyE5JsB508na635dxkVF+hZclnIMSfxCAw+6z5eh7Ew/M
         uf2iLmlJ0AHDrXYUkgsIWgjkaQ7havZeD3t+M+LcKdSViGsJz5wHYYL0maxfLj2Lzcdk
         FX8jHOQf0xOfHUp6jB6+IbggaWLMRdVrwpjJohbFEjX+SfndYUxQ5Viugr9fvQeNvQVI
         SQAhzgNQuJKC4ij7NOzMN0phI3+n+gnm3M54SDKLerqK5Da+J6XzRkIcU6R14Ihdo7Er
         JB32EvmSkfSC6lSMRk0cH+ozD3f/OgkYs6zKtpDDbUl44hJIwcnklT8Qk/03YqGdIyki
         ElQg==
X-Forwarded-Encrypted: i=1; AJvYcCVGupaEZ8NX5Rzb5sS5Laxu0/Fuov8WtwJ90kZC1S7ngPV0g45QZ1VzFntVfL0JwxU+OLFdrFClu5s=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDMnKJeqcr6+Pzm6HOCon2TRswG6x+k90va9l1V61WDsjHSAjN
	klerwYUclJ9rUA70Ohl+5UbHr8y72Icj7T57nM8dfRa4RtCPd+NlrE78
X-Gm-Gg: AY/fxX7z3qnhOLXtMrxfHVw1/ZRvFIZHjZLf4XSucQJs6CE/aJE/st91IgnyD/L0AzI
	6BDHbKVrHH1NpK+RH2xK0usiz4tl2/GYhkLnsBsVdddey1mACgg8akOgz75rGO7gD/gD0xm2OSE
	va31ynj3VjetT+OIBiDQrFR1aA6Znz3+sFxto/wOePEAnDcJMEZgvKRdytAyx2grrmHiqHFXRLz
	aB+b/9g267wmjBLgeF4ct24JItLEXDnGPCK5K5/LYjnPg+NCNPkZz+HP41XrTv5qaeWPWjXLPTM
	aCAi9kokh839TwtuxKSXJspGAiW04bfkS/FoFO3XQM3XmyC+F4jqQahMQMqNYQ+ZqNIdo9I5JhJ
	1hhZadZuM2sntfoLiGc/st8JQreQjCrS2YwWoHMiuvE8rJsFYdaoAHeJjM3CmJGdTkD2DSFruHC
	8f/4lVUBZeGIUmjd0YSWJO6XKZn2zX+7yDXHKo
X-Received: by 2002:a05:6870:3041:b0:3f1:6dce:b865 with SMTP id 586e51a60fabf-4040bffc5a7mr412510fac.28.1768355935829;
        Tue, 13 Jan 2026 17:58:55 -0800 (PST)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 586e51a60fabf-3ffa50722e9sm15400748fac.14.2026.01.13.17.58.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 17:58:55 -0800 (PST)
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
Subject: [PATCH v8 03/31] docs/dyndbg: update examples \012 to \n
Date: Tue, 13 Jan 2026 18:57:19 -0700
Message-ID: <20260114015815.1565725-4-jim.cromie@gmail.com>
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

commit 47ea6f99d06e ("dyndbg: use ESCAPE_SPACE for cat control")
changed the control-file to display format strings with "\n" rather
than "\012".  Update the docs to match the new reality.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Tested-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 .../admin-guide/dynamic-debug-howto.rst       | 20 +++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
index 7c036590cd07..4ac18c0a1d95 100644
--- a/Documentation/admin-guide/dynamic-debug-howto.rst
+++ b/Documentation/admin-guide/dynamic-debug-howto.rst
@@ -38,12 +38,12 @@ You can view the currently configured behaviour in the *prdbg* catalog::
 
   :#> head -n7 /proc/dynamic_debug/control
   # filename:lineno [module]function flags format
-  init/main.c:1179 [main]initcall_blacklist =_ "blacklisting initcall %s\012
-  init/main.c:1218 [main]initcall_blacklisted =_ "initcall %s blacklisted\012"
-  init/main.c:1424 [main]run_init_process =_ "  with arguments:\012"
-  init/main.c:1426 [main]run_init_process =_ "    %s\012"
-  init/main.c:1427 [main]run_init_process =_ "  with environment:\012"
-  init/main.c:1429 [main]run_init_process =_ "    %s\012"
+  init/main.c:1179 [main]initcall_blacklist =_ "blacklisting initcall %s\n"
+  init/main.c:1218 [main]initcall_blacklisted =_ "initcall %s blacklisted\n"
+  init/main.c:1424 [main]run_init_process =_ "  with arguments:\n"
+  init/main.c:1426 [main]run_init_process =_ "    %s\n"
+  init/main.c:1427 [main]run_init_process =_ "  with environment:\n"
+  init/main.c:1429 [main]run_init_process =_ "    %s\n"
 
 The 3rd space-delimited column shows the current flags, preceded by
 a ``=`` for easy use with grep/cut. ``=p`` shows enabled callsites.
@@ -59,10 +59,10 @@ query/commands to the control file.  Example::
 
   :#> ddcmd '-p; module main func run* +p'
   :#> grep =p /proc/dynamic_debug/control
-  init/main.c:1424 [main]run_init_process =p "  with arguments:\012"
-  init/main.c:1426 [main]run_init_process =p "    %s\012"
-  init/main.c:1427 [main]run_init_process =p "  with environment:\012"
-  init/main.c:1429 [main]run_init_process =p "    %s\012"
+  init/main.c:1424 [main]run_init_process =p "  with arguments:\n"
+  init/main.c:1426 [main]run_init_process =p "    %s\n"
+  init/main.c:1427 [main]run_init_process =p "  with environment:\n"
+  init/main.c:1429 [main]run_init_process =p "    %s\n"
 
 Error messages go to console/syslog::
 
-- 
2.52.0

