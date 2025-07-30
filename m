Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA23C266B66
	for <linux-doc@vger.kernel.org>; Wed, 30 Jul 2025 11:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753875586; cv=none; b=GvKqQxur/CeeSG2XCP7pbhHCZLnE1YG1iirhcE6a9+k9dO+ViAcqaLlcZ7ROo0Ntth3GggxKkMM54NEFY0SSzA2UA7cG2HYUgOx8K9LRITLVsZ0tL140dz/MTdpHCfuI0KVqnMnTs9X4+KrCa7mMRPtP97y/C0P/FExcU2MMm18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753875586; c=relaxed/simple;
	bh=HweBPrxgj3m+91urC2NffNsscYCrWCm59D2DpEhbYZA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rfuTVW6XeOZ07+61blYT0e3kcafpgsvtPhcG9/n2qACLq6dTv30P+Y93fRJjHmWqmqtcvZ1rnE5Poef5fUHMy2XY5BLmYUxCVtIN5AKZKsbkot8YJpNk6k7/iJLrcMdn3r922j60Ay0A4pz5VvILNzQKPEhrc8rkVeIgy5Vv3cY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SXmuzX+x; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SXmuzX+x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753875584;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=DgmT/4MxmdvSfKxUoKQscuXLpLll1+wxv5DeTi8iqhY=;
	b=SXmuzX+xEbp/9bnrJCfasobHnXjQ6cOpPVfd3Xi1f/WwPEcImUcrEyrubzubjPwpKF1HlZ
	w7jIr/OScUUt7Cwvzhgu+BpXh5fU+69l31gsxvmt0JUor6quf7m+J35uJ7JWpmsyXPXnCY
	8e11CGaEoN0qGZKVde8dL58iDAUkrz8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-329-t9OJIJ-GNICVpyxVAJKOjg-1; Wed, 30 Jul 2025 07:39:42 -0400
X-MC-Unique: t9OJIJ-GNICVpyxVAJKOjg-1
X-Mimecast-MFC-AGG-ID: t9OJIJ-GNICVpyxVAJKOjg_1753875581
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4561c67daebso3393135e9.1
        for <linux-doc@vger.kernel.org>; Wed, 30 Jul 2025 04:39:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753875581; x=1754480381;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DgmT/4MxmdvSfKxUoKQscuXLpLll1+wxv5DeTi8iqhY=;
        b=ckPfXaUVO4IDV5N0oXuEA0iSkVhkOCzIahTV3AgI3YJHRFC5mT7NfL7UsioOmrloM9
         +TsZXCRV29YAU7xOwg6tqM4OkRSu+hKKE8LNdZ3jJtMzauvJvWyggMtMNvPIw7duqPO+
         /SF6nxbBM7cahPeJZWQQHO+v+gRil1DL8ZYW13f+6MmsfC9rgrRDDUrvLrMjDb78OjZ0
         4sbyURV7hCWkV+eWOLMwMowXKnjaUxs/HIbtXeOrV2KPwF2lq8KWRrDMNECYrakh1m7F
         +tis3o8fvPdX66ddjGMEwJbR6zVYSlo1ZTELbjAnRSrH902ieytzkGhTiXCWFphPFyyI
         goEQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/uwtwdrpLq4ln8imwETDiKCTcjb6aOmoe9EMI224CK//HDVpfW4C6doVHM51um0e5YxEUiMWhwgk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJOPdLl4UiC9d2YOjNJm98U4jiOi6Jo+OTZu35IrgwyAGpLJxw
	do3Q+G8pq72K6aMIGVYQDvDYR9YboNLqqtCEKMW5fajU6bj0PQS70i00187BiCBHQWAEDjTxa1E
	yoWuC1KUkO1e3lnNxN1wrNyg+KL6fs9sp5aFWbNEBjpnAE8FsrKiKiOXeeoSPyA==
X-Gm-Gg: ASbGncvyYlcyjONgSSDXXFGalf5LCsuux6+OZoo/l1hZpmAc/sKTz0N9wJzyFC90/8u
	SNoLiONo0Im0VqnBqsHuugTQcT7r2h4Oimq0aNmIFTYcQlp6Xzcd7C5NUWhwlin0HAynmAybAu/
	lHgOqdhyeI55bDKRuVw83hmt7nFO2owOiEG91eh26X0jz7Agi5GB8YBgyDTDtjMF6/1M9FhzUZG
	h5EcKX7fAwmN/vsxifxCVgId7yW9gjK0mti+J8SGyaV4qH1QWusgBbeW2bQJeA2COxGHzOfX+9/
	mUcmwchSxonP+9BPok/no7fbta+1T6VUsdq3azvIvdVk/zNbjxSowJaV2j/RQw==
X-Received: by 2002:a05:600c:8b52:b0:450:c9e3:91fe with SMTP id 5b1f17b1804b1-4589303fe49mr26931985e9.0.1753875581211;
        Wed, 30 Jul 2025 04:39:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGFDob6ua++AEhRi3Gfd/2+HGGi2uT+wVMMUC/mjnay5/mOVTl3fCjXOJlvvVcYCQBEH1aDGg==
X-Received: by 2002:a05:600c:8b52:b0:450:c9e3:91fe with SMTP id 5b1f17b1804b1-4589303fe49mr26931565e9.0.1753875580676;
        Wed, 30 Jul 2025 04:39:40 -0700 (PDT)
Received: from [10.32.64.156] (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4589539e491sm24168925e9.26.2025.07.30.04.39.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Jul 2025 04:39:40 -0700 (PDT)
Message-ID: <aed4c988-7389-44b6-bbdd-eca64304ee10@redhat.com>
Date: Wed, 30 Jul 2025 13:39:38 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] selftests: prctl: introduce tests for disabling THPs
 completely
