Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6959D568545
	for <linux-doc@vger.kernel.org>; Wed,  9 Sep 2026 13:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788960924; cv=none; b=HyCYWpBKGHa6o3Gm/zub2fUDcPVlA3yMbzrC5nAKgh5f98PuRi+vuYnaiqQNza3vvoKT7Lp14Afr1OO4nJjjWRassiFvUs40SdaXnvx05qn9iYCiF3/1v/kIQAMNL91O/xAj7njOUCb/bsPGHhw9t+qL7n2b6TNojY26FB0rfNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788960924; c=relaxed/simple;
	bh=kqq/tXQuLQQ93shFZ4hQ+WuqOevvJ+OrAuaJieLHuSk=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jU0K+blJ0fmXr352aIB1TASgAvntv8fB724EYIwlmirekYuXiFx8LR/HOXflmOQqFMGCjyKL2S6p4k0nvBj2RklwhMcaRF5CxxkbL2MUdZ9OmFZOktUsTt/xjn9ltxUi4T38qIdpVtIrWx24gLcu51cwYAtZn5MYwCqS+n8FHfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HG8a4yO7; arc=none smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HG8a4yO7"
Received: by mail-yx2-f12.google.com with SMTP id 00721157ae682-85d46e4cdccso10687867b3.1
        for <linux-doc@vger.kernel.org>; Wed, 09 Sep 2026 06:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788960921; x=1789565721; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wQbDye0Ug6lK7AwcUFZhsBEDnI1W9xjGfK//bEWCpeM=;
        b=HG8a4yO7rbILcA4TemtLSiBGskvgEAUd+ZUnL0i7PGkUG1BaDH68p6LfA6SpYyqYIe
         ZzgjWOw9Fkc6CA7bkOS3TgiWz/7ReyQPISMzTJUYhvdcJ1RNjDduOeirCJ/2yfAL5o22
         8KegJ92SArAm3CdpiEkL8/9Ps3nkbdn4PKwtku9jmBSvoVvUTAVDG1aVjDGI5iGDKXiS
         vXf2fY6oXyMMnHwrsrciBbllyEODltqec95aeD+aUvAcSKKIIV2YMrHXym5MHBW+W/4T
         4jpwcoUlp6s6hW8mqEUwg6smITMlXCL6bKFjXa81Dyq9A+yC87YdElZugZhoDYOaDVfA
         Y2mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788960921; x=1789565721;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wQbDye0Ug6lK7AwcUFZhsBEDnI1W9xjGfK//bEWCpeM=;
        b=rRwwtugZOv1rlBPCJ3ZIbXJDWZ0J9A/51JFT63f79fp/GmXKbxJH96+6BZSCoIvcNB
         DrqNHtACHs9OeOnQqd4jDU014Phx4V9VTNSFcdACC7Pz0DCQbhNHBchH/vkg9nPSUakJ
         VV05Mice6H1trGdBDMQSIVCbM+QV74Qu3uueQrrpynRQAnFQTzgltCK95hUXP+DqN3rR
         7nQ5Fs2b+PBb1Ecm7Sou2YPimivSSeYjqpYxHW+SLCQggEoJ4jsvrsRMC7at4T4wFtlW
         O2ouIePjo/Kndtr9cZXALOhWXeQQQhoB6dbjrMFkNnnq3DUI2qU6x4nsI3MuOLSCXfki
         +36Q==
X-Forwarded-Encrypted: i=1; AKwUvBx2UGyxqsd4+lMuZKoHrR+xE9395x8pt0dD8FcJkxuh/oa9kwJyoEfkugmhlbyK7hoXYjQ1KVw1D8Y=@vger.kernel.org
X-Gm-Message-State: AFuF++lKNHhMhoIP/TpgVvKYsIm6+SNkmAzSwflSGCt2ue0KbN7R6dc5
	kPgYYOT1iGn2aQztWQzmqODjue4CbECwlHyQO4mXYh1BHnM9jTEV1NVG
