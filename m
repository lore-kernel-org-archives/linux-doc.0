Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C9B156641
	for <linux-doc@vger.kernel.org>; Wed, 25 Sep 2024 09:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727258209; cv=none; b=XGsa1tAt5iv4KNMYnumCQKdw3TTKpZ7Ullt+nQRAMlA8YZSnu8aFO+BfQmimNJJLJi2GRNKhxpcy3SnbSYjxtR4uY6QVIzVCScD6aYmqy7TxNWtEaj5GaubWotC94vjQ0ohdVygjr3Mf9GAEPUL4+D0Mu58iNa0oN2j0/xsufhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727258209; c=relaxed/simple;
	bh=xEng0ILGawkE/K9pQCc8vU14hShyRxs7UG8CXeYAF04=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=SIzNKGL43CHXglKTiCU95vEe26vhYI1ZATTN5PeCbjfOb6gKtgXoj2yQSsLnlMNI+iXkqSMIN93kMEipuzRyEBfoT7Xel7ZqUlJvK2cVRRnkbdHfASOqgZLTcJJ7pJqiSbTlQWGJ9kVuCb7UPtILkrxUf9wVg7YY11Jz/1EIRcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UU+VeMYL; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UU+VeMYL"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-378c2f1d0f2so279971f8f.2
        for <linux-doc@vger.kernel.org>; Wed, 25 Sep 2024 02:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727258206; x=1727863006; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T4ek5g2WpaEArbed43Ic4SfAR8svgIoVtYNeQf4QZko=;
        b=UU+VeMYLsKSW3dHDi0FKe1s4pY5hRWuRRU5MRa1/NYaTEr2waUTYojM/YQa0omyZVV
         ZCe/qjquY0C6Eqqyvp/Cah2VT9nXP/R7fO38ejy9DCgXqJ7NEsWYaMTegssgVC4sJA0b
         KHOz+vGT1BZJvY6GXQtItjjPRc2aLS0rmsLLyXLPgZvw6RDcpAZbdV4KLgcW3BrqJNbl
         YGzURW2VCv38YbYi4npPXkS97ovidTp1YKp13tskr9B40k6O5q9hLpxkL9H9MBdtfo2i
         JF7okKVkknpkDiWhn7iTBGGBSXE5fz0npLNR6zHI/H8gyM3HCXbA7od+XGRZ5t8gHERz
         8WTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727258206; x=1727863006;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T4ek5g2WpaEArbed43Ic4SfAR8svgIoVtYNeQf4QZko=;
        b=uGbFqqvlgBlVC/9p4Rw3NsXEGTGwU1O3rXx3CCkMoiiyltCEBQpxttgf/0k17riWDz
         KomBmGj0KSFlajzVIh5H8LB9AmEcmIJ389iPXtMOhqEojW5pgyJvwBnjrMzcycsHGNx/
         tomXmAAn+IEGbaOcFtHY5t61DW2Lb+zYUYdgIEbQMlcL/OetWGxE4pNk0WW7lyOobhb1
         8DT5KAjDUZ070Jspo00CmJ6fvtcUyYNr9mxpxpHaGmy9Z9UBErxBDQPL+sgVX5drS02N
         +h0XDo5i1FDXGngRIjRs5FYRnXcV2eXpoGsgoDtWA9yYFswgDjTe8p93JG6YO55LO9MX
         29kA==
X-Forwarded-Encrypted: i=1; AJvYcCU6xpyk0mZCOBJizmEXsyyFwGDu87wrHbPIZBEMuRrOYyyRd+jQUbA6foVT1kUq9h750Hn9QWrkf8g=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsJ10ydMg0r1hIIWmU5g8L2lanKMtGVMOdThtg43cpIOoRLcUN
	KzzxAI5H9aZ4/ZT6hXqJ4FcYoo0wYSSZ8cH03So0vKkxfbxC3prJgI2wYN0kQzc=
X-Google-Smtp-Source: AGHT+IGSJhzwvWL9e+QqYHeRxVHO7r6yn25VxHi+gaz4ceL1fnx2qrMA8vQyjlnTr3Yrz+A2YPHONQ==
X-Received: by 2002:a5d:64c8:0:b0:374:c2e9:28aa with SMTP id ffacd0b85a97d-37cc249efa7mr700119f8f.8.1727258205960;
        Wed, 25 Sep 2024 02:56:45 -0700 (PDT)
