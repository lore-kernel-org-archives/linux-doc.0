Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B18416D4FF
	for <linux-doc@vger.kernel.org>; Thu, 11 Jul 2024 17:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720719591; cv=none; b=hfMRf7z9zSKyWEYRtU719JX6CmMC8AFtoRQdL+7DY4OPYsMv5CaCykfWxv/UiRg/nuKTnIB04FznPhEMaUEhb1s04EjnAIPx6KXrd4HdssL30Mfkhu0UoTMJPEZYs23A5zGip9f2/RZYVnAQAEnfddGDIgcPHyYZHxzyhsnWzgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720719591; c=relaxed/simple;
	bh=GGNdZmFRFBz6EaOq4XOW+ceRx/DPUWKVqohHaWzsrxA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KsADivQFMAQOhDMp+SDaDEJwILJ+LzTSqV5fwLBT5m+ccRiwsb36RafPAsRckHyLij7nz/iX6zGPX642YkIvbfCGx4AqN6Z8yoq0Wd3Tbw5Zd/AVnm1QvKv4LgeISkqkBxKWqtHijilDxvYAeIPHuMaKU5vHum4tql7nIF8YXbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=P/xa2m9G; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="P/xa2m9G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720719589;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r9jBDSWTVfESQnrltmAdAwRr7rLlVt6HaSz0exzsPXg=;
	b=P/xa2m9GNg030QayStsgEFoqJZMEHv/Ce9qGz7KTR8mushhN5uFjdZ80UudU4xF9nYwHEP
	BnyzH+/eEqCBsCnxS8WEjdwgqHpBPLMX5dyNp3Nd8MTOytmmMb0K3TBehJJFVscYic2hha
	4f0ybXnupKacHCUt0wPu+NAlJP4EZSQ=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-382-E3hYc5UjPuKko9-vw5Gu-A-1; Thu,
 11 Jul 2024 13:39:44 -0400
X-MC-Unique: E3hYc5UjPuKko9-vw5Gu-A-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 90EF319560B1;
	Thu, 11 Jul 2024 17:39:41 +0000 (UTC)
Received: from [10.22.64.119] (unknown [10.22.64.119])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 75F0D19560AE;
	Thu, 11 Jul 2024 17:39:39 +0000 (UTC)
Message-ID: <76e70789-986a-44c2-bfdc-d636f425e5ae@redhat.com>
Date: Thu, 11 Jul 2024 13:39:38 -0400
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] cgroup: Show # of subsystem CSSes in cgroup.stat
To: Tejun Heo <tj@kernel.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Zefan Li <lizefan.x@bytedance.com>,
 Jonathan Corbet <corbet@lwn.net>, cgroups@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Kamalesh Babulal <kamalesh.babulal@oracle.com>,
 Roman Gushchin <roman.gushchin@linux.dev>
References: <20240710182353.2312025-1-longman@redhat.com>
 <20240711134927.GB456706@cmpxchg.org>
 <4e1078d6-6970-4eea-8f73-56a3815794b5@redhat.com>
 <ZpAT_xu0oXjQsKM7@slm.duckdns.org>
Content-Language: en-US
From: Waiman Long <longman@redhat.com>
In-Reply-To: <ZpAT_xu0oXjQsKM7@slm.duckdns.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12


On 7/11/24 13:18, Tejun Heo wrote:
> Hello,
>
> On Thu, Jul 11, 2024 at 10:05:22AM -0400, Waiman Long wrote:
>> Given the fact that for_each_css() iteration is filtering out csses that are
>> absent, the dying counts follow the same logic of skipping it if there is no
>> dying css. That also makes it easier to identify cgroups with dying
>> descendant csses as we don't need filter out entries with a 0 dying count.
>> It also makes the output less verbose and let user focus more on what are
>> significant.
>>
>> I do understand that it makes it inconsistent with the ways nr_descendants
>> and nr_dying_descendants are being handled as entries with 0 count are also
>> displayed. I can update the patch to display those entries with 0 dying
>> subsys count if other people also think that is the better way forward.
> I think it'd be better to have all the keys. There are some dynamic keys in
> stat files but those are mostly for things which can come and go (e.g. block
> and misc devices), so yeah, I think it'd be better to show all the keys even
> when they're zero.
Currently, I use the for_each_css() macro for iteration. If you mean 
displaying all the possible cgroup subsystems even if they are not 
enabled for the current cgroup, I will have to manually do the iteration.
>
> Also, I personally would much prefer if the same prefixes are collected
> together - ie. totals first and then dying. It's just a lot easier on the
> eyes that way.
>
> 	nr_subsys_cpu
> 	nr_subsys_memory
> 	nr_subsys_io
> 	...
> 	nr_dying_subsys_cpu
> 	nr_dying_subsys_memory
> 	nr_dying_subsys_io
> 	...

That is fine. I can group entries with the same prefix together.

Cheers,
Longman

