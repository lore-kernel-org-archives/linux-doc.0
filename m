Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.115
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793808951;
	b=paztmmaFBzDrV0UUxdJAMmczbwzisc7F3HD/n7Ls3IHBPyzUMp1FXlmDE1WhyZtOqCb/
	 Mn8ndVVXPIimc/vroAuxTAOBH3dyH7tP8wkoyCQxLMwMEisujRQvgpeCSxQMEtC+Rp6Fs
	 0A56hhlKmkP6oYVygh1yA1nzLNR0nH6oECpWOM3rM4hPa55LWNvef/wBaBxcij2jV4Eff
	 +waJlQbdgLhwDO1A12rQlOT9We1MBK+/G57QwWdjQ6vnhqN6xwueyYFxMqvFxvRpOlhev
	 p/L9qQFj3mur31i1HuI+rSXPZq0n02lz2xbeAUCnMoKxaRsFuNmX17ui3IbiQSF8QPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793808951;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=8fU8AEGdDcjq9JBv57injpYEq2ySiH6tspHTe3WsEnE=;
	b=4T3qFFiR7Tt4S/axWFlERdq9djHWoDL1mXDY8iHePcPM1nJZaGwK4evv62DByTund2Vw
	 OYh3oORUwAGu4sIBxSpZvrxNnuQeDgd1NrfhnWQSuFgDeX+2Vcw6NYz5sU6YHQc7A8VzH
	 jap0vua3WXf2LgLBSxr3q0a9Pqiz4Qsn7oI8qDh1qSQ3yMuYJFF7vWsEt/4iERHmUVXu5
	 4dAACOmGApYf72ORi8slX/xXksIqkLAltlLeXJoTeyfgm9VmDwQy8FCyK9mFZaoURHIlA
	 gGQumcr0hYNEIrrZ9tQLtsv8E8LMlUrXxhayWd1mQw7tSlFe1B7Fk2ev6Bmci5aN8VA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=oO5llueb;
	arc=none smtp.remote-ip=91.218.175.115
Received: from mta0.migadu.com (out-115.mta0.migadu.com [91.218.175.115])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93340606A329
	for <linux-doc@vger.kernel.org>; Wed,  4 Nov 2026 16:15:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93340606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=oO5llueb
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=QhoInTD0Xt4NBSuls0AgRrgTJDXjCSOPGY4pmRsoD08=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793808948; v=1; x=1794413748;
 b=oO5llueb2uLLHAIztGoWQ9k0aJwHtRxomO9r6ciLu/m9aaoJCGqWBQobUJ4/gK0SNhXJ97nr
 ElLpG14EwNXY8YlLuxiBnZE31ra/RtD3OJcdO8OVaX39YfomEKzpN1x2NQniWCLhSg/wVqkFKSJ
 jiEDYnwTN7uWGrVGtczbdmrY=
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c6ae390f292ebaa1;
	Wed, 04 Nov 2026 16:15:48 +0000
X-Mizu-Trace-ID: c6ae390f292ebaa1
X-Migadu-Flow: FLOW_OUT
Message-ID: <81096741-0e14-4469-bdbb-497aba541fbb@linux.dev>
Date: Wed, 4 Nov 2026 16:15:46 +0000
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/hugetlb: allow crashkernel to reuse hugetlb CMA memory
To: Kiryl Shutsemau <kas@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, baoquan.he@linux.dev,
 rppt@kernel.org, pasha.tatashin@soleen.com, pratyush@kernel.org,
 ruirui.yang@linux.dev, corbet@lwn.net, skhan@linuxfoundation.org,
 rdunlap@infradead.org, muchun.song@linux.dev, osalvador@suse.de,
 david@kernel.org, jbohac@suse.cz, sourabhjain@linux.ibm.com,
 ruanjinjie@huawei.com, leitao@debian.org, linux-kernel@vger.kernel.org,
 kexec@lists.infradead.org, linux-doc@vger.kernel.org, linux-mm@kvack.org,
 hannes@cmpxchg.org, riel@surriel.com, shakeel.butt@linux.dev,
 kernel-team@meta.com
References: <20261104142727.2894800-1-usama.arif@linux.dev>
 <autMHwldMudQOO3j@thinkstation>
Content-Language: en-US
From: Usama Arif <usama.arif@linux.dev>
In-Reply-To: <autMHwldMudQOO3j@thinkstation>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 04/11/2026 15:20, Kiryl Shutsemau wrote:
> On Wed, Nov 04, 2026 at 06:27:27AM -0800, Usama Arif wrote:
>> Use a separate suffix to make the exclusion of existing HugeTLB
>> allocations from the vmcore an explicit choice.
> 
> The crashkernel=size,cma documentation already says that pages allocated
> from the range are not in the vmcore and that it should not be used if
> dumping of userspace memory is intended. HugeTLB pages are userspace
> memory. I don't see what a new suffix makes explicit that ",cma" does
> not already.
> 
> Why not let crashkernel=size,cma take hugetlb CMA first and reserve a
> dedicated area only for what hugetlb CMA does not cover? With
> hugetlb_cma=6G crashkernel=2G,cma there would be no extra CMA at all.
> With hugetlb_cma=2G crashkernel=4G,cma the crash kernel would reuse the
> 2G and a dedicated 2G area would be reserved for the rest. Either way,
> nobody has to learn a new option.
> 
> The catch is ordering. reserve_crashkernel_cma() runs from setup_arch(),
> but hugetlb_cma_reserve() runs later, from mm_core_init_early(). The arch
> code could record the size and leave the reservation to generic code
> right after hugetlb_cma_reserve(). That is still memblock time, so the
> remainder can be declared there. An early_initcall is too late for that.
> 

Makes sense to me, I will rewrite it in the above way and send v2.

Thanks for the review!
Usama

