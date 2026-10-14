Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0455E511E70
	for <linux-doc@vger.kernel.org>; Wed, 14 Oct 2026 13:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791982978; cv=none; b=RXsfabHhxx68+QqAsuXmgTsgEOVZ9pYnkX5VPWlyYXfziuPphhCGyo0jHbKbLvnhM576JwB6tp6KygLw2QQ0bR5gEySg5L4qKpNhv1truhMfcVnAx4tcVM9FUGkCAVXO+PAW0Qm55aeh4YHwDBIBVVFUC9gIcpl9ocQYinCr4C4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791982978; c=relaxed/simple;
	bh=+ykcXLkofymWRd52it0fOc+h3cXzH/rkltUSBHqL56o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lxwggawvcGSkxgKtcVV2TLtBjWzpWiveaPDuUIwiu2BoGcKoHaWsqHy/llY6rC94idzkrtK6FIhf/ylCZ3V5OC/5lyJ6gBYYtJJHSaTVWg+UUupb92EEmwIq7pXtDGvxMaLg3UhbHpskGwsYZyJ45cDxVKLz1tM3P0YjT+r61K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=TVUlhJj7; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="TVUlhJj7"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-53504882980so49477531cf.2
        for <linux-doc@vger.kernel.org>; Wed, 14 Oct 2026 06:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1791982969; x=1792587769; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c+g+JcQ9fBuosfYzKHFrjP1VpW5rAUzuZgfEvkBjq+A=;
        b=TVUlhJj7HB6NXGxu5Qk4QVu5xSSfajlzYTdIM5UCJnnfrTgjr2RWfClzKC6A0dHbO6
         yYg3Cjcepb7u0aysNOA9Q5wcsWBIL+bIUQiDaMLNtdsynqcaezofjDthmXVbPxQxw+Qz
         pwBZVyZlwNcs5LZwWV0uYLI7bzBiCIpV4DLMPDHMCA6509v5yoBYKKZHbLro7UlY2AME
         Hux57UcL9EtMGgYYRJCHcADp1CrUwRujhqUmu/TJuBWKMBL9/EYHPWMqt4FlUqWyKzW3
         FX2z+de87BZXOTtn505HcaYTNuoXzj6FLbKTRUir4L8kVFGwaf+PTVsZrNxXThtFi1XK
         f1hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791982969; x=1792587769;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c+g+JcQ9fBuosfYzKHFrjP1VpW5rAUzuZgfEvkBjq+A=;
        b=FRPBRSAxEnc3z40ob8VFt9q7pzts5XsXrjmabTP3co3HLeQ6MYZFR3FY+pTR/4frfF
         yFth906ZubBq3LanLmhAmeSk6av2Zd62T5DTm3dIFwtseEmJnKvt19dPpA5hpUW2e5SV
         GbaFXHGmPVCSuApLNeKTXpIF2E8bQ9+qd6MwfV5umcb0o5qNRcuhkC6F4Sy5mQghMPL9
         SRxdH4jgGVfLp7iCOitvtfT+dSTU5TdX4GucJZYepNVkzyZzJdnEIwkXbCzY41aaU9P4
         hOecDym4uBr8YLaDwGIDD4IIvVcxThu7Tnxnubd+zV6e6eNwmhmBAbSl/cnqnH0SATal
         nj+w==
X-Forwarded-Encrypted: i=1; AKwUvByKbODM8GymKaLfJDOp9GT83gXayra2hR3w8WIpVmLLrvzAv7ryzglCfvBMmN45xMkrb7HD1120eg8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKWbIrHFI8aC27vWx1KxDf5ufCOP/mYgcfDWxHZRTFZSkaOqovp
	S7s3L6tloDYFpNpjLPOQ5wRqvwph9+l0TgLgqffuYfv1bmVFuMlitGBy7exrFmVq2d4=
