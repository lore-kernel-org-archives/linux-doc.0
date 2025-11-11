Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EEE32BE7AC
	for <linux-doc@vger.kernel.org>; Tue, 11 Nov 2025 20:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762893854; cv=none; b=ne08G6oWum++VtEP78fBv6XcEfS7xjKJI2OFhFHfMwL3BvP5IMf49r3ayrceaN0nXRCECu63hoyUJCytvU7gMIPX38B2YIVgkJYbbzKCyHxjJTl+xkBF5SC/zm2YJiLrZa3jln7IV95+6wxPDYAcVFUxm4W4oLi/ZDuDM2wxZP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762893854; c=relaxed/simple;
	bh=KXktgaFtHxbgxAtA3SwBBXkwSUqJQm9IFU9cuHXEKpQ=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=n0aARKfe/QHJRA1Q2FriN6AbPYykXDV7ImHz6LtmijufYYCLEy59OWuWD2nzKD7pKWy62BkdmQqgy8VvlroZ7ctWxhdt8sEL2OXMATkRJHHIkvveBAjOuEaJMLkQl9akLZI8ay0zB0/h0vq3ZWUDTdQA96cdjV0M4o+mkZGz0rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OBufCgjA; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=JIxybuA3; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OBufCgjA";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="JIxybuA3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762893851;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AouMFoYtS/g71aagKlLU9Deonq3urwuQMJX7R1T1Afc=;
	b=OBufCgjAiPdpFy77mMWSt7drfV9KIUfRyr33ww7za69cdtM3FndbifYiMUlKTpnGZkuYM+
	FfGP5b6+ev8VX4ZnNGJL18phs2ZejB2hno0NuIaMrxFHGTwy6FyJ1zwgLfUFeBDRO/+Le5
	xPxwZD0SPGwLP3h+iXf0ksNAQ3vMgb8=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-265-jUHrpbUxPD67uOLZFWPjDw-1; Tue, 11 Nov 2025 15:44:10 -0500
X-MC-Unique: jUHrpbUxPD67uOLZFWPjDw-1
X-Mimecast-MFC-AGG-ID: jUHrpbUxPD67uOLZFWPjDw_1762893850
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4edd678b2a3so2062461cf.2
        for <linux-doc@vger.kernel.org>; Tue, 11 Nov 2025 12:44:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1762893850; x=1763498650; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AouMFoYtS/g71aagKlLU9Deonq3urwuQMJX7R1T1Afc=;
        b=JIxybuA3xFJtVQqFi0/OXPZL+3Bt6dLVYM+WH94ey+/Gi1Ax+S9vGi8Hzf+NxcK7V/
         n41Ru0iiZgAdX9ZHNMOolqQwm7wuoORg0WrK2ImSTBbBC6B48uEn3RUGwSlHuc11lGkn
         ebFlqScy158Kdq7COoUZuQJuh380/DZJNCWVqkpaRDHFzQffcvMkUY+f0cky+IxMgE0M
         LjEkh7yv4Ow0UiiF0fitDpYPv4xrutp9auCf4ew08kRW2ALXRqjGWMKYmbt3UuPKChUR
         bZm/U1RShntXPagB/ax9PC21+uv+y+yXstwzASx0LeMDkJOT0qjqeL52QDVPBNFaFzP2
         HnZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762893850; x=1763498650;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AouMFoYtS/g71aagKlLU9Deonq3urwuQMJX7R1T1Afc=;
        b=lo/bRER+A7J8g2HOXf7RBITYYfEGkFPLJYo+yNmj+ifljEKRDseDDm6K/OqoDl9IZs
         B6CNGxGBgTxMtJNEW3jdfSAkVSOiDUDfS2Am6jPk7G1dWzf7m1rz/tUofdbCWWWDWWCt
         FPYwm1SOg8em+aB264O3gn+p0Db4cL4goCA6wK7lRjy3IpzK+tS5sJ55vKM7Vhhno4oq
         HV2xcPCic1D+yL8bJBEWvnjDLeTtoSj3oV4DUvawAqN95ET+TPNpzXQd0VhpJz0+kCum
         1gJEr1ozA1ZdZA+2YEBHeJwgVQCzEO33bqLkIeDclk7Zf930ESxCy7RW8J5Cbqnnn6na
         c+kQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzMKCDhrkhSbk5yxZMNwiebIb5CMqdq3L1UbCyy1BVWLoG+K+JzSvOXAq+QPzpU6Eia1zJJO67P9Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmzzzSY6TQohNSGjtLVL+18Iu9AgW+RoGaajA/Q/gCUWsOp3oX
	6frTwpDWOmPGpeOKN+pZE3VRIBVMsZz95QC6R919rKif5BnzNrhRiNzE2quqVkYiFD7uKTsnh/J
	gTBmFABBbF0mqepmvJ8S0zOCS+dy6ygK5VvCpXnwjtqeOwnElF/Lw7a+H+Qz63g==
