Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CFD01A08A3
	for <linux-doc@vger.kernel.org>; Fri, 12 Sep 2025 22:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757715914; cv=none; b=MQQsPAFDrM+d0MMFjS51LEZbN20HGHgZOb29EK+ZudtM5lmz62s9rujMHeBZoeQahbRxdEeYm+1Dv9nn+/VF0e3kiqpLSEDRwZOCsG7EjZFdZy1v7rV+EjUnrFrIIH6BYL7HXyoG4qVaL8LXTdETUQopEDvcxsqTwdIFFAxgIiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757715914; c=relaxed/simple;
	bh=iTr7M893E4gTqL49aZVHGGZS32qlPZ3IW8d9Y0OSJ2k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ceDWafwolv6coFFIwaKODZkK9tN2qCk0H+mu+5eRQLdffAI/dhKX+uudcjojKInSf3RoPov/uwlvLt4jrHi6l2pG7qH7aVVfY508rS/s6WnugrPrMR8/JXLfLD8Ohjk9rhErwWEzY+wvDnAN/oFnJPvbBe3i2LrGbPPA4gTPdSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iwyCdPw2; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iwyCdPw2"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-76e4f2e4c40so2203361b3a.2
        for <linux-doc@vger.kernel.org>; Fri, 12 Sep 2025 15:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757715913; x=1758320713; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2KLKlGBJI1d0fx9t2uSJ4mzy0rd5NfzB4VUuG4EkoD8=;
        b=iwyCdPw2AR0kWzu9CltuNd4ZRhbIMADpxB2LlNzCMaXf+i85MtPzztjUB0Yz6PA9Re
         7UsEiAC/AdanZ3JNj90V0KMFJCeqI6y8txmzPlKhG2AA9NhCiydKp2TPiWNcfCSckWLH
         XYjGYN9j4Lv2zMmxNHP/lhV6JQ/nXAly+IEGXSq9LjQr5NWLyXaDvrg8uxtTuN/6rTtJ
         oq/UJvqGHqx2XrXqmRs6J0y5UxTNDANBzQIvDNCdqrLmt/H5WtQwqI99g+YQ0h++9tuX
         nNbK1sxBiOK8q4ZaqMbEMsJ0yu7RB6a47mC3cSOzZPyItMjSoAmzzDRfmxUEYrOvUcNK
         dzvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757715913; x=1758320713;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2KLKlGBJI1d0fx9t2uSJ4mzy0rd5NfzB4VUuG4EkoD8=;
        b=oT1fEB+AgJcZQvL9cqEpL94QRZ8EP5yTmzIFpDmysn13ijXnDYfvu5RS5/ZfJAiYA2
         p4Nu064ibPZcvvnX9+t596FM/W85pZ0hv0z3W3NGzqVWpQ+AwvYLEU6zywDDThnScWMM
         TwYoc63XK5XyheWqueCIFws23duWWJ/yjuX9rdGDkZ4LgnEcp9x7O0tJ9tIJBJyvxJjq
         ilkoLy9flIytO5IjpSgV+iUbObeO7o1htGQ7fJxF4NVW4zqogJUVfMrZ78VB6/w9r/q8
         QxRmV+hexSgtKJMpM+8O8Rz+KStbo8TRaMrs1N8ujeSHZmclWkYLd69DLBfIRiGB9x0q
         voXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTKlJlhHCg/bWHqSqv8UTThUVk7PZ43Ru4curELMDhMRExgph6PmpIaZsUujZcUCwAO+ru7dwJBqU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+nL3eW8cCKiDXHFC7wRbKbNIn5NgeXaztBQUQXmjoOTxPlWxY
	Ste5j2zxgiEh7lxYJeI38cr0Vn6fvgQK2wPydUMBEQAXFa0q4l4ueM/2
X-Gm-Gg: ASbGncsYOcug0MrSSRnLN9cx0jQXnb8JALpEQWTfXoMVBgy9Uf+s/5bZogG2AdiIgUa
	+0JVzLvnbP6TL7BoEZyCkEwoGdBRHPEXYXFspTjV1RwXflpEjfgBbqR6lmkg8xZ7kETMjATMxaA
	xVohajMpQlvOZ4/w9538Sppq1VZOsffFRwBRqmRjHwY1yXcY3TL5VnRaoa3szL4tYhoPCW59Y3O
	jWKE1QWjM1x0w6E/5ZkFeXbc5EkZK5EyMhQfILuHprTABLlXsTsAnQFqXZ4Hq+Koy6RNi6TBrxj
	u4mXYdgU+ppWBqzd7lniv6V72HfDJEl+OUvsEJNJQGFMyEadcMNmJTMmi6F7i3IsjuuI5OD8+ej
	1X3rwz9BkCkzZRdEwzx3qcSEQhCMtSbK+OCR8JkGxSyD7
X-Google-Smtp-Source: AGHT+IHurQvXunsL/HJ9vmn0CKdkJYzOpZYBsq2mAMEb4zKVK5+W5oEbdRBLo7URkB3G7O+IBF1fVw==
X-Received: by 2002:a17:903:2410:b0:24c:9a51:9a33 with SMTP id d9443c01a7336-25d24e9df3dmr43777705ad.22.1757715912450;
        Fri, 12 Sep 2025 15:25:12 -0700 (PDT)
Received: from [192.168.0.150] ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25c3a84a5c0sm58194845ad.71.2025.09.12.15.25.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 15:25:11 -0700 (PDT)
Message-ID: <0680f2fa-e583-4b7d-a1ff-9fcd4c5a8269@gmail.com>
Date: Sat, 13 Sep 2025 05:25:06 +0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "drm: Add directive to format code in comment"
To: Danilo Krummrich <dakr@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Alice Ryhl <aliceryhl@google.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Javier Garcia <rampxxxx@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>
References: <20250912130649.27623-2-bagasdotme@gmail.com>
 <e0252635-4dc4-483a-911a-fee5a36c19c3@kernel.org>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <e0252635-4dc4-483a-911a-fee5a36c19c3@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/13/25 04:27, Danilo Krummrich wrote:
> On 9/12/25 3:06 PM, Bagas Sanjaya wrote:
>> Commit 6cc44e9618f03f ("drm: Add directive to format code in comment")
>> fixes original Sphinx indentation warning as introduced in
>> 471920ce25d50b ("drm/gpuvm: Add locking helpers"), by means of using
>> code-block:: directive. It semantically conflicts with earlier
>> bb324f85f72284 ("drm/gpuvm: Wrap drm_gpuvm_sm_map_exec_lock() expected
>> usage in literal code block") that did the same using double colon
>> syntax instead. These duplicated literal code block directives causes
>> the original warnings not being fixed.
>>
>> Revert 6cc44e9618f03f to keep things rolling without these warnings.
>>
>> Fixes: 6cc44e9618f0 ("drm: Add directive to format code in comment")
>> Fixes: 471920ce25d5 ("drm/gpuvm: Add locking helpers")
>> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
> 
> Need me to pick this one up? Otherwise,
> 

Of course!

-- 
An old man doll... just what I always wanted! - Clara