X-Gm-Gg: AYBFou3KKbc0N5V5/6Fa9yS9zW4bDQ2ALCle+YBWPV11iN9WVNBPvdYwuhni9IKNUys
	3XhemgBoqsTNkPV6N3BTbpJ+vrrYxvVyqQ4CiwPrfMBGyk+Oqr55G/7CgazBZgwbufPMF5ize4y
	RWWasuEwP4wCa4uOf3O3hQ9iVK9ugof45e+DzHGfxE5fUoXJMZ0kF2ryginhIwJvoZsNraZC2PB
	m/mJXJYXS4STG4qM5CkC+7HHG/cl3VbwmJm3rX9tQFvofd458FkNZ6BO9dpO4Iukgddblr1zBju
	c9r7l11mpuTdKG+yulErHIRPM+FmIDWlRHpLdAW3r+pCa9ZyZOhQC3A0uGqxoQCcy7uOBSl5ArM
	J2w4f+st9A+mSQwidpq3vC0E7RQSRrRkTiiozPfK9NkxhhGPDk2tR4aWXFOA/g51AlX5ucUW/nW
	w7HJi1VilW/U5nH6NLj6UhGqdRs8mu1hU9vOrrlQ+2oKua/O9Bu5UJNfWx2elv5Mv9KQ==
X-Received: by 2002:a05:690c:650c:b0:85b:35f6:bc5d with SMTP id 00721157ae682-87f23fe7a98mr29962947b3.13.1788960920937;
        Wed, 09 Sep 2026 06:35:20 -0700 (PDT)
Received: from localhost ([45.112.44.120])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8714c0e5c6fsm111191177b3.48.2026.09.09.06.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 06:35:20 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date: Wed, 9 Sep 2026 21:34:58 +0800
To: Randy Dunlap <rdunlap@infradead.org>
Cc: kexec@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>, 
	Sourabh Jain <sourabhjain@linux.ibm.com>, Baoquan He <baoquan.he@linux.dev>, 
	Dave Young <ruirui.yang@linux.dev>, Pratyush Yadav <pratyush@kernel.org>, 
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	Jinjie Ruan <ruanjinjie@huawei.com>, Mike Rapoport <rppt@kernel.org>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, "Rob Herring (Arm)" <robh@kernel.org>, 
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 9/9] Documentation: kdump: Add arm64 and ppc64le to
 encrypted dump target support list
Message-ID: <aqFgNFBdwoS2okjR@Rk>
References: <20260909003657.1570544-1-coiby.xu@gmail.com>
 <20260909003657.1570544-10-coiby.xu@gmail.com>
 <83b9fd96-d0dc-4ced-97cd-287c82cdacbe@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <83b9fd96-d0dc-4ced-97cd-287c82cdacbe@infradead.org>

On Tue, Sep 08, 2026 at 10:48:11PM -0700, Randy Dunlap wrote:
>
>
>On 9/8/26 5:36 PM, Coiby Xu wrote:
>> The encrypted dump target support is now extended to arm64 and ppc64le.
>>
>> Fixes: e3a84be1ec2f ("arm64,ppc64le/kdump: pass dm-crypt keys to kdump kernel")
>> Reported-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>> Reviewed-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>> Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
>> ---
>>  Documentation/admin-guide/kdump/kdump.rst | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/admin-guide/kdump/kdump.rst b/Documentation/admin-guide/kdump/kdump.rst
>> index 0bf2eb100a05..36ad6125c670 100644
>> --- a/Documentation/admin-guide/kdump/kdump.rst
>> +++ b/Documentation/admin-guide/kdump/kdump.rst
>> @@ -572,8 +572,8 @@ Write the dump file to encrypted disk volume
>>  ============================================
>>
>>  CONFIG_CRASH_DM_CRYPT can be enabled to support saving the dump file to an
>> -encrypted disk volume (only x86_64 supported for now). User space can interact
>> -with /sys/kernel/config/crash_dm_crypt_keys for setup,
>> +encrypted disk volume (only x86_64, arm64, ppc64le supported for now). User
>> +space can interact with /sys/kernel/config/crash_dm_crypt_keys for setup,
>
>                                                                  for setup.

I'll apply the suggestion, thanks!

[...]

-- 
Best regards,
Coiby