X-Gm-Gg: ASbGnctNLKT52LPufY51HrL+Bi3cgf+SW5RDNv/ZQNYDqUT9O3Lta5WU+OeaW1cderB
	6p9r4oC09bDJWER9DAxBK1gkMNxs3p6elNSalKKEwITiDQaDFyWzr08wky7DNTZk90H2icxkLDo
	IfLaEcP/yUak5OcgKo9Xnyygipf1eVTeMd2vlsEWbDUpEY4rl0cEUVSNxgJMRnq/E8tovjv8fSd
	2j8EbsUgd6+uxo6u1wZ7rjwfRGMEsdtgxpsmy6Y0FR0AUVuNTjpaVQq+KHjqHq4yxcC16CMR46S
	RkcHSx09aS9PcqY2Grrw/o78budC+390skYirpd5Kto7ROwTvwYGwvxpq6/og4h4k9/eBWRBpUn
	hUmxJ8QOr1x5q6jlo7gkNKstBK0mTSFQH9pQbssQ27g7Evw==
X-Received: by 2002:ac8:5f8f:0:b0:4ed:b83f:78a3 with SMTP id d75a77b69052e-4eddbd7785dmr8990121cf.47.1762893849834;
        Tue, 11 Nov 2025 12:44:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE61o27JhGsft3MQNQXeIYKNMG5x6jKVgyaMvlVyyB9523TiIR1DvWB2nD07G01lezcrWTZAQ==
X-Received: by 2002:ac8:5f8f:0:b0:4ed:b83f:78a3 with SMTP id d75a77b69052e-4eddbd7785dmr8989821cf.47.1762893849371;
        Tue, 11 Nov 2025 12:44:09 -0800 (PST)
Received: from ?IPV6:2601:188:c102:b180:1f8b:71d0:77b1:1f6e? ([2601:188:c102:b180:1f8b:71d0:77b1:1f6e])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4edb56e2173sm55990661cf.2.2025.11.11.12.44.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Nov 2025 12:44:08 -0800 (PST)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <061cdd9e-a70b-4d45-909a-6d50f4da8ef3@redhat.com>
Date: Tue, 11 Nov 2025 15:44:07 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH mm-new v3] mm/memcontrol: Add memory.stat_refresh for
 on-demand stats flushing
To: Michal Hocko <mhocko@suse.com>, Waiman Long <llong@redhat.com>
Cc: Leon Huang Fu <leon.huangfu@shopee.com>, linux-mm@kvack.org,
 tj@kernel.org, mkoutny@suse.com, hannes@cmpxchg.org,
 roman.gushchin@linux.dev, shakeel.butt@linux.dev, muchun.song@linux.dev,
 akpm@linux-foundation.org, joel.granados@kernel.org, jack@suse.cz,
 laoar.shao@gmail.com, mclapinski@google.com, kyle.meyer@hpe.com,
 corbet@lwn.net, lance.yang@linux.dev, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, cgroups@vger.kernel.org
References: <20251110101948.19277-1-leon.huangfu@shopee.com>
 <9a9a2ede-af6e-413a-97a0-800993072b22@redhat.com>
 <aROS7yxDU6qFAWzp@tiehlicka>
Content-Language: en-US
In-Reply-To: <aROS7yxDU6qFAWzp@tiehlicka>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 11/11/25 2:47 PM, Michal Hocko wrote:
> On Tue 11-11-25 14:10:28, Waiman Long wrote:
> [...]
>>> +static void memcg_flush_stats(struct mem_cgroup *memcg, bool force)
>>> +{
>>> +	if (mem_cgroup_disabled())
>>> +		return;
>>> +
>>> +	memcg = memcg ?: root_mem_cgroup;
>>> +	__mem_cgroup_flush_stats(memcg, force);
>>> +}
>> Shouldn't we impose a limit in term of how frequently this
>> memcg_flush_stats() function can be called like at most a few times per
> This effectivelly invalidates the primary purpose of the interface to
> provide a method to get as-fresh-as-possible value AFAICS.
>
>> second to prevent abuse from user space as stat flushing is expensive? We
>> should prevent some kind of user space DoS attack by using this new API if
>> we decide to implement it.
> What exactly would be an attack vector?

just repeatedly write a string to the new cgroup file. It will then call 
css_rstat_flush() repeatedly. It is not a real DoS attack, but it can 
still consume a lot of cpu time and slow down other tasks.

Cheers,
Longman

