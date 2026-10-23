Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792776231;
	b=IivQGMk1xOweITHtPy1Cahva2xc5Xb+3qhkHkt5dSXjdXE6w2uE8YSxNqxX64nO+BW71
	 jsg5J6+egkCaMShXvD25KjBc++wXwmyErVy6vKKFHGwR/swaUx11j7W81kOOeSXEobzW3
	 UINIoOjyiiFPAmN2BWuA7p+W4N31jKVz8NV4QcwGc8jGMyCETC38IWV4qZdOJHhhnSPUh
	 1AhXk/kbv/GB2PnRHIkblo1HMy139XBOf/GUm93VmwREX1NE4zVuM8wkdrNWQqXvMtj6P
	 B5glOLOkGmZK4yPJ/DYic05wGX/8WZzsKaiLbIhQlFIUpxD5gxLs4TfVXUkdZ+A9U8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792776231;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=b9U8BJjnSyQLu8vlmMN8CV+h3S1yPSnSBNwOLGcNxzs=;
	b=udRPcUsxUMxnacME++NOOwOb1apjsPts3AuKGVP6WVMi+SWuyg2ZkGMxH580URjTL2Wa
	 Ri2TJZqmV9+dCJ3OUu0dDzfPzGD1X/mFWFRA6L4/yV40wYrrMtO/9yS2wNEBzzVpove77
	 W1sUedECCQcwQqz5hQXB67vX7KN2nNeXDGYJ8uLWOzldWdaCzPPa9UlckXuWfuPTxJAsM
	 ftkkmCiYH2HcrYl9q8GfUkBYTf3Zn45g+IR2GJ2SppoD18rDVhoCIXAC2fJpsGrkUSU+5
	 9k+8VrczUBZyeDnldNw+2CSWzXHqLdPu07Wdy5mGzb29WAIuRiASMNeCFdXpVu19H6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FMFbak2L;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20493606A31A
	for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 17:23:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20493606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FMFbak2L
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a218b13c4bso5045775e9.0
        for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 10:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792776229; x=1793381029; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b9U8BJjnSyQLu8vlmMN8CV+h3S1yPSnSBNwOLGcNxzs=;
        b=FMFbak2Lv2lhOGCjKEw71ctCzxUX3t9FkWqUHf/sC4QitZrRCuemkodjqFDbh1yQ8w
         4z15z4rWbF3wPybQwis3PyyUxs2U8Iyw+mFJ4+9V64wFam2di8sCwgyIRMyi5dRZiVzy
         vspiC+CWDlUBn+exNtdA0wkxcrcYfzf5UE1V8TcNtfqEa7dUGw8ZHKu8DeljBe4vWgMW
         +Yi8SZW6EliRrb3z2ZE1pUDFuOorhmb/AfhW0VsZ18YtOh148nPEd4UBXGky9OlizkBF
         mAkIIK1cG5XIXYwFhwBT/ez0PEpG2OC1Ci5yvpsIFoWKf6uYIj0x89qSftEX2s/X/iaR
         NMpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792776229; x=1793381029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b9U8BJjnSyQLu8vlmMN8CV+h3S1yPSnSBNwOLGcNxzs=;
        b=c34QuCq1bQFCzBvIkHz7HQJpqwfL/UqGvNkMXi7iyUBV4PDvdOGcTvCDc70j9pRIED
         PN4oSJfzn4fQaKTsJV5i3LseRFd5e0WTDvDcoCVJzbkvXegn90CJspEiF0+bmejSjZl3
         6Da+pXJv+iExy4bkf0hwr5lzN39II/cZNFUY3emcRyB9vthtL+FJiRVdTzj3i8l2Od8m
         GldGGXpLFgfsRXa/HhtxKO30cP4wA1S7qonywPtXlDV0bqxEhUBVgV0ECY55NRscvc1V
         ZAgm+TzOLclxb4CT71xSkqJ6HOobpVm/6a6qFXBCT/6DZWd6TL1YWkxN69ECbamCQfh8
         r/kg==
