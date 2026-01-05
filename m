Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABAF92AF1D
	for <linux-doc@vger.kernel.org>; Mon,  5 Jan 2026 03:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767585585; cv=none; b=PR6QgcHpSyRHm0v6gvtdv39gfWVzpYKBPyd4lxe1LQVUPPFWoxdwktUFKSXn/Pwr5LI2hQavLgVMedZqEoOiNidrrVSC6l8z+FApW+tj2lXkvrLlgnnZzAFM7uNl0IulEphL6GS5ikYr3SQHqP5KsE34z2V/B5aOy2ooCC6UTog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767585585; c=relaxed/simple;
	bh=i14d6bDqTphWg0tcgZQtxI4oehvWUN5DxtfPLeQ9Xek=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=lyN85vBU9PS3PsW9leKAAGe0ZMcjdBcOyw1m725K7FcjEgC4JhxFKgKMrANw4e1zdEI2YohD13E6g4ComWT/HA7kawffLJ3OCCioGKAbwIHugep9JWe4fM8M3qSgETObKElLz7BCoLTP58nH+b7tneE7q2TASTxFYun8do4wLtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KG6FkaiW; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=U38+v2s/; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KG6FkaiW";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="U38+v2s/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767585582;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DcstfgGe6NPr6oxFWbPA0cQo82UVim7d++fhOcCLZtk=;
	b=KG6FkaiWbUeD388iwr9GLoxaLEPe3IOy5EndZL4lRaWrJU5MkSFL+SlAQtRLP82KwbJMZ4
	UtHj5ZcfmgGPWvTwBOQBmdejnYc7B+JUSzADYKEfu9BolFifA2S3gTgtmAtbHk1/fVjq7v
	VLaPsUWXECtNajnpg9UAgvKl7TF630E=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-498-LibU7EiGPH--IchOpWqqSg-1; Sun, 04 Jan 2026 22:59:41 -0500
X-MC-Unique: LibU7EiGPH--IchOpWqqSg-1
X-Mimecast-MFC-AGG-ID: LibU7EiGPH--IchOpWqqSg_1767585581
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed79dd4a47so313360111cf.3
        for <linux-doc@vger.kernel.org>; Sun, 04 Jan 2026 19:59:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1767585581; x=1768190381; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DcstfgGe6NPr6oxFWbPA0cQo82UVim7d++fhOcCLZtk=;
        b=U38+v2s//8MK9WHZltDfz1riArl6GWWIUp399Ay3PGC00g+h1Msgy55419Ni2N+qGm
         yuq0vyNrRTF9kbkD3zMlYVbNzbNs26fhVXcxMznuPyCmIjdC4PdGPqbWXkvYSYUxswUj
         NOqbYPTzZmkzKCLpKO+tTGdMKBZ0iQIXupptywrOl97whjOR3uOyCK6CCjCekU45ycXm
         7oqwIK+W1kIYuji0zM6TzkIS6c4+SGXrJt/B5J1CL6zToOxkcnjhiZGjttn3WrR6NwLH
         MbqC5zQmCgmwx1WVeipYjnbfY+/pDuyCUfx2pn2EAkDW/6WexRPj9y8UH+iI4JVYfEp9
         IK/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767585581; x=1768190381;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DcstfgGe6NPr6oxFWbPA0cQo82UVim7d++fhOcCLZtk=;
        b=mxTL5C61XbZ2+BMxqZF0nG2F/sYsT4mneiw39Su01bQjR5FGqI3HRybv/ke04LLJsZ
         5b6aCrPTU8lqOzEV50fXtrb/yHBuEezikB1RwO719+Ph2H98oJRIg7pjhKPF0X2VS8ts
         EdvMUQ8OWiUIPfsQvj7WO+w9RU8oNtDps1E2jOwN0FIx+sbtoKY1KipkAI4LQ60sgk6i
         1lhrcACEhPWSt0Rsws0bA84gCTrgPmS3hMAOWKUretp+VGYh4Tze6SQlSos32Dz/57rv
         A+UkHcfu0EGcpoewNA17I3Cl1arMN9cUM8FoA3qSHc+FP92HTASjyNXUnATvzYn2OAZd
         iGSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbTIjPJ8stlqZuOrNb4Ra4IxVyGMwKC537fpHUalnsIAvxcHBzbna+u2jfi0/xCN4vCNzXhPppfcU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxnKjOR9EV68KUXOEGMg5JVrJqveV9GS0LF3Tlb+EVJ8O9QcmF
	tdCC4bwiW7XsioTT78Y1vZ7e7Vjii+rFXsRAVuIR3F7Ba5PHAn5Hp6eWMstZ6P9GNeYRZA9ju4g
	VtjoJCtusNyE/8Z+5laaJzY2KpvIjNEU2lja+zbRp7gIz7R7pqlwI4t+SADPm0Q==
