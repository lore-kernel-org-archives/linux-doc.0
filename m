Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9001C1A0B0E
	for <linux-doc@vger.kernel.org>; Wed, 24 Jun 2026 11:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782302126; cv=none; b=qHy+oipT1rVSCmYz9fFklJMJchHtNJgsXBxC69pTwb9Y6Rc6Irq882c8Y9uOZ35aRifasLxyWI02czfww1l+TNGxsWaZwjZBXZY9IlxGivvTlqoR6fvLvn8DB141xBqwGU+UsLRfVNcniNWoYob9CK42x79pNlK8dWdQLbuRth8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782302126; c=relaxed/simple;
	bh=+th0CrBhc9xLunvVRMGkRAEj3ZZ8/wqm7in4jBwAio4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ISmZeVH7eHrvNvpztXGWCxTrLS6Qy1G9LGhN3X+6uPyLceF90jzkg3nArDhAJ63qYTAd6cVgpkCO23uoWA98ig1XhxoITNFDjk4q9iM7EwwleUsBACOv9FDFiE3Wf3kv6E7hSrLvwbYjNTd/PVigqtw8FJs2BrtKxg9+XpGYBso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dImxTR0q; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dImxTR0q"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8453427d3f4so564956b3a.3
        for <linux-doc@vger.kernel.org>; Wed, 24 Jun 2026 04:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782302125; x=1782906925; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lFU8MyOIrfhmG7QxZLchLSQCDUz4MOf5up+HUhjl+OU=;
        b=dImxTR0qovpIMR0kDHETYWH15hxVNHw/hc8qoKrD+Ujye4Ef5lfuIajm/KW2ZZ5YZm
         YgzpAoSlaDqBsNYSobUB3vqnxiyZyGKws8Ms0ywL14XbNpNE8JXCZo8fKIlbU9sCGW9b
         IDPC54vUlaB+OjBu/RLKF65q+HvpsZwv4qUnQ+EfxmW/4+1YktabbtkzcT5WOhF0RPlZ
         iHx7MFMHAMTr+XaxIH2eo+1vEkkXMy8S5sWTATwdnbHcCWcBlMPOC0DLp1bBrXd3s1kc
         +Dw8W/0qbGvYJhf7eCdr988P28/Il4URkZRLhS22z0vxICDeJeuVWLz6+uClilQk0G6F
         dB3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782302125; x=1782906925;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lFU8MyOIrfhmG7QxZLchLSQCDUz4MOf5up+HUhjl+OU=;
        b=ESv0ixLOn0VtD37yGj8XTfVE3SOKN9iPlzv3lp7QJpRtvpYjvyMtTh1Yfu9Iylx8JG
         8t0lkZXiMyKNs1FrYz0tXg+YO9xBZIZhi88fU1n8D5IYdHUhhglbbrkg4C4yNH80RMpI
         yUvipPqlqMw1PrvLteRh7gvtM2bxVCsxGp0+ZJEYmkUKEuIwnueaHLe7jpi1eBwHIODT
         RkelREPyjRHAj+w/OAT08auBoIZG3hX8z1g032SsxHacfYQzlzS4nzhNn1TpG2XDWzCB
         DqG3d6baeszlVK/6HpsGCBavCg1+n3EavtafSPNU/Pu3NUxc9xdHioSCPitEf8Y+KGkW
         dggQ==
X-Forwarded-Encrypted: i=1; AFNElJ/H9bZXjNCDA3RyhWCv9/vCJx1t6PgAtx2oXY2JQjJMFUge8PkuXhj3bLpo0tDNJgDvxU+CFEyBHPk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEWmWR6sHN3n9meWd89oXeXldjxAS1FMK64qvAvCnUK22vs1WT
	Y5HuKg7H76zZkMxutWGnLjTLLx578OFGJn83B1LBVoQnMOleocJInOc9
X-Gm-Gg: AfdE7ckzu4k9Ga+/q5fJfcpqCJkeNtt83/k2PyW+panHaKMxJ7m47cXd6ek3fib+AR9
	w60RuFxJYqcFv5iXc7d+aCN6rKfkK6CvKKShNzrxvcfC5gfzQPAB8sGWHyiIl16s21Ij+svbj61
	eKS8Cr3lW5dmLI5FJNCatI1dYuyLGdw24AivcSty6uy3c/EakUcEQGjOP0JR0EK5mrZGDEIhIR5
	xX29Azfui9VRYVSW8pQPwD/3jMBznY42oaBl9qx7kjNJ87zmyGyoDV3luVBu31ZIp1T6bIFQB5y
	NqyAGLwOMs86XZ3eD8G665xbd+R7KXvEBagx0ftFAKVtljYcygLQSLWTG+gF3cYTauK+67L6gje
	Z1nAEF9NlSnwK1AVQe/mUKOakh+zpgQrUPRGpISCfuxGxETNbCpEK3QvVyxWoh1D6Ex1XGllePG
	wt04e7vNYXGHF6sUKMltF60N0/PSOcqLdN
