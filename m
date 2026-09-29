Received: from mail-pz2-f29.google.com (mail-pz2-f29.google.com [74.125.228.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2179D527594
	for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2026 13:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687443; cv=none; b=gnl1bLyAmn3ZRo9j8uqFSFvTMuubfjbu9J3aNj7ppe1Cz9QOCv5Boh5Eq8JTN68esQg5dtnEVH1BK0rk+cfGE/k170oWdH4tNtpawfwXVWXBtF8gwkCXqr6TosDNGamXYrlZvxaBtV86EzICfVX42bjmtqDa66A4NA2D3D39E1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687443; c=relaxed/simple;
	bh=IjCYtrfBxeBhj+guwmhAM+glVNFJFR4uaq1zahSbRJs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QLyUmTlVgHwPpEySNvc3ZByz/yFcpxxWNKrSyWuhLLB4BxWHAdhUXJM0oxnyoMslcUX9qaEmB9nSspWXujT6URngJ4jSamYRBvpuF9nqeOccyGC7dYSrDY6J+eTteLtPAcwn1C/uEYoLFXRVRERDdYTfbX0jPCEFVSZKcZaWLL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H3c3ncJq; arc=none smtp.client-ip=74.125.228.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H3c3ncJq"
Received: by mail-pz2-f29.google.com with SMTP id 41be03b00d2f7-cc4e4979c55so141232a12.1
        for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2026 06:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790687441; x=1791292241; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n5C5c0ByPS6Z9BVOilpDVRYaF46vA/1HlMT1E17MuKI=;
        b=H3c3ncJqog/urYGvo7gG3sHCA6PFzqTs3E4BKDWjZbLn7Zt8gF5XooYQhJusa3FtD1
         227gCGsjdRzFnllS1DKlxVAvM9wbJ50Nu5ZyGceW6QtoLQCwQv5vXxe47cZWd6+PFXSy
         0Avt32Rk51OBwr2Tgem52aZHG9R4qhfScV7yrUohxf9Re5v3sPSDfVvjSOs1iKGSKgLf
         9NbB3po8+jQp/fpCxn8plybZ+CTTiwtMdclZcQIIYgIdSnSjW5Ue/RMAp6fyRIiebNh+
         9WPjV8G/uN+6iU1gYtMkqCfhTSOJfCWIub17hURj6QcW7JsgjB6kHwR9WG2DgROm/hE5
         U5AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687441; x=1791292241;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n5C5c0ByPS6Z9BVOilpDVRYaF46vA/1HlMT1E17MuKI=;
        b=1WLbP76kh8tReLHKFcC4HqwCkm4Fnwkq6ZLDHY1w6UAXO1B6H+LtLoRIxJhs9cpbEc
         AamHSceXQHPfM4WgWE5iZWerUqy2yobGBqEYxhVuzY3JZpTp6SBZdivVlE9sZFF8dYhZ
         ZrxXYB0RLqyV4YkMWrDRPVwd4YAVxThY+lCwCraFMudRN+2PdUpoH5K6PA82lE+u1fjz
         X50V+KGHpqciiZDymzkLqDQBXOEiKXVfzFpA9fsHaS9eL996NDk+wIVFensnbqkvflpd
         t2cR/3vshx1jzeJANluKIzVZB66vVsYcXSzgYzc30BPgkAC66kR6+SgU+gc8FfpYpMHy
         fQiA==
X-Forwarded-Encrypted: i=1; AKwUvBxUFaQvjux+nnjFglaYN44bpqGsUw8FQS0KX3WrKsOdRFMLmnOY+fyG3ac+hBGZ0uzcTwFRWczi/u8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJh8GVDlalrE4CPjy/6XafzyGHSPD+NImv9BUenB+KTMyIXha//
	OPKIE6SQJpHXdUJZ28gkw9JmqMXqYPTj4SjVS7Car45Y26L2ItJBI5A1
X-Gm-Gg: AYBFou2YivOGzm6HTaBYL0O7met4d+VW26zjVV6odMlpgeOSlpXiNlxRAF+sBu6aWKb
	hbbycuGVbVvsMgsQf3r7mw8iKDaJQd3j5VhCiydotPjir/5rYwYD17J7zUV1ITDdYFFT/MfOdeP
	s/XHduPZv8qWbxZgqFx2ixLfbQWoEs1VoiJ0r3g3fenNdSSxu+AkQC7SNKwuV1v/wXgTSn9vDGK
	nDHRC6+mS5cp07qcuWxu3a40gRX704v0FEg6DJnMzQcwkPahVd4gR7q+wcCuVKYvQLUYewys545
	SU/s98akGErkQEbuAeJU4iktk6qpkM181uzxI2TjCeQiPRQiqmBVCDSXjUHoK43em1sp8nwqOI8
	MvFKgn8V0bam3O8o3/zL8/zi6tueF9lsbysnlGTvLu/nl4XLAKAMhEOk4qrh4JHd5xIp7y/RWuR
	+FB1Y2RDkrjxOhj1mF0XI9wG61uIVK5lTl+S3qyLmMVdoeYaJXR7ja21DJ8Xp0gVn7U6mG+UpPf
	W2T44XtrqMxLo9XY9CugH/rUPBbLUlD10scpjX0ZnMWAOIiGAHAPo4Sng==
X-Received: by 2002:a17:903:1ad0:b0:2da:dd0a:99e0 with SMTP id d9443c01a7336-2df8e6db03amr164544755ad.2.1790687441008;
        Tue, 29 Sep 2026 06:10:41 -0700 (PDT)
Received: from chenyou.. ([140.116.39.229])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df9142969esm57363705ad.45.2026.09.29.06.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:10:40 -0700 (PDT)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: corbet@lwn.net,
	alexs@kernel.org
Cc: dzm91@hust.edu.cn,
	wy@wyuan.org,
	si.yanteng@linux.dev,
	srcres258@furdevs.cn,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH 4/4] docs/zh_TW: add missing :Original: fields
Date: Tue, 29 Sep 2026 21:10:18 +0800
Message-ID: <20260929131020.266120-5-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929131020.266120-1-chenyou910331@gmail.com>
References: <20260929131020.266120-1-chenyou910331@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Every zh_TW translation names the English document it mirrors in an
:Original: field, except these four.  Add one to each, in the plain path
form that automarkup turns into a link.

dev-tools/sparse.rst still carries the old plain-text header rather than
the disclaimer include, so its field goes at the top of the file.

With this, the only .rst files without the field are index.rst,
disclaimer-zh_TW.rst and glossary.rst, none of which translates an
English document.

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 .../translations/zh_TW/admin-guide/clearing-warn-once.rst     | 2 ++
 Documentation/translations/zh_TW/admin-guide/cpu-load.rst     | 2 ++
 Documentation/translations/zh_TW/arch/index.rst               | 2 ++
 Documentation/translations/zh_TW/dev-tools/sparse.rst         | 4 +++-
 4 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/Documentation/translations/zh_TW/admin-guide/clearing-warn-once.rst b/Documentation/translations/zh_TW/admin-guide/clearing-warn-once.rst
index 95614600604c..15d54440d224 100644
--- a/Documentation/translations/zh_TW/admin-guide/clearing-warn-once.rst
+++ b/Documentation/translations/zh_TW/admin-guide/clearing-warn-once.rst
@@ -2,6 +2,8 @@
 
 .. include:: ../disclaimer-zh_TW.rst
 
+:Original: Documentation/admin-guide/clearing-warn-once.rst
+
 清除 WARN_ONCE
 --------------
 
diff --git a/Documentation/translations/zh_TW/admin-guide/cpu-load.rst b/Documentation/translations/zh_TW/admin-guide/cpu-load.rst
index 20ec5bcd5f18..13f03195ac7e 100644
--- a/Documentation/translations/zh_TW/admin-guide/cpu-load.rst
+++ b/Documentation/translations/zh_TW/admin-guide/cpu-load.rst
@@ -2,6 +2,8 @@
 
 .. include:: ../disclaimer-zh_TW.rst
 
+:Original: Documentation/admin-guide/cpu-load.rst
+
 ========
 CPU 負載
 ========
diff --git a/Documentation/translations/zh_TW/arch/index.rst b/Documentation/translations/zh_TW/arch/index.rst
index 7c0490589465..724468687c20 100644
--- a/Documentation/translations/zh_TW/arch/index.rst
+++ b/Documentation/translations/zh_TW/arch/index.rst
@@ -1,5 +1,7 @@
 .. SPDX-License-Identifier: GPL-2.0
 
+:Original: Documentation/arch/index.rst
+
 處理器體系結構
 ==============
 
diff --git a/Documentation/translations/zh_TW/dev-tools/sparse.rst b/Documentation/translations/zh_TW/dev-tools/sparse.rst
index 7a3487a7b2c7..7ca7fdf6e1e6 100644
--- a/Documentation/translations/zh_TW/dev-tools/sparse.rst
+++ b/Documentation/translations/zh_TW/dev-tools/sparse.rst
@@ -1,4 +1,6 @@
-﻿Chinese translated version of Documentation/dev-tools/sparse.rst
+﻿:Original: Documentation/dev-tools/sparse.rst
+
+Chinese translated version of Documentation/dev-tools/sparse.rst
 
 If you have any comment or update to the content, please contact the
 original document maintainer directly.  However, if you have a problem
-- 
2.43.0

