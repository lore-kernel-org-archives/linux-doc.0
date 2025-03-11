Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E836A263C79
	for <linux-doc@vger.kernel.org>; Tue, 11 Mar 2025 18:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741719392; cv=none; b=D5H0vn2mtq0PUC0d/yK46ufgPVSjqBnoxjFwxIgYYAoItUgm4iuHzxYLEga2RnELSKPu9BbeKf/8CvaeiNXRMUXk5kiDM6E8TwMjKwI8pu/LH3cHj/F4arsdXqPbO11PDzFXlVzKd0H7Fxs1FykLhRh095y0zmMpeid9pNXUJf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741719392; c=relaxed/simple;
	bh=lNBjEgxta7oq4TwKBSAROy6ISAN/Tq6iYeWcKE4Vv/0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=uyrz3kOvoFGjLzQ5XH6IAQOLijP9jxFmjzM0xjIVmQC9r6jFyAJsDebdJdXL9gWt6abmS+I4fi0Otqd8VJ7h48JKTW7DLsK7p+rtuO6YOPlVmOLBvIwCkgAeCMPN+UCl7qgwa+CtQUEq2AWqPe19O4oN5NhGZwwZal6Wc+/XH5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=NnaOIMSd; arc=none smtp.client-ip=209.85.166.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="NnaOIMSd"
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-3d46fbfab10so1566865ab.0
        for <linux-doc@vger.kernel.org>; Tue, 11 Mar 2025 11:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1741719389; x=1742324189; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s1YRjMruou9Tx5jtWPInc60tJt2gIen0DOp7oUm6XP0=;
        b=NnaOIMSddEPHT8Qo1YzHCECi55a8B5zU7qb0NLMcOe01u/v3w/iNulIeG1JuPW0UNy
         /rb1+5kltBqg60TmY8Bz6/9ajmJYAOCmcQnPy0v2K/gWA7l7rh2l9X/UAAf8zHJ4oM9l
         6RoNW/z35MtTPNGzjeNPt+nxZRZpIhQjAHkAfSzw//XVlc25z2oXL2Zixzpe5qRnoFYd
         5THe5/7EDTSfX+eU6+np5F5WsQ6cz5nbf0unICwVfwdpVJ771ofp+Pl9fnNhGlErQG2f
         1+DDW5DkPSDCCAdW21fZnpey9nZiWZvNwemBtuemnmsJoaTHQI2WCN8mbATBeyQOh2QN
         EipQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741719389; x=1742324189;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s1YRjMruou9Tx5jtWPInc60tJt2gIen0DOp7oUm6XP0=;
        b=YTiuxwR3aN3QFPmnsiAx4JS8fueBKQps2uu9IWfGbbRvMLttf80NBvPsLonsoZgpJf
         QtuEm7mr8A+r32HdguY7W+V9wphJ5fExWIVAVor51tr4H3seTuTZUZY/aSVMVfVjRlG0
         4AtRD5pBjgV7Lt8HAJvxXgvBl+f7hrihTprqTrYYN+W0BPm4PLE0LkyitLePYRINE1e3
         dVdP2g3JEXJZcPgjS06kJpXXqtBMGgvRs3Ye5pTktJ5iRHdWM4K23yN4p2RZTEx9ygk3
         E80UQX6FpPJDHQlipYWAhh+SGATAJpIi403TpvVo1UZBWP62zX4CxDhhBx218dTYIeAv
         PRtw==
X-Forwarded-Encrypted: i=1; AJvYcCXI/yWBuVUhH8W4H5o8wEaitkaAh1kkWEgN77yQNKINUQlTwc4lvGaSXNpLsySXnR/dEToDAaSsN3g=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQJpb30/q8U5SDP0u3IYpxRg+FdCbNar+v2q+PiQFVfJtTVxoc
	V2BDjrVJmNjiwqQEOhj/hFwCn3NOSH6bxPobt+YtEpnFJ8ZA0dI2DI4Ktgdcd3Y=
X-Gm-Gg: ASbGncvbDbK+6dMBWVfzwtSVDycjad4sQSIelS9JKwJrCyEY4BhCVsXNMdwNmsa2GiQ
	VoKeFBnrURBuWlW0cwgz1A5/2seV4q8wPJa0vPLw8sJXUEXga3RAqDB2fhdJQMnOZpX2kKpGHG3
	gKIlSZ5zwLk6chbkCNcKlDBM/rrWlm3U/uE68w6LJNk8afet0obVKdf+fFBYqjllp5AsBm7H3m0
	t2LK4or4p6QbF9yCSkxdFP5Ug9ZWkoz7HWlUiveG7yXBgCLM8Yk+Fvs0OKNxS3dXjuMIX6qYKAn
	EQG7SqHp0WpeW4+7H0d8AlvYhOqeaJS7MucroEa9
X-Google-Smtp-Source: AGHT+IF6QEvMgNWs9dedBUfcF2UZXbN6XsW8AZipdiC80ycaj5jlFprQu0VmRz6Jjl/szbD7bbMzQQ==
X-Received: by 2002:a05:6e02:1c0b:b0:3a7:87f2:b010 with SMTP id e9e14a558f8ab-3d4419712a9mr212361315ab.5.1741719388965;
        Tue, 11 Mar 2025 11:56:28 -0700 (PDT)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f23abbf42csm1034856173.105.2025.03.11.11.56.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Mar 2025 11:56:28 -0700 (PDT)
Message-ID: <32c6f6fb-d75e-45a1-b050-4c078a757a50@kernel.dk>
Date: Tue, 11 Mar 2025 12:56:27 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH v2 00/11] cgroup v1 deprecation messages
To: =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>
Cc: cgroups@vger.kernel.org, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-mm@kvack.org,
 =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>,
 Josef Bacik <josef@toxicpanda.com>, Waiman Long <longman@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>,
 Shakeel Butt <shakeel.butt@linux.dev>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Johannes Weiner <hannes@cmpxchg.org>, Tejun Heo <tj@kernel.org>,
 Muchun Song <muchun.song@linux.dev>, Michal Hocko <mhocko@kernel.org>
References: <20250311123640.530377-1-mkoutny@suse.com>
Content-Language: en-US
In-Reply-To: <20250311123640.530377-1-mkoutny@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

> Memory controller had begun to print warning messages when using some
> attributes that do no have a counterpart in its cgroup v2
> implementation. This is informative to users who run (unwittingly) on v1
> or to distros that run v1 (they can learn about such users or prepare
> for disabling v1 configs).
>
> I consider the deprecated files in three categories:
>   - RE) replacement exists,
>   - DN) dropped as non-ideal concept (e.g. non-hierarchical resources),
>   - NE) not evaluated (yet).
>
> For RE, I added the replacement into the warning message, DN have only a
> plain deprecation message and I marked the commits with NE as RFC.
> Also I'd be happy if you would point out some forgotten knobs that'd
> deserve similar warnings.
>
> The level of messages is info to avoid too much noise (may be increased
> in future when there are fewer users). Some knobs from DN have warn
> level.
>
> The net_cls and net_prio controllers that only exist on v1 hierarchies
> have no straightforward action for users (replacement would rely on net
> NS or eBPF), so messages for their usage are omitted, although it'd be
> good to eventually retire that code in favor of aforementioned.
>
> At the end are some cleanup patches I encountered en route.

For the block related parts, as I'm assuming Tejun will pick this up:

Acked-by: Jens Axboe <axboe@kernel.dk>

-- 
Jens Axboe

