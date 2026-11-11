Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794383580;
	b=oZkRVMhq2X4ANrP82iO2odVN6JJlw8X8r3SJ8ZRnvfaNlMFdGm2hto2vU/XRptJjKLaU
	 gfI6cQbY/P/3/dy74R1+7qwCTtmFWTUcNf4UdkQafpUOPJHL4kSWHh3hj8gWhe4+0VKZB
	 Ce3Heuly+2LhJCKeFNJjDNn3WHNt7I16ubcdPLvS0r9iajmoSOR+2Vr26EeZxdjWkFqGi
	 Yh1wyDPfSEAdCChCqxlBs2T1twvA+Ii/t0PtTRW/RYzA3QuGJkwHv2H+55K57HN/Ngi++
	 EBeSv2bz2V4qq+jT5FNJQE+9TeaCO+PgcKjnhsbk+K3UtQwJdqGYtXy1xOTR3v/n6hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794383580;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=HqU3Pl0zqzkcuaNDEwB/Ax9fkH+ammw/qBuPNlSTruE=;
	b=ocY8BPvvKesDY4bwWcMvIX7nYv+HNb5xrRGpr9VR/iCFggPNXadSLbd6SgPDAfDo/UjY
	 WNf6D2QZAZXjquS11KcUPL9wMChaW2AGeuzwBZ5HwlTmEGUcZQzjdqvtW6WPRkaPww9vt
	 WkpXDlqBC8hAnQFBfzRQSq7t8w+1sPi956WTR0hFjSKgukxb3hS+vZuwCRdSLeRlhxYWF
	 gMisZCoOU/Rd6qhtpX0c0pKt4vT/3hw6oxthbDINnsl3/Nvl0wn9+YJkpsOtBNQC0bwt7
	 44ZKqMSEEwIqqoDPaDwD8vFfexon686pHjR7HuMBovotKr7LLQ+OQG0oGlJWuFwTnkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=i5l4IQz0;
	arc=none smtp.remote-ip=209.85.210.177
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC459606A31C
	for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 07:52:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC459606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=i5l4IQz0
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8a9f9473029so2364337b3a.2
        for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 23:52:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794383579; x=1794988379; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=HqU3Pl0zqzkcuaNDEwB/Ax9fkH+ammw/qBuPNlSTruE=;
        b=i5l4IQz0R+5YDpgXbhNWm7SdEua7y+JqwkVB9L2Qmr0CchldhP1OXMknep6mO2f5aT
         TKQYC1CHS27Oa93etO0nrex+1MU7CLFaI8gawX7do4mO46mRVW3Hw1yF+zh8bTnjZDmQ
         ageR2iK28RVfCgexgqgAShQZAdFw5WCopmSC4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794383579; x=1794988379;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HqU3Pl0zqzkcuaNDEwB/Ax9fkH+ammw/qBuPNlSTruE=;
        b=fCcMRcSC+QrrDt5z0LmyhtIUfp1gMvBKcfX2LOa7CsMh5p5/3s0MLi+umEpHa4ZlLQ
         Q3CBpjXi+m8kdH8ycihJxrIrC8GTFRpcMjooa8B2L+FV2eSrfeDOJkU4jM1UQa39WDF1
         TYBLAcpN+NQSSjMgDtT3kUV9EZMM2Ji6fBOEXqE1lh/byq4NBT3Iij6H2iK92UzhRiuW
         Zlb+AALCt1I7fiaVpvHzliJbPwkhMEcsvoCLVazIHi0sGFSuMyyKD/E0s6uAF9xupk3m
         lIQBIl9MpNhm5v50w51bQKzLJJsaWYkYy3apIBTYo7DA9EPIfHcrNk6bjbZy7K6r3GSI
         kiwQ==
X-Forwarded-Encrypted: i=1; AL+hErG5IUg1X2j02uLlmCpx88nhHRN+zWez0g62s4bpXGsRY2Y6CNIIqZDtgHThNVSsnwMThXaQSa1V2qw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9NSlQFn8sykl90b/8lnZOFsmWVanw+ZAp7mb6xd3rzFFx01vUl
	RrOAV2ZK6Muc51yAAOllHF0KdeVAw1/ZYt8rzNAeaj2fUFX0HO7hRbPEUTTFb6KY12s=
