Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F031F4724
	for <linux-doc@vger.kernel.org>; Thu, 24 Oct 2024 16:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729785990; cv=none; b=WXxrrZ5rCI7GDFnK+LigasYyMmNGvXGM5A101TmJ3ot8f+PHTE41h0LjrItjIB2TZa8x9yExgStrjO20QTMx5hXHi+Nga/rRgaSYHq+uIHosvOHSCCYuvjDJZ2EXfQZGCuj1WssbLa8gTXSq8HAgOUTX9dhD8g0MjGuFJkLwnHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729785990; c=relaxed/simple;
	bh=WAvb8deVOd/vKnE5XvJDA/BfDiTCU+46fRIbfkvknyY=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=iCPQpTLJwSz76cix4B9pxkzN/6HxU9wNOql3u8AlPvXIVF5O588ewJjUXMdP1qsJ8AjnTViwtHFD0+aDI5lCSucYv7ct3tDGijN78kU59xwkPbdCE7y2oHRojD4BBX9XCDtVRUv/Ll+xccfDz3oVxt5ofVE4uYnSkkEIOGe9ZuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QtPEr96e; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QtPEr96e"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e28fc60660dso1850126276.0
        for <linux-doc@vger.kernel.org>; Thu, 24 Oct 2024 09:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729785987; x=1730390787; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8Vlh+OWPEJjqhnR1Dpqe4iO+ZlrNapO4KnJxZYyLlWk=;
        b=QtPEr96eESVyIfCMbLKVlQvlRXGJ8Cqsik6dxeNVdi0Mt2xJCh/sFjIvI9O4md6uRm
         +NqB6F136EbU7VhYQz/rajJelyxyfe1qPWQgRAe+uU4NLP+KjPDajsT92acWryTxOUUh
         t4+U5jvBoTTiaZRYHxI9ylrqYJJmS1Ub9MF3bIFgGt8B/hBakiVK17S5MKzHlkMiF49C
         0Mg5Uveui0TO7kChpKcrUanvU/Kgh3v2UZTabA5JMfLIYBLdOV7as5To/HT7ToXZBb7/
         WBRVRwP9Y7hTY3K2CMwyH7R/kWaJzsqhnc58ngZpX1cduQQI9RxAbi+CXqfjWQwRqk5J
         7JSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729785987; x=1730390787;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8Vlh+OWPEJjqhnR1Dpqe4iO+ZlrNapO4KnJxZYyLlWk=;
        b=ZtCKGelOSvPPLKaOZyCYn+x4RavWUHIaRbFP6gI1LMpRIKIe+oftKFbwl536hh6PNz
         UywOtbgAz6VlD7MHsoph/AOwZ1DfMBtvt7ixiY9eI0b1+PhxEln/KnAKb9WJjXkm8SfA
         EgqXpCmMr6+2mAHCm4bdE/7fuAgz10wefP1QldWTVsNXypdPrdCedXjdmLgdbj5R62uY
         Tzu816d0Gj/Y1VVvC9icR6zH6EIsS7IVnLMYOUPC+wdgBKx/r9CBVbgceQrjruQeVYgf
         pHnwU5MnP3YAdaOpAec5NIG+x/0VfWX8hhyVR/14BZP3r3kme4sWVDbT5mJVmmiiWSnm
         91Mg==
X-Forwarded-Encrypted: i=1; AJvYcCWc4gr5DGwQzcZqesacM3FeFahrVO2o6eeD67TNAvr1eKiMG2rLs/PU286denRK2CWivzItiHUbX2I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzr/Iwpc5nKYspszT8YR8AzN7CPbpUB6LltiL5XFxT/ILxyGp+O
	SHkYLboTVTiinOnSzNuMGX1MceeQXzWz7kilKe5Q/ZA71cPPksgnNjFE/kXRFN6Xbh3oDpRxD2K
	2OeVFCdgwwQ==
X-Google-Smtp-Source: AGHT+IGaTNB2cxvpZfiLTZ3lOLyBwhFAf/NyceFQfu/ZPNy7VLbkaYQkYEfTc8o/kTdRiS7SjTcDccubMooCLA==
X-Received: from mostafa.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a25:b113:0:b0:e2b:ce2f:787a with SMTP id
 3f1490d57ef6-e2f2302ed44mr7753276.3.1729785987546; Thu, 24 Oct 2024 09:06:27
 -0700 (PDT)
Date: Thu, 24 Oct 2024 16:06:14 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.105.g07ac214952-goog
Message-ID: <20241024160614.1894599-1-smostafa@google.com>
Subject: [PATCH v2] Documentation: Update the behaviour of "kvm-arm.mode"
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Cc: corbet@lwn.net, Mostafa Saleh <smostafa@google.com>, Will Deacon <will@kernel.org>, 
	Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Commit 5053c3f0519c ("KVM: arm64: Use hVHE in pKVM by default on CPUs with
VHE support") modified the behaviour of "kvm-arm.mode=protected" without
the updating the kernel parameters doc.

Update it to match the current implementation.

Also, update required architecture version for nested virtualization as
suggested by Marc.

Cc: Will Deacon <will@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>

Signed-off-by: Mostafa Saleh <smostafa@google.com>

---
v2: Update nested value also
---
 Documentation/admin-guide/kernel-parameters.txt | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 1518343bbe22..d5b771e5cb5b 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -2740,12 +2740,16 @@
 			nvhe: Standard nVHE-based mode, without support for
 			      protected guests.
 
-			protected: nVHE-based mode with support for guests whose
+			protected: hVHE-based mode with support for guests whose
 				   state is kept private from the host.
+				   In case hVHE is not supported in hardware, it will
+				   boot with protected nVHE.
+				   nVHE protected mode can still be forced on VHE systems
+				   using "kvm_arm.mode=protected arm64_sw.hvhe=0 id_aa64mmfr1.vh=0"
 
 			nested: VHE-based mode with support for nested
-				virtualization. Requires at least ARMv8.3
-				hardware.
+				virtualization. Requires at least ARMv8.4
+				hardware (with FEAT_NV2).
 
 			Defaults to VHE/nVHE based on hardware support. Setting
 			mode to "protected" will disable kexec and hibernation
-- 
2.47.0.105.g07ac214952-goog

