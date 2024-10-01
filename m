Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C2A1C6F6C
	for <linux-doc@vger.kernel.org>; Tue,  1 Oct 2024 14:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727794219; cv=none; b=cPWI8LaagvCt026msL1jN3PXnwRBpQEZmS7qrVK9UF8g+hHWflCYu56lvSQseu4zWXgEf2EyLVdOvKe7sIr+T/6koUrNrAzdMyJ8yUlMs1BVfY9uWN1xo/BNSfYeceoFn2s5EQ5UU7+xlqA4ylrslOm5Apw+MJ/PPmH62tippJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727794219; c=relaxed/simple;
	bh=iD1cUDQCa4lYfSs+5B2cOqVtRkuOH/7Vjicb+whrYBg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=RT900TeUjDZ9uGciDN1uOF5TWlbYrRtB4prydSH2qX7dsnsCDG83YNldj3qssm6Z1LpywXXDDgqoZmwZHoFASF/veCOtanOWNMVrInAweD4PJBUVmBvtUFDI3+WCQ9zcoaI3bd4VQKfb9EtSQBDMULWI6c6wGlZkAAx9xr31PvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com; spf=pass smtp.mailfrom=6wind.com; dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b=IpF5+HgT; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=6wind.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b="IpF5+HgT"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-42cb1866c00so7361655e9.0
        for <linux-doc@vger.kernel.org>; Tue, 01 Oct 2024 07:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=6wind.com; s=google; t=1727794216; x=1728399016; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:to:subject:reply-to:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JyFqzGTIL/JydTQM9pGMPWQu+Jd+gnB7gRGMJk2LCAU=;
        b=IpF5+HgTELZfpKYGLoDZ5QuDezc+bICMUP6ugyYux5QEek8RU21SWJBZnbEj+lOCW0
         VtxFA8pgp/N7AOWVhtRP5J6hSFsBotxDSL7YkArITq81fhRWRc/yKF17gMcAS6VXCjMu
         gczOMHgXK4bh/jpclLfZ1BHc6mJZ8cSZPAp+ZA6mMG3M6GYiLHwDA7fN+9KAZV4Y13CJ
         GoCFmZDhYSlPstQ/HnWKz8D1KpVSwuCA0WuUeXeZ0E/BpUqowgR5hjz1bWVHx/7VBtr9
         jMvD5oyW/vu460YVgOsw4zGYMymT0tM9LsCcZ9BNNtPYW5NdOckPJI3f0EOjpQflMTT5
         0+Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727794216; x=1728399016;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:to:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JyFqzGTIL/JydTQM9pGMPWQu+Jd+gnB7gRGMJk2LCAU=;
        b=CNilZeICjmjqvOX5Xkq3bsLHWI2OAh0WIxnV34M6kR4rSFUPFG/jYiFYaX+8LiR17g
         zuz0gtEd02o/b8eMBOJls+cf1m8qNegyHJwFoqNKmFCs+8BLUWYO00YCirn6n20yOhHq
         sx85CDglIIaZr3X9Ax8YQTX45BDQkjETA8sTioJP6YjjFsfWHqWMFtfIcf9FZI0625Y9
         eiEV7QBARtzTmqUtT52LkdL/n9AnGNY0qgXa3b1OWgJHBJjT+VbG/gWi3fGaizUE1Acx
         UBjLVdcAoSjoxV3h7j9UearICu/7lAEm3a8WZ8Kfd58DlqHg7dwnViokRs2LLjItU7P7
         jDBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPB+5Imsq/4CkSVlBywa4IZSAdPf9nZc7Cuju4RiOvbZ5YFIXKW6Bbwk9yL9NRGgl6+dAg4nT6eoQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrfXGSmH3waYO4jZllaaWPJomooeTQEQDUewCWcnlo8QVa5q+g
	oGtiFzD9/edO5JbUSWK69Vp43AHAIvc20ujRVUj6zcleItEvwk0DhLuCntibmML9suNvVWxzVCu
	z
X-Google-Smtp-Source: AGHT+IEps5crVYH5i9gcfvEcU9NadY2mBtzYP43oONboxOVwHoj0syM/gmmWce359iQUnJVKfRyryg==
X-Received: by 2002:a05:600c:1d1f:b0:42c:b172:8c53 with SMTP id 5b1f17b1804b1-42f5e3ab824mr42049555e9.5.1727794215953;
        Tue, 01 Oct 2024 07:50:15 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:b41:c160:aa9d:4d55:f3bb:3405? ([2a01:e0a:b41:c160:aa9d:4d55:f3bb:3405])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f57e13a1dsm138081005e9.32.2024.10.01.07.50.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Oct 2024 07:50:15 -0700 (PDT)
Message-ID: <797edfa5-60f3-4440-9384-bb9037c60c74@6wind.com>
Date: Tue, 1 Oct 2024 16:50:14 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: nicolas.dichtel@6wind.com
Subject: Re: Doc on kernel.org
To: Jonathan Corbet <corbet@lwn.net>, linux-doc <linux-doc@vger.kernel.org>,
 netdev <netdev@vger.kernel.org>
References: <4d6edf70-57fb-43a1-bf15-330bd5f6405b@6wind.com>
 <877car7ulg.fsf@trenco.lwn.net>
From: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Content-Language: en-US
Organization: 6WIND
In-Reply-To: <877car7ulg.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Le 01/10/2024 à 16:42, Jonathan Corbet a écrit :
> Nicolas Dichtel <nicolas.dichtel@6wind.com> writes:
> 
>> Hello,
>>
>> I'm not sure to address the right people. I wonder if it's possible to remove
>> some obsolete docs from kernel.org.
>> For example, the ip-sysctl page exists in two versions: txt and rst, but the txt
>> version is obsolete (removed from the kernel tree 4 years ago, in v5.8):
>>
>> https://www.kernel.org/doc/Documentation/networking/ip-sysctl.txt
>> https://www.kernel.org/doc/Documentation/networking/ip-sysctl.rst
> 
> Everything under that URL is somewhat suspect, actually; the best thing
> to do is to look at https://docs.kernel.org/ instead.
> 
> I agree that it would be good to clean up that stuff, I can't do that
> directly, but I know who to talk to about it.

Thank you for your quick answer.
Yes, it would be great to clean this up, it's misleading :)


Regards,
Nicolas
