Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC29721CFF6
	for <linux-doc@vger.kernel.org>; Tue, 22 Jul 2025 07:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753171157; cv=none; b=PCeSePVzJWNM7WnC7BhyWimkgNuaNP6uxz3UPpkEsnNGEVCX1BFWmeVJJHztJ5MKwnu0fufZBWGqRFniL9V5NpqPSCfpzC76o/RQqnnxOeZGVpYsqQSWrzxfC+mr0VLESm2MkL/L+cZdExDdw3xpTp1WI0mJ7AaCHSldOd5iX5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753171157; c=relaxed/simple;
	bh=NhyVBJq0RbBHsCj4Hv91n9yYCh//7jqyYCsyfdC4Rg4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=PmYL+EfuEm1ghYe325ISkuEkPrqwnpDLcx0b7CE1HSKg6bUxlA7wKPpIihfnrvruKN8ysBZV9b7zvrZ8FaEZG/diEfrllNA48HvsxexkgaSqlKtS9wrITbbSNk+vkMvdY52i9Sjr07HkxSHXkwnM0q1s4jZ/6qmufsHPgf+K0pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YrhmMCbr; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YrhmMCbr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753171154;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=c7tvfKGQUm4YoUJU1QbX5YUPQXMkfmqVEGF88600kKU=;
	b=YrhmMCbroMxuFAjQcoY4D7IQs/G3Loc1GgZCd0OPfsVTg9HdRZPQmh0+53o0X9vByqnIls
	jf1gmDioxqEaCwdWYcDdT+g6F3ORSMbAH3R4XrrDsdaZ5HATxN3jkc4JSmm/uPfKfFdTv7
	swHYRZtw/cVbp+7g4yCdHPXnEt8nEVE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-471-HpnUvu5jO_WQIcVZ7RfRTA-1; Tue, 22 Jul 2025 03:59:13 -0400
X-MC-Unique: HpnUvu5jO_WQIcVZ7RfRTA-1
X-Mimecast-MFC-AGG-ID: HpnUvu5jO_WQIcVZ7RfRTA_1753171152
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a54a8a0122so3001751f8f.2
        for <linux-doc@vger.kernel.org>; Tue, 22 Jul 2025 00:59:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753171152; x=1753775952;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=c7tvfKGQUm4YoUJU1QbX5YUPQXMkfmqVEGF88600kKU=;
        b=RpDm0D7JmJjXJe09mbxJblQcHYlzKlTBITJxuhyWnwYKbA80EhMBw6tXKMJMPGufiE
         4HE4GWMNOrTtdSXEcgYgM4zog60KJTbOV14We/R2onqlT4MGbvQW1PmJ+wNU09923j40
         DzhKa7urbumGyR/auLUIVwnll06+bDXq7J+0rjaOjzWz5VNZQ4BTqO4ni3gbjb/XSh9U
         sHgE+4v8Y+3umzjxy0OXKZkr/oaLmyt2lRDGxYX1Bwdh5KvB3MMbrjNGCTP2M3LhpcFC
         v25TMggTS2pFuUTpmDPtIZLJ5RfxOV7am9iDETTq+UxhUmH4qYblwc01WdK+OOKs2Kz3
         tKGg==
X-Forwarded-Encrypted: i=1; AJvYcCX/VD73vNH8MdWDMmmCKSJ/gyg/md7WVDWC2+LX+Lfx3OYuEtautbpk8UGSkmj0LyQuXu8vesGSPrc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbKtc4ojQmUZz+QzusmdtwsGO/oWyYpY8brP7+FyP2vxfUdVNM
	GQv2O6D7o0aXA0316z3TwHS3O1794wlipdCvp2vQ36rh65x74r5ZFK6XDHW0PDSjv86guQmVe9M
	s+f1rjG9Ii3oVeFFCe3aPOrmC3rJd8Lwr79oYHKCmW2N8AK5uxA1OpcpzKRqjoA==
X-Gm-Gg: ASbGnctee5VPlviVa0s+nikAzO7+GmNQSy2qzwHpcoRKMpf5q1TOGN+VbLuTpug8B1B
	O+iMtGhcP93PJa5Qpkz3wAie6VM/IaqvyhWNKhVpD1ZTQZIcq5VK1IU40QYcEK4pJ7KSArB/I+6
	CDj20w4EHpxhNLI5onvrxI9uDKaQ0DsMRhZVRe8n+ln7Fx0dmmBUDRldsPJOTJ04AOWF2DFpX6J
	PJ9fRjk8O1Xiz7rMiLURffeGW4fwa+9wRonDsbjf4oGqEma+jSY1k/qnFOnZv5OQUWWfSJ9vDP3
	kphvC09jd9URWDmyVEC/lU8qvEG3zHUX9ybTjVruDbyf9YMJMPJgEUHCsxIERMgw8vd08xDZQ0H
	wVs7YTxtS8RjsmyPJBlQpzaRooMEnXonWNu2DG8644gEqIkh9IZ2cFSeOI7nvUGwoIh0=
X-Received: by 2002:a05:6000:4716:b0:3b4:98f6:dd77 with SMTP id ffacd0b85a97d-3b61b217fd7mr12320350f8f.36.1753171151915;
        Tue, 22 Jul 2025 00:59:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2sf5QLlZEJr07ey/1yKpexqTHy8UV5PCpiUokLHs9olPrPrd1PKqO/suIPMqhDpL4yzTVfw==
X-Received: by 2002:a05:6000:4716:b0:3b4:98f6:dd77 with SMTP id ffacd0b85a97d-3b61b217fd7mr12320321f8f.36.1753171151431;
        Tue, 22 Jul 2025 00:59:11 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f28:de00:1efe:3ea4:63ba:1713? (p200300d82f28de001efe3ea463ba1713.dip0.t-ipconnect.de. [2003:d8:2f28:de00:1efe:3ea4:63ba:1713])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4562e803cb3sm181199025e9.14.2025.07.22.00.59.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jul 2025 00:59:11 -0700 (PDT)
Message-ID: <64b5b420-4c2a-423e-825b-b2c309274d71@redhat.com>
Date: Tue, 22 Jul 2025 09:59:09 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: update THP documentation to clarify sysfs "never"
 setting
From: David Hildenbrand <david@redhat.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>, Nico Pache
 <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250721155530.75944-1-lorenzo.stoakes@oracle.com>
 <39a75435-5fea-4816-b484-477d400c3564@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 g3eXuA==
Organization: Red Hat
In-Reply-To: <39a75435-5fea-4816-b484-477d400c3564@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22.07.25 09:20, David Hildenbrand wrote:
> On 21.07.25 17:55, Lorenzo Stoakes wrote:
>> Rather confusingly, setting all Transparent Huge Page sysfs settings to
>> "never" does not in fact result in THP being globally disabled.
>>
>> Rather, it results in khugepaged being disabled, but one can still obtain
>> THP pages using madvise(..., MADV_COLLAPSE).
>>
>> This is something that has remained poorly documented for some time, and it
>> is likely the received wisdom of most users of THP that never does, in
>> fact, mean never.
>>
>> It is therefore important to highlight, very clearly, that this is not the
>> ase.
>>
>> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>> ---
> 
> Can we also somehow tone down or clarify the "entirely disabled"?

Ah, missed that you touched that already.

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

