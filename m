Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D511B3DC856
	for <linux-doc@vger.kernel.org>; Sat,  5 Sep 2026 07:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788591850; cv=none; b=c5O5ZWk7lXTK3UFPFPRbY1yiN8rpvRj9tEmsThwoqhTFwf5l90vEqiavuaTLGfdYmtqx1u3kmUOvZEQAoBdcgwGFetev62Zf0vxFyV+e2TFYtlfLeJNn3qsq/fL6ColnzDvn5pxu9g9Y1j27zwAUgVIL/bGWHk0qGRn8XZx4rg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788591850; c=relaxed/simple;
	bh=YsfDHjDKsIWAkoUgaj1imFKWTfOFfJnvMXwuV6H0pgE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VmvfLX1mWv7LhTg+o8YoD+CPOLZ5ieEcrGGluZOLUc1aBNZ8hfvkfn6/K2TXH/3+6GGJ+tfzrSblM5x4mOduul5c1R79q1Ohklm09lCqwNDIhzLQ6r+DA3LpeeHtvnc9kTVxMCUPiZ+Aoilzq8kAfXzGaJXcWVCj9pIBbDGlm+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CTgk/Bir; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CTgk/Bir"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c259e5c22ffso286657566b.1
        for <linux-doc@vger.kernel.org>; Sat, 05 Sep 2026 00:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788591843; x=1789196643; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9h3cyhQ1bY0apuRrAImVycgRtlSF3vYdx1yKBS/SgnI=;
        b=CTgk/Bir/irm1HNOtFUvU6UDv+QZsqLHmwn3U1pGvJvT3QHNNspH2iWM6hsvRzd0rQ
         +UBq6r6+i+ciz9GE1cNac5fERSG3fs531KyW86jZ4vkoKuZhDfTmhI7UhkPRKYUZmK01
         MgDyFOjl0fErZ+P01xZbNWAla+v84cUhIsRo7x3Bd9TmDbPPcPbjc9ZQjtLwW5ne+6jT
         w3JZtCZxqL6zrMQZd1HZSv/MFn2o+HtGLaXzamx0uFvJ4VWnHe7uUsowPi7AUWpdqM+6
         jIIak06kMPVed/xh1N37YsqjOe1Tpncqtc1BaaIYFR/Z5MraNH0XqCTmj8DSW4V4yRLa
         jG6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788591843; x=1789196643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9h3cyhQ1bY0apuRrAImVycgRtlSF3vYdx1yKBS/SgnI=;
        b=Nmb6CTM+w5XOdHBlWzf6SisSQ5wVvXkr0ORReBfAGSI24eh1f8Ek76i7te2Oavw6KC
         aT81hGh48I68zglQdlOhYDDlJ0nBuEjYaYV8dBZ+Ev7EjyCG+PMfS6gVfcrRJdV7Rtx6
         /wyDsd37HNCled2IBQTajWwrxbaRvC4zUxNAfhxyX69OqOigYekQ+0mtE8NK4L2kMFgM
         JvEgm9OwahzQ3PqFwid2o4Sl6wiH3EJjtnB9NAT6sOxqSKqfFnBvRAIGJw1rcs5MmPDf
         rGdwFO4WLxadfmmhKzGl9bI8lb7Ms4Cf9tAakj8g+Q/1M4oaKoN6QfsmVMHunlIvOT2M
         oLvg==
X-Forwarded-Encrypted: i=1; AKwUvBzcD7Nd1T34iZzqDAEkc/AeZn8aBp3nv8tv/YtqNAM5/asbjkVsYx5v5qJ6jNLnMPpKVpVmCQgRVVw=@vger.kernel.org
X-Gm-Message-State: AFuF++n7mz34XJzOyo9G4ypg7eSbQgPY44xFKMXTFdW9eccVQXVVvoNi
	r4t15Mq4BvRfpFghIRSrZijrZxMPVX1vPJuGuvlD6BLasdyKeZbdmw4C
X-Gm-Gg: AYBFou049exbwVwJsbUvfPSkOpDIp2C7h5kWKiTrCWuV35dJbSUE9vEOQo4IBQ9ycjc
	cauKRiJJjtp2xGSPvSDXg+JuMqAaLsxR4nk3NDdSK17b+9/x9dNBv/NZ69jLtt8K9i6xPTH2EkJ
	9jw7yUjsr9XlY9V2NjfKW5Pi5fk2AEkRN8tILQmzDXSMCcX/4hQuExaIdPRfxJLY3sP2MUxkjYh
	ineVybfw+/utSFV4x9ZGt6DfbEbT6KP6A13E60rKndAsmmbuIpaHBav+ehAs1KbQfq75rrwwP8W
	BtI6wjBcSnyjWbT9WnKcQrgjkMxYD5BwX/ry6FYeDP7fcDOHiu1dp/5jgb80A1TSy4i3V+81n5E
	9IwOdhYttqTczYq6uBPWQLREuamvG5puJVBQ9ZMZ54/j3ZVofQK5Ie4TfkgHmqjckvcD+Hz95Ea
	qTBPqPILXFX1j5QFMmlijoWvsrVn8Ia8HwDQwLM5mR5MQnCQF4iQim65b93wbA9js90FbVqDtql
	DIzQz7+0N8h0uixrGkl1BbwLlZ/HxQzR46ZKf71xqwLb6pBkJvzOuG0nZZdR8MoWXoU1d7rTvWw
	D+1n/4jtWuWoIFSFOrLZI3IgpgHb7wfJdSsbbObxwIXbH0NQX7w/C/yaMWO89Z/vPJ5+zedcBw=
	=
X-Received: by 2002:a17:907:d94:b0:c16:4df6:176b with SMTP id a640c23a62f3a-c260ca47420mr442803966b.20.1788591842595;
        Sat, 05 Sep 2026 00:04:02 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfdf6sm12011719f8f.34.2026.09.05.00.04.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 00:04:02 -0700 (PDT)
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
Subject: [PATCH 4/9] docs: kernel-parameters: Drop the enable_timer_pin_1 entry
Date: Sat,  5 Sep 2026 09:03:42 +0200
Message-Id: <20260905070347.25902-5-kmehltretter@gmail.com>
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

