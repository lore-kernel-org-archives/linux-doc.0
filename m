Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3773619E7FA
	for <linux-doc@vger.kernel.org>; Thu, 31 Oct 2024 12:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730377936; cv=none; b=A4j9hY/BkEBOgd8rfO6WuAkKIZyct9OV7j+9axNAQwhjWUdHJ8qYHxbh3qWo8+JbhudWUZ3ub9SeOgFRsHnysHtJr0cRc4rG+YcoWTxxKlwEyG8uyt/tIDEEFULFiNmdfyoEyHRhFO1vFGCWGKj8lk/W4GIf6L2pL6H48k27fOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730377936; c=relaxed/simple;
	bh=FH5I3Wai2PmcuMB0QzacofP1XL4+KCIHsuePUvm+ZJI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZdM1eg3DkrH3kuZ2Qu5lktVkDoa5TsID6EWJLgDcbIW266/hO0E1sljRn5bRxt0MIOK+60hpJ7VcwKeCRLlwPOW4wnNVpfdPajngM1a3OvHJz7IjZuuITJZ+GZreItpMEfqaifHtjAmxHC33y1L2/OEudeE2VUY+eW1HUc/AldI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FazrPV9m; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FazrPV9m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730377933;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=uKrPAKxKq1Jx7vedNmeCC6agMwFMSyba5+2s6PfI3BE=;
	b=FazrPV9mIDDthsEUXgrUat5ZvJ0A1l5AHBL+sQXsmIus62eCF5mhDExtpxIjqLlqaEk0ql
	mqyeDXT7ulDP8BkTjNbhq51Z717sjHtilNDaLLLtyUowxrs+Tw8xK0h1sIRMasuavyT+No
	CE2eRr7cInk0aCpWrguDivJEkxAsGTU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-588-EBIGNKJ0NNmV2FCdDZNcHg-1; Thu, 31 Oct 2024 08:32:12 -0400
X-MC-Unique: EBIGNKJ0NNmV2FCdDZNcHg-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-37d49887a2cso499355f8f.0
        for <linux-doc@vger.kernel.org>; Thu, 31 Oct 2024 05:32:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730377931; x=1730982731;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uKrPAKxKq1Jx7vedNmeCC6agMwFMSyba5+2s6PfI3BE=;
        b=N2bDAmSlBpW77rRvIJr7Ncc6fPvyQ3ng4T7ujhXMFdO+HxS6w13mdr9E+2aZyKioVB
         ZratyvqTFWft6aREnoa9Xh0sPzwy0x0Y+NKluTyU7TyM1mnjW3NWy5S6+GaiNEOKT+Kj
         3fuZ4TvfwigiQUpERiijoRZaSWDpv37iCmKat0Lsl8ploK9nVudu6VlTh+5td2gCucKY
         YwI2h5bSQunx6eYrNWvecFHUMDiWawmjEYagv8NTGj18NlY6tw8NEX/JYGd9mB/eADux
         kR3xyCaAQORuRuu4LQJ0jfExymzfOKU/T8dcQ/uLfIwmOk0I0mSHMuuZ+N3L/FH41AEH
         MMVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVIvXYkMDplyGRQY4FATQ5eH4xXfz+GdP5y/9UDGCs1TJSPp2MICzX9HHkki3BaF6KClNe5j6dMyQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGTr7UhjYI1nIKswzHCg2jDoEtEonVpDRcifALyj56DfRVOePO
	5qE7a5qIKlmQJdXp44dkgvMKFBDVresuptMG1WJUMUSq1tCWBW/XEflyhH8TiLTJA28KUkKV6+y
	qYs/6CfFy9SX8DtLrRdsIqx35AcnRSPP2UM7uHLBuVLj7vYGCubNeHKw/BQ==
X-Received: by 2002:a5d:59a5:0:b0:37d:3b31:7a9d with SMTP id ffacd0b85a97d-381c14bb067mr1633444f8f.23.1730377930692;
        Thu, 31 Oct 2024 05:32:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEu82J0PIR+pp4nUH/6upDWBeLgmtjty7qYAPHYGLGOrQCvA2FcAzeK4yv20KNlMVeyZpEHrw==
X-Received: by 2002:a5d:59a5:0:b0:37d:3b31:7a9d with SMTP id ffacd0b85a97d-381c14bb067mr1633399f8f.23.1730377930212;
        Thu, 31 Oct 2024 05:32:10 -0700 (PDT)
Received: from ?IPV6:2003:cb:c70a:ed00:7ddf:1ea9:4f7a:91fe? (p200300cbc70aed007ddf1ea94f7a91fe.dip0.t-ipconnect.de. [2003:cb:c70a:ed00:7ddf:1ea9:4f7a:91fe])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c113e595sm1994177f8f.77.2024.10.31.05.32.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Oct 2024 05:32:09 -0700 (PDT)
Message-ID: <73d19983-b97c-49fc-be9e-89728626dbed@redhat.com>
Date: Thu, 31 Oct 2024 13:32:08 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] mm: shmem: control THP support through the kernel
 command line
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>,
 Hugh Dickins <hughd@google.com>, Barry Song <baohua@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, Lance Yang <ioworker0@gmail.com>
Cc: linux-mm@kvack.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel-dev@igalia.com
References: <20241030130308.1066299-1-mcanal@igalia.com>
 <20241030130308.1066299-3-mcanal@igalia.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20241030130308.1066299-3-mcanal@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 30.10.24 13:58, Maíra Canal wrote:
> Add a new kernel command line to control the hugepage allocation policy
> for the internal shmem mount, ``transparent_hugepage_shmem``. The
> parameter is similar to ``transparent_hugepage`` and has the following
> format:
> 
> transparent_hugepage_shmem=<policy>
> 
> where ``<policy>`` is one of the seven valid policies available for
> shmem.
> 
> By configuring the default hugepage allocation policy for the internal
> shmem mount, applications that use shmem, such as the DRM GEM objects,
> can take advantage of mTHP before it's been configured through sysfs.
> 
> Signed-off-by: Maíra Canal <mcanal@igalia.com>
> ---
>   .../admin-guide/kernel-parameters.txt         |  7 ++
>   Documentation/admin-guide/mm/transhuge.rst    |  6 ++
>   mm/shmem.c                                    | 72 +++++++++++++------
>   3 files changed, 62 insertions(+), 23 deletions(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 1666576acc0e..acabb04d0dd4 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -6926,6 +6926,13 @@
>   			See Documentation/admin-guide/mm/transhuge.rst
>   			for more details.
>   
> +	transparent_hugepage_shmem= [KNL]
> +			Format: [always|within_size|advise|never|deny|force]
> +			Can be used to control the hugepage allocation policy for
> +			the internal shmem mount.
> +			See Documentation/admin-guide/mm/transhuge.rst
> +			for more details.
> +

LGTM, and it's consistent with the parameter for anon.

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

