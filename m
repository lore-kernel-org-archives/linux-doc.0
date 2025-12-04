Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4603A331222;
	Thu,  4 Dec 2025 20:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764881889; cv=none; b=n/alKROB6UoXIeYllG0wpT+DC03hrmFJ2x8ZAwrEOCnvjXGzFVkghF/W5DL6Xm7SBQtG04lCP5RpZelASNa8RKvJzBijmmBqMkZ/L2pXr5VQ61Ak4diWARV+gJfUK6jC+hjTp9uI91Wj6uVLh6Yimi0CjQC+L3m5s4g+87zAxRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764881889; c=relaxed/simple;
	bh=loobrzi70Pz8tRGrBPxxU+Z3c+tNVIg/LFKhDULsEAI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qQlBQHTjSJFRmFLzlolgAMZFj+mHPAcl592tulT/AKB/1hPVAfELCTLHE3mPeuhVgfWwGiD18j7eQAv9gybac1Bn00Y55LL2EQ1zQvUfYaW2DlryAVrN1JZPLfkLsHY1OonAb8w9ZsmkwhzGxE1HVHekUvnT1tjajYMosq/ljsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uClXz34X; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uClXz34X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65F3AC4CEFB;
	Thu,  4 Dec 2025 20:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764881888;
	bh=loobrzi70Pz8tRGrBPxxU+Z3c+tNVIg/LFKhDULsEAI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=uClXz34XPXMkEKff3YIWkBOZ37RSNuVgI+nxzOy4TOM+DZPFXJFT5LoRMPVzQVDB+
	 eGM6XD/mm14R4hH1LID2HzwVCSwnLVXazDKHDElM9jZdFe2JxumKbIvocccvJw7wPX
	 SpavRLRZFhmxTuotit33kbMWKD3Jy9YkeXhOi9JHK2fZiONV1G26eNS58b05e1lX/M
	 WkkyCucIFVM9KECbZuASEanszKlXzX74vlOX2t8FAWc163PSPTdmjRIRhB4TQtECbE
	 XhqjHHjVFKU7pN+ZflKZPDUQdRq8mJjx1d3ZTOmZpCS1u3E39BiOePBI/xM0TBvqRB
	 QPZLVe7hqQKnA==
Message-ID: <48344838-d601-45ae-b260-01eb6b2fa422@kernel.org>
Date: Thu, 4 Dec 2025 21:58:01 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] mm, hugetlb: implement movable_gigantic_pages sysctl
To: Gregory Price <gourry@gourry.net>
Cc: linux-mm@kvack.org, kernel-team@meta.com, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, osalvador@suse.de, akpm@linux-foundation.org,
 lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, corbet@lwn.net,
 muchun.song@linux.dev, Mel Gorman <mgorman@suse.de>,
 Alexandru Moise <00moses.alexander00@gmail.com>,
 David Rientjes <rientjes@google.com>
References: <20251203063836.187016-1-gourry@gourry.net>
 <305328e0-3011-409c-a040-76fc478d541a@kernel.org>
 <aTHBjU5-Fio6CrwD@gourry-fedora-PF4VCD3F>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <aTHBjU5-Fio6CrwD@gourry-fedora-PF4VCD3F>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/4/25 18:14, Gregory Price wrote:
> On Wed, Dec 03, 2025 at 10:26:20AM +0100, David Hildenbrand (Red Hat) wrote:
>> On 12/3/25 07:38, Gregory Price wrote:
>>> This reintroduces a concept removed by:
>>> commit d6cb41cc44c6 ("mm, hugetlb: remove hugepages_treat_as_movable sysctl")
>>>
>>> This sysctl provides flexibility between ZONE_MOVABLE use cases:
>>> 1) onlining memory in ZONE_MOVABLE to maintain hotplug compatibility
>>> 2) onlining memory in ZONE_MOVABLE to make hugepage allocate reliable
>>>
>>> When ZONE_MOVABLE is used to make huge page allocation more reliable,
>>> disallowing gigantic pages memory in this region is pointless.  If
>>> hotplug is not a requirement, we can loosen the restrictions to allow
>>> 1GB gigantic pages in ZONE_MOVABLE.
>>>
>>> Since 1GB can be difficult to migrate / has impacts on compaction /
>>> defragmentation, we don't enable this by default. Notably, 1GB pages
>>> can only be migrated if another 1GB page is available - so hot-unplug
>>> will fail if such a page cannot be found.
>>
>> In light of the other discussion: will it fail or will it simplt retry
>> forever, until there is a free 1g page?
>>
> 
> It retries until a 1GB page is available.
> 
> Example test:
> 
> echo 0 > node0/hugepages/..-1GB/nr_hugepages (dram node)
> echo 1 > node1/hugepages/..-1GB/nr_hugepages (zone_movable node)
> ./alloc_huge &                               (allocate the page)
> ./node1_offline  &                           (offline > memory*/state)
> sleep 5                                      (give offline time)
> echo 1 > node0/hugepages/..-1GB/nr_hugepages (dram node)
> 
> This node1_offline generates migration failures until the last step
> occurs, at which point migration and node1_offline complete as expected.
> 
> The migration failures produce the following:
> 
> [  707.443105] migrating pfn c080000 failed ret:-12
> [  707.453353] page: refcount:2 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0xc080000
> [  707.471315] head: order:18 mapcount:1 entire_mapcount:1 nr_pages_mapped:0 pincount:0
> [  707.488504] anon flags: 0x17ffff0000000848(uptodate|owner_2|head|node=1|zone=3|lastcpupid=0x1ffff)
> [  707.508393] page_type: f4(hugetlb)
> [  707.515940] raw: 17ffff0000000848 ffa000007d873cc0 ffa000007d873cc0 ff1100082366c6e9
> [  707.533126] raw: 0000000000000000 0000000000000010 00000002f4000000 0000000000000000
> [  707.550317] head: 17ffff0000000848 ffa000007d873cc0 ffa000007d873cc0 ff1100082366c6e9
> [  707.567699] head: 0000000000000000 0000000000000010 00000002f4000000 0000000000000000
> [  707.585085] head: 17ffff0000000012 ffd4000302000001 0000000000000000 0000000000000000
> [  707.602469] head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000040000
> [  707.619851] page dumped because: migration failure
> 
> 
> I can add this to the changelog if you prefer

Yes, we should document that. I guess it's just what we already document 
in the memory hotplug doc: it keeps retrying until there is sufficient 
free memory.


-- 
Cheers

David
