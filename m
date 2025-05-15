Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD43C2690F7
	for <linux-doc@vger.kernel.org>; Thu, 15 May 2025 18:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747333433; cv=none; b=Lq/+jObGE+isKh+uZeNJ9Nfq+Mkm6caz5+zdfV7CC8XqsE42ffrYTRH3jEGb4nx/YpYIjtRS8N81pH+Ljp7W6j2J8ODo/mnenS7tCm52wkqBPe0+ut170jpPujo02NuEKz7dTS6uV5qyXfYYoHnmt1V9knJ9Jym1EF2191lDTiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747333433; c=relaxed/simple;
	bh=YaE0d21aL4ypcSNyRnSQBH6nYjgCRfkHddqKY3G90JA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iSyOTPS/R4hIANq7JSz7wkFeWZJ+s5MDm8kGnwXYPviUT2WOyeRsfqu2MzaRBEju5xhDGz3BScR+9s4N8m1ricA8V0QRRMwAqWFu+hoE0cI8EkYN53v0St/ZVCsFhbypB3iA+QlryEClYaEEVsKRqPBrixlBL8696z99Sk4CqWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=FAoAOoLd; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="FAoAOoLd"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7cad6a4fae4so178296285a.2
        for <linux-doc@vger.kernel.org>; Thu, 15 May 2025 11:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1747333429; x=1747938229; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/UkhatAda5pzqxG11ONXrnfa3++BT9kkRoGoO4mFl6c=;
        b=FAoAOoLd6QYmSjM6SUEUmnwyBnT2AdRAN6cfGWxnEEpuhJYfAdi00tbPkfnLHJMYnw
         NWz+dNniMpXPt4ee3XoPx1edtzkLlkQiV/ThsDEQees28704JfYMgV7M6xk3kYhGHr7Z
         ja0lX+F2xuNJxx+8OopdGGeWkD7xpxUTHyhRDiLUsgYCSB1AsmGrRuJeLIT9JF3eQ2yd
         FwsdNfQ399hycjca8F/hajfpNAElD3MoGZ6N5cwYBZIuvNPqQFbE+en/tPzuB+gbIrwe
         zlMaP+EffIQUCn+tuLLVmPgDDEsOKaTJ7NWrQ/BsvJhQ5WqApOTnI42L7+JUhMimTgBz
         w2xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747333429; x=1747938229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/UkhatAda5pzqxG11ONXrnfa3++BT9kkRoGoO4mFl6c=;
        b=CgOrC3rmHgxFUon1odtNWchcIVb6dHJnTbcU0uqxIF0zNeWbW0LzXF+FsM3vPPxqzq
         cwW3yBEIGeuk3DHwezhJMfVd4pFofTklyz4s6uycglGuY0/sYZj7VzU9V3NdOGX0ddyj
         B96DsMnMFyAOTjzER4tjBzS+FRfozsY73lTZbYw1T9rhPzTthasMd6zWS3TvZU94EAJw
         K0KhTBooZv08/V5VVOb89gCf8bOw3e3UWzJUwcskY+Iagc4UZDOoFJgCZowCeTRGOOBV
         Y4uJDn4uAApzaBoEeyp4qyd3kQAZ78IKnkI1WA/jJTyrv/vhx10Eri45TtJGXYjoqosE
         pLBw==
X-Forwarded-Encrypted: i=1; AJvYcCUv58f7bTx6Dab870UAdb6ttRxdmsYXQzlO8RDqjbYTSD9i/f3ykcZpQKB+07OEF40K8kDPguamczc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuNiIhR/G1XQc0pse1HeOAUBJzGwjdESmwM0S4lKSxmek4AErL
	oNLiT45jwcDaeUI3uTQs+l2Gcd61IMLD/lMPASV9xEYuyCGpT8vOh3Gkt+OgHck/McA=
X-Gm-Gg: ASbGncs7DRSvyU8MoQSU3nGBeMxGXo4P0EA4w3CRYbPHT6BnINuq4JLIQbzDhwKdxpr
	7Q32Ic/x4cQacdYjDHdY5DCdMl/irGwB//4lsI56TjaEFvZQjUI78XvTaEtSXo0MpKc/vwzWL6a
	fO2wNQJSpA+kcC27EscpUxItk+VGRb1ys2FjSsZWCmoBVeUvMHiRRYjfJhEOy19nWtjDfdLHCm+
	PwjDDsANzaxev/5SlaFnlI4eFtgrl/kn9CPMpMJe3NkOHuUeLiJW3xeaUQgHQC4nvr1wn7B9LCQ
	C983QorloGr9seQWIf/9dC2JbBB0QD+flfpf7knSWgyvD4F0p9YF1iZe9BkIkHD9Az2PhoxEnLf
	7BjNQ7lNfaB5E66J0K+XDHOIqwwyY/ZfoP5pnIUW5WdNLyE4KXXEFrn8=
