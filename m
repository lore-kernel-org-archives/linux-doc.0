Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5951272803
	for <linux-doc@vger.kernel.org>; Sat,  5 Sep 2026 19:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788636580; cv=none; b=C6Fbt81HI/vIclI/A4yos+KLzaKsrWlKlV5FIRhtfyaCwVBrHAXjk/nehvJLvmKlPDCFl4v2z2oyC1aN/ONXAKh9ySN8kqRFWok88zVG2tlrpVXif2l2xDGM47ZGsyyIagOlcN4CEpMa+bWAA0MYBm3Gl2BTL8kQNGFM1rUS67M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788636580; c=relaxed/simple;
	bh=ofbcNdKdX8uKfubBk8IcA8XBshBPL7jLcyqQ7jTP1nk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hq/owzsustHohlzKCTBOe2zb66fLY5KTHrxgdrBQw/rC3fW/akk5xrQmYUKcIm6xXVFN2OuDPE8OJo1lsFV8NACMXZV/jMRxvcSYfNZmQQsFbZm5f0rXURlaT8EIoRV7LJyis7rl5jZni4HnqvsRudPoZMu63LE0SEwaqLUoJkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=afSu4coJ; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="afSu4coJ"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-86b03b75fecso35131147b3.0
        for <linux-doc@vger.kernel.org>; Sat, 05 Sep 2026 12:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788636575; x=1789241375; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7w+lmyyiQCKlIYYGhcG8AgW8vI6XCeGVdU/tQ/rIM9k=;
        b=afSu4coJWttPg+LU2Rwv28BsRwtgM99tIL16m5Qhc7YkMtY4Z9Tx4+9qlEETiIlHX0
         V12wZBAr3KV8PbFjGJgMGODfHtrIM4qbUycqH27XuTruyE3IMTd0sMWQqfeha0Qw/mkz
         we4r2qqlIsXkPuv2GCHopBTt8MdeX17c9G3lAZZ8/l3JdJkxwzln1gVy7F5oUIVchs2U
         m9cY82VsILQvaCvfjuB0qJ6FizArxicyMj8mMyELl4fIAZxNWHoWVeqXa6GO7xKGypNL
         qdcMXgMowr+oO01GO0P7TeAvoLmjNzZNV4DI1VJcaZa8loBAIj9X5DozudfhHgm2B+u1
         oHkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788636575; x=1789241375;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7w+lmyyiQCKlIYYGhcG8AgW8vI6XCeGVdU/tQ/rIM9k=;
        b=izO1pKt191JgQ5BaSnnipvn4IxOcugPRZV022qPL5jnJLz0a2E+1mO5W4reL05tpuw
         Dh9SfR5gpuNhMUACF7x6mubiv5H+2E8ALIOMu03hP20JkbaCGNx/Tr/FGEE+hvrKdSq1
         9a37RX+iMX53/ia2HgcxsDSDiKM8y+eUKTrj0wrxFl8VOkWuaahjk2AIOpG0KQtscxU0
         xnCwNAmJNPMVCn/C/2XhaPteSzgzeZPS6KvUTI1Ja5kG15ZwnPgFdEP6Y2WeObFvrxE0
         04fgidnQRadbELh4Ef9VV4kRgIboZthQcru3WLdfg4MFeDOnfCC4hxHO9LYH+YmHCbJt
         6ybw==
X-Forwarded-Encrypted: i=1; AKwUvBwcni/4gnJsGaeZu8htd3qrNiNah+DDKw6bNghGuU02GqiXX56VCFwpVukXFw8JQxFsX9fD/qxEasY=@vger.kernel.org
X-Gm-Message-State: AFuF++nyVQR+Iu/QsaUUivkUeaF16kcQrMycqexPrhWN8t/feg9pFrpt
	hkB1pLg7SVzpeeojleDFPi1DwvnyCbsEPB9mB/QzKWUN1Rq5AtBgTWDb
