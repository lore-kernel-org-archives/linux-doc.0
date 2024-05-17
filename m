Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0C613DDB7
	for <linux-doc@vger.kernel.org>; Fri, 17 May 2024 17:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715967495; cv=none; b=pwsgFji0VwLgILKPzMsQrNrBvVPvxqLtmpNgITq9ihlffvNvok/mIcQAxJx/0XHRcYcyvaJkR/mK8u7OsEbTB/lsSL1GZPneDhLwIjVP1iOcCDrKQ8sWns7oulxLEy/rWsPuJ1yzSAuwZEAzefl2MKdF5/DFYOocuqUlK2uTc6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715967495; c=relaxed/simple;
	bh=BY/hZo13CLwFiuLGXW4iBxh7QnHKbF0uMbcvEEfu4u8=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=BwEAlB0sVODNl+E0tvawUtL3xIwDgBc8rMJ+5wpYG0twyIt4bACDMo7G5sN2B/n74rGUEWfETPTz8ZyOJYMnUQLUzuFCGU0h1y+bl+q1F5k8NMsc4b9qHFL9aNHoniJg6UepiZ8Oc/8Ft2UsxwzVbYPxUN+4nr3zIakR5RwTHv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=t5Up0GXK; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="t5Up0GXK"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2b5cb8686c9so8960678a91.2
        for <linux-doc@vger.kernel.org>; Fri, 17 May 2024 10:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715967493; x=1716572293; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jzuhfQ6w0AXMfOQGLEmaZLyI3U2s6W3AD5J7+WG1xGA=;
        b=t5Up0GXKE0nkxk5wqIQ7eWRlUoDpJnS7WQsuU8v11c2jqeSwyWw0nwnYn8AtG6Ipo4
         8EGheSwGmmjQsomo7LptjOv3eMa1qo17l0yQ3+sNlhlAMrJs2JlHGiiFwoysmcBMluhm
         upCotU8d4vWWOFoTpbff6148Ysx721R8EcTcoNQk960SaIKYrOXhypnChp7yl6+uoawS
         PlDGV1lXz+JfB4bZAkPwKLXs5QBhCtxncfL7zfWiph9OGI4ieAzHCTnS9L00zSs4xHyD
         nVIXawrQOxBg8tbbIha4svhF9b7yYCF/Duyk7W1rkbrbghIyXPa9cvsqkhcGFUH2UlTx
         WRag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715967493; x=1716572293;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jzuhfQ6w0AXMfOQGLEmaZLyI3U2s6W3AD5J7+WG1xGA=;
        b=eVOhGMn/SZxXbGlf6vSbn9k/WaSwlegtebRp4w8CbJm5k+MT/dodP+M01PHi7ThDgk
         1F/171u9/ufTR5aJ2gZTn9H5I+8QaRZit0W7XJ6YBEmBromJzNiUzNT0nfpUuQb9jVn0
         rJw7pLhB508sP0sY3vIUfFqMC0DR/buCMpjAFVg+8FBA0Ds1HJ7X8A3jjYWSDg0C9vxY
         9ObcSYNvjEDbQu7HnQOMNio+DRitCr4wBJnkg3kRrWnCeLpZSnOshRghUdajzXGaENIx
         n9wiCjS6wjG7DCNua+Qlt74ac9KANORn42Mn+3JLj/YpewRE3LYfGQegfQY6cdcYsZeW
         1hrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTH/pGeW/ss/Y9fBKrkk4mAFAYJ7E1R/Gbkj74R7x94WTjXpvZhhuDpFvm9scuKhMn+m+QNhGIaI/dOR87DVSomtA1rdmj+GHU
X-Gm-Message-State: AOJu0YyhyJNPgJHWw9a8YL9+/kUbAPXEjuPtIq5O0GpZGAf7dGKk5fvU
	YSTZpeQY40qnbQDzUoOGnI+OI178Napef2Vl9xQKWHKJoh8jVKD4hcB3flsbqWte+T6d5ioFjTH
	jH41CzrKKj7IIoA==
