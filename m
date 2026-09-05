Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D663DEAFA
	for <linux-doc@vger.kernel.org>; Sat,  5 Sep 2026 07:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788591860; cv=none; b=qO4egQdSNv3hv6gX1i8YtYnMgzX4q1yaIj3pYsAnOZWgjTbbNIGTi9RwSJwYqhvTTALduH8YHZGJufhJTIkj85m1aaFD3UutjklSCx8Ixep1wUd976vhYLENwGHJz2GB7LPV784eJc/jv2/2y3IHe7W9j+T/tbOWB+ZHXLsE93Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788591860; c=relaxed/simple;
	bh=iIEWAYVGI2FzX5iZTyH81lDATptMQacAG0wTPy+abXo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=g7VkrNzq5xmOTwgm1RF80ifbWS2Ec9bYzFy5IEZ3YCuSdw882vk1sF2MNI0ZY8beiQOF+LQxEaVZz0mKOfcly7tG8U1FhDCevh0XwZTBrsZGlG8z3XCb+eOebzdd8C5TklYiBkd0mPAmcE9KqHpnWVkgEkCqZt6tUeJTHV68IJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n/VnKgEw; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n/VnKgEw"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4843efcbdb2so939706f8f.2
        for <linux-doc@vger.kernel.org>; Sat, 05 Sep 2026 00:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788591849; x=1789196649; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8xnteEJpCubomPwB6glv59IEZPm5BMjzUqWSxe52tsE=;
        b=n/VnKgEwCzZzuUfJUOeRE+oKzjhVOyufVIm6bkaulaLPTDQm2Udno1JesGrfw+QtXz
         rtm2HC9oekj6emqCHGdjmj8Tg7GtyOqUaLYn/RB0+FVYHZ+4xb5I8BszVLSoWQKWnUOz
         ykiTBqE6hq7UgsTha8RD7CuhFhhy5kDjFQBiQCgcgB3RGwGNRMX3Pg7/TRuIJqfw2a9F
         EpjIsiNmxO6bXgxOyi0EgzQ+9+XnRBpbp+/MkKVQI+xT0XzSfP9iUXr4eIb3HBe1Orv8
         BHqNJmEGTo7OOeFNbie58dyBfFSSmVSCeP0DGssZQo3HSLtGpMSaveVk3WFXlSZhC0II
         gtNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788591849; x=1789196649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8xnteEJpCubomPwB6glv59IEZPm5BMjzUqWSxe52tsE=;
        b=o2dRmQHpSTNiwcYmV55VbfXLz6QaLQRAmzVid2DPafV8MaX0lzzHnX7sVT7Q5R5mFr
         Jqfop/PM7W+S3z3/0Va3/eCtr31VD01N6CXu7DVd+6VS+sKH9YeRT/KEw2G/iUlmHgus
         OLT3s0jBvaSQHJdMCCV/RjekxWdenVqcG+Y6zu4v/hhcy2U34DGlSDwl26hT+BVT8aYJ
         6GSqjnerk8a+m41qG1sAXFZzXEmi933JAFL7kppOM6tZPiWPSzJBQV1je7/vbEuotnCB
         mygYEZfpzxDqi4N/jDLyZyxwLnsjnFOD0GtI7BJmoH2X11ty3sBmGXcpWG/KdjR1UGTl
         bw+w==
X-Forwarded-Encrypted: i=1; AKwUvBx5yLlppyeHCF3GEkL3kb6psg9axJHm64joQIojfWJhq8BsBU9hNAT5BinCCnGvszo+f7Y0uR+cfVI=@vger.kernel.org
X-Gm-Message-State: AFuF++naV3zWplmPyDL+DEbKfojv/eimRLGo8DFYxSE5SPYyruhLKMIh
	z2vtgS5gw51wl3MtFOnb7ZRTQJH54A+qYTreYPkGzywb2hhq8Z/qGd0W
X-Gm-Gg: AYBFou1Mu4dSA49++cPJqYdqQSfru0HC34+6/dIgN0GOnE5qtRWIRuwGYSq7WaQTSV4
	4IhfS6Ha+e2UR7Mkw5aYXvBsV+bcVojqbmYyj2v97Pu8phbSlKK79US4qD4AMU2akJC6+LNDRCV
	kVhhUYE+gPU5LRv5l676GyHZWNAIDNSw+QdVheFOWCQ4qacJoo4Hw1XYmVZpx51ixVg77DtEE+b
	XNFoTELEG3d2GdRcA0YfTmBVg4sO5kByEIsfSr471kQMnzRMG7q+k+Utg25mv12x7Jw77a+eOIl
	nbBGsdUCO8tGLtm7DRj98CdUBUN53Q0cB70JZZYElrDP7vXLYQe4/SC918EgSmy+fcSNL6aiwPr
	8zgrkSUJr93HTIeYzqmDDPGI7DarOdwqtUx3Ixk01vtdJblJ/uWVRd47EmRDErpUxFTsLf9n45Q
	WFbUH8YsFpoQLes+3aZFl6O73tw3D9v0WTWM/d2hGq1m6/cAqrlxN9l4E+bbatWO1mmKFhqELH0
	81mcoNwtJ7thykPGaMdVZWhBAFAVE6ERuJcG63ed6uwWO2tTMN/aT/V1p6a6Ui5QXlLZ9D86Zh4
	Hftgrggyf+WkWVxgsTMJKNLbG3mKWtyUWwIaYMruDp05QXNYA4UxMesPw0lZIivZ7pat7kHV
X-Received: by 2002:a05:6000:46c8:b0:484:3f43:4914 with SMTP id ffacd0b85a97d-485872a6622mr9310761f8f.20.1788591849363;
        Sat, 05 Sep 2026 00:04:09 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfdf6sm12011719f8f.34.2026.09.05.00.04.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 00:04:08 -0700 (PDT)
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
Subject: [PATCH 8/9] docs: kernel-parameters: Drop the pcmv= entry
Date: Sat,  5 Sep 2026 09:03:46 +0200
Message-Id: <20260905070347.25902-9-kmehltretter@gmail.com>
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

pcmv= went away with commit 7aeffbf2ddec ("pcmcia: remove unused
pxa/sa1100 drivers"); nothing parses it any more.

Drop the entry.

Found by cross-checking every documented name against the __setup(),
early_param() and core_param() registrations in the tree.

Fixes: 7aeffbf2ddec ("pcmcia: remove unused pxa/sa1100 drivers")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
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

