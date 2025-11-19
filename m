Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9390136B04C
	for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 15:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763567147; cv=none; b=E9Pfhi8kek2jWTO2+dnC4Lo+U7gn+IEses3msRHtABLgsbW/Ud2QxSb5QmHdw+/e6fhcZuJvr1AvsC8DNKufInXwjjYbKxWzIvp2IMC5A/Nf565VzPejWdSkJ+pVc/o6aFGZTwdD8ZsRNSD/mM9WBj2Yf55KN4NN9a+0kiyENDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763567147; c=relaxed/simple;
	bh=JX9G2IddNBochneGYWQCKynmuHEMYdz6GZlhqVo2tUg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AS4x8CALOukuZ1z3ZGCbjt5Z/uChlbfjq7ryHXr4U/qVUOOXRx4M4+mAEtTCUrJU0KbA5+emDziNG5+4uWFNpilYZdk9cGkBoHAlXzw+cpi4x+jC2x9MWZCWGv+m9esOpDdcJ8p1td1Wo9MvPNzLRtf3UppaL8w4Qcx9S1wVbHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rAnSdbFB; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rAnSdbFB"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-42b3c5defb2so4677053f8f.2
        for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 07:45:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763567139; x=1764171939; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JjJbR05GJTjvP4eC8iuNclWxk1mMm5RuLT4aWNn+uIg=;
        b=rAnSdbFBCLvJLjGUsRP/QcCxvZOZSBH0Zgq71o4AlrJ42jn5rslMLmFXW2AxVikkjc
         TCFSyFvag+KDqaGb+sGs6y6Xav09Zyp10l3ZPFhA94o2Ri3OzwIj02xzj+m0FuSPn/Gv
         hD1RwrF7bt3oyLRQ5AQJ5JdP2XYKa+DRSBQ8FahHCby8Rmw4HIxn1MEMOVXs7a2B6/2u
         EVKQhhdTnuxBtaFrS4GyTGu+YV6B791L869p/wQHxmNOdi+WqgZOXrqw3s6bGiwy5FTy
         Tw6bwTM4dfJLyCpzNUExW1r8gLRr75kF8oll6wI7RdBr3kTbO/KRsqKSb6aLjhuH5/bX
         l6IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763567139; x=1764171939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JjJbR05GJTjvP4eC8iuNclWxk1mMm5RuLT4aWNn+uIg=;
        b=Dlku56YC1vB0qncyNez67KGvtWoqF1m0Nxin3tKwtDatygYIrTW3xsN0iXfzxVTffU
         bCermOHuVadDZu5LW9PgBEfzL3iYLmd7ONAV4qPqMcjesbbcERbsn9/mLyPpBa5c9MB9
         2YZTVhXZsfRR02SJzwVyC3gVhphnbEgktbAUvcrDrg8zxCOH+aQvcw03ezkA38W4c8+6
         dgS4WUxddw/tIslttqHzJq1QqqBj24PiBdrrKNuUQcnBySm4k9MElP2Tr+nNNl5r8nQm
         TrB2ZicpdHAIF+ShD0LFWVnzMx6KvyV0teYAl0IxMV8rk2IOr4ceK/XBBrGxqsR3DSfy
         EJAg==
X-Forwarded-Encrypted: i=1; AJvYcCUfkm1d0FVluSx2EUT2vEJVJy7Jes9t4yCSWI+7abyxjvc3MVjTG6XvK0VHsj0x+poibqZhI6/PeZg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzi+q4bg1nmmG7jhH1ShvoQTLdf5+kwq+raEt61CYEqfeZDTbSP
	E3vVSso3Y2Ng2hEIhBqvfxBtdOLw6fRh8JjsppxHsNL4W24oXiCQcsl06JRHtltWerI=
