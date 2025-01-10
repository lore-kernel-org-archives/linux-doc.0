Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A0421325A
	for <linux-doc@vger.kernel.org>; Fri, 10 Jan 2025 15:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736522809; cv=none; b=IVlXYIaVXUbkEu+Larcu9fWX7nhfbbONrUaVMafGvv1W0xzU4PGXx3uCQFyiUV51Uv7U13mBzTr3XumIjk8c7VLXtkgnvVGjiygsZpiv7DcfdaWs5Uhmx5XoOrcblpCT3tqhAgu7By0JmJ1WW9tlsuo8G6C5PWXiaw32iauZavA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736522809; c=relaxed/simple;
	bh=Ex4aV9Edi1DChr2/EY5NFS6dOSHhG+EPFES7jbVumoM=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=hufv68ClWWBXwZ8jHlPf0hjtECqe1KebD+AyTfCd8Q41JSBzfGPk0Yo4IjzmOzypsjomBC6K/jmz55A+XG0mmN8CtVTc7i3tYKpFd9DbR/IcvuGSrnlKjDrH6zA51G5JV3/NaS6CVwWZVwjK9pxdm9ud/rxIWr4boE6KDNwqjG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LNMpkElf; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LNMpkElf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736522806;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bdBZ2RENbUeoKAX57hmRqAxpZLgO4MtDE/EdcNWg7K8=;
	b=LNMpkElfi8pSiWAvBBDOHGV/TK5jQFQHec/URd2+LMWWyBcFXTzFMnRc3NcvNdyCdwkjEn
	O9PMCxuQx2Ir0bc50DRpjwkt/Kab8ZeST+ORnSjJ6scBir3GRF5O8ejmsM8A03s3LUril9
	PsBjML3ceNrmfwao6jmh+z8bk+Wt2iE=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-440-KxZozfU6OlaMOqmujnPVYg-1; Fri, 10 Jan 2025 10:26:45 -0500
X-MC-Unique: KxZozfU6OlaMOqmujnPVYg-1
X-Mimecast-MFC-AGG-ID: KxZozfU6OlaMOqmujnPVYg
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7b6f482362aso323805485a.1
        for <linux-doc@vger.kernel.org>; Fri, 10 Jan 2025 07:26:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736522804; x=1737127604;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bdBZ2RENbUeoKAX57hmRqAxpZLgO4MtDE/EdcNWg7K8=;
        b=Kpfw8rMYZtiSJ0vJtY/YwGGJV+12qLltaP3+EHHQ5B7EvLGO6LnwlKUSYHFXksMBKR
         /unkqEGIwBRs+ziNCZr9fxItPpTJv/YIuCs6TTkgZ7GKUb/iUgkLDQw38hzcr1pRHjbg
         hWEwYmOh9A54JPyJE0zpjonQnN7zWLZfY6JzITlN0TaFSC7TGSlnYqB8SprOAze0XXpk
         UQiSjfbZD5KPwrQXg1/mqSbS9M4cNpI8FmNlqSIjzMMuEKbxvnF54RIYyUk5e4vryxCi
         QS88qkcwZfPb9D/GlI388F/+SpkxpkgEqZppKhy07x8Cv2zdaXajbdznDbM6poXEmvCy
         Uoaw==
X-Forwarded-Encrypted: i=1; AJvYcCUdw3xbojCQ7ZAc/7KjnJDT0f5hZdOdhr4mFZamj1TT8N+KS8SP//R2IMueLSt2hP1bt8OIKlJvIvU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/Ox4S065/ZKLOlblAdLod2TBa5P1Fb/bAm8CW17UNmnpIADzG
	G80l9SA8rSrcSiFEIgTn76YaFs+9Z/D6NYOJ5IOJ2E17qAFOW5fW2vszWMvSXot2avVj9UCosFV
	wCkWeHNICwjXHuzv5Stn6QhMzKiI3ZCYlAtZaBrEOB/xIztBJS9mmq/Styw==
X-Gm-Gg: ASbGncvTYif7gDkIsiXJfpkLLfLrvq+7Q3mbG6vDGdV0uTfjlltvksUuJZHxqyNqvWQ
	YV08IxKSpmObsAxLPygvlq/Thtu6Aykewkp27Bw/yYLhaifXmwxOGGTsn6kWkWmm3wKgaImZKFT
	CVogrl9XM4HcxXjlI96d0gApFbV+ynTJwkbeTucYEdNGMF0CGXbAxe2WwGrxnniiXCFjmVB47D9
	mI6Yw++Kg8MKTy1NlePxTJObqKBTtbk3l66wIjxhAXtnHxG3lub44PeUIYYhYmlUTaNRdo1BpkY
	uF88sYJYTayBV4dx8R6h/62Z
X-Received: by 2002:a05:620a:404b:b0:7b6:eab3:cdd4 with SMTP id af79cd13be357-7bcd97705fcmr1737385185a.50.1736522804667;
        Fri, 10 Jan 2025 07:26:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGSahWFMhjNZQYhJ7J2TpMjNCXwN3Xv7VEbJyK4KJevacPGwI8K2RfhqqheueQiOBPMKvPiZQ==
X-Received: by 2002:a05:620a:404b:b0:7b6:eab3:cdd4 with SMTP id af79cd13be357-7bcd97705fcmr1737381785a.50.1736522804298;
        Fri, 10 Jan 2025 07:26:44 -0800 (PST)
Received: from ?IPV6:2601:188:ca00:a00:f844:fad5:7984:7bd7? ([2601:188:ca00:a00:f844:fad5:7984:7bd7])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7bce3516027sm181319985a.110.2025.01.10.07.26.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jan 2025 07:26:43 -0800 (PST)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <a8d5ded2-6921-4c6b-890d-17227147c28d@redhat.com>
Date: Fri, 10 Jan 2025 10:26:40 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation/cgroup-v2: Update memory.numa_stat
 description to reflect possible units
To: Li Zhijian <lizhijian@fujitsu.com>, linux-doc@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
 mkoutny@suse.com, Jonathan Corbet <corbet@lwn.net>, cgroups@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250110123019.423725-1-lizhijian@fujitsu.com>
Content-Language: en-US
In-Reply-To: <20250110123019.423725-1-lizhijian@fujitsu.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 1/10/25 7:30 AM, Li Zhijian wrote:
> The description of the memory.numa_stat file has been updated to clarify
> that the output values can be in bytes or pages. This change ensures that
> users are aware that the unit of measurement for memory values can vary
> and should be verified by consulting the memory.stat
>
> It's known that
> workingset_*, pgdemote_* and pgpromote_success are counted in pages
>
> Signed-off-by: Li Zhijian <lizhijian@fujitsu.com>
> ---
>   Documentation/admin-guide/cgroup-v2.rst | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
> index 315ede811c9d..5d1d44547409 100644
> --- a/Documentation/admin-guide/cgroup-v2.rst
> +++ b/Documentation/admin-guide/cgroup-v2.rst
> @@ -1427,7 +1427,7 @@ The following nested keys are defined.
>   	types of memory, type-specific details, and other information
>   	on the state and past events of the memory management system.
>   
> -	All memory amounts are in bytes.
> +	All memory amounts are in bytes or bytes.

You mean "bytes or pages". Right?

Cheers,
Longman

