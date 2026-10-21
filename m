Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792626411;
	b=oGSTM/dyhYnvh4YOwPoyZyd+ketAa8L2he/op23+GlPQrdlEnwRnnKbzw0aWiXKnorlA
	 ydL4hgRHtYivp1Z2KkdJ5Eemott1tSVNAJWqs2Dp8sCvXGTMy4OWyOZsuY1OFuqEwT/Zd
	 IIu2DEt/UJOyUJiNb241HOWNbdUU7p+yLvy9bG/JdeWKHHXVpc//9wclJ6CFb9Y+35E5e
	 XJufa1BXjuyrfQJze0urdOtjBg3YBMg43KkaLUavmhClmA6Oul2XCTd1ByCzs8i9KYS3T
	 EomehDBjQ5I5ykZyaLMhKHJlGKK1n4xFuiXzyZgYXnZXT9TlekuJWQqg+4HLjIB2Fuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792626411;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=n5hOymfjgaz7xpjT1ssIdHSQ+wD4cuNPKUAfRnejzdg=;
	b=Dz8GuitxNG4Y2X/x9zEfGq+TMv/5bv5xPhX844tMqgIbkWPhBwwo5mPzeTBZctLnwaz0
	 5n9XvUrd4lhi/7S6mYgfCagd6SWn/HDG2siRySP46bk7UMpV9UBSrfe1DAWkHiBSEKNug
	 KmqQBidQMgGw1N40U4aD22EUI5u80jQmI0UaYDgmHqPMkf67KVQAViL7q0XCbwZ7TDEKt
	 YyUTgLl1mtRWIyfPT36ETQIMMPMYHNFRDOqKYA8SzEwI3vQ4PNMtdtkA4Cs/jFJawHGU9
	 4YU4CJq0Vx9hPJF9tLMma3S82UT/Du9+9hLZdBAx90sX43JTRPSdxQ9c9diRTjAf92A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	arc=none smtp.remote-ip=209.85.222.179
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A337606A31A
	for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2026 23:46:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A337606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-93e503815adso118001485a.1
        for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2026 16:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1792626409; x=1793231209; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n5hOymfjgaz7xpjT1ssIdHSQ+wD4cuNPKUAfRnejzdg=;
        b=RWEqARLNhr7kM3UoylUxt0c18uD7BW+nnkV6qlrI9YT9zsHGYUDmS0p2u/OOJbEXRO
         SgtdrfJPP8qwXew2mkzTL5kBpez8YAljokMt8HUv0ST5gnPGdO65tJGybD3uqk3DHnFQ
         VEfyFNtRpndd2xu3NGiNoG2k4NxrYb1vsCefZIqb45l7I9z62Aci6eddaiDR77WnIZoy
         eWMUHuI+2+oIZ9KbTn2PavphoEY3W05B528MicbkGhBUCoiwiAwUvz+JZs0AWZblHyFz
         J4NMmzr4UzXCJ11N9e51QR5awZqclvbU5xHpjVK9003y/gTpC40ys8/YEtw5gSAxngqs
         Ulog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792626409; x=1793231209;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n5hOymfjgaz7xpjT1ssIdHSQ+wD4cuNPKUAfRnejzdg=;
        b=GGhqrv8+0kJaL2YxTZOoUGHD1T9Yogil/EvCiJvJMpFX3IWVQ6OsgehePQ0rxC2uiU
         jGpZGrVBCxFuan7AMpEcInQXKpUmWqrcdwRkzBJZ+zeTxMwQXFxov3GjJkSQSC6zdapi
         jHUkiWCsxK8TCkiHtxtgiXd9QZxuWGlTkyqZF25W7wE94IYUX25ybaKSZevLggG/eS0Z
         4cMNHCOOEvSpw+Mi838/fRBhGp4beyIY0YTZpEzG33+BanoVTGzdKlbRX6CwDB1Z5EuP
         Nl4CI30iDDxG9j51WKNbQpAP7kS6jqcBW5nA9twsCDxj0Tks49YuLtQ3XcsvO7L2uEca
         4OMA==
