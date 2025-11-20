Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A6E1494A8
	for <linux-doc@vger.kernel.org>; Thu, 20 Nov 2025 00:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763599645; cv=none; b=nJPvZoTQMXlr7kosEGR5xnQi2JZvkOKbIW28OPFikciIVlYat/O7HEC/3ot8ySveiaDZVjOhvFoQCwOwj/aXhAM2q2G2HjSB6SRVJFaV1+FmtETVM4Hq5WTkw7Yhx6W4M0vVSbLdX/GIgpADXufU2/7Aw5haKFuXWvFidLFis48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763599645; c=relaxed/simple;
	bh=ivn8qt3qtOtcFgu+q0kk1YYIE13gmngy4cnYQWDGEK4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u2q9ynsVvlFulY5kXnmdk5b1gJSHWivutaFsNiZZz3uVrpGfzS8rBJI+6ZHMM3Po1e0HguVyYfH8orjPwGV70XqBmMXG+nsOjSrG39sUOpKXkbGa7O7gc8uV1wePIb19aAu0F+eljpOSEwAk/6WbB4SCJ2j3ZyhGkiI0WYUXZSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xf+OON1H; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xf+OON1H"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-88043139c35so2846906d6.0
        for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 16:47:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763599643; x=1764204443; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=puth6Wv7pkNXWqWqMPPrzQflQ0wnF2gVjRI6DfFw6z8=;
        b=Xf+OON1HmfP/EY4923djQzUBvUUs6TdiQxi/1HAcnaMAUHl9Hd3w0kcbZ0T6+vjWUz
         mL/LF3J4IbCFmiftRbOz1mt9o2KrGqzf0IXbVaSEkHhUnbpf34fWHwVK51k57QUlkTQT
         gLnlqzCudY7mowHCtaTE5sFkQfK3jOzmW3NGp4TkktEc7qSncfbSh48dZdNxLxbaqFUa
         IcPrAGfBt7RJi1hl6z6PNCw5nBKEZtDKrPI1NnuSLkmbeud7ZbYKOhaRoeueP7djUcaf
         bUhM3BsNvgTLjiBHRlUt64gFRd+kOwG1RdmS6n9NYTpy6YhnhwzhlqhLB4wPUayYoPJ2
         +GQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763599643; x=1764204443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=puth6Wv7pkNXWqWqMPPrzQflQ0wnF2gVjRI6DfFw6z8=;
        b=qGecl28yKJmCUA69UOOLCz2eBwoWqFQaWp70iBAGfyk6j6PwF7rSA5uIoNyvsu5I09
         LKhn6OQ79HbvZQ/FJjCkaBMgoFIBiDu8UTJuIAWzqOxcJJNUQ4P+QgMzVpN/UUwIdnBg
         gWDiYQNeSae9oROmPbZxxJ25jsfa4sCDpOZpg7sGXSpg3iHjRUPNRsvTmIAOjPb4qbNk
         1sLwF25sppMl0ZDjtF1OKrKkNVp8o3mCXd1sVJe9/HSTcqSFLiVhKQ6jiYCC51pAAlwV
         XXYDW1wsSO3VVTWLvQ/v2GmixnKJCGxwD2BcaNxU9NkGJzpI5uY9kN953EFbtVqAA37l
         Z3YA==
X-Gm-Message-State: AOJu0YyK8Gc9VP6fJVFAKNMCCBLlups/n8Cg6bOU71cvjIOc2ei+SGoy
	d8wYP45i1u0aclOkDvWd42jvlvUz26pSk0sgfgbFgjEoGSBFPGQspZRh
X-Gm-Gg: ASbGncvEqYQEVt6ugcIMZNYX6YeQqlol9djhrm4I7BvvKrF/nix9XISNmCW0wn4VpN6
	eaVWj2IQyRiA5YsTmo8c2DXq2252ry4+2xQiQDLC7GrE7AORtxxnelQz4ZFV1d+qNfjavTqlv+W
	gVyKUzKqs8E2shG7l6q+rits0m6P9jllTyQ06Vsz+I92ubGY2Ko5xSiYz/G9FO/u4RJp1GLnek/
	xWVdDQe2uYvZeLUYwUqB3dnuSXS1IOcZaJQxqTybQZIRe8UEA7btrE2C9C6hzesh4y+9nRaw+AB
	HNKhuS5BAw/G2V4fApNp2WCqps+w19NWhAfQCz/9r4krw8LlslnvtuBkmrQ9dl7exGkHxWzzNig
	zCzgSMNBL0X0w5qmuQ9NR4qDfpsKMvCAGrp0KmczhPUsijIMXJsLdhKH9qBKc057AHdy/T9MlXH
	9U1KG+5Ndct5MXX4XwQ1etNYPUaHBpsj38WpWq0k3mtNU=
X-Google-Smtp-Source: AGHT+IFB60hv1RE3OircPrmEoxXw4juGuBRMwzEnOhEtzOsk4C1SRMe6jrTDznT35eODtKTZtKzQgA==
X-Received: by 2002:a05:6214:4344:b0:87d:f30e:550 with SMTP id 6a1803df08f44-8846e1319d0mr18015466d6.37.1763599642771;
        Wed, 19 Nov 2025 16:47:22 -0800 (PST)
Received: from daniel-desktop3.localnet ([204.48.92.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8846e57321esm6463496d6.42.2025.11.19.16.47.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 16:47:22 -0800 (PST)
From: Daniel Tang <danielzgtg.opensource@gmail.com>
To: Borislav Petkov <bp@alien8.de>
Cc: linux-doc@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 Babu Moger <babu.moger@amd.com>
Subject: [PATCH v2] Documentation/protection-keys: Mark as available on AMD
Date: Wed, 19 Nov 2025 19:47:20 -0500
Message-ID: <2728119.mhk5qWAgFL@daniel-desktop3>
In-Reply-To: <20251119215038.GHaR47rlpLKZlu-m0y@fat_crate.local>
References:
 <3647894.L58v44csPz@daniel-desktop3>
 <20251119215038.GHaR47rlpLKZlu-m0y@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

This is shown on page 78 of AMD document 55898 "Preliminary Processor
Programming Reference (PPR) for AMD Family 19h Model 01h, Revision B1
Processors Volume 1 of 2" for Zen 3.

I tested this on my 5900X via the program in pkeys(7) and
`grep ospke /proc/cpuinfo`.

Signed-off-by: Daniel Tang <danielzgtg.opensource@gmail.com>
---
 Documentation/core-api/protection-keys.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/core-api/protection-keys.rst b/Documentation/core-api/protection-keys.rst
index 7eb7c6023e09..59e7c178af4b 100644
--- a/Documentation/core-api/protection-keys.rst
+++ b/Documentation/core-api/protection-keys.rst
@@ -11,7 +11,7 @@ application changes protection domains.
 Pkeys Userspace (PKU) is a feature which can be found on:
         * Intel server CPUs, Skylake and later
         * Intel client CPUs, Tiger Lake (11th Gen Core) and later
-        * Future AMD CPUs
+        * AMD Zen 3 and later
         * arm64 CPUs implementing the Permission Overlay Extension (FEAT_S1POE)
 
 x86_64
-- 
2.51.0




