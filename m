Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792950031;
	b=lJO7+tFtkhVI87w1chLDLAZdupZJfNgt+IDgIiKLcAg3/HepZHq7oJuE3vJsC7/AeqvG
	 rNQrhp1rxm6kAKT87ODWG8XNENs24PygF7xmdeRLJXjUNLwC9rtrl0vHN2K/4XmEZuIjy
	 x/r1KygFFykHA2guGZp8rLcWOUXfUZvXGMfjqc7Wilb7M2ZOsUxP2UFJsERROcTOtSLfZ
	 GVxx3sfBoD3yssX0PZSH/M44BGiBa5qr4S8oysOrwZu2LJEGb5zbCfNHyaSNzTfAXUGNO
	 bVHJPgCKaNyvf+8EQ1NNjd7f/e1rCGkGOr1+yQQ2tDpl83aeF1j2qxVX//Sk18Ol6CQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792950031;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QeCPVU+TT7xZWsohIOPLxgTp4DXEQmJIT8fXCzhydds=;
	b=GjNl44XoNLwaIZuZzivzH4FxaBnqJY244fwI3i/LEnjv6nEUmwwgEOmaxSCRaDe+AYnO
	 YA4AbBJYCVykGKE1NHYLzgroq9D+srxomikI1M8Lgbh8NtuLqP55dO892Dd5KeF8Y3qSo
	 /sbt/fygXJk8rv8W86u5SvTEQKGwVj50T/bI1VtHumj/+m1aKi/VPOBzmXylxvtViltac
	 7XWcr83spSH8QUsrGwAFbULK8SlqJqzg0khBU1lWbiSf6WcqgEINzjjWC61wRfeLYvRwV
	 fXY0tESMWcOA84eSLE33zpoMMEO11a4owhSiLs6jiMXy5ePIRCO5ym7vxbJL1oaz85A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b="YM/+CkA9";
	arc=none smtp.remote-ip=209.85.221.181
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EADB606A32D
	for <linux-doc@vger.kernel.org>; Sun, 25 Oct 2026 17:40:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EADB606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=YM/+CkA9
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5e948e56af3so1085509e0c.2
        for <linux-doc@vger.kernel.org>; Sun, 25 Oct 2026 10:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1792950030; x=1793554830; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QeCPVU+TT7xZWsohIOPLxgTp4DXEQmJIT8fXCzhydds=;
        b=YM/+CkA9ulfPVh7UdymLwZ58eoNdnyxqgcSrRcAKiZQIeRQkyzQnNFBUuFcqvCJqdh
         vIL67wMfo7Oci4FwOxzpYlVf+vr/8Yf2/AwUWobHpzvCevQ5pfWtnty6NitJnBXNKX8w
         cAwQC/Xl6uE/OajcqgrMWyIZ6CLl65q4pwfzbYI6KbQscchvScZBZrCCq4Atd6hOpGKb
         BjgowFvFHSTFFyKCZLkdPgAe7w5f7WRAmwkhDVzcrVG3oZ/1aR9bbm8KzDgBDYlgulkh
         GZiBMmsvS6LVNHluiqwaxi+yT++NCJSQdk8dTbB/24kW4IslEFVHmho8Y50hv9B7/NUt
         cGpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792950030; x=1793554830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=QeCPVU+TT7xZWsohIOPLxgTp4DXEQmJIT8fXCzhydds=;
        b=bqYaqJHIYR5pOwZwZm9r4KmdLIQG6xdLgigW5p4jVKSqWSkdC9wUzgK20bZsMMJ115
         zOSVz6KtMrw7iRQKW7gZtrISq3KyY/I00hrN0KnFYosjX7f3qsOTcaPYQHQVs19AbisG
         AjA2hrLJtK/RYg1t2F0h1BDbJ9/hqqVJDM9x9wjAkqa08vybYK5dkHKRVwXjXivMo73V
         5lK2lzCUMH+827riyw6A2aD1IBYQmUIZ6jnjFaM4mLbhmJ/nK+aB5qX+gEM6uy34wBCD
         4LAwPMd7LTNrJVnYdYti84IHxjvXR969Dljr+EkVSZUcaIB1gUI1zhQUe6I4iL2wXXsw
         q4Rw==
X-Forwarded-Encrypted: i=1; AKwUvBzwRZxgwCK9QQlIuImMRX5hj8RKAJqvPnCi729UVtKUyd35wR/6OzmzhbLwWJjTwr4ClIbJzLWsOqU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKqNT9sBAKNWfwQH0HP2fNJwLyPa1xwrhNnp1kCcPHJkAU8DrXX
	cdLDCFvZTeAw4RF8RN+kaRpcoZVSlLlUmbclb4Q+UA5MUYNRKwZ9q3QDsEKdq+SGlLw=
