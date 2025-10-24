Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE022FE04E
	for <linux-doc@vger.kernel.org>; Fri, 24 Oct 2025 08:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761293252; cv=none; b=TRcxtpdD/iVEjAc1mwt7YDsjiDX3/mgvp+bhYwMGrME8n01D75dpQ648OfM0gkYd5aJFTN6JkL/8shvE+cpvf0qCw+WR4W/NUTGYKLRasyIvVvAbLqnQ5u3+WsB/Lnob9BVNcirWslLJimd2x4Vot8W/03NGPVCeHsJfk8VKwwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761293252; c=relaxed/simple;
	bh=v6Uu9OfpU3miqfYHQVDWdTDLr/YQ0zcUPbLXEWhEqOc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TvoJhJSNhvJxrUgZ6ZsJO08kBqe2HSbtWWWSMV9ebLs/KznkNo7YCE9v91zWFGgmpWydjRD6mtmkXFyfZrlTiL6l2j/YUZuUeVzhueIijcmnD+6y+5bjTfQuwq1uFzgj1nuRPyW1x53XE3ftd7yqAOeOCBF/nNWf2nPYCn6bx4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ghsdQXOr; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ghsdQXOr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761293249;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LRmVGBR3L7ECLXJInz7h60bnXxh8bIDyGiHP96dEYqU=;
	b=ghsdQXOr8xxlMQ1O0nmaQ+mvFhzEpaMcqJufrbDlSCN+6yp1R0UtTf68XVPf32U8/KIaQF
	wFRm01Y66SXNH5ck5ZAIWiaYw5siMqYtVC3Z7i1eiC+puTWAp38c+S9U+tZ/sHxtRS6laQ
	qnBMK2eVJJEpizwvmRFGYydAuzF+N/M=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-99-UVtS_ti8Nci5Y8uqklfabA-1; Fri, 24 Oct 2025 04:07:28 -0400
X-MC-Unique: UVtS_ti8Nci5Y8uqklfabA-1
X-Mimecast-MFC-AGG-ID: UVtS_ti8Nci5Y8uqklfabA_1761293247
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-47107fcb257so11552635e9.0
        for <linux-doc@vger.kernel.org>; Fri, 24 Oct 2025 01:07:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761293247; x=1761898047;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LRmVGBR3L7ECLXJInz7h60bnXxh8bIDyGiHP96dEYqU=;
        b=nObTlhtMFfh/EB09whSloik4KYgN1/9ON4kEUIfyBW3lJL24ero5ld8GoOQ23Rn48t
         uS9FYCmcKmQeg4SlqEEOBljiICHAp95DdFhCe8oWB+jVPF9wyP4CMnLzUD7EEyifHPZS
         +robZTDC25s/aNVfVVJcDerMGvhEwoYrKyrhNcRyUBOXE0aIGOFlMmR9qyYq9zYJFv18
         hP9clp4HzyQBlwGVxDovYrYq9fKHbEC/WbHSI7j0zzOnFmXT/pPCagQsCrG7tUw+t4VB
         5PoDuGrSkcGxLGY6i0FCf9WT+7hJ3rFaTWKSlBcLp25ILxzOjEgJbtYY3Hh+8682c7me
         1bZw==
X-Forwarded-Encrypted: i=1; AJvYcCXCn0d/CaaBygqgcL9na6g1QPJR+9zUpJ9t4POev+a/tTtnWqOfEE8t/cbH2O/ujNlKAAmTwpJZX8o=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZinxLiDyMg6LgaQySqtCUmCwLnNuXBgBSM8iKxc9A6NzhSsR8
	cyS9E3wMikPtIC0eLntvLGxXT7ZNL0qu/+gZ4qPAUgxRsxuMQSmrRSDRlMefDmkX+VFgTBWXVAq
	me/7YA44OK/XFyVf9HaQj/Gi98gk44ABG6F5aRdEk25FAg3Acd946J8X9no4RFw==
X-Gm-Gg: ASbGncvCeRm1X69tw7Z5GRXo21SnUQO5b9SrGPXVrIza/59uNK02N7w+D1rzyfhx47r
	b40WXg9Kr+4ZyA399jZprBc3VbTOMLXtHBVkWMIzy0/n3W08/DMuTsp05BjSnCbpLjFGlNaoNh4
	ut/w5CIdyMLDiIDWXVdg5PD4wcu9Y88xt8bIl4/Rgq+58ADWCA4y8v9EEMI6wlEEtC6AAjphQi8
	K6OxB1Tl/WJH1WucqWZFlLUFj+17Adkk4fWF2GtZ8HNhU4SX7FZjQLOFhRDN7Ox52eQxPlkZAmD
	rcsdfhECvYjrTl0lxmoWIg0XPmLVRYty7ptDaEQ0EYJv9+JCsQHIRs5CwnFj8CtjrpAWQXKfTaw
	3AQ6Wbc8Sr0KKBYXQ2O2Vz8AA/zZCvblpoGrk
