Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4FFD33C51B
	for <linux-doc@vger.kernel.org>; Thu,  6 Nov 2025 17:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762448567; cv=none; b=ESoj20do0tS9vrb6+UAuCCRMkSvEm4N7cdwcXW+7n2zudguZcfv9pJ+YvGCM+wPzpi/H0R5F7GxFuWuVypON43az7Kw6cLZhftAVH9b1OmfqniF39R29tzLGyyHB3u/GmIMC9da55H2A2/6LekHhhxjGVUhkTMksYWaxVc0N9Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762448567; c=relaxed/simple;
	bh=bmpbnRF3cKHlPN9Xaqa4sxklQfqyLwTGZdaTa34IQvM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TF4HayX6kcZo60AslDHvuBObvYQtc5u3rqodM2mhdVGfdAtf3KnbLTTUKMeD+B6Nvp59+YdccAbSSKNHycRnorRvtQg3dXpUCnxYZWyeTMuRsUYDMxfqdV936EjUC6MpV299dwTJ7k6FnjTfg38+yEk79xgMP4bbe7cSEWwtQsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nOFurHju; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nOFurHju"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-34077439166so1356303a91.2
        for <linux-doc@vger.kernel.org>; Thu, 06 Nov 2025 09:02:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762448565; x=1763053365; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YPpU0awjnKN/G6+KlazEDar1/1ZBM2a+Pz44QPC0Ujg=;
        b=nOFurHjuTzW0jfTeH02iB669PpnWqGca+VSjL5Xawhy24YIFlKgN4ZDeCkphWGSbpW
         y8A0huE1cOAJVEtiAqe+qxFfOPI/3xAr9ZpZfugEIW71U/rdRELKftThDLP/bMke3CPR
         agarxOKgUyUGSkUBPW8y7eboNpCPIBGv07HtXJI6bT9aybJhFylgLlwobWu0uDeJLbFE
         p2Bz484i47jg/RqlvITtoX7m4vid689CHH+SM2GXkNsbsuVQYrYlh3jYZBU4k36ALk64
         2aSl5hH2W9XzEXWuNxygV8f2mf52Z+oDtchEYxV9AhmFagL3m8mtpp0jovFzltywJ0ho
         MPlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762448565; x=1763053365;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YPpU0awjnKN/G6+KlazEDar1/1ZBM2a+Pz44QPC0Ujg=;
        b=Xy6SwB3ENuhe2sYICTABAW7RLW3oX8uBYnU6MyYZupaMkRhJo2Q6MqbZzExpBKlFiu
         q9jtZsbhxxzbUWtZIWQ49d4iLEzwtihze5S25K5VC4dDYjRn53spWDheUAXqzXgSxX/b
         IafdJAZu3xLplJcc6obhlE/UAF6AlO4JvAHPjg7WKdr5tffPoHYNw/umHLbNEMbgyNcQ
         VnJ9O52lMdxQNj0aFl6q76jWInd2Kig5hySUl/V/K30hrSSU95GULQgqZqn4uxadNXdI
         6kHeSqUIYe7NRzaVP77i67n9YrUQb2ufuoegUm2DwuFLQcrVROeoryc5Sru3UI91B14d
         OSXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWLmD/KaquEkOBODcdkApwzTfLJAClndCgk7VCOgsuvHmQ6ztCu/Iws1mQm/clpCtwyQD5imv4FKk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmL5ZAjbsixG+ZuAEUsKPoeDUU2e7QjguC5XAb2ztD3nTBLkEt
	/p+0agpObh6IjwEECHN+QwFkVYyc5kGjqUYrpgEC9EDievmx/Qr/CUOI
X-Gm-Gg: ASbGncsybUrmYWxf+2WkWU2Zesck99b4jFXPONI646JHkMWQV9vuRvESlfTVAGv4tow
	LjThuwd88XXWKqu5yDC8aIWPOQziWsOVGssKbQ624Ykh77I4PyWokutG+7IbpfVsCwR6+SYIZNK
	AJ+m5CPvnbXmR/STQMB5GkM+GCU3Kk7QM9fjA6ROVFebP/A/bawvC5rEUkYpDD/k3lC2fkecO2r
	iJPXKudnQtsffFrJy6byKnS5rrLvnGuhIcwwWc9FYL9koKEaiZohgmxwYw6Km+Gm8hDAHmYKAmM
	GV4fDwFT9ynTSjhsO0BRIzh5xjmv8KYojZJ9RFZpU1q8RrPaUtcls/b9SqFImr2MJrZkTxJBiHy
	NR2f+iP5Xh0AkmeXK0rCvt3us+06yb4TALykBwZjC8TvNEHsYmnv8WDf7VSmkIxRam5Rai1Zvir
	nEffW0PRij823AlpC3RUOZ