X-Received: by 2002:a05:6a00:179c:b0:845:344f:eee9 with SMTP id d2e1a72fcca58-845a26dbf63mr4128286b3a.1.1782302124802;
        Wed, 24 Jun 2026 04:55:24 -0700 (PDT)
Received: from [10.125.192.89] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a40d23ccsm2563857b3a.36.2026.06.24.04.55.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 04:55:24 -0700 (PDT)
Message-ID: <0916e673-861f-b472-7417-afbffbcc98ad@gmail.com>
Date: Wed, 24 Jun 2026 19:55:14 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: [PATCH v4 2/5] mm/zswap: Factor writeback loop out of
 shrink_worker()
To: Yosry Ahmed <yosry@kernel.org>
Cc: akpm@linux-foundation.org, tj@kernel.org, hannes@cmpxchg.org,
 shakeel.butt@linux.dev, mhocko@kernel.org, mkoutny@suse.com,
 nphamcs@gmail.com, chengming.zhou@linux.dev, muchun.song@linux.dev,
 roman.gushchin@linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Hao Jia <jiahao1@lixiang.com>
References: <20260618044857.69439-1-jiahao.kernel@gmail.com>
 <20260618044857.69439-3-jiahao.kernel@gmail.com>
 <ajnGTt8tkbAWX8Oc@google.com>
From: Hao Jia <jiahao.kernel@gmail.com>
In-Reply-To: <ajnGTt8tkbAWX8Oc@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2026/6/23 07:36, Yosry Ahmed wrote:
>> +/*
>> + * Walk the memcg tree and write back zswap pages until the
>> + * (lower_pages, upper_pages) window closes, or abort encounter
>> + * MAX_RECLAIM_RETRIES times of the following conditions:
>> + * - No writeback-candidate memcgs found in a memcg tree walk.
>> + * - Shrinking a writeback-candidate memcg failed.
>> + *
>> + * For shrink_worker(), it passes lower=thr and upper=zswap_total_pages().
>> + * The @upper limit is refreshed in each iteration by re-evaluating
>> + * zswap_total_pages(), and the window closes once the total falls
>> + * below the threshold.
> 
> This is the wrong abstraction level, and it's obvious by the fact that
> the function calls zswap_total_pages() again to recalcualte
> 'upper_pages'. It gets much worse in the next patch as well.
> 
> The lower_pages and upper_pages thing is also unnecessarily hard to
> follow.
> 
> The core of the reuse here is the retry logic. So maybe keep the memcg
> iteration in the callers, and define a function that takes in one memcg
> and reclaims one batch from it? failures and attempts can be passed into
> the function to maintain the state across scans of different memcgs,
> like zswap_shrink_walk_arg?
> 
> WDYT?


Perhaps something like this?

struct zswap_shrink_state {
     int attempts;
     int failures;
     bool stop;
};

static bool zswap_shrink_no_candidate(struct zswap_shrink_state *s)
{
     if (!s->attempts && ++s->failures == MAX_RECLAIM_RETRIES)
         return true;

     s->attempts = 0;
     return false;
}

static long zswap_shrink_one(struct mem_cgroup *memcg,
                  struct zswap_shrink_state *s)
{
     long shrunk;

     shrunk = shrink_memcg(memcg, NR_ZSWAP_WB_BATCH);
     if (shrunk == -ENOENT)
         return 0;

     s->attempts++;
     if (shrunk <= 0 && ++s->failures == MAX_RECLAIM_RETRIES)
         s->stop = true;

     return shrunk;
}

static void shrink_worker(struct work_struct *w)
{
     struct zswap_shrink_state s = {};
     unsigned long thr;

     /* Reclaim down to the accept threshold */
     thr = zswap_accept_thr_pages();

     while (zswap_total_pages() > thr) {
         struct mem_cgroup *memcg;

         cond_resched();

         memcg = zswap_iter_global();
         if (!memcg) {
             if (zswap_shrink_no_candidate(&s))
                 break;
             continue;
         }

         zswap_shrink_one(memcg, &s);
         /* Drop the extra reference taken by the iterator. */
         mem_cgroup_put(memcg);
         if (s.stop)
             break;
     }
}

We could also fold the logic of zswap_shrink_no_candidate() into 
zswap_shrink_one(), but adding a !memcg check inside zswap_shrink_one() 
feels a bit awkward.

WDYT?

Thanks,
Hao
