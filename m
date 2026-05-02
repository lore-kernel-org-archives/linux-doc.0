Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B272C21F6
	for <linux-doc@vger.kernel.org>; Sat,  2 May 2026 23:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777764782; cv=none; b=ZjtBnSDePKFhX6X43uVOqUMquH3KpSIpBEdz0GSZcjkqImoNaD3D4IbQApq3qKV5Wbax56YvG2KuXEAGQw5IHR1PKTP5Ozo8vNSqN9mGOAna5dUi83BjGwz0AqC2hNLDK704BGmhp/YOn9YAlg5faPNUlo5Qw+iUNzLZb7hcFh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777764782; c=relaxed/simple;
	bh=/BEze5uZvE97vkdxdEKscGQmmLTlvHt75B8/b2suPbI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B31PF5O9Sl3XswsMEwciEan6dLXo53R5rHKaAy1wgLossGJAla8sYO2l6bV7MdiDnkTYrvlq68Ym1+N3d9iSbedWJqYkzIbfiO4btMaMQYIMwFsyA0EjSWE/EFpF9+vcbL2pWDvwB7YXvyASixDAv0x8VrgJsC3fx11PuShGsI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OScRb0GR; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OScRb0GR"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7dcdca9aa0bso2973900a34.0
        for <linux-doc@vger.kernel.org>; Sat, 02 May 2026 16:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777764780; x=1778369580; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CwPLhLRZkxVDbJ+XZfxPTCPSMzzunTFiSNGj95FvoLA=;
        b=OScRb0GRl3XRpQN/OFG1BOCVoEe0unh7oqxpiZU/jxCzO5Qd3RA8FRrtcJfiiDSi7a
         0CkRG/boKlv5VxHsTSDydlFoVpE4pe8ADbPz3htaMl6/CxXe4crfP2fyk1zR1iFAiqND
         iPx52ie7A1kkGt2Go1GuvRpUcw+03LTeM5xOfdjKwpQmTyG1Z29bTz8sUc3a1nADr9fb
         xPQi1+yQCWaMwOnBVwObpqMsXjLkC/sdckvvBOjvZ8h8HfXA7Nw2+zXUMzpE2svfoESn
         Q2is+e1DNdlg/HURue3nV0WqUps3Ydj1a3itIijJTefW6H+e6SZLQCnH1kpXRG4yqvoS
         eq9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777764780; x=1778369580;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CwPLhLRZkxVDbJ+XZfxPTCPSMzzunTFiSNGj95FvoLA=;
        b=Df2eb7vVBVbDJcQZzhXNL2uD748RgvFG8Zo2iptE7VE+I8a5+jc8HZBf0SaMJJGxOA
         S25Na2g37Kq0H1aWnW5dPzHYp+NsTN7dbd28ka67upjN7dZibV68sp5cB4d/WIPLgwuM
         Tx0A1kh7rSiO48sfIu6qiQbTh92SUSQdZHP61wOg+jz77/S6wd8Nl2eIulwS+OrFPf+N
         vrYZlx2AviNRQRJJiNPcg6cb+Odiw3xbfv4KF8VJKB2wo0VZdJ6xU4/ERPKBeE+qg1mi
         TI4PeTON4sbDu9Ea2uVeaMQU4lHbLxUmY4LyZXpgDZetPbQ5qYW8J559qK0FMy612Mu9
         6N1g==
X-Gm-Message-State: AOJu0YzTuvuG0M2WkQhowdaspPl8z3+4ejX5Zrb1WdNwbrhwASEP3YS+
	QsUAMYhEiJJGCwP5OUCQlRKzeMzhpeoJp2VDdlDczT8i2qpAvKjJ4IDdFuQ8oqGQ
X-Gm-Gg: AeBDietYknqReQMwHuMk+2uvx60ikc6Iqyq7OMPd40uEUGhdFG2Mmh+IYn4FyTqQ0ei
	JqVL3XSooeZCyNblmU648Qvakyq+Je18L6Ms4dq+EB9Albbl67dOGlpI0aAhn81AKubmjSjU1qO
	SD+4R4dXAu2E9JVHFG56RioDFHUUa7qjFJrEqtTpMlVX5EgoG9ax+0lsxiKSQfM1ulGfuEtClRS
	HpTRagRynEZdeOh8ECItrVv9DXosS6Vl8V2h7Rno2TCr24udOW1DdIzAx1Y8PgC6NXUO9t9jsxA
	0ZHK0Ni0p+x+A/vSCxssMEoM0RjRoeX1eJnzWOPryIiWoVrK0WRmgD+NKhpSsodjPuxd7xPLlAr
	ebv2j13//xl4ULg9EB8/rxyVD6sKAv+05a0B6S2cynVAjf3XEK2rPS6EZQGJASQD273Vgtc7Njp
	1q2DmqkEh26ibw9iO7+OyIcv3C3XcE1/fYVSyb8woLJG2p9x8+QpElv/f1xPScYXzImcQ3yY9l
X-Received: by 2002:a05:6820:1508:b0:696:1b18:18f3 with SMTP id 006d021491bc7-69696bb60d3mr1909403eaf.24.1777764780346;
        Sat, 02 May 2026 16:33:00 -0700 (PDT)
Received: from [100.82.231.29] (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 006d021491bc7-69689266bacsm3903680eaf.0.2026.05.02.16.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 16:32:59 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Date: Sat, 02 May 2026 17:32:55 -0600
Subject: [PATCH 1/2] docs/dyndbg: update examples \012 to \n
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260502-dyndbg-doc-v1-1-67cc4a93a77e@gmail.com>
References: <20260502-dyndbg-doc-v1-0-67cc4a93a77e@gmail.com>
In-Reply-To: <20260502-dyndbg-doc-v1-0-67cc4a93a77e@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jim Cromie <jim.cromie@gmail.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777764777; l=2677;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=/BEze5uZvE97vkdxdEKscGQmmLTlvHt75B8/b2suPbI=;
 b=JTTcblre3K9H4lSFX/B+n6UQSsAIotCrurQYdlJsTXW7AOhVqHdyUgO0Rm7SCK5iS8VDGuCJX
 +4ax+UDJuv6BlMJo6GCV/yZ9FQZp8ZgeNBhjI2G82uaHvfe/HBDDh0B
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=

commit 47ea6f99d06e ("dyndbg: use ESCAPE_SPACE for cat control")
changed the control-file to display format strings with "\n" rather
than "\012".  Update the docs to match the new reality.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Tested-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 Documentation/admin-guide/dynamic-debug-howto.rst | 20 ++++++++++----------
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
2.54.0

