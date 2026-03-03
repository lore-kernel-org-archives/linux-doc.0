Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C59A4F796C
	for <linux-doc@vger.kernel.org>; Tue,  3 Mar 2026 17:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772560496; cv=none; b=QQZfiOGTFuSXbUE19C805hBmMR0TIPLY9bJT5S8WFOgEh1+0XsCs5lo9HzEPaaPGPxd2dmUfd9nFaZyMZFDoFrjDUxfjJ7SgX9xp7wPY1kSIx0UejuVxEUTOhtr2ZOwc4AhiqPfDCAMyaxZezzviuvTtAg5DROl+BenjJiffhmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772560496; c=relaxed/simple;
	bh=5vHpd8S1bBwojWOhM24H4CTXaJcsC21G0yOTJH8sttE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NTC/yu4+AVlk2DdF1aX98iM0uvvHKo9rhkrC1sZI7bW2swzbyyZNvjDBmHEpLc6j4wgJUfU5BhbtZZQEGstxHpE7yAlhYY8stzJqQOlrwZL0cPU1ShKDM4OZadsMGgHkPAxTYF+sTCcAOMoXZEyFG3Fm9ekPNlTezxTLdUeZD3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fj0hV7zB; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=jEfUGQvn; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fj0hV7zB";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="jEfUGQvn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772560467;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=doX5i5HJd9ZPEpXpfoeEyvmiiOWgmO4mFqxIxFFY0e8=;
	b=fj0hV7zBpr7XXUPer5CfapodKZkjuexRtcbPSOx7H9jOuEHS/QVqNfexjeBeF6wtIn2Fht
	xNfiRvLlYl48o6KeGkOga6pLRn3yQdnPE+QadN6IR8QRuXiRbCFEp5W/lySr2L4fYKPF25
	/cqY8Cw26JCOEG0H8KABgB1ZIltD9CM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-651-Ymzk-aC6MD2LlzFsVQsq3g-1; Tue, 03 Mar 2026 12:54:26 -0500
X-MC-Unique: Ymzk-aC6MD2LlzFsVQsq3g-1
X-Mimecast-MFC-AGG-ID: Ymzk-aC6MD2LlzFsVQsq3g_1772560453
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4837b7903f3so69726075e9.2
        for <linux-doc@vger.kernel.org>; Tue, 03 Mar 2026 09:54:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1772560450; x=1773165250; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=doX5i5HJd9ZPEpXpfoeEyvmiiOWgmO4mFqxIxFFY0e8=;
        b=jEfUGQvnbyyonKAEsFZpklscxQKbR3E/wvSHm0QQkyfZKQkJmyrs5i2pt+uFfF779r
         qn1EiOIcATq50CBcNJEiGcYBXZbT/qSKSf/bOWDvslyFQaWn9gYSvh5pbjzHGtGD/OIK
         pjkXJNonFRz5LXa+N78UZM3h3qRLKHMXVThFqFbdPSfFecqGDgHG6BFHlPiKevYZorRq
         QhpyFpofoxroSXtnGEggjV8MCsoXM49ks+HLmEWrGacKVWVZHBOhPzfmoMxEZPUd7L3l
         8FRjqrT8b9XvwohUKrcTaxOaRvnaS5dDDLY9eoE+fn60EDK/lY/rKlVcvKeET5NKZD8R
         hnLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772560450; x=1773165250;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=doX5i5HJd9ZPEpXpfoeEyvmiiOWgmO4mFqxIxFFY0e8=;
        b=ZISxtWHKdms3cI3KUygX09S6BEJRc0bXuoDUrccsxMmYqx99sdnM3dXTAmn7ZWJjoI
         q/H4NPuvT14HScnGYVDI0Mv2PrtTVVJtkDpGI9XA6f/cQIVZRORliCzK6fUNUBNE+cme
         AZkx2AdiL47w0fUXWeQ7pKuKvfzeYh3RH0qjiC4XODCWG+7hAxJhc5fqtUKzMqC8dBXH
         Bm46o9LvfpqSz1ZjH5oCccol2bt9BPY5V0xWeu5FqroG6d0YAQVV03k+plog1zooI6DN
         C7pWqAKn4feRFbrIVVBPwpCfZVPi45n6usKAOD9zaTSssrqN4TJGAlh7kQy/uj7xrSmp
         4Fvw==
