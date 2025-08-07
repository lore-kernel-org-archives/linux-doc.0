Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF5F225BEF1
	for <linux-doc@vger.kernel.org>; Thu,  7 Aug 2025 01:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754531128; cv=none; b=rJ+9L4UlaOI5YLx00At0y84JG5vpXFuzEyaiNuef1cxozq54SWyZqrA6JT1eJsLa21kcqXpA0LEiLoaDByMtAs9c8ombtBgMk+NLejwFtwTtTnF+miIpvAdbPJKiOZ5yJO4+7DxySN8Za5pg4iVikZFiu75byR4VavOBQ2Vlo4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754531128; c=relaxed/simple;
	bh=MQ63LnQeT5I2XWVR3/9t21kTUDqY3sDHkmER0gtcW/M=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iX9OGdtM7929voEy5dOi1bj/KwmqMV9C6BceDzNbc8FczVvDT0sBh9jJaXWkkm5BgHpgdx0xHvaq/mIYO3HXlA9QvndHa0/vGe5n2SBf016zRFRhNfpElcH7ywwWWUchbz4ZkgFqerG1xfjU4Q0xN0P5c2zjO1csYZ+qj3TGd3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=Uun+cnp/; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="Uun+cnp/"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-70739d1f07bso7249076d6.2
        for <linux-doc@vger.kernel.org>; Wed, 06 Aug 2025 18:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1754531124; x=1755135924; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QA/vUYeCxNkI6poJfbjFNlz5+YRzYcbbQ+LvASsW6yI=;
        b=Uun+cnp/XZzGsvmDPlAnMsb6mrtGv5dYDxU0XO8gk/1VU77Obpair0DmYTgs11wixy
         OEvZkYCAJnBva9a70vWXvsavXZ4astcUadDqnQZOlrHFrWk5w/Dgab6t1Yr4bdEofaQJ
         uVYfrN4ICKA63QtOGO+reRstzuz4o5FnyutjFC1wv5COdWV3rkVxWL0cgs1NsXcKUGKp
         yyo8h6baecjst6NVS7cbvibmGvPtTJYKh76QOTQ0rfRGdLrRF3bd+XaJ8DtiYw6wTLUu
         hRlvoi3s4xhmoDs+Coyx8VZC5jj3DpTlml/n/UfO5TUSRPiyrG1fLlah/nfGRkJx0ivL
         hEAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754531124; x=1755135924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QA/vUYeCxNkI6poJfbjFNlz5+YRzYcbbQ+LvASsW6yI=;
        b=NtuNt2RjUlWNpDGVweS8uJHRhW+x1NEm05MC6Yh2cfOj0+7/8kXWGNUctVAndsM9PT
         eFxUm8+n+JDob5bvLy9TT9yo4ofzs95i9NvK7m0CHDmIE7nMg0Kbprx/MH31tDyTs18q
         2pq/J1jWw3YT1dqJ/VkKxM2FS7U2JSQwsKggk5/jCYlzfmY3JnEea/QdB/jkt/NSgsUP
         UZFFBI29+DrERkuRL4mB31FqxP/ekqVxLnRVkpcKWApRoYPp2hpZKMcLlalNu88x0TJa
         MpjNP7gwUshwB3t2c0Ai62t+G6TBPmOxL+XLrhRAZXMclYwp2kuY4IyUmpl+0ENO7Fx1
         pwAA==
X-Forwarded-Encrypted: i=1; AJvYcCXU9GTbfuaADaxXIgai3+y3Q5lvXUDmHZ+O2lx76Di9oT4AxS/ran8LiUNpM9GaeK8yrIMwDL3Kf0Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2lC6D1E11ZCi7wYkCo85pN6J73vMIzwRiR23v9tN3zQDG9Nuu
	8mH5WlNg9ByDHgK3aFa/1FicF6RYWQp2wmNAolnR5QyJQ5/bU7JI0oc3JEBXml4yDZw=
X-Gm-Gg: ASbGnct1HW66bB6zbC67Fkh8jPRdNQ4YGytwHYM70D6zwV//HhwkV2IpBve8AqbtHdE
	Q0wkMI47h1n1kAqcHkTJ630zCuAXjqfY5v90r29Kh6CUqq75QhfHlb5R8pqIOfA0Hd7zPExB7Fe
	anSch4RA3y4irg4ctitUHuUebm+k8jfCCh8nRC3qXjonKAiBekBzG7XUOON7fhH8JNnyKdDTpw9
	tI9NPYrl3aFgaul8CQu3w2uWu0AD6xAjNvrZTGx1AXCjzLtwdvfZhoBfLCllZ7uCTXT5VonIHTR
	9DaFVDXEJURUJ24YJXy4sy2UwoxD6gm5+dWFCGy2sIpdxAKfCQ2HhFHgBt6WV5Ps0114aALlpeE
	XOJHL4w5xfPJvR7asx8324pEAhnjPYXmFNAGx0kuhYcTkIuCBp9O2AY3zNFca2Z+m44FPmyYRN6
	1og4gki3OQ/tNyML34B7e1iqg=
X-Google-Smtp-Source: AGHT+IEmxyIIEpF/zYXpWh7lst20k+6O+/3teCC6bRoX7mK0ce9gFr80XAlcr6QckhUk2jTkrcE1vA==
X-Received: by 2002:a05:6214:27ea:b0:707:3314:793d with SMTP id 6a1803df08f44-7097969ff73mr76803076d6.37.1754531124250;
        Wed, 06 Aug 2025 18:45:24 -0700 (PDT)
Received: from soleen.c.googlers.com.com (235.247.85.34.bc.googleusercontent.com. [34.85.247.235])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7077cde5a01sm92969046d6.70.2025.08.06.18.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 18:45:23 -0700 (PDT)
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
	ptyadav@amazon.de,
	lennart@poettering.net,
	brauner@kernel.org,
	linux-api@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	saeedm@nvidia.com,
	ajayachandra@nvidia.com,
	jgg@nvidia.com,
	parav@nvidia.com,
	leonro@nvidia.com,
	witu@nvidia.com
Subject: [PATCH v3 25/30] MAINTAINERS: add liveupdate entry
Date: Thu,  7 Aug 2025 01:44:31 +0000
Message-ID: <20250807014442.3829950-26-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
In-Reply-To: <20250807014442.3829950-1-pasha.tatashin@soleen.com>
References: <20250807014442.3829950-1-pasha.tatashin@soleen.com>
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
 MAINTAINERS | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 35cf4f95ed46..b88b77977649 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14207,6 +14207,19 @@ F:	kernel/module/livepatch.c
 F:	samples/livepatch/
 F:	tools/testing/selftests/livepatch/
 
+LIVE UPDATE
+M:	Pasha Tatashin <pasha.tatashin@soleen.com>
+L:	linux-kernel@vger.kernel.org
+S:	Maintained
+F:	Documentation/ABI/testing/sysfs-kernel-liveupdate
+F:	Documentation/admin-guide/liveupdate.rst
+F:	Documentation/core-api/liveupdate.rst
+F:	Documentation/userspace-api/liveupdate.rst
+F:	include/linux/liveupdate.h
+F:	include/uapi/linux/liveupdate.h
+F:	kernel/liveupdate/
+F:	tools/testing/selftests/liveupdate/
+
 LLC (802.2)
 L:	netdev@vger.kernel.org
 S:	Odd fixes
-- 
2.50.1.565.gc32cd1483b-goog

