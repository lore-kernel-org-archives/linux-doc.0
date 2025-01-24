Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3123B23A0
	for <linux-doc@vger.kernel.org>; Fri, 24 Jan 2025 09:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737712718; cv=none; b=obUM8o69HMGO/Uo5Qw67gkynr64GD6llAbd4Eq2e7La5m9xo05jX/iiMNYXuCgcKUh1rqZMQY7C0fQp4NwkNLBkfyTJpoYRhbbdK69GVdwyGsguj/muvdEh4vzKL0JyYVZsGy2GsZTgYL3+gOrVwfgBMWZtu7XhHHfB9K+qhB5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737712718; c=relaxed/simple;
	bh=b0NM6/LjIOBz/UPiTAWXH24WsHcyH4sODiI1aMjHIqQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NR+MmLwZwzfxOnOIw8neXojoU57TIaJT2S+srgcxkETBXWopg4OMumP+yxQ9EGNgjd7aFkSM6xWU5fBgNET8pj866mo71ISakHUcae3Z7bfUZ7jEvU/O+4n0TE+sp4l+WbtPWsKle8JGrcPfYnc+tyPJZKjHcROkTm8hxjOGcQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=NfN34gq6; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="NfN34gq6"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2f800b5c2d5so106264a91.2
        for <linux-doc@vger.kernel.org>; Fri, 24 Jan 2025 01:58:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1737712716; x=1738317516; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QZxKjba6HTWFABaly4I6MxGfobohJauNd1R6JB0rLRg=;
        b=NfN34gq6ocg6H5q9aX72lfa55M6krjv3bcCtJBa/BzYL5Q7S2sd/EvJeJ2g3MdyrN9
         3f/GCpRgykl8Gsv5e9fNaOXTCXzj4ohIfPnjt99WjMwOIdtaaM1iLVB+chQYYp4SSwDM
         k18uXqKlGKgR8R7wmununkeU+T5M60R2I58JCJ6AzQsc+JZC77ldrNzWBDNHRM7acJJ0
         FmS5CjiZdpVtiO//cUJhF1sKducsiJTMf0k1toMHPTqNrXgIS4z6p9DYT7YwIX9n9ZHt
         D+tj7YuPGPUN4x2GO/bzrQTY7+U9EFaf2Idxp8wwltQmVVMgYyq0Tjz9gudpTceWoh/r
         rZ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737712716; x=1738317516;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QZxKjba6HTWFABaly4I6MxGfobohJauNd1R6JB0rLRg=;
        b=r+ZLAMRGNrYQGABVa2JwXAwQcgcX1PP0U4Lw8FjJlRK67+aGLNTtso+f3QbQxLqS2t
         XU35Vzh0I00nvpMQGgfYavEq2Y4R/QcCnk+X1kHf6Hz+QsSw7M4fN1fANklHLpN09WG5
         /K6pwv1765rm30FIouDW1TBRxEehZtnipgcY4P/ULiEQtCEMDShCdBsWwSri/awBbq0b
         2nhj1CeNuPiLY61Ih7+tUNqEKO/ygwiFwj0mfP2kB2RIiXflB/cUpsHZwy5gG3H45JG0
         h5HGpGHP354t7DaLYRzce65dXYAUNakDiNeaIz2/HqgNykTmNK3Cyf6jUecSe2W9JA0P
         PW7A==
X-Forwarded-Encrypted: i=1; AJvYcCVVnQ0/fwjHEV5zL0v5qWW+nouewy3Ui/qUtg3UC5DIxoOWk/eG2fp5wU+KxW8qOkhxgBJdCrcpUCo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGiWL0YESiuQBg/Ko40jeR9PBMxfcmKIMn/KcZBGEtbo0GZKir
	vOvYHcvYdC2ZBBZW2/E8g5c3Aju90/KW5BjUh9Urm0XcumHQOIsWHG3jg17V/b/jGZZ9hOhXEeg
	p
