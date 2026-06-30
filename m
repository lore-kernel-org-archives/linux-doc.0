Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06FF3FE36C
	for <linux-doc@vger.kernel.org>; Tue, 30 Jun 2026 10:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782816693; cv=none; b=TnMHI0kTH+5WLmHgNQWP/T+89JpukegN9xnIyQq3nYfhM/D48eEn97aee8+ghhC1LqxR/WtmanNjnmYXr3zF7lY9qJdxgarPXZ8B1UyhdRgfhacoAmiXyPrXlqXPpcaoKsfmCXnk+gUfrFoqsN6HbbWKGfcCHNX58vjsfOUrfu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782816693; c=relaxed/simple;
	bh=sABWBCPSix0Ac0AzPgCOi8BFXz2KuAhR+MoVhVTMzps=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lNTbwI3C4y/iGHZntMqScYhEPQIk5YNcNOXDJbOi9OPhLDExw6vlFU3srDwAHtLNQ4Wqs87Xj6Xg57+stcuOrNDsZ0z85J11nWvxdTyfCo5rZQD+kYQ+5vS68Ht5ViTMlJlifUfWEvIdcoEIixpMvr5jQayJf9BwgkJrsKmpNE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bQ+mzJRw; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bQ+mzJRw"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2c95a0c0aa2so29699685ad.3
        for <linux-doc@vger.kernel.org>; Tue, 30 Jun 2026 03:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782816684; x=1783421484; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zOCmAhk2QZilrROnFdYyZ9E7NHFNJQbLWBKSgKarjZM=;
        b=bQ+mzJRw/1C86mnD7zXv7koQo/fphihKfKRDqtawV+u0xAsDGGvllS9y++8uQFrMu1
         FfKdlCZhQIBHKYk3ddAKHhBgVgDTUAY1H8ok5Fc0d6Qkl0seOdRwDiSiYHpW1qls08n4
         TY2ocytRZJpu77tgFW8TI6h3xursK2HhgZdUhFsmrdVDyIXTWlvqMiVXqjH7Kce88bSR
         duzMHmJRiXjLIIpJcfqEYc36TVA2+jVPO9T0od5quA9VFYLtdLCRbdQ81+W9m3MlD8lh
         odJGxYtZvnjwXr4r4q9iLX8Ta4iVE2OnTdnZEGpWYgWVqgiccpP74nfjUUUKRWnEjA76
         lWTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782816684; x=1783421484;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zOCmAhk2QZilrROnFdYyZ9E7NHFNJQbLWBKSgKarjZM=;
        b=nvDvYBxNXBsZG2vOXxkKdflp7WIp0mxJ1h+9BDUuvw3Vn5a8VD2rpeXxpQ1aN32wJN
         blwt9/PA2eqYB1aSv86U/ouF9siDxpFynAvd8GR/S6xWD892jB9QRZmq7OT0VM94VXql
         1PWDjkqW47OJidyFTqD3zxC4t0TcqGL69T0wvuHwWWSy09L06GTa7o1bSHn8FGK9y71f
         zJMcg5OKWYM4HpGvghIfdca/aE9LfDNTvIRe/qbtbEmV8cbRqpAJIpu9jYD9dChRJ7Dl
         WGq5rL2Aa581EfiX489sRq+v+6oAQK6KAowKUYxT57yiQ87u29wvfPOPj/en6Kka8r+T
         jsFw==
X-Forwarded-Encrypted: i=1; AHgh+RrF8Fc/+D/woI3bSWPvAnJa0/bw2xlW/5inkG3YRy73Zo771Z03LkIoFh2tCEw1C6JbJ3MUFoFJUCY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfXDX/1b+ZvLOCeLdpKTGwqKAFObQ3YuJZE7ZIDmu5dXPO4eCf
	+//cl5E621dcCOGrX+wWHwF/CDf05NoE4EU+FjyFcEQx62gVsZxHuFYQ