X-Google-Smtp-Source: AGHT+IEcSEnhlabGL3MljAexrvTLovRHSHspelEweE+rv/3eEDJNx1P5eiOiDLgxiAyFBGGJIPp91LWn/mkrckE=
X-Received: from tj-virt.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5683])
 (user=tjmercier job=sendgmr) by 2002:a17:90b:2341:b0:2b9:df61:c002 with SMTP
 id 98e67ed59e1d1-2b9df61c049mr21973a91.3.1715967492100; Fri, 17 May 2024
 10:38:12 -0700 (PDT)
Date: Fri, 17 May 2024 17:38:02 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.45.0.rc1.225.g2a3ae87e7f-goog
Message-ID: <20240517173805.4181349-1-tjmercier@google.com>
Subject: [PATCH v3 1/2] doc: swiotlb: iommu/dma: Clarify swiotlb=force option
 applies only to dma-direct
From: "T.J. Mercier" <tjmercier@google.com>
To: tjmercier@google.com, Jonathan Corbet <corbet@lwn.net>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>
Cc: iommu@lists.linux.dev, isaacmanjarres@google.com, robin.murphy@arm.com, 
	will@kernel.org, joro@8bytes.org, Petr Tesarik <petr@tesarici.cz>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

IOMMU implementations now sometimes bounce memory through SWIOTLB to
achieve cacheline alignment [1], or prevent DMA attacks by untrusted
devices [2]. These uses of SWIOTLB differ conceptually from historical
use which was a solution to the problem of device addressing
limitations that prevent DMA to some portion of system memory
(typically beyond 4 GiB). IOMMUs also solve the problem of device
addressing limitations and therefore eliminate the need for SWIOTLB for
that purpose. However as mentioned, IOMMUs can use SWIOTLB for other
purposes.

The swiotlb=force kernel command line parameter does not impact IOMMU
related use of SWIOTLB, and that is intentional. IOMMUs cannot be forced
to use SWIOTLB for all buffers. Update the documentation for the swiotlb
parameter to clarify that SWIOTLB use can only be forced in scenarios
where an IOMMU is not involved.

[1] https://lore.kernel.org/all/20230612153201.554742-16-catalin.marinas@arm.com
[2] https://lore.kernel.org/all/20190906061452.30791-1-baolu.lu@linux.intel.com/
Signed-off-by: T.J. Mercier <tjmercier@google.com>
Reviewed-by: Petr Tesarik <petr@tesarici.cz>
---
 Documentation/admin-guide/kernel-parameters.txt | 1 +
 Documentation/arch/x86/x86_64/boot-options.rst  | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 213d0719e2b7..84c582ac246c 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -6486,6 +6486,7 @@
 				 to a power of 2.
 			force -- force using of bounce buffers even if they
 			         wouldn't be automatically used by the kernel
+			         where a hardware IOMMU is not involved
 			noforce -- Never use bounce buffers (for debugging)
 
 	switches=	[HW,M68k,EARLY]
diff --git a/Documentation/arch/x86/x86_64/boot-options.rst b/Documentation/arch/x86/x86_64/boot-options.rst
index 137432d34109..a37139d1752f 100644
--- a/Documentation/arch/x86/x86_64/boot-options.rst
+++ b/Documentation/arch/x86/x86_64/boot-options.rst
@@ -292,6 +292,9 @@ implementation:
         Prereserve that many 2K slots for the software IO bounce buffering.
       force
         Force all IO through the software TLB.
+        Hardware IOMMU implementations can use SWIOTLB bounce buffering in
+        some circumstances, but they cannot be forced to always use them, so
+        this option only has an effect when no hardware IOMMU is involved.
       noforce
         Do not initialize the software TLB.
 
-- 
2.45.0.rc1.225.g2a3ae87e7f-goog

