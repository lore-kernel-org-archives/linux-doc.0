Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E3A28A415
	for <linux-doc@vger.kernel.org>; Wed, 28 May 2025 15:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748447138; cv=none; b=mlvtQuziKakmIDhzAkj9EGDOT1QH71v0vrUICqkxXsDBllhtjke/TYLr4NedCoq4OuVd5guqdcd3LZ1gAaiZoXlgYJXF6uUKLtV4rpxoPXosJFVY1H4ClJoQpRQj9W3CMoo/wiZ1xbnN9Jwvhl6LfKPBsfAWB23hR/ROvUm3Xas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748447138; c=relaxed/simple;
	bh=/CbNirfnMFT6iFLSja2Zj2oVfKKWn3klp7446jTgwUs=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:References:
	 In-Reply-To:Content-Type; b=akRKgwIBMhaoQcoGhCXQ7XXScNsadAvAbkKvNSEjS7+R6RV8wH7BXxlmUHqbq+pppE6SGSsKpZDae2xfuBqZqF2W8Ja6iOoa42d9XFdZhozhthBPYDs+TuRU6RstLk2EMO9hASJ+xRuidHiXxXSO01kGUfjj6KbXoTWt7vwKVxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gIlkdiOn; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gIlkdiOn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748447134;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pyLOwGypbK7cil/VDfYgN1Gr/yfNRiyW37n+n15jPLw=;
	b=gIlkdiOnCtea0VdQoZOFxJQVTXWAAe8GTkTAcDCvapEC01qXZ6Uudkpe2KEVTX4LhIxckT
	PpJ9TpCJf8B/XaQAGpnvRGOAzqQS++IVETWNWBSN3sGSw7h+ew788rMed9hiWxfkmUYqSc
	sNi0QKL5CHYpUn8Uec/KWFcDC2fr7G8=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-101-n-ch8fMFO2O7G7kYhko3oQ-1; Wed, 28 May 2025 11:45:32 -0400
X-MC-Unique: n-ch8fMFO2O7G7kYhko3oQ-1
X-Mimecast-MFC-AGG-ID: n-ch8fMFO2O7G7kYhko3oQ_1748447132
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5e28d0cc0so719437085a.3
        for <linux-doc@vger.kernel.org>; Wed, 28 May 2025 08:45:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748447132; x=1749051932;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pyLOwGypbK7cil/VDfYgN1Gr/yfNRiyW37n+n15jPLw=;
        b=bR0I6yB+/kKrw55rMoo5ec59sszp1RnKuGc/9AKLwmnpvxXCKsLHJOcBQCNafx2yrc
         7fbL6N5yET2njEzEtGBaizbzvlg7qstfVRS5nA7sTU+IvCZi/w2oAVVOX8/VRxhfyagd
         LdZSSTgJVsSxAXXUJpY9laQZzj3Z0j8crAA5cNMcnPYMeg77JXhsoSW+rrS+DqYCn1kj
         pB9Za/soTDbDmhwCsFcEFe6BA5gbDgUN1YQzFdAUU4Xnm1ywek5IIjWD9hvmyEVMz6t4
         RC13eZfOYXpCcWJ2Sax6MW0DclyCgy92W7HdZbG1+ZhcjOy9GxRu0OASNez2WWuJkBKq
         ekAg==
X-Forwarded-Encrypted: i=1; AJvYcCWvy+5U/3d29oc0v5ZC0eJMF2QGDx6HZmNRjsPn6z7XT9//aLd1wf/lYUX1Re4DkLs5tMOC5bG0cMw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHtTNvMs9Y0vDukq0lpgNkupQv8fauIU283s9pyEILp4vSFx9e
	hprk+sl1F8nmREqLWpz2HsncKpHL/ab/V+NWahkJOb0rb8Y6Kk3zKNgxWfYfDb6IL5CvxPf/Va1
	BuLwBPCygi2I7p0Qr2WXiCojNa0u/AQ4ew4Rd+/pttnKvM5bmGHnyIISnoCR+3Q==
X-Gm-Gg: ASbGnctKKuSTG7ET+uT+jTmcF9ldhTDw/KPrFFIRDqwQ7fK/l2xRslowXPDTp1PtQZT
	UXC84pc2Y4D+ZsCyNfI6qpmHjaiwHM1p8USaHKszH4U74FYo7hhZAlVMnKD+8pKqv1ItMpzJQ+l
	FC6hn0RoVxNkVSNyKkuVF22l8PwgIetUl62nVtqwi0s3iskPeCJW277G+cATJIehpcpZLhJvs+Y
	+C68yzelZbQ5/BtwT21s77HXgpbYQ9RNGloqrV0b4BXIC8TXIEBZVYIAHfOJ7roZk4sMOnF5abQ
	8Y28U90FDC37
X-Received: by 2002:a05:620a:2952:b0:7ce:e010:88bb with SMTP id af79cd13be357-7cfc5d3bea0mr319655485a.22.1748447132196;
        Wed, 28 May 2025 08:45:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGUqlAX9B3FIW5eZMrtvbf91YzWhqy3WejI0SBLhs/OnmLka0kFn2dRtq7rU7LdniOGPnZkrQ==