X-Google-Smtp-Source: AGHT+IF+6Xuvm4wgSMuStjeXOxmAX8A3ViGGV9aMWlq3E5tLch0rpxg/9QHMKCn3GRSTdg/WUL+Q6Q==
X-Received: by 2002:a17:90b:2f87:b0:330:6d5e:f17b with SMTP id 98e67ed59e1d1-341a6dc4b6emr10139367a91.21.1762448564481;
        Thu, 06 Nov 2025 09:02:44 -0800 (PST)
Received: from [192.168.4.196] ([73.222.117.172])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-341d0456b34sm3029537a91.3.2025.11.06.09.02.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 09:02:43 -0800 (PST)
Message-ID: <37aa86c5-2659-4626-a80b-b3d07c2512c9@gmail.com>
Date: Thu, 6 Nov 2025 09:02:41 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH mm-new v2] mm/memcontrol: Flush stats when write stat file
To: Leon Huang Fu <leon.huangfu@shopee.com>, linux-mm@kvack.org
Cc: hannes@cmpxchg.org, mhocko@kernel.org, roman.gushchin@linux.dev,
 shakeel.butt@linux.dev, muchun.song@linux.dev, akpm@linux-foundation.org,
 joel.granados@kernel.org, jack@suse.cz, laoar.shao@gmail.com,
 mclapinski@google.com, kyle.meyer@hpe.com, corbet@lwn.net,
 lance.yang@linux.dev, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, cgroups@vger.kernel.org
References: <20251105074917.94531-1-leon.huangfu@shopee.com>
Content-Language: en-US
From: JP Kobryn <inwardvessel@gmail.com>
In-Reply-To: <20251105074917.94531-1-leon.huangfu@shopee.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/4/25 11:49 PM, Leon Huang Fu wrote:
> On high-core count systems, memory cgroup statistics can become stale
> due to per-CPU caching and deferred aggregation. Monitoring tools and
> management applications sometimes need guaranteed up-to-date statistics
> at specific points in time to make accurate decisions.
> 
> This patch adds write handlers to both memory.stat and memory.numa_stat
> files to allow userspace to explicitly force an immediate flush of
> memory statistics. When "1" is written to either file, it triggers
> __mem_cgroup_flush_stats(memcg, true), which unconditionally flushes
> all pending statistics for the cgroup and its descendants.
> 
> The write operation validates the input and only accepts the value "1",
> returning -EINVAL for any other input.
> 
> Usage example:
>    # Force immediate flush before reading critical statistics
>    echo 1 > /sys/fs/cgroup/mygroup/memory.stat
>    cat /sys/fs/cgroup/mygroup/memory.stat
> 
> This provides several benefits:
> 
> 1. On-demand accuracy: Tools can flush only when needed, avoiding
>     continuous overhead
> 
> 2. Targeted flushing: Allows flushing specific cgroups when precision
>     is required for particular workloads

I'm curious about your use case. Since you mention required precision,
are you planning on manually flushing before every read?

> 
> 3. Integration flexibility: Monitoring scripts can decide when to pay
>     the flush cost based on their specific accuracy requirements

[...]
> diff --git a/mm/memcontrol.c b/mm/memcontrol.c
> index c34029e92bab..d6a5d872fbcb 100644
> --- a/mm/memcontrol.c
> +++ b/mm/memcontrol.c
> @@ -4531,6 +4531,17 @@ int memory_stat_show(struct seq_file *m, void *v)
>   	return 0;
>   }
> 
> +int memory_stat_write(struct cgroup_subsys_state *css, struct cftype *cft, u64 val)
> +{
> +	if (val != 1)
> +		return -EINVAL;
> +
> +	if (css)
> +		css_rstat_flush(css);

This is a kfunc. You can do this right now from a bpf program without
any kernel changes.

