Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CDB124A077
	for <linux-doc@vger.kernel.org>; Wed,  5 Mar 2025 14:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741184047; cv=none; b=bxRCTTQn9etVdQmNNuubPvSM2P7YuODGu4KW9JqC5UpG5CY2aufu1IV0QlEP3HeE2k+Ab/tobfGkzKAVP5wmbsPUe41MACT2xKE971mZOXnbxA9nR5xQDO4tyVlwup2t/Z8ORsRbt4z0fQlne/N0zrMUJd4JDh6GQhYgv6cajfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741184047; c=relaxed/simple;
	bh=EDOWiuz48EaOHCMVG5zuO1N25iNFE4iKpu3KXcX0EqI=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=XGyQqLGjFrInz7tIIBu6z5CTQob/0NObgkXEA/mIhAGLgmFwJdJog6XWAA3LkMTE0kez5iPODRJzOASpGQe3HVXsBYuibi6+inItp5SUMcCWFrNaNBNA2D3mqFi/gkqZ/ucNWVTxWyqZygKTouovo3JS0LUadfboVAP97MEwncI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Buq+4UuF; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Buq+4UuF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741184044;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0W+VuZVYcnV3HyAvSTpbUUrhFmo350QWrg+wnsTs7g4=;
	b=Buq+4UuFncXBd/85809tYuh2r9Qzx//t5VpM/8yQs4d4xUGIIPeCFhF2TnGPX/uxvOFNaG
	qVpJQQVQF/jRImDjn2rsjc8PwvYCxrBQMfoCuoWPu+2jSs5MLgavaqb9m78kOBNEHQpOxh
	dZIT+urGeDIx+SSPnDvZyFI812QR0oU=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-361-UJbm27UbMIeNjnvYtNvexw-1; Wed, 05 Mar 2025 09:13:53 -0500
X-MC-Unique: UJbm27UbMIeNjnvYtNvexw-1
X-Mimecast-MFC-AGG-ID: UJbm27UbMIeNjnvYtNvexw_1741184032
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c3cca5d865so161793885a.1
        for <linux-doc@vger.kernel.org>; Wed, 05 Mar 2025 06:13:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741184032; x=1741788832;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0W+VuZVYcnV3HyAvSTpbUUrhFmo350QWrg+wnsTs7g4=;
        b=M51dQPhjyb5rhQRL2AjlEpUvEhlX+cLsZNsDDj9PwedFqtBe32OjDSXRe6PaOhGXGG
         FofVTRFvyiAdQd8neh7pondLy81KP5wlCB4BABeTkzjYYZC8sgEbdyD+oFqUQHiX3VVb
         31dDKvtEJVQH9tC9FFv4VTwkcplBetW51A4lrxIGER5P9sxZvYORFLGYeFpiR0+fQG+u
         ytF1VufoSPUpJeQCe8r4VrgAmaGdQ1mGN+HGS2NWXspbPO6lhe/CxybklPqq2NgtbAnR
         37J5iCdLsq2w9ElgFZp9TdIdgiVxtvM4OclAuXaCF/vOJzq/l70fV3F3FOposrPUg+ov
         stmQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/s2/T2skeVddZwC2oF0hUpzo7WVEVxv/8G/pvYf5VH3aV1XrMVBjAKAja6Ns4tpsm/5RjPy/HUY4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+8K+2u+faPQB5jPjnqzSTQ4LwjJ6ZQ0igWLSRjKYHuRZW2zB2
	450Y/nbWplmSWVe8fYAXcf5gYVoTu2XCSR1WQwP6QGcSm17lgU3GQcXuGmEctJNfUXxI5XE6Vq7
	OMa1kpFgxGRgt/jm2Nabfg+yI4ju6C2R0AracoZpnpcieT8I1tgCDyCjS/Q==
X-Gm-Gg: ASbGncsfPkkl5wxv+p5LPlOR1nhsjDQoRE2D2d8q1QzRFpvQ4t2BJKbMiwXrITkzMb6
	rY2GKbfvvqQ4ocyCm+cGGTbQGDW3AFr3ybfBpc9Dz2bYHVSsmlkz7URllodX3Z8fecSP9+p9zU1
	OxBG3Ab9+bOIUUXyOZ6cKR1zqQ2F6htabFXhXn+SxP/YEPbr8NYkDB7po7+LE5EJF6N+ebMLftX
	ItKZl/od0jWmRG4vdzfAYKvkz0eeaJ5r5wCqjvq5YX/gaJgFT333GwIdRRP0S1v9c2sDucPRjl4
	2r+WXdGekV/oCgZJn8hC1MJSv9Sqsd6nn/mglbjmh0Y42cgxpOTR0tHGzp0=
