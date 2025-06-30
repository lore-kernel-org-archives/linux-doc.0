Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5C71E5702
	for <linux-doc@vger.kernel.org>; Mon, 30 Jun 2025 08:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751271449; cv=none; b=RbuqYZpBb5VIgOpqSo6/Sru34kLIMv9sri0EFNUbQqlmfjYBhs6rGzl8ADF1a9oUIy473QjqPJ2QagO2kjZuxEJ9usHZw9jb7w0EaDuA8F7SkA6JFL0q5k4PPPwur05xn30TGET3Ey0Y64QLMPz42/4qQ/n4bm1URXZsxllbcOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751271449; c=relaxed/simple;
	bh=pCbtAIF8mV/Ezywdkqcl5KxpSI9BjxlJOdBAfdTn3W4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LFZ3cImWjE9pTRiMj3MB5m9VjTd+Lp6wv1S+CiPM6QWSs4F7uKURsUq/AO34fXMopaPG+7R6U66YLhCvTmmb190oiVfjuHqV5tLduEmbKLAZcXjJrfVIllY2573udnyESmbO+VicCSZ+h+NB/rsTmiCOAngyDPaUM7/iXioiERA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=i3aVXEP5; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="i3aVXEP5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751271447;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=/Q0wJ1GS1ufKX7uDtmDekOeD4yRmrJFnUlmIqwcewAw=;
	b=i3aVXEP5nMFnoAfTKBiMj/v0NGvqAzEcEBYTmIsGRZKRek9X/b37EbTnXT6EKcQ4v8VV78
	O7arE+mdO1bE+t0h6G57Dr6WJGyR/YX6q5MgBzowyEHpJWW6WKsEXhPPPNfQaj0WqtKX7W
	f2XgS9sVj0nkD2B4/LZukEWTNFKaxBU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-617-tRuiUyq_O3ubLDEYzPzCAg-1; Mon, 30 Jun 2025 04:17:24 -0400
X-MC-Unique: tRuiUyq_O3ubLDEYzPzCAg-1
X-Mimecast-MFC-AGG-ID: tRuiUyq_O3ubLDEYzPzCAg_1751271443
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a54a8a0122so1997933f8f.2
        for <linux-doc@vger.kernel.org>; Mon, 30 Jun 2025 01:17:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751271443; x=1751876243;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/Q0wJ1GS1ufKX7uDtmDekOeD4yRmrJFnUlmIqwcewAw=;
        b=LtJiGJGBFNx22OJQpaMl2VeOhzIuuYicy4U3VyzbYVx9afdF4gEE+U6WM/Qedpx5bk
         ac/5TXYpdXUMvrVgd9BV3BxvnmX3L9YzbkBMfxNdIZbIT6lZJ3Peo8suQXjO2sif/V8f
         AnRWFOzzSIDpscOKdcbh/JU0zu4C7xVZvWlPXqnSTCFGE1uZrQOjL5aqP/38q9+L1QXz
         7LWWxa2OMlgPJMIP0TtPkuxr2HOZ8Y+fMxjXq0j31iAAL+J9nwswUe2Uh9mEQewuUonQ
         mLC6IAxd9RfHHnG8UhwcFi8RX9yYf6/sbZLAfX7LeB/BdhiF/+v7eVmtK/Gl0U54J21L
         Rlhg==
X-Forwarded-Encrypted: i=1; AJvYcCVgUo0WaQmBE+cOYaaIeonZ6QoxzDFI7v8x/4sDmwiqCVooNvqkpZAWVMDxV5dzpjVM5yCbcRcX3kw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTX0cmKoNdsg+TuNxIrGwxTkRKK8jdexUtDkMSnIkkjpXv1Izy
	xfzYCG0QiiXCgKR334vKYuOotcbpVwGlSul56F1j5HfaIMLVmiAeVyilXRoIED5DLgIg9UjKwqL
	Re634Jo/DOOCOATPL443tzMSaxjI77g9DWL95ph7p9yf5Hehz5Lr2epLhUb/aAg==
