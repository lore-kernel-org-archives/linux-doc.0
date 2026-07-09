Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091CE3AEF3E
	for <linux-doc@vger.kernel.org>; Thu,  9 Jul 2026 19:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783624996; cv=pass; b=teuQn+crz+VQM0BYZZ0q2AXQdT5UJfaI439dPBn00reEcuGYFVw1vRaGjV9KKQupK49WOA1St/GwXnDCi0G/Kgo32NT3tVysyGEIybpmabrOUPSvYb5gOva57CxhpYKIFmmvogtudFwtX8nW/snfuABkCOfz4+nnz2rt8uazMaU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783624996; c=relaxed/simple;
	bh=P3KfzPSkqzrrDnn9/YRCi/E2VWJhiGCYGZ9lMjKrEmo=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=ioo7DRLaEa/bzkzh0DdBp0rEFSLIDPZuzt5sDKbT4NecyJ7sIpKMAHIvDqji0sr+NBGmnI4+Ga7QNs+BkNy4+fJq3nAGFMbhGn5m1cA1FYue+YBnz7z5dJfUFsAt3luWH/DY2dRGUJEungdL0VJMHhFMPJnE/s9QR3EUEmkvHdE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b=ljEtguaU; arc=pass smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b="ljEtguaU"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-804e46366d7so2614707b3.2
        for <linux-doc@vger.kernel.org>; Thu, 09 Jul 2026 12:23:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783624993; cv=none;
        d=google.com; s=arc-20260327;
        b=XQf2PVBKRcf8NAIpDtrSkxe9ainRH+umVXQ0wqrb0AwvtQ21A2Du62TovO5cFSnXmP
         F78tE8Qa8E/379fmyDARZqQa7hfcuwyH5gtyfdcymnJH0vYKB3jz5otUv870Iw7zBEit
         qRQ/z3EOywvS9HpzlfFcUC84B8PSmyF49G5b98hKDAD9kk71cWI8Gr32N6ZP0XabfWsI
         jmmKUai7Av+C16u2lfHq83MIuBF5MUoESRQvWlP0eDcbUMz53eWL6sWYslo+qwkRo657
         Ila5osqXx2IckqZDUwRYQHGzuXFP87gRbE7WMSv5Vj3uG/Fg75nwoL7k48zxJzDQ8fmU
         dn3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=rLKUCgOPdJB6WTWmQJRFGnXb1O7aYuVdA+Enw8Jcsyc=;
        fh=66dTQmpv/7BaoZktH2D8s7JzIpdsTtHdwxhW6XZA9BU=;
        b=ajVAAPSqfEcrSiaKql/iFl0tfzdypUfRODLJK8E6G+AjciTKuv94giy8Qmm2S8xaAL
         TKH34xjtarWvvF9+RNvIe5Kg7J0JhbCXQBM1u8IdUAUnzMsuRp4y5E9wPgluhNsoiCkR
         8u0XuBlkginq704T+xYcxyj/Kp0jzcrZebY26owz5sK+2RaDnZZaYoRRiSKgBBe8kSAb
         yTofSds0dn8vHqNF9D5/IRmqE9G9RytNLnHsW3YjU4KdH5edp5KhGHdjrE+rkp5y2JD1
         nG+4l5afr5XpjVOfW9ILZDuq/Df6VKG8LTWeaTAUTI4xBHH8F2ZCft8awMWI8GSUMBDs
         U0Vw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20251104.gappssmtp.com; s=20251104; t=1783624993; x=1784229793; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rLKUCgOPdJB6WTWmQJRFGnXb1O7aYuVdA+Enw8Jcsyc=;
        b=ljEtguaUrlOSM4IV2SAU7NG/Xt3zC3n3DBjx0i6yZ2ajqin+G58jhYLXbAnGDIWMa8
         BZ9PpW5dKDglG6fyO8OH39Hy6bbGiA9y8i6Xs/3RveHZ58YG16waIZOMhzsBAevg1k2h
         xhCNo5pd3NKeud9FQ7AuADR/Qxt7PvlaJ3tVeBVNBNlUwYE6SPzZrlxwbAyV2BzMgoz/
         Qx9X3jP4MDHbux73mAC5KfL+R2YsT5/LqszTOsBeUemwyP2w6SFjzOa1yxYm8dsGRSoD
         fp5Knr+JURHaZ22uuuxBUC88zLk0C4G0P7TKWxr6iWD7foxqdKzwjNaPVLva1qgUqiVI
         WF3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783624993; x=1784229793;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rLKUCgOPdJB6WTWmQJRFGnXb1O7aYuVdA+Enw8Jcsyc=;
        b=KcPP82tVw1+aQzISdt6YWeGdEvvwjya4Cs5ErP4/WcZHmMfkZm4poPVIsdArLWPQYP
         prWSy4a4PhlLVkGyZXQ8NxgCXUeY8Re+589NMxu/qyjp84GhQi3m8ZQjcu4vfiJwFWQm
         9bJeRWWHjYZqe+zHBA7xLLkM7kC9x241+hUNwrPv2go6HvmKvRuzqmnwvh3XBDO+HD57
         AjQvl3s58rxEzk5DpyGx5eb39lYkKCwjDoQWCEe/JAeoNLE3B+M2WPWmKPlMULYb+MLx
         SrqmeZyGqyPd0teppcTszcqK8pnJAizAlqH+zzEPbls0EYFnP4JUaQWJQY6+2yBPpfed
         LgHg==