X-Gm-Gg: AY/fxX7SGANnQNcRdv8aSl/HvKUQULIhaFSbcyFrqHYofT+hnBRXeLAE2d6jOlXKkQp
	wCR1bDC8w/68FnvDdBsvnOuIpI8EwkiGBM+YnGFxffgly79QjAVPgepOeOVNrB+GfEkTCgiFU77
	K/XflF7bgKqoa8lHH3K55w3Ib6xlxAxjSC0M0M/gW2DiDLaKGjr/skxGvuAlLl7+qEjQnYpZYBr
	mMNJUtHjAx3aVy8mRAqoia8ELUSRw1bqXPPwPiHnyYDMMJ9hKzlyqtFClYo8SQ1Qm3mY1c+VGF+
	Yl7RFmeftfxBgyWT0odPzUn4gpWaJZ1oip1hv8ILsK4QUgdxLMHVoeJZ7vNSo5tCND6BkCbX04f
	sfOoYIb/z+Ki6gNZIsFo6uQXS9b52wGFHVFgxrlbacnb6TMNwCHiNVmHT
X-Received: by 2002:ac8:6f0f:0:b0:4f0:2d78:b955 with SMTP id d75a77b69052e-4f4abd797f1mr748971261cf.53.1767585581003;
        Sun, 04 Jan 2026 19:59:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE+NcyGeeiQSa4IIGkUpR94ZHm/A+yiFKrXcCzGbDEBp1p4GQ6FxU+mKwmroOKv1AZgBlIG4w==
X-Received: by 2002:ac8:6f0f:0:b0:4f0:2d78:b955 with SMTP id d75a77b69052e-4f4abd797f1mr748971071cf.53.1767585580638;
        Sun, 04 Jan 2026 19:59:40 -0800 (PST)
Received: from ?IPV6:2601:188:c102:b180:1f8b:71d0:77b1:1f6e? ([2601:188:c102:b180:1f8b:71d0:77b1:1f6e])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f4ac530f0dsm339626871cf.3.2026.01.04.19.59.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Jan 2026 19:59:39 -0800 (PST)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <85f4bca2-e355-49ce-81e9-3b8080082545@redhat.com>
Date: Sun, 4 Jan 2026 22:59:38 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [cgroup/for-6.20 PATCH v2 3/4] cgroup/cpuset: Don't fail
 cpuset.cpus change in v2
To: Chen Ridong <chenridong@huaweicloud.com>, Waiman Long <llong@redhat.com>,
 Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
 =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, cgroups@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
 Sun Shaojie <sunshaojie@kylinos.cn>
References: <20260101191558.434446-1-longman@redhat.com>
 <20260101191558.434446-4-longman@redhat.com>
 <efdcd90c-95ed-4cfc-af9a-3dc0e8f0a488@huaweicloud.com>
 <6eedf67b-3538-4fd1-903b-b7d8db4ff43d@redhat.com>
 <7a3ec392-2e86-4693-aa9f-1e668a668b9c@huaweicloud.com>
Content-Language: en-US
In-Reply-To: <7a3ec392-2e86-4693-aa9f-1e668a668b9c@huaweicloud.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/4/26 8:35 PM, Chen Ridong wrote:
>
> On 2026/1/5 5:48, Waiman Long wrote:
>> On 1/4/26 2:09 AM, Chen Ridong wrote:
>>> On 2026/1/2 3:15, Waiman Long wrote:
>>>> Commit fe8cd2736e75 ("cgroup/cpuset: Delay setting of CS_CPU_EXCLUSIVE
>>>> until valid partition") introduced a new check to disallow the setting
>>>> of a new cpuset.cpus.exclusive value that is a superset of a sibling's
>>>> cpuset.cpus value so that there will at least be one CPU left in the
>>>> sibling in case the cpuset becomes a valid partition root. This new
>>>> check does have the side effect of failing a cpuset.cpus change that
>>>> make it a subset of a sibling's cpuset.cpus.exclusive value.
>>>>
>>>> With v2, users are supposed to be allowed to set whatever value they
>>>> want in cpuset.cpus without failure. To maintain this rule, the check
>>>> is now restricted to only when cpuset.cpus.exclusive is being changed
>>>> not when cpuset.cpus is changed.
>>>>
>>> Hi, Longman,
>>>
>>> You've emphasized that modifying cpuset.cpus should never fail. While I haven't found this
>>> explicitly documented. Should we add it?
>>>
>>> More importantly, does this mean the "never fail" rule has higher priority than the exclusive CPU
>>> constraints? This seems to be the underlying assumption in this patch.
>> Before the introduction of cpuset partition, writing to cpuset.cpus will only fail if the cpu list
>> is invalid like containing CPUs outside of the valid cpu range. What I mean by "never-fail" is that
>> if the cpu list is valid, the write action should not fail. The rule is not explicitly stated in the
>> documentation, but it is a pre-existing behavior which we should try to keep to avoid breaking
>> existing applications.
>>
> There are two conditions that can cause a cpuset.cpus write operation to fail: ENOSPC (No space left
> on device) and EBUSY.
>
> I just want to ensure the behavior aligns with our design intent.
>
> Consider this example:
>
> # cd /sys/fs/cgroup/
> # mkdir test
> # echo 1 > test/cpuset.cpus
> # echo $$ > test/cgroup.procs
> # echo 0 > /sys/devices/system/cpu/cpu1/online
> # echo > test/cpuset.cpus
> -bash: echo: write error: No space left on device
>
> In cgroups v2, if the test cgroup becomes empty, it could inherit the parent's effective CPUs. My
> question is: Should we still fail to clear cpuset.cpus (returning an error) when the cgroup is
> populated?

Good catch. This error is for v1. It shouldn't apply for v2. Yes, I 
think we should fix that for v2.

Cheers,
Longman