X-Gm-Gg: ASbGncuUk0VXrgtJH4NYpPePX3Gy+lbCb7TTPrsd3Ly8bUAR8334pvI+n/tLY64nLkj
	+j98iStV6xy92iBJqFzvlPYJlapLjq4gpAoMmpdmBsvl1/H6htcG878+vAaCxdPPaJBgkH1A+CU
	61oDVmNVRTzoLbpDbXOY2G17gUx2aCU+rsgbVAa6dtmSBq4BxGSprGGXkWwioCuFZTA/8tuE6/L
	tt/BINWxRDXQoIcsiCDC4pR8OXLAKjX9umVkcgNrV/2ybN6ITFJtyXBUTHAHPjPUoeZeXQLOpVO
	JtSufvrUjWEP0c3AAwYSbvLoELkpUp0lYf/NWZQyA/AeYagXshAnNr0ee9Vy/SuEyMQbCnbBZMN
	rN3kTO4ToyWrzEHJPLSA6kka3wQ7lGMnZqo3qvFeMPBo2HjLnDw==
X-Received: by 2002:a05:6000:65a:b0:3a5:8d9d:27fa with SMTP id ffacd0b85a97d-3a8fdb2ae51mr10017958f8f.3.1751271443222;
        Mon, 30 Jun 2025 01:17:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFMWR3IyK1+AwvaZ/facB6biMIdQnniRAlFsT2EyhAaLhHUybBva57RaZw0C4jH6hFCpyeLsA==
X-Received: by 2002:a05:6000:65a:b0:3a5:8d9d:27fa with SMTP id ffacd0b85a97d-3a8fdb2ae51mr10017894f8f.3.1751271442790;
        Mon, 30 Jun 2025 01:17:22 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f40:b300:53f7:d260:aff4:7256? (p200300d82f40b30053f7d260aff47256.dip0.t-ipconnect.de. [2003:d8:2f40:b300:53f7:d260:aff4:7256])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453823b913esm154580345e9.33.2025.06.30.01.17.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 01:17:21 -0700 (PDT)
Message-ID: <5aa1a0dc-799f-4193-b3b1-5d7cb2c7e0cc@redhat.com>
Date: Mon, 30 Jun 2025 10:17:19 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 13/29] mm/balloon_compaction: stop using
 __ClearPageMovable()
To: "Huang, Ying" <ying.huang@linux.alibaba.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 virtualization@lists.linux.dev, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Jerrin Shaji George <jerrin.shaji-george@broadcom.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?=
 <eperezma@redhat.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Zi Yan <ziy@nvidia.com>, Matthew Brost <matthew.brost@intel.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Alistair Popple <apopple@nvidia.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Minchan Kim <minchan@kernel.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Brendan Jackman <jackmanb@google.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
 Peter Xu <peterx@redhat.com>, Xu Xin <xu.xin16@zte.com.cn>,
 Chengming Zhou <chengming.zhou@linux.dev>, Miaohe Lin
 <linmiaohe@huawei.com>, Naoya Horiguchi <nao.horiguchi@gmail.com>,
 Oscar Salvador <osalvador@suse.de>, Rik van Riel <riel@surriel.com>,
 Harry Yoo <harry.yoo@oracle.com>, Qi Zheng <zhengqi.arch@bytedance.com>,
 Shakeel Butt <shakeel.butt@linux.dev>
References: <20250618174014.1168640-1-david@redhat.com>
 <20250618174014.1168640-14-david@redhat.com> <87ldpaowlp.fsf@DESKTOP-5N7EMDA>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <87ldpaowlp.fsf@DESKTOP-5N7EMDA>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30.06.25 03:18, Huang, Ying wrote:
> David Hildenbrand <david@redhat.com> writes:
> 
>> We can just look at the balloon device (stored in page->private), to see
>> of the page is still part of the balloon.
> 
> s/of/if/
> 
> ?

Yes, thanks!

-- 
Cheers,

David / dhildenb

