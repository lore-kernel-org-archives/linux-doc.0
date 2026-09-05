Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1777A43CE56
	for <linux-doc@vger.kernel.org>; Sat,  5 Sep 2026 09:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788601640; cv=none; b=f2FyE3lP8DhsOBPJ/yPPY+EzAewXFtGIxIoGUMaC38L6H7L1G0Ohydp/9j4mUxHZeVuP3M4kd1Xs83Anl8/QJZQl4AOY4n49Guf8f1vOf5dJOcxrLJeiwn6B3JlQjSV3OwjrKRpb7h6d1viXImHWR8tHXAw12iQT6y409qiJdn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788601640; c=relaxed/simple;
	bh=8GOJ1bBhkXnXFQ/xtc+4fZdZejRnue5u+K5BgJsvQus=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RcrDScfxit09J12HHSOU2Soc7arpZhnxtazQmVNcQinegXU2l/CAbWpw3txwtNJFgROc6tlOeo4LVWW7LWW1YbwyNNgH+3pjIK4AfBFV08VQyvfyOxI7kE4hNoW91B8ti0PHF4dUAFR9tpj7Lb040RAVupfhhGbQ/A7YLXOif0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ucx/KA64; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ucx/KA64"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-484392e3d33so1205454f8f.2
        for <linux-doc@vger.kernel.org>; Sat, 05 Sep 2026 02:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788601631; x=1789206431; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OVDepIdvewIAkDae/qknvPHnA6zOWa1HlsWKZdzZmcw=;
        b=Ucx/KA64UP7YYy5FQQDaPv4iVpJGN9cu4a6gtRoYPN/MlsoWrBgL9kqhFiscfmpZzL
         r3p6A7rGwpSo6U00Cb10wjtr+mD6z0RLWlLAGmEE8eyqONRmuXoNkL/FV689kTIzZBWP
         gqEKeCMO2k4MN8VMPu92HuDd0AlqnTh1jQBi+ZvkLa0A7mZOm9Tkn1+mZhoGemzlxztQ
         YEtV2aJBvuK1aZt1EKWgo7D5sSEqC36gCblrWzvmQX3yyNe04+mJSOI0JWRmrg1dVZ71
         oylWSAJmkL2qP7fdvg4GTZMjKK5y7eqyXLGgH/+rq8Ob1Xept9jfj6uuti0/qYNUcrlG
         e3cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788601631; x=1789206431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OVDepIdvewIAkDae/qknvPHnA6zOWa1HlsWKZdzZmcw=;
        b=DFwh56s0XMtYWOITK/v46S/onwEtqfNwVqGv1nSWOGGiLvM10gcz+B5ZR0adDGDASO
         LDbPdwIkfCu/CKe5SLHMH1TN7fjHxdMX8aRPFF+/gD3nxpFAXLWSDG0Fyc/rOaybfdvj
         0u4InyWBoL0ZGM8R7W8VSgs1vJ4CvDwTTUhFsZgKyALXWXm+3V/p9+nBP+Ipl1CR+tXj
         4mwjvxJq8Be+9eaSl4zvFOrXyyZOOTBElaszVa8e8T3FbnVKmK4AuJtSyGv9JiggQr4e
         hgVFtjGGHi37rIOUTHSFcpB8WNiQ0ydY72qXq2tWM9fygqZx0eBfDcPtpQWka9XmdMt5
         Zp/w==
X-Forwarded-Encrypted: i=1; AKwUvBxp5ETP94tTxdNU1fAcc/h8Cn2l0yKX/RoaIPsDTUqtf+qpZvlc2ZHVf+/yiXjbqN3qBHfDyrSBXTc=@vger.kernel.org
X-Gm-Message-State: AFuF++mMpWnV9ERA6gQmripqMTdDm7ADa5lx2fa2O1VHMGWMtwehh1Ti
	/5wg4QYKRzl1b0phPtJWYt0SMyWudFOIZ2NbREIVg6ueUPbKMs3fxbZG
X-Gm-Gg: AYBFou0JZbIexH70V0RO1Q3dhEOdTWpmyJD8Ti2CYTBsjvE0Qxn/IrQXH52sXjN+0h3
	lbfA/bZ0lWcBxtQmJUXQbHtP/rctdDq+GCNyMRD7cqcS9P25CAEk+KrkOttaXFOp1mvmFrYsw1V
	M2JYepsqAiMX9s7Y9T/VjM+NsR7E8xP2aGMrA8oDdeGIhGvoCQqjwQV4b3dB9dIABgIopRefMpQ
	+OG/TL7SjMKOQZYVDQskE/4hOEejk8XDS//8Sx5w/Zl1M5jE0O790hsDqf60B8Uv9vi+Id2Wzsp
	FXuAxRkOk3JFMmxNjw62M/X3uK7GYOVP5+MgYd6tx72Kwnws1UdVZuiYficUt7iIUr4NPbEXqzB
	4aFJBBiAyS2k+bqYbz89rAuRwYLNlKncfSsACGnEVX6Ibd48bsg82d27dyQ2F7dUHv8lgTjVBqV
	LCVFVTaNaOpKxhdyZNAnkPxs3gtVyKiUTEgOY/yLfm7gqLlFPwMsfncr3A0NINDA4NgliDutmdj
	/20UWDSYeAeCwr/JlaF0k3kzBoHh8zmfQttW0w12BDrpy4GYlXcayb6urp/S9xaHnmFf8hnRKnr
	EHHgCKyEOFQNAvnO59WiyjFJjT9KX5rHy0xu25tCpW1jri8ga0d8zVLPIishQ0k1agzP
X-Received: by 2002:a05:6000:2584:b0:482:b813:8315 with SMTP id ffacd0b85a97d-485872ac3b1mr14547032f8f.21.1788601630963;
        Sat, 05 Sep 2026 02:47:10 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c6ba4sm14232013f8f.25.2026.09.05.02.47.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 02:47:10 -0700 (PDT)
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
Subject: [PATCH v2 6/9] docs: kernel-parameters: Drop the nomfgpt entry
Date: Sat,  5 Sep 2026 11:46:46 +0200
Message-Id: <20260905094649.41996-7-kmehltretter@gmail.com>
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

nomfgpt went away with commit c95d1e53ed89 ("cs5535: drop the
Geode-specific MFGPT/GPIO code"); nothing parses it any more.

Drop the entry.

Found by cross-checking every documented name against the __setup(),
early_param() and core_param() registrations in the tree.

Fixes: c95d1e53ed89 ("cs5535: drop the Geode-specific MFGPT/GPIO code")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 2ed1e2c03c61..d44728a45506 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -4553,9 +4553,6 @@ Kernel parameters
 
 	nomce		[X86-32] Disable Machine Check Exception
 
-	nomfgpt		[X86-32] Disable Multi-Function General Purpose
-			Timer usage (for AMD Geode machines).
-
 	nomodeset	Disable kernel modesetting. Most systems' firmware
 			sets up a display mode and provides framebuffer memory
 			for output. With nomodeset, DRM and fbdev drivers will
-- 
2.53.0

