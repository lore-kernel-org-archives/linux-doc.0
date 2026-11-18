Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795019901;
	b=hhLenftDoYIW7L4aEaudushVeGkIUeuA2GEiAMtKpemuoERshymMs+NEK5Xtm6VY5Z02
	 huSpqUad4ocRrRVZB4llJOiMlNFDtTaBPssNCUm2PVejJ04xpZyqHW8Ay7fBN0HURv2Hu
	 FVgVfajZFJLiQ3lJ+NJXqNumT7jcyzc273IcEkrjFuNPMjKUlPYM8CpG8dCneif1qiDac
	 VwFg5iCZr7sgjxJyeKEKklSpr+CW8ndOFAX5IAJ7NVEcE/IG7PwC/80/2OEt9AHiT5NY5
	 L4ms16caH/7v/rhPIesrNJoqsAOocrn1Y7FYMA7+JRxNqHaSbMqWLhuGui6+yXJtHaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795019901;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=LYnPwXVs5q7hiylo9HLvXwft8EbUR8+QNtfkEA01owo=;
	b=3nJIa1W6Iglzb5Jn87zMPyu8E6yMFvuHm37QmnW1103skAKEsqsm+np0KYDghqMNK6Ei
	 pJRrQwBExIjT/f3HFHIXPVMgGhIZJkTVn7BNZjiCcYrDlVavDSsfXsidoVxhIQrGnCP6Z
	 ZT3HN5dX9gIHCCfzlYG+wPXP2L2VPfvbsmll+zZV3Zx7ox4VdGkk/SaL91OBeBhVjoVcM
	 qg8ECPvkPB4i8PoBw3moLgMHmfMcQ/GeP1d0xx8PRXFl80K47VgrUJQ2ZquxqKj1JvFFz
	 2wSrF61ZnZ8cj5HRZhTqd9SgKivXQzsnUoBwG++xGa4sIh+6lrp+LZ6HM+Dhvnersbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=QPGxmnC1;
	arc=none smtp.remote-ip=209.85.217.43
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27EBD606A32F
	for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 16:38:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27EBD606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=QPGxmnC1
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-7cc0ccc2fddso429876137.1
        for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 08:38:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1795019900; x=1795624700; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LYnPwXVs5q7hiylo9HLvXwft8EbUR8+QNtfkEA01owo=;
        b=QPGxmnC1MIKGvE/vzRa1zJVCw1yF2DPdCEjwi1OiyfqWVdjQXoQaqq4ZpovebRrelq
         US17RpTZ+Uzfo3OWCyd5YMD8bq52PJZD2Muct7K0eAIFNeFfXu6wgru+UBA6sgKtaRZS
         0b9MVDRgr2VxKFnpEMOLMgFYNq9iOOVRaT35J9gyp4Yaa5FkyTY4CkmwXmfIQ8WBZlwh
         FbWZ2NGLN9S2mivv77OafDgT1NOUggehsiq6xLEzEgC7ZwoXatqJLJw+t+NPJ3FkUwql
         2Ljnfuv2qvRrtHouHRaEPTZMC3Dkt5KLw10WpNnWS31sgR1pDdCheRklJg6bhyuXsgui
         5eCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795019900; x=1795624700;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LYnPwXVs5q7hiylo9HLvXwft8EbUR8+QNtfkEA01owo=;
        b=Jf50Dzz4qPsMf1JZm60GhyhU3b+JugiDRtYgvgyDW95x9PcNkchW3Z2G7nt7AeH3q7
         J5S8moqa+S1jC+HQsFcWnLd6pVVZvHCb8VdQ7AdxPCHOoUF8tdm31gbtBtHQLg/vCoiu
         WYaJg27ObjEHW1t3m1YJAmc5q0z3hmJVGwPODpzhZk7rxJMVWWHAnVnTG7SQDsHESur2
         h9R7XxYocN7OrzQHNXM32WXAjN66tZFnZ1P8MsRy0KIqMXGSa1l7Rlantps9xLjuG02v
         afwSis16XH0eyF4IpOD421dux6gZOT8zUMqAsnqacUVT3YM/2seH9aVu0rpcFnw7GqGg
         F24g==
