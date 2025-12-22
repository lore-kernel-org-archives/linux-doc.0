Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A7630F532;
	Mon, 22 Dec 2025 14:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766415534; cv=none; b=qUFvf9T1CHfriL2EzuV7DfW5w1xIduVh2ompddnwgDJoprUlYkNuyg1iVQ9PkjUU05CtljwoAVMptH1pgb+aMlNJ8qBDlwz1BN0yh9ZQ9eBFAZR9SLwR6uJnxPo+NrnJ7pVy1tz/7V+6e43XL/xwvQ7++nSF29gDRL66qNxF/Rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766415534; c=relaxed/simple;
	bh=b4wwckHCSEHA9/WsH/82v8iyuGooOfYc2si289h0qdk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=EcwOpU3iC+Zu171ODAccN+Q7VFRN0afSqgTp8Rnp+DbgBurgUhK5/b9oAxGM8PajOWDFq8m8zQUC1JqMkqSBeIrH2WhcP9ij6dvuC3viOvDKmznCGc7EozhpxHgdVpCSnqRUHNmhSL8QJOLgM/USakgkADsoiyGXi9sxsChm1v0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sf8cvv97; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sf8cvv97"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95BA5C4CEF1;
	Mon, 22 Dec 2025 14:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766415533;
	bh=b4wwckHCSEHA9/WsH/82v8iyuGooOfYc2si289h0qdk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Sf8cvv973Ocy86SIfrhCawHgAShUAwMSVQXJmWzuodPbT41k1EQD8ytVx625GsbjA
	 SW8CeuEhVcF9igA8P6YYwwKKILnQ4wtjZ9NJUZC8GVOJy1YFzowIKCHG9Wpke6Cd3p
	 4hlh6ZLKMflh9K4G4Fn2woo7rNi6d3jEcqdrNbRMhKV4lClYGgNb/eEA1oF9C9q53H
	 PjiLu8ZRc9IoV32IPqFBobyygCnl0aDln4g75qhv3K1GZNkghCwfXPs4qohTcHGSXW
	 Mqh2ghyKhw/orybk4h09OSXMzd0E0OMiPtbla5X7ljWCIHF1WJ1K2PrewNZlPqPMoN
	 ptWtwVifEgDeQ==
From: Pratyush Yadav <pratyush@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Mike Rapoport <rppt@kernel.org>,
  Andrew Morton <akpm@linux-foundation.org>,  David Hildenbrand
 <david@kernel.org>,  Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,  "Liam
 R. Howlett" <Liam.Howlett@oracle.com>,  Vlastimil Babka <vbabka@suse.cz>,
  Suren Baghdasaryan <surenb@google.com>,  Michal Hocko <mhocko@suse.com>,
  Jonathan Corbet <corbet@lwn.net>,  Thomas Gleixner <tglx@linutronix.de>,
  Ingo Molnar <mingo@redhat.com>,  Borislav Petkov <bp@alien8.de>,  Dave
 Hansen <dave.hansen@linux.intel.com>,  x86@kernel.org,  "H. Peter Anvin"
 <hpa@zytor.com>,  Muchun Song <muchun.song@linux.dev>,  Oscar Salvador
 <osalvador@suse.de>,  Alexander Graf <graf@amazon.com>,  David Matlack
 <dmatlack@google.com>,  David Rientjes <rientjes@google.com>,  Jason
 Gunthorpe <jgg@nvidia.com>,  Samiullah Khawaja <skhawaja@google.com>,
  Vipin Sharma <vipinsh@google.com>,  Zhu Yanjun <yanjun.zhu@linux.dev>,
  linux-kernel@vger.kernel.org,  linux-mm@kvack.org,
  linux-doc@vger.kernel.org,  kexec@lists.infradead.org
Subject: Re: [RFC PATCH 04/10] liveupdate: flb: allow getting FLB data in
 early boot
In-Reply-To: <CA+CK2bDWF6pbNQRkJFa+WcD1pwUOr3yQdrRUs-mgLWu5ght+7A@mail.gmail.com>
	(Pasha Tatashin's message of "Sat, 20 Dec 2025 10:11:34 -0500")
References: <20251206230222.853493-1-pratyush@kernel.org>
	<20251206230222.853493-5-pratyush@kernel.org>
	<CA+CK2bAV1y_LySjyj-wcn1cdSuVBdC+r+zQL7AQTY64nk3OxuQ@mail.gmail.com>
	<86wm2hj0ky.fsf@kernel.org>
	<CA+CK2bDWF6pbNQRkJFa+WcD1pwUOr3yQdrRUs-mgLWu5ght+7A@mail.gmail.com>
Date: Mon, 22 Dec 2025 23:58:43 +0900
Message-ID: <86o6nqd0m4.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Sat, Dec 20 2025, Pasha Tatashin wrote:

>> > [Follow-up from LPC discussion]
>> >
>> > This patch is not needed, you can use liveupdate_flb_get_incoming()
>> > directly in early boot. The main concern is that we take mutex in that
>> > function, but that I think is safe. The might_sleep() has the proper
>> > handling to be called early in boot, it has "system_state ==
>> > SYSTEM_BOOTING" check to silence warning during boot.
>>
>> Right. I will give it a try. For hugetlb, this works fine since it
>> doesn't really need to do much in FLB retrieve anyway, it just needs to
>> parse some data structures.
>>
>> If other subsystems end up needing a two-part retrieve, one in early
>> boot and one later, then I think it would be a good idea to model that
>> properly instead of leaving it up to the subsystem to manage it.
>>
>> Anyway, that isn't a real problem today so let's look at it when it does
>> show up.
>
> FLB has exactly one .retrieve() lifecycle event. Once called, the data
> is considered fully available and cached in private->incoming.obj.
>
> If a subsystem has a requirement where it needs a specific state
> available very early and other state available much later, the clean
> solution is simply to register two separate FLBs.

Hmm, that can work too. Anyway, let's figure that out when there is a
real use case. For now, the current FLB design works fine.

-- 
Regards,
Pratyush Yadav
