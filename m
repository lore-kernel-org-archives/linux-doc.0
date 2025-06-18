Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F0AF21B196
	for <linux-doc@vger.kernel.org>; Wed, 18 Jun 2025 20:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750279476; cv=none; b=NKmdV2awwjt3L4BloHI1zolRhp57SekoXq7l+IN/DVrVVr4ZnQ2ijP6JBaiiFRZEcCY1n7fTIhqg24ZdAJCrJbk/QSWNGP3ozT8t/DqYctACA1lTcf4txae1xBJzLKbEa+kPTCgFOSwJmjf+12gjvgupwin+BsadEefw2HI9NIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750279476; c=relaxed/simple;
	bh=A5V77MHGHxoltQ9oWQNW08wwJlpbGRsTMYBy4qGK4RU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E06Mn6M2lRvGc/L81bHIU+vlsyqdiDZHdlYbIp/+4O5V2WtK8GnCef4/SaqAsN5s5JjmFzpa3uGaEmMWcAHzgwCwv5jDKGEmsINPsdrhi2e4T7sEFeSETts4IrHyALtpViWrSpbp69KEPUyo3e2gDncy09x4aP67aL0T/HSMdFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=AY1XhNaW; arc=none smtp.client-ip=209.85.166.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="AY1XhNaW"
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-875ce3c8e24so1023439f.1
        for <linux-doc@vger.kernel.org>; Wed, 18 Jun 2025 13:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1750279474; x=1750884274; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2Ako2fd6NKJ2bP6NpCy5kPqjwnh1toCTc4fAZAJEcDU=;
        b=AY1XhNaWuQwWdpKSLvQcIueK6FNokFmknlm91FFd3DBoinj0SGleoshhpPClXqi+vS
         XQlIYccEx3eD4V6dE/J2wxr+gjQzXEVEwELObGreW4vQphyefDA0Cu/tkrI8pdkY157b
         A5gJvMNsttfuL0dRppQsD7aa5FJGdzorV3hR4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750279474; x=1750884274;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2Ako2fd6NKJ2bP6NpCy5kPqjwnh1toCTc4fAZAJEcDU=;
        b=KPJ2eDn7bOQJLkyKVR9KQ2RUPiZIRSQLapc0W5UFWLyJwEk/gT0S0HibCrp9VXbDYk
         Av0jECMWzzH3EXhFRU0P4ZwSH7UkqwGOCCtqSFNf7sA3hxxqSh7Bxo0B5hD/rNvTJSIZ
         HukB3Jy5ZOijIdd4eQ4VN8J9idSGtS0/9cQ33Vlx0DYQgfMn0CEqtL5e3RpIl7IG6eoF
         1nIyB6R6vsgkKvWUXr0NX1a9Q8rFNU37BhfwD/ojAPrALdRw2Iuk0a688cdhN0dI2Xe7
         aNuRwQ3F+GQPt9eRsev7BvafhndKo8lsZjA5xTRRwUe+XiI1qJEyaf2faI8oIS/iWJ+k
         N/rQ==
X-Forwarded-Encrypted: i=1; AJvYcCW21pO3oHZv0vTaBEfDYyrTcy9qLF36nwvZMhh1vsw6QiHwrHYQuxOUEpaXFB+9WXF0TpVe8BfLV0U=@vger.kernel.org
X-Gm-Message-State: AOJu0YytYoTQhZklk1Ro8GnMLFLkNwtUIdS9NkAdbTHcMK3IDUcFxtaI
	z20pri1e5gHDJ3OOgBf9s0wMqrOtiWnxA5jXillV/0vcumRTGVit3fToFVECQf/1hbw=
X-Gm-Gg: ASbGncuxNwN9byocMqGy6NrJ/kwdutznVO2qQhx8B4KEZSanh+2na6DHv17C7wmoi98
	MpW6R+I1gtu1I1pl2ZWIFbyQ7vVnDutOwGJCl+/5X8SWYSC/lQMnNQNbTQl088sG9pnPVNAfDHo
	xSyPWHsk7D9pz0kNSiVqHW5WIinUa+qyE6aa1N0vrGpFd/hSJ1RnsA7cUw/0zzCKrQyMOX9DKwc
	RUC/Y2ugxPyY/M3Apcb4uLGKZEbUuWIOMy3fJzSmA2UNpfk6MDkD+waBzws/C1dYdINVKYimXWQ
	EsC6l/VDD8zs6PsE2eEyv8GZhdIhQbVsRj7Fa5uAJDowXC3VyXqv0wYLnrtzaakOYXrJ6iGVNA=
	=
X-Google-Smtp-Source: AGHT+IGBjo9SKc7leBQCMa8Hw77h+nyuKDNR2sMTMdtJdYEON8VxYPtAlm1helcS8akEtiF6cPaOoQ==
X-Received: by 2002:a05:6602:1612:b0:861:6f49:626 with SMTP id ca18e2360f4ac-875ded13886mr2529017139f.6.1750279474117;
        Wed, 18 Jun 2025 13:44:34 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-875d582dec6sm278667939f.33.2025.06.18.13.44.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 13:44:33 -0700 (PDT)
Message-ID: <34f6b974-7fb1-444a-861a-4bdb458eca53@linuxfoundation.org>
Date: Wed, 18 Jun 2025 14:44:32 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs: ABI: Fix "diasble" to "disable"
To: Sumanth Gavini <sumanth.gavini@yahoo.com>
Cc: arjan@linux.intel.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux@dominikbrodowski.net, rjw@rjwysocki.net, stern@rowland.harvard.edu
References: <20250523220238.455718-1-sumanth.gavini@yahoo.com>
 <20250611215306.2989590-1-sumanth.gavini@yahoo.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250611215306.2989590-1-sumanth.gavini@yahoo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/11/25 15:53, Sumanth Gavini wrote:
> Hi Shuah,
> 
> Just following up on my patch submitted on 2025-05-23 22:02  with subject "[[PATCH v2] docs: ABI: Fix "diasble" to "disable"]".
> 
> Original message: https://lore.kernel.org/all/20250523220238.455718-1-sumanth.gavini@yahoo.com/

> Would you have any feedback on this change? I'd be happy to address any comments or concerns.
> 
> Thank you for your time and consideration.
> 

Sumanth,

I am not the maintainer for this. Hope you have the right
people on the thread to review and accept the patch.

thanks,
-- Shuah

