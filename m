Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2DAD421223
	for <linux-doc@vger.kernel.org>; Fri, 24 Jul 2026 10:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784888462; cv=none; b=KtKNUBOyb8mSjReBIoNqX3D5BD0KEv7c3n25uRg/Cr8AIPczvV6qoTRZ3eMvnCauyEAyyVFFNBLeGmTjolP9T3qBvVNUfclKhSmB3N7T1cgmqr4Da3E3BxYXvAhQ9ZvHxd2qsq6EXjCBYxFseYwbxa/3NUCg17NwYnmbH1QnaDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784888462; c=relaxed/simple;
	bh=A1tjyn8+UTrbbvmvprs57qwDcN/f/0G+E1vNReNaUFc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DIeY5jnlmn5JmS3TFMiutq9+amcChdb0daki7PFyRpLAx5uzXrj4wWo3FYwwjQXvc3t9xeVYVZ0AiA1yWbSSZKUgM8Vl0orIlLF4iLIsoFUTAgKFxD1CBatkcutF4GUDKtrrjxLqxI14+vq6Ht5fe0G8BF64YwoWAN5QEjjT8qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sXksBIxQ; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sXksBIxQ"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ccf2360620so2491055ad.3
        for <linux-doc@vger.kernel.org>; Fri, 24 Jul 2026 03:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784888461; x=1785493261; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OHv4nBZUAA4QHT3/Nk9dUVsgZ03YSj5oD2kL/0soAWU=;
        b=sXksBIxQwaosZqAtvueCaqkvIckrU8lpTWKG7tmrerNG9BDKD9YFNlvOAaq+iYMIS0
         bcdaBY6LhU+t+cYtEncexxVGNbdE2YpT/czR7dx3gC2+rj29juQTT0doGEat+Wh4Gp6L
         B8xEwBCanvlwi4Wt3XibwDJul6t6RGjM4HvCiTYw/QcK1wAcWkcjzlkwTUhwc+wnoSLp
         icRqXxNLVnUty8qCCCNFW696fztYxOc3Kyu6xnUMdcP/xlvmQxdYBn3Qn3zVeoIHxbKN
         PFAjLv0fkUeOkCJ2SWHjA0zNtXrttolIA7uyf1hEP4Krb4JqgOb9t3tXG8e2nHL8TYRE
         ahZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784888461; x=1785493261;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OHv4nBZUAA4QHT3/Nk9dUVsgZ03YSj5oD2kL/0soAWU=;
        b=V53om+ZNJY+DJiyzmw9K8EArnoB7PEs4a7IWhMnXuP6PRHzHnruUQnvDSjZ+ZqovOd
         n3WV87OGP7CDKrhXsSYuoA0GthYfap3n921C0SrUJkQtKFwasPejbzT4kW/WnikeDbSy
         57cDJmCKhVIiXb0OaPINwAnnArDiEERZB6uQM/527DefJTRUXuP0rgQMio7176xqWqrh
         VBSvg7WU1Hxm4uqg/abJHI2Kxu4DcGSBR65SyDhXZxfhjqqifbHlJQKgql9cP9lGESGh
         TAU1N6Bb8tGTKrzlnaK2rP6P8RhtruH82nfxj1VH1p7vY995ww/Ehwh3Dez0WncPmyqx
         EjLA==
X-Forwarded-Encrypted: i=1; AHgh+RpYO3oDIvtqpdkJsLojb1avvBotPXIrQ7t4eBEl84wHgYpBfORaOTRVAvIm/lQT3KByyPQkw21tjso=@vger.kernel.org
X-Gm-Message-State: AOJu0YxaCN8zv/o9nozx62TsBeszYhlrdtEm2SO4xoQtOMWB0wgyELil
	Vu41qiJlcESRambvxJj0KR1AKn/6Zw7iX5iKvKO0waYY/ah5/PzE1s1T
X-Gm-Gg: AR+sD12OUWblqs/jZczaseS10q8SkARH3glOuvyn6E/1I1WgtZ0RGLGZx0yrpSn/4dC
	tfxDyytLVrRLzQhO00HfPLFyrvq63hlaQzkSpL2H0cbF5BvPKSYLcaxzqi0KcIpopMuvb+hLCr6
	0AKwsaShQXprT9MZ6nnCUc5axJUDsCQCP32Y/bvttfatQL1L/CY2jjX3+ytrD+OSiaxAJRyiAR4
	v4QsPI48WIAenRxv/9BbdO1V6S84PP2fhtLzogs+ISDklWBaUdafJogCwYVKUNg7Pco5WGgzRQW
	UJSSNdPrrwTf7xdgumwZ1r7d54lJkRVnELWo1OVAs9edwoVLy3kAWF3KjVO7WFubQQrFbR2amVw
	sII89xN17Eg4DDtWOEOlAwob8AFko/WjgKdB+CIDxYPwFrqui59vbD35mikMzSO3Nk0ki/jLWo5
	nYt5lwQ08/RKQde+YFEgpr2w==
X-Received: by 2002:a17:903:2f88:b0:2cf:bf32:b754 with SMTP id d9443c01a7336-2cfbf32bf7amr33103845ad.8.1784888460802;
        Fri, 24 Jul 2026 03:21:00 -0700 (PDT)
Received: from [10.125.192.96] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8efa2cd0sm48812475ad.4.2026.07.24.03.20.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 03:21:00 -0700 (PDT)
Message-ID: <d8de419d-0077-c47c-a5f1-37c229a853ed@gmail.com>
Date: Fri, 24 Jul 2026 18:20:50 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: [PATCH v2 2/2] mm/zswap: Support batch writeback in
 shrink_memcg()
