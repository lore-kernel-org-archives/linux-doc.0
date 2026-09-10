Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C88286D56
	for <linux-doc@vger.kernel.org>; Thu, 10 Sep 2026 01:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789003986; cv=none; b=Oj3OKWF9lWpPeiAoLwAms6p6LT3dvrxMFxPzJ/+t0bgSeNr9QND45PoKFWwzvwOyXRigy1QbpfJVIBflBeS2iIcD4RgrddrdeYXxnutLZNT/gW68GcNTDxA+n6ujRjr2EdZ5MmRwDKo0kItb1JZfTNY4MtebWjIGaXuCbn0/CXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789003986; c=relaxed/simple;
	bh=a/5VJy34H0a3YmpXDQg4RHMoRD1nfV8oGhU09Jy89UY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mnzLHxwTlCLWiU+uGWDHKU94HbVjmu2GdXNrCrUMnpyRLydfvevEUWgZfsLlc6bxKug/+/m9Wza/d5rHlJraueptzd5NKUH5zKW8WZGZozybF9VAaRTEFUfjmN6TKs799qmyaOmIel79Po30thcq4HufdQSvyvHMFCwiuxUGwnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eblfM+W0; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eblfM+W0"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b91369ef6so6027705e9.1
        for <linux-doc@vger.kernel.org>; Wed, 09 Sep 2026 18:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789003979; x=1789608779; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eqEAObzkBokG6giVkbje5sCVJ4bEsrze6B8AG9wEiz8=;
        b=eblfM+W0tES7e2p8PyrGkKNIUdoEi0nqWrujNEKri3F7Yq7PU10sQMdFxa2S/bYW3Y
         Mdsef5EWxOw+t19bIiY+YFQmIU7A8l7azWrfoZ48SKX2crzuttvew7FPXwe5drOZNaaH
         rMI25uoSerN6QmA2j6thpAhND7hx/DxgMXI6IWiQh/3wdNpNpHiRWyD08pZChR9AyF4F
         RTAMZecjQ2/1K/PV9AAn8oHfy3F5a4JOS4vn2CINwTnIbH3sihFCZtRpYlmE07DlN059
         mW+cY5rn/u7TN236POtCtetvxH83cm8nNUZklliWRXB7w+9uIXYHdGzV2VfU8zMWgGKb
         JPOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789003979; x=1789608779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eqEAObzkBokG6giVkbje5sCVJ4bEsrze6B8AG9wEiz8=;
        b=BCaZBl34eqigIxcTp2qqRtikp51dTqz/OctvKf3Uz3hKrA/95jWn+Rdf4cwo2MlZYf
         PT4PuejjEYO3NyDhXmO9hgPtuK8fzlpRZ2ol27R6Ic6x5cyhWB+1icULZVBtxVlXzwL0
         5R0EvO5d4cDBQhSQopNcnJQ/OOJuYjHQWRGED7dlz7pj2Uz7umCfRnSZBijI8JNE4kwu
         vDE6kDZhhLU/BoddTbT5SQvLFc2XwoGVTCFyMXQDMCX+On3Wp/1Mxaq3Oa8OF0IrWmwo
         4Xf0VNcRGXoLvvlyTmtxRhm/K8Rrq8hG7QE+Iz28vpUQR12XZWNZHWCnP8kJbccCxyup
         4mEQ==
X-Forwarded-Encrypted: i=1; AKwUvBwbVEXg2XFTGNCnw7UYCE56X2+bazxYgDao2AK8hwT9YLoeH65RIncHKOJbO7SuUVbUCSRT7UbXdB8=@vger.kernel.org
X-Gm-Message-State: AFuF++nhmcFpd8ugwBcToOVUOj8HFeEPDFyDNR0+IVTC5QWYKh6l8vxD
	PmwvZ0TFkrwpHK5/OfCmGiOAv99jgMZTdr8A184yssgTdMYIps2KOsiX
X-Gm-Gg: AYBFou3Vn580iAWXOVkApqyGb8caMiFOpUf+altJI+vr/hb1Gp9676+Ij738cHSJWHl
	egJbvgXaFSd6iM7a9qOvo4S8BHnC2wl4QXoLry4j7//oXbGfv0WkwePSNPo/7BRD4M4K5OxG0mW
	w1ffUw28PZDcFT4z2+IAq9pHfpB2mvPa4vTJDjynxca0kNJ2v19vdCaSsLIKcgsOpfUxJoSd8m1
	EHNw8BtAbi3Q4Pm5ri3OOzvDHOLs/9vHJlPrvvLjXUxGxOL0Ly6KAo478Ak3qcWdVV+T9b+STfz
	SSZ0JejylRkK+2hO/uz+QzgzfpVXPGeQ8pOmbhQhR5i40/WOyRhvnfzyBhzN3wVIZkE6ySmFXXV
	+Q/aSICy6r8I2znmNFmUpVnVzsl/aGE4/V4I4JfdZ2bARZ1GoXSnzrE8vfbSpy9iOSSVkzQLqVR
	O31rEYRFt2Bs8Y2R9CkuQ5OB4toBQelimR4I5+0rGY1tvYp6gEt2aX9B2kFKsaCoOThemFYkXDO
	ds/dU7PILLlPmHuwYpPne3jb5KYTCfTXksfARr+SyBNoJO8P+atWxMHCd6kZSMpKSciVpwgFyek
	dMNhN3OXFS3blNXbVGnORuHbzvqiclwKqYqOuhevkZg//AnoFCXBHOAQmIuKyO2F5qvhuhPljnM
	oow==
X-Received: by 2002:a05:600c:150a:b0:499:7a15:fcec with SMTP id 5b1f17b1804b1-49d2592e85bmr54568515e9.13.1789003979463;
        Wed, 09 Sep 2026 18:32:59 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b090-6201-5565-e933-e630-1831.310.pool.telefonica.de. [2a02:3100:b090:6201:5565:e933:e630:1831])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26d4e3f3sm35852735e9.15.2026.09.09.18.32.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 09 Sep 2026 18:32:59 -0700 (PDT)
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
Subject: [PATCH v3 4/8] docs: kernel-parameters: Drop the enable_timer_pin_1 entry
Date: Thu, 10 Sep 2026 03:32:41 +0200
Message-Id: <20260910013245.8619-5-kmehltretter@gmail.com>
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

enable_timer_pin_1 lost its early_param() in commit efa2559f6516 ("x86:
order variables in io_apic_xx.c"); nothing parses it any more.

Drop the entry.

Fixes: efa2559f6516 ("x86: order variables in io_apic_xx.c")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Thomas Gleixner <tglx@kernel.org>
Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
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
