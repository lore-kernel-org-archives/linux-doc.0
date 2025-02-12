Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A460020C487
	for <linux-doc@vger.kernel.org>; Wed, 12 Feb 2025 12:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739364079; cv=none; b=owLx/ZvKe/vJ4alyxBu4tPLQCHBZzkWUciHT9unyY1ggi+0NPMknLfT4ztvtrqAgswGGC0UgQv3sgJuLIRQAbhab93C5O2emmZnRbBiXaO5GErSFBawc0lkdvmY138vw00qy71/REcPGOvs3TgW0PTnQMTafkM+AsJViHYfuAtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739364079; c=relaxed/simple;
	bh=ME5xsF3un+RPwTZSAF0pplXPAeDr4ydnwfVUmHp8McU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lgyXa9ptBEAQk5h5Lt0eJuTlFy3gJfymWYFrMsgzPRDZ4mvotX+Y3w2f8zHtw3vsuelfynV5BRf+UOg6KyrKRsLwTtnCV18y+Frwx0EI2VjQO/VNBvigtNv0U9TKurJ3Uov7RLvfQexjh7fNxWwAW/yHx8O/ptD8q5L5fepYqZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IMc9ov/k; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IMc9ov/k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739364076;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IcCcfwfQhYUa1+LUaKcJqa7S3yY7KgRC7fJ6fRDLjdI=;
	b=IMc9ov/kOTB3KB2ZzP/HhuOryZgvCns/3RNzCHQab0SYLIZZxI+Ri09Bv2jul3VS2oI5H/
	sWwbNteHZEj1nQJkHZA6qUTIrxukBB8C/211Tm45f2RXRT5YbF+tjctaVfmYZ8YKX7mf7b
	kTZYLORrWxdQoKHMmDJ5q1IdZGbfbQw=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-390-eYlN91S4OLyM81p2uxCPjg-1; Wed, 12 Feb 2025 07:41:15 -0500
X-MC-Unique: eYlN91S4OLyM81p2uxCPjg-1
X-Mimecast-MFC-AGG-ID: eYlN91S4OLyM81p2uxCPjg
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-47189f95eb0so16074781cf.1
        for <linux-doc@vger.kernel.org>; Wed, 12 Feb 2025 04:41:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739364075; x=1739968875;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IcCcfwfQhYUa1+LUaKcJqa7S3yY7KgRC7fJ6fRDLjdI=;
        b=M5yY4m2CBO2tmA0v1GMqUjn3wmUj6ybfs804xDXoV50NiOr0ATiINVq2DBHBEXk95g
         ZtUjUOM+xnkSun59Xqh2UeqAGqEbNY79EvjI/JIlaTlmLjQthWSFJxc1TN18YkCW3zaM
         hAnRg729ac/Jqqf0fBAZcOk46RoH8n4e6Ms/BHcBBlqjkz4+aoy+pHFr8+WC7L2M5HnD
         Azif5Ls3N08qPoPO/MaBt7tolqp0P2S6JPiOqHr1Kn0bVdgtL1QMZK/6b+y2/g1Pw4Iv
         4s0Qu6bB2+Ts331tLAPWMzyYlZ7lypcjctj2Ll7VGxv04UJcPWWTZsU5fUiJj2cLb7rD
         147A==
X-Forwarded-Encrypted: i=1; AJvYcCUpDJXa5u7Zf/1krVqMaEqaArMxprI6AwwMdGPHglqsAXOIJd9/dmva5anATR8p4Jv99Xn8SkJLD9Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3o0WPwiJpioUw+xXXpovlGzN2xrYMQN89B7qSCF0PVHZb+jmn
	PA4AaSmmNtRP2ssONH2QKPUqnyXqUV/YC5mN5LTEw0gV6kre2n74pZ5pnEVTmcrE6/mFO9Kn5J7
	hTik4J/daO0iNwARRrKQut/HdS3tUwrIhlvqEXo4ryr1SMbEbab6lKvKmZA==
X-Gm-Gg: ASbGnctYEszdMk4E03C2WFuoI8qVvs6z02xpzGf2CRbo+VZF5yAG6/yEiZ3s8A+mobF
	MB2nsuU624if5sIVyUevf+mcPhyEitnWaBkzh+CLwADXNOFyrwACxo1j8y9YoesGkDiQaKDAd3z
	CE29gmT66vxAclssw34/n1Hybl2TN9nFKsUOTdw9v+Ye2pzoRuDERWYZ/lJ8ZFIqUuLJS/YFHjo
	ZfgK6gta1llOdBfuH5TDM1nJ3ZrCfi5rlYfbCDmv33ZFQwoDhxa62HBv8LV+IOcPVqgU/3GjEGs
	eFhA
X-Received: by 2002:ac8:7e90:0:b0:46e:2d0b:e1bf with SMTP id d75a77b69052e-471a1285b1dmr107223601cf.11.1739364074942;
        Wed, 12 Feb 2025 04:41:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEc/5GZoYwqTghTlMDfKo+W14Qj3PAyNsgnM8EOKyze88sNfy/x51BtROYbXMZUOJtzdRgkfg==
X-Received: by 2002:ac8:7e90:0:b0:46e:2d0b:e1bf with SMTP id d75a77b69052e-471a1285b1dmr107223131cf.11.1739364074559;
        Wed, 12 Feb 2025 04:41:14 -0800 (PST)
Received: from [10.26.1.94] ([66.187.232.136])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47180b1ca44sm51284181cf.76.2025.02.12.04.41.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2025 04:41:14 -0800 (PST)
Message-ID: <9416ee48-a68a-465e-85be-89d5a53afcd8@redhat.com>
Date: Wed, 12 Feb 2025 07:41:12 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] intel_idle: introduce 'no_native' module parameter
To: dedekind1@gmail.com, kernel test robot <lkp@intel.com>,
 linux-pm@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Jonathan Corbet <corbet@lwn.net>,
 Jacob Pan <jacob.jun.pan@linux.intel.com>, Len Brown <lenb@kernel.org>,
 Prarit Bhargava <prarit@redhat.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250211132741.99944-1-darcari@redhat.com>
 <202502121732.P7lZkbhm-lkp@intel.com>
 <21e66060c13c6a3cc33592f71cb08975711a6adb.camel@gmail.com>
Content-Language: en-US
From: David Arcari <darcari@redhat.com>
In-Reply-To: <21e66060c13c6a3cc33592f71cb08975711a6adb.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Hi Artem,

On 2/12/25 6:32 AM, Artem Bityutskiy wrote:
> On Wed, 2025-02-12 at 18:09 +0800, kernel test robot wrote:
>>     drivers/idle/intel_idle.c: In function 'intel_idle_init':
>>>> drivers/idle/intel_idle.c:2289:27: error: 'no_acpi' undeclared (first use
>>>> in this function); did you mean 'no_action'?
>>      2289 |         if (no_native && !no_acpi) {
>>           |                           ^~~~~~~
>>           |                           no_action
>>     drivers/idle/intel_idle.c:2289:27: note: each undeclared identifier is
>> reported only once for each function it appears in
> 
> David, this must be the !CONFIG_ACPI_PROCESSOR_CSTATE case.
> 
> Thanks!

Oh - I see the problem.

After a quick look I see two options:

- #ifdef the code that doesn't compile
- default no_acpi=true in the !CONFIG_ACPI_PROCESSOR_CSTATE case

I sort of like the second option better, but I worry about the 
documentation.  Specifically:

"In the case that ACPI is not configured these flags have no impact
+on functionality."

I guess that is still true.

Perhaps there is a better option.  What do you think?

Thanks,
-DA

