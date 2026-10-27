Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793096531;
	b=SkGPF9nOoJIc1uwfrQqdwYTxbJ93vqktxPUpolQTsH8MQvzBFg9vxCDmSJNoHB73uGt9
	 2n1zT+DgUyOyHxEVhm1SSsLALq6v6Q6wodUDm1oy83WvqibutIRx9JRdwxvjyV7iDL5IA
	 WaFy12MoQMjF8ajwQuN+QCE7mWETOOG+DrVru5eWuF6W/TU6kTktMPhVNZYbXUWhd1m1U
	 u2kj1GP/1b28nOLSKPO+/C5/KUU/Ftl3Kp2FtuKtEMKFNLfmBJ0vy2IIdYK4LmMXzEM1N
	 CsKRs9BMwc2j8CF7hiMA7iu/2CsZk7Hd0RJLhBTBAHtlrTi0Hn7D/OBdc/kkaBbKEHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793096531;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ge078T0DtaLiZWNT5bLU3DLHT4pO3L+EYj4yHn5ihEg=;
	b=rkPej4AANizK/HAtZfWZpjAt5tY1nuITCvSQh78XrnT7EIwCq7ZHZE4nhZuXvk5DPp//
	 LuWRTV5RVdz2ij1d6mxDMB3n6f0ue9PXdX1J6Km3ot5gENStBpAYLLPiuvEkAIcvCG8hP
	 8rXock4nj94grNdhRzllUFS25CLNJeeKAzO7XTaVbgar2wEd4Lyd1aV9QqQCRZ2IDdZuo
	 ranz7pf0WsktMTYyHm6UPA9jbvWmL3SW/qMe+plFtanWE3ItSvxpaYKCN7OrZNSLg06Pd
	 aIT3oeJZVOx+U0R1hjcoZJg+nWWjCILnsgguL46XwKaWdPAZoe9K3oCvfLQcSBYKjGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=erSoX3zw;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A983606A31B
	for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 10:22:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A983606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=erSoX3zw
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso25407065e9.0
        for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 03:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793096530; x=1793701330; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ge078T0DtaLiZWNT5bLU3DLHT4pO3L+EYj4yHn5ihEg=;
        b=erSoX3zwALMCotrPkSfTAPYcbeGcjBzTjY88cf/CT7tXDWtn3DAZ9jB2ipjfYYmdKq
         +zc6LQ3NBb6ruUNPf7dTbBInPyJuqn/8TlhhvwloPMjHkMJ/n6sS2zSYM/KXqkSS2d2T
         W9wEE7wmXOTwCqDqU3OfV1R/tKugwzBIIxCCBe2HbDxENBgB7FWNuduw7KDgn1jyCWXX
         ksOahbwItmCgb+ws9uKPeiRmOuAiagY2gYm7YWBdx3BURZKp1pkNgM6b4Yd9ITYGPo2o
         80a9pLC0pt0RtJa7iX8MDphFT9vxcfOWWIyHzrkzIzr+f10PoU0aTYRTgWnT/N91HdI4
         m8IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793096530; x=1793701330;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ge078T0DtaLiZWNT5bLU3DLHT4pO3L+EYj4yHn5ihEg=;
        b=tbvcKPLgAmZIyKj/9BrKDg57w0ZMGgbYn2aPKdjv5sep3hDqdVkIGg7Sx70w58yvfa
         jGuLDxgQj/gNKe/MxNW39/h0b/OmIzKWc4dFyDVGCf8uYsYgFai6mT9NgDJeVGFD0fcr
         gtZnet1hl7E3YRwBib9t0B6FcT/ybIzsjy/sr8rkzYAbfdtXhBhzQWklchKyCTaHMy+e
         5792vhU0Hvl+2SqqsoePk7SdGgxX8buN7z+m4XUe+koozGYQVNaDjhWmNEsewvQ88Vf7
         SdekXNQZsBtdZsUqpsCXIRJlnJwBHDML4/x5Byi9R116RaRIh/e7AlqrUUxPYqGyjCGp
         UxJQ==