X-Gm-Gg: AfdE7cl2c3dajwt7nwtYSnnbtwfr7uY8UyLR/2/Obc8aX45Ns/HjnQjKK8Ig/STI4qS
	ODvDhRN/6l1VxRsdR2bJm3rK59lyU0wm/Zk4Po8Rlmr+xrRw58Noa3OhsRGWxPGB90J7C5tnOUA
	nin7gMy3DWKLcJVAVSlpBXiOsP32JFQVYxulGT2DY3Q+SQ2Niqw0piXbucN1kXU69Lfe0ZYvat2
	8oVSssSx/zA3vlp+QZCqj40dMcHHbNIvPPHDUBC9loQjI7VOVHPQrJ/RbHI2ML2Vjq+4yqWLXgZ
	6234dwNw3tbbsHdCbuPSIvoHoQwYx6t2RR1R5lQ5V2oQ63Do6ibP+qGTI/oE5+G6vuGhr3pQt6q
	qcmW9sTXnma1y6Zh+UEYoemTKQ5PU9PCYR5wxzCHKfTJuoMgyFiOJ+jTFhaw8pHNMLVa+nYNIMi
	pS0ThyTb0ZnqVGJlOZYfDxYqt4JPeUsjFz
X-Received: by 2002:a17:902:f68e:b0:2c2:bd7f:ccd4 with SMTP id d9443c01a7336-2ca2d56ab0fmr23156785ad.21.1782816683996;
        Tue, 30 Jun 2026 03:51:23 -0700 (PDT)
Received: from [10.125.192.77] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca3828c950sm10687625ad.51.2026.06.30.03.51.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 03:51:23 -0700 (PDT)
Message-ID: <fe15eb9f-0b6c-dcaa-d0a7-5f08c3f92bfb@gmail.com>
Date: Tue, 30 Jun 2026 18:51:14 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: [PATCH v5 1/6] mm/zswap: Fix global shrinker when memory cgroup
 is disabled
To: Nhat Pham <nphamcs@gmail.com>, yosry@kernel.org
Cc: akpm@linux-foundation.org, tj@kernel.org, hannes@cmpxchg.org,
 shakeel.butt@linux.dev, mhocko@kernel.org, mkoutny@suse.com,
 chengming.zhou@linux.dev, muchun.song@linux.dev, roman.gushchin@linux.dev,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Hao Jia <jiahao1@lixiang.com>, stable@vger.kernel.org
References: <20260629112032.20423-1-jiahao.kernel@gmail.com>
 <20260629112032.20423-2-jiahao.kernel@gmail.com>
 <CAKEwX=MniM-4-aV17aH3UiDd_Xd2RH743fFZaxEnYX9qvnokeA@mail.gmail.com>