To: Yosry Ahmed <yosry@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>
Cc: akpm@linux-foundation.org, tj@kernel.org, shakeel.butt@linux.dev,
 mhocko@kernel.org, mkoutny@suse.com, nphamcs@gmail.com,
 chengming.zhou@linux.dev, muchun.song@linux.dev, roman.gushchin@linux.dev,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Hao Jia <jiahao1@lixiang.com>
References: <20260717085151.22822-1-jiahao.kernel@gmail.com>
 <20260717085151.22822-3-jiahao.kernel@gmail.com>
 <amF7_GB5Rl6OJmt4@cmpxchg.org>
 <CAO9r8zPaUPddYoLz8o+g+xkb-zdkfyB+LqaDOrkzqFSePEV-xA@mail.gmail.com>
 <amIdU1lFxqxTI3Gc@cmpxchg.org>
 <CAO9r8zPepaekOgaDaVBWyB_F05Ezvz+AJZ8M5+NGQ4BmiJNBkQ@mail.gmail.com>
From: Hao Jia <jiahao.kernel@gmail.com>
In-Reply-To: <CAO9r8zPepaekOgaDaVBWyB_F05Ezvz+AJZ8M5+NGQ4BmiJNBkQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2026/7/24 00:39, Yosry Ahmed wrote:
> On Thu, Jul 23, 2026 at 6:55 AM Johannes Weiner <hannes@cmpxchg.org> wrote:
>>
>> On Wed, Jul 22, 2026 at 09:52:18PM -0700, Yosry Ahmed wrote:
>>> On Wed, Jul 22, 2026 at 7:27 PM Johannes Weiner <hannes@cmpxchg.org> wrote:
>>>>
>>>> On Fri, Jul 17, 2026 at 04:51:51PM +0800, Hao Jia wrote:
>>>>> @@ -1369,7 +1402,7 @@ static void shrink_worker(struct work_struct *w)
>>>>>                        goto resched;
>>>>>                }
>>>>>
>>>>> -             ret = shrink_memcg(memcg);
>>>>> +             ret = shrink_memcg(memcg, NR_ZSWAP_WB_BATCH);
>>>>>                /* drop the extra reference */
>>>>>                mem_cgroup_put(memcg);
>>>>>
>>>>> @@ -1493,7 +1526,7 @@ bool zswap_store(struct folio *folio)
>>>>>        objcg = get_obj_cgroup_from_folio(folio);
>>>>>        if (objcg && !obj_cgroup_may_zswap(objcg)) {
>>>>>                memcg = get_mem_cgroup_from_objcg(objcg);
>>>>> -             if (shrink_memcg(memcg)) {
>>>>> +             if (shrink_memcg(memcg, 1)) {
>>>>
>>>> Why 64 for the global limit but only 1 for the cgroup limit? That
>>>> seems arbitrary in multiple ways.
>>>
>>> I suggested that we keep the writeback here without batching and do
>>> that change separately, mainly out of abundance of caution as
>>> writeback is done synchronously here so the extra latency could be
>>> problematic. I think we probably want to measure the performance
>>> impact of that separately.
>>>
>>> That being said, this path is potentially too expensive anyway due to
>>> the flush, but I would rather we do some basic measurements before
>>> batching here.
>>>
>>> What do you think?
>>
>> It's not an unknown, right? We know this works for direct reclaimers,
>> cgroup limit reclaim e.g., and what the latency implications are.
>>
>> Because of how reclaim works, we also know it'll call zswap_store() in
>> batches of SWAP_CLUSTER_MAX. If we don't batch here, they're likely to
>> each call shrink_memcg() once we're at the limit - while still risking
>> rejections due to compressibility differences.
>>
>> My worry is that if we start with an inconsistency, we'll be stuck
>> with it for a long time.
>>
>> I'd rather start with the clean, consistent version. Dial it back only
>> if we have data to justfiy the complication that we can put into a
>> comment and the changelog that outlines why exactly it's different.
> 
> I am fine with doing that and basically always using NR_ZSWAP_WB_BATCH
> as the batch size in shrink_memcg(), but I would be more comfortable
> if we did some sanity testing.
> 
> Hao, would you be able to do some smoke testing with NR_ZSWAP_WB_BATCH
> used for all paths, and memory.zswap.max set in a way that induces
> writeback? You can probably set memory.zswap.max to 1% of total memory
> instead of the global pool limit and rerun the same test.

Building on Test Case 2, I set zswap.max=320M (~1% of total system 
memory) and updated both invocation paths of shrink_memcg() to process 
batches of 32 or 64. The resulting benchmark data is shown below.
(Note: Test Case 2 also sets max_pool_percent=1.)

                       baseline-cgroup   batch-all-32-cgroup 
batch-all-64-cgroup
shrink_worker wakeups        7,238             766               367
shrink_memcg calls      12,059,142       1,961,194           983,878
written_back                28,277         301,157           327,997
zswap_store calls         1,349,572       1,168,190         1,114,549
   store succeeded            492,861         521,315           459,246
   store rejected             856,712         646,875           655,303
   store reject rate            ~63%           ~55%              ~58%
pool_limit_hit              510,130          50,096            57,715
pswpout                     884,989         948,032           983,300
pswpin                    1,251,268       1,638,668         1,878,453

Thanks,
Hao
