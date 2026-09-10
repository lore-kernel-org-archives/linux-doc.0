Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64239364EBF
	for <linux-doc@vger.kernel.org>; Thu, 10 Sep 2026 01:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789003996; cv=none; b=UxDcSqGyDkr83q7A+qkD5eYelM4J2WAgQxOmpuPruyywhv1NCi47tyDrYS3Yq84Nxn2Ij29bcFuwITI/MU4hS+nRU7DBpH1OX7GyyI2y2IJAv2yoHvrbTCaq6OV5yAovwTxTEqcRMot2dcaC0R+2KRl44DtZV3iOe1B3oz+0LfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789003996; c=relaxed/simple;
	bh=ZYFLiiSEbPgU0+ZjsS1KNzdvmrfyUGct38CSb+7KC10=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Bczx2AVpUTXkIPXPBGvDCn7HzU5BNBggYtMANNcJl2F+yLtCHmKfE04zEkVIEZCLU0Y2/w5eQn7o3NMp9emRSwWitV/cj3IXZcj8FaJwkV3Wop8JymOHAmjYhNA+D6g4tsAgIBvh5ZLWZDjRWUmkkA+wRJxMw50Vo1Gbph9AIz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CKOsMtbD; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CKOsMtbD"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49d0da752ffso45811285e9.3
        for <linux-doc@vger.kernel.org>; Wed, 09 Sep 2026 18:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789003988; x=1789608788; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7gFP28iKq1M/HJk3t4X9byGhtWcmOOGCTOZxmuDlWN0=;
        b=CKOsMtbDLmlvqC8UoICufqDEvkMqZRt2CNhavbyp+Wp4tgCcZvOZel11M4HI5DDmnO
         ZAzzXbIWC1dy0RP9A1G0s94vYDEvR/IfMcm4AokLVmIzvRZGmoJXnyFEHsVQ4ZhfxFxN
         vS/7t5ODxV7m+iWr7weuwS67oq8/8AgHKnG6MsC5+hdHRbHkqRbr462hkCSppYgvs5tg
         /gfLDyDd7IjuI/rLVfo/8ltTx9CDAaHReuOyntpOAHsz2jFwB9GUDKnNR/G/rBJeqiSi
         BSURrWL3KxAM2vuO0xHeT4gJRhUNeK1sSMjJIFbAvI+BweQVtCZaYJhYMQLknpfNySl4
         phNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789003988; x=1789608788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7gFP28iKq1M/HJk3t4X9byGhtWcmOOGCTOZxmuDlWN0=;
        b=qIr4A6TQNY/Y+xmiDtVazUjzIIQojwbSMpxs3sPV2vx/ml8VeRg+yMz5nTjxCK62rH
         TaB7QNEWYbrjXYg1X6C2J7MHNc++Sr2XMDfI+8RdPhFbmaXEODV9LYXtY6XkDVvnvBnZ
         9gbKLo1MtV8DiS1Z2cmKjrOK7YifNEuabrrhAW7VcpK+ZOMBJB3KIvN1lfpSOP9LVEhm
         Yg7gGIXGCe06CdgYu2i97MBfBRGgzl+yhpJkHQO1N2JxTVZ6WtjITP+pRTv64N6w4MNM
         244Wusih6X4bmV6smFKI17MaU7z0/VY7qNbgelakjzEGiSO/cWSZfsnXvUD3g8G07y4D
         khTA==
X-Forwarded-Encrypted: i=1; AKwUvByelIrhBBfJH5vOGD6KC98PAK0O7yWSVhQLVM5MfoE+wkTf4VnQCjQrUVDWvws/J40BsUENzwX5Hx8=@vger.kernel.org
X-Gm-Message-State: AFuF++nZnyTYlRamzg/kLzfmSifzIEKErpdobcrNKvLP6gR0yal6KfGA
	5KgaqyVLEkkGfR7NHtrEZWY6IbVXx8N0tKt3ok26+7BS+orcYi0a3xOL
X-Gm-Gg: AYBFou1qKXjFGzJIGMOszwAghAt+qqP5hfEBrkfwJQB3rw08yrYHFQfrTjRAZUmMuBL
	moW8M1CJ4TuhExCLhYUIxFUt/FTlqvKAzabZtFwig8WzaC1/aV0AkqlNI7x9MIwZrwzbyBGivvy
	4Rc+MIAeykay17EUHT5MrI/D1PoeSxqWUKmFgac3AxtjJ59/8rW7PyfZXYYSr/nl2eHXFZqp0z8
	a2smX+d++sko5P1q2/zHgq6MbCmx6Ef/DX767tfjcVsCxH+vZXQCWKosFmwBbR9XUqMWMjgfdGh
	bChSfb1Pg4IDApH95a16FcOZw+msZese1GbVGC9zKgMqRNl6UoJAMzY+hkRG+yVVClGRK9lqZaj
	EtA1dF+dm958IkjPCLsDN9YrGvtcOeQ1OEnW4D9nomR5N1tpuPQw6l2TcT/udADs0d3WfSsBJJL
	NxlHArXeJqilI1BMrEHksVmIvAh7eLyDlgzgDOIFjC+003RMVxHms2qwBZnQZ6KnWWSRSfXpC1C
	QGojU8kwZyBcw9WFypfY4Wf4oO4IYq4FVlsfjSOlX78dcEHpgdFVEmfJNxUXqNcb4ATbvsUV3Cn
	szpIVB8149qzIlxubc4KPK7twyfXUExsvPq/cI2crBNIEJOljLbvC/IsULhO5KALqxZJo7m715r
	zcs8eKNDdWAQK
X-Received: by 2002:a05:600c:6305:b0:49d:2803:22fe with SMTP id 5b1f17b1804b1-49d28032d49mr11185475e9.32.1789003988252;
        Wed, 09 Sep 2026 18:33:08 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b090-6201-5565-e933-e630-1831.310.pool.telefonica.de. [2a02:3100:b090:6201:5565:e933:e630:1831])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26d4e3f3sm35852735e9.15.2026.09.09.18.33.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 09 Sep 2026 18:33:07 -0700 (PDT)
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
	Michael Schmitz <schmitzmic@gmail.com>,
	Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v3 8/8] docs: kernel-parameters: Drop the pcmv= entry
Date: Thu, 10 Sep 2026 03:32:45 +0200
Message-Id: <20260910013245.8619-9-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260910013245.8619-1-kmehltretter@gmail.com>
References: <20260910013245.8619-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pcmv= went away with commit 7aeffbf2ddec ("pcmcia: remove unused
pxa/sa1100 drivers"); nothing parses it any more.

Drop the entry.

Fixes: 7aeffbf2ddec ("pcmcia: remove unused pxa/sa1100 drivers")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
---
 Documentation/admin-guide/kernel-parameters.txt | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 48dd273eaf6c..4864e37005be 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -5311,8 +5311,6 @@ Kernel parameters
 		nomsi	Do not use MSI for native PCIe PME signaling (this makes
 			all PCIe root ports use INTx for all services).
 
-	pcmv=		[HW,PCMCIA] BadgePAD 4
-
 	pd_ignore_unused
 			[PM]
 			Keep all power-domains already enabled by bootloader on,
-- 
2.53.0