From: Hao Jia <jiahao.kernel@gmail.com>
In-Reply-To: <CAKEwX=MniM-4-aV17aH3UiDd_Xd2RH743fFZaxEnYX9qvnokeA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2026/6/30 02:37, Nhat Pham wrote:
> On Mon, Jun 29, 2026 at 4:20 AM Hao Jia <jiahao.kernel@gmail.com> wrote:
>>
>> From: Hao Jia <jiahao1@lixiang.com>
>>
>> When memory cgroup is disabled, mem_cgroup_iter() always returns NULL.
>> Therefore, the global shrinker shrink_worker() always takes the !memcg
>> branch. After MAX_RECLAIM_RETRIES empty walks, the worker simply gives up,
>> so it fails to write back anything.
>>
>> Therefore, when memory cgroup is disabled, fall through with the !memcg
>> branch and shrink the root memcg directly. Stop the loop once
>> shrink_memcg() reports -ENOENT, since the root LRU is the only target and
>> -ENOENT means it has been exhausted.
>>
>> Fixes: a65b0e7607cc ("zswap: make shrinking memcg-aware")
>> Cc: stable@vger.kernel.org
>> Reported-by: Yosry Ahmed <yosry@kernel.org>
>> Closes: https://lore.kernel.org/all/CAO9r8zPVzMKFbCixxD-qgtRrkFxWVrHiZZeLc=eyTPKPVQgX4g@mail.gmail.com
>> Signed-off-by: Hao Jia <jiahao1@lixiang.com>
> 
> Ah good catch.
> 
> 
> 
>> ---
>>   mm/zswap.c | 16 ++++++++++++++--
>>   1 file changed, 14 insertions(+), 2 deletions(-)
>>
>> diff --git a/mm/zswap.c b/mm/zswap.c
>> index 761cd699e0a3..0f8f04f22888 100644
>> --- a/mm/zswap.c
>> +++ b/mm/zswap.c
>> @@ -1356,7 +1356,12 @@ static void shrink_worker(struct work_struct *w)
>>                  } while (memcg && !mem_cgroup_tryget_online(memcg));
>>                  spin_unlock(&zswap_shrink_lock);
>>
>> -               if (!memcg) {
>> +               /*
>> +                * Reaching a NULL memcg means a full hierarchy pass completed.
>> +                * Exclude the memcg-disabled case, where it is always NULL, and
>> +                * fall through to shrink the root LRU directly.
>> +                */
>> +               if (!memcg && !mem_cgroup_disabled()) {
>>                          /*
>>                           * Continue shrinking without incrementing failures if
>>                           * we found candidate memcgs in the last tree walk.
> 
> nit: I wonder if we can just merge this comment with the new comment
> you just added.

Updated. Please see below.

> 
>> @@ -1378,8 +1383,15 @@ static void shrink_worker(struct work_struct *w)
>>                   * with pages in zswap. Skip this without incrementing attempts
>>                   * and failures.
>>                   */
>> -               if (ret == -ENOENT)
>> +               if (ret == -ENOENT) {
>> +                       /*
>> +                        * With memcg disabled the root LRU is the only target, so
>> +                        * we should abort if it has no writeback-candidate pages.
>> +                        */
>> +                       if (mem_cgroup_disabled())
>> +                               break;
> 
> Hmm do we need to do this? Consider a system with cgroup enabled but
> with just one cgroup (root?). The behavior would just be trying that
> cgroup for MAX_RECLAIM_RETRIES failure attempts, correct?
> 
> In that case, we don't need to do this check, and we would get the
> same behavior. The loop would terminate after MAX_RECLAIM_RETRIES :)
> 
> Could you fact-check me? :)

Exactly. When memcg is disabled, shrink_memcg() returns -ENOENT only if 
the root LRU is empty. An empty root LRU implies that the total pages 
have already dropped below the threshold (thr). At this point, the loop 
safely terminates because of the zswap_total_pages() <= thr check. In 
all other cases (where shrink_memcg() returns anything other than 
-ENOENT), the loop will eventually exit either by hitting the 
MAX_RECLAIM_RETRIES limit or when zswap_total_pages() <= thr.

How about something like this? If there are no objections, I'll fold 
this into the next version.

     mm/zswap: Fix global shrinker when memory cgroup is disabled

     When memory cgroup is disabled, mem_cgroup_iter() always returns NULL.
     Therefore, the global shrinker shrink_worker() always takes the !memcg
     branch. After MAX_RECLAIM_RETRIES empty walks, the worker simply 
gives up,
     so it fails to write back anything.

     Therefore, when memory cgroup is disabled, fall through with the !memcg
     branch and shrink the root memcg directly.

     With memcg disabled, shrink_memcg() only returns -ENOENT when the root
     LRU is empty, which means the total pages are already below thr. 
The loop
     then safely bails out via the zswap_total_pages() <= thr check. For any
     other return value from shrink_memcg(), the loop is guaranteed to 
terminate,
     either after MAX_RECLAIM_RETRIES failures or once the threshold is met.

     Fixes: a65b0e7607cc ("zswap: make shrinking memcg-aware")
     Cc: stable@vger.kernel.org
     Reported-by: Yosry Ahmed <yosry@kernel.org>
     Closes: 
https://lore.kernel.org/all/CAO9r8zPVzMKFbCixxD-qgtRrkFxWVrHiZZeLc=eyTPKPVQgX4g@mail.gmail.com
     Signed-off-by: Hao Jia <jiahao1@lixiang.com>

diff --git a/mm/zswap.c b/mm/zswap.c
index 4b5149173b0e..9d4f19fc440e 100644
--- a/mm/zswap.c
+++ b/mm/zswap.c
@@ -1361,11 +1361,12 @@ static void shrink_worker(struct work_struct *w)
                 } while (memcg && !mem_cgroup_tryget_online(memcg));
                 spin_unlock(&zswap_shrink_lock);

-               if (!memcg) {
-                       /*
-                        * Continue shrinking without incrementing 
failures if
-                        * we found candidate memcgs in the last tree walk.
-                        */
+               /*
+                * A NULL memcg ends a full hierarchy pass (except when 
memcg is
+                * disabled, where it is always NULL: fall through to 
the root LRU).
+                * Count a failure only if the pass found no candidates.
+                */
+               if (!memcg && !mem_cgroup_disabled()) {
                         if (!attempts && ++failures == MAX_RECLAIM_RETRIES)
                                 break;

Thanks,
Hao
