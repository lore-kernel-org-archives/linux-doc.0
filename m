Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B1713E02C
	for <linux-doc@vger.kernel.org>; Fri, 17 May 2024 17:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715967508; cv=none; b=jUAnMIp99ZEbZhqBGppP/JCXcR4bDITHD2nEYtZU99sXqglc25Yq4MBiUJkX1msTnALxhE8RevHaaorLmKVm/z/1Dn2pImGyv6J6ZBLf3kIvAYcGc/MOcqHC6DJiKnxe7XvVigtcLs8RDYm16/ybLHQpwtAZB0Uh01JpPAaPlFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715967508; c=relaxed/simple;
	bh=tFp0I1ixSIGjk0J3hzcghmx70zj6H8iFP/ZPi1pOWcY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=iZ/rYVbmEF+bjqCMhBXGjyaNTJcNe5GqZjM14kHfOPWgDrN2KSBXswIsqFCsmJXi+ruiO7Nd4Ndxr/Q5nTiCFhYpmZpM2wD+qkzcbwE2a7kPPlkARY3RQwxGYPLKn4NG7CFl42VjqpGvqMLciu6S944c1ZtQ+qSA9EoSRue3sis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nbX6VGzu; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nbX6VGzu"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-1ee3b4f8165so92217495ad.3
        for <linux-doc@vger.kernel.org>; Fri, 17 May 2024 10:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715967506; x=1716572306; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=v49Dj+gbnQvzNsVpnYNnWqEQpkDjTigYZ0uaaGS+wzY=;
        b=nbX6VGzu6M7fLXpPTMD/z0uB1Rt1XV2ptbiy3vMU6d4qcD04I96ZiA1nUsWWDl2JNy
         inEineAtgSc1IwwMxpKaJLYHRnWe/9agdqrr1ENq8xj9jssFhAseDIejwSStLtS7tHbz
         Fpwo+0cnFVLisWqfJ29m1afBWM/SEcSybBBPBc5UlvPJou02UamqPXoIfTcC4iwJRWya
         Vz25ydgAMMZAJtpZNk8CkbmVt+otldkxOWvBrhQ5N41upHbRpUaKJ4t598YStCP+iBxL
         NjjbfTH5d3eeiX8H6Rgm+wIfATRLZMdIJKmQPVenzUR+uptwi1Jsb/SlVBL3CjogPFmd
         FXKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715967506; x=1716572306;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v49Dj+gbnQvzNsVpnYNnWqEQpkDjTigYZ0uaaGS+wzY=;
        b=DOJp19MQdhzD3sEkgXVvF0ze5o2LvnjglKGyKgWuMNEVvZKEv53bePa4+E6giv/eUZ
         mFrJGroYf5TE2Vq7byDu/jb3Mf8Vc570GsmeSzfy555DuucaInWow2yAlphinPapS58H
         +G0cutkYVQXmaunlTWQugycaA1qrID1inBHhDPUa1llYxHCJRoMmmu5pB0yj17RucH3F
         vLd+TsGrVF5HIDXPNrgpFpJ0yaQOj+6H1NkF+Jyz/QNCI1qAEt1GypZSfqKrSMkWFlnz
         uYTV4Guy/01TxnS7ytrwGXB+kIkfpCYnzKoml+nr35CdG5DMEeRmjz0meACHO2S3saxG
         NUhA==
X-Forwarded-Encrypted: i=1; AJvYcCWWEhG7uQDzJkUMAt0NMm/4Ba6JVVLauFA4vnisiCVBos2+hY7t7iJB3HX0fj4XnZVrqN9g/ofvutIrh8oOt3298Uu16bVuA8sA
X-Gm-Message-State: AOJu0Yz86x0tdg76m3AZ4VJAu1ev9knYS2BNYinFDef34yht35/1WBJj
	uQTqspcsNyZwJRUyPyNug45Qlv3GkrKedUi+c+BtGOK56p/dTGK4jf2BNbLSUN2Fq+n/81PRsxu
	+yGrD6FWrJt+cig==
X-Google-Smtp-Source: AGHT+IHLSmcva4cfRRDrPAJHTSjD69JJ2b8EEkFLyON9XgY9LsefdYupK0M6dExJhHVXVKpOWInCESsGLA3vy1s=
X-Received: from tj-virt.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5683])
 (user=tjmercier job=sendgmr) by 2002:a17:903:110d:b0:1ea:26bd:fd95 with SMTP
 id d9443c01a7336-1ef43f52f23mr5637345ad.11.1715967505898; Fri, 17 May 2024
 10:38:25 -0700 (PDT)
Date: Fri, 17 May 2024 17:38:03 +0000
In-Reply-To: <20240517173805.4181349-1-tjmercier@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240517173805.4181349-1-tjmercier@google.com>
X-Mailer: git-send-email 2.45.0.rc1.225.g2a3ae87e7f-goog
Message-ID: <20240517173805.4181349-2-tjmercier@google.com>
Subject: [PATCH v3 2/2] doc: swiotlb: Document SWIOTLB areas parameter
From: "T.J. Mercier" <tjmercier@google.com>
To: tjmercier@google.com, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>, Tianyu Lan <Tianyu.Lan@microsoft.com>
Cc: iommu@lists.linux.dev, isaacmanjarres@google.com, robin.murphy@arm.com, 
	will@kernel.org, joro@8bytes.org, Michael Kelley <mhklinux@outlook.com>, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Commit 20347fca71a3 ("swiotlb: split up the global swiotlb lock") added
the ability to specify the number of SWIOTLB areas, but boot-options.rst
was not updated as part of that commit. Also adjust the swiotlb option
syntax to clarify that force and noforce are mutually exclusive.

Reported-by: Michael Kelley <mhklinux@outlook.com>
Fixes: 20347fca71a3 ("swiotlb: split up the global swiotlb lock")
Signed-off-by: T.J. Mercier <tjmercier@google.com>
---
 Documentation/arch/x86/x86_64/boot-options.rst | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/arch/x86/x86_64/boot-options.rst b/Documentation/arch/x86/x86_64/boot-options.rst
index a37139d1752f..d54e636f91f7 100644
--- a/Documentation/arch/x86/x86_64/boot-options.rst
+++ b/Documentation/arch/x86/x86_64/boot-options.rst
@@ -287,9 +287,11 @@ iommu options only relevant to the AMD GART hardware IOMMU:
 iommu options only relevant to the software bounce buffering (SWIOTLB) IOMMU
 implementation:
 
-    swiotlb=<slots>[,force,noforce]
+    swiotlb=[<slots>][,<areas>][, [force] | [noforce] ]
       <slots>
         Prereserve that many 2K slots for the software IO bounce buffering.
+      <areas>
+        Number of SWIOTLB areas with their own lock. Must be a power of 2.
       force
         Force all IO through the software TLB.
         Hardware IOMMU implementations can use SWIOTLB bounce buffering in
-- 
2.45.0.rc1.225.g2a3ae87e7f-goog

