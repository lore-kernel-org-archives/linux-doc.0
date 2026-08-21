Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4861322749
	for <linux-doc@vger.kernel.org>; Fri, 21 Aug 2026 14:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787321145; cv=none; b=kaT3BM8Iu1UdWToAQ2tVl+RRfP7naBPVda4yKIkvKfOdRM15XsU3gVQbxroPaxlJBJ1vfLQhoHozLnbUDZGrSJU0DZqvR6bFQQqrS2H59H86nB3KKRf0jtKkc3AOOWVPf66+WiMgSznVtTpjhSfhLwo9VQVvUNpGrEru8bvrgOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787321145; c=relaxed/simple;
	bh=jDrIyCe2jaCiIraTFxwU4uL7bpB+DZ42EwaByqhvMF4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kx/zhkgNR/f/5T7j8Yi4FHT9fszUDn3Ki2fCkH/YTvGA/amrm1bbVLBbF8UFqak+V2AvyiR4WD1Eyvjs4ASRUjoH1Gj5ITWMmn1MX7L+0v7uZAtqYgx+x7v6snQ7nm0oMNC+M1HNSJIAXPe6+aHSmxwj5f/YSMoBIFd0pLNClYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L/kNl2pa; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L/kNl2pa"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso11353735e9.1
        for <linux-doc@vger.kernel.org>; Fri, 21 Aug 2026 07:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787321142; x=1787925942; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sfvUUTP3o9O2j15EPReGLnJgVKtQAvfjBsA4ztGbKes=;
        b=L/kNl2pa6fXvkUUuaH9Zb7JE72s4U8rj94AzIOveIZX8BgcT491AbmofQmr7zsKqZd
         Ki1wrzpKagDN/sxRE/kD0IICGBXOPxoBE+mO+CE61haP+Vcp2fBJ1Gaw91d/STT1741T
         5UQfIjfYTojWkExncGVHzEqT5TM6xziduBZnOgvLpRdFQZbQ8LWou2qEzb2FZsxNVBAM
         MWtHDGhQi/AFpDilduEbXpFg+Upk9SiYOP+YNmbswB92e1N4i4pJmq+vqSu+hrrgoN7z
         5XO98aQZR3dom5/jyxn6eFCr+jUOB6lzyMyRRZ+b3W7eQmAYXsUZOWMPdFOC2j6GwACg
         rYeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787321142; x=1787925942;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sfvUUTP3o9O2j15EPReGLnJgVKtQAvfjBsA4ztGbKes=;
        b=AGorxM/3NvZ2jvZux2bg/Srzw/N+K97vjI0wAUREyhYeXmHp5MkU99cqG4F+n+/erk
         7AWUM3kN5A0vF+xgFlOExDDt7o4g30Kt6sxTxE32NItZ9vjxgPx/gjDA5/nbWn2ta9pF
         5P+It8K+rcinQa3kFOemIJPVmfkXU65UrSTITJm6eQ/LFA26+5v19FF6iNNuhbsGAc7h
         dbnGvHiSXqpQOWGud+wVyln4RmRmk1JE7nu8jrN/s+KOCeY8vJoUsCfZ6UpapS0dd+Ko
         fvZKwvLeYwocEvQC2LYB48q+W6Ok/wkARMBv0j5n9g1HXSGl5Kfb480LbGphQkjci2sL
         50ew==
X-Forwarded-Encrypted: i=1; AHgh+Rr3CuGWs5X0qGr7efcB04095OdwW/T7uezwoXDw2880oSi0+6hUtrIIjWpbL6VcAXtBPed1VlfDKxA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzc3MHy8lkI9huV3h9W7SEERv1uN70D2G0kGyMp+nvJoL6s/hyb
	8Uf6FxNQNzj5gkDM4u7Q9onuBPHv8BY7Z8ls7tdyklt5mQyuBJGDOMso
X-Gm-Gg: AR+sD111PsWtpnLwD/Ec5PSsh/xaKiGVjF65C6UflpNvJex8I9R5i4bMQff6KsJzx0u
	8zRNrqZrWpT/BacZTstvaFd/sRy0vNoD5i3kQXleXaCH97XpFf5clCaZtYhbLD4vTWYA63Rzusq
	i/rnFvN6RV9fBGOZ7deAnXlq0GLmgmYyvPJ22Ph69pjqaUSNffBKdkgGsPvFcorPaCJiGM5fd/N
	p3rsY04FoQlXWNXYsTLXeCobth1CyeoTRHAbTBdGxAdR7uqwcYV2Noc9U1sUX9yMAHknSC/8FJc
	eQ4+M+G/x2hxUzGYry308Fas7ZSqUNSGBP+JY2ot5qA2cqMnZB5ZNWjWPvhN0XuuhVWb1nonAtV
	i8cbUkhsyOxoy6Jzk/hyY17rUV38O+3MD/Dh/svxF9J9Da6ixnMscK1/AZMvL7wE+eY8BnafZ3Y
	KQRYL48+RVwE0M/MF3RKqUeynozqZNWdmLXXtru7QubSAGox003kMjkX34gEycsMPXXwjQ+aph/
	zxjnEn3yG1eGD8=
X-Received: by 2002:a05:600c:46d1:b0:492:4e09:9fc1 with SMTP id 5b1f17b1804b1-499b8469f20mr84781845e9.15.1787321141718;
        Fri, 21 Aug 2026 07:05:41 -0700 (PDT)
Received: from [10.45.28.226] ([15.248.3.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499b9049f84sm29305385e9.0.2026.08.21.07.05.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Aug 2026 07:05:41 -0700 (PDT)
Message-ID: <986b9e8f-f136-41af-9ded-8bece569c0c0@gmail.com>
Date: Fri, 21 Aug 2026 15:05:39 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/5] KVM: arm64: Add pre_fault_memory implementation
To: Alexandru Elisei <alexandru.elisei@arm.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: maz@kernel.org, oupton@kernel.org, pbonzini@redhat.com,
 joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com,
 yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org,
 shuah@kernel.org, corbet@lwn.net, vladimir.murzin@arm.com,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
 isaku.yamahata@intel.com, Jack Thomson <jackabt@amazon.com>
References: <20260612162354.73378-1-jackabt.amazon@gmail.com>
 <20260612162354.73378-3-jackabt.amazon@gmail.com> <alEXtW7w-rqlNG09@raptor>
 <yq5acxvz4u1i.fsf@kernel.org> <antH38FPSmAZ0nrB@raptor>
Content-Language: en-US
From: "Thomson, Jack" <jackabt.amazon@gmail.com>
In-Reply-To: <antH38FPSmAZ0nrB@raptor>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Aneesh and Alex

On 11/08/2026 5:03 pm, Alexandru Elisei wrote:
> On Mon, Aug 03, 2026 at 11:36:33AM +0530, Aneesh Kumar K.V wrote:
>> But both gmem_abort() and user_mem_abort() handle -EAGAIN internally, don't they?
> 
> I think you're right, please ignore my comment about an existing mapping with
> is_protected_kvm_enabled().


Thanks Aneesh, yeah that's the intent. Vincent pointed me to the
pgt->pkvm_mappings interval tree that can be used to detect the existing
mappings in pKVM, so I'll be updating to use that in v6.

-- 
Thanks,
Jack
