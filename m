Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F9016E89E
	for <linux-doc@vger.kernel.org>; Thu, 11 Jul 2024 18:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720723913; cv=none; b=YVU0SYIdLVyVMHfwtTlCWKqlzeob/VPO4L3FVICoIt1h8o3e9+sKXYdQRbuwBdzYkw7rLOmmgtOsvEUWq2EtfO36g+0ddjZJCRvvtVQIz272VyddbfJLlQ4E0Mn6UUfFpzE5lGj2uySKQagOcVbcLIVveHEUY0daK/U9umu7R9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720723913; c=relaxed/simple;
	bh=kJgnyZJmTIZWiaq/8wgNOqqligyS0aPHx4XJaiekigI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bYif4gLY1vkIMv63pRv/G7Wb0H3YCZcm7GsTkEiXvurYLl4xbfsEnhOCz9A4awW3pKdVPukYDlrxPUyF2DMeLzYjPcRWJpsYVeqRkJqnmsy8Vl05fBlEo429t8Xtg0X6dYOd6ZRw0bS97H4qO+td1jT1KFkiTmD1tK55/0FmlvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ja3wJGeD; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ja3wJGeD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720723911;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L+8VkDMg5rXcNaGpGB1C4wflAad1p4QYwIpbR6K358E=;
	b=Ja3wJGeD81Pq2Ytc6PoL+z2RwCIy7dhPw2mXv/9ebFt4DuVjbhAUIYtll+0KArG3+YtkEB
	ro85uiEtMoxmeL6pJhqqUaozdbMjddwnQnJ6+S1Zc2otI8alhnVTscsegxgKw/uuj2M6UJ
	4wHE2yx9+AX03SInN5cbzLUCZc/yQvs=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-315-G3BpfuwMO1C38ZL0D_ljRw-1; Thu,
 11 Jul 2024 14:51:44 -0400
X-MC-Unique: G3BpfuwMO1C38ZL0D_ljRw-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 991CE1958B0E;
	Thu, 11 Jul 2024 18:51:41 +0000 (UTC)
Received: from [10.22.64.119] (unknown [10.22.64.119])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 8C85D1955F40;
	Thu, 11 Jul 2024 18:51:39 +0000 (UTC)
Message-ID: <e5348a85-22eb-48a6-876d-3180de5c7171@redhat.com>
Date: Thu, 11 Jul 2024 14:51:38 -0400
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
 <76e70789-986a-44c2-bfdc-d636f425e5ae@redhat.com>
 <ZpAoD7_o8bf6yVGr@slm.duckdns.org>
Content-Language: en-US
From: Waiman Long <longman@redhat.com>
In-Reply-To: <ZpAoD7_o8bf6yVGr@slm.duckdns.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17


On 7/11/24 14:44, Tejun Heo wrote:
> Hello,
>
> On Thu, Jul 11, 2024 at 01:39:38PM -0400, Waiman Long wrote:
>> On 7/11/24 13:18, Tejun Heo wrote:
> ...
>> Currently, I use the for_each_css() macro for iteration. If you mean
>> displaying all the possible cgroup subsystems even if they are not enabled
>> for the current cgroup, I will have to manually do the iteration.
> Just wrapping it with for_each_subsys() should do, no? for_each_css() won't
> iterate anything if css doesn't exist for the cgroup.

OK, I wasn't sure if you were asking to list all the possible cgroup v2 
cgroup subsystems even if they weren't enabled in the current cgroup. 
Apparently, that is the case. I prefer it that way too.

Thanks,
Longman