X-Received: by 2002:a05:620a:2952:b0:7ce:e010:88bb with SMTP id af79cd13be357-7cfc5d3bea0mr319652185a.22.1748447131835;
        Wed, 28 May 2025 08:45:31 -0700 (PDT)
Received: from [172.20.4.10] ([50.234.147.137])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cfb82002bdsm84495085a.17.2025.05.28.08.45.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 08:45:31 -0700 (PDT)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <a9d0e503-ec70-41a7-adb2-989082e4d9f2@redhat.com>
Date: Wed, 28 May 2025 11:45:29 -0400
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation: cgroup: clarify controller enabling
 semantics
To: Vishal Chourasia <vishalc@linux.ibm.com>, Tejun Heo <tj@kernel.org>,
 Johannes Weiner <hannes@cmpxchg.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?=
 <mkoutny@suse.com>, Jonathan Corbet <corbet@lwn.net>,
 cgroups@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250527085335.256045-2-vishalc@linux.ibm.com>
 <99be9c8e-a5c4-4378-b03b-2af01608de9f@redhat.com>
Content-Language: en-US
In-Reply-To: <99be9c8e-a5c4-4378-b03b-2af01608de9f@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 5/28/25 11:23 AM, Waiman Long wrote:
> On 5/27/25 4:53 AM, Vishal Chourasia wrote:
>> The documentation for cgroup controller management has been updated to
>> be more consistent regarding following concepts:
>>
>> What does it mean to have controllers
>> 1) available in a cgroup, vs.
>> 2) enabled in a cgroup
>>
>> Which has been clearly defined below in the documentation.
>>
>> "Enabling a controller in a cgroup indicates that the distribution of
>> the target resource across its immediate children will be controlled.
>> Consider the following sub-hierarchy"
>>
>> As an example, consider
>>
>> /sys/fs/cgroup # cat cgroup.controllers
>> cpuset cpu io memory hugetlb pids misc
>> /sys/fs/cgroup # cat cgroup.subtree_control # No controllers by default
>> /sys/fs/cgroup # echo +cpu +memory > cgroup.subtree_control
>> /sys/fs/cgroup # cat cgroup.subtree_control
>> cpu memory                   # cpu and memory enabled in /sys/fs/cgroup
>> /sys/fs/cgroup # mkdir foo_cgrp
>> /sys/fs/cgroup # cd foo_cgrp/
>> /sys/fs/cgroup/foo_cgrp # cat cgroup.controllers
>> cpu memory                   # cpu and memory available in 'foo_cgrp'
>> /sys/fs/cgroup/foo_cgrp # cat cgroup.subtree_control  # empty by default
>> /sys/fs/cgroup/foo_cgrp # ls
>> cgroup.controllers      cpu.max.burst           memory.numa_stat
>> cgroup.events           cpu.pressure            memory.oom.group
>> cgroup.freeze           cpu.stat                memory.peak
>> cgroup.kill             cpu.stat.local          memory.pressure
>> cgroup.max.depth        cpu.weight              memory.reclaim
>> cgroup.max.descendants  cpu.weight.nice         memory.stat
>> cgroup.pressure         io.pressure memory.swap.current
>> cgroup.procs            memory.current memory.swap.events
>> cgroup.stat             memory.events           memory.swap.high
>> cgroup.subtree_control  memory.events.local     memory.swap.max
>> cgroup.threads          memory.high             memory.swap.peak
>> cgroup.type             memory.low memory.zswap.current
>> cpu.idle                memory.max              memory.zswap.max
>> cpu.max                 memory.min memory.zswap.writeback
>>
>> Once a controller is available in a cgroup it can be used to resource
>> control processes of the cgroup.
>>
>> Signed-off-by: Vishal Chourasia <vishalc@linux.ibm.com>
>> ---
>>   Documentation/admin-guide/cgroup-v2.rst | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/admin-guide/cgroup-v2.rst 
>> b/Documentation/admin-guide/cgroup-v2.rst
>> index 1a16ce68a4d7..0e1686511c45 100644
>> --- a/Documentation/admin-guide/cgroup-v2.rst
>> +++ b/Documentation/admin-guide/cgroup-v2.rst
>> @@ -438,8 +438,8 @@ Controlling Controllers
>>   Enabling and Disabling
>>   ~~~~~~~~~~~~~~~~~~~~~
>>   -Each cgroup has a "cgroup.controllers" file which lists all
>> -controllers available for the cgroup to enable::
>> +Each cgroup has a cgroup.controllers file, which lists all the 
>> controllers
>> +available for that cgroup and which can be enabled for its children.
>
> I believe breaking the sentence into two separate components is 
> actually making it less correct. There are implicit controllers that 
> are always enabled and do not show up in cgroup.controllers. Prime 
> examples are perf_event and freezer. IOW, only controllers that are 
> available and need to be explicitly enabled will show up.

A correction: The cgroup.controllers file shows the controllers that are 
available in the current cgroup and which have to be explicitly enabled 
in cgroup.subtree_control to make them available in the child cgroups.

Cheers,
Longman

