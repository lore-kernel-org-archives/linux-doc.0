Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A037AD25
	for <linux-doc@vger.kernel.org>; Tue,  7 May 2024 01:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715045735; cv=none; b=JRlyS1jDBXNtTVWA/EinA+nr14Oj5q4ytfXbplUC60cQFjRAgAJumP3tIuPQK+4cSTKIgFOFQZQOOMpQn2z0nfkg6M3F0aVSNhkDTiCcYsY2nF9v92TtlUlAsl1zt3o1nKauH7ef47VLfXt9ajLXTE84l3NGahlUtUJ4nUXjB4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715045735; c=relaxed/simple;
	bh=cJjey8+N7XA0lWDAjmdyuCkOhS9zN5a0WpUdS4sjd3U=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ZTxN/MJek9nMOOKPkKrUK76PMItI7LWXLleebPkElfXKERp+TMPq9CTIOWVWdCOz8QXn8WX7ygjb1Z5i/c1kWgmsXLYTN8nhwCkqORPPSQgplEDdwcTCn7GgMCqJtuZY4Gv0xLro7sHNiIAdq0lX8pmJ7xrNnaia8aKhKPeaS44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FTP8WTSb; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FTP8WTSb"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-1ec5dc29f95so29052805ad.3
        for <linux-doc@vger.kernel.org>; Mon, 06 May 2024 18:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715045733; x=1715650533; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=FgYO7v0ogCok46mLXJTMv8ZgjJeavmyV/7t/mM5NWqE=;
        b=FTP8WTSb2KGDUAyfU4scl7gd292yTFMR1bnU8d4dqQs+yOMP5/acLynE1iCLoWIwas
         lQqq78xDwH3ZuoJxb6ibwcS5gvedylRhx+F2GQsFAQZbW92lPgxcMJodwwYu6AFJYxHg
         XxgmxNUKhTQmKfta2GYog6vqm/72r8LCUkXlXNAIIeGMM54R2RTVFEuEgfA+v/5zto+z
         4vo69E5lXhmUkpVSoTQrRVgpI/QCLzLOPXJ1w2bPwSjfW8G+sXikXT1r95BbyiqI3rR3
         sPw6tSUW2rn976SOVoPDFxnavSutueiIlmhG2TCUcCQKuhONDmp92Esh+eJbDa2YEHFR
         nLmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715045733; x=1715650533;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FgYO7v0ogCok46mLXJTMv8ZgjJeavmyV/7t/mM5NWqE=;
        b=NzacetGEDwhvXLe+0hJ64GAf5ehr481J6Fhl5SHfRHbA2HjMjCTE/TtH54RpQLtk7d
         5F9Ofk5NBtr9EmBs0qMZvVYvdOLsX9pZpDXanzjtWY2BggLCKBjAB4j+QSA8XPEBxMWT
         ZHxfiJ5HpM7AA4RqVGfalDRNK0CoR5yQLnn4SVd9Mbr4N5Ynfn0Mwep5p+DIpxbcpl8v
         FUIM0DZraSqG8ok1VYCQK/LxjLCQtEG5GmklFFWURm2cRFIQlem4NZRkF50l6IScQAMm
         eC7hqu1fvsz+xPB+urBlcYbE9iHYDVeiPkaKVURKEjAFlyeMZhvSDnjk3Y/a+uNALnMc
         tlJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQNSMcMt7PCEAUlIHmtAxVSyfOPOt/8ep/j8pC9Jhy9g1F910oMEr1fO8Y5SJUn03RG6iWSz+X6njMGwfCqAw3DpG65Myygp+x
X-Gm-Message-State: AOJu0Yyn4KthAakIz3LRlzpVSLym3w5fKqAKFnHVEIDtZ5zww6d+ND4J
	XWO4mBquOtINkp5mIm21ZhuiTjPmembx0x/UrjOxYTl7SJfB4oHT/zIzK0kuyoeY1G1TLOu7fe0
	wKyCQ2qkSdV27/g==
X-Google-Smtp-Source: AGHT+IErfLerZobD9xg1Wmd5+21UToJ9w/LMkvvj/wvhb1Ne0SrUXgnxBdtSvjMYm3uIeFmtL+QqkX9J33f6zCg=
X-Received: from tj-virt.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5683])
 (user=tjmercier job=sendgmr) by 2002:a17:902:da8c:b0:1e3:d6e6:45ab with SMTP
 id j12-20020a170902da8c00b001e3d6e645abmr1078068plx.8.1715045732859; Mon, 06
 May 2024 18:35:32 -0700 (PDT)
Date: Tue,  7 May 2024 01:35:00 +0000
In-Reply-To: <20240507013502.3095744-1-tjmercier@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240507013502.3095744-1-tjmercier@google.com>
X-Mailer: git-send-email 2.45.0.rc1.225.g2a3ae87e7f-goog
Message-ID: <20240507013502.3095744-3-tjmercier@google.com>
Subject: [PATCH v2 3/3] doc: x86/iommu: Update and reorder iommu options
From: "T.J. Mercier" <tjmercier@google.com>
To: tjmercier@google.com, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>
Cc: petr@tesarici.cz, mhklinux@outlook.com, robin.murphy@arm.com, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Several options were missing from the top of the IOMMU section that were
detailed below. Add the missing options and reorder them to match the
order in which they are documented.

Signed-off-by: T.J. Mercier <tjmercier@google.com>
---
 Documentation/arch/x86/x86_64/boot-options.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/arch/x86/x86_64/boot-options.rst b/Documentation/arch/x86/x86_64/boot-options.rst
index 18161657b301..04baefcc1712 100644
--- a/Documentation/arch/x86/x86_64/boot-options.rst
+++ b/Documentation/arch/x86/x86_64/boot-options.rst
@@ -242,9 +242,9 @@ Multiple x86-64 PCI-DMA mapping implementations exist, for example:
 
 ::
 
-  iommu=[<size>][,noagp][,off][,force][,noforce]
-  [,memaper[=<order>]][,merge][,fullflush][,nomerge]
-  [,noaperture]
+  iommu=[off][,noforce][,force][,soft][,<size>]
+  [,allowed][,fullflush][,nofullflush][,memaper[=<order>]]
+  [,merge][,nomerge][,noaperture][,noagp][,panic]
 
 General iommu options:
 
-- 
2.45.0.rc1.225.g2a3ae87e7f-goog

