Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A46299959
	for <linux-doc@vger.kernel.org>; Sun,  3 May 2026 10:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777803367; cv=none; b=lGNQRCx3dU0UhgaJZMHPwVkzMLXicGj0cua0To1eUt1nIItj1NZhqaAvh1ibneq0frs6JNRXDaoPOT23+jrkPjwTQrBo1MAFDgkCw5f5QxoIthLkRc/M+AczhRM9hWdGmSbHq8lAeYjklD8DLxpaTaEpGCkdjFeWrFG4/klfn2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777803367; c=relaxed/simple;
	bh=9EMxK9OalY8fJMjFtb28mqdI0He9EG/3ZVZngEVDCvY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LsuTiq+5KYsJOGH81xv3swhezlUrCj9Hd4h1bpqp1K8LcqE7JdX0hkUI25KDxyNYrf9SKdkPU5OxHzec/pQY20mz+S55pV1IFcIR35b0FqfTAaRRGlF2W03Bnt0zFIIUqO4OotE3Dy/0VlmOY358BxUcr/IfM8TeZg5jMV/1Zuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BjEq0Vfh; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BjEq0Vfh"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ab077e3f32so11593365ad.3
        for <linux-doc@vger.kernel.org>; Sun, 03 May 2026 03:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777803365; x=1778408165; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S+apMOgQJGL/Dg0EAkgqPrTSh2luK0OyGBeLibjvZ/s=;
        b=BjEq0VfhdNYgsE/5dpKcttZF8GUwnim5ZGDrIRLy1iXr6IEcC8MyOCUeWVCFMaZmBw
         QEIlcY7RFdyxeN7dL39V2GbUraJIh2PcvrBV6zvileNhvocGw4BmoreiqCWWqjal/6VQ
         cw2xH2ZuE242lv2KSV7kvkWvpXhddJtLhcGbIT234H5ii9ZIVHimYH5ViCP87u6L/9dC
         4OJcEHWKM8PNE624skEvhIsycwLOY68ALmoqcT3hD2A/z3N4rHW1ofGmAya9z7uukaz/
         kTOeKOVYJfS+7PkgKmn/RP026WjA15kLXsRnxYTiLSW3hsOV6H5wBRuDuCTySIdbv46n
         DoBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777803365; x=1778408165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S+apMOgQJGL/Dg0EAkgqPrTSh2luK0OyGBeLibjvZ/s=;
        b=d6BI/THuNmqmFsXKzCjtpjkxFSvvqo3UYNY3TBEKj+upiwNZQNI4SYvbaBH3Y0vFxw
         FLv4fzSKaEXmXN50WcVrqa2DFHBFy4tvZZJzCNXdN9IykjqaMzp6fs5wsz5ooUqcsfJU
         AzLeYCUswBd4FflAO6K7vSlgdE5M9F8A/RmWLUqNt+4Eb48goDGWiT0r4IKWlzTFMjH+
         804Ssg/Pt/qkNpAfzmp8N1Y0Yl2fI5iS3Fedvuh+e7Hhv/TnptIgsSSGS+CLakSFUMB4
         0zeX7yvuvGogOH4S3c/L0EGBhDPrZXHxpfxdRQi1GP7qJCIi/EmCQHR2B/onfLgU2a+f
         /t9A==
X-Forwarded-Encrypted: i=1; AFNElJ+qsQnb/z5ZESaRehysyzUbn1KFy8QNetE1LszV+ERHM69Cs95zMhG/G3gS8+taI61M55+1h3PrJdw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6KM4Smd5KWIWiu47pAA7aKzli+BqJb1golofvgKvSSF4tuJI7
	BGK7BxKVA2cwdBsiwzUlPbnNbUBidabmcw/b9dzNOQx7Ojn3j1mtCaaX
X-Gm-Gg: AeBDieta/HuJuFMJh+5iyoV0SB9nZWLGWP3+5+SF8z9wCn8rPThP8Z1976s/a+mYz4c
	3YRqlIWDJ3Y6e4ObRM1KjcYezEgGIDoK05zq400WU5fxpwBbjyMw9iu2CEeXcEZ93KHYp0r7yzb
	9WY3g256oPlAlHNFcACF02xsHz0+AipQA46GCFfL8FpGxQRVA9GFIWMhRyIKDqsmAWKjzipoNKv
	Mbwi26RF46Qws2oMGHk8Sk8u4tfp6K2VU6EXcRD5u9mxzp/OMoQ5HmiobHEMOhPrXhBmBVUllyl
	pp8kScmTlPLwTanVaj357A0ZaYMdgvQv51+fYhW62mmwXBXyXNwu1mr6+XWn2jCgo+my9pko2on
	uwvdOvl1Tyog5+T7ggMNvbbycwjpFMKToiY1pWdUYnKeoSWn5VgyJtD91pv6iqt03MhK7jZJcup
	9gwqWIFh487K2VO1c+Ql8uZsL50g==
X-Received: by 2002:a17:903:9cc:b0:2b0:61c2:8e83 with SMTP id d9443c01a7336-2b9f25df47dmr52626995ad.20.1777803365135;
        Sun, 03 May 2026 03:16:05 -0700 (PDT)
Received: from apt ([140.123.97.23])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9caad2bd7sm81073455ad.36.2026.05.03.03.16.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 03:16:04 -0700 (PDT)
From: Cheng-Han Wu <hank20010209@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cheng-Han Wu <hank20010209@gmail.com>
Subject: [PATCH 2/4] docs: admin-guide: fix stress-ng command examples
Date: Sun,  3 May 2026 18:14:27 +0800
Message-ID: <20260503101429.254394-3-hank20010209@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260503101429.254394-1-hank20010209@gmail.com>
References: <20260503101429.254394-1-hank20010209@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The workload tracing guide includes stress-ng command examples with a
stray "command." word at the end. This makes the examples invalid if they
are copied and run directly.

Remove the stray word from the stress-ng example. Also use "--" in the
perf record example to clearly separate perf record options from the
workload command being recorded.

Signed-off-by: Cheng-Han Wu <hank20010209@gmail.com>
---
 Documentation/admin-guide/workload-tracing.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/workload-tracing.rst b/Documentation/admin-guide/workload-tracing.rst
index 22cb05025ffc..43a3c8098654 100644
--- a/Documentation/admin-guide/workload-tracing.rst
+++ b/Documentation/admin-guide/workload-tracing.rst
@@ -271,7 +271,7 @@ exercised:
 
 The following command runs the stressor::
 
-  stress-ng --netdev 1 -t 60 --metrics command.
+  stress-ng --netdev 1 -t 60 --metrics
 
 We can use the perf record command to record the events and information
 associated with a process. This command records the profiling data in the
@@ -281,7 +281,7 @@ Using the following commands you can record the events associated with the
 netdev stressor, view the generated report perf.data and annotate the output
 to view the statistics of each instruction of the program::
 
-  perf record stress-ng --netdev 1 -t 60 --metrics command.
+  perf record -- stress-ng --netdev 1 -t 60 --metrics
   perf report
   perf annotate
 
-- 
2.52.0

