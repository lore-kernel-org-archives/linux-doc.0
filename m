Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D80D1401C
	for <linux-doc@vger.kernel.org>; Sun, 18 Aug 2024 07:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723967113; cv=none; b=j61V6KoO6dFgl2b1Bxj2op3tVZZ640j5jGKS5IbdkVrwXCHdTiUUE1XvpgglQJDScbipi6hVFYM3jjoPIjtS7SHSwMyC/YREAzijdUJ4kzF0Er6pSdQKQBEO3Ja3G3eNh6nYUEErnHy27V+PlBBK3B4Qr+y6g5O2YmknKzUJZUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723967113; c=relaxed/simple;
	bh=c3fiNLHSBdBbTyplzf+0s6YFyunj4dx6pWBq6JAlRCU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UhAPuo2iFjV9RtwugAfEGRzEKthbbmKmkxrMuTqe29s7LE7CapmETCCwj8Bpyz4qPydfNxnD519ZkWDfOPHT9lfA38+QCL6ITxT16LDCS6KjpeY9jlcCXpAUIKmu6bW0GHD/r3LxI7n6Oi1ou64kDYx6TQqOoxWLA5XocD35v5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HtAdgAXJ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HtAdgAXJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723967110;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=SzorxLXBd/Ytxma1V3tu0XjarqJI5kPgafvlrn2zSA0=;
	b=HtAdgAXJMPfGi8e4P9WpB5VePoPt54Of2PKhPVO7SFSYSlVnHa7NP5y6u3zwTAwnwVFGjB
	hQ4FG5Sfm5pWFRBfS3MBJhpM7EKFjjQEIVIU5I2/cwRMYnYZlOO27Mv4hh2mYjZRr8pItF
	xxZggBCGQja5gTwvWhM+zK5BDVUNfP8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-610-Vjsg6h4KOQWOK-WavKZSNA-1; Sun, 18 Aug 2024 03:45:08 -0400
X-MC-Unique: Vjsg6h4KOQWOK-WavKZSNA-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-428ea5b1479so26254165e9.0
        for <linux-doc@vger.kernel.org>; Sun, 18 Aug 2024 00:45:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723967107; x=1724571907;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SzorxLXBd/Ytxma1V3tu0XjarqJI5kPgafvlrn2zSA0=;
        b=gK7A0ok02Ba1AbGkzjko+c+zldKFVh5PhTS0kdoNFOs1vpuSvWeOhA0VUkm28D+mzy
         8WULIqR9Y0O4jda3oTFO/CnEEeFDTfeeGwBox9xeRQgD3NLTL1Jtd6vbSAJOdjvGEUNw
         AJpo7p6a0Fj7zUXR1ljvUOLfuIeQn+mrslAYe67Cg9XKwKE4NyBhj9EHKybB7acApwd7
         pYH+yszolI/ZRsCea18rENcOluQKPmzV3YaAk7W9sszWo+JGCd225AUCWeS+ZHVj0CTh
         lcLE3UEidLBNbyIzb8ShJmd+RKMnTjzMEtzFo2tetVoaCjMfIfFFgQuZNUMpAl6l0psh
         u2NQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOFjXLTIPChNJgQH2Vh3/kiS4dCbKaDmGHqDSYRTIgQ5NuNQdY6Ij+dW3lK9UjydH5mAi2o/4r7ik=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzvhf3GKfK7o3LRWEk192sw6JFsK3SgxGNT/3XtWyiJXJld+oGM
	34oam2tb91yHNDgeZkCEzctYFMe0OvBLylSF7PwriOyZtcxeu8+hB6PnHg23WpEw8l/g1Zqjzsi
	qk/ST9XMVSeQ5ZUbW2xsmiM6taBaZhBwH20MLXbIp3jBFT4t/bo13x5EKyg==
X-Received: by 2002:a05:600c:1988:b0:426:616e:db8d with SMTP id 5b1f17b1804b1-429ed79e773mr42714895e9.15.1723967107216;
        Sun, 18 Aug 2024 00:45:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGrY8+JQyGxvkOKxpvWIxNp02HqOIOu5fKWloS9jkg3STmXwwlaQXRElVYtnnB3kLW4Qi0v9Q==
X-Received: by 2002:a05:600c:1988:b0:426:616e:db8d with SMTP id 5b1f17b1804b1-429ed79e773mr42714775e9.15.1723967106773;
        Sun, 18 Aug 2024 00:45:06 -0700 (PDT)
Received: from ?IPV6:2003:cb:c736:4900:1ef8:ea0b:23cb:a81e? (p200300cbc73649001ef8ea0b23cba81e.dip0.t-ipconnect.de. [2003:cb:c736:4900:1ef8:ea0b:23cb:a81e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ed79d9a7sm67792725e9.39.2024.08.18.00.45.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Aug 2024 00:45:06 -0700 (PDT)
Message-ID: <19b1c8e2-f60e-460d-8249-5db71a708dc9@redhat.com>
Date: Sun, 18 Aug 2024 09:45:04 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/6] mm: split underutilized THPs
To: Hugh Dickins <hughd@google.com>, Usama Arif <usamaarif642@gmail.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, hannes@cmpxchg.org,
 riel@surriel.com, shakeel.butt@linux.dev, roman.gushchin@linux.dev,
 yuzhao@google.com, baohua@kernel.org, ryan.roberts@arm.com, rppt@kernel.org,
 willy@infradead.org, ryncsn@gmail.com, ak@linux.intel.com,
 cerasuolodomenico@gmail.com, corbet@lwn.net, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, kernel-team@meta.com
References: <20240813120328.1275952-1-usamaarif642@gmail.com>
 <1e6f3b38-d309-e63f-bca0-5093e152f7d7@google.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <1e6f3b38-d309-e63f-bca0-5093e152f7d7@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Hugh,

> 2. I don't understand why there needs to be a new PG_partially_mapped
> flag, with all its attendant sets and tests and clears all over.  Why
> can't deferred_split_scan() detect that case for itself, using the
> criteria from __folio_remove_rmap()? I see folio->_nr_pages_mapped
> is commented "Do not use outside of rmap and debug code", and
> folio_nr_pages_mapped() is currently only used from mm/debug.c; but
> using the info already maintained is preferable to adding a PG_flag
> (and perhaps more efficient - skips splitting when _nr_pages_mapped
> already fell to 0 and folio will soon be freed).

No new users of _nr_pages_mapped if easily/cleanly avoidable, please.

I'm currently cleaning up the final patches that introduce a new kernel 
config where we will stop maintaining the page->_mapcount for large 
folios (and consequently have to stop maintaining folio->_nr_pages_mapped).

That's the main reasons for the comment -- at one point in my life I 
want to be done with that project ;) .

folio->_nr_pages_mapped will still exist and be maintained without the 
new kernel config enabled. But in the new one, once we'll detect a 
partial mapping we'll have to flag the folio -- for example as done in 
this series.

Having two ways of handling that, depending on the kernel config, will 
not make the code any better.

But I agree that we should look into minimizing the usage of any new 
such flag: I'd have thought we only have to set the flag once, once we 
detect a partial mapping ... still have to review that patch more 
thoroughly.

> 
> 3. Everything in /sys/kernel/mm/transparent_hugepage/ is about THPs,
> so please remove the "thp_" from "thp_low_util_shrinker" -
> "shrink_underused" perhaps.  And it needs a brief description in
> Documentation/admin-guide/mm/transhuge.rst.

agreed.

-- 
Cheers,

David / dhildenb

