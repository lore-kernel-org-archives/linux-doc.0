Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0960621770A
	for <linux-doc@vger.kernel.org>; Tue,  6 Jan 2026 05:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767677306; cv=none; b=iY2O9NDu0J1elgtP7UoC1U5fSJ7gDMXdFrNlajBPP+KSAQdY3i/VgFpL+W2CgG8MzSMSZ+EPnRRni8oSGzdMGCiNnpM6J7o4qIy/1r/oljotXQPct1mStxIw5/IWsO1O6P5NwxQb8v/srZrs3dXClvMloX2juL6J3tDfBuZe0Xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767677306; c=relaxed/simple;
	bh=K7A/W1ylrTsIpBtknKm+NSGACkl3Ze+EFt7X+DmIW0E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l4OLBxcndECih36Kxi7LYa892MVKFr7wDu/Y4aYIYjAgeNG9BP+vbJfsB/v1JLy+srwB0NR9v9o7bV4PwMejnyYLX8//cGdOi2tZhshA7dgiyxwcOEeE2SsccQq38z308kBty2jV4bcEUQtrYDWtbDNolzdRJA+yv9Zwh3EmnuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=NJ+MFkJy; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="NJ+MFkJy"
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-47d3ffa5f33so2830245e9.2
        for <linux-doc@vger.kernel.org>; Mon, 05 Jan 2026 21:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767677302; x=1768282102; darn=vger.kernel.org;
        h=user-agent:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oyCImFW2OxUKLK3JD4UOX+w55FuLQcy167IMf21WTEE=;
        b=NJ+MFkJyydo3fAjFA7GK3+vthWLgp8KLyD9I77/I7Eg4GZNTqcxYaAyMruFOVELCw8
         7uOlvNVbYcxPIltqOS9Ev18Wm3SwiDYo8l7WbCTbOvRJNtz9+8iMU9x/w3qtv/BzDKqw
         BV077WgP9ANFMsdSgsxajLo2mBeRXs9i7b3jOITkQmRouXKen2QV+arHml6yD/7x6RSB
         WQaemJlwt4cWgficf1Q/TnbosCYlJ2M97U1NP2fkI0RdevDaXhN6bT953+YH11fzMjiM
         mKIwZ5tR9FczAnoAgv4G50z+nKDuhIOSr0z3JPnC5YdOWWHTqHf8b2zTKxpD8jauu33y
         gnCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767677302; x=1768282102;
        h=user-agent:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oyCImFW2OxUKLK3JD4UOX+w55FuLQcy167IMf21WTEE=;
        b=Mktg0lNAW9nyrTjfnJAwEWqEgooAnACAv7LEuQxzUpD+IXo9qUCyQ6DVmghK4sWdUj
         StFmhVzcrRdfM1jGD4UkUP3hmsMcmPMYVDy3okdwnCb02RaQ74brs2bN6cHYyjOpvTXW
         FOtpeWv4/oEvjBCpnNXX/8yzMwSs/eXz8bfv5++P596ydV36x+cFshGcURNjRjlgTTW7
         mPjLrzLHIc4e7p2LbPofGG/d4h/FWF2aZpOp7Nhh0K58tiKfGDT20bk2kYBmxwF4bdnd
         sowtW/PBTOW5qSWai94Miml+VIM1DaGXtAUlgNh+9lTzJXlzxcgNtzhMx6CD5aTh/81F
         4pIw==
X-Forwarded-Encrypted: i=1; AJvYcCUb5SSnpmY5xFYDSHfkuOnR3Tzpcr19v0cgL9qgZfAQ4iummlv1D17CCX/6yXN4MUkpppbDbVqMDKA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLgjYTTmEV+dt1i4VKYR92RDrJIB5ow5Mm+UbmAqD4pKm4y3cs
	V6+h9jQhKe8+TOMiPyqWtLSO8x5jSaH8KuO5Fja9VhiLd+cteAlQvW+wT6bthDUIgWQ=
