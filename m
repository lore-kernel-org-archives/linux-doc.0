Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83203DD87F
	for <linux-doc@vger.kernel.org>; Sat,  5 Sep 2026 07:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788591847; cv=none; b=fAFXS/sMGlHDgcsIalwsZfSDRPJQcuftEtYRE8bHuj12hz8yk+x2hnK5Ht6tJQ1/+XPTmrmnjEmlbHtQVHec97g0IenMIreyp8ZfeikmkXNeQCf4P7oHDKDaL4A1rqnvR5o9Mk1oAXXlsTP1gMOF96y4LNPnVhJ0CuVW8vNWltc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788591847; c=relaxed/simple;
	bh=zqIZgn7Zgj5WSQepFgJtQ9GMMyKpvR8InLxOiqTa/8o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ubbOmGBTS27MB8JYlVpHbY22w4qDSbrkb+pPS64hRYEQklCE/8o3ucRszaCl1LEDmkuO2geQO97DM/k0tnVYEYn0O1UOw5lToDq7jVy32XIJxvfhH/9k5GlpzFegwX5PThqVEmAweAPe+B0zXSRuQYsZPwfa2kMaHJljkNfdsLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XsSYwLwK; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XsSYwLwK"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6a173ad7cf4so2824172a12.3
        for <linux-doc@vger.kernel.org>; Sat, 05 Sep 2026 00:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788591841; x=1789196641; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RNFfTw1WuaSNgs5HCMSq2uznGZvnZVsIDtneqTMILXg=;
        b=XsSYwLwKu7HA+M9qQDLAv4qyhXqLO3Y3B2nrMauWYL5U/x9gMoPFVblanGk8nChIvd
         le6ND8o0ZGm4oLALDhgc8N7ll0NDm2ZuPPkg3BJ06DJiogDlzQZ7zgsVhbbx8LbTWTMz
         mJUu/Jy2EurM5VuMdsk3Uh3EF78ZdYkgcASPo4/iFhmVEz3GAbWH7dHmqsvIEDnJUq5t
         lb/gNVUNWETamXJAzcASXkot7DuMJvhXDEsA1GTzHxHbB2VyBuB5mB8CDW0siMQqovX/
         k/fP1XF6rKWc+9P18y9oJQoOw4mcO+2An2bQ56vnNdwBBSq7VrcBgCOkAHtz/ZsR5Mq9
         3s5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788591841; x=1789196641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RNFfTw1WuaSNgs5HCMSq2uznGZvnZVsIDtneqTMILXg=;
        b=hf1Rhdv4ho1D750hNMDLCT033uAloCAI5I99sXAUN060qgv30z7P9I4x+KMo7w492o
         L6S5NwpqwAwdrAlpLZR9naKndd9TaR4Jsrv4m1qgxD5CtxaeExO60y0mrdlLWKt2VxE0
         7OTDeCd2VZtNQhq2rlj2bDkcyPXH+XKe1cgaLm8YP3JpTy6MwuhOV/uMKI7Mpojw3nIr
         B7mkvUBEY302p61lXMgahZu2Z3vuHpDE1hgMZV3QM9/NV9XGKJpbKc28FJiFdEF/XrNg
         40pZZ8WfqBAP6xbIysHOZPYgp1ue2B9gkH1u55W4cjU0Vh4jQPWEyB3KIdzvyQGihMAI
         Uxrg==
X-Forwarded-Encrypted: i=1; AKwUvBwD+hr7mDdxXYgtARxgPxwvdhv8kTwzyXY5sgH/1D35eHgFCCrkiG4CtUl0doqKmu13BOdWpO7Grc4=@vger.kernel.org
X-Gm-Message-State: AFuF++n79rhN4VoUjoxtamTiQv1aAGmpyYlU0gSppTCG3SjkuE301uYq
	cwOlfdteKIqL65f+8OuIzXcUgKdGd78djFoCn3blMqKycuJ02X/JTXvF
X-Gm-Gg: AYBFou3kK/1AzyFeuOTwsCVAdDeq/xJy4J9/4kPJ9mnpM+8ataB4SS8r/yseF9kH4cN
	1LRXVIj8AkEYq1TsbMPGj3c1+a6raVclMm2+hX/jK1zn/997VMMCN9O/xYh5z44U2nnUjcJAiSd
	o1AI5j8zCEMlk515j56WzhsZisWIFflaC+IhhiHzjXXEd1vwMpIJn3vP8rnyflAxfVu6UjJnO1d
	uEkWsdmbwi//14mXvDBgfew5uAdOHF9ibRHFHZho3jHRHfstcTT46wH9GOl6itWId4mmXO2bUIm
	Htfq6VbjbOUlSuoE75FtyEbJgEFStXXOd5IDBBKMEStxXXSkmI4t7W0UCHE0XJOE9A59dogiwvK
	7bTu3hm3qLO8fdvK4449su8450ZwVG8w5OIJ9N+O3pdmTO8rKF89fo2JCbLLJyNOZVBAl8NE8fQ
	5zXPI5uoVx5myUtMXxI+YLxkbmN1NWENYR/tRcR+M4qep+wb9c/wxXEMKq1dpsyvrkU4yk3y8OH
	tXwbMEzftO+9ISSbEcSgVPoedWXm82nN52JN2sHnYIqTCvzgQLw2evhb6Q4E1Nvzdffes6azgfJ
	ftQGBzMv4B5/5cE+RNZ2GpFUU9rLic6i4aUR1FBppzROS3c/jk8HEiKQ8vYMo7QOdfZkbA7J
X-Received: by 2002:a17:907:1c9f:b0:c26:1691:b374 with SMTP id a640c23a62f3a-c261691ba04mr359894966b.45.1788591840842;
        Sat, 05 Sep 2026 00:04:00 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfdf6sm12011719f8f.34.2026.09.05.00.03.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 00:03:59 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-m68k@lists.linux-m68k.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	Steve Wahl <steve.wahl@hpe.com>,
	Dimitri Sivanich <dimitri.sivanich@hpe.com>,
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
	linux-ide@vger.kernel.org
Subject: [PATCH 3/9] docs: kernel-parameters: Drop the edac_report= entry
Date: Sat,  5 Sep 2026 09:03:41 +0200
Message-Id: <20260905070347.25902-4-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260905070347.25902-1-kmehltretter@gmail.com>
References: <20260905070347.25902-1-kmehltretter@gmail.com>
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

