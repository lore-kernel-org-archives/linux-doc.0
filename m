Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81751478870
	for <linux-doc@vger.kernel.org>; Wed, 15 Jul 2026 12:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784118667; cv=none; b=OcVAb7QD7n9Rxoh74ttoiLT3VZVqVBiuNTuwSJHAtD2PXAqCUJvOJMvBsZvnQWA9j1Jl3729yW+yIgRLR+mYLdv5lpaMIrth51aEz7lwLT+H3z4+05oVrCgEt8sj/+1E+QB6uNodQr5LJJ75ymEfxai0hdn/diTqyjtKTi5Pmiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784118667; c=relaxed/simple;
	bh=n69afPvxXMg5pJEtJyjh27rhLIgr92BGrls45LTgHSQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jgDK+kUAn34Qco2KVJCe0a1l6AOu2j820It3KfcgrtPfyqb5GNnfWvFU+4rBLMJPIGSyoV0I/31bmybJlMGNfE5/x08jJIntIBVRSYzXuwUTuDALPucXen2+5qMUQO1lWvdCIRwkeYJjDzIH30i1FyThJb+/WN9NXBbf1xO+GUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sQO+FYZX; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sQO+FYZX"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-848595b338cso6293491b3a.0
        for <linux-doc@vger.kernel.org>; Wed, 15 Jul 2026 05:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784118664; x=1784723464; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FL4DH6iSB8h5Gk2sonUHgNYBuRFyDX29syp4nQdWWD4=;
        b=sQO+FYZXlXwSVXQNNzCrbDjHIO/shqU9KIXF99Rh6myELdKJ1IO2jlm/yBFPePsTqS
         JT6S3Hj7KN8J2FO9Q0CFJH07ILf+c4OresvXfbwt0biaWf9VGTkLc/6PisFxqFmLTm2f
         yAD+w8ETJ6XSZt1BfvGQ4pZUN1MFxuHNBvBFg9jvbmtbWF2829+SZeLH0Xli5fJV6Hpk
         nwMIMZtCTrhvL/R44tEqWSlLiPoG5CbxqljpUeMCxFUyBVvIAlF/m49cty+i95VBAqhM
         X4T39CmwvT9eMTn5cWbz2IsNVip7AJSrdTor4FObMg6MHrSANNyTGRsCdje4LfQ4rxNb
         /E4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784118664; x=1784723464;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FL4DH6iSB8h5Gk2sonUHgNYBuRFyDX29syp4nQdWWD4=;
        b=osY5TsA+6rK6siSXhnePXnhxdbx3o8AOZ0pDxwHXpIEcF26YF3OCYf47zbMWb+W2y8
         68+uEUVJyd/SbXbX6fDvzc+8FW37CZwdj7tSFoMLLq09BEnHRTo6j8V1IDiJVY7SIRbk
         VDzcDtwvTGU4AKYhLI/A/UDatrNilvhOOz5qmT1/37cSaGQvTnRJ71CRt6fXFteqPpV/
         KH6NxNOGe3WXrsD4M+R6yHTZwvdDCiZ7nnHK3kAZbyWgeVL/b7MljlJQUqrixL2T3zZd
         ACNySMBxJ1Hyga5sAwgnR22RyFNpbjYpZ/Sxw1CvW5KH5PTv6LZ6gmzryPIHNYtnUSJF
         j86A==
X-Forwarded-Encrypted: i=1; AHgh+Rp1UwKK6WAD/BolK3sruSq1ZSlg7RAB36+tobsAI+0/qqgVpORgEI7nHl73TE66c7vANtqUZ5+WKCg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyK0qjAsZqoVfP3LjJ4Ha2ygf8JXA5W0e8ELljGpJjCAwEI+410
	I8UYIyESbzJVOJC+sEEeF57yjG3a/RmPh0MHsfBlFVp556SkGeeS6bi2gFIdqA==
X-Gm-Gg: AfdE7cnRguwtbe/gj7qJJOy8ivN+QAXQyez0KEqE3qz9ZEdxecFofTK3liuG53Mkf7i
	PvuxhY8rk6nFiIj2mMZ4EAziWxNB0D9t5CcrmyYyS051eQHMdlgTkJwsWbhN6RbN7eI4ApzTZru
	b3wzOXz5HBF1lseRJA8hMt3fb/nOjtTh5EII/SNgZVFgLabe7zrq+4evu6uCWQAFGmxZ+U+UrLe
	Tepebo2oKfX3/aev0fFm2TOD4MUTTXcFdHgC46diMgR0HKdorG4VVIL9Jf+sQ3lukxFlMWnZvjP
	uHcbhXg43hnbuitr63/QdDenCQpM5ASyjKC8/PJQQunWjVVgpFm5w+Qwt21UTvpsyTI5cmW1DaQ
	nF6gWhUrF1rrveisIsBLRz4d2Li/e52Ym4hSqg+mxuh/YOwBwub5uNVYkuiwsWswZ5sB6iSaffF
	JVvq5rRKnfaINmfT05qkgS3f4e5joW6bU1cw==
X-Received: by 2002:a05:6a00:4612:b0:848:2f6e:e52e with SMTP id d2e1a72fcca58-84a5587a0a1mr6247775b3a.66.1784118663610;
        Wed, 15 Jul 2026 05:31:03 -0700 (PDT)
