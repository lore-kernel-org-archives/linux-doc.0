Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5945E1E32B9
	for <linux-doc@vger.kernel.org>; Wed, 30 Apr 2025 00:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745971985; cv=none; b=CK7gHltIjoQnzs2+JtsZJHLCYKRYq09cPdejQp0ZO9wIM54/oXlVji71yLiWVTn4ducdi6HERLb8DSoCFZCYVioehLKB/Yp/rDvAvc4uO9eUPnjzSgsHvaho3+DygTKKpisiLccIffiHDbA4vpU2NPb6ljF2fisZhN385fvxG+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745971985; c=relaxed/simple;
	bh=lNJCo6vZDGuxpwKTO4RG3PWfxMqBn8sro5yfGkfy9yM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OJvSgQ7mc1I72TWmiRXZR3xh+AfmmfcPBU+DohdsbQEJmw7xy1ZON/ox9tY3yNi/tY/+TQD+u5847N6mwgVwfFw1/q1yK08b9nYddaq6MvmkwdifgzcMYbDrwe6tlHG59uLMK0a9Ebl/ggH4ZHrKv0iaNzd5Pf89hBhOFdqQnIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=sW4f88bK; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="sW4f88bK"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-476ab588f32so111275831cf.2
        for <linux-doc@vger.kernel.org>; Tue, 29 Apr 2025 17:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1745971982; x=1746576782; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uawVL9waclaUXznPQCp2ioRqecofoABS91U/9dY2U1M=;
        b=sW4f88bKjbS5qYVqSKwCfepo4FuyiyZ/49rqhAUZxKdF0y0XDgQgFvqVcEcPEPyWQ+
         WBL8WejFJB2+RqaJcXnrpdKHA6XXIqQK6TXM/8KnguLeLHfshHoqpBQArw7VW7d89g2e
         1P6/6MtgITfh+U/AQ/zrORlBl7Xdpyw+dO8BUNM7e0FJZxwQKmvDXx6KVqX6fZIbOpsa
         yL7vVQcxmb/JNlNK4UcFGz1TXx4fSDJX8PTFu1x9CZRIXQRrUs+Nk1egjwhVyYluV3u9
         ldiX8wkkf5pEGc5qjeV3OVHwtEP5S4OInPGibdOdYpK2E4KLtCKw4rM5dBddASd4KcG4
         1QhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745971982; x=1746576782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uawVL9waclaUXznPQCp2ioRqecofoABS91U/9dY2U1M=;
        b=fpQboHbMNguWM7CI/rmwSqocpUd8TJsMFSvX9GhAu92TJI30MLpM122RjctAfwxnCM
         pwQ6Upge9RJpLCJ/arE9bmXxLWFp5TtT1VJwzKOxzgfPbh3iQ4cm+glrRj+OADDkUj/S
         iRI2vnhqi42QwVSMqZvMWvs+Wcg6EXz8IAhmtsrp+VgkIqRKQSrBW4pr+CBgmBbx4RFR
         uf3UU33RJojkF/OnVrKe/fl3EchmOU0geZEthQG6fB1y37SNrLErOG/kbBnwrgVxpeM+
         +oV3Jl2SvniaB4KrD2l3hyApyLjsjI/icR+RO2by3WOPQ06W50NdRQJqrvGYch5prTXv
         xz6A==
X-Gm-Message-State: AOJu0YzPs9IFKl5HXXyMaum+oxWEoCdOisr0YV881IaCKNbn4LeaaVga
	JNanS25vUHLh4MdHd+57UM4lYkKNZaeEw6JE2ztCWK+0bZcT9+qKnA1sCd2IKOg=
