Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E75E2F5C36
	for <linux-doc@vger.kernel.org>; Wed, 23 Jul 2025 14:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753282024; cv=none; b=ObDDDkJsqu+2LaBlc1cnX+LYWbye/OiQ+l0x8Wat0XbSqUZs+IYR5ePYC/nq3uJVFJyhtEVvwpdZ6HXXZCuTbL5s36Rd2G4ZE1urQbPkeLNDqsDrDFwEAUuks8s54YG3gIo4j0swvuXu06WyKzovguEki3DtPJ1BBgh15L40KUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753282024; c=relaxed/simple;
	bh=kan5N6v9h+6HDmaXzRrpPnNHjduBvdwtdSKyvQ1qoHI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NOWo9Wtjm8pDqDBFDEXzKURKOnzq5/nY0Vv9OX2Fmy3eeEtSOewLXMa9fbolTXixJTzLUuKX8qASKkf16S7BjQK3TQXT4mW9mExA4t4iyszJHYMuO8dR84yHp7M/98Ptpxeqzcmd0EQbs0vEIOjEiTGa4R2hrEsKsZHF+Tv2nU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=KL4Num2E; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="KL4Num2E"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-70e4043c5b7so57109837b3.1
        for <linux-doc@vger.kernel.org>; Wed, 23 Jul 2025 07:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1753282020; x=1753886820; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gy3J9QeC6eXj3cGR0pgjxNs/6APC+1lztNiCJckBgPA=;
        b=KL4Num2ErMDjSve2Ap/UeK84q8BVWlgZScO0wXfZKdHj0BoY/3vpaaEdSO67uTDl0N
         EK+9w26CgCTEG3g4ZZovf6HJlIZvbRroRps3D+HI5DUKgFzXZM9v8Eq4dHlaGBr5iN+q
         uWUiQdMER9jsseUMjfid2gZ61FAjv3HbuJrTeAXbXe9RqB+4DPKuTl9FOQpdXXDx4W/M
         iIJmCFgAbbCNbxiRDbC8sa1dbiUHM6u9TQTOQZgm94jDXnK9D5YifpVCN2jSO+HJbVfA
         DdZuLjPg7krOtEVrVPmqLqlPSeSdzNj7RhlMtOIBTI02bBIkS6pcDsfAl+4TgsDl0iHM
         To5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753282020; x=1753886820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gy3J9QeC6eXj3cGR0pgjxNs/6APC+1lztNiCJckBgPA=;
        b=Td6A4f1eUI6mgjDiKdZRc3flh/iAQzMENN18f+S7WuURBwztIkCQQp0e8UGCWthMbG
         R0Nja85DvGUoM2kTb5BK+H2yBTo3fueK+8HrsYcuY/PwbvMb9+BqaCVlejd0GNX7xm7u
         9BUU/dmObBCsfVcazisIhx0h801KpDQ3FQ9AqxIYNRKmFkOQQoxL834U34wezVn+vMmG
         wnwJaZ6ULK8PFpoMGUKMnPy1e00hmft8YOAX9P9zYTsY8czt0QqeVPo/ZSuNdV5p7RdO
         a2I/QwlbVB9JO8SlXsQwVJLpFGBsJ7e85cuyFY2IqOiHnWb7l9hiPhuzxLbrabYv1f8v
         DWtg==
X-Forwarded-Encrypted: i=1; AJvYcCXCgOjiPn5KpkksyB5WmDwOOwLUETNM2lJGi1o6mM86e5Nk+FzFhoY5iEaHbnw4vmMcWrZAlJUyfuo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSTzDZaBtCx8V9GxPML2CgVpMb8OoZM9XYqjDqnrmrZqpckxIo
	te3cdQPyxZOYJl5cnxjtGV3uqNdHmDqrXE5OM4mfh6sIoCl+i2fIbmONcolAtGcB2+Y=
X-Gm-Gg: ASbGncvhYAX6qd+77x2U5TkyLLmiLCHqwvdetDShaat7oUH2wTo4rJEswYNK8RNU5jY
	25ocAyL7x9zXuQ/0xdHDcVywzTIcJzaUCpGMmGNmsIln+w1xoL4vqoBnz91OePwhztKo51so1sf
	ssBGIbO91QC551hQ2/S27X5uiif8D8/mY6J1NcGqF+Ie0Yd80GPHQVfXUnSQJqMx9jbv8PK7boj
	bFqqBYl66UeOiKOzKxYqXYc2HXQa7OLNTQiF90edRNgyd7iNIPMKNNdE7ew66G8+zJuRzHCr0GF
	Q/kWl2ctLus6zWhqOcgolwrJYO9PS4KrD+EZQ79abpSUKQRjI0G2fGQ1r77RgEnlFD2DcUxNT8K
	3TB70ah70l9La1qO6Y9epy/3IPDefH0GiTLsTNvO1Ps1yll/nm1d2zT3ddBacbi8A/3xcR3ykkk
	6U8woR2h3uU6DB6A==
X-Google-Smtp-Source: AGHT+IE8V9tRE54MK48zflOS7PSA4HAhDqRjtC0UhDc7I1+H3UGz76R3OVDEkrrQ9nCRF167WfSdiw==
X-Received: by 2002:a05:690c:74c3:b0:710:f1da:1b5f with SMTP id 00721157ae682-719b424d284mr43181487b3.34.1753282020293;
        Wed, 23 Jul 2025 07:47:00 -0700 (PDT)
Received: from soleen.c.googlers.com.com (235.247.85.34.bc.googleusercontent.com. [34.85.247.235])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-719532c7e4fsm30482117b3.72.2025.07.23.07.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 07:46:59 -0700 (PDT)
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
Subject: [PATCH v2 03/32] kho: warn if KHO is disabled due to an error
Date: Wed, 23 Jul 2025 14:46:16 +0000
Message-ID: <20250723144649.1696299-4-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
In-Reply-To: <20250723144649.1696299-1-pasha.tatashin@soleen.com>
References: <20250723144649.1696299-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

During boot scratch area is allocated based on command line
parameters or auto calculated. However, scratch area may fail
to allocate, and in that case KHO is disabled. Currently,
no warning is printed that KHO is disabled, which makes it
confusing for the end user to figure out why KHO is not
available. Add the missing warning message.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 kernel/kexec_handover.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/kexec_handover.c b/kernel/kexec_handover.c
index 1ff6b242f98c..368e23db0a17 100644
--- a/kernel/kexec_handover.c
+++ b/kernel/kexec_handover.c
@@ -565,6 +565,7 @@ static void __init kho_reserve_scratch(void)
 err_free_scratch_desc:
 	memblock_free(kho_scratch, kho_scratch_cnt * sizeof(*kho_scratch));
 err_disable_kho:
+	pr_warn("Failed to reserve scratch area, disabling kexec handover\n");
 	kho_enable = false;
 }
 
-- 
2.50.0.727.gbf7dc18ff4-goog

