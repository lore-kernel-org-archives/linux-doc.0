Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA9B1AB6C8
	for <linux-doc@vger.kernel.org>; Wed, 16 Apr 2025 04:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744777731; cv=none; b=Be/QgnNt8iv/c0O2cmVFlsvmAY7TOM9tTPlxNBKI5nccw/8zbXsX3ZX+ZnAVBoYa/yhNrlupWGct+aNdbzV86djym5fw+5qIOvXQE3iNxO9nnf4z5Rro6cPyxmkmcsZztnMr+FHRpvFrB7JhkORYwERwkhd/zeNchcyjPwhetZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744777731; c=relaxed/simple;
	bh=4AJ2IRDS3sRCUOnrqIohAaHmEqjAS+xtpAHzbK07RFo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S8qsbobOGrQBlJeKBNd2af7uRCqgHomfnRUB6U8Ceh29bXvBC8oGE28eAg45mxQ6BwiJ0Ebf4euUiOqNQxLj8l5lq0xaljGdilyZw1WPeLdqRy8D9SEq/9/cQXIp/BeqkoWNRtLD16mdThIOkQ9OF7dkPHotOSVAg3QO/ckja3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=LuKIu+eE; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LuKIu+eE"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-22928d629faso61741355ad.3
        for <linux-doc@vger.kernel.org>; Tue, 15 Apr 2025 21:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1744777728; x=1745382528; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=28eKhoko0uR2M75teuQ1e8pqzKdF+6yNeZfykeX93Ik=;
        b=LuKIu+eECOeJhIiIWyf6nkDDGeMxddwG4NIAPmehpUAHMhrtm8g6YCyUyg44N3ImpN
         JVKvRb+frku6K+vN2iJuU5PCHciYVByr5DYfjv5L7qxy4KOmRLpai7deza2xHv6fADw4
         kkq8q2gK+IO08KJzagKg8dfUHNdnyU6b18f9Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744777728; x=1745382528;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=28eKhoko0uR2M75teuQ1e8pqzKdF+6yNeZfykeX93Ik=;
        b=anibIgTxaqYEPc7V/w3lY9s8IQNVxdiQp3S9d/EajSVzN1yUb7FimbIiV/tEsw1d04
         kLK9Ern1H0etkY+326RE3TauCDfkw1Ybz6aQL6gJDmQftiTh7nwX/zudnQnfC8SB1qsp
         8MqzSciYf2q0zU4h9vFb5BZaHOttyaG1d1Jz11A52Hf6qxOncvBmQ6Y3xFd9+YlAFG5q
         jzQAEi33corlyHUe6xlssJeuHHVrgz0lMch46lQjqujsof4wY6CVo+qD17bcHOPToXHH
         fSbzebaJSTqVTmd+JV1G3ZTqo1fgykz28le6mhlEnZpbRuJqeA8D+SbBp6ylXUbBP3T3
         q9mQ==
X-Forwarded-Encrypted: i=1; AJvYcCXo2ZmYDJc/i0xUBnarMfq0I7YaVn2Di2zga0oKVHaleKgd/97O8FOXC/AN549JK4qgljdcMWKufKc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8wai9OOIp3OJu9RHN0eOukdCmlFtVs7yrCSBM2oBDTNeuXDr6
	xZ05pcKB+9PHhHW/648k3hJuPm9ycLHt7WNGl8bjxf1vNF3vfj1Gi1LsyJERFw==
X-Gm-Gg: ASbGncsKB6OBlSpnKe4/+nQT8U4wRG5s1KX2u7kYnTPPepY8yen4mQniw4PYqJg/M6M
	zPWsKUIAZfgii9LwLwuz+M/Oxfy0Y2tP8GCgBMARiqjknK49Xo8QR9eaeMOJHpXN0DTLzOA3k+e
	X59vE5fMKoPi0rzGz18sKRr5oscawtHo+MkTd/SrhN0eOdneJ0S/CJKfWNnmKwXfCR7UQCFgxmt
	ybDCv86EQdWiyu2q6gbLrcm+p1iWn4W06jso3VXsOwueTvpTZ741SOPq75CU00H6X0UktnfSErp
	hrcVBd0i5txvM7qXrerGOwXo2LrLpC31l8I8w4MQojY7AdQ8Xl9QEJGCrWTP+YQDC5M=
