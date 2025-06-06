Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 173A881724
	for <linux-doc@vger.kernel.org>; Fri,  6 Jun 2025 10:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749204503; cv=none; b=taWGaF5s//QLSYTlXMpg3Cyp6v70h58FcnFbkVf1eWceaDK+MUjJyNzzu616lFJun/TIerSdKitSnoCILOWOhRhhyXwIVUMVRQdw1HWCkkIScDB2/+CgfZBHffQyGR2Bc1qNHDVbzavP/Kn7vv2JyeeKmew5OwBGpqC3XGJC7Ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749204503; c=relaxed/simple;
	bh=Cc2hhtVbrognDUA4dHscbGIkvIvhWbo4A2zJuCmcHmc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iOSu9z9fyaEpsoYEN6f2V/U1/mn7UOZmmj6JmqGh1Y58dUP2fwLGc1BbzAzxYf1gCHbQ/w3J+E9/TA+ZIxBV5peyOLeDROUjSX52NooUgk7IBZqE9SIhaGgICGpG8S6zWu+AXxxfkSvkWK3gFBrWMXAt3IYyHByVdqaEmae54ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JJ2KOH3q; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JJ2KOH3q"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a3798794d3so1525970f8f.1
        for <linux-doc@vger.kernel.org>; Fri, 06 Jun 2025 03:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749204500; x=1749809300; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZnhIji98pdILfcoo8q675wHcZijvn6IVzRCN7wYBesI=;
        b=JJ2KOH3qax7mkc2nESU9VTqU73JyzO3jSfryA8nbG1MY2m0x81UsDcQzPjFdMbILjD
         LR4y3W1MT/1hnjNppz9cSIpgQpkkyZlhH8KVlO9qiDM8hNUlkb9WNqZTY7zmFzNXBUwv
         c65TjdBQxXsJSg8hVNlBUCGB4KE50Yp/xz2axE0UZwVgdOeO68Tfm6kDkQyFpmjOB0+n
         H++Ywim+dbLbU4pTnDtzYRiliwyW/RGd+cEF7P8gH1uYNlX7dRF0gFiONTfkLnUAH6t/
         51u/R82sktONZQWue/wEARRXnbvHPZBEiC38jRoTH9ulWghd4sg6AkIS4+b826EhdTWb
         aWqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749204500; x=1749809300;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZnhIji98pdILfcoo8q675wHcZijvn6IVzRCN7wYBesI=;
        b=rt8CMK2krORSkddedyDjUGGMeuJVkmUwGw7T1zsMKc/7DQLNIwoALYGxiRI1AcOPx9
         3jPa3dN2vGQkJeWvv1Gh84z2Ca3de/dto2mA6wofJ50RRHaSQO2i0az5MMXd6f4TVbzr
         CtjpHLpNEi4BDHmFFBypbA6nidw+rESI9dbpM1CNnBAVWp+IswoVWj8sJtm2A8p3G0e6
         G7sM91IfK7TfRPIVx/T8EdOKv9SG1Q+cF3W3es/e+LsMdQsPpCpNOKI8t0etoxtZcUdm
         J7euviuN0+vA+RyD/d7zWuZTQaQ3GZvoxYEc0OcHnu22qN02syuxnojU/pmt8btjLuHQ
         I8xg==
X-Forwarded-Encrypted: i=1; AJvYcCXPXAu5p7AcHsr1oKp1AIUxltAx80ZyxIpASPijqt2hV4RXkU5wkRy3T9vnNe9jClZZwGFaT6qQZ5s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3CI5v6LhFUtF5j3Bq91DEZSMw3wH7gpPMeDNoBlZOVSSV/iQQ
	/GmCXkybSCwIvSB37NJpzDsf9dcqZflhwXmAm0ZV7wpGBLMvNi4eQdXV
X-Gm-Gg: ASbGncv0FabfeK1mxPDRhn7DzOA2ch5SnLWuLJzjnuTFeO/JgM0p/qHmsN2UllHKri0
	VDJ40BZB0lFxPls3jb4/bRBs9WSoBczBMzpalJErFCNfLtOkmm8yIHStA8HSnaksIxkX34Nhkw1
	OKzc9O8KprcfyJQ4bzP/4oIls4hdu0vxb1wCtefy3WulcfxirEw3NPmx0Xtzq8vGU7tOd9OhkAR
	MsEtFpgVRU5FgLp4PRrO2UYPOPFV9l2skXVwLixevSOvDnKfnJSSBTZrhC4pwZdOBEUYKiXf7Yy
	rsq/Gb1bditpEAlRJf3lz8glNXWDJQDpwtsVKXmdUPreHyOTPjJNihfVbwOMQXdEzaXE3PtYDQ=
	=
X-Google-Smtp-Source: AGHT+IEfssSBLVx09MlbodaaB8hFaIgYtYZ4NyyQLXSS6aU5osZvdD2hThE9Qqg9Jze2AC+1zhDE3Q==
X-Received: by 2002:a05:6000:2088:b0:3a4:d64a:3df6 with SMTP id ffacd0b85a97d-3a5319b1ab1mr2076931f8f.3.1749204499997;
        Fri, 06 Jun 2025 03:08:19 -0700 (PDT)
Received: from [192.168.1.3] ([41.232.132.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53229dc33sm1388298f8f.20.2025.06.06.03.08.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jun 2025 03:08:19 -0700 (PDT)
Message-ID: <349ce2b7-0439-43ff-abe8-aed275f28411@gmail.com>
Date: Fri, 6 Jun 2025 13:08:18 +0300
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation: Fix spelling mistake.
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: David Vernet <void@manifault.com>, Alexei Starovoitov <ast@kernel.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250605230726.181272-1-eslam.medhat1993@gmail.com>
 <CAADnVQKW0n8pGKUzUdNgNtjK09XKe+g=cpihdBzFawuy8ZkFPQ@mail.gmail.com>
Content-Language: en-US
From: Eslam Khafagy <eslam.medhat1993@gmail.com>
In-Reply-To: <CAADnVQKW0n8pGKUzUdNgNtjK09XKe+g=cpihdBzFawuy8ZkFPQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 6/6/25 03:56, Alexei Starovoitov wrote:
> On Thu, Jun 5, 2025 at 4:07 PM Eslam Khafagy <eslam.medhat1993@gmail.com> wrote:
>> Fix typo "desination => destination"
>> in file
>> Documentation/bpf/standardization/instruction-set.rst
>>
>> Signed-off-by: Eslam Khafagy <eslam.medhat1993@gmail.com>
>> ---
>>   Documentation/bpf/standardization/instruction-set.rst | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
> Please resend with [PATCH bpf-next] subject and cc bpf@vger.
>
> pw-bot: cr
Thanks for the feedback.
resent
