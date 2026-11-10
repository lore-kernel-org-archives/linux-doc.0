Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794311666;
	b=ywFtNeOFKRmtZVv0c64YB0BO0JpojJmIIY4exNz4AoQtdeeswBX/BvFwlVyoIrq0bBrc
	 l7cLwarIzxdi1OqYgxiAGNE3ZDPDgGQy0k1rOwi3w07EEvmNlzbaj4NzHmJcXuLE1ovIT
	 mDA4S/TY0ZZOm8U6TrQFo0rVZFARHvUGKqaH8zBZyMs9wHJ6lDpNG1ji9h0Lro0Kg2Ckz
	 6w/ojPUUz7liBjHlZ7HSfOOjiXnHCMSqwLrDail47VRlvx7fniyXAEynFwVmpBOZPxBG1
	 fGipO6uthUUTBkn3A/SIYW29O26BBRJM3fiRdlaohIlJXlYS1XLxdoWs3vXVDhYtXIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794311666;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=7WXfVCVuf8uXYy2DZQnojC5ljvRy+PP3sdHEmJdjQAk=;
	b=a79VB7n0EOvOgVi7VgmPNkafs7/TQyuiI53s5ltp14G7/G/K4HMCHpxFR++N7m2LwuTv
	 a9T6g6EnRajzA+TPoyU6lcXu9zQoJjvKQaMZ20Pkym/vMYwZHogkpdodusks5D5s4sfU/
	 azdnxS4iXNrnWwn2VGC7lqmwd20YcBKfXPopUEke0+yJnEkPyRkFi3FUJat54jyZbRw/1
	 /QftIlJguAx7JwqFXgcuymDz3vOpXquLgSrVgWD7nDlKCf8mvjitclsVvTeUt0Nc549K2
	 nQ/jyE1tlbE60m9Mvl2fXSnPNaBq/Prt32uz5SyjLu4bo14asRUs/+wwAxVrMFbU1ZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PvPHTv4u;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BDBD606A9A9
	for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 11:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PvPHTv4u
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC03D1F008A1;
	Tue, 10 Nov 2026 11:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794311665;
	bh=7WXfVCVuf8uXYy2DZQnojC5ljvRy+PP3sdHEmJdjQAk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=PvPHTv4u5XDMIkz+tNdsAkpxlI2GSaLdB22KQ+CkbqmoSCOTtaX4li1Civgvbq8Da
	 5H3WjEDe60cW/mOlTXgGA+4yAPTafLe/cRIi7Qh3X13H3heCRD8AMdPo68Dh60az+Z
	 NAYSda3bbR01apCSJ8seyXFtpysD41xR0nnbz4luv02FolbQOPXoR9jPsBYPpuujY6
	 n5B0C5fCF3nlI1iLxaQLsLH6ViDBFWsAJX1VaZVAbhDD1+ULOBrrIwHSz6HNYboTZv
	 BX5keLxP55jUMWXuESmgjQV1fame0xkhVbDp/iL+5WeYpPiYzWyunb5LynRubfkCpQ
	 2uLi4apjTLjRw==
Message-ID: <c092dbef-515b-4575-8669-efef8ebb6e29@kernel.org>
Date: Tue, 10 Nov 2026 12:54:19 +0100
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
Subject: Re: [PATCH resend] ksm: add merge_only_zero_pages to merge only empty
 anonymous pages
To: "Xu Xin (vivo)" <xu.xin@linux.dev>
Cc: g@dgvxl46587.localhost.localdomain,
 Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>,
 Chengming Zhou <chengming.zhou@linux.dev>,
 Lorenzo Stoakes <lstoakes@gmail.com>,
 "Liam R . Howlett" <liam.howlett@oracle.com>, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, Huan Yang <link@vivo.com>,
 Wang Xiao <xiao.wang@vivo.com>
References: <20261106034841.233085-1-xu.xin@linux.dev>
 <899b1b2b-4f6c-45e2-abd6-a333ac77b23b@kernel.org>
 <avEkWyGoKsVlCCRG@dgvxl46587.localhost.localdomain>
 <3e126b7a-d7d9-4a8c-9c83-b6fbf5bf1539@kernel.org>
 <avJ0p8ZfjZc9EewW@dgvxl46587.localhost.localdomain>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <avJ0p8ZfjZc9EewW@dgvxl46587.localhost.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/10/26 02:34, Xu Xin (vivo) wrote:
> On Mon, Nov 09, 2026 at 06:41:39PM +0100, David Hildenbrand (Arm) wrote:
>> On 11/9/26 02:39, Xu Xin (vivo) wrote:
>>>
>>> Ha, fair question :) This came from our own investigation. We were looking
>>> into whether KSM can actually provide benefits on Android phones, and this
>>> observation came from real-world application workloads. To be fully honest:
>>> I did use an LLM to help polish the English wording of the commit description,
>>> but I carefully rechecked and verified every sentence myself..
>>
>> The reason why I ask is that this effectively disables most deduplication where
>> KSM was originally invented for: VMs running the same kernels, libaries,
>> executables etc.
> 
> Yes, it closes the original scenarios like KVM, so I wrote a Note to say that in
> commit description and Documentations. But it opens up some new application scenarios
>  — scenarios with high security and low cpu-consuming requirements, where merging
> zero pages alone can already bring benefits.
> 
>>
>> So yeah, disabling most deduplication shrinks side-channels ... by disabling the
>> core functionality of KSM, to dedupicate pages with the same content :)
>>
>>>
>>>
>>> We still keep the stable/unstable tree data structures, but zero-page merging
>>> does not participate in the stable/unstable tree search path. One more reason
>>> for keeping them is that merge_only_zero_page is designed as a dynamic knob
>>> that can be toggled at runtime, so when it is disabled KSM can fall back to
>>> the traditional full KSM behavior.
>>
>>
>> What's the memory overhead from keeping these datastructures in the
>> merge_only_zero_page-only path?
> 
> In the merge_only_zero_page-only path of current implementation, the main memory
> overhead comes from the ksm_rmap_items for non-zero pages, RB trees of stable and
> unstable, and mm_slots.
> 
> If the allocation of rmap_item can be avoided (following Tu Jinjiang’s idea), then
> only the stable_tree and unstable_tree remain, which are basically empty, and these
> overheads become so low that they are negligible. The mm_slots are essential so can't
> be avoid, but won't take up much memory.

Okay, so that's the right approach then.

-- 
Cheers,

David
