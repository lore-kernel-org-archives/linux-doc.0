Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793139835;
	b=5gc6LHsrdFico1vBd6HxGUIOE+YjgBNCsacEIDCtBtscxIJYJD/GBXCrcAjFUlwKcVlN
	 L3Xq+zP+x3wqiyB7ExiWjYOsbCy7BZRy//I7UiM90ugGbXJnuNMuhpEP3F9DYLpwyZiVD
	 Cy9Y8fYK+I1gRD7by+gp4xDyEWpQl27CzQjdoNYGjkUsCsJjsfOvFzeLc3C04NDJf3yv1
	 vuq+K7nv0oQSb8krF8RiYv5dIblw3UZm5qGvGIC/RF0uSMxdoMp9E0R6+zTQTCw0cTfNX
	 WI5fH1504BndqFD8nbjQ2LbePt4/2P+14HMBNKyjfU03dp7Mu2cen2PRfOVhQCad9rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793139835;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=i2QjVlI3Q/9QvBglZ67tlTP9YtDMbvPwzMrhEB98kgY=;
	b=vJ99V9NlooTjSYF6DWi8YBrwwOYgP9aqYXTB+QVf8ptBi4t6LEgIneC3C9pPbApeAeGH
	 KDBPJqnQtua6ugYZ8m+6tyKSBeX63rEHFkDV/tS9MvzFTtjfT/yfIPDmZNnomfXP2wBod
	 BKO5bcrgRi+nra/asY3MfeBT9Fk90MQOWton/4FlFLcostbDhbqodzW9stZipsvJ2JHh1
	 DHiMcoJ2oLMlrNOdXprAcVP1f3FRrMDMwYqUvGIxdd8NsEkpIdDVouRLMoBHcSweUmU2r
	 CQY75Q1u0srVnRYj0vOL7JtEPKIgAprZ6Lvcro4zRWwqF6NkOsLTa987FvV+WX2Kwmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aB9SWrTt;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17AD3606A31A
	for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 22:23:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17AD3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aB9SWrTt
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so2643455e9.0
        for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 15:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793139833; x=1793744633; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i2QjVlI3Q/9QvBglZ67tlTP9YtDMbvPwzMrhEB98kgY=;
        b=aB9SWrTtO4HUjZI3LxLtnQK19NMjm843cewTgF3gqn+rPxuYm6g4SFaH1JEB4BbIaV
         rlNVx/5Xq2OmhBYP3i3386iFr+1VcNhviuA8Pb2xKs56vpu5+h0sm1sjtHg+AeUUwhew
         yer7CZkanYc8H4CfGCFWaqdx0phVESGlawXuOMn3CLUnvajIWotFHwCIoG3DbC8iNKu1
         THF1a1cPbE6BiY4rmT7asBaN7UrcptYQHc0MORSchpcy8T1lfshLDTmBDRMTL9+wiDme
         1M8z902sD8E6UkLPL4Q7q9qAse/BJ1Q0LqG7PPjCc07l64fUczdrJKUe6ngNwVZ+oiYe
         U1zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793139833; x=1793744633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i2QjVlI3Q/9QvBglZ67tlTP9YtDMbvPwzMrhEB98kgY=;
        b=LRTy0yR14Bgg5oSrykFcKUwimcD1uq6EInYsbqNgz8GIWDSlKkqPYMKaN0Gn2B2tRM
         Q6BxhekpgBHcp03hTy/6Jwhh3ELP7rV+rPkN3mD5vSpZoQLqza7Cn1DftEBoAVKLnJ9Z
         t8k+RL4SOnrZ/TDQSnxZbESBH/AzoMjppkWLBrkidrF+mT7RgyJmeU9xB/ZRN3XcsbsN
         1SKl4rrq3fYfinq4h2o+QeETxTg/cIdLs7UHnaWGRdhcjArBKPDHMZ5Gpv5LaT6XIDon
         Kz7lAAqfgsZhdxhkQ6tmgmrKupVQA3fC2Z5q4+c6ZcNpiOPxVAu5KEhH78XW/1PVOFhg
         kiZg==