X-Gm-Gg: AYBFou35yNZ7gMIdbUoVokN4DpAdnmlZa/g01w3g8diWIgrHs5DFYQNIGkvpDlaS+Wd
	phbQasB5VVqu7iIsUZCoT2pFfDyN75WBeXjeATIPDM3sQ/HsZKR18JlqzK+nQPCj9Cs5O9yZa5h
	g0ap09jswqZ8lhiPdm0pp4Mj0E9Jp/JwnF8PWJm3JR4l7F1mgeOFz3wCQMECXSlsdtuFyyHxIJJ
	0uce8+6zZVtNefv/StiX3M84ZVk9ZzI/5y+Lla14n9AuPHvHiPJkAecVELW24ypKKNm54tWkojH
	E88eHV0DCPJvDmDRZbCcuRvreDW3xg63fv/Y8KTvLLJ8TxdwehF84maZ9b0Zvt185Ea1mCMJiJc
	q4gXXFQY1bcBo0cGXz1gXZ+FO255tA7bC/Ptj1yDeOdUB2BfH4FFtKe5W9nqW9zwrJU5adArkjJ
	au/68TbjrV1MEZncbUiI4Dw9K/daBXjheT2TWszUht6cvuYZKInYF4cGNG0UzpdKvQWVj3AQfPc
	mUKsNkYwd1etHe2FPGdPT6rSiO6ss30pVF1/g8ghURXKonku8Q4wMk=
X-Received: by 2002:a05:622a:e14e:20b0:535:b506:11c8 with SMTP id d75a77b69052e-535b5062ea3mr142869471cf.46.1791982969440;
        Wed, 14 Oct 2026 06:02:49 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5359b76b030sm124693521cf.17.2026.10.14.06.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 06:02:47 -0700 (PDT)
Date: Wed, 14 Oct 2026 09:02:45 -0400
From: Gregory Price <gourry@gourry.net>
To: Li Zhe <lizhe.67@bytedance.com>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, 
	joshua.hahnjy@gmail.com, ziy@nvidia.com, mingo@redhat.com, peterz@infradead.org, 
	mgorman@suse.de, riel@redhat.com, juri.lelli@redhat.com, 
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
	bsegall@google.com, vschneid@redhat.com, kprateek.nayak@amd.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH 1/6] sched/numa: clear fault locality state on execve
Message-ID: <as98SA5yfBaeI4oj@gourry-fedora-PF4VCD3F>
References: <20261014094347.99157-1-lizhe.67@bytedance.com>
 <20261014094347.99157-2-lizhe.67@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014094347.99157-2-lizhe.67@bytedance.com>

On Wed, Oct 14, 2026 at 05:43:42PM +0800, Li Zhe wrote:
> task_numa_free(p, false) is used by execve() to reset NUMA balancing
> state without freeing p->numa_faults, because concurrent readers may
> still observe the task.
> 

Is a process that exec()'s going to run long enough to actually collect
any real numa fault data?

> the retained p->numa_faults array, but leaves the current-window buffer
> half and p->numa_faults_locality unchanged. Those are also NUMA fault
> feedback consumed by task_numa_placement() and update_task_scan_period(),
> so a newly executed image can inherit stale fault feedback from the old
> image.

I'm not sure this actually corrects much unless you have a long running
program that eventually exec()'s - and even then it seems like this all
self-corrects within a couple seconds.

Do you have some clear reproduction that makes an obvious wrong effect,
or was this just some static analysis?

It's "not wrong", but I'm trying to understand what impact this actually
has.

> The non-final path clears p->total_numa_faults and the averaged half of
> 
> Clear the whole retained p->numa_faults array and p->numa_faults_locality
> together in the non-final reset path.
> 
> Fixes: 04bb2f947505 ("sched/numa: Adjust scan rate in task_numa_placement")
> Signed-off-by: Li Zhe <lizhe.67@bytedance.com>
> ---
>  kernel/sched/fair.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 57360f5cdde4..1053437933ee 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -4177,8 +4177,9 @@ void task_numa_free(struct task_struct *p, bool final)
>  		kfree(numa_faults);
>  	} else {
>  		p->total_numa_faults = 0;
> -		for (i = 0; i < NR_NUMA_HINT_FAULT_STATS * nr_node_ids; i++)
> -			numa_faults[i] = 0;
> +		memset(p->numa_faults_locality, 0, sizeof(p->numa_faults_locality));
> +		memset(numa_faults, 0, sizeof(*numa_faults) *
> +		       NR_NUMA_HINT_FAULT_BUCKETS * nr_node_ids);
>  	}
>  }
>  
> -- 
> 2.20.1
