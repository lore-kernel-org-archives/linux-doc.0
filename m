Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4162F3E0C78
	for <linux-doc@vger.kernel.org>; Mon, 27 Apr 2026 17:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777310045; cv=none; b=EzgCzoGDBXEACHfgMo9EvfF9xc+uedODwfClYmwfso//Dm3KqUsOT2E8simZkbNYTCL0u4Ut/cSond6a38qdAocnRbGaG2mPpU2toP8TXPARWDOteWZIVXCMOe35zAmRsax+rcNP/ix0IjnH/K7bh4QSSlFamVHq7q6O3Bl2UR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777310045; c=relaxed/simple;
	bh=MwJTvuRKTrE43y+aUqZoLR8JDaajIwdSz4pWGVhjgbA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YoWS/YBFRxbJlAYwOYY4WzDjau7LESP/o6jsCkJFexhSDagmaaoemJImaWrK3fpu+6ckE42TTTUS7rTmuIoAbPcyV1ic1Nwk+qyUuKw8GP/6kHhpKjW9oXENk60mYJP0PgndC+SfWnHaYDCKcZFNlEoK4yUSiz6eOBVAaGW0jXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=J0U9Fc2o; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="J0U9Fc2o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777310042;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YVxvDNGbXzjzG/R3NTp657Qhl7GuXO9webznMK14lrA=;
	b=J0U9Fc2o7J9RDf8aR8TCD10m/64FkijMfwdZuYi+O8WSbIptdsWcB9F2XMhmlkbwXAJa1G
	CuSh1Sv7tU1Z3vS20II/Q5qEsXmcn0m2S/RkM4hATbpYri0v9DEd64X2eqB/JeXtBMbOmr
	Edj41K4sh+pOVzW0M9YqzqnF1hNQVKk=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-70-x76lkeK9P3qh3HpKFjhpDg-1; Mon,
 27 Apr 2026 13:13:58 -0400
X-MC-Unique: x76lkeK9P3qh3HpKFjhpDg-1
X-Mimecast-MFC-AGG-ID: x76lkeK9P3qh3HpKFjhpDg_1777310036
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 105B41800578;
	Mon, 27 Apr 2026 17:13:56 +0000 (UTC)
Received: from [10.22.65.144] (unknown [10.22.65.144])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E1F153000C22;
	Mon, 27 Apr 2026 17:13:52 +0000 (UTC)
Message-ID: <35b64f9e-236c-4323-a9c1-12523426bec4@redhat.com>
Date: Mon, 27 Apr 2026 13:13:52 -0400
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation/kernel-parameters: Remove "Deprecated" from
 isolcpus=
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Frederic Weisbecker <frederic@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Gabriele Monaco
 <gmonaco@redhat.com>, Ingo Molnar <mingo@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Marcelo Tosatti <mtosatti@redhat.com>,
 Marco Crivellari <marco.crivellari@suse.com>,
 Michal Hocko <mhocko@kernel.org>, "Paul E . McKenney" <paulmck@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Phil Auld <pauld@redhat.com>,
 Steven Rostedt <rostedt@goodmis.org>, Thomas Gleixner <tglx@linutronix.de>,
 Valentin Schneider <vschneid@redhat.com>, Vlastimil Babka <vbabka@suse.cz>,
 linux-doc@vger.kernel.org, Bagas Sanjaya <bagasdotme@gmail.com>,
 Shuah Khan <skhan@linuxfoundation.org>,
 John Ogness <john.ogness@linutronix.de>
References: <20260427150739.bwVmmkj2@linutronix.de>
Content-Language: en-US
From: Waiman Long <longman@redhat.com>
In-Reply-To: <20260427150739.bwVmmkj2@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

On 4/27/26 11:07 AM, Sebastian Andrzej Siewior wrote:
> The isolcpus= option has been marked as deprecated in 2017. Back then it
> was desired for the domain sub option to be configured dynamically at
> runtime instead using this boot command line which provides a static
> configuration. In the meantime this option was extended by other sub
> options which don't have runtime counterpart or it does not make sense
> to provide one.
>
> The deprecated part always referred to the default `domain' sub option
> but it was not obvious. Also the reasoning behind the deprecation is
> sort of dubious: There is nothing wrong with a static configuration if
> there is no desired to reconfigure. This is useful on systems which
> have one purpose and the CPU partition configuration is not changed for
> the entire lifetime.
>
> Remove the "Deprecated" note. Remove the part of the description which
> suggest to use cpuset.sched_load_balance and instead point to the
> documentation file which explains how to use cpusets to configure this
> at runtime.
>
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
>   Documentation/admin-guide/kernel-parameters.txt | 10 ++++------
>   1 file changed, 4 insertions(+), 6 deletions(-)
>
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 4d0f545fb3ec5..367931fe8da56 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -2755,7 +2755,6 @@ Kernel parameters
>   			Format: <RDP>,<reset>,<pci_scan>,<verbosity>
>   
>   	isolcpus=	[KNL,SMP,ISOL] Isolate a given set of CPUs from disturbance.
> -			[Deprecated - use cpusets instead]
>   			Format: [flag-list,]<cpu-list>
>   
>   			Specify one or more CPUs to isolate from disturbances
> @@ -2780,11 +2779,10 @@ Kernel parameters
>   			  Isolate from the general SMP balancing and scheduling
>   			  algorithms. Note that performing domain isolation this way
>   			  is irreversible: it's not possible to bring back a CPU to
> -			  the domains once isolated through isolcpus. It's strongly
> -			  advised to use cpusets instead to disable scheduler load
> -			  balancing through the "cpuset.sched_load_balance" file.
> -			  It offers a much more flexible interface where CPUs can
> -			  move in and out of an isolated set anytime.
> +			  the domains once isolated through this boot time
> +			  configuration. Use cpusets for a dynamic configuration
> +			  which can be altered at runtime. For details see
> +			  Documentation/admin-guide/cpu-isolation.rst.
>   
>   			  You can move a process onto or off an "isolated" CPU via
>   			  the CPU affinity syscalls or cpuset.
Acked-by: Waiman Long <longman@redhat.com>

