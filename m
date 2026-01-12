Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB46336403D
	for <linux-doc@vger.kernel.org>; Mon, 12 Jan 2026 16:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768233757; cv=none; b=soeOJu6ya5XiRvSJYMmDDl38xfeKPX4QosGBQTOKY7ccJxgD6Ubfs5SWyLzogJ2dqGuJsefuISd7iX722ie+VPlYkg8Wiux/R90AOZmIox7AArIf7a/DIXjlzouORK+EKvbfcc83rJJfbSFovedlY780kOwU4KW2soXhIYGIWSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768233757; c=relaxed/simple;
	bh=bC/Qjyk/R/HVGN+FQeWmTeEoWIOx8ZavQXScE/JM/Vc=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=G+TRzc+OeC4p90bQF+fr3m9xZfUCbAcy8atgmRdUFalTvpYqP0QsKf3oJVDLS3JfE1IbMUl8zP1AnCECmFuw7qEkqrGaBPYensqGP3fYZu3s879e0csRfrl3yv2n2BCdjSILlZ3m+6HQN802ZxifHbMFsp5I2cunYNqKVvOd1ZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PI/roims; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=H3/oZgH7; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PI/roims";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="H3/oZgH7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768233754;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VMhXnlPrek/WOR7SOlvqEVsXnE8wyUlU5u32qXId6qk=;
	b=PI/roimsEjk8QmGUqVeyENhxVYKU//c5AJQ6Bfwus9Et+pEwdmlHS9J+ZDaaMrUwWGB3Vf
	lNbLRSABKaBM1d/33Kcj/u9m9y31yU3ORicCcsXZy9CAYqWXw4IGIkdr2bkJa4eGvEeWkx
	SJ+SVotz1WPdoNElSqM/4wjr4dvWONc=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-25-dmH092CJNQ22oW4pMPkDtQ-1; Mon, 12 Jan 2026 11:02:33 -0500
X-MC-Unique: dmH092CJNQ22oW4pMPkDtQ-1
X-Mimecast-MFC-AGG-ID: dmH092CJNQ22oW4pMPkDtQ_1768233753
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8bb6a7fea4dso1603900085a.0
        for <linux-doc@vger.kernel.org>; Mon, 12 Jan 2026 08:02:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1768233753; x=1768838553; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VMhXnlPrek/WOR7SOlvqEVsXnE8wyUlU5u32qXId6qk=;
        b=H3/oZgH750O3fehzP/iwP36T8l1Hqmye0ljh2E/I2gc4QudNmpH2t0dQ18GGY4y1pU
         97/bFnoht+cSoGqCo88E+hEalGtAW0XZnGdfs695tm+UpeXkgQ/lwWiZEEGlw3qvkdNK
         qCbDITAK+TSVNTZPSNgSZjjud//kkH+ZD1aLa51pQfKT2JtPYzTtBweI5njCv9TWXCXs
         cqxvGmOEteLFiuIxa05XqKY5bdZlRnZZRb0C3M6h9h8Z6tIqoJsaLwomRhwsDMp4gfPk
         W/ud4cZJYEEQ19D7fYfdbjeqWwHkSGy9gSQTf8vIFzomsIaSe182t0WsxX8Qm75T6HKy
         2s3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768233753; x=1768838553;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VMhXnlPrek/WOR7SOlvqEVsXnE8wyUlU5u32qXId6qk=;
        b=gDJrXdpvSwJD0YiqwwWEhfl9sOU51KhBOE3QOxA/hNFK4VJf4FMTd1UTnQsOqcGh3S
         IdlZkMOZMIMbBoas3pMJP9cC3wrvbj5h0CVh07oIHWIEmG3tC3Wim9JkyMUn3ZqyWPlE
         ITX/B2hx0MW877oFoksM/OBDpjZkiPFRvykJXsaPdblByTHSYuHNlatdZwbSyll6HVlU
         x2P0yoVsUn+P6fzQ+UfC6OLLp+esLr8XjNvTpvJjRn4aPUWu6akmC13a4KE1XfWehhDf
         ZxRkkiF6C85SHdVKrgF0DwxNEPYqeVfIFW+pp21fv19XdRMh8GvzQ8HT3AQS02lVE4+y
         e0sQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIvtHMyHCXD4qG8stCZU24sLq30LZw1ZCeiHYmcXrADBZ9ccGcUVqeQhBIAoOUQtO06cqp0HEeXSE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQFnkhvr2807QO2V9lj8Ew3QR/R6fvpg0MKD7GG05lfRuwmp5K
	y5HMv6XWF2t0YOtY7B1Xs3Q6kgFfk/WMIB49UKzJ5AkmPC41dCM9SCnzfbRUnSfgbhXhsb4dZ65
	iKqSkP5C9NXvYs8RivCLAWQTtC5uvreapWL3I+pmVlXspaD7L+WKudrT4/szP0A==