X-Forwarded-Encrypted: i=1; AKwUvBzT6i0UEk/4JAQLK9xbGTFnJvEX4+FHLgFGNbTOPuypj4d42dXJyl8anSSCeKinBU3LR/44Tf0WIUM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKmzypPscnPhPxQIsAy5xC87wZdwZfnghoIgf5Pa78ZR60DGbk6
	TY33hejQaXp8ZJgOj13iFQFpmGnfVAxU0heGD51CyAr8ma33Dm/AKPtA
X-Gm-Gg: AYBFou1eLspvnWZnkEcNvKmyzkg9hE7penMBePSachNW5C0AdORG1OOhxTLRyhHXKOz
	HGTeFJB3l/09R0Iqfy4M0aNQJE39ivdPaKNtPsN8fguXTHiwC9jk75oPsXLi7vHDWww36eAGhuD
	1iPViUX9Q6IQ4xP9aMRrmvgVA1WwveTYbtQ8IiUDZhQ5nswAzu0JWzQVQtbCJiIRQbIxlAP62T5
	koUaBahrPrml3MgmBc+b1iCWsktC4TmabM5P/xGBbtkmCwXkSW0/905hMVwBKTg9xT0Bte/4C1D
	OabuXfBXHESdQw4UWcon+qs0D2pQujEYKW3GPRhg94xiNS8KR6qukJ+7eZCV1bxfSMevcGmBc0D
	MKF+NrePEZgw1O9zKq5uQEq+WLW/dNMPsbSR25odrYeoCphxNwBYsWp/aToCcLvsAIej+frvUPO
	xFi9njndG9YIZesFzsnZOlkqA8nDVsh8+wNskvpRh6RotiG0dbjl2vNfcaXQhHf1G7SMAJ0v44G
	US60qvdrbi/nbsamMbOmZWEhBRpJD5UiH25DmmsZmDi9F0q15ep6RmF0JKVj9a3/cf1sJWQ2Ben
	bUkUpl0J6ZdFAMm8zRQvX9+Vj9k3cvjNswRfZK+NTrg5ZgOQnjaTCUPT6Cam5RlF22JLSyaTEvs
	o0Huw2SntabSskVYcYO9nqtJkQhWD/YdC9EwByzqY72sN854r6Q==
X-Received: by 2002:a05:600c:8b66:b0:4a2:a8c:22b0 with SMTP id 5b1f17b1804b1-4a35ac3b3d9mr171645435e9.1.1793096529293;
        Tue, 27 Oct 2026 03:22:09 -0700 (PDT)
Received: from cachyos (252.pool90-68-203.dynamic.orange.es. [90.68.203.252])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a359fc1207sm200217495e9.1.2026.10.27.03.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 03:22:08 -0700 (PDT)
From: f1rul4yx <vargasgomezderequenadiego@gmail.com>
To: corbet@lwn.net
Cc: skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	f1rul4yx <vargasgomezderequenadiego@gmail.com>
Subject: [PATCH] Documentation: make admin guide version-neutral
Date: Tue, 27 Oct 2026 11:22:02 +0100
Message-ID: <20261027102202.28218-1-vargasgomezderequenadiego@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace references to the 6.x series with version-neutral wording.
Clarify that normal stable patches apply to the base release and that
incremental stable patches are also available.

This change was prepared with AI assistance (OpenCode), which helped
identify the outdated references and draft replacement text. The
htmldocs build could not complete because Sphinx and documentation
dependencies are missing; checkpatch.pl and git diff --check pass.

Signed-off-by: f1rul4yx <vargasgomezderequenadiego@gmail.com>
---
 Documentation/admin-guide/README.rst | 41 ++++++++++++++--------------
 1 file changed, 20 insertions(+), 21 deletions(-)

diff --git a/Documentation/admin-guide/README.rst b/Documentation/admin-guide/README.rst
index 77fec1de6dc8..17c533fb0bba 100644
--- a/Documentation/admin-guide/README.rst
+++ b/Documentation/admin-guide/README.rst
@@ -1,9 +1,9 @@
 .. _readme:
 