X-Google-Smtp-Source: AGHT+IFNkpm7oHWOoQ09eBUsjMI/rG4FOnzXtR/BKkkzvjs1ACVlrxBF35cBtCNsTLJD3pbzQs790w==
X-Received: by 2002:a17:903:228a:b0:223:2361:e855 with SMTP id d9443c01a7336-22c3595bc8fmr6134445ad.39.1744777728088;
        Tue, 15 Apr 2025 21:28:48 -0700 (PDT)
Received: from tigerii.tok.corp.google.com ([2401:fa00:8f:203:26d4:1f69:95c5:8f04])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33e63062sm4267265ad.0.2025.04.15.21.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 21:28:47 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Minchan Kim <minchan@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Shin Kawamura <kawasin@google.com>
Subject: [PATCH] Documentation: zram: update IDLE pages tracking documentation
Date: Wed, 16 Apr 2025 13:27:59 +0900
Message-ID: <20250416042833.3858827-1-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move IDLE pages tracking into a separate chapter because there
are multiple features that use (or depend on) it either in
built-in variant ("mark all") or in extended variant (ac-time
tracking).

In addition, recompression doesn't require memory tracking
to be enabled in order to be able to perform idle recompression.

Reported-by: Shin Kawamura <kawasin@google.com>
Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 Documentation/admin-guide/blockdev/zram.rst | 41 +++++++++++----------
 1 file changed, 21 insertions(+), 20 deletions(-)

diff --git a/Documentation/admin-guide/blockdev/zram.rst b/Documentation/admin-guide/blockdev/zram.rst
index b8d36134a151..3e273c1bb749 100644
--- a/Documentation/admin-guide/blockdev/zram.rst
+++ b/Documentation/admin-guide/blockdev/zram.rst
@@ -317,6 +317,26 @@ a single line of text and contains the following stats separated by whitespace:
 Optional Feature
 ================
 
+IDLE pages tracking
+-------------------
+
+zram has built-in support for idle pages tracking (that is, allocated but
+not used pages). This feature is useful for e.g. zram writeback and
+recompression. In order to mark pages as idle, execute the following command::
+
+	echo all > /sys/block/zramX/idle
+
+This will mark all allocated zram pages as idle. The idle mark will be
+removed only when the page (block) is accessed (e.g. overwritten or freed).
+Additionally, when CONFIG_ZRAM_TRACK_ENTRY_ACTIME is enabled, pages can be
+marked as idle based on how many seconds have passed since the last access to
+a particular zram page::
+
+	echo 86400 > /sys/block/zramX/idle
+
+In this example, all pages which haven't been accessed in more than 86400
+seconds (one day) will be marked idle.
+
 writeback
 ---------
 
@@ -331,24 +351,7 @@ If admin wants to use incompressible page writeback, they could do it via::
 
 	echo huge > /sys/block/zramX/writeback
 
-To use idle page writeback, first, user need to declare zram pages
-as idle::
-
-	echo all > /sys/block/zramX/idle
-
-From now on, any pages on zram are idle pages. The idle mark
-will be removed until someone requests access of the block.
-IOW, unless there is access request, those pages are still idle pages.
-Additionally, when CONFIG_ZRAM_TRACK_ENTRY_ACTIME is enabled pages can be
-marked as idle based on how long (in seconds) it's been since they were
-last accessed::
-
-        echo 86400 > /sys/block/zramX/idle
-
-In this example all pages which haven't been accessed in more than 86400
-seconds (one day) will be marked idle.
-
-Admin can request writeback of those idle pages at right timing via::
+Admin can request writeback of idle pages at right timing via::
 
 	echo idle > /sys/block/zramX/writeback
 
@@ -499,8 +502,6 @@ attempt to recompress:::
 
 	echo "type=huge_idle max_pages=42" > /sys/block/zramX/recompress
 
-Recompression of idle pages requires memory tracking.
-
 During re-compression for every page, that matches re-compression criteria,
 ZRAM iterates the list of registered alternative compression algorithms in
 order of their priorities. ZRAM stops either when re-compression was
-- 
2.49.0.604.gff1f9ca942-goog