X-Received: by 2002:a05:620a:43aa:b0:7c0:a260:ec1b with SMTP id af79cd13be357-7c3d91e8cafmr444390785a.25.1741184032540;
        Wed, 05 Mar 2025 06:13:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH9ffpu0YZWhyUhYlZlVs8VrgC/jNuyM8WRbs000jc8OeU6/te1fV87F/+guN7+iQlwfItbJg==
X-Received: by 2002:a05:620a:43aa:b0:7c0:a260:ec1b with SMTP id af79cd13be357-7c3d91e8cafmr444386885a.25.1741184032217;
        Wed, 05 Mar 2025 06:13:52 -0800 (PST)
Received: from ?IPV6:2601:188:c100:5710:627d:9ff:fe85:9ade? ([2601:188:c100:5710:627d:9ff:fe85:9ade])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c3bfb2a5e3sm392543585a.41.2025.03.05.06.13.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Mar 2025 06:13:51 -0800 (PST)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <6a6d4c61-a318-444f-b089-1776beb8873d@redhat.com>
Date: Wed, 5 Mar 2025 09:13:50 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] cgroup, docs: Be explicit about independence of
 RT_GROUP_SCHED and non-cpu controllers
To: shashank.mahadasyam@sony.com, Tejun Heo <tj@kernel.org>,
 Johannes Weiner <hannes@cmpxchg.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?=
 <mkoutny@suse.com>, Jonathan Corbet <corbet@lwn.net>
Cc: cgroups@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Shinya Takumi <shinya.takumi@sony.com>
References: <20250305-rt-and-cpu-controller-doc-v1-0-7b6a6f5ff43d@sony.com>
 <20250305-rt-and-cpu-controller-doc-v1-1-7b6a6f5ff43d@sony.com>
Content-Language: en-US
In-Reply-To: <20250305-rt-and-cpu-controller-doc-v1-1-7b6a6f5ff43d@sony.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/4/25 11:12 PM, Shashank Balaji via B4 Relay wrote:
> From: Shashank Balaji <shashank.mahadasyam@sony.com>
>
> The cgroup v2 cpu controller has a limitation that if
> CONFIG_RT_GROUP_SCHED is enabled, the cpu controller can be enabled only
> if all the realtime processes are in the root cgroup. The other
> controllers have no such restriction. They can be used for the resource
> control of realtime processes irrespective of whether
> CONFIG_RT_GROUP_SCHED is enabled or not.
>
> Signed-off-by: Shashank Balaji <shashank.mahadasyam@sony.com>
> ---
>   Documentation/admin-guide/cgroup-v2.rst | 23 ++++++++++++++---------
>   1 file changed, 14 insertions(+), 9 deletions(-)
>
> diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
> index cb1b4e759b7e267c24d7f4f69564c16fb29c4d89..f293a13b42ed69e7c6bf5e974cb86e228411af4e 100644
> --- a/Documentation/admin-guide/cgroup-v2.rst
> +++ b/Documentation/admin-guide/cgroup-v2.rst
> @@ -1076,15 +1076,20 @@ cpufreq governor about the minimum desired frequency which should always be
>   provided by a CPU, as well as the maximum desired frequency, which should not
>   be exceeded by a CPU.
>   
> -WARNING: cgroup2 doesn't yet support control of realtime processes. For
> -a kernel built with the CONFIG_RT_GROUP_SCHED option enabled for group
> -scheduling of realtime processes, the cpu controller can only be enabled
> -when all RT processes are in the root cgroup.  This limitation does
> -not apply if CONFIG_RT_GROUP_SCHED is disabled.  Be aware that system
> -management software may already have placed RT processes into nonroot
> -cgroups during the system boot process, and these processes may need
> -to be moved to the root cgroup before the cpu controller can be enabled
> -with a CONFIG_RT_GROUP_SCHED enabled kernel.
> +WARNING: cgroup2 cpu controller doesn't yet fully support the control of
> +realtime processes. For a kernel built with the CONFIG_RT_GROUP_SCHED option
> +enabled for group scheduling of realtime processes, the cpu controller can only
> +be enabled when all RT processes are in the root cgroup. Be aware that system
> +management software may already have placed RT processes into non-root cgroups
> +during the system boot process, and these processes may need to be moved to the
> +root cgroup before the cpu controller can be enabled with a
> +CONFIG_RT_GROUP_SCHED enabled kernel.
> +
> +With CONFIG_RT_GROUP_SCHED disabled, this limitation does not apply and some of
> +the interface files either affect realtime processes or account for them. See
> +the following section for details. Only the cpu controller is affected by
> +CONFIG_RT_GROUP_SCHED. Other controllers can be used for the resource control of
> +realtime processes irrespective of CONFIG_RT_GROUP_SCHED.
>   
>   
>   CPU Interface Files

LGTM

Acked-by: Waiman Long <longman@redhat.com>

