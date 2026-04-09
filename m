Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A673932C5
	for <linux-doc@vger.kernel.org>; Thu,  9 Apr 2026 22:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775773902; cv=none; b=VF3JBjlxgnME+9y+CImq4arWs4+1fBc5sA0bjGbn8CiFlGkFOt3PHqpFnehrnpMi+/h9Ez2Bulx+3RlBzNXZjUmN+v8+An4N2SSxtmRVNPw7FHX6hewVwjK1R0r94nMBGbqU/eRxtzQ4oQDfnGddl6yU9xp09BzzR0A0zZVYt6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775773902; c=relaxed/simple;
	bh=FI3eny2LFXRXmWSoiguGjlN+lNUG06gttZUq7kbXBaY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o7FyrIKfw+4CiMuPSnTxFR2kssYJrsiUeF0feSLUbnVxCvz04hHskOag5PLuWpHcZ92ML4AZV8BlLD5/COFZPLzOg6O4+b9AHAg4trP0S7eKNCynYq1gpyYqDJ2iFySPdJxJRnEMUPcpLz0AjrgS0Hb9ZM0BdfMshf5k4aSBdks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GRmXC6Y5; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GRmXC6Y5"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43b8e8e7432so1234936f8f.1
        for <linux-doc@vger.kernel.org>; Thu, 09 Apr 2026 15:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775773900; x=1776378700; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T6sardZINx0kqV/7zxKpYiB6/qqt9ZLjsXIWMID7Ha8=;
        b=GRmXC6Y5lhHh4gSj1HwakGc6+TRheq9qmxgoCkymcjCAGgOkXlBZM+xkQYIBplfBmO
         wa8LB2rLoEWa6AGdTDSjWKjx6fPrtT9rEZAgyBuV/c/IiVy/NBL4QbpHhKjaxOIqObgs
         EnQS58IiRfkgJtwpMi3Ju/KS/PgPFPGcZla2IfViOfHyfwDBvI2GfmW5Gr09xMVmmGZF
         P3eARPVt8RDEbDyviAiP+5EwDfGQMUnAewhk1by4lLjSF4VK1ySATJDbkPasg4Tub9XL
         fnWO3hfaiPPGlTe2l/8exV/B+0EgRsmOjp/+7wkoxDZ4NOYMTsR04O0i11KM/LdxP4Sc
         c1QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775773900; x=1776378700;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T6sardZINx0kqV/7zxKpYiB6/qqt9ZLjsXIWMID7Ha8=;
        b=aAcGuYFIngPRPKeVSE4OVIFCMu+N/ne4CTBxwFRB562so3FVCWqf1Z4GAVDcbY12ZA
         gtR8x7zW8CSvo+98yk5J81G6tK0lRgBeFdr0M2dFcvZHVT2zWiKKP7hKHQzgB70BQK4z
         /Q3Nu3+d7Giie26sp8eH2rVONcqjjN+S6i3Mho32dbrN2OwZCVgXIeTMhCMsrd/7BTqw
         58nxRzgje9UmKCQGEUlCqro7+h9J9l+rKARDeb6yHiyrVDkDWN2BLVCmWfSl6omf2WmG
         E2fEOgvOolMsGGm7Ny+uwEn53SEsEiDG3FHvUZ+klcFlPdhK9oZ/vYXV3VQotE/Em13m
         m60Q==
X-Gm-Message-State: AOJu0YzT9Qeamghu65nfuBrlxbg3j6olgCsM2AifimY+CppKfuBw7zWu
	siXQ97oUAQ2oMwwthVii3BEMWduMg9EmQAm60Oen4bh3WIb5Y36KGQRd
X-Gm-Gg: AeBDieuBIYwWWrqoajD7njuVjBDkoZ2NNe4xWY8OnYS0io9BbfnmbfLJqGgkv6NhSeS
	O56dtBmY11aJ90uBf9ZMbdWX2ZoQ5RwORKRH4qfff9sg2KjiN4+SGZxyL0IxM9ZEPCi4b6sa5Pf
	mmoB2J3QWH4hS1RJIaLkacFE6YTB3jvnNxxCDgZtQgF1iJ44dYtw+5d4dudNvB/i6X4pGuQUbZ8
	DSb/9VXbGPrX4rsm6vW8gLJjHWT8zEGF6836LpHxORXIt+FtsmbnZtIIZUUytPWGBK+n+i+gBDy
	XFCNHYaowFuXKhinfkUbiSQVsUA2eaWKoDFKDgL9hcxdacSfQPf3EFKd/VZuhtODx4hsMhInoJA
	VDb15xZZvhoGSl8d8CSQKbQgKXDb3ZzxRpDQ8MTXCglr9tiHLQb6HZVfW63RLESCvWGUOEtysiJ
	qK+AS5DLMcUeRaOtfCvCCLzcPYdh4+D6coXAmCAvt90bFquZR0EoT4AW3Y65QNDz7f+9Shii/uw
	lOs6Ols9KSpctWJas0euqxrKZe6dagG
X-Received: by 2002:a05:6000:2906:b0:43d:6e0:9447 with SMTP id ffacd0b85a97d-43d642c4f4dmr999673f8f.28.1775773899661;
        Thu, 09 Apr 2026 15:31:39 -0700 (PDT)
Received: from teknoraver-mbp.local.lan (host-87-21-112-125.retail.telecomitalia.it. [87.21.112.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e50289sm2161438f8f.28.2026.04.09.15.31.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 09 Apr 2026 15:31:39 -0700 (PDT)
From: Matteo Croce <technoboy85@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Matteo Croce <teknoraver@meta.com>
Subject: [PATCH] docs: escape ** glob pattern in MAINTAINERS descriptions
Date: Fri, 10 Apr 2026 00:31:35 +0200
Message-ID: <20260409223135.10186-1-technoboy85@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Matteo Croce <teknoraver@meta.com>

Escape '**' in the MAINTAINERS descriptions section to prevent
reStructuredText from interpreting it as bold/strong inline markup,
which causes a warning when running 'make htmldocs'.

Fixes: 420849332f9f ("get_maintainer: add ** glob pattern support")
Signed-off-by: Matteo Croce <teknoraver@meta.com>
---
 Documentation/sphinx/maintainers_include.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/sphinx/maintainers_include.py b/Documentation/sphinx/maintainers_include.py
index 519ad18685b2..54f34f47c9ee 100755
--- a/Documentation/sphinx/maintainers_include.py
+++ b/Documentation/sphinx/maintainers_include.py
@@ -89,7 +89,8 @@ class MaintainersInclude(Include):
             output = None
             if descriptions:
                 # Escape the escapes in preformatted text.
-                output = "| %s" % (line.replace("\\", "\\\\"))
+                output = "| %s" % (line.replace("\\", "\\\\")
+                                        .replace("**", "\\**"))
                 # Look for and record field letter to field name mappings:
                 #   R: Designated *reviewer*: FullName <address@domain>
                 m = re.search(r"\s(\S):\s", line)
-- 
2.50.1

