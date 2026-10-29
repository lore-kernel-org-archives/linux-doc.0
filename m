Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.115
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793255096;
	b=va1i5Ys8aZn2+ACjkSNoieVb323Ajx4X7KicbvkryLG9A0G/SwFZmKBBF18ZIcYy8RAo
	 RTp+7/POB4aIBFGbmuy9/xb2qjbk3m8+XsRkFsCFB/LjOvSUEo4gkkKxUv+r/SUwyzCsx
	 F0zo9y3AYh6uVIEQSJ4hjSBeBjKC+Sz2fcH90k24ZFQ5Z1CPxGQw9FLZLLzjgG/BCLE41
	 SQqDrKbwGr2OUNEzuzlAqFwxdeZojHpJG9i4UtDR+QXkVLI3o/07ODd5MSdQtITvkcfOP
	 lZVfSP77QrmIGBRaa36+i9wp0ua6TLTe+4ErL/jqUC2eJ3rcpiQUCljMFgQieJJ/XSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793255096;
	h=DMARC-Filter:DKIM-Signature:Cc:Date:X-Original-From:User-Agent:
	 Content-Transfer-Encoding:To:From:Subject:Mime-Version:Content-Type:
	 X-Lms-Return-Path:Message-Id:References:In-Reply-To;
	bh=G/jHONOjsG3jk3ok02og65/P6DgsNIUASy0C0aH+3Fk=;
	b=u+kfWCeRvyeHHG+NEa3Aw2HOizsTQwo6gaDRILAejQPrEfUgNyEM/JVi8ChekRLzQznA
	 H1AAG8KIGC+2JC3AsVRuvCJdZzYUIxOb4COQjMriwJPHxoumJ5QeIZW6dygC1jByI4Ly0
	 cWssj9N7Ad8om34uz22JEXHX+0bUpV8dwYpZis+4A9z8yFpUNhBuBdbh6FEKQ+l4JAC2Q
	 2dKeA/e00hetylKRjypvFjakfUKW+np5FP5dJMtqeuh7UfD+gWlSJDyFJaM4PRR2/F8Vw
	 bI5QiEfnwyErnwzClDg9JSGrEWR0WMUFZFDcob0FU+i+hIMVZAna+bM+xZ74F7e9/qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=ZtOQpinT;
	arc=none smtp.remote-ip=209.127.231.115
Received: from va-2-115.ptr.blmpb.com (va-2-115.ptr.blmpb.com [209.127.231.115])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78070606A31A
	for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 06:24:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78070606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=ZtOQpinT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1793255089; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=G/jHONOjsG3jk3ok02og65/P6DgsNIUASy0C0aH+3Fk=;
 b=ZtOQpinToUAnE5i2fpxWQ/Sbs6hx6Jgx3dpW3z4CMXa0LEp6S3Y36paqfrL4rJcNGoVWbq
 KZMwuwlNWtfKC0yA9VXgkb8z2Q/qya8jztPfkYSV7dIa4JmJhNX9+Z8Kf495etYfmfY/dX
 K0b5qTGbp7fTzS1QuUpYZ9zhCgdiZ0mNw5NSyoISy+/cVBg/3P7vuTodSfZCbT3l3N+2AP
 8BmkXmRzt5lXl6gE6kxFwFo+XR4Gh/kLLGfJGxArIr78cB7LEFOzQWf130WmdAnsuXb5Hz
 DtOZz0TAQTuTCmNTN5AexDn1e1ZGAXlOP/erRKdLEOOw/PZHuv+glcqWJNXWbA==
Cc: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	<linux-mm@kvack.org>
Date: Thu, 29 Oct 2026 14:24:24 +0800
X-Original-From: Li Zhe <lizhe.67@bytedance.com>
User-Agent: Mozilla Thunderbird
Content-Transfer-Encoding: quoted-printable
To: "Bharata B Rao" <bharata@amd.com>, <akpm@linux-foundation.org>, 
	<bsegall@google.com>, <david@kernel.org>, <dietmar.eggemann@arm.com>, 
	<gourry@gourry.net>, <joshua.hahnjy@gmail.com>, <juri.lelli@redhat.com>, 
	<kprateek.nayak@amd.com>, <ljs@kernel.org>, <mgorman@suse.de>, 
	<mingo@redhat.com>, <peterz@infradead.org>, <riel@redhat.com>, 
	<rostedt@goodmis.org>, <vincent.guittot@linaro.org>, 
	<vschneid@redhat.com>, <ziy@nvidia.com>
From: "Li Zhe" <lizhe.67@bytedance.com>
Subject: Re: [PATCH v2 1/3] sched/numa: make free-space tiering promotion bypass configurable
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Lms-Return-Path: <lba+26ae2e6af+e0aca2+vger.kernel.org+lizhe.67@bytedance.com>
Message-Id: <74f3a0bf-22cc-42b7-8ced-c8c6ea9f6f93@bytedance.com>
References: <20261028041253.74839-1-lizhe.67@bytedance.com> <20261028041253.74839-2-lizhe.67@bytedance.com> <e2fb13e8-6d17-41ea-a9f7-397f62a85f72@amd.com>
In-Reply-To: <e2fb13e8-6d17-41ea-a9f7-397f62a85f72@amd.com>

On 10/29/26 12:16 PM, Bharata B Rao wrote:
> On 28-Oct-26 9:42 AM, Li Zhe wrote:
>> Memory tiering normally promotes any recently accessed slow-tier page if
>> the target fast-tier node has enough free space. This preserves the
>> existing policy of filling available fast memory before relying on
>> hotness and rate-limit control.
>>
>> That is not always the desired policy. Some deployments may intentionall=
y
>> keep part of a workload's memory on CXL-attached memory, for example to
>> preserve a desired DRAM/CXL capacity split or bandwidth distribution. Wi=
th
>> the free-space bypass, short cold accesses and bursts of hot accesses ca=
n
>> refill the fast tier and pull the workload away from that distribution
>> whenever DRAM has free space.
> Currently promotion happens on 1st access. Won't it be more natural to tw=
eak
> this frequency of access and also the time between successive accesses to
> prevent promotion due to short cold accesses and bursts of hot accesses
> rather than free space bypass configuration?
I agree that using hotness and rate-limit controls is the more natural
policy here.=C2=A0 That is exactly what this knob is trying to make possibl=
e.

The current free-space bypass promotes before reaching those existing
checks.=C2=A0 So when the target fast-tier node has enough free space, shor=
t
accesses can still be promoted even if they would not pass the
hotness/rate-limit path.

With this knob disabled, the free-space shortcut is skipped and those
faults fall back to the existing hotness and rate-limit controls instead.
So the patch does not add a new hotness policy; it only makes the
existing one effective even when the fast tier has free space.

Thanks,
Zhe

>
> Regards,
> Bharata.
