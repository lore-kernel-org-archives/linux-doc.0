Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ABAC43E092
	for <linux-doc@vger.kernel.org>; Sat,  5 Sep 2026 09:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788601635; cv=none; b=n9jdeCpx2ra3hQbvDb2/Gpi6f3e50tiy4YjJvDV4/ZujFhKjYz/vS5Ox43ebkzCI+4K0A4yQ/MZFk6eB6rxu54qJ0cshC8tyPlMshGL98oqKYwQs6iLYzSTbilMTvXhmK92cZiNiGi6sMiS52n/H8AOCFeKErUdKNmkhJE7I690=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788601635; c=relaxed/simple;
	bh=YsfDHjDKsIWAkoUgaj1imFKWTfOFfJnvMXwuV6H0pgE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Sae9UzLpnMCNa0qoy6zCG+2dwcOTF23iM/cfUgIQafvXMYjR4jH0cZg77mI/f8brg4CLunDybTSwrP4juvKUnhJCwgLYNNI1sj0PBsLK7eQDCjG/N1sVZbyrKyR3fnShgmWjGYQJwC1coOkPo1higknfUipYqodo4NoUwPrb6NQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WF6eznBR; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WF6eznBR"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4843e397f74so2283127f8f.1
        for <linux-doc@vger.kernel.org>; Sat, 05 Sep 2026 02:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788601628; x=1789206428; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9h3cyhQ1bY0apuRrAImVycgRtlSF3vYdx1yKBS/SgnI=;
        b=WF6eznBRtkwHGPWcdSI5zmE6nOZXyfhdN2pXXayZzx0BbgJPuw+KlFuKyGt+oPL4Gn
         x5Fdmar1PYKUgTWNQMERUPVz0nv7Mxix0vYmZEYWQJJOKq2IhCwllLS0NUlGI53+Sb5v
         5/bNjxfGOVPTwMCDRyEgg8niqb1POYfm+DvWwohpgMrPJQpIvHANwiBLbEd1TEAyWkB6
         Yk0kGOVhMD6W24IF/0oUwz3EPVKNZvvniPgnF/EmaNhO2oDa4d3jzD/DgSjSYE1SDRdD
         eJVT5P/AMMCz+8MsEccoS5fKN9eLm8DUge+M/Pg7OhsbQTmPGElHSKeWCxs9g7wuy/tx
         Kv6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788601628; x=1789206428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9h3cyhQ1bY0apuRrAImVycgRtlSF3vYdx1yKBS/SgnI=;
        b=ajvx2kKIskcoJ7SI9oXk8WJ3fC6s9Cn8qrsarIvqDgkJqNjOF6usfjJThh9dweN/2+
         tApPy5/daghT5G8o3mDxKqwEFUlcQUvhcsIMvh9WYhXhHQFcz6i+le7plprrvdvdHzrt
         XyiIkb8me6n+W5tLQHIKKmwVdAzvUKSj+EIPqghEoAYLk+w60m9AQxzKbn7J3d1JA1KZ
         oBwNB84TZVSWi0NXk7JPuVylAryL9rGpfEP4/VDfHu3pHcxVHrCqGB+BZScGiDtJZnmS
         TzESefgqwBP1hnpm65nLVkYu+TDBIgVQpdvJFavgsjG6ly+DkosHehYDjUidMZwcwCLv
         f2iA==
X-Forwarded-Encrypted: i=1; AKwUvBzEun1QBELsaCVVIMMojAHuaOw9ZT4lmuFSysltI3c1cysL4TKOXRzhuIIcTJ046VrbJ3/DvKOVUcw=@vger.kernel.org
X-Gm-Message-State: AFuF++n+t6nojdsXrAD0KFupckTrGZD289mTnZM8XndalghpdjcM/C/p
	5u40+TSYPiQEO8rwSsIfA5H25irKkX+1izYejVu3tfdTsNsFDflkP+/9
X-Gm-Gg: AYBFou2uJVBe47wp1qkPzSn15bb0id981aLaeTiTPHYC191g3j1LBRDls7Xyy5BqJf7
	JNOZ3LB77xpcxn+VnVYTEbgiI7FNYk5HkRPahnlpZGyjxm5I1K/WN4THj2ww+YJVG8tjJFpHsrO
	GrNyEUuaDj2bLxfEsbBO2YJfwF/Hs2h0wUa1q6M8r2kNsV0sdubymO6arjhCUC4LZ5BniSIQZp9
	pQgaXm7tzapCva7WxpmU1ENXfLO0529WblpgaY1j+Ge3183u42PBRAWSpA0NHbRgI+sxecv1Dga
	O3jgA3TfrbHD+uag6boj+O2L9mbNX9gAkChqnzHe9h/KmroEocx95u60xS1HTlzH/JvqertKfNs
	4zs2CPqROizWjCMFF21F1QQIBUk7mh7aVLiexnfZcI4QIZbKjke1ROe1FCx+QtBzXJ3/mmg+FfO
	L7fUMoT8qnkR8y1XQwSOXZHNRrx53XwGNTftXY/ESQ2Q3XDIO6Y4bD81yxtrGxSrHg26F0IkG/Z
	845ZAbwfAS7L0X7lyP2joqNIF83/COLa3owwY6Wd5izRv2odiXJUJ/BIMBi7NoaR1c78XDv4SaG
	sNZT0IQWo6R6b7eB/sMT7RDAOIRDuEKvCYrEpGEdl88OPX2I+OmC5Jz3kp9XzWpOFBF00XMxcXn
	6hA==
X-Received: by 2002:a05:600c:a307:b0:49c:f13d:ffea with SMTP id 5b1f17b1804b1-49cf13e05c2mr154976805e9.14.1788601627485;
        Sat, 05 Sep 2026 02:47:07 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c6ba4sm14232013f8f.25.2026.09.05.02.47.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 02:47:06 -0700 (PDT)
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
Subject: [PATCH v2 4/9] docs: kernel-parameters: Drop the enable_timer_pin_1 entry
Date: Sat,  5 Sep 2026 11:46:44 +0200
Message-Id: <20260905094649.41996-5-kmehltretter@gmail.com>
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

enable_timer_pin_1 lost its early_param() in commit efa2559f6516 ("x86:
order variables in io_apic_xx.c"); nothing parses it any more.

Drop the entry.

Found by cross-checking every documented name against the __setup(),
early_param() and core_param() registrations in the tree.

Fixes: efa2559f6516 ("x86: order variables in io_apic_xx.c")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 2a8d862ef30f..f4314492953d 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -1647,12 +1647,6 @@ Kernel parameters
 			to discrete, to make X server driver able to add WB
 			entry later. This parameter enables that.
 
-	enable_timer_pin_1 [X86]
-			Enable PIN 1 of APIC timer
-			Can be useful to work around chipset bugs
-			(in particular on some ATI chipsets).
-			The kernel tries to set a reasonable default.
-
 	enforcing=	[SELINUX] Set initial enforcing status.
 			Format: {"0" | "1"}
 			See security/selinux/Kconfig help text.
-- 
2.53.0

