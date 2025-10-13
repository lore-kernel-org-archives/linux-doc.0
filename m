Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C732FDC41
	for <linux-doc@vger.kernel.org>; Mon, 13 Oct 2025 09:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760349410; cv=none; b=ml0EIbI5OZgx8Pe6nykOH1oWxhbW0nJn7K+vjCgyry9zn+anRERUlmoqRmZKlgM9HalzIyqMCOTVxeBMKsUyEHv4jxjxXXGhuTGMuAHpP2gH3u3Dd5cNSNB1rbv8FmlDYbSoCqILTmp635XbhuCjEFvdnHx+0m7ZzVjjdOtmDZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760349410; c=relaxed/simple;
	bh=osO1ANWf/MtQ51cpeQHzFc47cYEE93PJRkuORtoQPk8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cYy7r/UwYmMl7yjgll9XKFX74qo1z2zL3fAAdgFZtImR0eaOqzHvxFTzXyG/mmT7A7PeWlmRXvmaQWFkwwm31SzfCP1pZ5UVk/4GwaAmmE7eBwzh+PegjalB6C34KtJweXJqip99qmm/P1ncxK0HEPDmscDDvckdvzBvxjQML7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=boWZckxU; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="boWZckxU"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-781001e3846so3931178b3a.2
        for <linux-doc@vger.kernel.org>; Mon, 13 Oct 2025 02:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760349407; x=1760954207; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f+yrBFZp5vtdgalR3uw+8+Z4TKx4WciRTYMlOYaljes=;
        b=boWZckxUH2gljY9tzOV+4GrH2LnfwzJdL3n89Jvv5NzspiZL6FD3Icr0ZaO2mw8Rf4
         0rDbyTYmF02mmGSJapwzZxeTvnInSFeGEFyvk82cY7ECggvZ0pt+x8fHN+bJOAJ91sXx
         Shr76lOmWvDEpOw5p96kAx+Nm8vSntVCse606O4EPjmV9f1yHD/794zlBbafdqBNHmcJ
         KDagsUctOVcZXP6iN0BsXveOX4phgNQDsqU4gFXL0bIEjztz6tHBv9dATRadJV4dIS5V
         nN3tnkehNWPRfygDL/ucg7ZWBTYcG15C8YESMRRBCt9+csfGIrex52d1y7B1wi0Q+esq
         IBOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760349407; x=1760954207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f+yrBFZp5vtdgalR3uw+8+Z4TKx4WciRTYMlOYaljes=;
        b=Qi3GFRyzWKpjka/ZmYllDsMm/iG+3ca5T5xOMuAJPpc8AUm5f6SG24LpuePCxAKjyK
         k2ZRr/gZm8TKuqDtQm1iPRYvo0m2V9Bal3JGNnjzXBUsu556SJLHFakVEeihXl3b9fMK
         FJfEnwQOmTRZQb5Kxl0ovB8k8hHkrtPcYoQXq8wZnO2rh8Ytddu6wgnz8Xk8YsXUHIOx
         fgT73BpEw/WLiH0srL3UtbGvbEuUQBS0ISqRGgaVTU1pB5fld1U2imDQV7fxt+eki00P
         +n3q7I8bOIemX0gimrQoRbTg/xU3c1xyM+908EJWXYTe12kFdVc7yFbb/suPq3DmWrM3
         St4w==
X-Forwarded-Encrypted: i=1; AJvYcCUM1iHnDguuggGq02ruhM+s0dUeLBoitAygt1/EhbjM3WYIdjwQLPPgPC5ejGV64Nel0MlGjwcdfV4=@vger.kernel.org
X-Gm-Message-State: AOJu0YypyPzz/hOcVg0/p5BnrapwoP3Ib/GLnhyST3tg1SplxD0fs7UI
	FJNrCEbjIzmpnq13aWgamuiQnwbLWwGrcfhGrDWWgviytUpmfL7Ek+a4
X-Gm-Gg: ASbGncsR5StzZalMrvV0XdfoTUf/g/M9o4TEo6YqYclIwnQ6IgUNluoOuN2y6CUOACM
	z8qbPRkVJJJunPcNKeIUYU+zk3yk6JTsv4WMl3OXq8JaD05/BUOQjW4ruWyTHm62C1nTwSRYfv5
	0r/hOWC8NIIZcfNxLnXwymFkjQmKszczHyqGPvISXWendJrZi8W3Cn7+8bxNPGVylcuF8I2ynMK
	46fqUOB76ycJ//XUg6EKUJPDVb3OA0u9aBqnhqaMDNbgJ/i6/u81BDRo0lE9AQWLqAhq+DIu4xt
	Rcgs8pR8gWYOyw31uOMag2ZdT6UnUcyubLr3zCq6rlb1rC2F11YhNJ7K5dZnjhqJ+lVCyOXSYk1
	6DacJVu7UEqZ+zZQDZnIIYeyy+wy2Zm14NDicGM5UEItFKkSvNAIlU5Q=