X-Forwarded-Encrypted: i=1; AL+hErFH/JbZv/ddTtQlz+E1OJjGQRnKitBCixzstATFq63PhiS8kTuIS/ZSl5Gt/v2549iJ9IGBnugNf5w=@vger.kernel.org
X-Gm-Message-State: APuU4Z/6OP2BYv7lA7GF9Mup5iXFTQosA6orxXFDYgsy47xQ2RZi9u9B
	pjVOWtl4RTGu5Gkxnaoje1tabc32DPigu+Cu1NUptrq8K9ZeM0/jpn8bUo+DL+oj+0rNh124iC8
	82iLR
X-Gm-Gg: AYBFou2azmlk8/uqEmZD/3VwMnPxry55TXx1VqHCF0A5U6GOv50N41iPiEDPoBnq08N
	VdTliUY7lkJss0TTfBID2zmqSCviTqtupn1kclZq7ZlXLhiTcupi0Snjte95QU03r11PP8c8bd8
	eRsGAjg1q1zXD1Il2VY992v8GP3BII14sHqxhvmsUDxxITiDFauscoLnbhbg9A+0lwJPL0g0Jqp
	kMeuNXLog8Bjkd0XiG82drkbJgjgxxx7Tuf3CzLrR/+8m/uTs2QVLxP04ZokSIqtJEXADHGgsgS
	TvmuNU5NG7gmcSsXDem8gS31jTOJvgRoPeIWseDXujwTGewTbkmZiYZi1qTFgP6crM/2TofxFPA
	Jjdt2kX7+s0ZuSUXtSkcJzXcOWnlxdSyQ11kDN7Sbh1aIgdWSYmwji32ImdP2pMRqOpUqbQAJnk
	rpeAqMR1VPmTvCT6BGAT0VOrQD+eg/RgGXoOM0V4ZypBJPwuZt4usbdccsnVUOVF/FrAUnkZx44
	V94sCz70AwF8texHUQtXuzQXfAITM3+BFbffZHZYyp7+b9aW6IZ6kOwu6vYbjuFM/3wZ3tQDVzi
	LAJi8N3jnTgLsbvcg82qsJDvUIjr2u9l4Su5PoNFCF+TfUbFIFuCF4DuXsPGznHZztLcI6qC4rn
	rRgTcId9KFLcbgWLPDe1mLfk5VsSZJU99v3GIDy2J512FfNs=
X-Received: by 2002:a05:6102:91b:b0:7d0:9587:1b99 with SMTP id ada2fe7eead31-7d6b9ee48fcmr1231586137.0.1795019899949;
        Wed, 18 Nov 2026 08:38:19 -0800 (PST)
Received: from soleen.c.googlers.com (57.233.150.34.bc.googleusercontent.com. [34.150.233.57])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d6b9318565sm2190742137.9.2026.11.18.08.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:38:19 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 1/2] kho: expose incoming sub-blob metadata instead of
 contents
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: Long Wei <longwei27@huawei.com>
Cc: rppt@kernel.org, pasha.tatashin@soleen.com, pratyush@kernel.org, 
 akpm@linux-foundation.org, graf@amazon.com, leitao@debian.org, 
 corbet@lwn.net, rdunlap@infradead.org, linux-mm@kvack.org, 
 kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, hewenliang4@huawei.com
In-Reply-To: <20261117092951.4017931-2-longwei27@huawei.com>
References: <20261117092951.4017931-1-longwei27@huawei.com>
 <20261117092951.4017931-2-longwei27@huawei.com>
