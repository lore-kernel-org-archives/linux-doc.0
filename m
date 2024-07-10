Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FCD3158861
	for <linux-doc@vger.kernel.org>; Wed, 10 Jul 2024 23:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720655504; cv=none; b=PPiXBtpLFG1YQMxpOu6UhjiriI0Sv8Cus5CaPThCKKsGv3wDLY6dHMBrNSfOf7Yo780cGTYeJVQ8tf93rucb3g6qHu9PqvWvgHFeGhskCBCO1rZ60EnJTrmekKpmzpxP3XG2Zh7qt5yIMM1+v7DqhxwSKROIK+Jo2DGN5nVK4sM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720655504; c=relaxed/simple;
	bh=npGFZ7+tSqeY2xxryGCHThpOWXBJ+gAv7JI9axGTi9k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MuKAbMZfRfZVoEtoMhk0DEXsuGMWWc2exfPKGSt8UkrAiDorA6GrKcRxYe9iaN7I0xPDQf5CBi9cvyESvi6IKXPK6nYBJoB5/WzTeUvWcAqrNC4t+u7ib+Z/R+3+zEgOGDaV0FrtttETNsuVyk00gfehp/2PFcSs+rkl9TsSv5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YpTVwY0G; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YpTVwY0G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720655501;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NA5BtkAtts8DBgOsaPfYF+PKA9KEchHy7+koVC7lhY8=;
	b=YpTVwY0GBWj/zG6qgS6Pfi9bw0Ef1gDOU5Bl87LvXi/pjCb5nsIYGkPQisW0XfpPGSrsCJ
	YMd1+jF7T62NNYBuIRevx59cjXwjgIbY2WHHWP3JWPRpt64UQasAdj6zehHQ731/fEzxzs
	vX69caKvda+VSvtQvEDIK28Q/KaKz60=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-54-gbRn394WMUSJ9IOq0kwrXQ-1; Wed,
 10 Jul 2024 19:51:35 -0400
X-MC-Unique: gbRn394WMUSJ9IOq0kwrXQ-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7AAEF1955F43;
	Wed, 10 Jul 2024 23:51:33 +0000 (UTC)
Received: from [10.22.48.10] (unknown [10.22.48.10])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5DBBC1955F40;
	Wed, 10 Jul 2024 23:51:31 +0000 (UTC)
Message-ID: <fc72e655-bb17-4b55-b00e-1fc640d35d77@redhat.com>
Date: Wed, 10 Jul 2024 19:51:30 -0400
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] cgroup: Show # of subsystem CSSes in cgroup.stat
To: Tejun Heo <tj@kernel.org>
Cc: Zefan Li <lizefan.x@bytedance.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Jonathan Corbet <corbet@lwn.net>, cgroups@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Kamalesh Babulal <kamalesh.babulal@oracle.com>,
 Roman Gushchin <roman.gushchin@linux.dev>
References: <20240710182353.2312025-1-longman@redhat.com>
 <Zo8ELsGOyFwkpKUj@slm.duckdns.org>
Content-Language: en-US
From: Waiman Long <longman@redhat.com>
In-Reply-To: <Zo8ELsGOyFwkpKUj@slm.duckdns.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17


On 7/10/24 17:59, Tejun Heo wrote:
> Hello,
>
> On Wed, Jul 10, 2024 at 02:23:52PM -0400, Waiman Long wrote:
>> With this patch applied, a sample output from root cgroup.stat file
>> was shown below.
>>
>> 	nr_descendants 54
>> 	nr_dying_descendants 44
>> 	nr_cpuset 1
>> 	nr_cpu 40
>> 	nr_io 40
>> 	nr_memory 54
>> 	nr_dying_memory 44
>> 	nr_perf_event 55
>> 	nr_hugetlb 1
>> 	nr_pids 54
>> 	nr_rdma 1
>> 	nr_misc 1
> So, css may be too specific a name but this looks a bit disorganized. How
> about using controller as the common prefix? Maybe something like:
>
> 	nr_controllers_cpu 40
> 	nr_controllers_io 40
> 	nr_controllers_memory 54
> 	nr_controller_perf_event 55
> 	...
> 	nr_dying_controllers_memory 44
>
> If controllers is too long, we can shorten it somehow or use subsys, maybe?

I think "controllers" is too long. I am fine with "subsys". Will make 
change in the next version.

Thanks,
Longman