X-Google-Smtp-Source: AGHT+IEMo9czCluXO4G1WUwXTZGTpWwBloBS5Kz3sFDyqt4FQLh+A2ENHLRTo8aoPbEVNVI7zemMmQ==
X-Received: by 2002:a05:620a:4885:b0:7cc:fde8:81cd with SMTP id af79cd13be357-7cd46722312mr74875585a.24.1747333429367;
        Thu, 15 May 2025 11:23:49 -0700 (PDT)
Received: from soleen.c.googlers.com.com (138.200.150.34.bc.googleusercontent.com. [34.150.200.138])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd466fc2afsm18218685a.0.2025.05.15.11.23.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 11:23:48 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: pratyush@kernel.org,
	jasonmiu@google.com,
	graf@amazon.com,
	changyuanl@google.com,
	pasha.tatashin@soleen.com,
	rppt@kernel.org,
	dmatlack@google.com,
	rientjes@google.com,
	corbet@lwn.net,
	rdunlap@infradead.org,
	ilpo.jarvinen@linux.intel.com,
	kanie@linux.alibaba.com,
	ojeda@kernel.org,
	aliceryhl@google.com,
	masahiroy@kernel.org,
	akpm@linux-foundation.org,
	tj@kernel.org,
	yoann.congal@smile.fr,
	mmaurer@google.com,
	roman.gushchin@linux.dev,
	chenridong@huawei.com,
	axboe@kernel.dk,
	mark.rutland@arm.com,
	jannh@google.com,
	vincent.guittot@linaro.org,
	hannes@cmpxchg.org,
	dan.j.williams@intel.com,
	david@redhat.com,
	joel.granados@kernel.org,
	rostedt@goodmis.org,
	anna.schumaker@oracle.com,
	song@kernel.org,
	zhangguopeng@kylinos.cn,
	linux@weissschuh.net,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-mm@kvack.org,
	gregkh@linuxfoundation.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	rafael@kernel.org,
	dakr@kernel.org,
	bartosz.golaszewski@linaro.org,
	cw00.choi@samsung.com,
	myungjoo.ham@samsung.com,
	yesanishhere@gmail.com,
	Jonathan.Cameron@huawei.com,
	quic_zijuhu@quicinc.com,
	aleksander.lobakin@intel.com,
	ira.weiny@intel.com,
	andriy.shevchenko@linux.intel.com,
	leon@kernel.org,
	lukas@wunner.de,
	bhelgaas@google.com,
	wagi@kernel.org,
	djeffery@redhat.com,
	stuart.w.hayes@gmail.com,
	ptyadav@amazon.de
Subject: [RFC v2 16/16] MAINTAINERS: add liveupdate entry
Date: Thu, 15 May 2025 18:23:20 +0000
Message-ID: <20250515182322.117840-17-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
In-Reply-To: <20250515182322.117840-1-pasha.tatashin@soleen.com>
References: <20250515182322.117840-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a MAINTAINERS file entry for the new Live Update Orchestrator
introduced in previous patches.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 MAINTAINERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4fc28b6674bd..327b2084ab79 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13806,6 +13806,17 @@ F:	kernel/module/livepatch.c
 F:	samples/livepatch/
 F:	tools/testing/selftests/livepatch/
 
+LIVE UPDATE
+M:	Pasha Tatashin <pasha.tatashin@soleen.com>
+L:	linux-kernel@vger.kernel.org
+S:	Maintained
+F:	Documentation/ABI/testing/sysfs-kernel-liveupdate
+F:	Documentation/admin-guide/liveupdate.rst
+F:	drivers/misc/liveupdate/
+F:	include/linux/liveupdate.h
+F:	include/uapi/linux/liveupdate.h
+F:	tools/testing/selftests/liveupdate/
+
 LLC (802.2)
 L:	netdev@vger.kernel.org
 S:	Odd fixes
-- 
2.49.0.1101.gccaa498523-goog

