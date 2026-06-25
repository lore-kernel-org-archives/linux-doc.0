Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EED63DA5A1
	for <linux-doc@vger.kernel.org>; Thu, 25 Jun 2026 11:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782386900; cv=none; b=cvd25g93r1aiXSbsnlAa/q3Z/PCFly5aywuGB4AcZIsaqxAsQArPgdP45qLNbbXFlxdh3P4yd97w6NI7kd9aCSpmD8MW+JQZDD2Lkyes8J4SxYnFjEggphaNGJRhGX6RsC1Gce6v0t1W0cJYd6XGo0ERpxGTMc/ubPldsxdc+1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782386900; c=relaxed/simple;
	bh=9EmqR/QU3L6zxa1jX24ROznGfhsUPbqYOcUKXhdjfK8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u59QrO4ubUf5M9qUU9RGr0J5YiTPD9c5rNeVrlrLwT5/F3halRMTaMBow0IGkuJfbqy6aM2dFNSn+SB8ejombgmK4oUfeDMnTv8rxxtjhbJud9Ti7hxORGeVq9mi+umLG8bQQvCoCpOajliQSHKL7cQoreUrOBSOlgt6b9DnuQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N5u1hfud; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N5u1hfud"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2c6dadfbaafso19354755ad.3
        for <linux-doc@vger.kernel.org>; Thu, 25 Jun 2026 04:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782386896; x=1782991696; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AizybT0CQDOCLg4ll/0xAnza6/lwZnP0ZIiS3UphQeI=;
        b=N5u1hfudLGlr7Ek5iCAFM7c4OcS7s5DAN9ptQGE3IEINp3JStzGWWFJrepmkg8qUmo
         8yBceVjUxtstooO4uP+RVvIoJMTOpD8rLH+GMprtOQYbzK1pWAMEhHRJn2AHD2A7N28G
         VIU/e1CA2lYPj0sPk6DwQXvFIOqD2fqH2bZrG3to/TBXXqCyfi/Z7ErveEsQTkUlQ6qG
         MIlMocQuJhR591vupBywibp2/BQonbkR2dcprakKEIvYmvtJvQH23MryfpJoAfzDQBGN
         RQnpBUWzKNlEztvHO/ASJ3xMFnIVlDlfbF8hw0m/PDf7kYEgXKgSVZov/0FsslLkId81
         e0VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782386896; x=1782991696;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AizybT0CQDOCLg4ll/0xAnza6/lwZnP0ZIiS3UphQeI=;
        b=Pv5bWUmCPPnhjyKJ588dsSMysEwojUS2+hrOxAFw1KMolj9F6CtzHqCweJt8XuJeD6
         Ot4IvNHPgQmeOjtwxbEjbJuoDAYuL1R2zdDinWKr7F3wfnMA3VhcYs3uX52KKr5tWfmR
         FFlSu6nUhiovVCqJoYdCQHirzZe87pgA9+upw57sWSvz6f1pa7st47KgD5rCiSBgl4ek
         n0PErcEGuWa0Cre3wlkoi1DQVH0gEnoijYHB2sMKrUMfeqEVWkgObOeqaMwZKVH6PuSm
         DIBCOh2xDHWJ0Em1RhUBNWUkyoe7LO1yrUdxkLFTmmVckR4grHHQ94LyPkvb6B77SX5a
         MzXQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqg6/iwNEuk59ggZyWX24cJeBgtn8sKlI9Sj4BsPBDh4VDmw8JFqFOI7BtSNItyGLleM6VQQeGMufM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwiPsk71/UqJJoHJoBwB6aiwq3tEIBm1OUoPfFyLg0wQ3ehkZdF
	v/4Fg43XOdOT1I4XfWEBq5u6JUJFSabLhW5MX99M99LPGLrxzXuVfaWNq+7/jA==
X-Gm-Gg: AfdE7clCu7dQ23yk6MYuyDnHIi44zfxgolpH0HTRMF4lz/fyzHwzPmcr5/uNwUpe1oG
	SmvHz0ek27PBxnrUg5LHaYZgzese9m0pwb+LS5ulVrHx6hKxi5qJ65MyNaOR4SxRjeSQcEegSqv
	Vfs2vDN4H3gSe7BeuOnkHvsMHjqhno1tdKYMMC77bpXGq7IyCSELBRueaDz4cu3nB8mTD0U4heu
	ogOJYePbEbCDlMH4nxSYD7acpwNb+NIbrEomeeGkb86L3gaCVbRITLHLRBCCUoV7gZ8T52ClpPs
	utnXMEXqC22/iuDq65WY6IZofd2vI/Vi7yIfUSmnaU2hc948i4q5ZHk0NlDDwZT9vxqIJBaVnOL
	yJUjFlm9/OZTFUAK5ouKoKHYHTEeSxWpBwWASQdS9OfEEDZ+rG43LYZ6YG6tZeWFE7qbyWOSHH2
	X/C6twTMTJgjNcDDXmM6xjL+Qr4nMlxURJQr1iLSwzL9w=
X-Received: by 2002:a17:903:2b0e:b0:2ba:3e2f:6883 with SMTP id d9443c01a7336-2c7fc6f396amr21714615ad.19.1782386896284;
        Thu, 25 Jun 2026 04:28:16 -0700 (PDT)
