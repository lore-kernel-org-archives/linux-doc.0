Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9097825291B
	for <linux-doc@vger.kernel.org>; Mon, 12 May 2025 16:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747066929; cv=none; b=QJCNJJOMaP+LNvd4JhRBj3jSRSL3s3m7De4Aw1lMptjt5Qe9iBBskw22TYsDeDIzZ0Sh5EqvRJh46WRml+LgA6UelZ0rLMSYYQXjM7bVPdSMSLcB/hSpSNgYJY2ScbwJOECHI4v/Br+WNbOdtEY56aKhT1cOxAOxNEYJl5l47gE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747066929; c=relaxed/simple;
	bh=02rFqC3gSUB4Fy4+GT/QyZr7jHPjwxLz9IoPedteAik=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ShsQQoUjoX2AcDly+zsVg/yEUboinLP63jweymoFyYqIyf8hT9j0JjB3mQqhsjiiM40a1P6BbUWPOkIF/48R0pWoKuHzxx1nvwV8Vf+zl8XQRRSfbIq50Sc1f5klAxTtCuOr4MmdoDRi90Ry2kwWyrAaEhw5GZ06sJri9quxdXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=SbIsS6Yw; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="SbIsS6Yw"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4775ce8a4b0so83326811cf.1
        for <linux-doc@vger.kernel.org>; Mon, 12 May 2025 09:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1747066926; x=1747671726; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gsjZ8+vqh9tLCwEMgliXk7JRqYeLc6j1GH7rHKcC4Fk=;
        b=SbIsS6YwW57XJuyeYgmxF9B4fxxJ2WETuQcFS/bsiU0dBMwUDvc7stG5P1Y9szPM6Y
         Ocu1QSlVumnQVcUHIAP3Jc4wJHopKP5uRZexOBBPxxEnoYLeyz90d2GEeiCHJPZtOb65
         CRbwYauS8+xL9Gorb/zkDEg2fjRnkFTnR+Spc6tMjDEIyA7Hxibj6ov+7pYtplXM2Xs4
         a+3nDfA0G6W5+YI5R5pP9Hcn2xZVO3jWp/Anfvz+ViJUW8ajiPqPRblh7Y04XvDw1shA
         gzjgSSAPvLWnhJkDjaNkr28M+rr7jp5hyceGpYOUsPuG9+WKbgBRIV7ypJo8KW+kkqrB
         rZuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747066926; x=1747671726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gsjZ8+vqh9tLCwEMgliXk7JRqYeLc6j1GH7rHKcC4Fk=;
        b=uzSR0LODEDb70BZL5cctytYG2tef5hBqSiu+MPcZds3olCG5ij0ywYLyLGrK0kVz1i
         qUJKzXfz0zpCUJInD4TuCLkiWR07ciZgs6GcNk65hSvK7jfAtci5Hb96ZUivJf/lctje
         t6SRrbrdphVo7bOqu2p3QqPL5rr8prz1BqSD/vO8o8BJ89+WwHABJuQrXCLEw2aUg+bN
         N7TfALKdXlqbwQCMQNcd7tGhBLVS+/a4pA6z2xl3hn2O2zVJ9Gj6BOwqvz+b/bmklLkE
         fG8EwI8z0qn/apRyjq6nXI1GSVh9Y7XexVpdcfqyDHHLnh+EjhtwnL7rf1DAQGwiN1nv
         W2Lw==
X-Gm-Message-State: AOJu0YwPkL86ZPEgtBREpHxPWy0GjIE9LDZu/SfG0rfEDziYJEZMPRbt
	MSBMT7662ER4L7sbIzPzQx6wWtMzO2q+uw90FYzPOBsHTgkPVg+Hc1SKK4AApbM=