X-Gm-Gg: AYBFou0cSxx8WiuSFOLvsSrmqIFtuPEM6clzRfpk5lcQVOE9PERhGzx2iGrwOHrq4SL
	Mf+LTpyekTkKnCcYuZWT+8GabZU3EmDbWzUQN5tXBY21dBgSTRjXiTJpJ1VxWpkvQWztfsCeCdS
	oW9ZvpXAixeJErk3TCXcWeOzXXdLheDi22xxorAXRSojCMUuefM2nFUC7ebQfVUcRnMVvaV25mW
	1MmJQg3CbaSgtnjFPmrPTmqr++abptcVKtM7qY0BVrqbPXpouamZ/gt2jn1XY8F+4X/ufgyfgI9
	QMIuvplizTdFA5j1vA3ot4pETSgHtsWlqiS/+1ykVMzfcn0OtLGRDsh+h8PBGU+wFvYhxjKnToo
	oZhJQ8bEX7EgOtyUe/kTDvjbeeiCFD5/W057w5CXr96I+eo1C/BxUl2BkdoxxUpsnr234Ge3YZQ
	c970kCI6VilZWkzYyOe8oyvhQUTrIN2rJVrPVjf+DsLHbfiq3R42M29dE3DJh95wpKVKVXtM6Ak
	V/zlgdmRupmBFIN4RF7IMTmzHq3zYQ99GKF5DFrzYwHRlXyCx7I+1JrFE4Ehr844Ka9MqOQJB5A
	X7j3Nn0grchIs2ZVYOI8dPaZVDWUYHCVDK7RMW/FSxsSq1WG9Udv/obyGFFNM86OTzYAQ9sUCts
	M
X-Received: by 2002:a05:6122:3d06:b0:5ea:f1eb:b9e2 with SMTP id 71dfb90a1353d-5ec232a31a4mr1273841e0c.19.1792950030175;
        Sun, 25 Oct 2026 10:40:30 -0700 (PDT)
Received: from soleen.c.googlers.com.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec234673ebsm5783333e0c.13.2026.10.25.10.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 10:40:29 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org,
	rppt@kernel.org,
	kuba@kernel.org,
	enelsonmoore@gmail.com,
	bp@alien8.de,
	shuah@kernel.org,
	david@kernel.org,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	ljs@kernel.org,
	mhocko@suse.com,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	vbabka@kernel.org,
	dapeng1.mi@linux.intel.com,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	surenb@google.com,
	pasha.tatashin@soleen.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	rdunlap@infradead.org,
	elver@google.com,
	graf@amazon.com,
	lirongqing@baidu.com,
	liam@infradead.org,
	jlayton@kernel.org
Subject: [PATCH v2 8/9] kho: test: support read-only KHO mode in test_kho
Date: Sun, 25 Oct 2026 13:40:15 -0400
Message-ID: <20261025174017.3870481-9-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
In-Reply-To: <20261025174017.3870481-1-pasha.tatashin@soleen.com>
References: <20261025174017.3870481-1-pasha.tatashin@soleen.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

test_kho currently depends on CONFIG_KEXEC_HANDOVER and restores
preserved folios via phys_to_virt() and kho_restore_folio(), which
prevents testing preserved KHO state when booted in read-only KHO mode.

Allow CONFIG_TEST_KEXEC_HANDOVER to be enabled with
CONFIG_KEXEC_HANDOVER_READONLY and update test_kho to verify preserved
state when kho_is_ro() is active. In read-only mode, retrieve the test
FDT subtree, map the FDT folio via kho_ro_map_folio(...,
PAGE_KERNEL_RO), map the preserved vmalloc folio descriptor array via
kho_ro_map_vmalloc(), verify each folio's preserved order in the KHO
radix tree via kho_ro_lookup_folio_order(), map each folio via
kho_ro_map_folio(), and verify the checksum over all preserved pages.
Also guard kho_test_exit() when no outgoing test FDT was allocated.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 lib/Kconfig.debug |  2 +-
 lib/test_kho.c    | 71 ++++++++++++++++++++++++++++++++++-------------
 2 files changed, 53 insertions(+), 20 deletions(-)

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 134b15a44625..74223ef8bd1c 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -3381,7 +3381,7 @@ config TEST_OBJPOOL
 config TEST_KEXEC_HANDOVER
 	bool "Test for Kexec HandOver"
 	default n
-	depends on KEXEC_HANDOVER
+	depends on KEXEC_HANDOVER || KEXEC_HANDOVER_READONLY
 	help
 	  This option enables test for Kexec HandOver (KHO).
 	  The test consists of two parts: saving kernel data before kexec and