Received: from [10.125.192.89] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f5afb17fsm18380775ad.26.2026.06.25.04.28.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 04:28:15 -0700 (PDT)
Message-ID: <91297bc0-268c-e9c2-57ae-6066eee5df2f@gmail.com>
Date: Thu, 25 Jun 2026 19:28:06 +0800
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
 <0916e673-861f-b472-7417-afbffbcc98ad@gmail.com>
 <CAO9r8zPSZLaqLXw87V3q4tZa8WD7xCympKqfLMLB+o-++GksJQ@mail.gmail.com>
From: Hao Jia <jiahao.kernel@gmail.com>
In-Reply-To: <CAO9r8zPSZLaqLXw87V3q4tZa8WD7xCympKqfLMLB+o-++GksJQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2026/6/25 01:00, Yosry Ahmed wrote:
> On Wed, Jun 24, 2026 at 4:55 AM Hao Jia <jiahao.kernel@gmail.com> wrote:
>>
>>
>>
>> On 2026/6/23 07:36, Yosry Ahmed wrote:

>>
>>
>> Perhaps something like this?
>>
>> struct zswap_shrink_state {
>>       int attempts;
>>       int failures;
>>       bool stop;
>> };
>>
>> static bool zswap_shrink_no_candidate(struct zswap_shrink_state *s)
>> {
>>       if (!s->attempts && ++s->failures == MAX_RECLAIM_RETRIES)
>>           return true;
>>
>>       s->attempts = 0;
>>       return false;
>> }
>>
>> static long zswap_shrink_one(struct mem_cgroup *memcg,
>>                    struct zswap_shrink_state *s)
>> {
>>       long shrunk;
>>
>>       shrunk = shrink_memcg(memcg, NR_ZSWAP_WB_BATCH);
>>       if (shrunk == -ENOENT)
>>           return 0;
>>
>>       s->attempts++;
>>       if (shrunk <= 0 && ++s->failures == MAX_RECLAIM_RETRIES)
>>           s->stop = true;
> 
> Do we need 'stop' or can we just return a value here to indicate that
> we should stop (e.g. -EBUSY)?
> 

Perhaps we could return -EAGAIN instead of -EBUSY? This would align with 
the semantics of the memory.reclaim interface, which returns -EAGAIN 
when it reclaims fewer bytes than requested.


>>
>>       return shrunk;
>> }
>>
>> static void shrink_worker(struct work_struct *w)
>> {
>>       struct zswap_shrink_state s = {};
>>       unsigned long thr;
>>
>>       /* Reclaim down to the accept threshold */
>>       thr = zswap_accept_thr_pages();
>>
>>       while (zswap_total_pages() > thr) {
>>           struct mem_cgroup *memcg;
>>
>>           cond_resched();
>>
>>           memcg = zswap_iter_global();
>>           if (!memcg) {
>>               if (zswap_shrink_no_candidate(&s))
>>                   break;
>>               continue;
>>           }
>>
>>           zswap_shrink_one(memcg, &s);
>>           /* Drop the extra reference taken by the iterator. */
>>           mem_cgroup_put(memcg);
>>           if (s.stop)
>>               break;
>>       }
>> }

> 
> I think splitting the shrink/retry logic over 2 functions makes it
> more difficult to follow, so yeah I think fold
> zswap_shrink_no_candidate() into zswap_shrink_one(). Then the callers
> only need to iterate memcgs (depending on the context) and call
> zswap_shrink_one() for each of them.

So, something like this?

/* Track progress of a memcg-tree writeback walk. */
struct zswap_shrink_state {
     int attempts;
     int failures;
};

/*
  * Take one step of a memcg-tree writeback walk driven by the caller's
  * iterator, and fold the result into @s, the retry bookkeeping shared
  * across steps. @memcg is the iterator's current memcg, or NULL once
  * it has wrapped around after a full pass over the tree.
  *
  * The function returns -EAGAIN to signal the caller to abort the walk
  * after encountering the following conditions MAX_RECLAIM_RETRIES times:
  * - No writeback-candidate memcgs were found in a memcg tree walk.
  * - Shrinking a writeback-candidate memcg failed.
  *
  * Return: The number of compressed bytes written back (>= 0), or -EAGAIN
  * once the retry budget is exhausted and the caller should abort the walk.
  */
static long zswap_shrink_one(struct mem_cgroup *memcg,
                  struct zswap_shrink_state *s)
{
     long shrunk;

     /*
      * If the iterator has completed a full pass, update the shrink state
      * and check whether we should keep going.
      */
     if (!memcg) {
         /*
          * Continue shrinking without incrementing failures if we found
          * candidate memcgs in the last tree walk.
          */
         if (!s->attempts && ++s->failures == MAX_RECLAIM_RETRIES)
             return -EAGAIN;
         s->attempts = 0;
         return 0;
     }

     shrunk = shrink_memcg(memcg, NR_ZSWAP_WB_BATCH);

     /*
      * There are no writeback-candidate pages in the memcg. This is not an
      * issue as long as we can find another memcg with pages in zswap. Skip
      * this without incrementing attempts and failures.
      */
     if (shrunk == -ENOENT)
         return 0;
     s->attempts++;

     if (shrunk <= 0 && ++s->failures == MAX_RECLAIM_RETRIES)
         return -EAGAIN;

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
         long ret;

         cond_resched();

         memcg = zswap_iter_global();
         ret = zswap_shrink_one(memcg, &s);
         /* drop the extra reference taken by zswap_iter_global() */
         mem_cgroup_put(memcg);
         if (ret == -EAGAIN)
             break;
     }
}
