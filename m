Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.230.114
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792485422;
	b=Ur8uq9QzUxoNnZXbY4dXEJR4I6kaI84GBp90rFsNaLC5CXBRqM21b6Zq2ZmeSzR5IE7B
	 YQIinYtHHciX/nw7wvgHoZLRrV95GhoqP9y8BcTs2mCnzx1KFg2egLzSbFP8Nq/7mZ/WS
	 89zEQbeon6/kwuAx8ojqtD85APpqu1B60R9P9UuVHHJGspt8gWp9Ct82EPEQKyFewC4eI
	 M61T7Dro84ve/eZIdlm2cRT0Z9EF7uYj9+VXIKxjornSgGUBqNi4D/dHan897IJN8ooU4
	 +j9oqJrI2uXREouHlKQBXH+zpfvWN0bF4vlLvDtKDCPI5GIhjm96Wc6x9VeJzxFsAXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792485422;
	h=DMARC-Filter:DKIM-Signature:From:Mime-Version:
	 Content-Transfer-Encoding:User-Agent:In-Reply-To:To:Cc:Date:
	 X-Lms-Return-Path:Subject:Message-Id:References:X-Original-From:
	 Content-Type;
	bh=47AFo55bTUHeomUi/clfAPlpyaEvHVred+SgTB3/Ous=;
	b=hhcvSOW3mSp3oW7rqaxirUK2qHKVJSQ22T/kpNi5tjKqhLY4sMpAYCHCGYwJvpYm5tNt
	 Tn2ltGsMftmmW7WdIifomlMLnbP2pRgW+cTiWDWihooRa1+yZmrqz/N6fk6DxsdAX44xK
	 aicHLYyseCZwjFIEFqt3n+mE2H2iGZGqam+uth7U2+2PbxY3JKXixMZvv7F32Bbp1pFPn
	 ndOT108orNNHeMHaY4o2KAE/a96gImNHu7nO88BUyGXYZH/6vRHph6otMZVrX1uj0EB4e
	 AKOcB38y6OrmFwdjq7grRKj5GSk7g/18GTJ7O1ppdUxqc0oFudXAduq2RNIRldW+eCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=jYdzB7kG;
	arc=none smtp.remote-ip=209.127.230.114
Received: from va-1-114.ptr.blmpb.com (va-1-114.ptr.blmpb.com [209.127.230.114])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15DA606A31B
	for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 08:37:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F15DA606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=jYdzB7kG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1792485416; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=47AFo55bTUHeomUi/clfAPlpyaEvHVred+SgTB3/Ous=;
 b=jYdzB7kGA0Hba7WfCZTIjuRRK7B4iYAqc+zen88TtjpqDyquimI0n5wDlOdftnsMOUovUf
 y00gGqoFL2W2zh32v1e6BYJx6SgkS8UwtARTsPw/hguyUSt0ZgHth/zwOTRCMVVbTJQ2A/
 WwLhQnwqjJ78dfSBMZtAL8kDPmGHYWNcDn7H0vGl6UqJe806oTIVfOldKYijFHQPo30oGS
 GC8jsUi9LndWo7p0WVsj/BW3ketjcA5uPV1y1l8SPMkN/aVGl8PV2lxz4B7tajuoXKxMnz
 mVC1TnTqOzqLfbGsTrOUBF1HxsOHlEZPhtSW7NbSO2ILt9XrchWttFBBSPpxDg==
From: "Li Zhe" <lizhe.67@bytedance.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
User-Agent: Mozilla Thunderbird
In-Reply-To: <atYsvc9gIejcuwew@gremlin>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: <akpm@linux-foundation.org>, <david@kernel.org>, <gourry@gourry.net>, 
	<ziy@nvidia.com>, <joshua.hahnjy@gmail.com>, <rakie.kim@sk.com>, 
	<ying.huang@linux.alibaba.com>, <mhocko@suse.com>, 
	<muchun.song@linux.dev>, <roman.gushchin@linux.dev>, 
	<shakeel.butt@linux.dev>, <weixugc@google.com>, 
	<cgroups@vger.kernel.org>, <linux-doc@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>
Date: Tue, 20 Oct 2026 16:36:33 +0800
X-Lms-Return-Path: <lba+26ad72826+5cd1eb+vger.kernel.org+lizhe.67@bytedance.com>
Subject: Re: [RFC 1/2] mm: add source selector to memory.reclaim
Message-Id: <661ba8ac-de50-4268-a2f1-3e0a1a228e09@bytedance.com>
References: <20261019141401.11927-1-lizhe.67@bytedance.com> <20261019141401.11927-2-lizhe.67@bytedance.com> <atYsvc9gIejcuwew@gremlin>
X-Original-From: Li Zhe <lizhe.67@bytedance.com>
Content-Type: text/plain; charset=UTF-8