X-Gm-Gg: ASbGncuJzHBiP2vIlDyi1mOlPY2xo/q7iTpy2DRJQAXbzNpNa4z3JZxQ+kM51IWRvTS
	CGOh37ZEsM6wCLiZ5Xfq5IEhSxuqUSNtcNoc+g7eW0j61yhXFD/Y6pqQijGCH3LFKobc9eJiCph
	IigvA+8RQmV8j4/MGwTnFPyCGVAM0F8t60Hn4MLmAJwUUGohyc6JeXmHSNY86lMj/v1LP7Lbu8U
	nHqsPpFrHdLFgAkIys6hih2pWh4HahX76eVOwyuiKC5qDHCNO0sv2ovMiy6jR8DkcheoHeDM6De
	TKxaascWzPYkVqhUZpz9VUpPjtVJpw==
X-Google-Smtp-Source: AGHT+IHtYalRAVyxBUhTBsy5Jn95iocNFeyYPN3yZIod2dqOmdZ06kSOSS2mzh+YdMEduLvhnG7BLA==
X-Received: by 2002:a17:90b:6c4:b0:2ee:cbc9:d50b with SMTP id 98e67ed59e1d1-2f782d35946mr16117328a91.4.1737712716429;
        Fri, 24 Jan 2025 01:58:36 -0800 (PST)
Received: from [10.254.144.106] ([139.177.225.251])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7ffac2807sm1246125a91.20.2025.01.24.01.58.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jan 2025 01:58:35 -0800 (PST)
Message-ID: <a7a24c05-87ca-49d1-9fa3-be4c3555e238@bytedance.com>
Date: Fri, 24 Jan 2025 17:58:26 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] cgroup/rstat: Fix forceidle time in cpu.stat
Content-Language: en-US
To: =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
 Jonathan Corbet <corbet@lwn.net>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>, Yury Norov <yury.norov@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, Bitao Hu
 <yaoma@linux.alibaba.com>, Chen Ridong <chenridong@huawei.com>,
 "open list:CONTROL GROUP (CGROUP)" <cgroups@vger.kernel.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20250123174713.25570-1-wuyun.abel@bytedance.com>
 <20250123174713.25570-2-wuyun.abel@bytedance.com>
 <cf5k7vmtqa2a5e6haxghvsolnydaczrz5n3bkluttmula5s35y@z35txmj4bxsb>
From: Abel Wu <wuyun.abel@bytedance.com>
In-Reply-To: <cf5k7vmtqa2a5e6haxghvsolnydaczrz5n3bkluttmula5s35y@z35txmj4bxsb>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 1/24/25 5:22 PM, Michal Koutný Wrote:
> Hello.
> 
> On Fri, Jan 24, 2025 at 01:47:01AM +0800, Abel Wu <wuyun.abel@bytedance.com> wrote:
>> The commit b824766504e4 ("cgroup/rstat: add force idle show helper")
>> retrieves forceidle_time outside cgroup_rstat_lock for non-root cgroups
>> which can be potentially inconsistent with other stats.
>>
>> Rather than reverting that commit, fix it in a way that retains the
>> effort of cleaning up the ifdef-messes.
> 
> Sorry, I'm blind, where's the change moving wrt cgroup_rstat_lock?
> (I only see unuse of root cgroup's bstat and a few renames).

Hi Michal,

The following hunk deleted the snapshot of cgrp->bstat.forceidle_sum:

  	if (cgroup_parent(cgrp)) {
  		cgroup_rstat_flush_hold(cgrp);
  		usage = cgrp->bstat.cputime.sum_exec_runtime;
  		cputime_adjust(&cgrp->bstat.cputime, &cgrp->prev_cputime,
  			       &utime, &stime);
-#ifdef CONFIG_SCHED_CORE
-		forceidle_time = cgrp->bstat.forceidle_sum;
-#endif
  		cgroup_rstat_flush_release(cgrp);
  	} else {

and then read forceidle_sum from @cgrp directly outside of the lock,
but its value can be changed in this window, so...
  
-#ifdef CONFIG_SCHED_CORE
-	seq_printf(seq, "core_sched.force_idle_usec %llu\n", forceidle_time);
-#endif
+	cgroup_force_idle_show(seq, &cgrp->bstat);
  }
  
result in the inconsistence between forceidle and other cputimes.

Best Regards,
	Abel

