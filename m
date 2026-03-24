Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 174773A1E80
	for <linux-doc@vger.kernel.org>; Tue, 24 Mar 2026 03:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774323749; cv=none; b=k7GQK3OJ3dAarj4w2EAIYjpzJoJUBr7wg6hlICdHnzzC+Zb4VBldRgEi+U/wnJ6wRNeHyrg9ed7A1WCQ2IRdGyIFGte3vfBqQoLCXTeGczHH66gi9Iv54xc87ClUJJpqFGGys7GPPmAEbvhbW1zUgvlUl4PtlMHi3ocB+TWdkmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774323749; c=relaxed/simple;
	bh=8/USL8mWGPHghXDUqxrg0+CHaM95YmkwRKfFmCfxl80=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cxO0WJCnOG/7r8Nq4n7ReaXa0yGzSVsbhjANOBPL9JHoTEcmgjgrwFqLVwLqXEwK4KuWVJEdACDHwrHpHMfhtyg9XgZJIY7BJF7rMy/FPWIMWBJtmsODsWbDFVbLC2HXy7TPf5yUs6TA/79qv+/uNh+22w9CikH5jLPscMmXXFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MTkgETwY; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=f+to3Oei; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MTkgETwY";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="f+to3Oei"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774323740;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SrY75ExbEGwLC6e6b4hm5qIxC9Qaxczyg7KXVZhCcHs=;
	b=MTkgETwYf35iR6pjayay9OQ4CNbKF/HptQTPVz+OQPzlFHwdTMYFAgyveEmGpDYZfYrxbu
	QZvvqY+YaSlDU8zUttA8bIbmHQvRoHStJVhlLS+GOsFrnPf23JukYFu+0dmeR9cCNJA32+
	XLwC0hDOfT2GMAiIU0HbCI+53CmIpaQ=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-378-ewO5HkcAPyeWbNmMCQRz7A-1; Mon, 23 Mar 2026 23:42:17 -0400
X-MC-Unique: ewO5HkcAPyeWbNmMCQRz7A-1
X-Mimecast-MFC-AGG-ID: ewO5HkcAPyeWbNmMCQRz7A_1774323737
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c74217894d9so1965076a12.2
        for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2026 20:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774323736; x=1774928536; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SrY75ExbEGwLC6e6b4hm5qIxC9Qaxczyg7KXVZhCcHs=;
        b=f+to3OeiVUMqObs6kHFsUWOjNDBKzuYWJABXYYRrh7s9DkVbaWCv9sIZfIqCdjE2ot
         qFU9jJRjAl77rdcwvMrImFXL1uGvKAjw7tXA+pDlONGcy5S+8+PbHMFqtOIXCe1paiSL
         IRKztj0noXrAaKgA5iDG3u4dpxIzzqIVs9U6ZLw0zhpeAKUPLrz3RE2o2THJ9umOFoNm
         GFcPlxZ9FCuVDlKZ9rkxAGAY9s8yu57Apj57N2ecWu3OOjkpsNRZ2ComtaXh/vaDpr2y
         ZJIyFRcvjS3K2NL+KJ+yWM1Y0kDv6tm0jftJ2np8PL9MpJg/eJfXcnLFFgoWZ3/JjgEh
         1fYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774323736; x=1774928536;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SrY75ExbEGwLC6e6b4hm5qIxC9Qaxczyg7KXVZhCcHs=;
        b=EBSVca2CR7jOuVv5il1UVxSEwRmc5JW5qxbEvX7pK7QW1eUaInoflaBqRBUPGuHoIS
         FBl4tdtbaoLz/54zqOCkNlG8zpHmS7vvn5K85cF90JQydfoTjUfeuWOtQ7sehTr60y9r
         qmQSHLQ1elJIFRr38Rx3fr5oNUe17KtHrJN0lXfE1bzqQm07fQS10IjK9J2tm0HcfAM7
         ppOM6ZnwDfT9t1FW8uM86e2NfIio8bcDDyGxbcGpZfKMgXafVsi1bVsrT+pRUFzx9jnA
         oSH7IAtKTIZkaoZeHHrA8sq+fGqmnQFWiVD2aJYE2PVg+pBeLzyziPz5IZKotwM2bygS
         m7CA==