Received: from [10.125.192.114] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f7dade0sm3092157b3a.46.2026.07.15.05.30.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 05:31:03 -0700 (PDT)
Message-ID: <7a1fe347-7ca6-4768-9308-420bf1251f54@gmail.com>
Date: Wed, 15 Jul 2026 20:30:43 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: [PATCH 1/2] mm/zswap: Fix global shrinker when memory cgroup is
 disabled
To: Andrew Morton <akpm@linux-foundation.org>, Yosry Ahmed
 <yosry@kernel.org>, nphamcs@gmail.com
Cc: tj@kernel.org, hannes@cmpxchg.org, shakeel.butt@linux.dev,
 mhocko@kernel.org, mkoutny@suse.com, chengming.zhou@linux.dev,
 muchun.song@linux.dev, roman.gushchin@linux.dev, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Hao Jia <jiahao1@lixiang.com>, stable@vger.kernel.org
References: <20260714081510.16895-1-jiahao.kernel@gmail.com>
 <20260714081510.16895-2-jiahao.kernel@gmail.com>
 <CAO9r8zM5nzDqNcx5UoDgGexvR6jf8MmJV9SomM4AS7n-rZ2o5Q@mail.gmail.com>
 <20260714193129.f81711f516504b659d544741@linux-foundation.org>
From: Hao Jia <jiahao.kernel@gmail.com>
In-Reply-To: <20260714193129.f81711f516504b659d544741@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2026/7/15 10:31, Andrew Morton wrote:
> On Tue, 14 Jul 2026 09:52:59 -0700 Yosry Ahmed <yosry@kernel.org> wrote:
> 
>>> When memory cgroup is disabled, mem_cgroup_iter() always returns NULL.
>>> Therefore, the global shrinker shrink_worker() always takes the !memcg
>>> branch. After MAX_RECLAIM_RETRIES empty walks, the worker simply gives up,
>>> so it fails to write back anything.
>>>
>>> Therefore, when memory cgroup is disabled, fall through with the !memcg
>>> branch and shrink the root memcg directly.
>>>
>>> With memcg disabled, shrink_memcg() only returns -ENOENT when the root
>>> LRU is empty, which means the total pages are already below thr. The
>>> loop then safely bails out via the zswap_total_pages() <= thr check.
>>> For any other return value from shrink_memcg(), the loop is guaranteed
>>> to terminate, either after MAX_RECLAIM_RETRIES failures or once the
>>> threshold is met.
>>>
>>> Fixes: a65b0e7607cc ("zswap: make shrinking memcg-aware")
>>> Cc: stable@vger.kernel.org
>>> Suggested-by: Nhat Pham <nphamcs@gmail.com>
>>> Acked-by: Nhat Pham <nphamcs@gmail.com>
>>> Acked-by: Yosry Ahmed <yosry@kernel.org>
>>> Reported-by: Yosry Ahmed <yosry@kernel.org>
>>> Closes: https://lore.kernel.org/all/CAO9r8zPVzMKFbCixxD-qgtRrkFxWVrHiZZeLc=eyTPKPVQgX4g@mail.gmail.com
>>> Signed-off-by: Hao Jia <jiahao1@lixiang.com>
>>
>> Patch 2 doesn't really depend on this one, right?
>>
>> If that's the case I think this can (and should be) picked up
>> separately as a hotfix. Andrew, WDYT?
> 
> Please update the changelog to clearly describe the userspace-visible
> effects of the bug, thanks.

I am not entirely sure if my understanding is correct here, but maybe I 
should add something like this to the commit message?

When cgroup_disable=memory is used (or with CONFIG_MEMCG=n), the global 
shrinker fails to write back any pages. Consequently, the zswap pool 
fills up to its limit and rejects further storage, preventing memory 
pressure from being offloaded to the backing swap device.

> Also, AI review has flagged several possible issues, all appear to be
> serious:
> 	https://sashiko.dev/#/patchset/20260714081510.16895-1-jiahao.kernel@gmail.com

For AI review comments on this patch:
I suspect this scenario might only exist in theory. For zswap LRU to be 
empty while zswap_total_pages() > thr holds true, it would require a 
prolonged state where there are always more than thr zswap entries on 
the zswap LRU whenever zswap_total_pages() > thr is evaluated, yet the 
zswap LRU happens to be empty during shrink_memcg(root_memcg).

If we want to fix this, perhaps we could do something like this?

Yosry, Nhat, what are your thoughts on this?

diff --git a/mm/zswap.c b/mm/zswap.c
index b5a17ea20237..ca71b517a58d 100644
--- a/mm/zswap.c
+++ b/mm/zswap.c
@@ -1356,11 +1356,12 @@ static void shrink_worker(struct work_struct *w)
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
+                * Count a failure only if the last pass found no 
candidates.
+                */
+               if (!memcg && !mem_cgroup_disabled()) {
                         if (!attempts && ++failures == MAX_RECLAIM_RETRIES)
                                 break;

@@ -1378,8 +1379,15 @@ static void shrink_worker(struct work_struct *w)
                  * with pages in zswap. Skip this without incrementing 
attempts
                  * and failures.
                  */
-               if (ret == -ENOENT)
+               if (ret == -ENOENT) {
+                       /*
+                        * With memcg disabled the root LRU is the only 
target, so
+                        * we should abort if it has no 
writeback-candidate pages.
+                        */
+                       if (mem_cgroup_disabled())
+                               break;
                         continue;
+               }
                 ++attempts;

                 if (ret && ++failures == MAX_RECLAIM_RETRIES)


Thanks,
Hao
