Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9B8295DB8
	for <linux-doc@vger.kernel.org>; Wed, 22 Oct 2025 09:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761125954; cv=none; b=ALxk/5K+oKDqGAZn0UCtLfyynky36Xl7xDmHpV16kKjozyDlT22Ei2MZg9s3sNQojaCx8fRetX859pJpjufbgrniJ+xZiXEUhUlK4z16xKLcOlFUOqhvJ7OtA+tQJhDrS34pfqQdWqADvxNXPyovR9ZKKEdfPNkE1hRz6PAoU9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761125954; c=relaxed/simple;
	bh=UZ0OPkGP8yNVJlDHumkQcuasIKQr+bwGLQCUf7u5PAc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W6lpfvN4p+aIvrPLzU+Y0OJCbsuIatqEDvVVEnmfO16w0+xixWjm0lTgPKCBDu6EKJKsPLNzK+LU0+rYba8izEAX6hE7aS0HdRKTMyGf0hotZcMtlAyqNcHXbHGVX+kJGHmMwvCxN7ur/zrJz9kumuZ7RkO/g2PhUt6abXs9ouk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XppbdrDf; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XppbdrDf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761125951;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MuYmiOLCaPZRj40EIc99HdJ/xOeorodHm2jhiotawYQ=;
	b=XppbdrDfHttU04DnZISFJ2KWJjG3dnTiyELujazh7bULxpLJhMVE1WM4H+Fq1TW/5S4XS1
	5JY0PjmFZ1X2C4xAnr6VbHc+vdZGq31grF09ysEBuwAFQ/MTMkrorh+c+8HVFJ/iAEMRyh
	HTEzUMvBvfk1q5wwklpWYhhAIXkU9do=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-683-wW3Dk2XNO3qtz5s8Q07OWQ-1; Wed, 22 Oct 2025 05:39:10 -0400
X-MC-Unique: wW3Dk2XNO3qtz5s8Q07OWQ-1
X-Mimecast-MFC-AGG-ID: wW3Dk2XNO3qtz5s8Q07OWQ_1761125949
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-42700099ff5so5021467f8f.2
        for <linux-doc@vger.kernel.org>; Wed, 22 Oct 2025 02:39:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761125949; x=1761730749;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MuYmiOLCaPZRj40EIc99HdJ/xOeorodHm2jhiotawYQ=;
        b=uG0Zmb4RRA1+7PDVlP0g+6+gEPIsiUlw63YBIztdNKVWGDkH2my8PvDT7eCatyxyxY
         mF1YHxj3Cp+21ep1Zuzg1i5VRNUx/xZUUtV9kfIqkJz8XFImTbcAiLmYiMpy3kSpBURB
         eN/Kyg21WXvcGB3IcSJmJjGS2HiTHOdqI/+5Ygg6z48yk1QinO5g+DPuadbY0BJO89hc
         eBrVXmpQll9C1LHPaVkcYB7F/Loqr+ym4Zp/iickVUVRoR6NYcDkRdTd6Lg39sQTQZpR
         YGeIFkP5KvIJliJAaAZz63SX18g6tEXrOvUDbHqDBT61XoehVy7rF+6leMhcX3SCWnef
         Ci8w==
X-Forwarded-Encrypted: i=1; AJvYcCXWK1ZgpQdl9jPZeQoNDfYL9k6XpleLGe31EY+v0jDm/Z7SfhwZcTMvneCunX419vPTPjWVBXsP+TM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzd79iRpyV/8DmQduO20ck6wQMyRyCTdGnHlAAWcIdNvwpIOdMU
	K9zX4tO5YuJVR7k9uC/CjylN09t41j8ggYP1GMjQkXtBTZyAmXtJPWAoFV4E9M/6lcsdpMd6GtV
	pdl1fwoX8SQvyJlkzPG6GoBTX9OcrOkdWIpFG/+Se/b1jpLKy/r18CFSXU5/FXg==
X-Gm-Gg: ASbGnct49hR5+AkdUSiC33k8uIVIwNhIDVnfKMaLd0VibRM1DMpvBoNtjrBj9etn1O1
	xLv7ATp6WVPQkyAPB+vlhKH4Ui90bUNoTPgFm3OimRAX1prDKUbzBZCpVohtahhjDB+Dh7c7fJf
	2TASMUFXYnOGSbARTmDyxcPgF7Btg1+oewrvKx/FJfZJW/9GPSt/UzMzsVzUMle0dEBYavGVqo6
	NPAeKi0xBrc5hJFIN4Qu9IvcNnJnhoI2oCJ3UzNmExXrq8jnoqHwFwegaML2Chh8oVX+1VgeEhA
	Jkw3/anL1LrrrypMbPuqpynDu5Nm51sVJNITFAOZOiwnFWMZVYyhXYGxv8v9zYZzB2zVBON/QtD
	oEP9MY9/AhEu7k9B1Wb2k+bwQOhHfiO8Yorip
