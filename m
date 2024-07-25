Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F9B2E639
	for <linux-doc@vger.kernel.org>; Thu, 25 Jul 2024 20:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721937956; cv=none; b=LHcPUYlNii+cGzkflWtx6g596tkWO0DDdWNBVJ7p1INTFMJ/90s17j0NqQqdwWm/ed3KW5zB1VUGTdwu3TmQq5pkRvvQPWwbc40aO8NMJCgemxaKh2WKyS3eRFbedMsZQPtBkpM6MvhruPNPWAFe0AwlbniQpxjP0tgHVm980rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721937956; c=relaxed/simple;
	bh=UW91kuFO41axvxJ8V7sJ0z+GizMtuU+3srRDDSY3mvA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cEml5RxXLcKecmFdlNR2LGkLpB+WWTRcnEm9a9g4O0830yDaOfJfIBTTUO0DUnQot1ULAx1g4g8Ql1tAWkcJO8f7mmgfqKce/Nin8OvA1EjGkyWpIVIVqcpOonqAXaqOBB4xCQtA3wcGLzKYSxhevoiIv5nKw9sOjcbe/20aMkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IPgjIZMo; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IPgjIZMo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721937953;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aUymR9o4DYjzOTl7c3KR4Ou4Nok+LgIjjvkA2tKEErA=;
	b=IPgjIZMoQoyKhbuI+WXVRV2H3b2X1uGFfZgys3N8hDRdS6UM03qf6yX9X1/YWLQB06qV44
	Rwic/0FA2ZylGrLHyeAG/YeSWsiM6ynXYKvnAv+W6ay8hk8mB6AYQUAVJbuvaxea0V+hnq
	/WgVbWOoFXuhgmES0r4dnK5MCrMwMJM=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-593-bUV5E0sZMqOn9tJ-IY5nEw-1; Thu,
 25 Jul 2024 16:05:49 -0400
X-MC-Unique: bUV5E0sZMqOn9tJ-IY5nEw-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 77FF61955BF8;
	Thu, 25 Jul 2024 20:05:47 +0000 (UTC)
Received: from [10.2.16.78] (unknown [10.2.16.78])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4151C300019A;
	Thu, 25 Jul 2024 20:05:43 +0000 (UTC)
Message-ID: <0efbedff-3456-4e6a-8d2d-79b89a18864d@redhat.com>
Date: Thu, 25 Jul 2024 16:05:42 -0400
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-cgroup v4] cgroup: Show # of subsystem CSSes in
 cgroup.stat
To: =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>
Cc: Tejun Heo <tj@kernel.org>, Zefan Li <lizefan.x@bytedance.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Jonathan Corbet <corbet@lwn.net>,
 cgroups@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Kamalesh Babulal
 <kamalesh.babulal@oracle.com>, Roman Gushchin <roman.gushchin@linux.dev>
References: <20240711025153.2356213-1-longman@redhat.com>
 <23hhazcy34yercbmsogrljvxatfmy6b7avtqrurcze3354defk@zpekfjpgyp6h>
Content-Language: en-US
From: Waiman Long <longman@redhat.com>
In-Reply-To: <23hhazcy34yercbmsogrljvxatfmy6b7avtqrurcze3354defk@zpekfjpgyp6h>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4


On 7/25/24 09:15, Michal Koutný wrote:
> Hello.
>
> On Wed, Jul 10, 2024 at 10:51:53PM GMT, Waiman Long <longman@redhat.com> wrote:
>> As cgroup v2 had deprecated the use of /proc/cgroups, the hierarchical
>> cgroup.stat file is now being extended to show the number of live and
>> dying CSSes associated with all the non-inhibited cgroup subsystems
>> that have been bound to cgroup v2 as long as it is not zero.  The number
>> includes CSSes in the current cgroup as well as in all the descendants
>> underneath it.  This will help us pinpoint which subsystems are
>> responsible for the increasing number of dying (nr_dying_descendants)
>> cgroups.
> This implementation means every onlining/offlining (only additionally)
> contends in root's css updates (even when stats aren't ever read).
>
> There's also 'debug' subsys. Have you looked at (extending) that wrt
> dying csses troubleshooting?
> It'd be good to document here why you decided against it.
The config that I used for testing doesn't include CONFIG_CGROUP_DEBUG. 
That is why "debug" doesn't show up in the sample outputs. The CSS # for 
the debug subsystem should show up if it is enabled.
>
>> --- a/kernel/cgroup/cgroup.c
>> +++ b/kernel/cgroup/cgroup.c
>> @@ -3669,12 +3669,36 @@ static int cgroup_events_show(struct seq_file *seq, void *v)
>>   static int cgroup_stat_show(struct seq_file *seq, void *v)
>>   {
>>   	struct cgroup *cgroup = seq_css(seq)->cgroup;
>> +	struct cgroup_subsys_state *css;
>> +	int ssid;
>>   
>>   	seq_printf(seq, "nr_descendants %d\n",
>>   		   cgroup->nr_descendants);
>>   	seq_printf(seq, "nr_dying_descendants %d\n",
>>   		   cgroup->nr_dying_descendants);
>>   
>> +	/*
>> +	 * Show the number of live and dying csses associated with each of
>> +	 * non-inhibited cgroup subsystems bound to cgroup v2 if non-zero.
>> +	 *
>> +	 * Without proper lock protection, racing is possible. So the
>> +	 * numbers may not be consistent when that happens.
>> +	 */
>> +	rcu_read_lock();
>> +	for_each_css(css, ssid, cgroup) {
>> +		if ((BIT(ssid) & cgrp_dfl_inhibit_ss_mask) ||
>> +		    (cgroup_subsys[ssid]->root !=  &cgrp_dfl_root))
>> +			continue;
> Is this taken? (Given cgroup.stat is only on the default hierarchy.)

I am not sure what you are asking here. Since cgroup.stat is a cgroup v2 
only control file, it won't show subsystems that are bound to cgroup v1.

Cheers,
Longman