X-Gm-Gg: AY/fxX4FGFDAXue6GDcKDz2BRi1ICikB0PYHrwtha48BsjiSGoRRAzv+ZwkZ9ljWUrt
	+8v58xA5Xti6QxNgf3aYvpXu1gGixcaQUT1wYSrBkSU2IUu+V1aPSJDhjsaeSK3cAPiItZWc1zY
	/sXzW3DtV3ri230KyYWcH1t64Ont1AV4b0wpRVmsRFJggi15Y/D6Fn0u9XUS1uRlpRlTtF3kCBv
	qM+uEser5wW93DHzn/AYDe4lqB/uyh1nwEAi5gOuT4n6jbsqQbMqzZnkft/zliZniS4CdkhGccG
	62cdbx4YTSbnpfW+yao14Hz+KAQ/3v0qIu9d7OczpUryo6EbCjX0NUP4aLQwUjfn7NEQJcFRk4E
	ahiB7iK6sGXTCBBZOJoSvLC6Cqhfmnota7i+FmtdaU/NTLR8i13Ixr4n0
X-Received: by 2002:a05:620a:4444:b0:8b2:e177:fb17 with SMTP id af79cd13be357-8c3893dca80mr2449095085a.45.1768233751934;
        Mon, 12 Jan 2026 08:02:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEJi2/0HC1+IC4PuaBeIdB3G5w2rUk7KP+T2Nhpx9j47KDX3VY5aFRtmJJXjg0pMKFLyFlL1g==
X-Received: by 2002:a05:620a:4444:b0:8b2:e177:fb17 with SMTP id af79cd13be357-8c3893dca80mr2449083785a.45.1768233751123;
        Mon, 12 Jan 2026 08:02:31 -0800 (PST)
Received: from ?IPV6:2601:188:c102:b180:1f8b:71d0:77b1:1f6e? ([2601:188:c102:b180:1f8b:71d0:77b1:1f6e])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f4a6441sm1556650385a.7.2026.01.12.08.02.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 08:02:30 -0800 (PST)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <86b578f3-70f5-4a72-9371-e35478ec1c01@redhat.com>
Date: Mon, 12 Jan 2026 11:02:28 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH cgroup/for-6.20 v4 4/5] cgroup/cpuset: Don't invalidate
 sibling partitions on cpuset.cpus conflict
To: Waiman Long <llong@redhat.com>, =?UTF-8?Q?Michal_Koutn=C3=BD?=
 <mkoutny@suse.com>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
 linux-kernel@vger.kernel.org, cgroups@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
 Sun Shaojie <sunshaojie@kylinos.cn>, Chen Ridong
 <chenridong@huaweicloud.com>, Chen Ridong <chenridong@huawei.com>
References: <20260112040856.460904-1-longman@redhat.com>
 <20260112040856.460904-5-longman@redhat.com>
 <2naek52bbrod4wf5dbyq2s3odqswy2urrwzsqxv3ozrtugioaw@sjw5m6gizl33>
 <f33eb2b3-c2f4-48ae-b2cd-67c0fc0b4877@redhat.com>
 <uogjuuvcu7vsazm53xztqg2tiqeeestcfxwjyopeapoi3nji3d@7dsxwvynzcah>
 <9a1b7583-7695-484f-a290-807b6db06799@redhat.com>
Content-Language: en-US
In-Reply-To: <9a1b7583-7695-484f-a290-807b6db06799@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/12/26 10:15 AM, Waiman Long wrote:
> On 1/12/26 10:08 AM, Michal Koutný wrote:
>> On Mon, Jan 12, 2026 at 09:51:28AM -0500, Waiman Long 
>> <llong@redhat.com> wrote:
>>> Sorry, I might have missed this comment of yours. The
>>> "cpuset.cpus.exclusive" file lists all the CPUs that can be granted 
>>> to its
>>> children as exclusive CPUs. The cgroup root is an implicit partition 
>>> root
>>> where all its CPUs can be granted to its children whether they are 
>>> online or
>>> offline. "cpuset.cpus.effective" OTOH ignores the offline CPUs as 
>>> well as
>>> exclusive CPUs that have been passed down to existing descendant 
>>> partition
>>> roots so it may differ from the implicit "cpuset.cpus.exclusive".
>> Howewer, there's no "cpuset.cpus" configurable nor visible on the root
>> cgroup. So possibly drop this hunk altogether for simplicity?
>
> Ah, you are right. I thought there was a read-only copy in cgroup 
> root. Will correct that.
>
Below is the doc diff between v4 and v5:

diff --git a/Documentation/admin-guide/cgroup-v2.rst 
b/Documentation/admin-guide/cgroup-v2.rst
index a3446db96cea..28613c0e1c90 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -2641,9 +2641,10 @@ Cpuset Interface Files

      The root cgroup is always a partition root and its state cannot
      be changed.  All other non-root cgroups start out as "member".
-    Even though the "cpuset.cpus.exclusive*" control files are not
-    present in the root cgroup, they are implicitly the same as
-    "cpuset.cpus".
+    Even though the "cpuset.cpus.exclusive*" and "cpuset.cpus"
+    control files are not present in the root cgroup, they are
+    implicitly the same as the "/sys/devices/system/cpu/possible"
+    sysfs file.

      When set to "root", the current cgroup is the root of a new
      partition or scheduling domain.  The set of exclusive CPUs is

Cheers,
Longman