Date: Wed, 18 Nov 2026 11:38:16 -0500
Message-Id: <179501989658.250261.5046056769256366161.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2796;
 i=pasha.tatashin@soleen.com; h=from:subject:message-id;
 bh=s2TgceZsirNjgZI66wNzdrJjtsGvWS0+fdcYU2Wc8h4=;
 b=owEBbQKS/ZANAwAKAbt3KEzbc3reAcsmYgBq/dR6HI5GpH/4iewvFIx9U9up3jTt1CD0OiBfM
 tAYaHZwb4eJAjMEAAEKAB0WIQRBMaqT7LRvGvB/NmK7dyhM23N63gUCav3UegAKCRC7dyhM23N6
 3kzeEACFJCS4M3n+dkgQTJYjctdNWWkW46rsV15OpDqGSLVsafiGK5V9DqS/YbDDUzAIL82H8ek
 ad5sQrHuBJHAawArjrrZvPvZzsjJ7BoW0DhpOcm/qpi9kWBcHFsENdJnsNI+sEKtS7RbbYWQK9j
 vUVdUL11miluOI0kgYxpgF5qaZ4UwPGOft9U1q/ZL8XoMA/wEeCWMJjAzYczqn5NlEwwa+0AB2q
 6rV9wl/qqH3k5YypOi1mJyaSbV5EkYQGGi5oaRrSDgGgUPPySAGgd2qpPcV4/nA19UkULW5+Ytn
 maeDoReb2TGTx071O1D61DRaAQroMbESBa98ybnPDi7kYDDQ8CLtcbsoJT531hV/Rb9vSyMfua0
 WYp/jw8p6CI8ckRZakilQLC6NoROctxmAW8dgqsN7qz7E8zFTylOcMwvBnWCVv/OmeVNt//PGSZ
 4pvr57QAYJHdwmcY+nTXPkmo8Ah6AewPJfQdfcObc/6kbkiKd/1d8lPhhzK25hDvF00YlLVIPNR
 9tWH7znV/vhJaE8IssOJda4n+3fjfU5Kdq/BeEciQ7PR4m3bZU3IgMli5bnUzkHVn/orX7MMm3Y
 Z7klzrAJ9WeT+Ujk7U5HYuOOt2IHqPSL3QETXW/TOkr9Z1Ev36XHxJTep93cKMnaV5yhNLmn8bY
 /EvS9/hwGM3L8Hw==
X-Developer-Key: i=pasha.tatashin@soleen.com; a=openpgp;
 fpr=CAAAB722DD22A081F0D49F35633A6A993D43B569

> Incoming sub-blob pages are owned by their consumers and have independent
> lifetimes.  Some consumers, such as LUO, restore and free their state in
> early_initcall, i.e. before kho_init() (fs_initcall) builds the debugfs
> view:
> 
>   early_initcall: luo_early_startup()
>                     -> kho_retrieve_subtree("LUO")
>                     -> kho_restore_free(luo_ser)   /* page is freed */
> 
>   fs_initcall:    kho_init()
>                     -> kho_in_debugfs_init()
>                          -> phys_to_virt(luo_ser_phys)
>                          -> debugfs_create_blob("LUO", ...)
> 
> debugfs therefore ends up pointing at a page that was already handed back
> to the page allocator, and reading the file triggers a use-after-free:
> 
>   # cat /sys/kernel/debug/kho/in/sub_fdts/LUO
>   ==================================================================
>   BUG: KASAN: use-after-free in _copy_to_user+0x37/0x60
>   Read of size 32 at addr ffff88810309c000 by task cat/27436
> 
>   Call Trace:
>    <TASK>
>    kasan_report+0xb9/0xf0
>    kasan_check_range+0x100/0x1b0
>    _copy_to_user+0x37/0x60
>    simple_read_from_buffer+0x77/0xd0
>    read_file_blob+0x75/0xa0
>    vfs_read+0x12d/0x520
>    ksys_read+0xc3/0x160
>    do_syscall_64+0x97/0x4b0
>    entry_SYSCALL_64_after_hwframe+0x76/0x7e
>    </TASK>
> 
>   The buggy address belongs to the physical page:
>   page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x1fd
>   pfn:0x10309c
>   flags: 0x17ffffc0000000(node=0|zone=2|lastcpupid=0x1fffff)
>   page_type: f0(buddy)
>   ==================================================================
> 
> The page is already in the buddy allocator (page_type: f0(buddy),
> refcount 0), which confirms it was freed before the debugfs view was
> created.
> 
> KHO does not own these pages, so it cannot safely expose their contents at
> all.  Drop the in/sub_fdts raw blob nodes and replace them with a
> read-only in/blobs metadata file that lists the name, physical address and
> size of every incoming sub-blob.  The FDT itself is reserved by KHO and is
> still exposed as in/fdt.

I suggest we simply remove in/sub_fdts without adding in/blobs. All of 
the metadata you are proposing to expose via in/blobs is already present 
in in/fdt (and can be parsed from userspace if needed), so I do not 
think it warrants adding another kernel debugfs interface. Keeping this 
to just removing in/sub_fdts (and updating the doc) also keeps the fix 
minimal for -rc.

> 
> Fixes: 062dd306d99c ("kho: fix kho_in_debugfs_init() to handle non-FDT blobs")

This UAF has been there since in/sub_fdts was first added, so I think 
this should be: Fixes: c609c144b0e8 ("kexec: add KHO parsing support")

-- 
Pasha

