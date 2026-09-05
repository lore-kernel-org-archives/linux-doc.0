Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F5E442B10
	for <linux-doc@vger.kernel.org>; Sat,  5 Sep 2026 09:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788601640; cv=none; b=sPJejQH+GQF4bxq8/YWEbrxONPCGYW4sQpuI+EoHxPIfjXqxIVfXGol0UQ4ZrnANahXgVNnBRdQyiNIu0bqFyEiPxCQvGxj8MBKsc38vADh8ie45Hk0LSfC9dv3nsqCo3X77tgThfUyR7QAriK6PQiZiFyQc2YxskQm62WGgJ4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788601640; c=relaxed/simple;
	bh=tXKjfoKiXZ7V6wID0vROu3EjAKBYvGUXtlTaR3CzeO8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=b8TK4lyUMbKrWVmr8r05E3lxSfWE9zhd+KWpo43P1O7Olep2RjfyUCa7fiEQe/tR5J/juXWeFwdl1SkReKhqCyMGHwKgnQfjqQuwm8mgs90B3prMATrECQVbgbN0Ws52UDaQEqlPWPJWcA5rxhhcuivuyJZhnbEEn3ePuE0ayks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IEVPm1zf; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IEVPm1zf"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-495590dde14so26181465e9.0
        for <linux-doc@vger.kernel.org>; Sat, 05 Sep 2026 02:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788601633; x=1789206433; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0boECcjjn/VFHFH6rk1vpO238PkXNlP4zHZKdanKNnE=;
        b=IEVPm1zfJ3dYP4k/o2iihvqOZUQoa934q5meWH63sSrsaeYufweygjH57c8MV9NFx+
         lkQAY6pKYddn41/9VK2PK5XddDJhNrdTbnuKAaBUqJQj/pQ1hH6uaKHFaFZpYydnqWif
         iYUdcJQ3zgkHLUpus7f+x7lrko4HImMasZiYYCKwX92AsuKXxzX4Y+PE06+v3awXu8z+
         aKzCjivlRQudT5FLIn5THmRE9Yuu+YyNddrBqUxqTa60piZAC4sp1gP0mr3F9Jdu435L
         vGAvspUcmCZfuLpNewH/64WPN2GxRDd6MstWVz0P/WNasjh8mB9Q/dxa4Btjp3Ij8KrL
         cImg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788601633; x=1789206433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0boECcjjn/VFHFH6rk1vpO238PkXNlP4zHZKdanKNnE=;
        b=WC7FuVTGT2aT6dItVjAdMZ3NVuUESeIEUur4qGyvpkEe6qJnEiSybMqTT6/KfIBiC6
         g0xIq7xUlrieKlCSKuvoNBUXhKJtNHMtFB4hMQegAtIsacNTM4j+S8kowTB/dVKo2y50
         2jhuwbBmVLstkMHoWi3ckblRHFgxIxFJE86nUcjUzusCIr2uKKKHtW21DQjG3Nv+kAvL
         vVp+0R7DY/ZkFrE89/jdmoZWBTr5HqOhFviGQqf346EISC3tdSN2e0ljpxB9w9yNBZsB
         n8I+Bi8qRGV6jLIiHqXw+MVLFTG1YJOqwDygpSX0gBQzvFPpcsfD1aQE+4HuiJrErKc+
         +z0A==
X-Forwarded-Encrypted: i=1; AKwUvBzhjJaV3j/JvjWOV4s1C2/8RqNWSJHolTffl4HFdn2vKJhsHOYl6VBQWFjOlYwKqDJQ+3M6tVIiZ+8=@vger.kernel.org
X-Gm-Message-State: AFuF++kDffMzdUGMxo0Sm11fdKIjrOPtOtFF5IOFwXKeiU8dWvkjPwNf
	tmyJRru7IRKbUZByN+UTR5NXMWQQhFuVPzxuf3OWQuTS2WrJB6FGoK9L
X-Gm-Gg: AYBFou0ZdgkJvqSDqqq5y1oP5S9I2vxByygYj7iNrTXlb6ftH8vLdbmTqNQQgALizZb
	NlFLiI7Q3ljkH5cST/7Owmyo3xhKAayLPa7ElXzn8G/AAvinrszOfxQA9TbZ9pTpSIdsTd39BsV
	msZfVYKQzXkSSTmMWBsDg/Bez7W5Hbb/F6ryZNUREeGgtiBaB7xyt5ETOTiF943lEjwwCYAN990
	b6C2DbIysT7yyWnlXZm4rIii1sbJ9hfH4jWp68xSsgcE1WDo5C1IDgj1qzf0sEy+EIamHMrSI2h
	aUQ2ZCG9eMbx4jvHUD3Gq9yG6nz6c3vOAsR3dqHPhZJawphqt2sE9sDA26IvM0tKg+lMi3BpA65
	0hSCSzGqb1eeTEU0hAg2ilhsnyHMuNDWkAk56Nj1sDjP6a+dG/oYgms9kW5j6lN8b6l8FbEXNyI
	JYi4OIYyQbICs9ppoL1PTLU9pABpF5ZgZEgbW9+kkw2oJvpcaQQpPnGwj25REZlL2xRPRX1/E56
	WuyXls7xGC4r26csw6Q+6U3NUz8xdV6yyZfC6UNCBLf+gid/G3p22S9FTLsQLo583YD0MLJSeM4
	sPQJRQ+H3nQDBDmySegacKVOsDXNpSzICUK72vZTFSM95gAh8qiqvjNnr6s9llGFnII=
X-Received: by 2002:a05:600c:8b11:b0:49c:edfe:d525 with SMTP id 5b1f17b1804b1-49cf82417f7mr260260105e9.10.1788601632697;
        Sat, 05 Sep 2026 02:47:12 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c6ba4sm14232013f8f.25.2026.09.05.02.47.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 02:47:12 -0700 (PDT)
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
Subject: [PATCH v2 7/9] docs: kernel-parameters: Drop the omap_mux= entry
Date: Sat,  5 Sep 2026 11:46:47 +0200
Message-Id: <20260905094649.41996-8-kmehltretter@gmail.com>
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

omap_mux= went away with commit e9f5f1e45608 ("ARM: OMAP2+: Remove
legacy mux code"); nothing parses it any more.

Drop the entry.

Found by cross-checking every documented name against the __setup(),
early_param() and core_param() registrations in the tree.

Fixes: e9f5f1e45608 ("ARM: OMAP2+: Remove legacy mux code")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
Reviewed-by: Andreas Kemnade <andreas@kemnade.info>
---
 Documentation/admin-guide/kernel-parameters.txt | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index d44728a45506..48dd273eaf6c 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -4765,11 +4765,6 @@ Kernel parameters
 			waiting for the ACK, so if this is set too high
 			interrupts *may* be lost!
 
-	omap_mux=	[OMAP] Override bootloader pin multiplexing.
-			Format: <mux_mode0.mode_name=value>...
-			For example, to override I2C bus2:
-			omap_mux=i2c2_scl.i2c2_scl=0x100,i2c2_sda.i2c2_sda=0x100
-
 	onenand.bdry=	[HW,MTD] Flex-OneNAND Boundary Configuration
 
 			Format: [die0_boundary][,die0_lock][,die1_boundary][,die1_lock]
-- 
2.53.0

