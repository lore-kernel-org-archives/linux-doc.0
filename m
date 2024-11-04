Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F35A1AA7BE
	for <linux-doc@vger.kernel.org>; Mon,  4 Nov 2024 09:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730711387; cv=none; b=eFEhIFVB8rjrQ9Up9Pd+gxWtaZoizrgkkNnX2zGeaALbwgIpRozAazkQh6wtv7r1Z5yZfPxZ9yLXF+17Kwmca1FjmnvKw8ry/PQj6vgu/AqWBdV7alVnTFCMJyd9lWzDcYursmq6cME9evwLwe3HtezkI2vooVPONfHrwcDEZbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730711387; c=relaxed/simple;
	bh=5LNOtpZh+tqWVD6bW5xdLkwiPv6GmRmb3Fl/t/Yl0tg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u2YxyzKoDHVyw+QgqkCIKXxMe+zv4K6ZE1kNY3GUChR3q7wqElENRbYiO8bny6xZpUgMQKtnQRdW0f5ScyZjS7fnKapoJG0sCJrZWaqvmVmO4xVm6sdxtEjoaOHgjU0md6Yf8jEMGxNFusZl11D7GepsQa6GqKvhBNEORU5djmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=boZXgPrK; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="boZXgPrK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730711384;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=/1z646k7mvlmH1OcTxfgNh5E5GkUChQHV68Fk2Uby2g=;
	b=boZXgPrKRB4AqUW2c8XkzndVl/Qb22yLzEYLaHFzFHVFy2BU59SX9tpT0pFM8FRjLeDNhY
	o76yJ8hx5fwfkTzooOVuDH88eHmXrgO/RBlxRL7HTjep9T9Y0m9Hp8CFcTzyO03xWuku54
	NKCr5fH9a40DEsmEzZpYwOLsUO2vH94=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-379-Njvw-xVuNm6d0pdUAle7bw-1; Mon, 04 Nov 2024 04:09:42 -0500
X-MC-Unique: Njvw-xVuNm6d0pdUAle7bw-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43151e4ef43so28570425e9.3
        for <linux-doc@vger.kernel.org>; Mon, 04 Nov 2024 01:09:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730711381; x=1731316181;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/1z646k7mvlmH1OcTxfgNh5E5GkUChQHV68Fk2Uby2g=;
        b=ibwmEZJSRDJCpR+7Kp2Ce05IhI7bwD5m1TfY5qfsBbanbZyV/4IAo0IcAE1h+gsnn+
         C16UhBGKmba06UH6IKNi5S7DzXVdsaDQ8b5BYWjuJIkVNEHoEGw55eP3qr7cropIUtPT
         6IrX2BWCaPaWR8X7dGhGJ23BuDG4qCedwgkLKn7iCpzNs5orflrfFdWYHKrdoMdTw+KH
         iVIbmvGniYuARqOEelZ96Y4hE6huF58uft2VgalJwcWU8ZyZDMEL/55Gn3lbSSGeE5rJ
         ISOSm17qa8ym1hr21dXI8kMShyWINWytxYrQbviieunWzhibd3vs5o1YSsKKw3FXJnXJ
         wdsQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4xxSSO7hqrIFJIABQDo0ClEBwpEvLoStNwDHaXeLxlpQYLN24U8Bitpx3eYfcZBwl7s8kAJHD9xM=@vger.kernel.org
X-Gm-Message-State: AOJu0YysWQPOCdR5z1a4Fo1QJ+8d8kItc7qYeBnuiSMMpWr5FYHZ1Sx1
	CYbrgGGtDQzdP2nNR+gaho/Kei2Prq4qp84J4A9ArxZAlbLbtlsd5RTOAWYDSL4MXKV8lCbMUEG
	4Bbo5j1h1Nplm+9v24B+xCc4wE/rjTDx2YPLyCvcz79C0lRAnz+zxyhYkmg==
X-Received: by 2002:a05:600c:4ecc:b0:431:3c67:fb86 with SMTP id 5b1f17b1804b1-4327b801f83mr126267975e9.33.1730711380955;
        Mon, 04 Nov 2024 01:09:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE5sii3kFjhsK4+qP8SPEI91Fj3jaqVMmmytAvV89wJahLWb/4Ax256PzFvTgi+UyMASdChtw==
X-Received: by 2002:a05:600c:4ecc:b0:431:3c67:fb86 with SMTP id 5b1f17b1804b1-4327b801f83mr126267805e9.33.1730711380549;
        Mon, 04 Nov 2024 01:09:40 -0800 (PST)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7? ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431b43ab29csm186660655e9.0.2024.11.04.01.09.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Nov 2024 01:09:39 -0800 (PST)
Message-ID: <0b925d54-cf55-4b79-b415-dbea04ecaa00@redhat.com>
Date: Mon, 4 Nov 2024 10:09:38 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS/MEMORY MANAGEMENT: add document files for mm
To: SeongJae Park <sj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com
References: <20241101202311.53935-1-sj@kernel.org>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20241101202311.53935-1-sj@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01.11.24 21:23, SeongJae Park wrote:
> Memory managment subsystem documents ('admin-guide/mm/' and 'mm/' under
> 'Documentation/') are not marked as managed under memory management
> subsystem.  This makes 'get_maintainer.pl' for changes to the documents
> sub-optimal.  Mark the documents as part of mm subsystem on MAINTAINERS
> file.
> 
> Signed-off-by: SeongJae Park <sj@kernel.org>
> ---
>   MAINTAINERS | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8a18c2e135cd..2a2e92129646 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14794,6 +14794,8 @@ S:	Maintained
>   W:	http://www.linux-mm.org
>   T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
>   T:	quilt git://git.kernel.org/pub/scm/linux/kernel/git/akpm/25-new
> +F:	Documentation/admin-guide/mm/
> +F:	Documentation/mm/
>   F:	include/linux/gfp.h
>   F:	include/linux/gfp_types.h
>   F:	include/linux/memfd.h


Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

