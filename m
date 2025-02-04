Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E5720E305
	for <linux-doc@vger.kernel.org>; Tue,  4 Feb 2025 12:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738673571; cv=none; b=fc+r++CWSBirXq1mePKb/6GpQaMUR8eRaBdppzKUBj4JXBsmmLNJizAzYmZ7eFRTo+oHIcZRodQ8QO/qtJxn6Cck7VFqILzVrHZY8sltU4i9h3kkaUXqdTijIJcMKs9QqhVUHfB1FGXa/iYALtNz2SJXkjUJwnsGGF4gEme3sV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738673571; c=relaxed/simple;
	bh=tdSryqq+nxgkvS3zFFee1YefkpUm59QAMRrn28AGXa8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hTBoWnB8alL4hDTVhz8bt/8H1iI+644GsOaYwj+FKjSGTHuCnZKte9p2hn8H2SPW6EPgEySRWfSNjoDZwoOO4a3Byvw1w3YGbl+yyTjeJIXH1eRvFMznvCSyxHtuWIVAv/bGwVYsU59d1jXo3z0fmaqSkgKWpc+q27Jn9RVsPKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UCgS3wu6; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UCgS3wu6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738673569;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pvOSzWz/fXFYgL1SHq0V9p8J5l8O+whyYebMY7GcFOU=;
	b=UCgS3wu6Cc5YtFz1CC1NVLgKc2EB2lF2TJk38FIY3BuJr/UeXFE1LQE2QrkDfxUzwy8eRA
	LIGGvUtfTlQfwJVKBKSGrwG/m5xSaC34aI6x53q9VBO/XmNU8AnzNFcyxgcXucw7BwVLbs
	kU1ZOY7HRH6U7iF8/cqMxpWxQhrA7lE=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-178-lfksvzinNFerrz__aAjmnw-1; Tue, 04 Feb 2025 07:52:48 -0500
X-MC-Unique: lfksvzinNFerrz__aAjmnw-1
X-Mimecast-MFC-AGG-ID: lfksvzinNFerrz__aAjmnw
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e42cf312a3so2328146d6.3
        for <linux-doc@vger.kernel.org>; Tue, 04 Feb 2025 04:52:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738673567; x=1739278367;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pvOSzWz/fXFYgL1SHq0V9p8J5l8O+whyYebMY7GcFOU=;
        b=ThdhRDGelOb1lv5Q8rYqTKG/rwxZtAzbLGoUxRkoYp6cNLt4+BpFcWRe6PzEDWX/Sv
         s5TTjGOkL4pv62jNIbQc+z56m2mVCM7Su02Y11YEq5lNcCnvwyC+uOx3Sz0HkG3HZVLs
         3OsbAuPM/P/s2Tm1gu6jBtxlWFq+Y5AFY0ySFgU4WxftTxdDV2zekXd3X+2PLLj+fK9f
         OGVfz/w3x7NikLiFXvxAbny6Fdbkt3XWL0RNisgDe0aV0CySJJW7DecdkHnWdfEYqpNd
         +2p9+6gTbOgxfiMGM20c6Cjrg+2jHK9sCTNF1hCRLDbKDrP/12RJlnMi6BnjFn+GkTOG
         ZKIA==
X-Forwarded-Encrypted: i=1; AJvYcCVM0xuml+NF4+8vilPEHAFHV/K+85+HL4UUpwGaj/lm1CoLw6jVuMnQumQrYi1OW3jvDo7Q4wG8h08=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywt+nkV7KzetgNcsY6PsyDRHHXcno+Td/Uxd09JsgtuZqJpu43l
	4DES/WOO0A6z+vaGI+WYoapMYDxo/XGnRX3U0eEwDI6FrQqqwWvfxM1NdIM2VVzlUF6HS/cQ+aM
	/PATiVCFNz85Fo0uP4Xxr2Eyth6aPgznqnSIICpyVzLllGhBp5ouvgc/Nsg==
