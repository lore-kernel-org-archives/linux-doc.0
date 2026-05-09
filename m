Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C7002D2397;
	Sat,  9 May 2026 16:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778342634; cv=none; b=uBlti05dKaE66jIoTkfQJckXZJtBSd7KjoE0Vpt2oPft9HeQPtuEnLIeM83Qe1boXSOndECDJ1d1nho8VOBSnuz62PRPdXgRF7pnG+gmJBRJjp7giLSMrYypZoed8/F/mfB2u2qtmWaklgp2+2LVjnXyX5xxTdPKBK4nLc5odSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778342634; c=relaxed/simple;
	bh=b4vOSOAM6k1R+mmqDr64fp7WvpxpnHLwWScwTogsU7U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PPEsldEpaHFRqX7F93cpDPufhWrNncWCkK6hvP71V2EUPDcG878fL5853JU/SEiP0ezIt1oxkfNPFh28PQkbmsxYLBTRBj75Ra9Gx8cGkuUNB7FC/7pesMP+2su/WILkqdcaEwpw4+lg691vyj0LkUbAwt2u9Hl7DDurHEldmYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=3LyPo0Qs; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="3LyPo0Qs"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=E2QqY8rEv99HO8x6ZfVSogZGJ8bRXrfDH+UbtzCydcc=; b=3LyPo0Qs1vWfHZOI35NXyNEQdg
	uY7CBeCUP2P+sIF4SDOiU6SQSeKc1uF8U17gJcQlwf9MBrZqUwwAOc5BGf/Hg/HdIur4v+7wOfo03
	dwOzIpkZeqLFTOfxvMUYdonBKYUNuCtEcN9y/HK2Cy68Wv00QoqY1LURSA9bDog0ocxP8UrGl5zU7
	bMvXqMLkr5i4+L8BGSaiSep4KaX5JqFCi40gjFXMbjhPlrGtfsfZhOZ5G7anHdbgBf9OhxjHf7fXn
	w2tFL5aKJge56F7iVnXFW4JEgKTzTnvRRzEPm3feTGM8TfBCif/twL+1FRV9syW7K+kP7BhlKcO62
	vWIMhgPw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLk9d-00000009EVs-0UGw;
	Sat, 09 May 2026 16:03:49 +0000
Message-ID: <ef973305-3998-4154-a249-45469c174832@infradead.org>
Date: Sat, 9 May 2026 09:03:46 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] docs: fix repeated word 'as' in dax-hv-api
 documentation
To: Adrien Reynard <reynard.adrien.08@gmail.com>, corbet@lwn.net
Cc: skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260508163802.16249-1-reynard.adrien.08@gmail.com>
 <20260509143057.16512-1-reynard.adrien.08@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260509143057.16512-1-reynard.adrien.08@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/9/26 7:30 AM, Adrien Reynard wrote:
> Remove duplicated word 'as' found in three places in
> arch/sparc/oradax/dax-hv-api.txt.
> 
> Signed-off-by: Adrien Reynard <reynard.adrien.08@gmail.com>

Hi Adrien,
Please report what software you used to find these repeated words.
Thanks.


> ---
>  Documentation/arch/sparc/oradax/dax-hv-api.txt | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/arch/sparc/oradax/dax-hv-api.txt b/Documentation/arch/sparc/oradax/dax-hv-api.txt
> index ef1a4c2bf08b..6dac2a778ccd 100644
> --- a/Documentation/arch/sparc/oradax/dax-hv-api.txt
> +++ b/Documentation/arch/sparc/oradax/dax-hv-api.txt
> @@ -485,7 +485,7 @@ Offset   Size   Field Description
>                               the virtual machine to use when accessing this data stream
>                               (checking is only guaranteed to be performed when using API
>                               version 1.1 and later). If using a virtual address, this field will
> -                             be used as as primary input address bits [59:56].
> +                             be used as the primary input address bits [59:56].
>                  [55:0]       Primary input address bits [55:0]. Address type is determined
>                               by CCB header.
>  24       8      Data Access Control
> @@ -576,7 +576,7 @@ Offset   Size   Field Description
>                                                       the virtual machine to use when accessing this data stream
>                                                       (checking is only guaranteed to be performed when using API
>                                                       version 1.1 and later). If using a virtual address, this field will
> -                                                     be used as as symbol table address bits [59:56].
> +                                                     be used as symbol table address bits [59:56].
>                                          [55:4]       Symbol table address bits [55:4]. Address type is determined
>                                                       by CCB header.
>                                          [3:0]        Symbol table version
> @@ -815,7 +815,7 @@ Offset   Size   Field Description
>                               the virtual machine to use when accessing this data stream
>                               (checking is only guaranteed to be performed when using API
>                               version 1.1 and later). If using a virtual address, this field will
> -                             be used as as bit table address bits [59:56]
> +                             be used as bit table address bits [59:56]
>                  [55:4]       Bit table address bits [55:4]. Address type is determined by
>                               CCB header. Address must be 64-byte aligned (CCB version
>                               0) or 16-byte aligned (CCB version 1).

-- 
~Randy

