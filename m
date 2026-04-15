Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7122442A80
	for <linux-doc@vger.kernel.org>; Wed, 15 Apr 2026 00:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776211930; cv=none; b=HsPgG6/sUqSnLssMWoA9xGD+lZyhLZxmQa2nBLkRRG3jnfEorGzEtGbj9Tlb4jKcEeHJ/3x7pRvd9rbxesuu5U+dull7+CBV346lmsnLhXZw2Wq/F2cJLAAgQONWTMOrx1/jLlIScLxyQ4OTTgr/jxDwCDLgS5U9HZwGzoQK44o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776211930; c=relaxed/simple;
	bh=ASp5/5csZKKik6TzXvHsaMsqFnjFvGTJtkUXQ7ZsbCE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tJgWCuXtLNJF4mNuWLz0BvyXxjRF+6ttl1Mz0izUlPh5eel7PBgitWX0xicIMad8MaYJvnb5KnJzVy2dd9bcRstWkdMJ9PFNkmrZo11BT5sxbC3DKxAQFfC3+GaXN7lwU0ied3N2WMRmQCGaAo8gXMchPGeOJI1p0IPWbBCo/EU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SHEHicLs; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SHEHicLs"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2b4583f0a1aso18637885ad.3
        for <linux-doc@vger.kernel.org>; Tue, 14 Apr 2026 17:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776211929; x=1776816729; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8uivSpHdDqx02K9PkzcLHUWF88epFumZVKoP825UHho=;
        b=SHEHicLsHzhHAfE/p/EpHtGkVlABrn5Tju9u4b2WkNYxn7Zmlr0wUWF+ku9KoIJv5C
         Tm1YJz0ko7Wlp1gd/LgBrfG/18IUOnr8eoOyYvS6ma29IDrI6zW7jNeI4e/pI7tc1eSK
         3kB0uxLfDaFm0/NbSA/zTZMo3RKgbaF8lRinTBc8Z1pNp/p9+lvL8CkX0PTSH5n+J+Jt
         HFu4axED32wl4hQGTW138Hv+wHNwaPY1RmPnk/REWgfv7oI41hqtYtEb7IYbOCknES6K
         Rz3rkfSJr8jkICoLkzElVdD6187wHw/5TqxRiB4PqLepZEJeKqbfghqQIOc7A13EHybR
         vNCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776211929; x=1776816729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8uivSpHdDqx02K9PkzcLHUWF88epFumZVKoP825UHho=;
        b=sZyDquD+qR0Iv/v7ioKdY3V6aJ990SakCTaBzu0X5Z4Ht7FNHg1qxPMTC/4WK8FZ/s
         XGNU+afVtQU4WTS3yFwItd2HdN+/Y6WKcekOCUg2iB82mZu9q8ruWSDYOsHSOlYpl0ll
         uRBgh6mfWFurMLZGL2vDd1UnVyghm8RSZ3YKwseKrh8Rm7YkspERbt4VzQfjJxuJShR3
         G89B2l0TK2hTFyWtD1kUHQ59HDSU51s42S0RcsmSokGPBzYTuMjfu4n3awSi+h9vV0kp
         e7eACSnXdycTxnd577tt8JWOhDR0Itj14SXc8QvyHj3W1YgY73c9HA70G63lb7Rl31aQ
         PHvg==
X-Forwarded-Encrypted: i=1; AFNElJ91sGBdR9ZHlV7b/unTf57zE+3ZoU3jVIBwfopNj3d3iLkxXgekZ9F5UjZ/n8kydlNoZ61ZqKOJNlY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+HrriBrLkjSInPW3B5gXa/wCjHHci2K4PzSccww6mNIC2tfBk
	cVPNUPCtCGrshE3Ihsf+U3+hhsSf8Bjxns23t2NW9kAOUZ70PMlH4gPH3yuj6BnA0VA=