X-Gm-Gg: ASbGncvbbHODxadKzLTyergCbJb3YQROLTeBZbMVYzs78+b8DgEpwwsHZO94lP+O/Xu
	SEuR+yz751/TdgGNmvqrpSKVDlX9nh2uboouqiDjI8epCzRruFzMMlA3KAfnZrFcdwd44jBxumN
	ICPG1B/H0UfKDIYeI5Xman9C42Uwbgo2ezkgizL2n+KgtqPABx5lFcefe6bjKE1VaHHkrYbeEvA
	MIOwKqsA9autD42aR/zS3O4kXMg1PxNHRR03clulz7+OZJc32L0HfT25VerTR32NZoo4SHsUhRQ
	FAsR
X-Received: by 2002:a05:6214:48d:b0:6d8:a67e:b2fb with SMTP id 6a1803df08f44-6e243c7bf68mr389612536d6.39.1738673567404;
        Tue, 04 Feb 2025 04:52:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEcgbWPNl7P8tA5g1YmE4r9A5UoaGRH3/2GoingbBKNmrPxXra0qeVOzHPtGDTdRQvEw8kNTA==
X-Received: by 2002:a05:6214:48d:b0:6d8:a67e:b2fb with SMTP id 6a1803df08f44-6e243c7bf68mr389612246d6.39.1738673567139;
        Tue, 04 Feb 2025 04:52:47 -0800 (PST)
Received: from [10.26.1.94] ([66.187.232.136])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e254922a85sm61433486d6.81.2025.02.04.04.52.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 04:52:46 -0800 (PST)
Message-ID: <afbe2137-398b-4053-93e7-2a03aeb32220@redhat.com>
Date: Tue, 4 Feb 2025 07:52:45 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] intel_idle: introduce 'use_acpi_cst' module parameter
To: dedekind1@gmail.com, linux-pm@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>,
 Jacob Pan <jacob.jun.pan@linux.intel.com>, Len Brown <lenb@kernel.org>,
 Prarit Bhargava <prarit@redhat.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250128141139.2033088-1-darcari@redhat.com>
 <e9188365425d2a4c0dfa7cfa2b17ad3d9fcf2735.camel@gmail.com>
Content-Language: en-US
From: David Arcari <darcari@redhat.com>
In-Reply-To: <e9188365425d2a4c0dfa7cfa2b17ad3d9fcf2735.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


Hi Artem,

On 2/4/25 7:23 AM, Artem Bityutskiy wrote:
> Hi David,
> 
> On Tue, 2025-01-28 at 09:11 -0500, David Arcari wrote:
> 
>> +The ``use_acpi_cst`` module parameter (recognized by ``intel_idle`` if the
>> +kernel has been configured with ACPI support) can be set to make the driver
>> +ignore the per cpu idle states in lieu of ACPI idle states. ``use_acpi_cst``
>> +has no effect if ``no_acpi`` is set).
> 
> With this change, there will be three parameters:
> 
> * no_acpi
> * use_acpi
> * use_acpi_cst
> 
> I would like to make the naming as intuitive as possible. We do not rename the
> first 2, but for the 3rd one, I think "force_acpi" would be a better name. Or
> perhaps "no_native"?

The problem with force_acpi is it is very similar to force_use_acpi 
which is what intel_idle.c uses internally:

drivers/idle/intel_idle.c:module_param_named(use_acpi, force_use_acpi, 
bool, 0444);

That said, I am not attached to the 'use_acpi_cst' parameter name.

> 
> * no_acpi - Do not use ACPI at all. Only native mode is available, no ACPI mode.
> * use_acpi - No-op in ACPI mode, consult ACPI tables for C-states on/off
>    status in native mode.
> * force_acpi (or no_native?) - Work only in ACPI mode, no native mode available
>    (ignore all custom tables).
> 
> Additionally, I think we should enhance the documentation for 'no_acpi' and
> 'use_acpi' while we're at it. Otherwise, it is hard to distinguish between these
> three options. Would you consider another patch that improves the documentation
> for 'no_acpi' and 'use_acpi', and then adds the third parameter?

I'm happy to resubmit. I guess I could use 'no_native' for the new 
parameter and then update the documentation as you suggest above.

Does that work?

> 
> Thanks, Artem!
> 

Best,
-DA

