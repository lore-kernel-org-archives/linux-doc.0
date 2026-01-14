Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 649302F4A1E
	for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 02:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768356006; cv=none; b=PBxOsn6HSlQy6lhrcJz3uxnpSDEPBt7ytbZHPI6bmvOUuqc6RB6fp8Gm60uVxp4PPGNoWSkfiU35zMR3SpxH6O2FWgV6EfQT1jlmdCdqOZMwRJnPITvDM9EGHgCXTu7wM8SHprGGsW0OufHszikN/x2+SU35qyPM3qva46bNfxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768356006; c=relaxed/simple;
	bh=DLGYLqotnJ3r64tEQiOm4CWPKlpXwGXxjO6LBdcTYjk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fDKNkYbiI4PcYyzSxJl2k3B0u6SZwooPKXeEAfIHFF3VEOnaRi3m8UIYSuwELeBNAkIvxPSkdUjArCxqMzAwx3N4YD3ylGP0Jkq42CLFnYHnJxq0wC77F2ifXdF1ugi99NUanzgb/wp1YCPqhspBYsUXsxcKMs7JDaDaJru7w20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mqovvhhb; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mqovvhhb"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7cdae63171aso6074317a34.1
        for <linux-doc@vger.kernel.org>; Tue, 13 Jan 2026 18:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768356003; x=1768960803; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kgJaffb+G8M2IXpwFpfYggq/3ogV1jI3bmNBB+yiGR4=;
        b=MqovvhhbylkAnav9RHhKAnsn+hGPK5GPZHSmhui58leN8/pfqXYZVn/21zNb5WgY8E
         uYi2dl9T7mLiLd8Ms2rLQgIcE0q+wiMDZUXYCffl3ZLQh371Vb8bwtWFxDzteRCOZvZx
         lha+UIqqQI55TTf37bZGidj8cPvouJx+EYL+vhVcPsRuAhwF/oPBFL8Zq3N7pIJ9PsZH
         YVRlDQGHDMgJbgnqL9FttVlMfLU6lnMfLjA5b3cd6wQKuIMDC3HehRX54nZk4RKEy+kU
         SjJkfuWMTzJ7TL7h+ieFA/1MUq9UBxTZ1+4VIh75ygdQZRUSDG2fTMnbx520vhuRutJU
         DuAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768356003; x=1768960803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kgJaffb+G8M2IXpwFpfYggq/3ogV1jI3bmNBB+yiGR4=;
        b=E87pyFyxQkYLKg58kXmjYyDLlxBoWS7Fl/dy5THo8rfNzKqJFjJTmSun2LuZxtqHzG
         FjgKTgCGaBRkddWa3wd2fMp7e1bAR+Zkb+DXmFTt5IDTTzqDM1jY5ewWZ2GdAc9BdTNl
         LgINkgRqREJvB6nVwpJ/Hb3rCigMxibhLEK6hUEP1KYBnggF+F1oxO7lwiMNMX5cuPiU
         LvRDoiXs/H1VneNYCZE1KXTCBzJuLf2egX/cxVgHi10Cmv9xP3vuTFmNaHAmozhxA7aj
         iiV7dDLtvhXA3CFwYz/n5YMpXgU4VG7VX5i7nfTfNiYVrOFLz+jonvvEkCdV8drVN/vc
         a97g==
X-Forwarded-Encrypted: i=1; AJvYcCW3jgPtyB4HtH4AAZmipOy7tDr+H4/yT6T+jEiyHOQOftIl/1OtfS6DWGauKsdVUorXY0vXy6kmbek=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt1hm+JubhwiDsISXmqOoT06c/8261T7/9z3pJ4hpCPHMJlsfW
	kGJPW3eecYyB6QLrF48nKN6/lOO4SNMjNjSaD6N+qwyoqVHjRn9cknC1