To: Usama Arif <usamaarif642@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 ryan.roberts@arm.com
Cc: linux-fsdevel@vger.kernel.org, corbet@lwn.net, rppt@kernel.org,
 surenb@google.com, mhocko@suse.com, hannes@cmpxchg.org, baohua@kernel.org,
 shakeel.butt@linux.dev, riel@surriel.com, ziy@nvidia.com,
 laoar.shao@gmail.com, dev.jain@arm.com, baolin.wang@linux.alibaba.com,
 npache@redhat.com, lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com,
 vbabka@suse.cz, jannh@google.com, Arnd Bergmann <arnd@arndb.de>,
 sj@kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 kernel-team@meta.com
References: <20250725162258.1043176-1-usamaarif642@gmail.com>
 <20250725162258.1043176-5-usamaarif642@gmail.com>
 <b9c72ab9-9687-4953-adfe-0a588a6dd0f7@redhat.com>
 <4dc95e54-e0ef-4919-973a-748845897ef9@gmail.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 g3eXuA==
Organization: Red Hat
In-Reply-To: <4dc95e54-e0ef-4919-973a-748845897ef9@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 30.07.25 00:13, Usama Arif wrote:
>>> +
>>> +    self->pmdsize = read_pmd_pagesize();
>>> +    if (!self->pmdsize)
>>> +        SKIP(return, "Unable to read PMD size\n");
>>> +
>>> +    thp_read_settings(&self->settings);
>>> +    self->settings.thp_enabled = THP_MADVISE;
>>> +    self->settings.hugepages[sz2ord(self->pmdsize, getpagesize())].enabled = THP_INHERIT;
>>> +    thp_save_settings();
>>> +    thp_push_settings(&self->settings);
>>
>> push without pop, should that be alarming? :)
>>
>> Can we just use thp_write_settings()? (not sure why that push/pop is required ... is it?)
>>
> 
> Thanks for the reviews!
> Ack on the previous comments, I have fixed them and will include in next revision.
> Yes, I think we can replace thp_push_settings with thp_write_settings.
> 
> For this, I actually just copied what cow.c and uffd-wp-mremap.c are doing :)

Right, I see push vs. pop in run_anon_test_case(), but push vs. restore 
from main(). At least cow.c applies a configuration on top of another 
one, so it needs the push+pop semantics.

In your case, we really only perform a single configuration. So 
write+restore should be good enough I guess.

> 
> You can see in these 2 files that we do [1]
> - thp_read_settings / thp_save_settings
> - thp_push_settings
> 
> Than we run the experiment
> 
> and at the end we do [2]
> - thp_restore_settings
> 
> i.e. there is no pop.
> 
> I think we can change the thp_push_settings to thp_write_settings in [3] and [4] as well?

I think we have to push there, so the following push+pop will do the 
right thing (I think that was the whole idea of push+pop).

An alternative would have been to just have write+restore, whereby write 
always returns the old state you save in a local variable.

I wonder if a final pop could be used instead of the restore somehow.

Anyhow, probably best to leave the other test cases alone for now, 
unless you want to clean it up properly :)

[...]

>>> +}
>>> +
>>> +FIXTURE_TEARDOWN(prctl_thp_disable_completely)
>>> +{> +    thp_restore_settings();
>>> +}
>>> +
>>> +/* prctl_thp_disable_except_madvise fixture sets system THP setting to madvise */
>>> +static void prctl_thp_disable_completely(struct __test_metadata *const _metadata,
>>> +                     size_t pmdsize)
>>> +{
>>> +    int res = 0;
>>> +
>>> +    res = prctl(PR_GET_THP_DISABLE, NULL, NULL, NULL, NULL);
>>> +    ASSERT_EQ(res, 1);
>>> +
>>> +    /* global = madvise, process = never, we shouldn't get HPs even with madvise */
>>
>> s/HPs/THPs/
>>
>>> +    res = test_mmap_thp(NONE, pmdsize);
>>> +    ASSERT_EQ(res, 0);
>>> +
>>> +    res = test_mmap_thp(HUGE, pmdsize);
>>> +    ASSERT_EQ(res, 0);
>>> +
>>> +    res = test_mmap_thp(COLLAPSE, pmdsize);
>>> +    ASSERT_EQ(res, 0);
>>> +
>>> +    /* Reset to system policy */
>>> +    res =  prctl(PR_SET_THP_DISABLE, 0, NULL, NULL, NULL);
>>> +    ASSERT_EQ(res, 0);
>>> +
>>> +    /* global = madvise */
>>> +    res = test_mmap_thp(NONE, pmdsize);
>>> +    ASSERT_EQ(res, 0);
>>> +
>>> +    res = test_mmap_thp(HUGE, pmdsize);
>>> +    ASSERT_EQ(res, 1);
>>> +
>>> +    res = test_mmap_thp(COLLAPSE, pmdsize);
>>> +    ASSERT_EQ(res, 1);
>>
>>
>> Makes me wonder: should we test for global=always and global=always?
> 
> Do you mean global=madvise and global=always?>

Yeah, rewrote it 3 times and then messed it up.

>> (or simply for all possible values, including global=never if easily possible?)
>>
>> At least testing with global=always should exercise more possible paths
>> than global=always (esp., test_mmap_thp(NONE, pmdsize) which would
>> never apply in madvise mode).
>>
> 
> lol I think over here as well you meant madvise in the 2nd instance.

Yeah :)

> 
> I was just looking at other selftests and I saw FIXTURE_VARIANT_ADD, I think we can
> use that to do it without replicating too much code. Let me see if I
> can use that and do it for never, madvise and always. If it doesnt help
> there might be some code replication, but that should be ok.

Yeah, some easy way without replicating would be very nice.

-- 
Cheers,

David / dhildenb

