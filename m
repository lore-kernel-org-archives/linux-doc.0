Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0DFD366828
	for <linux-doc@vger.kernel.org>; Sun,  8 Mar 2026 10:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772966509; cv=none; b=aOpp7egum0BgAhFR9jaNhwgJXcs9TGLzH/hIlxhHqtxkxSKzTNcnw6aYR5DFKTrkDHvvbhbrDv7N/Wa5dmI+0Cb1ol9z7UFMTFQZgitBIIvJneaQAt0tNHTq2Ogv9SboYWrivO5WjdnGmoEoVCPpEwiWCGSo7L3fvuHn2vARCVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772966509; c=relaxed/simple;
	bh=t6+fCSe+IhcDa1X8VSyEXDcR3x2YoJZpzsJOBZskPCE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UhOWkwrE5k2LsXARXn6/XKvxmSKTaPdmIbr6Q67uqYe29eQKAUMdcuigh0srcw7uvhn1a1JVfaL901RzyOcgJjGU/Lusr6JhoPX63V/LAflxR/ormTnakxZ2wafmTsNV+iOR5yGKeF1kUR46KA27UDxpSbZhD8/ucY3qsirDBmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a2wajhAa; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a2wajhAa"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2a9296b3926so81977955ad.1
        for <linux-doc@vger.kernel.org>; Sun, 08 Mar 2026 03:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772966508; x=1773571308; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jbp28Lbk6sVJbTaOqMSLNsW5OAtKzib3SQxbEdfLuZ8=;
        b=a2wajhAaTClcjaXrqyQqRsSq1BF9/cx6lbw/UaQtGW4z5tF1mDR/Ohx+CCdVO8WoTs
         g390iAtunLU0VF50Lh6QBVpVsyUsJuXeiVFcn9CTAYlwnbXY7om/9EBOmmRfWTMwgcO/
         BoJea2GyjwqAn1VRpeHBqtlrDPnLmjE5YpFG3PubK0AyQe2aW3JhqZDi44BcnDPtdYTb
         On7hvU8Du1aSNPgtaEF7d5N+/m4+w/8/IPHw1j3ZRMRA+fpvx2isUbNzzOhCiwTH+9+5
         u2j/fS9tFqTHlKdlypTx6PqJabR1H3QeALblyM2OaQ4QweOPb0tGgUSt9dSp6AYmwvAf
         e+aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772966508; x=1773571308;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jbp28Lbk6sVJbTaOqMSLNsW5OAtKzib3SQxbEdfLuZ8=;
        b=m1X4N3U7afYKWkXBoNzL64WtSvn8oCpT6MnNvvvpzL4DOf90iOHxwRJxDIrI5LO0pT
         50U61aFNU26NwpkXFU0sc9mKogNnj9cmBICDrSP4D/MOx6fQ6ZJmg1uwmQ72xeMGUwNj
         zmxqjZ5PPXCmUzrbcx7ORc65glLvZpv2oZNfJe7dquZMuTsr0+LKo2UFUVIbeNSwrjYb
         dUUBQdKLrO8BQKn6dDUM0CFKyNuFqR12sbfUNuJqnI9jmjcPQMHuBWNpKw4+rlmrd2xA
         WbvJpWDp+soc6OETpz8QLUitmVUTeVu/au+V89UBO7k8Fvu7UNm7oW2rfdhEKgf6S34C
         KcJg==
X-Forwarded-Encrypted: i=1; AJvYcCXBJQzUHjULofjq6q1naYGjLtCs3+WsNdw8RGJE8GsZYquEoYmzOm7wIoGDzjoKA5zrsLqWZTOkKR0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6PmPr3CteQlc6at7QTR9A3gCKc0a8sHVbLLORwj7kMz8W0on1
	QJxj4Mk469qdMf7SPxus42uJ8M/NilJNIpMjOhiGCwlHnWBk7VAi5bdT
X-Gm-Gg: ATEYQzx7LEeHnbL+elooEJ8LzCT2O6S9YySmzocVm9SK+q/jE1HlgtX7iWqBjfBI3IN
	+eqSzof+wpKTAly1G+epACwR8BDsmL1V4DZeb9kYUZlD7TJ8ju9hBmWyhU4j/up2UhWaKLFfiva
	Mm7xyov3sGLIH9MiCZHK7E5P4APWKfT6GGAEtjgykW6+n4PlZHTkbCYVVT8uSrxqyexQZsLZQIb
	lj0h0kXvB347zXnsH3PqeYymXgib9+c7VFuo20Zy45A12/R+RNGsDsXLWH5kMeQS2AGN2KbXlOE
	AQv47PrqvhsQtMTOIJcFG9MLl31PZUSTYeQEnrGsEtgjISZLLLxpREELCN6O27IBBRA2BMyPVsh
	wBkXVE2QYOGSASRVlSmCZz95mgj19BjY1D2dUmNspXZVQRxce5A9MjaeRH12kIb3HagkNyly4xi
	5PfTYW9xK6Ek7K9j59IfbMvSMpFJ57hXyIdXUZoYGi
X-Received: by 2002:a17:903:124f:b0:2ae:4cb8:484a with SMTP id d9443c01a7336-2ae8244052fmr82375595ad.17.1772966508042;
        Sun, 08 Mar 2026 03:41:48 -0700 (PDT)
Received: from russ.ust.hk (wf121-083.ust.hk. [175.159.121.83])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83e585a8sm77174665ad.7.2026.03.08.03.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 03:41:47 -0700 (PDT)
From: LIU Haoyang <tttturtleruss@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Yanteng Si <si.yanteng@linux.dev>
Cc: LIU Haoyang <tttturtleruss@gmail.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] tools/docs/checktransupdate.py: fix missing prefix in f-string
Date: Sun,  8 Mar 2026 18:41:34 +0800
Message-ID: <20260308104135.9037-1-tttturtleruss@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a f prefix to f-string in checktransupdate.py.

Fixes: 63e96ce050e5 ("scripts: fix all issues reported by pylint")
Signed-off-by: LIU Haoyang <tttturtleruss@gmail.com>
---
 tools/docs/checktransupdate.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/docs/checktransupdate.py b/tools/docs/checktransupdate.py
index e894652369a5..bf735562aeeb 100755
--- a/tools/docs/checktransupdate.py
+++ b/tools/docs/checktransupdate.py
@@ -131,7 +131,7 @@ def check_per_file(file_path):
     opath = get_origin_path(file_path)
 
     if not os.path.isfile(opath):
-        logging.error("Cannot find the origin path for {file_path}")
+        logging.error(f"Cannot find the origin path for {file_path}")
         return
 
     o_from_head = get_latest_commit_from(opath, "HEAD")
-- 
2.53.0

