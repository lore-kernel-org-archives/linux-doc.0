Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2570735AC37
	for <linux-doc@vger.kernel.org>; Fri, 13 Mar 2026 13:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773408186; cv=none; b=VZefm91ZDhznAMAvWrUGjFRl8tMTxI9RdTcHHZESP7M3HZ6xOCp7DVwz0V/ElsoUO5goez/s36M929WoaSkf+wZ3PVmcFYmVoV47+zYCcwRAMaQCVtatVtiR0McUKLx6W8FJzc2NdAWNvJeafdHNiD608V3uUhn+3hQLdruoNM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773408186; c=relaxed/simple;
	bh=cyuCHdINxAxB3Q6Ll+XuNXFb67j/pcTpl5AcamKnQbE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LiWNwXKB0cECLIh2Sej/mEYQPxGxI+p8jmRbjs7IdLZU7lyS20YO/C6EETpgNMGblXb57gQFJFiz+DTRzzOS9Qr26YnkvGfxFDJm+ixVGzIT7/AfaOTQZV+XyQwfTuo2rwBe10Gbp/Lw8BUfncaEyz/9D3o5W8/HXZYKUhVRtf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G4q1L3cj; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G4q1L3cj"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-4670464029eso1288798b6e.2
        for <linux-doc@vger.kernel.org>; Fri, 13 Mar 2026 06:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773408184; x=1774012984; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vld9IFfyvePqt5M1J9/OwioGOqjnLV2rFk+KzTunpXM=;
        b=G4q1L3cjfh+7wIBsaUQdBYz9NOyeDWfd3PfYkzIXD3QVKPDP2eMjOVdYFczU1Qtktf
         QKAG/kaUfV8CfExK5oj2OeRoZfFfNre4MhV07gvPe8gdLkcn/ZrqaERpembqMxg2qomu
         rVZyXcSfc5n3mXQZozUplim2sHqChyHQjx/ONn7Ii185HagDIybYpP41XQG1O3gvYJR2
         5BL1/SbsaHK/as92iJZYT0RqWvFhwM67cbPUzQ6QVFik3r4pVaAqc/rBkytuSuEmctfc
         NJoYv05yq+L22Tnc4ufDtKq99Fb699oX+QbpmSCWtOVWXVBKUwiaEJGrgddcevUCWNt1
         6ZiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773408184; x=1774012984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vld9IFfyvePqt5M1J9/OwioGOqjnLV2rFk+KzTunpXM=;
        b=fOMlTQkIMXR8Rn+JbfD1SKSkwB8AxOsXQf40YPEWoJD6FqTDal2DekCHWoOBvcuyjf
         RS5TLvf0OZwguP2jAyTBIaZa9uRggR5f6leSj0NAeTn75sjNZrrw90TeXZ8XqwsFFICa
         w/ZtYLVi0jXYFYdnRdrZqHKrmlkFimuHwukSLcAyKoQ2p4OLWMeICbqUc3AaG9czaZ+s
         CPvXEy1nV7edIehe21iAb2B1Igr0Q1h3XCm6GVx5Nqw4ONn45s3a76ecqNTCQwo0NbCY
         XC+qEj5bMLHBuAVBMriG3JzIPv7bGlSpxXzIFpZg0CZY8tDc5IlujzdFrVdHP3LMKyBP
         hvVA==
X-Forwarded-Encrypted: i=1; AJvYcCU+ntMVmTEay9iXLSNXl5Nk6fOR0e+a9ialNObRn/R+0+Hz0r7OeYZLdvRTBke6QVH38FiTiN2ndZs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx27PSTkvCvzA5h1fmhZbTL0FHSBrltZ07DLyT2MDrrkU0ulC95
	zpCh+N2OLQ5HFmYdX7jpZ51FIrGNjWZ08ewQySlmRv5RVoxyG4GBTbNQ
X-Gm-Gg: ATEYQzzsoLdezrQzziODJLG/3AM4PeEGxLL6h7zrLGoDjUf+qxhgyN0rjaMfNW8aQQ+
	voH5DQQAsdxkN/pzPgbfoSw6IlPJIKPQqIXHUee+uAakAgl4afQBFbkmiM1q2KpYomZjlfK4P9P
	Il9da0HWsYIPACApDHGHQz2Ifx4LeFtZm3mun9+P4UXj0tuNc9pyRaH6TkHWUSxQO/KLz9oseIu
	XKLWIOljdry0qOlngO8yVEtHXv+f1yB3DD9iiHmyYTK1wped2+jognzu7DxP2SyC0WDMcFaptMq
	UNuB4bBNgAlU+oCEPLkyDStQ30Pr9KrF+SEuzzhQHzWpPR4p9xqeX1Ygw3qsqR3KeAtXpnvSaQM
	RutL8wrycpbQaD2eA/4YmV5lHY18Ji5NGIhAKHjWDC8FM8bxr0wdSbdIcKa52+MoEstEUvj3pXE
	hxH7+5F4T8EJ2mHdPSNUBcVVabKFj9bukbpVehKe8jrkZSDcglFA76K0CzinA=
X-Received: by 2002:a05:6808:1203:b0:466:fb74:1ec9 with SMTP id 5614622812f47-467570ef685mr1573218b6e.4.1773408183890;
        Fri, 13 Mar 2026 06:23:03 -0700 (PDT)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 5614622812f47-4673434a35csm4795987b6e.20.2026.03.13.06.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 06:23:03 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: airlied@gmail.com,
	simona@ffwll.ch,
	jbaron@akamai.com,
	gregkh@linuxfoundation.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jim Cromie <jim.cromie@gmail.com>,
	mripard@kernel.org,
	tzimmermann@suse.de,
	maarten.lankhorst@linux.intel.com,
	jani.nikula@intel.com,
	ville.syrjala@linux.intel.com,
	christian.koenig@amd.com,
	matthew.auld@intel.com,
	arunpravin.paneerselvam@amd.com,
	louis.chauvet@bootlin.com,
	pmladek@suse.com,
	ukaszb@chromium.org,
	dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH v11 04/65] docs/dyndbg: update examples \012 to \n
Date: Fri, 13 Mar 2026 07:19:29 -0600
Message-ID: <20260313132103.2529746-5-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260313132103.2529746-1-jim.cromie@gmail.com>
References: <20260313132103.2529746-1-jim.cromie@gmail.com>
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
index 095a63892257..4b14d9fd0300 100644
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
2.53.0