X-Gm-Gg: ASbGnct8HMKyTtptHAsiRExXYbxVTDNCIUgufws4FVGYdUBXaGNheaKARs/XFkVEp9D
	3uRySmhocFPXb0hL8TYn5NMaaatgSVuNLle4qT1ILFZ54Rt8a9KA57zt3Y6v7aLiP34lCJv+0X2
	EMpSIAPuILY5VNMo8EmVbfxc7mWwvcBcQzaovAt67AJhtyanHqYqyoq2p+wD37V1bRt0BZETjEB
	Xa8WKbQVPUQs+oeV6VxTCj5xLs8tPx7BVIvnkAohxtHCH2yZ/dfAIZ5f0ju4n1bygu95eyPUjZA
	ZlO/bAizFufPG/g3/gUi4t43MAhcwTpm+sraYaP5peNc/NciznaKYTM6t07U8rwUiB+awjac7LO
	t5+qPCEIgyIxGROGM5+kDFfTjqJcyv4Wrm7e2H2y+g8ZzDOx+gCBHNWD9oV2wqhh1N5h9fnxRpd
	4AhmOtcbE5n30sZgZGdO/FYgcWhtorWg==
X-Google-Smtp-Source: AGHT+IEyhedKwAlBM3EiuchJNsF2kJSsWS7yZo6BNIFhuE+C/7ka0URI4Q7HQ+TXxvH0Bkqj0xsuVQ==
X-Received: by 2002:a05:6000:2c11:b0:429:cd3f:f43b with SMTP id ffacd0b85a97d-42b5933e404mr19233459f8f.4.1763567139371;
        Wed, 19 Nov 2025 07:45:39 -0800 (PST)
Received: from eugen-station.. ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53dea1c9sm38765632f8f.0.2025.11.19.07.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 07:45:39 -0800 (PST)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	tglx@linutronix.de,
	andersson@kernel.org,
	pmladek@suse.com,
	rdunlap@infradead.org,
	corbet@lwn.net,
	david@redhat.com,
	mhocko@suse.com
Cc: tudor.ambarus@linaro.org,
	mukesh.ojha@oss.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org,
	jonechou@google.com,
	rostedt@goodmis.org,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-arch@vger.kernel.org,
	tony.luck@intel.com,
	kees@kernel.org,
	Eugen Hristev <eugen.hristev@linaro.org>
Subject: [PATCH 13/26] mm/init-mm: Annotate static information into meminspect
Date: Wed, 19 Nov 2025 17:44:14 +0200
Message-ID: <20251119154427.1033475-14-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119154427.1033475-1-eugen.hristev@linaro.org>
References: <20251119154427.1033475-1-eugen.hristev@linaro.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Annotate vital static information into inspection table:
 - init_mm
 - swapper_pg_dir
 - _sinittext
 - _einittext
 - _end
 - _text
 - _stext
 - _etext

Information on these variables is stored into dedicated inspection section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 mm/init-mm.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/mm/init-mm.c b/mm/init-mm.c
index 4600e7605cab..6931549bb7a2 100644
--- a/mm/init-mm.c
+++ b/mm/init-mm.c
@@ -7,6 +7,7 @@
 #include <linux/cpumask.h>
 #include <linux/mman.h>
 #include <linux/pgtable.h>
+#include <linux/meminspect.h>
 
 #include <linux/atomic.h>
 #include <linux/user_namespace.h>
@@ -19,6 +20,13 @@
 
 const struct vm_operations_struct vma_dummy_vm_ops;
 
+MEMINSPECT_AREA_ENTRY(_sinittext, sizeof(void *));
+MEMINSPECT_AREA_ENTRY(_einittext, sizeof(void *));
+MEMINSPECT_AREA_ENTRY(_end, sizeof(void *));
+MEMINSPECT_AREA_ENTRY(_text, sizeof(void *));
+MEMINSPECT_AREA_ENTRY(_stext, sizeof(void *));
+MEMINSPECT_AREA_ENTRY(_etext, sizeof(void *));
+
 /*
  * For dynamically allocated mm_structs, there is a dynamically sized cpumask
  * at the end of the structure, the size of which depends on the maximum CPU
@@ -48,6 +56,9 @@ struct mm_struct init_mm = {
 	INIT_MM_CONTEXT(init_mm)
 };
 
+MEMINSPECT_SIMPLE_ENTRY(init_mm);
+MEMINSPECT_AREA_ENTRY(swapper_pg_dir, sizeof(void *));
+
 void setup_initial_init_mm(void *start_code, void *end_code,
 			   void *end_data, void *brk)
 {
-- 
2.43.0

