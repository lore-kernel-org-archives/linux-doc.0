Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8209326BD9C
	for <linux-doc@vger.kernel.org>; Tue, 11 Feb 2025 15:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739286802; cv=none; b=f8q/BZX62eESfqcfYvUCZq4fTSK/8WvL1T/HXSc5YzjofdyeRdTnYlAwyKpLrnACZR2/i6CQfJNIarTTEjoDhHQ7x4b55WVaQXXYQAVgniOWkrTbU48XyHxfILS1snFVMr6eG9TTb3plB/t6GyufuGMVA7tnOi/6S0jZfa5UvkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739286802; c=relaxed/simple;
	bh=mUqIrnwhWNS1eUYHflUCG59cMmLG51YBJlJc2kQt3xQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j0dBysdT7/v9B9jB9swiRQtYOs5I1chG3TTFR89XeQsHbPS19HXUxbA2fqNp7Zbvb93JeqQJ9K3/uUIDbNySKoOM9MeWEiDNnWMsyZQp3bfSDcTM7+6GKh3xY3AAC43uZJ0SXhJM1qlUjTt41gdv4SxvVwZmXbDOe7tZ5/V6QYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D2V1cLiJ; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D2V1cLiJ"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-21f6d264221so40173725ad.1
        for <linux-doc@vger.kernel.org>; Tue, 11 Feb 2025 07:13:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739286801; x=1739891601; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XDoWjnrtvpJSvgutaR7cMhwzc6WeB6ixV6uyeXHs8hE=;
        b=D2V1cLiJLM+a419IVGvSckxu13anRCQLMdP4BgRwuqhBDPgtljpgTqtb0xjiDALnTR
         Jc1ovL5M9SXMXBhGDxxtMaFAn+24jvly0v915kJXTeLb5UK3pvoI8IA3mNshL5wsgsIn
         /qCq1hjGw6Pp1ir6hZUpvr6b6Wc3l4wH+NLEN/HhKWSRO8Y6VaxJvUhNYPJokqIa5FEc
         q1cQDWeNg/dYbm4FFpZ7ugpXt5MxJ1WSMKd8xOsQOamiOEQ5UzOw4U8md6cSZiI5+T1I
         GcXPZkdqXs4D4JTQJo7fQFwdxabVU0wKucXUsDAVbzXuraYDpbCaQnr/p46W/RWqT+Sl
         3vxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739286801; x=1739891601;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XDoWjnrtvpJSvgutaR7cMhwzc6WeB6ixV6uyeXHs8hE=;
        b=EpjwS1ECdpBbEZE2ZSRPjBRX7bGXXoGegNy/TY62L5AoSpXewJOFNG4xv8bcM5J1bb
         5OkKbW/NtWIzW6zOWRAgkajkJDYXMeEnyGP+baMEqg0IwpftVnBxAWCNVSTraz6qEXJ1
         kKhx8zKCNyK0fzaicQPKeQZGH4MJCwy4MX8npZq3QHKKuVUDfNHp8OAEJh+FXRLp8FKd
         AzP0Q5P6DZDzGBYGJUSE+BS23HYM6eVnRCa2wrl0Q68eiUvJOX64JwZ3MSyehEZc80lA
         L6h0zrJPrUXcCJymAawEAR23PSY70g8mN/gMA4UIA7ju9iBhju26NbtN0SFcoFjFEi+4
         8xaw==
X-Gm-Message-State: AOJu0YwOpsW5UYx/BGhZCfa4vmWknXiKVUz7D2reMObG3X3uRaPlpJAa
	KqCeUuviE6YZ6GTM13F48nlGayIhgJvfu1UpSHLooiHRywBYUkLb
X-Gm-Gg: ASbGncuV1l/kRdBR79mXF45pHZSkhA8sgdqF/8WdnzsG0oJHqGrGf9nBGLauGzdTeGx
	iYxcRFmzW7MHAiuVRH18NPm4d3YyjNi5cwnA2NX9Fc0KUkjq/lGKK9So1XcZ6yp7oKgkhtcnSmx
	NUrCj79QT+7eZoLNvK8E7g6aVTw7eRa4zM/UrE23HwcQ4kCfpsYJmmZASMqKxKWtawuNgCCx2WU
	nZcBDq8uUU90vuM+8AxNgpS2dnHxn/rMlrczshwA1QxSTpu2D/v4ytUmH6CgXH6TwKxnu+/ido5
	IzsDn+S9wx3yv9kY3/ddXMBU2PFIEEidKnk=
X-Google-Smtp-Source: AGHT+IEuv7eUQ8yR90LRpRUAGfXhBY9tNeRzxwx6R+B6uQigDl+NYqz4305aYYtYC6v3YGkWr4boLA==
X-Received: by 2002:a05:6a21:3405:b0:1e2:88b:4f1b with SMTP id adf61e73a8af0-1ee03b662f7mr29612062637.39.1739286800702;
        Tue, 11 Feb 2025 07:13:20 -0800 (PST)
Received: from forest.jssaten.edu ([210.212.85.151])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ad55b80564asm2643973a12.65.2025.02.11.07.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 07:13:20 -0800 (PST)
From: Rohit Yadav <rohityadavconnect@gmail.com>
To: skhan@linuxfoundation.org
Cc: linux-doc@vger.kernel.org,
	Rohit Yadav <rohityadavconnect@gmail.com>
Subject: [PATCH] docs: mm/damon: Fix spelling error in monitoring_intervals_tuning_example.rst
Date: Tue, 11 Feb 2025 20:43:13 +0530
Message-ID: <20250211151314.147912-1-rohityadavconnect@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Corrected 'multipled' to 'multiplied' to improve documentation clarity.

Signed-off-by: Rohit Yadav <rohityadavconnect@gmail.com>
---
 Documentation/mm/damon/monitoring_intervals_tuning_example.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/mm/damon/monitoring_intervals_tuning_example.rst b/Documentation/mm/damon/monitoring_intervals_tuning_example.rst
index 334a854efb40..33eaa423adee 100644
--- a/Documentation/mm/damon/monitoring_intervals_tuning_example.rst
+++ b/Documentation/mm/damon/monitoring_intervals_tuning_example.rst
@@ -36,7 +36,7 @@ Then, list the DAMON-found regions of different access patterns, sorted by the
 "access temperature".  "Access temperature" is a metric representing the
 access-hotness of a region.  It is calculated as a weighted sum of the access
 frequency and the age of the region.  If the access frequency is 0 %, the
-temperature is multipled by minus one.  That is, if a region is not accessed,
+temperature is multiplied by minus one.  That is, if a region is not accessed,
 it gets minus temperature and it gets lower as not accessed for longer time.
 The sorting is in temperature-ascendint order, so the region at the top of the
 list is the coldest, and the one at the bottom is the hottest one. ::
-- 
2.43.0