X-Received: by 2002:a05:600c:821a:b0:46f:b42e:e3a0 with SMTP id 5b1f17b1804b1-4711791dc89mr198073065e9.41.1761293246661;
        Fri, 24 Oct 2025 01:07:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6r1TGgJ/wvxED8Gb1vHbNBF65U7KF83b48rl7o39gZzsWhbiRmyUjExyLr9qynJjlSEUsgQ==
X-Received: by 2002:a05:600c:821a:b0:46f:b42e:e3a0 with SMTP id 5b1f17b1804b1-4711791dc89mr198072685e9.41.1761293246204;
        Fri, 24 Oct 2025 01:07:26 -0700 (PDT)
Received: from [192.168.68.125] (bzq-79-177-149-47.red.bezeqint.net. [79.177.149.47])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475caf15498sm91555855e9.12.2025.10.24.01.07.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Oct 2025 01:07:25 -0700 (PDT)
Message-ID: <fd9bfe41-bff8-472a-a50b-e2089f3c6351@redhat.com>
Date: Fri, 24 Oct 2025 11:07:22 +0300
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 02/14] i40e: support generic devlink param
 "max_mac_per_vf"
To: Jacob Keller <jacob.e.keller@intel.com>, Jakub Kicinski <kuba@kernel.org>
Cc: Jiri Pirko <jiri@resnulli.us>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Tony Nguyen <anthony.l.nguyen@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 Alexander Lobakin <aleksander.lobakin@intel.com>, netdev@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
 Rafal Romanowski <rafal.romanowski@intel.com>
References: <20251016-jk-iwl-next-2025-10-15-v2-0-ff3a390d9fc6@intel.com>
 <20251016-jk-iwl-next-2025-10-15-v2-2-ff3a390d9fc6@intel.com>
 <20251020182515.457ad11c@kernel.org>
 <d39fc2bd-56bf-4c5b-99a2-398433238220@intel.com>
 <20251021160745.7ff31970@kernel.org>
 <9604cc84-4268-4964-a4d9-2d37ea095138@intel.com>
Content-Language: en-US
From: mohammad heib <mheib@redhat.com>
In-Reply-To: <9604cc84-4268-4964-a4d9-2d37ea095138@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Thanks Jakub and Jacob for the feedback.

On 10/23/25 1:11 AM, Jacob Keller wrote:
> 
> 
> On 10/21/2025 4:07 PM, Jakub Kicinski wrote:
>> On Tue, 21 Oct 2025 13:39:27 -0700 Jacob Keller wrote:
>>> On 10/20/2025 6:25 PM, Jakub Kicinski wrote:
>>>> On Thu, 16 Oct 2025 23:08:31 -0700 Jacob Keller wrote:
>>>>> - The configured value is a theoretical maximum. Hardware limits may
>>>>>    still prevent additional MAC addresses from being added, even if the
>>>>>    parameter allows it.
>>>>
>>>> Is "administrative policy" better than "theoretical max" ?
>>>
>>> That could be a bit more accurate.
>>>
>>>> Also -- should we be scanning the existing state to check if some VM
>>>> hasn't violated the new setting and error or at least return a extack
>>>> to the user to warn that the policy is not currently adhered to?
>>>
>>> My understanding here is that this enforces the VF to never go *above*
>>> this value, but its possible some other hardware restriction (i.e. out
>>> of filters) could prevent a VF from adding more filters even if the
>>> value is set higher.
>>>
>>> Basically, this sets the maximum allowed number of filters, but doesn't
>>> guarantee that many filters are actually available, at least on X710
>>> where filters are a shared resource and we do not have a good mechanism
>>> to coordinate across PFs to confirm how many have been made available or
>>> reserved already. (Until firmware rejects adding a filter because
>>> resources are capped)
>>>
>>> Thus, I don't think we need to scan to check anything here. VFs should
>>> be unable to exceed this limit, and thats checked on filter add.
>>
>> Sorry, just to be clear -- this comment is independent on the comment
>> about "policy" vs "theoretical".
>>
>> What if:
>>   - max is set to 4
>>   - VF 1 adds 4 filters
>>   - (some time later) user asks to decrease max to 2
>>
>> The devlink param is CMODE_RUNTIME so I'm assuming it can be tweaked
>> at any point in time.
>>
>> We probably don't want to prevent lowering the max as admin has no way
>> to flush the filters. Either we don't let the knob be turned when SRIOV
>> is enabled or we should warn if some VF has more filters than the new
>> max?
> 
> Ah, yes that makes sense to me. I think the best approach is just return
> -EBUSY if there are active VFs. We could implement warning logic
> instead, but I think most of the time the administrator should be
> expected to configure this once during setup (i.e. a boot up script or
> something), and not during runtime.

To make sure I understood correctly before sending the next version:
  - I need to update the parameter documentation to describe it as an 
   administrative policy limit instead of a “theoretical maximum.

  - I need to modify the set callback to return -EBUSY if VFs are 
already allocated, so the parameter can only be changed before enabling 
SR-IOV.

  - I need to mention this behavior explicitly in the i40e devlink 
parameter description.

Also, just to confirm — should I resend the updated patch directly to 
the upstream netdev mailing list, or should it go through the IWL list 
first?

Thanks,

