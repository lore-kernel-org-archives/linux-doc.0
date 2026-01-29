Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD04E37AA6A
	for <linux-doc@vger.kernel.org>; Thu, 29 Jan 2026 07:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769671810; cv=none; b=sCcHF9pUVeNRCRxEWUt3h4VHFUUkU6qg9Mwhwjrqa9Cmh2WglqncAyHeLsujTRS2mGZdD2cI8XCG7RT2ig1brAqj3UCvb7Ndib40Vd0G/O1B51NO63Lacc8tbatX3Ag/aPb7IhtQPE2D7ar6ELd887zcPnUKDX+quqRWc833Ip8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769671810; c=relaxed/simple;
	bh=5ZBD8a7kQLmw1x97tPdty8QNAfVIBKDK0ioXqRoXppo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PGWPlxN4xHVhrUQvKtqUyz3MhlbHybGcpba2/h/5fsvlO0sSMzNPGWF2i9SxJrMg0fGkd3W07+4hrDm+EfL4m1jkaAdhgP8VAuCORNHcjbyr4EyHuiR8TLco7Utq22lTamVsfSVEnDUtAXk06rPGKG4GESKapxnP4d12pWK30lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k615EUcS; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k615EUcS"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-45f0b597eb4so436738b6e.2
        for <linux-doc@vger.kernel.org>; Wed, 28 Jan 2026 23:30:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769671806; x=1770276606; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g9uPR56U6+HkEMqkkUBf99O6pLy4zlZQYDhrfEEe9IY=;
        b=k615EUcSMNXcZNmro9DfC/eHImw6LPOQgpPkaDu5GZJiJpiXT79zXcYd3f7+W38Vpi
         w567dEkgZ+ApgbfYV70Crc2pNxMrEXy9p0sdJgG/lRCZfaS1JZjuF8PgWa5oWpKpA86Y
         2PfwmumOpVDecyPlUC5hK0Zg4wlvQfFT0UwkgqCAOEufspnb9mwhDvZsyb4rUHvcqYXy
         lsMZByAqch1AzkF6kTds7j0D/DcdOuwiwNA2EQDPPJkg1wMcXFOaiDuoykL6QY6ypTsq
         9qdMLwDJZypjpgvsNe+cyV0V93+Bf4YypCy61840I7YsWGDCLoMAcjA1MMIAORqmt4ET
         XOBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769671806; x=1770276606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g9uPR56U6+HkEMqkkUBf99O6pLy4zlZQYDhrfEEe9IY=;
        b=bHPiA0juEYR50IsQlCcAN8CjGs5iVgeQ2FshIIGhcyMpqz5A4c7k7vMk6bWm3f1SbN
         ZZuvwklFlcSX4laEAktky0P5oiGUMks6smCxNi0yY+xtpSkOSMwS7A+hFhA/sPXHVUmx
         +eToIS8DTojps3mOPzrRneKpPn+eoebE7XWN05uYqCCAOmBqSzLUld4dONjkmKGxTE8v
         HDtvZAT1EyTutObPBcdVT70gVbighmZud702FRKhnjrVscKeyL2Sv847/MITJvoe+UR+
         hkG9iLk1qMrjOkmHQZN62nwfviYT9XPoommIAP0zK8EdP+du5fh5B+BWFYIx6aCLXGZB
         O1Jw==
X-Forwarded-Encrypted: i=1; AJvYcCXDxST2yFNlph94TeU+nxaLe24qQ5RVmTJU5dw9UjdFmH4AQwJ9ReymfdgZCazTVA1y00Sc9b/TGTw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEK+nkKwCDCZo6AYjQmaWq7Msi4xcf8cHwCwa+jEGlFKMH5bXE
	gwHujRnZzI01lcQUgP9yveOb0Wc6TPutZzH5mBMdD7Gx/VEjGf1W+Pvdjg54XYpF
X-Gm-Gg: AZuq6aJUNii3rDSnjg6KsdYWRiIeSJywfi+LFVPvWY6sWCLBV0GrMTH4yRhKH8X0LVw
	32VqgCyXlYQ/axNagQbLCawohjuiVsLI8eCz/hvg1wRTMc/wmTi7d05lN5QM/7pvBhlisdbcj9O
	WF28h6dQwuVACBC7syCcvWlxWa5lI2co6Gf3pG53jDeYD0FPL2jucILAj/HnrGP4w5vRih0YH55
	ohm3mimiHNtNIzxfsXmZHjuqVaYJkU0ovUVpKe75b68uVygEPg5m56yuni4p8BDo2Dq5G9/ZqV1
	ToeJkV5JdPaBmUefkg5Ge9iYPftYTb3EEFMZm7TF+S/JQ8OljeBOwPXC0OfFNUUuuacKawSDWij
	MOt+ELajTR8LvVCt6tHQKkff4K1aFPxfc/uWeUSnkepT7BVbe6PUpG12h0CyNLdYjf7KTBcM3ju
	AFoYYJXYcaj2bStb2mQPicLhSMs6FGnltWa6Cwgbv6
X-Received: by 2002:a05:6808:4fe5:b0:45e:fbe0:1c00 with SMTP id 5614622812f47-45efc6738c8mr4346166b6e.33.1769671806536;
        Wed, 28 Jan 2026 23:30:06 -0800 (PST)
Received: from godzilla (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 5614622812f47-45f08e23c09sm2693832b6e.9.2026.01.28.23.30.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 23:30:06 -0800 (PST)
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
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ye Bin <yebin10@huawei.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 04/32] docs/dyndbg: update examples \012 to \n
Date: Thu, 29 Jan 2026 00:28:50 -0700
Message-ID: <20260129072932.2190803-5-jim.cromie@gmail.com>
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
2.52.0