X-Gm-Gg: ASbGnctuflDrIcJmKb+nkVrqsHerE/Y772oIvtIuj2FQdxf/7DoCSLcS2QFsdQ6udLp
	qaDb5nk1wHEXzzWzRvwsQLMW1t+oGrP59AtzvrY6mzynhYeMganEUxV4plQKhlAffSJ33/oRO4g
	p5wVz67mx0g29pii++QqaLA62yjdxyBox0xdX8g8BP1d3K2l3/tJxwJJg2WPwlBnKjfvwSrQPpj
	IlGMCk1d0YpbOc0Fs6cJv4AA8EXY1S8Gdy8x4hehEnPLcfuCmEytt+cx5OD2WQPyM7z0cNl+Oey
	IJJmlTdRJy6Y7u2MMbx7PspH8+aCBL800ZxR3YeuA8juW8Ad4nUwC0Oo6jbiXJMkI8maLHBpAX+
	Gu8ECnzs44n9rmxTzXiA7qKlmAkrinL+5LpP2jfI=
X-Google-Smtp-Source: AGHT+IG2vOhCtzXNYKwtzwLvK9oR0zRMiZj20a0FOQ1aA2EP6QhhElNLMZmA7y1EAW5PIcBKuXgyGg==
X-Received: by 2002:a05:622a:1f8d:b0:477:4df:9a58 with SMTP id d75a77b69052e-489e4a8d38fmr11575931cf.18.1745971982177;
        Tue, 29 Apr 2025 17:13:02 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47e9f7a820esm87634411cf.41.2025.04.29.17.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 17:13:01 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-cxl@vger.kernel.org
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	dave@stgolabs.net,
	jonathan.cameron@huawei.com,
	dave.jiang@intel.com,
	alison.schofield@intel.com,
	vishal.l.verma@intel.com,
	ira.weiny@intel.com,
	dan.j.williams@intel.com,
	corbet@lwn.net
Subject: [RFC PATCH 15/17] cxl: docs/allocation/hugepages
Date: Tue, 29 Apr 2025 20:12:22 -0400
Message-ID: <20250430001224.1028656-16-gourry@gourry.net>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250430001224.1028656-1-gourry@gourry.net>
References: <20250430001224.1028656-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add docs on how CXL capacity interacts with CMA and HugeTLB allocation
interfaces.

Signed-off-by: Gregory Price <gourry@gourry.net>
---
 .../driver-api/cxl/allocation/hugepages.rst   | 30 +++++++++++++++++++
 Documentation/driver-api/cxl/index.rst        |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 Documentation/driver-api/cxl/allocation/hugepages.rst

diff --git a/Documentation/driver-api/cxl/allocation/hugepages.rst b/Documentation/driver-api/cxl/allocation/hugepages.rst
new file mode 100644
index 000000000000..195cdb0d64ee
--- /dev/null
+++ b/Documentation/driver-api/cxl/allocation/hugepages.rst
@@ -0,0 +1,30 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Huge Pages
+##########
+
+Contiguous Memory Allocator
+***************************
+CXL Memory onlined as SystemRAM during early boot is eligible for use by CMA,
+as the NUMA node hosting that capacity will be `Online` at the time CMA
+carves out contiguous capacity.
+
+CXL Memory deferred to the CXL Driver for configuration cannot have its
+capacity allocated by CMA - as the NUMA node hosting the capacity is `Offline`
+at :code:`__init` time - which CMA carves out contiguous capacity.
+
+HugeTLB
+*******
+
+2MB Huge Pages
+==============
+All CXL capacity regardless of configuration time or memory zone is eligible
+for use as 2MB huge pages.
+
+1GB Huge Pages
+==============
+CXL capacity onlined in :code:`ZONE_NORMAL` is eligible for 1GB Gigantic Page
+allocation.
+
+CXL capacity onlined in :code:`ZONE_MOVABLE` is not eligible for 1GB Gigantic
+Page allocation.
diff --git a/Documentation/driver-api/cxl/index.rst b/Documentation/driver-api/cxl/index.rst
index e20defe9c20e..51dd0392883b 100644
--- a/Documentation/driver-api/cxl/index.rst
+++ b/Documentation/driver-api/cxl/index.rst
@@ -49,5 +49,6 @@ that have impacts on each other.  The docs here break up configurations steps.
    allocation/dax
    allocation/page-allocator
    allocation/reclaim
+   allocation/hugepages.rst
 
 .. only::  subproject and html
-- 
2.49.0