X-Received: by 2002:a05:6000:2911:b0:3e7:46bf:f89d with SMTP id ffacd0b85a97d-42704db22camr15953049f8f.44.1761125949411;
        Wed, 22 Oct 2025 02:39:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/aOryQn5sy8rYEtqe6i7g3LA3GyVmEJjSxmfNQPD4o765qZMFTbY8a7U8TNz9fPJlo12+lA==
X-Received: by 2002:a05:6000:2911:b0:3e7:46bf:f89d with SMTP id ffacd0b85a97d-42704db22camr15953008f8f.44.1761125948937;
        Wed, 22 Oct 2025 02:39:08 -0700 (PDT)
Received: from [192.168.68.125] (bzq-79-177-149-47.red.bezeqint.net. [79.177.149.47])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427ea5a1505sm24495428f8f.8.2025.10.22.02.39.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 02:39:08 -0700 (PDT)
Message-ID: <075914db-d497-4428-97e2-256b35f40729@redhat.com>
Date: Wed, 22 Oct 2025 12:39:05 +0300
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 02/14] i40e: support generic devlink param
 "max_mac_per_vf"
To: Jakub Kicinski <kuba@kernel.org>, Jacob Keller <jacob.e.keller@intel.com>
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
Content-Language: en-US
From: mohammad heib <mheib@redhat.com>
In-Reply-To: <20251021160745.7ff31970@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Thank you for the review.

As Jacob Keller mentioned, this change enforces that a VF can never go 
above the maximum allowed value. However, there could still be other 
hardware-related restrictions.

Regarding the scenario you described, if the maximum is decreased to 2 
after VF1 has already added 4 filters, then the next time the user tries 
to add a new MAC address to VF1 (or to any VF that already has 2 or more 
MAC filters), they will see an error message in the kernel log:
  "Cannot add more MAC addresses: VF reached its maximum allowed limit 2"

I didn’t really consider the decreasing scenario, since this change is 
intended to be configured by the system administrator once, before 
setting up the VFs. If for some reason they decide to reduce the limit 
during the VF’s lifetime, I believe it’s the user’s responsibility to 
first remove the old MAC addresses and filters from the VF.


On 10/22/25 2:07 AM, Jakub Kicinski wrote:
> On Tue, 21 Oct 2025 13:39:27 -0700 Jacob Keller wrote:
>> On 10/20/2025 6:25 PM, Jakub Kicinski wrote:
>>> On Thu, 16 Oct 2025 23:08:31 -0700 Jacob Keller wrote:
>>>> - The configured value is a theoretical maximum. Hardware limits may
>>>>    still prevent additional MAC addresses from being added, even if the
>>>>    parameter allows it.
>>>
>>> Is "administrative policy" better than "theoretical max" ?
>>
>> That could be a bit more accurate.
>>
>>> Also -- should we be scanning the existing state to check if some VM
>>> hasn't violated the new setting and error or at least return a extack
>>> to the user to warn that the policy is not currently adhered to?
>>
>> My understanding here is that this enforces the VF to never go *above*
>> this value, but its possible some other hardware restriction (i.e. out
>> of filters) could prevent a VF from adding more filters even if the
>> value is set higher.
>>
>> Basically, this sets the maximum allowed number of filters, but doesn't
>> guarantee that many filters are actually available, at least on X710
>> where filters are a shared resource and we do not have a good mechanism
>> to coordinate across PFs to confirm how many have been made available or
>> reserved already. (Until firmware rejects adding a filter because
>> resources are capped)
>>
>> Thus, I don't think we need to scan to check anything here. VFs should
>> be unable to exceed this limit, and thats checked on filter add.
> 
> Sorry, just to be clear -- this comment is independent on the comment
> about "policy" vs "theoretical".
> 
> What if:
>   - max is set to 4
>   - VF 1 adds 4 filters
>   - (some time later) user asks to decrease max to 2
> 
> The devlink param is CMODE_RUNTIME so I'm assuming it can be tweaked
> at any point in time.
> 
> We probably don't want to prevent lowering the max as admin has no way
> to flush the filters. Either we don't let the knob be turned when SRIOV
> is enabled or we should warn if some VF has more filters than the new
> max?
> 