X-Gm-Gg: AY/fxX57tQWAvFudncsBsvuqCIMX11Ke3dqrudd3iwQssxDNpE1CqPvo+rVi2CJRRxD
	m+uQvl2L+MJXvu5XfSlLR9mo/rii+GnABLHlXm6eFB0Ng4Kd7oatkipB0Dphwr3mXlgjM21tHBh
	5LD+nLEBQI4AgaeDYXqUW5c2z1jb3spR2tZ1Zz6CapwHtYr+z42oIO/+zDJYn4XATeWV2icXLG2
	Zf+fdsRjxlg9jwUSdSnvZC56tRd0LeV8EYpa1z3dP3sbKfuaNBKSrKuaLOfaX3j/cZy1IXp1RYg
	nJ+WeIBAAf+R5lgDwKeMy/lMVI0Lb0/fJalVdz0JNWSRb2xH7BKIvm0cba/RT8Wb+dQq2ZHmFoz
	e7Myf9KsGp0PfgrS8f2d1DwyFxxllJVlS9QbuHHewOUaTvgRKPS2wF0GVPVxqVB0xz3r6Tszn/g
	wPTDKuoxHPsbbxDovN+M4E6LmGQVxvgLGr4JBFZsehJj6cWVE=
X-Received: by 2002:a05:6830:3110:b0:7ca:f639:4be6 with SMTP id 46e09a7af769-7cfc8b29b3emr1059472a34.19.1768356003373;
        Tue, 13 Jan 2026 18:00:03 -0800 (PST)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 46e09a7af769-7ce478ede43sm16651614a34.27.2026.01.13.18.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 18:00:02 -0800 (PST)
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
Subject: [PATCH v8 20/31] dyndbg: change __dynamic_func_call_cls* macros into expressions
Date: Tue, 13 Jan 2026 18:57:36 -0700
Message-ID: <20260114015815.1565725-21-jim.cromie@gmail.com>
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

The Xe driver's XE_IOCTL_DBG macro calls drm_dbg() from inside an if
(expression).  This breaks when CONFIG_DRM_USE_DYNAMIC_DEBUG=y because
the invoked macro has a do-while-0 wrapper, and is not an expression.

   if (cond && (drm_dbg("expr-form"),1)) {
      ... do some more stuff
   }

Fix for this usage by changing __dynamic_func_call_cls{,_no_desc}
macros into expressions, by replacing the do-while-0s with a ({ })
wrapper.  In the common usage, the trailing ';' converts the
expression into a statement.

   drm_dbg("statement form");

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index d543b84d447e..c4ebbccca5d1 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -217,20 +217,20 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
  * (|_cls):	adds in _DPRINT_CLASS_DFLT as needed
  * (|_no_desc):	former gets callsite descriptor as 1st arg (for prdbgs)
  */
-#define __dynamic_func_call_cls(id, cls, fmt, func, ...) do {	\
+#define __dynamic_func_call_cls(id, cls, fmt, func, ...) ({	\
 	DEFINE_DYNAMIC_DEBUG_METADATA_CLS(id, cls, fmt);	\
 	if (DYNAMIC_DEBUG_BRANCH(id))				\
 		func(&id, ##__VA_ARGS__);			\
-} while (0)
+})
 #define __dynamic_func_call(id, fmt, func, ...)				\
 	__dynamic_func_call_cls(id, _DPRINTK_CLASS_DFLT, fmt,		\
 				func, ##__VA_ARGS__)
 
-#define __dynamic_func_call_cls_no_desc(id, cls, fmt, func, ...) do {	\
+#define __dynamic_func_call_cls_no_desc(id, cls, fmt, func, ...) ({	\
 	DEFINE_DYNAMIC_DEBUG_METADATA_CLS(id, cls, fmt);		\
 	if (DYNAMIC_DEBUG_BRANCH(id))					\
 		func(__VA_ARGS__);					\
-} while (0)
+})
 #define __dynamic_func_call_no_desc(id, fmt, func, ...)			\
 	__dynamic_func_call_cls_no_desc(id, _DPRINTK_CLASS_DFLT,	\
 					fmt, func, ##__VA_ARGS__)
-- 
2.52.0

