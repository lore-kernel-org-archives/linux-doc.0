Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792777343;
	b=GsG6TkWI01Ur0nCcbgUSgJqvYrUcRD5CTrYcxf4X56KnrgPsABSXTDxEBVTxaX3+QK2x
	 FLi0DR9VBq0Vd3rLPwFDWal8NQXhqbHu+w1IKJEk3Y44gKqzdD7oUA1qE9PpQyDkhLEAL
	 XnwAmZaKQddjyQeBLIj4OePRxYwGpvaypiuIxOPoHJwy75ieRtfFE3mHp3MNvzx8bAGvj
	 5jBuL3k3ufvqMasEe7QwIs5atiO9HJAQkRJkFzQRw2NIHqMcMFlslGip0RIMwVZ8YEVrA
	 KxqT+a0T0eZDcFl73PA0pGWgDIBKUofSzfAq21UJ9dpxQ6pF2UPtYjii7D5tsxgnEug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792777343;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=IArJW2D7DC4NrWDvM238weKBxrWboHP+GmGljUSheNA=;
	b=0o3e0xHcyM2zvlgEO79++z4MZbH8utb2lNlqEWWmlOAtQRmLBfvSj8AOkdgT5vAGDiv/
	 dJScCof5AbOwz2GUAXYUEfITVZodO++DBb7aUbtsrYW6tssGlS2WXRrtb+s1WnZl4Im0P
	 tgMch3t3iqscwljooI4OhoLUg06SibIU3pq+JhuNyaPal9wYsPfZoI41g/sI6HtavLQBD
	 0VxLJ+3UEt8r1jIBX2j4Oga6W0X6M9TYjRQkPOeO2ep++yURKLpvAwYlGgAquXrPMaFu0
	 FCy+ATcB5W6lIaKb7EfMfDVdbx9siCRDpAsuUa9LrZfEeDFvPLTveorTtCzIyQPnhZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qE15pYgN;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C02606A320
	for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 17:42:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0C02606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qE15pYgN
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48b042c0759so792102f8f.2
        for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 10:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792777341; x=1793382141; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IArJW2D7DC4NrWDvM238weKBxrWboHP+GmGljUSheNA=;
        b=qE15pYgNtOgyK2wp9uhHmPW3lpnIrQjWDDouCy3JYbd1IPAGnpkiQ1sFjBCfeqsgVk
         11lRWEucebETVSgkVRwe4eQ7IHe8OlPrizWnzae5mEN51Lz7LmMQAvfowgfp7pp9VjSY
         8ojMFcQ8Y/cMXl9Vl5ClHIKs8MbSDwSpdyrxKk5eONs/+iNwEGuTjszhx81xmGle2j3u
         5SttvDKVdVVC6L1H6oJIFjikyY5gkiye6rcli8bFHH5Otyy3QtD+qvimrzBlONJNZ6SJ
         X5NX0lfRgpuebTW3dXrYQ6ah5QMTrTT9+wd/GIR0AgncOrzQqe42eAZ9koOBhOXDH0X3
         DVDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792777341; x=1793382141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IArJW2D7DC4NrWDvM238weKBxrWboHP+GmGljUSheNA=;
        b=WiAEeqZuctTCQwqoh01wDpDtVFlVg3xtxobI74EG2MwwmUDyuMOmR9lxcCaFZPX017
         ci2yUCRO9ICTtZKNBSJ4PxFxDGRYwLjOCDAXyo55G05jdxkK6vQrfiPyRJBjYZ1c3tAh
         4j1ddEraAnkAdEB1T5RZpSRYk1fih/+We2hT3Vun9Kfi4EDiVDvV2I1uBE3drztvCJEi
         SwZN9gaJ/cBU2OjW95d5EI5zJGPzX2jxKrccNqQ4diegLQGmXLxkt3779vOJPQluhblD
         lypqo0NaSKUd1n3+r+J7AWg/toqtqLJSjDB+ZmfrrWChq9reaVgcLG1vqQaj3gKANbE3
         vPqg==
X-Forwarded-Encrypted: i=1; AKwUvBxAMQLQ8+l0VgABmXtJiYs3CIz7nr8cR2kobNm2mg3LlOEhQF+ZG7IGeaVXLX5srOXLihK7DErgGwQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIkGXR7ngug47BlyvHx4v/iPbWuVSLLA6dtsLvoED55HWRBuQKt
	ja95MQdfZh9ftR43VR4QMvovEmyEyMnSdI1shLUkfCM1atBa2ylR/9Dd