X-Gm-Gg: AY/fxX45pOhym8qwmvYb3NEpDrNq72c22ntUX3NCzKH3fYOP+X9ZIVjAwRnkZECXsEY
	6byIJlRg4K6wErqdzfJC4HnvGDUYA6Ne+OXtkeK//PoZzmI7dZalORmh+BEcMRPeySKPkVZLUVt
	xhzvKzh5N2bKTqbsBhgcKjFbS+UZqYRrYNLTe/xvDLooPC2OmtFnG0Bf1+/oJqswvkYtbYR3bFC
	KGxbDdC0RKzLCauDDmHhEc5mWKhw4db1404uUu+LcZyQWikltbjHWTy8JVAFLIAn3kx0f56p0r0
	NZRPZojRqujNhLu2jp8cOdQIHCqMECTvJJmrlJ8lG5TGf+l4mNkyZC+4rDwusf5QlFplGYgm/LL
	xOhGEM7W7We+J17C8fhdZN06cItYnAfLXReSbcTFb123leit2mCU/la1oU1DESAyTGt+KIQnPJZ
	y8raQLmVGbUckp9WDu2BV92ipCGq0C0NWldlqmxA==
X-Google-Smtp-Source: AGHT+IFYG+NiRZAxtQMP3WVtDu6r9Jmli3zfAlN8gHCFJGQloFxv3FObhkqWk1Hj6h0egUzznoJzrg==
X-Received: by 2002:a05:600c:4e51:b0:477:7bd2:693f with SMTP id 5b1f17b1804b1-47d7f0650c6mr18640805e9.6.1767677302277;
        Mon, 05 Jan 2026 21:28:22 -0800 (PST)
Received: from r1chard (1-164-79-94.dynamic-ip.hinet.net. [1.164.79.94])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c4795fsm8906855ad.33.2026.01.05.21.28.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 21:28:21 -0800 (PST)
Date: Tue, 6 Jan 2026 13:28:17 +0800
From: Richard Lyu <richard.lyu@suse.com>
To: Jonathan Corbet <corbet@lwn.net>, x86@kernel.org,
	Borislav Petkov <bp@alien8.de>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Richard Lyu <richard.lyu@suse.com>
Subject: [PATCH] Documentation/x86: Update IOMMU spec references to use
 stable identifiers
Message-ID: <20260106052815.46114-1-richard.lyu@suse.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email 2.51.0
User-Agent: Mutt/2.2.13 (2024-03-09)

Direct URLs to vendor specifications for Intel VT-d and AMD IOMMU
are frequently changed by vendors, leading to broken links in the
documentation.

Replace the fragile URLs with persistent identifiers, providing the
official document titles and IDs. This ensures users can locate the
relevant specifications regardless of vendor website restructuring.

Signed-off-by: Richard Lyu <richard.lyu@suse.com>
---
 Documentation/arch/x86/iommu.rst | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/arch/x86/iommu.rst b/Documentation/arch/x86/iommu.rst
index 41fbadfe2221..79c33560299b 100644
--- a/Documentation/arch/x86/iommu.rst
+++ b/Documentation/arch/x86/iommu.rst
@@ -2,10 +2,11 @@
 x86 IOMMU Support
 =================
 
-The architecture specs can be obtained from the below locations.
+The architecture specs can be obtained from the vendor websites.
+Search for the following documents to obtain the latest versions:
 
-- Intel: http://www.intel.com/content/dam/www/public/us/en/documents/product-specifications/vt-directed-io-spec.pdf
-- AMD: https://www.amd.com/content/dam/amd/en/documents/processor-tech-docs/specifications/48882_3_07_PUB.pdf
+- Intel: Intel Virtualization Technology for Directed I/O Architecture Specification (ID: D51397)
+- AMD: AMD I/O Virtualization Technology (IOMMU) Specification (ID: 48882)
 
 This guide gives a quick cheat sheet for some basic understanding.
 
-- 
2.51.0

