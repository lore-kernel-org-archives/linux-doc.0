Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1Y3wbpzR"
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D208FA
	for <linux-doc@vger.kernel.org>; Mon,  4 Dec 2023 15:33:24 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1d08fba6a49so27305ad.1
        for <linux-doc@vger.kernel.org>; Mon, 04 Dec 2023 15:33:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701732804; x=1702337604; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qZqna/86LEiJZ8sfNn0MkJuP6GYG4BaAXnD4RQG2ee4=;
        b=1Y3wbpzR/T5FiRcXlItZhevaDtnyTRHM/omRBymJY9be5a4m8QbFQQIsse2H22PPKS
         35922ZR+9G6FV8BbjXedLlFMyAibrgC8WEZsto644xMlDN3OD5/0z49mpZgzHTLYYZw3
         JCUhV/W00hHVrT7qaSBwNMCwa2AJdNEkkeLlPIjrdE22wFK0CYs44Ke92SIUa25HrkxB
         nl9KvSdzsXfR5kxZISUlMm7dUtpRvGDiM/Xhd/fpUoKse6PDfRb4+4eg9XzbEYUgBbgA
         4qEyCoxIw9hN03vG7kxiCoOc6BjpI7bN0BnfHY30B/IR/ikEssCItVgcpbzwICSUeOPK
         Xq9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701732804; x=1702337604;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qZqna/86LEiJZ8sfNn0MkJuP6GYG4BaAXnD4RQG2ee4=;
        b=D/9AJcH0wovX35Z9wJhJ3sjcZFC1AxHJ1vRDjeRMGBw+QrT7H2oOt7tUORevgAB+fR
         UcGyXVUZ6RHeGoiinV6BuyKtJJ07MUMJJCqBcc+9VHJMDdnegGPr6jE86iP2ROByjRyL
         azymplxwb/XzrbenNkcuCQ8noXnHry9zTgEsJdmLL45VgX6m83mqYN3yIu2Fq5xAR6O2
         PUPlI4MBfMqiuiesHQzZq00shis8vZTfgXfeaLuruffWACkr+LCkzKEJvyN/IcyZHbkr
         Zk1x4PlMemXlPNbEfrA/orwaNL65EKo+lJ7JRprxAkIZP88/dpQTFHJKPYUjkFQSy/mS
         Mr3g==
X-Gm-Message-State: AOJu0YwaOxFjTj61WH1AMPkv8o0RkIOxSVLnU9xv2eA2asWOLbnr2s1p
	M4zhqNv2QRSP58E8Pc8OnE8BldB3sXqXnANESmRBZQ==
X-Google-Smtp-Source: AGHT+IHhzF5+TZoeR/TGWLm64ZHxmuhpjlna8IvhMz9oC1nBjufnwyjSPPBFmLy862wYr2+inaHJT+2BWXYyh5430eo=
X-Received: by 2002:a17:902:ab09:b0:1cf:9a44:1516 with SMTP id
 ik9-20020a170902ab0900b001cf9a441516mr682461plb.3.1701732803439; Mon, 04 Dec
 2023 15:33:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231204194156.2411672-1-davidf@vimeo.com>
In-Reply-To: <20231204194156.2411672-1-davidf@vimeo.com>
From: Shakeel Butt <shakeelb@google.com>
Date: Mon, 4 Dec 2023 15:33:11 -0800
Message-ID: <CALvZod5aq+uBBBo4R3BJUTXW4t+20s4iVGFzMefA7+f_bbdXKQ@mail.gmail.com>
Subject: Re: [PATCH] mm, memcg: cg2 memory{.swap,}.peak write handlers
To: David Finkel <davidf@vimeo.com>
Cc: Muchun Song <muchun.song@linux.dev>, core-services@vimeo.com, 
	Jonathan Corbet <corbet@lwn.net>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shuah Khan <shuah@kernel.org>, cgroups@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 4, 2023 at 11:42=E2=80=AFAM David Finkel <davidf@vimeo.com> wro=
te:
>
> Other mechanisms for querying the peak memory usage of either a process
> or v1 memory cgroup allow for resetting the high watermark. Restore
> parity with those mechanisms.
>
> For example:
>  - Any write to memory.max_usage_in_bytes in a cgroup v1 mount resets
>    the high watermark.
>  - writing "5" to the clear_refs pseudo-file in a processes's proc
>    directory resets the peak RSS.
>
> This change copies the cgroup v1 behavior so any write to the
> memory.peak and memory.swap.peak pseudo-files reset the high watermark
> to the current usage.
>
> This behavior is particularly useful for work scheduling systems that
> need to track memory usage of worker processes/cgroups per-work-item.
> Since memory can't be squeezed like CPU can (the OOM-killer has
> opinions), these systems need to track the peak memory usage to compute
> system/container fullness when binpacking workitems.
>
> Signed-off-by: David Finkel <davidf@vimeo.com>

Acked-by: Shakeel Butt <shakeelb@google.com>