X-Forwarded-Encrypted: i=1; AKwUvBzS6Cf9JOVMPwhgkv17mx0Ua45BZ5WBXIkjYQSS7wUt8lhqoZwsARedgPoT2ubth86ILRcj+gr2SD0=@vger.kernel.org
X-Gm-Message-State: AFq9FYL+/Eh8Immdgq5ChElhYUdXdU3LIBLzEOaeeaWVNOCxpksMmoan
	xqVHmRePdsGLBs8TUSuxVIBdcfdTleiFA3GjfhTQtIbtC72pl0Mcxxo7ys4qzCqRqitQMg==
X-Gm-Gg: AYBFou1bWule4LQOvpvEESIIcq9/pSz7kU9dlwoR2QwLf3eCR2JCSVGX94V3HSBbBAr
	2AgIpCO8VR2ZU1Rp8KXydK3r7xuVInkcBTzTiZqyfe+RL/jxNJhmbAsoeg4fuqSXJUSWzchYYZj
	pV97j1sjLLPJInJIsaGUs+zwmfpAwh2EdDC+OG/y3Nz3eDHr9PeOXbx8lwzfn6dSCW2Y6FwSIf7
	SNYMdBw+nC1H3Ilg/p3CHo5oYp7XQqzSdrvTiseTdP7Opjpkd9ZfZ0evwsByT4BnNuvxZrKJnco
	0UaQ8HVcRp1vYJVZyC3Ln3x4PrR+VKpnTjkeA5B1zmgjHWYCV+pesqZF2BMxgkt1jCOiGbZZYNh
	g2no+MHe8zp44SblOUQMTMGT2wB1SGMH/irf2xZGEwC6ILr3p69FjrBPdk77oOGP+VTFPYEfeJm
	OS8bZh8htIRGxwKLcISFuMDeFv/P1pIzRn3TjYYOfEM4PNaGKRtYczqEp4mv4dStdfrKTRM1X/p
	s2yY9kqgz80eTVaLqzNEJG+8TnsnZkJW3GZyPeH3ZejmUSAhDNt6FZOPdYYEM/b4BkR9xVlMG8S
	bLPHS4w/S1uvxPie5SdoRQ9zGYxwI3hgSDUk3TDKa9vgTrff5MfyZDoJ9/ThEaEOVPSOgby9uR7
	0jNx6+xS6OHTQKIlN
X-Received: by 2002:a05:600c:354c:b0:4a2:1197:1de0 with SMTP id 5b1f17b1804b1-4a211cb23f3mr50233895e9.19.1792776229374;
        Fri, 23 Oct 2026 10:23:49 -0700 (PDT)
Received: from dev-dsk-fgriffo-1c-93421965.eu-west-1.amazon.com (54-240-197-234.amazon.com. [54.240.197.234])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a30764e9e7sm17932475e9.2.2026.10.23.10.23.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 23 Oct 2026 10:23:48 -0700 (PDT)
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
Date: Fri, 23 Oct 2026 17:23:47 +0000
Message-ID: <20261023172347.88443-1-griffoul@gmail.com>
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

> +	int (*get_pfn)(void *provider, pgoff_t index, unsigned long *pfn,
> +		       int *max_order);

Should get_pfn() also return attributes of the frame? Only the provider
knows them, and every mapping of the frame has to follow them. Two
examples:

- Read only. A provider may lend a page that the guest can read but not
  write. I know you dropped this from the sample to keep things simple,
  but without it guest_memfd maps every frame writable, and there is no
  other way to make a guest_memfd page read only.

- Aliased. The frame is also reachable somewhere else, e.g. a ring
  shared with a device. Such a frame must not become private; see my
  reply to 34/50.

A u32 of flags, with 0 for today's behaviour, would cover both and
leave room for more later.

Fred