X-Forwarded-Encrypted: i=1; AKwUvBzS/DjTOLc2zW72B9SJK57q3Jfg2ZG/uGApIj/clsqXwMM2AjvcYuhZwS4/yeinQcuW+U0fCppy1Lw=@vger.kernel.org
X-Gm-Message-State: AFq9FYK4M3xM1jdIKwVwDL5X3KHfYVOP1DwRNJ9kp0Fhebu1myMs3zA9
	Tvp2cWViPSUtTUUArCBiNt31b0H27/DabmBBJ+cdT9smYTiM5HFCg8BHkRXxkyAgD+Y=
X-Gm-Gg: AYBFou1aIaK4G8M4Qo2xrXRgG3qHOv0gzqWCtMOEqqbyDRpoekXJB2mgSOwiRolMY85
	4+qUHBspSEw7p4e1Fnd2B/1XsPKJzkjMlS1w+Mcc5TK1Fgr3jM59nzE30434VucimdhRxC3x4zj
	QoPJxhzbNU1Cxq766icmS7reuPK4CTWMrG7RfU65bfep3/QHMUUxBUvVxhX8pmv03E4x1yTJVHi
	AQ8I5QKt6V8pEv+N/DhklADR/HO8GDFQdb1kqumWAsq3S/bXp0Oz9MIof29RH/jk2XCMoHLZjK2
	hZWigHA4Il83KZ0j5FBIRuAr/bA02WSdPOXmr5qa/iGJ81gxs/f8zOWFheh7CNQljdWHkJ/0Joo
	CdDB87WR136lDfVD/bmcUEs+q3fTxmk114fmhp1OoZ1CXnNnITil1MvPUJEeJQLXaLMJbduF5xU
	NwiOqrMdsKVVnGG3ZZhc03jOQ70cjoyO4lhb7JJD4qh8msmnkmNzNvrv7WUuiIjCI0wCdRVyOWb
	miGnB0hLqz4RSUizwTBWtzF5pyaVvSS2mnIWWBbwt0ZgUhxzhO42Hb69C7iSC6p7NIEBwPZDiMz
	bSL22ql8qPl9pfcyLDo/OhZ9OpYWyt29DHR1Aqg5UlJI6VfNfIJLadAAWtu5qB7+tP4N7Y2m72m
	eosUjsCDjpVxAqfl8P2Yk2tabKSI0Ff9tDtARSIpWJMxJZha1tLAPZnAXEVhLibDuhxj5tp1P
X-Received: by 2002:a05:600c:524c:b0:4a2:a9:ed56 with SMTP id 5b1f17b1804b1-4a9661ab67fmr7089855e9.8.1793139833420;
        Tue, 27 Oct 2026 15:23:53 -0700 (PDT)
Received: from cachyos (252.pool90-68-203.dynamic.orange.es. [90.68.203.252])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a9792269b2sm2292105e9.13.2026.10.27.15.23.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 15:23:52 -0700 (PDT)
From: f1rul4yx <vargasgomezderequenadiego@gmail.com>
To: corbet@lwn.net
Cc: skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	f1rul4yx <vargasgomezderequenadiego@gmail.com>
Subject: [PATCH v2 1/1] Documentation: make admin guide version-neutral
Date: Tue, 27 Oct 2026 23:22:16 +0100
Message-ID: <20261027222216.71715-2-vargasgomezderequenadiego@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261027222216.71715-1-vargasgomezderequenadiego@gmail.com>
References: <924f3b3c-a5e4-4686-abf8-0d4e23183a2e@infradead.org>
 <20261027222216.71715-1-vargasgomezderequenadiego@gmail.com>
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
identify the outdated references and draft replacement text. The htmldocs
build completed successfully on a separate test machine; checkpatch.pl and
git diff --check pass.

Signed-off-by: f1rul4yx <vargasgomezderequenadiego@gmail.com>
---
 Documentation/admin-guide/README.rst | 41 ++++++++++++++--------------
 1 file changed, 20 insertions(+), 21 deletions(-)

diff --git a/Documentation/admin-guide/README.rst b/Documentation/admin-guide/README.rst
index 77fec1de6dc8..a4a149ff5726 100644
--- a/Documentation/admin-guide/README.rst
+++ b/Documentation/admin-guide/README.rst
@@ -1,9 +1,9 @@
 .. _readme:
 
-Linux kernel release 6.x <http://kernel.org/>
-=============================================
+Linux kernel release notes <http://kernel.org/>
+==================================================
 
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
-- 
2.56.0