X-Forwarded-Encrypted: i=1; AKwUvBywW7AZcIQ2/E2uYeFSixy0LGvuHfbvOYhhQjcj3EhsIwgITbEp1wuYLmNuyJ8pNP3aWOcLRb1Hf/I=@vger.kernel.org
X-Gm-Message-State: AFq9FYKETjluCtJxqQEIVi9D0/YeYCJ/gqWRYQWaW+hbqjlHt6sIVkI0
	AZ1nhGGvbWPlYD/j939nZcsdjFb7MCKsFGRJ0cDj3xgMqWCLEKNW3W2mFXq3m1JVxH0=
X-Gm-Gg: AYBFou03nyU3ajW40fCHJKRTvJ6qJK0W6KceaOUl5jYhbGZLEniuU6c/XKc6cSAz4uK
	O12C927M24gcdhy7MUKTyH3ZPDbNe2ZsDfxysera+RM+quCVLnWYyOHWxaP9EEv+XxjOcPnJIki
	rZY/LlhohtewakU/a0wzMMXoLPqeSCVYU0MwOOP3vzVgAVox3o9tlpLYXHjgWatbaIb4Osf7RBn
	VIlIsde3kcohKbZqllc6bG49pwSau9Gh8dhxw4u3WYFTW1qC6Sc/LUgjWBXbjk77W9VhXOlGhof
	lkbReASsWkuHfJWN+/kZWU1X9Ap9jMTwJtqvYyBHsfhRNoNpW3Own0VQ2UYIPIG5n2UyGCnhFwi
	y1KNEo+ZQEJWhuQYqr8N5bF/WIhMrH0qmCzaXTM8w/ueNvPhM4pwV2vXiGqqF4H+QbtU2Qvl+iy
	TljIU+dYOno2XyKgSgV17E37WVXTJeyujTFESwfpmFpngVRZAw3LpMKQi+Q1iB2hIzXXgviVV9j
	P6QXaVOEz44fD+MK8inei9DRlXIBQ02+nP+dSMq2OTiz/JonEBE3+8qLmM5DQDfQMV2LtBxoTVp
	bnSBt12HikkVNT4QrFOm+gsVLib6fJPDLdpZcnZKR7CNAdbQfK/+paZaRuU=
X-Received: by 2002:a05:620a:17a1:b0:93f:22f1:97be with SMTP id af79cd13be357-93f5800e406mr694136885a.72.1792626409239;
        Wed, 21 Oct 2026 16:46:49 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f56e2bee2sm373858385a.42.2026.10.21.16.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 16:46:48 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xJg19-0000000EWG8-3cjA;
	Wed, 21 Oct 2026 20:46:47 -0300
Date: Wed, 21 Oct 2026 20:46:47 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Samiullah Khawaja <skhawaja@google.com>
Cc: Fred Griffoul <griffoul@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	Kevin Tian <kevin.tian@intel.com>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Ackerley Tng <ackerleytng@google.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [RFC PATCH v2 06/11] iommufd: Map memory provider files
Message-ID: <20261021234647.GA3381610@ziepe.ca>
References: <20261014093733.90312-1-griffoul@gmail.com>
 <20261014093733.90312-7-griffoul@gmail.com>
 <atkO08eCJzLX6R58@google.com>
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
In-Reply-To: <atkO08eCJzLX6R58@google.com>

On Wed, Oct 21, 2026 at 08:17:05PM +0000, Samiullah Khawaja wrote:

> With this approach, silently skipping holes during IOAS_MAP_FILE means
> iommufd has no tracking of which IOVA ranges in the area are actually
> mapped, which complicates unmap and could also hide a bug if a hole in
> the range was not expected?

I think if we are going to do this it should only work with iommupt
and iommupt should provide an unmap that is compatible with the holes.

There are other places that would like such an operation, IIRC.

This will have to block an access reaching into a guest memfd mapping
as well, so that should be OK.

Jason