X-Gm-Gg: AYBFou2mLZCbRdbGFant4k0oqfJnM+TF8JyrX2XT5nhTG0HFt8RritNX9IjkqXZQoQK
	8D7HltxO4h6baoPhOfwvp2sNREox1/u8mCWtUHVcI6n4oTKhkjH71knBIugXtAVBd5KOGoxYBsk
	uGoKN/UgHxw0ERmeMWgPT338KMcDUvWmHqcFOIMNHAfSGLyOgl1bPgvBySO/WUAQU/ytJAZTw10
	0O+WQYo0uQL6esbbDnl428CukON6Pey9loglaC7ZX0dmdQ0Yf3pv4xGbAVsyH41qesWrEXhM/xo
	R+9ATGoxLy7oM0Co4aM/MeS71ZeiI84jTylZeqFYNDOmf0etaX+xzMO4z8jN6OIsXZhZ2/5FAvE
	tKL8h4CKFyxBu9IE96nrL0wZ8ODnl+TbF2zO6fPRjIt4x/LOOwQCLzuOHMl0KzgqKKB1xqvD+EV
	UYFMF+v7Pb8VRtvWHqB0IVprY+9idG1+ukYSzkRO/2LmjiFW5nxURKTGoIy5vQ
X-Received: by 2002:a05:690c:6e90:b0:869:718b:ea10 with SMTP id 00721157ae682-87125efa162mr62967287b3.16.1788636574996;
        Sat, 05 Sep 2026 12:29:34 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8714bef8930sm43411967b3.46.2026.09.05.12.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 12:29:33 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Date: Sat, 05 Sep 2026 15:29:25 -0400
Subject: [PATCH v2 04/22] alpha: select HAVE_DEBUG_KMEMLEAK
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260905-arch-kconfig-options-v2-v2-4-83e8245761a2@gmail.com>
References: <20260905-arch-kconfig-options-v2-v2-0-83e8245761a2@gmail.com>
In-Reply-To: <20260905-arch-kconfig-options-v2-v2-0-83e8245761a2@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Kees Cook <kees@kernel.org>, 
 Marco Elver <elver@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
 Andrey Ryabinin <ryabinin.a.a@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kasan-dev@googlegroups.com, linux-hardening@vger.kernel.org, 
 linux-doc@vger.kernel.org, Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1580; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=ofbcNdKdX8uKfubBk8IcA8XBshBPL7jLcyqQ7jTP1nk=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLLm5E5e4uq8wMo/6H7fqrxf38yFeP6f/5oop3CrYfUMw
 VnTy+9d6vjIwiDGxTBTTJElbr0iy6y2HUt9Tkv/gpnDygQyRFqkgQEIWBj4chPzSo10jPRMtQ31
 DIEMHaN4iJweg0ZmcXFpapFuWkGRQ15+SWJJZn5esV5+QWpeQXqBXlpmWklGRn5RcSrQCL281BJ
 TV0c3I0MDE0tHCzMnC0dTE2dnJ0MnN0dHZ1cnI0tzEwNnS0cTV0tzBi5OAZhrnL4wMnzuC/ul8l
 ZceveOdI6XnQGbdDN/TGF6Xv3szLMTzQUckz0ZGV4KuzFdkj/SM6uJ1zu2+M+0pm1vbBZ7V+n06
 nGvVgt+ygMA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

Kmemleak needs no architecture support beyond the standard linker script
symbols for the data and bss sections, which Alpha already provides, and
a scan of the kernel stacks, which is done generically.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Matt Turner <mattst88@gmail.com>

Also mark Alpha as "ok" in the kmemleak feature matrix.
Tested-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
---
 Documentation/features/debug/kmemleak/arch-support.txt | 2 +-
 arch/alpha/Kconfig                                     | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/features/debug/kmemleak/arch-support.txt b/Documentation/features/debug/kmemleak/arch-support.txt
index f45149cfa313..b65b3f8c0e89 100644
--- a/Documentation/features/debug/kmemleak/arch-support.txt
+++ b/Documentation/features/debug/kmemleak/arch-support.txt
@@ -6,7 +6,7 @@
     -----------------------
     |         arch |status|
     -----------------------
-    |       alpha: | TODO |
+    |       alpha: |  ok  |
     |         arc: |  ok  |
     |         arm: |  ok  |
     |       arm64: |  ok  |
diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
index c4da16971652..f6d1d2469677 100644
--- a/arch/alpha/Kconfig
+++ b/arch/alpha/Kconfig
@@ -19,6 +19,7 @@ config ALPHA
 	select PCI_DOMAINS if PCI
 	select PCI_SYSCALL if PCI
 	select HAVE_ASM_MODVERSIONS
+	select HAVE_DEBUG_KMEMLEAK
 	select HAVE_PAGE_SIZE_8KB
 	select HAVE_PCSPKR_PLATFORM
 	select HAVE_PERF_EVENTS

-- 
2.54.0