X-Google-Smtp-Source: AGHT+IG4d0UlItFBg2gSZoAXDMDXxcApwjTaXpPj1vdprQgwuvA01VXZjBH1veLt+SCHWSZCYBY1UA==
X-Received: by 2002:a05:6a20:a111:b0:2c9:ff13:bc86 with SMTP id adf61e73a8af0-32da8139429mr27108687637.21.1760349406967;
        Mon, 13 Oct 2025 02:56:46 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992b0607e3sm11349871b3a.11.2025.10.13.02.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 02:56:45 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 83F8F45289A7; Mon, 13 Oct 2025 16:56:43 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Will Deacon <will@kernel.org>,
	Markus Heiser <markus.heiser@darmarit.de>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Silvio Fricke <silvio.fricke@gmail.com>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v2 2/2] Documentation: assoc_array: Format internal tree layout tables
Date: Mon, 13 Oct 2025 16:56:31 +0700
Message-ID: <20251013095630.34235-4-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251013095630.34235-2-bagasdotme@gmail.com>
References: <20251013095630.34235-2-bagasdotme@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3600; i=bagasdotme@gmail.com; h=from:subject; bh=osO1ANWf/MtQ51cpeQHzFc47cYEE93PJRkuORtoQPk8=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDBlvzlSsWrrxLT/D/Dbmh9K59dPnqPrJVLHW++cet1wee L7UZYthRykLgxgXg6yYIsukRL6m07uMRC60r3WEmcPKBDKEgYtTACby2JbhD9/Kieun8z08xl3x LnTed0Wpa7PY8mavmHYyLLT57SIu5zJGhhmbprfrJyRxdB5Zztqaovi+slNcjLNhdvNavh9vM3/ 5cQIA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Format tables in "Basic internal tree layout" as reST tables.

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/core-api/assoc_array.rst | 33 ++++++++++++++++----------
 1 file changed, 21 insertions(+), 12 deletions(-)

diff --git a/Documentation/core-api/assoc_array.rst b/Documentation/core-api/assoc_array.rst
index 61c7ba1e7b877f..19d89f92bf8da8 100644
--- a/Documentation/core-api/assoc_array.rst
+++ b/Documentation/core-api/assoc_array.rst
@@ -317,8 +317,7 @@ There are two functions for accessing an associative array:
    modified, provided the RCU read lock is held.
 
    The function will return the object if found (and set ``*_type`` to the
-   object
-   type) or will return ``NULL`` if the object was not found.
+   object type) or will return ``NULL`` if the object was not found.
 
 
 Index Key Form
@@ -400,10 +399,11 @@ fixed levels.  For example::
 
 In the above example, there are 7 nodes (A-G), each with 16 slots (0-f).
 Assuming no other meta data nodes in the tree, the key space is divided
-thusly::
+thusly:
 
+    ===========     ====
     KEY PREFIX      NODE
-    ==========      ====
+    ===========     ====
     137*            D
     138*            E
     13[0-69-f]*     C
@@ -411,10 +411,12 @@ thusly::
     e6*             G
     e[0-57-f]*      F
     [02-df]*        A
+    ===========     ====
 
 So, for instance, keys with the following example index keys will be found in
-the appropriate nodes::
+the appropriate nodes:
 
+    =============== ======= ====
     INDEX KEY       PREFIX  NODE
     =============== ======= ====
     13694892892489  13      C
@@ -423,12 +425,13 @@ the appropriate nodes::
     138bbb89003093  138     E
     1394879524789   12      C
     1458952489      1       B
-    9431809de993ba  -       A
-    b4542910809cd   -       A
+    9431809de993ba  \-      A
+    b4542910809cd   \-      A
     e5284310def98   e       F
     e68428974237    e6      G
     e7fffcbd443     e       F
-    f3842239082     -       A
+    f3842239082     \-      A
+    =============== ======= ====
 
 To save memory, if a node can hold all the leaves in its portion of keyspace,
 then the node will have all those leaves in it and will not have any metadata
@@ -442,8 +445,9 @@ metadata pointer.  If the metadata pointer is there, any leaf whose key matches
 the metadata key prefix must be in the subtree that the metadata pointer points
 to.
 
-In the above example list of index keys, node A will contain::
+In the above example list of index keys, node A will contain:
 
+    ====    =============== ==================
     SLOT    CONTENT         INDEX KEY (PREFIX)
     ====    =============== ==================
     1       PTR TO NODE B   1*
@@ -451,11 +455,16 @@ In the above example list of index keys, node A will contain::
     any     LEAF            b4542910809cd
     e       PTR TO NODE F   e*
     any     LEAF            f3842239082
+    ====    =============== ==================
 
-and node B::
+and node B:
 
-    3	PTR TO NODE C	13*
-    any	LEAF		1458952489
+    ====    =============== ==================
+    SLOT    CONTENT         INDEX KEY (PREFIX)
+    ====    =============== ==================
+    3       PTR TO NODE C   13*
+    any     LEAF            1458952489
+    ====    =============== ==================
 
 
 Shortcuts
-- 
An old man doll... just what I always wanted! - Clara