-Linux kernel release 6.x <http://kernel.org/>
-=============================================
+Linux kernel release <http://kernel.org/>
+========================================
 
-These are the release notes for Linux version 6.  Read them carefully,
+These are the release notes for Linux.  Read them carefully,
 as they tell you what this is all about, explain how to install the
 kernel, and what to do if something goes wrong.
 
@@ -63,35 +63,34 @@ Installing the kernel source
    directory where you have permissions (e.g. your home directory) and
    unpack it::
 
-     xz -cd linux-6.x.tar.xz | tar xvf -
+     xz -cd linux-X.Y.tar.xz | tar xvf -
 
-   Replace "X" with the version number of the latest kernel.
+   Replace "X.Y" with the version number of the latest kernel.
 
    Do NOT use the /usr/src/linux area! This area has a (usually
    incomplete) set of kernel headers that are used by the library header
    files.  They should match the library, and not get messed up by
    whatever the kernel-du-jour happens to be.
 
- - You can also upgrade between 6.x releases by patching.  Patches are
+ - You can also upgrade between kernel releases by patching.  Patches are
    distributed in the xz format.  To install by patching, get all the
    newer patch files, enter the top level directory of the kernel source
-   (linux-6.x) and execute::
+   (linux-X.Y) and execute::
 
-     xz -cd ../patch-6.x.xz | patch -p1
+     xz -cd ../patch-X.Y.xz | patch -p1
 
-   Replace "x" for all versions bigger than the version "x" of your current
-   source tree, **in_order**, and you should be ok.  You may want to remove
-   the backup files (some-file-name~ or some-file-name.orig), and make sure
+   Repeat this command for each release newer than your current source tree,
+   in order.  You may want to remove the backup files (some-file-name~ or
+   some-file-name.orig), and make sure
    that there are no failed patches (some-file-name# or some-file-name.rej).
    If there are, either you or I have made a mistake.
 
-   Unlike patches for the 6.x kernels, patches for the 6.x.y kernels
-   (also known as the -stable kernels) are not incremental but instead apply
-   directly to the base 6.x kernel.  For example, if your base kernel is 6.0
-   and you want to apply the 6.0.3 patch, you must not first apply the 6.0.1
-   and 6.0.2 patches. Similarly, if you are running kernel version 6.0.2 and
-   want to jump to 6.0.3, you must first reverse the 6.0.2 patch (that is,
-   patch -R) **before** applying the 6.0.3 patch. You can read more on this in
+   Unlike mainline release patches, normal patches for stable releases are
+   not incremental: they apply to the base release, not the previous stable
+   release.  For example, the normal X.Y.3 patch applies to the base X.Y
+   kernel, not X.Y.2.  To update a source tree from X.Y.2 to X.Y.3, first
+   reverse the X.Y.2 patch (that is, patch -R) **before** applying the X.Y.3
+   patch.  Incremental stable patches are also available; see
    :ref:`Documentation/process/applying-patches.rst <applying_patches>`.
 
    Alternatively, the script patch-kernel can be used to automate this
@@ -114,7 +113,7 @@ Installing the kernel source
 Software requirements
 ---------------------
 
-   Compiling and running the 6.x kernels requires up-to-date
+   Compiling and running the Linux kernel requires up-to-date
    versions of various software packages.  Consult
    :ref:`Documentation/process/changes.rst <changes>` for the minimum version numbers
    required and how to get updates for these packages.  Beware that using
@@ -132,12 +131,12 @@ Build directory for the kernel
    place for the output files (including .config).
    Example::
 
-     kernel source code: /usr/src/linux-6.x
+     kernel source code: /usr/src/linux-X.Y
      build directory:    /home/name/build/kernel
 
    To configure and build the kernel, use::
 
-     cd /usr/src/linux-6.x
+     cd /usr/src/linux-X.Y
      make O=/home/name/build/kernel menuconfig
      make O=/home/name/build/kernel
      sudo make O=/home/name/build/kernel modules_install install

base-commit: d135ab453a7400a34930bdda1ef4bdc8acfac80e
-- 
2.56.0

