Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2AC02F5462
	for <linux-doc@vger.kernel.org>; Wed, 23 Jul 2025 14:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753282021; cv=none; b=lIKhGr3dYvnR5MCh3A55+RfF7XxY3iDKcyIx5WxhtQDt3q/Q3oZo0WmCNjkA31xrUEU7fGEgHT2TES2P1EwCyqTQE5nBLTg4y5IPKHiDBsL/1h820WvldnIQv+nVreNigZw9/RkVkPQZRDCLqEKGcnVtBmXhl1MvvDvU0vaBIBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753282021; c=relaxed/simple;
	bh=sJLDn8ryoW/ov6UjZZGTTudXv5WHl8/v2Z5ZbPyJ1x4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BkHQydkFbOJn+YpA8c7/0qyPe/GfvsqjRowoVh/fRKTP+zHeaczC/HVhJ+iwHek/Ai8XP4oQRTeHpmGA3TmVNJWsaHQBNYAkPct5eDl+nZxcyoUZwjPgRgm28HxPscI0MtqBk4rJEOu8KGw2lyHquynRHfVFchP24wTcPUbIPzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=lLeh4OIW; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="lLeh4OIW"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-719c4aa9b19so1152797b3.0
        for <linux-doc@vger.kernel.org>; Wed, 23 Jul 2025 07:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1753282019; x=1753886819; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n7cl1P/nffEHtPrwqwqBj2n/TmbnAXjnzD/OU22eOOo=;
        b=lLeh4OIWCBKjqs1N2TriFDuB+ubYYiseni13/mb49rqAEhv2jLPKXb3Q/Mt4rf8D+Z
         7yJwP/iH0iEperDTE1UJelAthrHwmUaZj5cFcEBvnG0IGsmcnsZ4WAvZv7geAbLGv4vE
         fmMj/N8K1oy3jNEltDSq/BUyPW75NEC+xgiUamE4ezJO2QZFp/l1vZOkUu96jPBefpci
         x/ghPi6RS0ioS+uuVxBn1m0yOsq9yXXNmipUz9VUSxh1x2ahltuhH9zXtrxah945fb6q
         9soOx0N9pwYeBRyFHMoAuRsRWpIIyt7NidN7JD7l97y2oc7p4deeBVm17WMsi+ciOXrt
         8etg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753282019; x=1753886819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n7cl1P/nffEHtPrwqwqBj2n/TmbnAXjnzD/OU22eOOo=;
        b=WdiUXDQ32tXMrESUabLY1hkbtn8aixNnW9nPTRYiKfPrgIetA3+HDuGI9kMuU7hMiW
         mpq6PND+QOfOdCYC0STNllV3/cZo/r3LTBkjNYgqqqwcvqa+Nqk/Ncs12MsAFklwPIsT
         3vKPAdZEhLvA5e/uGUWMKnjYtx0490dkhMZ4QmHq/VvdT9Oh+IpBPyFVwvOskN2Bx01n
         KvtoiVlzMPZVKygh8xc/n6udR4i3GTwPWh8wi2HnQ3L2cVJZ7OXiu2vX1NH/IkIcKH28
         8DPfzq7sVq5YzJx7/1p5r7Q9X3gFsna7/QhKcBZ9ebg+E1nryt0/xA22s1PnCic7x6ok
         55aw==
X-Forwarded-Encrypted: i=1; AJvYcCVUxt+xR5CwSB0lCWewSOwLP/RO48/InHeU31t0ERyArh+hOao1CAScF7K/bq6qwcG96MewdVn96+Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQsnaaR7HgYlpgcB904ns2tHnoLZVqfJGR2ymC2GHZc4JP2dMy
	7zHg7w6ZFEA5Fi9iJoDbCy//cdd8dw6peFQXWOoJ2YZHX6hxOazqFAtAj7iStIB1Wpc=
X-Gm-Gg: ASbGnctIeWKfU5IcZra4nY1JdDNi+ZiBKJwx7evoIe3wRBDgvb9xFE1fSCWUivRdIPj
	ipaBfeFUjG+vRUAp3hyhIaSDRIfVRrXIVi21FEp1SQlMWK9NPjTnnaajYhBJL8ZFchrLm87/H5Q
	kQDn1U3oy4FKNL9w57bZRzYO8QbUEH3nrvMN6J5w2KDc3nhQVReqrrN9sJm4Kvbmo+Jymiv13Zq
	hs6PbFSyB9Oqp9EC/s3nilyw2lNYPbLdYTbDvCZoeGHSBgcI8bpOLd5SV5Hs4xD3cwgL4uPZ5tV
	wHAPvxP04+TnphZH/qOXwF4Pufo3t1ZKg5JIOP00dHu589HWJptfnzIk+EUPk6I7Z3Bg973xmOS
	U8zE86EHP4TPFBOQ6LULRNIWfNG9ao2P7PE8COd/EyEeG32qTbjPf5H9IDMCx57NmNhnmjSWxwT
	RCVDTJJ0ikub1nIA==
X-Google-Smtp-Source: AGHT+IE6ehQOayyo1lb2cZBdo6W6rK2fNueePB1JRBmEV6kcBUnmTmWNn0MIzxo8F5fZ2uNGvf14yw==
X-Received: by 2002:a05:690c:490b:b0:719:4c68:a6f8 with SMTP id 00721157ae682-719b4258512mr43723377b3.32.1753282018494;
        Wed, 23 Jul 2025 07:46:58 -0700 (PDT)
Received: from soleen.c.googlers.com.com (235.247.85.34.bc.googleusercontent.com. [34.85.247.235])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-719532c7e4fsm30482117b3.72.2025.07.23.07.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 07:46:57 -0700 (PDT)
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
Subject: [PATCH v2 02/32] kho: mm: Don't allow deferred struct page with KHO
Date: Wed, 23 Jul 2025 14:46:15 +0000
Message-ID: <20250723144649.1696299-3-pasha.tatashin@soleen.com>
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

KHO uses struct pages for the preserved memory early in boot, however,
with deferred struct page initialization, only a small portion of
memory has properly initialized struct pages.

This problem was detected where vmemmap is poisoned, and illegal flag
combinations are detected.

Don't allow them to be enabled together, and later we will have to
teach KHO to work properly with deferred struct page init kernel
feature.

Fixes: 990a950fe8fd ("kexec: add config option for KHO")

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 kernel/Kconfig.kexec | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/Kconfig.kexec b/kernel/Kconfig.kexec
index 2ee603a98813..1224dd937df0 100644
--- a/kernel/Kconfig.kexec
+++ b/kernel/Kconfig.kexec
@@ -97,6 +97,7 @@ config KEXEC_JUMP
 config KEXEC_HANDOVER
 	bool "kexec handover"
 	depends on ARCH_SUPPORTS_KEXEC_HANDOVER && ARCH_SUPPORTS_KEXEC_FILE
+	depends on !DEFERRED_STRUCT_PAGE_INIT
 	select MEMBLOCK_KHO_SCRATCH
 	select KEXEC_FILE
 	select DEBUG_FS
-- 
2.50.0.727.gbf7dc18ff4-goog