On 10/19/26 10:51 PM, Lorenzo Stoakes (ARM) wrote:
> On Mon, Oct 19, 2026 at 10:14:00PM +0800, Li Zhe wrote:
>> memory.reclaim was added as a generic proactive reclaim
>> interface for memcgs, but memory tiering makes its practical
> ...
>> The source= key is intentionally typed so future selectors can be
>> added without reinterpreting the nodes form. For example, later
>> patches may add source=tier:<selector> or other source types while
>> keeping source=nodes:<nodelist> as the NUMA-node source selector.
> Similar comment for the commit message as below re: simplicity.
>
>> Signed-off-by: Li Zhe <lizhe.67@bytedance.com>
>> ---
>>   Documentation/admin-guide/cgroup-v2.rst | 23 ++++++++++++
>>   mm/internal.h                           |  3 +-
>>   mm/memcontrol-v1.c                      |  6 ++--
>>   mm/memcontrol.c                         | 11 +++---
>>   mm/vmscan.c                             | 48 +++++++++++++++++++++++--
>>   5 files changed, 81 insertions(+), 10 deletions(-)
>>
>> diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
>> index 86a2a0099178..a016575010ba 100644
>> --- a/Documentation/admin-guide/cgroup-v2.rst
>> +++ b/Documentation/admin-guide/cgroup-v2.rst
>> @@ -1454,6 +1454,7 @@ The following nested keys are defined.
>>
>>   	  ==========            ================================
>>   	  swappiness            Swappiness value to reclaim with
>> +	  source                Source to apply reclaim pressure to
>>   	  ==========            ================================
>>
>>   	Specifying a swappiness value instructs the kernel to perform
>> @@ -1464,6 +1465,28 @@ The following nested keys are defined.
>>   	The valid range for swappiness is [0-200, max], setting
>>   	swappiness=max exclusively reclaims anonymous memory.
>>
>> +	The source key declares where the normal reclaim aging pipeline is
>> +	applied. It is a typed selector in the form source=<type>:<selector>.
>> +	Currently only source=nodes:<nodelist> is supported. For example::
>> +
>> +	  echo "1G source=nodes:0-1" > memory.reclaim
>> +
>> +	This instructs the kernel to apply reclaim pressure to memory of target
>> +	cgroup that are currently resident on nodes 0 and 1. Reclaim then
>> +	follows the normal reclaim path for selected folios. The source
>> +	selector does not choose a demotion or eviction policy. On tiered
>> +	memory systems, a source node in a non-terminal tier will usually make
>> +	progress through demotion when an allowed demotion target exists. A
>> +	source node in the terminal tier has no demotion target, so successful
>> +	reclaim progress from that source is eviction.
>> +
>> +	The source selector is a source constraint only. It does not select or
>> +	limit demotion targets; those are still chosen by the kernel's memory
>> +	tier demotion policy. Specifying source does not change reclaim
>> +	completion accounting. On tiered memory systems, completion may include
>> +	demotion progress that moves folios away from the selected source nodes
>> +	without reducing memory.current.
>> +
> I'm no cgroup expert so I can't really comment on the concept overall, but can I
> ask please that you try to make this documentation FAR simpler and clearer?
>
> I have no idea what an 'aging pipeline' is, then the paragraphs dive into
> significant detail and I don't see why you would want this or what it's useful
> for?
By "aging pipeline" I meant the combined reclaim behavior that may
demote some folios and evict others, depending on the existing reclaim
policy. But I agree that this wording is confusing here.
>
> You should lead with that, and keep things simple, only introducing detail
> later.
>
> Right now it's 'types:selector' (only 1 trivial example given) -> reclaim
> follows 'normal' path (what is 'normal'?) -> for selected folios (who selects
> them? How is it relevant to _an admin_?) -> source selector (what?) does NOT
> choose a demotion/eviction policy (neither defined in document) -> source node
> in non-terminal etc. etc.
>
> It's very typical of LLM-generated text - it treats the reader as a computer
> with a large mental 'stack' for storing this information.
>
> Humans don't work that way.
>
> The document targets _admins_ and this text strikes me as very very confusing
> for kernel developers, let alone admins.
>
> It also seems to assume a lot of knowledge.
Sorry for the confusion. I will rewrite the cgroup-v2.rst text in v2 to
be much clearer and easier to read.

Thanks,
Zhe
>
> --
> Cheers, Lorenzo
