Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C1A733509B
	for <linux-doc@vger.kernel.org>; Fri, 13 Mar 2026 19:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773428524; cv=none; b=i08RjlyA7+DC1LoLclLNDYPSX4akK9aC8+A1hff/kWo6YurTiZpbzPSe9S7ysFqcNdLcIeW8ss52Axhs4QRnTivgPd0uzIYoIndhwrOKywKaJqWgZsUZ2/ZS3nazdrOVAKfML7RxRFwrUFD9k7Oj7rmnJ3zIzngHAsJVDUxnnr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773428524; c=relaxed/simple;
	bh=eE1UA0pUxgGkw+6Gkhk+S2zsfYG6rBTRjix5aEi4x3o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hF3Pr+rnCLS9/6GMsJ32fTFZBUTFOkIPcoe0OPOKS9fnibZkSQf1KMKnZHPvOuhVHWmnaeL1DmiBf2CXg7naoxiGSXhbmZ79KenYd5mcYAyob3LmwYODaYDp6tTAz+bE1Wo/BE6iRAyZBJ+6KyvItduqyuL76DRm3C3gwoMrRug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=myromyro.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=myromyro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-439c5b40f60so2136098f8f.0
        for <linux-doc@vger.kernel.org>; Fri, 13 Mar 2026 12:02:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773428518; x=1774033318;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N5PoPxLHzzOgQ4aQhfpRnXF2/cZz8Pig0x53dO4TF14=;
        b=fzhhUdVNX1QKvVeGy4hsy0PdHoHNClToaLlHlth7yA8lZU01snOeYChl+1a6vF+JuI
         Nh+LA37nX5tzKQQz6RKcTrhYWJ9E6QcJ9yiRGipw9edhnQYlJAskYbb0R5PkLTER7Dxv
         odLY04XSjemszHpg8cH1pAOe/YajEUdfEwrIa/MVAnaH4L4MGQSnMslv1rdRN5Zakl5u
         TShqLmJIpn4Woq3P4T49emvsSq+xg+WCh1Sh4BoZXnbMfgrk1R5NsrDQr3yAgsUmo2Sd
         2fgaU4rvGd7mCSIDIfIS3a0DrqS8lqdP0Cl2V2nIi7uP6j6bHfJUwHcVl2lK/e0Jo7GJ
         HkTg==
X-Forwarded-Encrypted: i=1; AJvYcCWcab/qg5FnWt1dsy3NBLyRNLs5eLG6Jak4+M7tkgCTJ6RmjewX7fCos0rd+NHJjDoO7NWtpAkiQ/o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSvFKmzUQg/25+d9G91yVZaLzKkMdKRsJeECi1qJ/JKaSooY3y
	ASJd16MLtkbZRkWdxG3nhV9ElP+/QKbmd5dD6GZ71V5Y6zP1scuaDVzC
X-Gm-Gg: ATEYQzysYRmerbYck+79vAWfvCryz87S+JLsvFtm80n4qjef4nCSlgPwymsEyFMtVOO
	A25ZmITL1nKf0oYN5vLDx7tC3vqlJ6Wp85SklFlTglEYH80QJjLcTl95MHls0LpHn+bqnvOlrF0
	Ls8xYS8wkEArVl1o5LJyDQbOrIWfasjQyPEqAY1+IA4APREpra9FWSX/+bi3KDtEgGSoSWlMQ7P
	q2lgs4u+WkXzQvC6XDL8sYdb9N9V57BSvoVBtbfBp8xNYkhtvWKykvOrDqWxmmKElcVdBeK4p5N
	7q7idWGpZD1R47rdHKAQoC0EbI7Tc2Tk74fWkWg/E10W72U8ck0S1fMDkzbB3TNG4sFNa69v18f
	caSTsPNMX3HXUSmeMeQQxG6PcrIUDRkMXZB8JPasD7L76ba2YW0mqTcMPgFO1yIzKqkARFMYeim
	Fca58HRkAhyUSIV/4mvNqnM5xEXCLO7QFhJvCnP/GIRoXXHiiLYSOQ19N3uhBHAwEQm+01dpoZj
	7Ve+P9N9k2jR4vNX+oG
X-Received: by 2002:a05:6000:1886:b0:439:cb1f:44f9 with SMTP id ffacd0b85a97d-43a04dc3422mr8326692f8f.47.1773428517972;
        Fri, 13 Mar 2026 12:01:57 -0700 (PDT)
Received: from x250.speedport.ip (p200300c65f1d6aa7fd1524d9ec6263af.dip0.t-ipconnect.de. [2003:c6:5f1d:6aa7:fd15:24d9:ec62:63af])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe1b287dsm18811273f8f.17.2026.03.13.12.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 12:01:57 -0700 (PDT)
From: Myroslav Demchenko <myro@myromyro.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-sound@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mirademche@gmail.com,
	Myroslav Demchenko <myro@myromyro.com>
Subject: [PATCH] docs: sound: clarify PulseAudio and PipeWire configuration description
Date: Fri, 13 Mar 2026 13:01:40 +0100
Message-ID: <20260313120140.45022-1-myro@myromyro.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Modern sound servers such as PulseAudio and PipeWire support dynamic
configuration, so this feature is rarely needed today. However, it
was useful in the past when audio setups relied on static configuration.

Signed-off-by: Myroslav Demchenko <myro@myromyro.com>
---
 Documentation/sound/alsa-configuration.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/sound/alsa-configuration.rst b/Documentation/sound/alsa-configuration.rst
index 55b845d38236..a3d8da5a3f6c 100644
--- a/Documentation/sound/alsa-configuration.rst
+++ b/Documentation/sound/alsa-configuration.rst
@@ -142,9 +142,9 @@ in primary usage, and people would like to assign it as the first
 appearing card. They can do it by specifying "index=1,0" module
 parameter, which will swap the assignment slots.
 
-Today, with the sound backend like PulseAudio and PipeWire which
-supports dynamic configuration, it's of little use, but that was a
-help for static configuration in the past.
+Today, sound servers such as PulseAudio and PipeWire support dynamic
+configuration, so this feature is rarely needed. However, it was
+useful in the past when audio setups relied on static configuration.
 
 Module snd-adlib
 ----------------
-- 
2.53.0

