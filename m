Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7928234C981
	for <linux-doc@vger.kernel.org>; Thu, 18 Jun 2026 23:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781824341; cv=none; b=SBt07NHEIodEENy+m+6V0yJnotH3tSwMeGhDI5L1DuhluiROukVYbBhqXyLp3btXX4w2OBMytYg09dBgNdTKoglsy8NPvsowyC1OEMnJx6gKd4tkonTZFr/MAVHyWW/Ip6G5FmyW4JWNItOWZFUpDZsdGQmYHbgR9Eo93kAdqbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781824341; c=relaxed/simple;
	bh=Rb3Y//Sre39/nyDeLBoFOg1YSjOfc4f0txYFimZDY3Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m3ZTUwShhKEIinFSXqT4/FZq+gfOAtsJhBW2vaWE9IrP0XEj45K/3JC8fAxQ7vIBdfWgdfb9mS8XEkhNa5/K3eFvguE9yDprltZxNkufxUggUDwNtgg5ujDy2zeCpbm7aVLjGHp0RGCjF7LFhoeECInw9GJzfkBIchtG/Ju7J4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=EAaa5iv+; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="EAaa5iv+"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-69d7cdd3b8eso715138eaf.2
        for <linux-doc@vger.kernel.org>; Thu, 18 Jun 2026 16:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1781824339; x=1782429139; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZF2qOydljuKl+xI08v46srAj3OTtgmDQPahr/mcPXfI=;
        b=EAaa5iv+aDeyQcI1EGD6mRTqnTy5KwjR5ojBEBJnsDbgvwJ9JlGgcp7nLU6L8fA9fc
         dzyeLGkJs7tAmCdlFvxFzN6x32Pg4yjNR05UTrwUu/3wgGiWk24HI3AbRTmE+jKwJ5kW
         wN/nuAplUrMKsPOgXIieUUOseaJ1VlRMATraM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781824339; x=1782429139;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZF2qOydljuKl+xI08v46srAj3OTtgmDQPahr/mcPXfI=;
        b=cXRNCxQdgmL+qTDNEGqKRQaxnrdU79xxCIrJuehGttWhU9ceAGgoB57Tqqvrcua+eh
         FHofoN5bMWXMzP0qe7NAR6eqbL/urG/4nJ6xfskGeJLtL4GvK3enc67T+PF1har450oR
         IK9mPbv9JEj0EOWG9xKDVYu1u/t+9/L2u8KusUZR/MTz0vZxwuO8mf7jv3YWu2hN1rjy
         QgcnWf3lLTF/q8j0J2tYVfZlX6B4U6TLoQIB4Qyyb1u6wpOcEOplK6MQ5kFtQdE+gcwo
         1Aqv1FvzNB1F/Oa9EBcEGWtGnaSteshJLnYpUuaJMcTlGSXHWPImAXMLIkYJZDiqwXrf
         er4Q==
X-Forwarded-Encrypted: i=1; AFNElJ8KpHOYvdE3949qLWh1bLZ+KecgLItWrCTedOM8Icce5yX5mjSlAtauewn6VMew5vIFpTu/WtWTFD4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYV1yAqacGtYrFObV3+SG5V8vQ/UJ4HXL/LPxQnIymDQpohKSn
	fPIQeeiuSjgmI49VFtPHYRvnRlTJ3QXyWCLoPEiis7DyIbMTLAvbmHLxfcMD4Bi9pXU=
X-Gm-Gg: AfdE7cnKZ6kBMv4H7B5qIuGEPYDVsAf01kH7s2CPnUy+obYMT9DTxPM9DAbqz2y6mPt
	R8syAb2JQXNWiVnd5qq/pk7G19mb7n/TZu2q+K3PuLVz3s+IK5MklCm9Na7uAC1uHAGrzM3e8Lv
	DkVpUqrXdop/Y+/WmiTV+6IsOzH12JkHYc5udtS4BbugmdHYfcvwxT8a2hnY4QLYyZM6OZBKNIa
	fKwJl+BjpVwdy730sPL1eLELt7u8Dw9KAxaydrkazcAR/R7nfM2R+kppBM+WoVjDWzLRQ0zLEOM
	5egCo1VFJyWsskuH7QOu78nI+TIYfDtiwU0iCj2tOjMg5HjMcGWTGsEN2TsNPpJIWVtxrX01SLm
	A453QcHvb+yWw7nYBQRqU9EI2efEN9ULWxmnP343Ysq5JG5LX2H8/mPdILEFQ4as6CNKFUnKJy1
	X1UVEx3JEOqj3yQ4guzMtl
X-Received: by 2002:a05:6820:4b04:b0:69d:513e:1a41 with SMTP id 006d021491bc7-6a0d89bc335mr1222609eaf.50.1781824339435;
        Thu, 18 Jun 2026 16:12:19 -0700 (PDT)
Received: from [192.168.1.14] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a0d9040c7bsm652846eaf.11.2026.06.18.16.12.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 16:12:18 -0700 (PDT)
Message-ID: <86e7cb01-fb00-4954-a44a-8c10bef0b23b@linuxfoundation.org>
Date: Thu, 18 Jun 2026 17:12:17 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kselftest docs: remove reference to obsolete/archived
 wiki
To: Brett Sheffield <bacs@librecast.net>
Cc: Rafael Passos <rafael@rcpassos.me>, shuah@kernel.org, corbet@lwn.net,
 linux-kselftest@vger.kernel.org, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <ajOvQKne74gN-7Y2@karahi.librecast.net>
 <1306d609-3375-4f52-8239-b4c2fffb7bec@linuxfoundation.org>
 <ajQ1iGNw2lf_ZHqp@karahi.librecast.net>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <ajQ1iGNw2lf_ZHqp@karahi.librecast.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/18/26 12:14, Brett Sheffield wrote:
> On 2026-06-18 11:02, Shuah Khan wrote:
>> My apologies  for not taking your patch earlier. Considering the effort
>> you put in with a re-sending the patch and following up here, it is
>> only fair for me to take yours instead. Hope it will apply cleanly on
>> top of kselftest-next
>>
>> Rafael, I am going to take Brett;s patch instead of yours.
>>
>> Apologies to both of you for the mix up.
> 
> Thanks Shuah & no worries.
> 
> 

Your patch in now in linux-kselftest next for my next pr 7.2-rc1

thanks,
-- Shuah