X-Gm-Gg: ASbGncu74RehIDDso4C/Svk78A2Bm8Yx4z+UkMyZsH86RN02ztWIlo7Mz8ra53yYNi8
	P2Faq3051OuCQOtL8L/UlQ6miW9v3OH06FXV5ke6aXtPLhDgE2LmwXG+FEcEOElheZaM3ZeIti8
	XVUAJESLYnACsr/cY8TTOgpm2Au/nbIE9FRjIAQLm3CeFxFaUrE8lLcRgYXObX7gYcKaob8tclw
	83rovOQkVtM9mb6L8gl3gp6oxUx3UrOVYuIjgc2QRb3m3nKegUrTSB4OI/IE7Zo4R5WO2eGdzjf
	cc31h+YiKX3u43UK3I3oRQByLdj+0l+jBIkd5TjdziNBF7CLeofR+BGH0aO0+pai/zPXS6pCqiN
	a6DHg4kG3ROABJBsz/qdJAK1o8gLKs/MJPGO9
X-Google-Smtp-Source: AGHT+IESCJ4wxgoeogGabJwCYGcV8hNihMeEX8lTGFo0c9q1TtRsQ3SAwLcPjqupzQu+Z/KuxiouEA==
X-Received: by 2002:a05:622a:110c:b0:476:9377:17aa with SMTP id d75a77b69052e-494527fd87amr209927431cf.52.1747066926366;
        Mon, 12 May 2025 09:22:06 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-96-255-20-42.washdc.ftas.verizon.net. [96.255.20.42])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-49452583961sm52461791cf.58.2025.05.12.09.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 09:22:06 -0700 (PDT)
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
Subject: [PATCH v3 16/17] cxl: docs/allocation/hugepages
Date: Mon, 12 May 2025 12:21:33 -0400
Message-ID: <20250512162134.3596150-17-gourry@gourry.net>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250512162134.3596150-1-gourry@gourry.net>
References: <20250512162134.3596150-1-gourry@gourry.net>
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
 .../driver-api/cxl/allocation/hugepages.rst   | 32 +++++++++++++++++++
 Documentation/driver-api/cxl/index.rst        |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 Documentation/driver-api/cxl/allocation/hugepages.rst

diff --git a/Documentation/driver-api/cxl/allocation/hugepages.rst b/Documentation/driver-api/cxl/allocation/hugepages.rst
new file mode 100644
index 000000000000..1023c6922829
--- /dev/null
+++ b/Documentation/driver-api/cxl/allocation/hugepages.rst
@@ -0,0 +1,32 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+==========
+Huge Pages
+==========
+
+Contiguous Memory Allocator
+===========================
+CXL Memory onlined as SystemRAM during early boot is eligible for use by CMA,
+as the NUMA node hosting that capacity will be `Online` at the time CMA
+carves out contiguous capacity.
+
+CXL Memory deferred to the CXL Driver for configuration cannot have its
+capacity allocated by CMA - as the NUMA node hosting the capacity is `Offline`
+at :code:`__init` time - when CMA carves out contiguous capacity.
+
+HugeTLB
+=======
+Different huge page sizes allow different memory configurations.
+
+2MB Huge Pages
+--------------
+All CXL capacity regardless of configuration time or memory zone is eligible
+for use as 2MB huge pages.
+
+1GB Huge Pages
+--------------
+CXL capacity onlined in :code:`ZONE_NORMAL` is eligible for 1GB Gigantic Page
+allocation.
+
+CXL capacity onlined in :code:`ZONE_MOVABLE` is not eligible for 1GB Gigantic
+Page allocation.
diff --git a/Documentation/driver-api/cxl/index.rst b/Documentation/driver-api/cxl/index.rst
index d3ab928d4d7c..366faf851fc7 100644
--- a/Documentation/driver-api/cxl/index.rst
+++ b/Documentation/driver-api/cxl/index.rst
@@ -47,5 +47,6 @@ that have impacts on each other.  The docs here break up configurations steps.
    allocation/dax
    allocation/page-allocator
    allocation/reclaim
+   allocation/hugepages.rst
 
 .. only::  subproject and html
-- 
2.49.0