X-Gm-Gg: AYBFou380esRILmQx9P2gNU+AeG96FX0KKav8KoFQtGHWAzgBCb55gRdVaSE5xSFOUw
	mKHCpV3ei2N9xbItyLdqQKtAkFGY9UAIaDY/IBM8YjTfE/T31efImx3PAsRiGqXWmped7M0LIOI
	uFH4uS6YaHdXhkOZ+rv2/jwB5Y0bOotf8apW0zhkaHIgqz5La6BNPBM6nF14ujz7ExIDTY5CaAz
	JfJjZxIo8eCK2Rumh86ISz5tsYSlCCgMNmuSGcV5C467ISNRw7HKOblLIs8SESXx2CzyDPdL12I
	RySZDHm3qY7eR+4Uua8nzlZ/9oHjcG9CAxdlvczd+Fv+wiM3L/fR+hlHBrFOPFQ2l6QCfJfQ2EE
	xmK2flcdBETBGfv8/1SB5X1WBLpDPDZg3lxiCWMPg/dB3PnU6pyVb/J2/ItbVmyLn3l6aHKV/ZT
	WAwkFM1sOGnitN5ropHc/v1c3UwXT+H09zGTIZSLEh0iP6/5BiL0pJlxY3L/Uk6ukgDjFDI0xeU
	plSut1LHrcl3O3YK/2BhlHO3aGXmxvkuPiZyuT6d+fEIS3MMYBK6ZkGS88ShDwsgm8WHmsCDbWe
	NCSF8DmBHPOJNupePiLNjaV766l7YlMKXh/mRncvMmiPIECjD476MFU5HPE9xz/vtWXnp9HeuM+
	0eVCFp7pJLkY9LC3q
X-Received: by 2002:a05:6000:98e:b0:48d:ea67:79d4 with SMTP id ffacd0b85a97d-48e385af0d1mr4196895f8f.53.1792777340908;
        Fri, 23 Oct 2026 10:42:20 -0700 (PDT)
Received: from dev-dsk-fgriffo-1c-93421965.eu-west-1.amazon.com (54-240-197-234.amazon.com. [54.240.197.234])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d40c182sm1118217f8f.34.2026.10.23.10.42.18
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 23 Oct 2026 10:42:20 -0700 (PDT)
From: Fred Griffoul <griffoul@gmail.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: Alex Williamson <alex@shazbot.org>,
	Alexander Graf <graf@amazon.de>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Alexey Kardashevskiy <aik@amd.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Ashish Kalra <ashish.kalra@amd.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Baolu Lu <baolu.lu@linux.intel.com>,
	Bill Wendling <morbo@google.com>,
	Borislav Petkov <bp@alien8.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christian Brauner <brauner@kernel.org>,
	=?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
	Connor Williamson <connordw@amazon.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dave Jiang <dave.jiang@intel.com>,
	David Hildenbrand <david@kernel.org>,
	David Rientjes <rientjes@google.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Erdem Aktas <erdemaktas@google.com>,
	Frank van der Linden <fvdl@google.com>,
	Gregory Price <gourry@gourry.net>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Hugh Dickins <hughd@google.com>,
	Ingo Molnar <mingo@redhat.com>,
	Jacob Pan <jacob.pan@linux.microsoft.com>,
	James Houghton <jthoughton@google.com>,
	Jan Kara <jack@suse.cz>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Jianxiong Gao <jxgao@google.com>,
	Joerg Roedel <joro@8bytes.org>,
	Joey Gouly <joey.gouly@arm.com>,
	John Starks <John.Starks@microsoft.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Justin Stitt <justinstitt@google.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Michael Roth <michael.roth@amd.com>,
	Mike Rapoport <rppt@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Oliver Upton <oupton@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Tarun Sahu <tarunsahu@google.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Tycho Andersen <tycho@kernel.org>,
	Vishal Annapurve <vannapurve@google.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Will Deacon <will@kernel.org>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	Yan Zhao <yan.y.zhao@intel.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	x86@kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	kvm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH RFC v2 31/50] KVM: guest_memfd: Support getting PFNs for stage 2 from providers
Date: Fri, 23 Oct 2026 17:42:18 +0000
Message-ID: <20261023174218.54790-1-griffoul@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261022-gmem-alternative-providers-v2-31-5dd1dc6c660a@google.com>
References: <20261022-gmem-alternative-providers-v2-0-5dd1dc6c660a@google.com> <20261022-gmem-alternative-providers-v2-31-5dd1dc6c660a@google.com>
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

> +	if (kvm_gmem_is_pfn_mode(gi)) {
> +		r = gmem_provider_get_pfn(gi, index, pfn, max_order);
> +		if (r)
> +			return ERR_PTR(r);
> +		return NULL;
> +	}

The order goes from the provider to the fault handler unchecked. MPS
reports 0, but a provider with contiguous memory won't, and then a
fault can map a block that the gfn and pfn aren't aligned to, one that
mixes shared and private pages, or one that covers a page being revoked
or converted at the same time: only that page's gfn is marked as being
invalidated, so the fault doesn't retry.

Clamping the order in kvm_gmem_get_pfn() to an aligned block of uniform
attributes, and widening invalidations to the surrounding blocks, would
cover it.

Fred