Received: from krzk-bin.. ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cbc2a8bcasm3559020f8f.9.2024.09.25.02.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 02:56:45 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	linux-arm-kernel@lists.infradead.org,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Will Deacon <will@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Conor Dooley <conor@kernel.org>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>
Subject: [PATCH v2] Documentation/process: maintainer-soc: clarify submitting patches
Date: Wed, 25 Sep 2024 11:56:35 +0200
Message-ID: <20240925095635.30452-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Patches for SoCs are expected to be picked up by SoC submaintainers.
The main SoC maintainers should be addressed only in few cases.

Rewrite the section about maintainer handling to document above
expectation.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Will Deacon <will@kernel.org>
Cc: Kevin Hilman <khilman@baylibre.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Conor Dooley <conor@kernel.org>
Cc: Heiko Stübner <heiko@sntech.de>

---

During our LPC ad-hoc BoF, we discussed improving Maintainer SoC docs
and I think I volunteered to write something.  The trouble is that
whatever I won't write in my notes, escapes my memory.

I believe this is what we discussed.  Was there anything more to
write/document?

Changes in v2:
1. Fix missing closing ) (Conor).
2. Style changes (in point 3.).
3. Soften note that soc@kernel is not for discussing ("is usually not").
---
 Documentation/process/maintainer-soc.rst | 42 +++++++++++++++++++++---
 1 file changed, 37 insertions(+), 5 deletions(-)

diff --git a/Documentation/process/maintainer-soc.rst b/Documentation/process/maintainer-soc.rst
index 12637530d68f..fe9d8bcfbd2b 100644
--- a/Documentation/process/maintainer-soc.rst
+++ b/Documentation/process/maintainer-soc.rst
@@ -30,10 +30,13 @@ tree as a dedicated branch covering multiple subsystems.
 The main SoC tree is housed on git.kernel.org:
   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git/
 
+Maintainers
+-----------
+
 Clearly this is quite a wide range of topics, which no one person, or even
 small group of people are capable of maintaining.  Instead, the SoC subsystem
-is comprised of many submaintainers, each taking care of individual platforms
-and driver subdirectories.
+is comprised of many submaintainers (platform maintainers), each taking care of
+individual platforms and driver subdirectories.
 In this regard, "platform" usually refers to a series of SoCs from a given
 vendor, for example, Nvidia's series of Tegra SoCs.  Many submaintainers operate
 on a vendor level, responsible for multiple product lines.  For several reasons,
@@ -43,14 +46,43 @@ MAINTAINERS file.
 
 Most of these submaintainers have their own trees where they stage patches,
 sending pull requests to the main SoC tree.  These trees are usually, but not
-always, listed in MAINTAINERS.  The main SoC maintainers can be reached via the
-alias soc@kernel.org if there is no platform-specific maintainer, or if they
-are unresponsive.
+always, listed in MAINTAINERS.
 
 What the SoC tree is not, however, is a location for architecture-specific code
 changes.  Each architecture has its own maintainers that are responsible for
 architectural details, CPU errata and the like.
 
+Submitting Patches for Given SoC
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+All typical platform related patches should be sent via SoC submaintainers
+(platform-specific maintainers).  This includes also changes to per-platform or
+shared defconfigs (scripts/get_maintainer.pl might not provide correct
+addresses in such case).
+
+Submitting Patches to the Main SoC Maintainers
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+The main SoC maintainers can be reached via the alias soc@kernel.org only in
+following cases:
+
+1. There are no platform-specific maintainers.
+
+2. Platform-specific maintainers are unresponsive.
+
+3. Introducing a completely new SoC platform.  Such new SoC work should be sent
+   first to common mailing lists, pointed out by scripts/get_maintainer.pl, for
+   community review.  After positive community review, work should be sent to
+   soc@kernel.org in one patchset containing new arch/foo/Kconfig entry, DTS
+   files, MAINTAINERS file entry and optionally initial drivers with their
+   Devicetree bindings.  The MAINTAINERS file entry should list new
+   platform-specific maintainers, who are going to be responsible for handling
+   patches for the platform from now on.
+
+Note that the soc@kernel.org is usually not the place to discuss the patches,
+thus work sent to this address should be already considered as acceptable by
+the community.
+
 Information for (new) Submaintainers
 ------------------------------------
 
-- 
2.43.0