diff --git a/lib/test_kho.c b/lib/test_kho.c
index aa6a0956bb8b..29029dcf5815 100644
--- a/lib/test_kho.c
+++ b/lib/test_kho.c
@@ -236,10 +236,10 @@ static int kho_test_restore_data(const void *fdt, int node)
 {
 	const struct kho_vmalloc *folios_info_phys;
 	const unsigned int *nr_folios;
-	phys_addr_t *folios_info;
+	const phys_addr_t *folios_info;
 	const __wsum *old_csum;
 	__wsum csum = 0;
-	int len;
+	int len, i;
 
 	node = fdt_path_offset(fdt, "/data");
 
@@ -255,15 +255,34 @@ static int kho_test_restore_data(const void *fdt, int node)
 	if (!folios_info_phys || len != sizeof(*folios_info_phys))
 		return -EINVAL;
 
-	folios_info = kho_restore_vmalloc(folios_info_phys);
+	if (kho_is_ro())
+		folios_info = kho_ro_map_vmalloc(folios_info_phys);
+	else
+		folios_info = kho_restore_vmalloc(folios_info_phys);
 	if (!folios_info)
 		return -EINVAL;
 
-	for (int i = 0; i < *nr_folios; i++) {
+	for (i = 0; i < *nr_folios; i++) {
 		unsigned int order = folios_info[i] & ~PAGE_MASK;
 		phys_addr_t phys = folios_info[i] & PAGE_MASK;
-		unsigned int size = PAGE_SIZE << order;
 		struct folio *folio;
+		size_t size;
+
+		if (order > MAX_PAGE_ORDER)
+			break;
+		size = PAGE_SIZE << order;
+
+		if (kho_is_ro()) {
+			void *addr;
+
+			if (kho_ro_lookup_folio_order(phys) != order)
+				break;
+			addr = kho_ro_map_folio(phys, PAGE_KERNEL_RO);
+			if (!addr)
+				break;
+			csum = csum_partial(addr, size, csum);
+			continue;
+		}
 
 		folio = kho_restore_folio(phys);
 		if (!folio)
@@ -276,19 +295,33 @@ static int kho_test_restore_data(const void *fdt, int node)
 		folio_put(folio);
 	}
 
-	vfree(folios_info);
+	if (!kho_is_ro())
+		vfree(folios_info);
 
-	if (csum != *old_csum)
+	if (i != *nr_folios || csum != *old_csum)
 		return -EINVAL;
 
 	return 0;
 }
 
-static int kho_test_restore(phys_addr_t fdt_phys)
+static int kho_test_restore(phys_addr_t fdt_phys, size_t fdt_size)
 {
-	void *fdt = phys_to_virt(fdt_phys);
 	const unsigned int *magic;
-	int node, len, err;
+	int node, len;
+	void *fdt;
+
+	if (!fdt_size)
+		return -EINVAL;
+
+	if (kho_is_ro()) {
+		if (kho_ro_lookup_folio_order(fdt_phys) < get_order(fdt_size))
+			return -EINVAL;
+		fdt = kho_ro_map_folio(fdt_phys, PAGE_KERNEL_RO);
+		if (!fdt)
+			return -EINVAL;
+	} else {
+		fdt = phys_to_virt(fdt_phys);
+	}
 
 	node = fdt_path_offset(fdt, "/");
 	if (node < 0)
@@ -304,24 +337,21 @@ static int kho_test_restore(phys_addr_t fdt_phys)
 	if (*magic != KHO_TEST_MAGIC)
 		return -EINVAL;
 
-	err = kho_test_restore_data(fdt, node);
-	if (err)
-		return err;
-
-	return 0;
+	return kho_test_restore_data(fdt, node);
 }
 
 static int __init kho_test_init(void)
 {
 	phys_addr_t fdt_phys;
+	size_t fdt_size;
 	int err;
 
-	if (!kho_is_enabled())
+	if (!kho_is_enabled() && !kho_is_ro())
 		return 0;
 
-	err = kho_retrieve_subtree(KHO_TEST_FDT, &fdt_phys, NULL);
+	err = kho_retrieve_subtree(KHO_TEST_FDT, &fdt_phys, &fdt_size);
 	if (!err) {
-		err = kho_test_restore(fdt_phys);
+		err = kho_test_restore(fdt_phys, fdt_size);
 		if (err)
 			pr_err("KHO restore failed\n");
 		else
@@ -330,7 +360,7 @@ static int __init kho_test_init(void)
 		return err;
 	}
 
-	if (err != -ENOENT) {
+	if (err != -ENOENT || kho_is_ro()) {
 		pr_warn("failed to retrieve %s FDT: %d\n", KHO_TEST_FDT, err);
 		return err;
 	}
@@ -355,6 +385,9 @@ static void kho_test_cleanup(void)
 
 static void __exit kho_test_exit(void)
 {
+	if (!kho_test_state.fdt)
+		return;
+
 	kho_remove_subtree(folio_address(kho_test_state.fdt));
 	kho_test_cleanup();
 }
-- 
2.56.0.307.g5fe7bd680c-goog