X-Forwarded-Encrypted: i=1; AJvYcCXjg32/XKraEHmnJH5rklj9TBhaiQrPaC+Go0k0mGSsymF/ludWGhWzgGRiLpNWdl802OnRp8RqxtI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzeUSwKRLq3fs3q0x5XYtTPqPAFQ6GzJI3Bei4/uYqHWUcSfZz
	XbY8HN+51B8AGorYF7ghy5JzFAHRlyZBYywRhjWN5Oo/LMAfNMNp3fZiXTK8kGGCAEpD8nTaU8T
	dSnZCew5RGtIxw/jLeruQl9U0u8YGYEGpYJ6qVOuHuS8Ie5zcuRoqmprtGv6OXw==
X-Gm-Gg: ATEYQzzHNBUIXyeJ9QVQqOVEBi35Hpc67QpoZggXxDE2VWsaHP+wo7B4rZ+4hKWrhPB
	6n54jR9xhiW8O2kyMo8rVl+9fzEglLfrutXUE1c//IENxTzuVdX/HsOg3nl+ujnvN6APH6FQEny
	ILSczMo9XE2q8IDUMEeWHUXeHEL6Vzccvj1+5Geb00bm3MxfN2nYjAgru3khSJTd2Ky7ZNU3DJu
	J55hayOV5rcx81GfWGP0JiRG84s2oCDTkrI/2iCv9ucrdS+QdHNoQFuxgzjRYx4dQiVLgepBcMt
	+Js521KbjGR4FMFFMsl3rTJwzDmKS1762tcWsbFAVGO86Imijok6lg64AThOQ8ZRFFP8Xl0EFOn
	laHAY2qZ9l7YzmsMvOIgLVm8WOcErEpLudIiDOqSerCtPRisf0GS+PYVeJs8STfHX7IHk1nOrOs
	nm8quKE1oJHOfr4L6u+iAVq5njHBY=
X-Received: by 2002:a05:600c:3509:b0:480:f27c:6335 with SMTP id 5b1f17b1804b1-483c9c1a2b9mr251213175e9.25.1772560450221;
        Tue, 03 Mar 2026 09:54:10 -0800 (PST)
X-Received: by 2002:a05:600c:3509:b0:480:f27c:6335 with SMTP id 5b1f17b1804b1-483c9c1a2b9mr251212895e9.25.1772560449788;
        Tue, 03 Mar 2026 09:54:09 -0800 (PST)
Received: from [192.168.10.81] ([151.95.144.138])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-483bd68826asm797166665e9.0.2026.03.03.09.54.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 09:54:09 -0800 (PST)
Message-ID: <4a4bd216-3cdf-4098-8a59-a4cbceb31677@redhat.com>
Date: Tue, 3 Mar 2026 18:54:04 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] KVM: x86/mmu: bootstrap support for Intel MBEC
To: Jon Kohler <jon@nutanix.com>, seanjc@google.com, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
 hpa@zytor.com, kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Cc: ken@codelabs.ch, Alexander.Grest@microsoft.com, chao.gao@intel.com,
 madvenka@linux.microsoft.com, mic@digikod.net, nsaenz@amazon.es,
 tao1.su@linux.intel.com, xiaoyao.li@intel.com, zhao1.liu@intel.com
References: <20251223054806.1611168-1-jon@nutanix.com>
 <20251223054806.1611168-6-jon@nutanix.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Content-Language: en-US
In-Reply-To: <20251223054806.1611168-6-jon@nutanix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/23/25 06:47, Jon Kohler wrote:
> Extend kvm_mmu_page_role access bitfield from 3 to 4, where the 4th bit
> will be used to track user executable pages with Intel mode-based
> execute control (MBEC).
> 
> Extend SPTE generation and introduce shadow_ux value to account for
> user and kernel executable distinctions under MBEC.

While MBEC has a different definition of the bits, GMET is essentially 
SMEP (except that AMD couldn't retrofit it into hCR4.SMEP due to how NPT 
handles the U bit).  I wonder if it's possible to handle MBEC as SMEP as 
well, with some additional handling of the SPTEs (with shadox_x_mask and 
shadow_ux_mask taking the functionality of shadow_nx_mask and 
shadow_u_mask) but no large changes to the MMU.

This should be a much simpler patch set if it can be made to work.  I'll 
take a look.

Paolo