X-Forwarded-Encrypted: i=1; AHgh+RqlDTsl5PSyk6R5zSyffnc6DDlxsFcsVzm/63hFTQ9YqcuoeW4C25DA6HU+4LFHb08CeQK14Mmy6hA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx28eljjqnClCKnbZ+kmLFANqZKSUGUuVgpgeJtGF+y5kN6aU13
	eZltK5szot1uHOxmhrvMCOBp0yM8iZ6CTg7ihCnHCrUsxCrEUL1htZaEWvCcsQvJNsdX/eRF4D+
	ZV64CI4Zpk35190gdlGKQ++YI5vG+0Fyz1AGIn7wo
X-Gm-Gg: AfdE7cnrH0cd4UZZnrAKSZVkfjjDGbBaQNRcS3xFt4ZVO0rTZMAp3h1YIu7v1oFAlpd
	lB5GxhEamAd9THYRI1up/ldbuI7j7XN5H7TtgQMA78VIesiV+An1kYWug++2H6A7iH5ACfJ5WWv
	M9+5JKkYhb3sr59HilAbNhN52JiN0wAyGJu0KlBGBN9QT7HH5bhb4yK/LBlF8VHWAa0epfyLAW0
	Fi2zz9iqMkpWrbW9Qya2+6Izd1r7sWfRgCTw9dAlslc2mKa3/hzFOLpv4uXUAT4oMXb0iB0niVG
	sA2YmUPtLZTrdsHhtMSzdfbdwcg=
X-Received: by 2002:a05:690c:6d0c:b0:81e:6f0d:8e05 with SMTP id
 00721157ae682-81e6f0d8e5bmr31386797b3.43.1783624992516; Thu, 09 Jul 2026
 12:23:12 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 9 Jul 2026 12:23:11 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 9 Jul 2026 12:23:11 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Sean Rhodes <sean@starlabs.systems>
Date: Thu, 9 Jul 2026 12:23:11 -0700
X-Gm-Features: AUfX_mzVZtqRRkl9fVhuBIBaSxwAAmVa-vH3CHlHUp7UY50ccQrXa49krBcAszw
Message-ID: <CABtds-0AUr1jD2Sri6ViiFiqyBbjc3-6xeAOr12YLJA9ux-2BA@mail.gmail.com>
Subject: [PATCH] PM: hibernate: Allow hibernation opt-in when locked down
To: rafael@kernel.org
Cc: lenb@kernel.org, pavel@kernel.org, corbet@lwn.net, 
	skhan@linuxfoundation.org, paul@paul-moore.com, jmorris@namei.org, 
	serge@hallyn.com, nicolas.bouchinet@oss.cyber.gouv.fr, xiujianfeng@huawei.com, 
	keescook@chromium.org, linux-pm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Kernel lockdown disables hibernation because the resume image cannot be
verified before it is restored. On systems where external platform or
storage policy protects the hibernation image from offline modification,
users may still need hibernation while lockdown is active.

Add a hibernate=allow_locked_down command line option to make that opt-in
explicit. This only bypasses the LOCKDOWN_HIBERNATION gate; nohibernate,
secretmem and CXL memory restrictions still apply.

The kernel does not validate the external policy or authenticate the image
with this option.

Build-tested with Fedora config:
  make O=../linux-lockdown-hibernate-build kernel/power/hibernate.o

Signed-off-by: Sean Rhodes <sean@starlabs.systems>
---
 Documentation/admin-guide/kernel-parameters.txt | 5 +++++
 kernel/power/hibernate.c                        | 6 +++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt
b/Documentation/admin-guide/kernel-parameters.txt
index b5493a7f8f22..0d20ad9c7d78 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -1967,6 +1967,11 @@ Kernel parameters
 		protect_image	Turn on image protection during restoration
 				(that will set all pages holding image data
 				during restoration read-only).
+		allow_locked_down
+				Allow hibernation even when kernel lockdown would
+				otherwise disable it. The kernel does not verify
+				the hibernation image; only use this when external
+				policy protects the image from offline modification.

 	hibernate.compressor= 	[HIBERNATION] Compression algorithm to be
 				used with hibernation.
diff --git a/kernel/power/hibernate.c b/kernel/power/hibernate.c
index d2479c69d71a..71232eece9a3 100644
--- a/kernel/power/hibernate.c
+++ b/kernel/power/hibernate.c
@@ -41,6 +41,7 @@
 static int nocompress;
 static int noresume;
 static int nohibernate;
+static bool allow_locked_down_hibernation;
 static int resume_wait;
 static unsigned int resume_delay;
 static char resume_file[256] = CONFIG_PM_STD_PARTITION;
@@ -109,7 +110,8 @@ bool hibernation_in_progress(void)
 bool hibernation_available(void)
 {
 	return nohibernate == 0 &&
-		!security_locked_down(LOCKDOWN_HIBERNATION) &&
+		(allow_locked_down_hibernation ||
+		 !security_locked_down(LOCKDOWN_HIBERNATION)) &&
 		!secretmem_active() && !cxl_mem_active();
 }

@@ -1433,6 +1435,8 @@ static int __init hibernate_setup(char *str)
 	} else if (IS_ENABLED(CONFIG_STRICT_KERNEL_RWX)
 		   && !strncmp(str, "protect_image", 13)) {
 		enable_restore_image_protection();
+	} else if (!strncmp(str, "allow_locked_down", 17)) {
+		allow_locked_down_hibernation = true;
 	}
 	return 1;
 }
-- 
2.53.0