X-Forwarded-Encrypted: i=1; AJvYcCXPANjTigg8li7lGpAyxVaCneHZ7KE+3OjrLjUKpS0rjkKSUtk1ctL/OXXXgecvCxXgUrJgWy2DPd0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEPVcZZv2XVbiqP4gYiIW6qCEgqSi1shhDippSRigxUavYWzpm
	BVeoTAPIebtQbb5SrVnFpFMFezWGKGA51RBMDQBfqIY+RQXaKbsCflakgytbEVBR4aAiMZXCEd8
	IaYZ+hMvs9MXJsTNiGNjXKID4E2qNTeX45M6p/+lrkOb2NRfDZ5UZm23sdncLAQ==
X-Gm-Gg: ATEYQzzjK5K+Z2mJFjHrrFfJvd0aiBcttQMVabcUvhJlEDkA/UPF3HN8QUG3rvYrwFp
	n2s0RsFLmxA4ygWNDGySd767chk0aPO7sg+X5q7tUpgSMWEINV3g49JV7+CyMMgZxZWKzovFbhE
	K57n13c2avD6CSMLGCqkaJ1QABIO7rdNaOIDiVHjncQvkygFNhKXjSk2OefJWh8Xmx6LbWm1GOy
	dqCS66KtpNK6VjqtijMwcCTxtZKFWwD1/EPXJQizDlSjnxeH8FdsGD2avV/F7H6NnpaUbbCszFV
	VqSZPrZ+fO4VsyTG2/7gbmTECkaPFWg1P92D9ylsnu4T9UwgF50qnwE53yIrUexkeML259zvIsT
	Y83ZjiW464ow9chWriQzlMTtKA87Lk5L0Gk1iDj4ODcJ9oJ01t5eSwEcOT5VRFLeW
X-Received: by 2002:a05:6a00:9082:b0:822:682d:2c5f with SMTP id d2e1a72fcca58-82a8c351e8fmr11844801b3a.28.1774323736534;
        Mon, 23 Mar 2026 20:42:16 -0700 (PDT)
X-Received: by 2002:a05:6a00:9082:b0:822:682d:2c5f with SMTP id d2e1a72fcca58-82a8c351e8fmr11844744b3a.28.1774323736109;
        Mon, 23 Mar 2026 20:42:16 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b03bc1ddasm11266861b3a.19.2026.03.23.20.42.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 20:42:15 -0700 (PDT)
Message-ID: <2821b930-3cee-4358-bcfa-1374c5cb2055@redhat.com>
Date: Tue, 24 Mar 2026 13:42:01 +1000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 31/40] arm_mpam: resctrl: Update the rmid reallocation
 limit
To: Ben Horgan <ben.horgan@arm.com>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
 dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
 fenghuay@nvidia.com, james.morse@arm.com, jonathan.cameron@huawei.com,
 kobak@nvidia.com, lcherian@marvell.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 peternewman@google.com, punit.agrawal@oss.qualcomm.com,
 quic_jiles@quicinc.com, reinette.chatre@intel.com, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com,
 tan.shaopeng@fujitsu.com, xhao@linux.alibaba.com, catalin.marinas@arm.com,
 will@kernel.org, corbet@lwn.net, maz@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, suzuki.poulose@arm.com, kvmarm@lists.linux.dev,
 zengheng4@huawei.com, linux-doc@vger.kernel.org,
 Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
References: <20260313144617.3420416-1-ben.horgan@arm.com>
 <20260313144617.3420416-32-ben.horgan@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260313144617.3420416-32-ben.horgan@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/14/26 12:46 AM, Ben Horgan wrote:
> From: James Morse <james.morse@arm.com>
> 
> resctrl's limbo code needs to be told when the data left in a cache is
> small enough for the partid+pmg value to be re-allocated.
> 
> x86 uses the cache size divided by the number of rmid users the cache may
> have. Do the same, but for the smallest cache, and with the number of
> partid-and-pmg users.
> 
> Tested-by: Gavin Shan <gshan@redhat.com>
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Tested-by: Peter Newman <peternewman@google.com>
> Tested-by: Zeng Heng <zengheng4@huawei.com>
> Tested-by: Punit Agrawal <punit.agrawal@oss.qualcomm.com>
> Reviewed-by: Zeng Heng <zengheng4@huawei.com>
> Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
> Changes since v2:
> Move waiting for cache info into it's own patch
> 
> Changes since v3:
> Move check class is csu higher (just kept to document intent)
> continue -> break
> 
> to squash update rmid limits
> use raw_smp_processor_id()
> ---
>   drivers/resctrl/mpam_resctrl.c | 39 ++++++++++++++++++++++++++++++++++
>   1 file changed, 39 insertions(+)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