X-Gm-Gg: AeBDievPPeMh8G18aK6NDq0w8ybQV71tNSTVpR3wCqVvR69ZTcx6YAoNE/SndVt0JYv
	uwmluf83EYAI7/hdlpgF/KEtWoZTIru/1M9yONL93qjaYBdRabilM4GdI6nSMkdeNhohe9vs4er
	Wiuu2NDuwrygyUZrf2S+8DIAVNAdjnxJyW51y4tf4Johx0yADs2SojtvaQ2pDh36jbEt5JHp6Xt
	2UGAO2UC/l070Gk5VbmndnVM2f2f9SkvKfbkyAIxTs1dB3RR5+tI8UJVzl0JLcVSMvjbMEZnftA
	Gd9d/rUQuG1JetV9kKDyJuZF5ZS7AAUF8y/8EQJtast9FBlZF+TwZFOlFLd0YTYZixh2X6PnIRf
	yk+0J8GkbCpVwtFDBwptuxwplcP6Rn+Dv5VxLPuQg065xpoHMwy40d0SWdWTr8VvOzUpIjMoVF2
	o52CVaGm1DZY3WLO5AI25b8c0P21Y5N/gzRsdVglX9vAmSuQDDhfnNWoA=
X-Received: by 2002:a17:903:2c50:b0:2b4:5cb8:99eb with SMTP id d9443c01a7336-2b45cb89e2emr114010265ad.27.1776211928684;
        Tue, 14 Apr 2026 17:12:08 -0700 (PDT)
Received: from localhost.localdomain ([124.55.73.133])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b47826e248sm915935ad.47.2026.04.14.17.12.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 14 Apr 2026 17:12:08 -0700 (PDT)
From: fru1tworld <fruitworld.planet@gmail.com>
To: corbet@lwn.net
Cc: skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	Hyeonjin Kim <fruitworld.planet@gmail.com>
Subject: [PATCH v2] docs: fix typos in kernel documentation
Date: Wed, 15 Apr 2026 09:12:04 +0900
Message-ID: <20260415001204.6428-1-fruitworld.planet@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260414084553.22762-1-fruitworld.planet@gmail.com>
References: <20260414084553.22762-1-fruitworld.planet@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hyeonjin Kim <fruitworld.planet@gmail.com>

reinitalizes => reinitializes
unpriviledged => unprivileged
sub-struture => sub-structure

Signed-off-by: Hyeonjin Kim <fruitworld.planet@gmail.com>
---
 Documentation/block/data-integrity.rst | 2 +-
 Documentation/core-api/list.rst        | 2 +-
 Documentation/gpu/drm-uapi.rst         | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/block/data-integrity.rst b/Documentation/block/data-integrity.rst
index 99905e880a0e..b7b10c8abbcc 100644
--- a/Documentation/block/data-integrity.rst
+++ b/Documentation/block/data-integrity.rst
@@ -154,7 +154,7 @@ bio_free() will automatically free the bip.
 ----------------
 
 Block devices can set up the integrity information in the integrity
-sub-struture of the queue_limits structure.
+sub-structure of the queue_limits structure.
 
 Layered block devices will need to pick a profile that's appropriate
 for all subdevices.  queue_limits_stack_integrity() can help with that.  DM
diff --git a/Documentation/core-api/list.rst b/Documentation/core-api/list.rst
index 86873ce9adbf..7ff112770c51 100644
--- a/Documentation/core-api/list.rst
+++ b/Documentation/core-api/list.rst
@@ -752,7 +752,7 @@ This is because list_splice() did not reinitialize the list_head it took
 entries from, leaving its pointer pointing into what is now a different list.
 
 If we want to avoid this situation, list_splice_init() can be used. It does the
-same thing as list_splice(), except reinitalizes the donor list_head after the
+same thing as list_splice(), except reinitializes the donor list_head after the
 transplant.
 
 Concurrency considerations
diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
index d98428a592f1..14ecaf98df90 100644
--- a/Documentation/gpu/drm-uapi.rst
+++ b/Documentation/gpu/drm-uapi.rst
@@ -568,7 +568,7 @@ ENOSPC:
 EPERM/EACCES:
         Returned for an operation that is valid, but needs more privileges.
         E.g. root-only or much more common, DRM master-only operations return
-        this when called by unpriviledged clients. There's no clear
+        this when called by unprivileged clients. There's no clear
         difference between EACCES and EPERM.
 
 ENODEV:
-- 
2.52.0