X-Gm-Gg: AYBFou1I+Iuf7llmM6Xs97WHURWWot6Fb2JUT4LTfl8DqrAftA38RTI2xtfxWf0vJby
	D1xV3vb7hfj2SY3ncBJ0Z7mbBzCdadzDPrQXo5tgOL6yPCG7cm9GELNBdXhq+Vz2zRrxUpYrkja
	S4vUgq64+z6AwUOhCDkHGMsP0gNsQrbbs4SRK6VJ1BW+clXGk2ZONfPnPR2X98TwK/k1SJsLwr8
	FyAGF0igXTkpYsUJmh9aHEcBHbAwJfJTFvzgko0Y0KLU4YxJxnHs3Bxp7QyDn7v1SwdhJ6/+ijE
	P5CJ/yTJIVtkLbfe7G8cutVkFrp5u1Khi6KUKjc56NsB8SzDkP83tRSGNB0UolIZ3y5+PXbMMBe
	+AegCxsZ2QzJuw6/Mjetj+lE4n1ypUSnuXaA82qdvDxZK2MGrbgBvHH9StNsFL0kCVDNaqGhNMq
	qFkHQzxktLKsNpOTc8R16noZXKQ/QIcTg/vhX/cGZgIZ0vlj1BN3M4XRNLI1UaUH3lqkBcVMGio
	/yqKf0wIT22ko8TTQf/Mowv+e7+QTZwvHlPTUJ2BrGYE+t5yS+JMS9JK+S7GYYdXGAsOTHAzaoV
	JaAA2vqTZNOWuMUBRin/oFRlsvq8qwE5n4UOuxYZ0Fm4p+gj7IkKy0c7goiQuoW4v5f/Xb0BL72
	eX5ZUWRbgfyqB3xZJ5/p+BFxvcBwGSCAHzUklFbyg0JC1+UA3o1wm+hTdnSQbvXduWGZt4kMtJF
	ly32ee9pa5ERlBX+d360ZZwhZlFTu1Gx6goBMY2VCEyWzLaOm64nro
X-Received: by 2002:a05:6a20:431a:b0:3e2:47ab:6a25 with SMTP id adf61e73a8af0-3f2fe3d4734mr1995928637.46.1794383579151;
        Tue, 10 Nov 2026 23:52:59 -0800 (PST)
Received: from localhost ([199.201.64.8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baaa86e030sm1861501b3a.27.2026.11.10.23.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 23:52:58 -0800 (PST)
Date: Tue, 10 Nov 2026 23:52:55 -0800
From: Chris Down <chris@chrisdown.name>
To: Pasha Tatashin <pasha.tatashin@soleen.com>,
	Mike Rapoport <rppt@kernel.org>,
	Pratyush Yadav <pratyush@kernel.org>
Cc: Breno Leitao <leitao@debian.org>, Alexander Graf <graf@amazon.com>,
	Baoquan He <baoquan.he@linux.dev>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, kexec@lists.infradead.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH 1/9] kho: Reclaim the metadata page left reserved after kexec
Message-ID: <63ca64c004b296a998a3e531f8c0c4964916b70c.1794383544.git.chris@chrisdown.name>
References: <cover.1794383544.git.chris@chrisdown.name>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1794383544.git.chris@chrisdown.name>
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

After a KHO kexec, the new kernel keeps the page holding the previous
kernel's kexec metadata reserved for as long as it runs. It only needs
the page once, since kho_in_kexec_metadata() copies the previous release
and the kexec count out of it at boot, and nothing reads it again.

Free it with kho_restore_free() once copying is complete.

Fixes: 76aa46b9e404 ("kho: kexec-metadata: track previous kernel chain")
Signed-off-by: Chris Down <chris@chrisdown.name>
---
 Documentation/admin-guide/mm/kho.rst |  4 +++-
 kernel/liveupdate/kexec_handover.c   | 10 +++++++---
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/mm/kho.rst b/Documentation/admin-guide/mm/kho.rst
index 902d171a780a..f9d2cc5999ee 100644
--- a/Documentation/admin-guide/mm/kho.rst
+++ b/Documentation/admin-guide/mm/kho.rst
@@ -120,4 +120,6 @@ stabilized.
 
 ``/sys/kernel/debug/kho/in/sub_fdts/``
     Similar to ``kho/out/sub_fdts/``, but contains sub blobs
-    of KHO producers passed from the old kernel.
+    of KHO producers passed from the old kernel. A blob disappears
+    once the kernel has read and freed it, as ``kexec-metadata`` does
+    during boot.
diff --git a/kernel/liveupdate/kexec_handover.c b/kernel/liveupdate/kexec_handover.c
index eeec298aa9d6..3046b89e5db4 100644
--- a/kernel/liveupdate/kexec_handover.c
+++ b/kernel/liveupdate/kexec_handover.c
@@ -1808,6 +1808,9 @@ static void __init kho_in_kexec_metadata(void)
 
 	pr_info("exec from: %s (count %u)\n",
 		kho_in.previous_release, kho_in.kexec_count);
+
+	kho_debugfs_blob_remove(&kho_in.dbg, metadata);
+	kho_restore_free(metadata);
 }
 
 /*
@@ -1885,14 +1888,15 @@ static __init int kho_init(void)
 	if (err)
 		goto err_free_fdt;
 
+	if (fdt)
+		kho_in_debugfs_init(&kho_in.dbg, fdt);
+
 	err = kho_kexec_metadata_init(fdt);
 	if (err)
 		goto err_free_fdt;
 
-	if (fdt) {
-		kho_in_debugfs_init(&kho_in.dbg, fdt);
+	if (fdt)
 		return 0;
-	}
 
 	for (int i = 0; i < kho_bootmem_cnt; i++) {
 		unsigned long base_pfn = PHYS_PFN(kho_bootmem[i].addr);
-- 
2.54.0

