Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6DA3F484D
	for <linux-doc@vger.kernel.org>; Sat,  5 Sep 2026 09:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788601636; cv=none; b=dmZxnJaRAfx2WvrNqNPUeaBkf9l/EhcjDTMOK/t+0RLL80Iqp3+zlXsy5L1MxyYzE1SnhESGYvTDsURBBODGrrMop/9yKEe/bKDlT32XPVglA3P7BT0x3EXP9KUZam/LgFvoMFxhAXsRqzLit2fWgYr7liHCq7Q9IDAw4DW7LhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788601636; c=relaxed/simple;
	bh=zqIZgn7Zgj5WSQepFgJtQ9GMMyKpvR8InLxOiqTa/8o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=d+GjaFGMdmRTC9P6EL3eau2o+d6GQtCY2WasBLgufEInGBXwePyYjr1Ava0H21zvmBi76OZjkw25ymXpLKsXTrWeUzAKFCozXKaQDpYBF0hTYHpRVRr0RxBpzF95QsJhye7eD1BBoVszIum42cXUefSauctILAeBr8bgWZ+odys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sS3GkGDt; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sS3GkGDt"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-484374f54d0so1107426f8f.3
        for <linux-doc@vger.kernel.org>; Sat, 05 Sep 2026 02:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788601626; x=1789206426; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RNFfTw1WuaSNgs5HCMSq2uznGZvnZVsIDtneqTMILXg=;
        b=sS3GkGDtOZOrxGVH2ecp8Y9BijuvKIZGE9cRol9c394h++PWXXMUkrbfk4MaucH7Xb
         U6xnSpOgpPlCLgGRJgFJusDEMpGl6GoEPagk0EBRDekWebDNSJ9c2+7bDODP5t5sx6WO
         S7qWSKaOAWth8EWw5f4FyoVQksRMC12WKRbvoec5wN9+mVJAxfr0JzbGojpcXGDPLycy
         Wm8keJ8zf60yL0isTXgjllly0MsmA/q9Yly09xrEJx9E+b1vfnw2Do6nlXQGx7bqY2/W
         iT83xkaYf1IN7FJtaRTK97E2OxZs+3sKatwn2475v/Wkqn0YcgJ9E5z39H73lyE+5dXm
         3iCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788601626; x=1789206426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RNFfTw1WuaSNgs5HCMSq2uznGZvnZVsIDtneqTMILXg=;
        b=r+zleGu9rbXSZ7/No986mBo+VX5zLYiRbMPv35WOgKKoST5s7TUa4jTk0CyJqCik+R
         5/7W31bbRuvXCtOgnLwTGVuYrYZHKSo0FIUyAZdskEf5PEeyY0G9V2c/Z8YOxUcylI25
         x+NO9Jf0zD2fyq/MHLvB/9o8tXAzkGkwnN7uPDEXbN0YPpSjSkvwZCpAVNIMoO2b+QKC
         Ccm6PlaXiXSstal44qApJE1YqvoAlwcTk8u2rBASUAam6kBvkYVhy0Lyd71uyDLBbKKf
         QJ13QajYr1y19iAnAyJv6AwyfM/0mFUu+0DVm5L8tc1zMRHwZZGRpBApsauxnq0GBKVD
         Lyww==
X-Forwarded-Encrypted: i=1; AKwUvBx+F9o14fuR3Id1H2lZ4hPOBrNXp89SJ5XpBBVMIySZ83W8eHHIDVv7A05U25lp8G8Oa7vFpyjrOYs=@vger.kernel.org
X-Gm-Message-State: AFuF++l00UXAVC2rT/d0J4N7dbJz0REzT2DfKOfKOZ1nAT3J1f/TyDqe
	YgVrG8V3jCQXJAJMiViBHvlaAW7CI1jQmryP7VK/3Kn65kt0DpvHgs7j
X-Gm-Gg: AYBFou23Afk9fvPL+Js2yUh07klwBSopokNwMyxOPlTMZrVmjsNM6oQFtN4qhEehaT4
	REwrPbj7Nq1HHyUaiBGzRHHnxYdrCb+zex52w6xV4Ik7Jy3zR1Ce/4E2Ef4AZ0XEv6ebzNsfRWQ
	I0mdRJLaHNo4F99Q2t7FcGXGbYOoyqnBedFEv7On+0M2EqHnaKlE31AG82AZfIFCkQ5h1CIaf4V
	EjR5lvWe86Lc+WIq2JwQeNEuR1n/CQmsdqwaL+v4SfujBoP4M78jflqYfKyxUu/qggT2ExjUT34
	8/cNasgcPj4JUWO/XXuJonrrja+hNnh/OphRHUDUqia8Z/oA3mPgmvAJUxmJ8Y3BswmXNwi85C8
	Gcz1KmVwJ6bZIy10MePp5MbmLVjZhc5pOPUOJ09HbU0gyY8EDNpJdzj4yuCLUSPWSKnfnpY2V9m
	UK9Yclx3pBA0ETqeZwbEsawImZFIje2qSCijvqiv+3DRhKWZyKpNU8IiXmD61id1xQOFhSb+ZZi
	u1y46Zc16SbCzFjVL/PZ/gdIpUXbgwkzNo8h6LNQTisZ7oV9GWFKpu1RQZHOzVXllsb+b1PRiw2
	2HAE2cJCASS7NR4KbuvVHPx8QNzUGN44CWWgfXbMuO2wCNzLp7KoZnrgykjrqBz7XhM=
X-Received: by 2002:a05:6000:178e:b0:484:3200:b7a1 with SMTP id ffacd0b85a97d-4858708c88amr21220202f8f.13.1788601625675;
        Sat, 05 Sep 2026 02:47:05 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c6ba4sm14232013f8f.25.2026.09.05.02.47.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 02:47:05 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-m68k@lists.linux-m68k.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	Steve Wahl <steve.wahl@hpe.com>,
	Dimitri Sivanich <dimitri.sivanich@hpe.com>,
	Mike Travis <mike.travis@hpe.com>,
	Tony Luck <tony.luck@intel.com>,
	linux-edac@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Tony Lindgren <tony@atomide.com>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-omap@vger.kernel.org,
	Dominik Brodowski <linux@dominikbrodowski.net>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	linux-ide@vger.kernel.org,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Michael Schmitz <schmitzmic@gmail.com>,
	Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v2 3/9] docs: kernel-parameters: Drop the edac_report= entry
Date: Sat,  5 Sep 2026 11:46:43 +0200
Message-Id: <20260905094649.41996-4-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260905094649.41996-1-kmehltretter@gmail.com>
References: <20260905094649.41996-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

edac_report= went away with commit fee27d7d9788 ("EDAC: Delete
edac_stub.c"); nothing parses it any more.

Drop the entry.

Found by cross-checking every documented name against the __setup(),
early_param() and core_param() registrations in the tree.

Fixes: fee27d7d9788 ("EDAC: Delete edac_stub.c")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 99d5bb68968a..2a8d862ef30f 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -1578,14 +1578,6 @@ Kernel parameters
 			PCI device even when its classcode is not of the
 			UART class.
 
-	edac_report=	[HW,EDAC] Control how to report EDAC event
-			Format: {"on" | "off" | "force"}
-			on: enable EDAC to report H/W event. May be overridden
-			by other higher priority error reporting module.
-			off: disable H/W event reporting through EDAC.
-			force: enforce the use of EDAC to report H/W event.
-			default: on.
-
 	edd=		[EDD]
 			Format: {"off" | "on" | "skip[mbr]"}
 
-- 
2.53.0

