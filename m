Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3CA21E098
	for <linux-doc@vger.kernel.org>; Thu,  9 Jul 2026 14:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783608289; cv=none; b=kaytyYHe238LrCvTxn0bG2A2XfVdb2RLeCe9PskDuWNkFg+jZc7UTeudmbKjfG72p+yESLLfrYCRPucsuPbrU2SyonpEZ0HTKcNCx4TDCaKUbScPJLIMmMqefeoj5YiMBOqyorhoENBl29wKedayWfBGCwAsBNvK/0ce46GUoLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783608289; c=relaxed/simple;
	bh=AdowjauPUKaDM6MefVWEtONHMPR2wUT3EFgFmxVrkts=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hTDJJdsWn0JKmQqn3o6ki8XA5tfubWHsNNsvCV98NiQGyjXCakuI2EDMs4CKJXA4Z1nGrJgo5GvoIFbc393d0FLT/WbSoBTFGBOpfOXaJSC0Oslr7aW3ia6Zw0rItrb/hN2EDE3CrJrD9euzVITHIF5G+ZMcZtwlYuXzDxngQHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nJ/QFxkZ; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nJ/QFxkZ"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8485fad302bso571820b3a.3
        for <linux-doc@vger.kernel.org>; Thu, 09 Jul 2026 07:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783608288; x=1784213088; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KmOhgvWF8j7uZmBx/HKVY3XovKSrmrusSaRmBu+ZZEM=;
        b=nJ/QFxkZy8eFs0+tbdo42uIOGgKj3ovJ2vtmkqnB7TF468yyTJMzTTeJzifBikdeQe
         wYyrUe9HACM3/pQ8TkU9t/29VvndaNHnqHl7tiQnVxBUU7WmgDjqKn8hzbsJAFqBEA1s
         59iRrqyJJ1tEpARheBT3sCdXqzyoNbR6bgpL5F645vd6qiDNz9vIYBUfg1NwRyZMi7Dq
         xPkNI2pN6Btzzbh8pmCMEea0WPX+4JznGNQluxDEams3BstFrI9YFyE/WUL/5i/bAXEt
         VCtrHBw/6y3GX8TtbbO5jXfxTkOJ5zRXXiegSMMKd61XB3aAoEILZfHnDwJro0oIJrhF
         bZ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783608288; x=1784213088;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KmOhgvWF8j7uZmBx/HKVY3XovKSrmrusSaRmBu+ZZEM=;
        b=Gbf8hGCpFpqQYdLCw388/klsvkzmyXdEw/KO6DEpWmgqoHkXcEXwFMvSc8SdcM6b0c
         1WFOFFBUnAgkZPU8EL10etSWV7yq+fhzcofIoPv9RD+RYgNSYryDjZEAJ//8VeF4AVOo
         u+SNdat1KLqjKdzobU6Q36RIducjQtkIg2Y2aX9uThP8glCx7Ru29Eu98bAVLpFJL2U6
         zwn/jSSzQvCr/7/ruqKdL32U+xebS6X0Z7s9oolCXZUOovE6bIZF4t99csM91E4hjIl3
         beYTJHSYA9L4Y70FFQW6MtU5MFISlN3bkSBvc8pg7ZRpLUyyuec+ys4wZEhqjRxhVX8O
         kHyw==
X-Forwarded-Encrypted: i=1; AHgh+RpC0B1r3zas2yrojMMLllhEm36kTuzM/qLCX2WDBRUJxSuRKBMPWz8KubghInkGp7qidJALIsoBPUg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZcVyvjX/mrr43tA/SbfkJeu+mCo3LcP0Ou0tsTHWy6/RjuKQB
	2yuG5hCWS5WUn7W/4MZSv+7Y5/Ij8+zlYBKxzJc/EWiT0D0pm6IKwp50
X-Gm-Gg: AfdE7ckPqtE7x8erz1uhBCKW8RkKrSfdC9JuAN6pHKg1OqjuN6T8O25aA/1eG7zgyIb
	AwxS6YRSHeWlpyHOumFKz8jrW4a02QGiUU3Qk57dY++ZM7Wkii8+OSYlnBy2p1zYUfd9FyDLpMZ
	QGi7bSXTL5erLGT/7iVGT7NtLWdd/3CqIkhOvoFmo+RfsdmJE+ahoTbMB0w6CP2mwdzFV67PxQf
	3RkOhTu6MWZEaRak7NDK163F/1Fvpv481n07DvxawWEoLkzSHfM8A9BjsexhshyvC/XA+9IN9O0
	hSAM5Sbj9hYvoMiOGJWY7eKsq8fI+Eke1cVeBIuS2j0oe7orH07b5Jc66H+VL5U/PuczluBvBEV
	wKVqfSrm6FqRvgu4kvEGsu1BqrGTaC8PTEiIp1HBMQmEimjXt5yPzNo+nQk8uxQPvzxRc0itliN
	VLvGmS9KJWJ4xp3g/nHtZ3vWgu7SZQ51ArHWj4YNlq69+qa3qjK6Ezm7PMKQ==
X-Received: by 2002:a05:6a00:9151:b0:848:4faa:480b with SMTP id d2e1a72fcca58-8484faa4bf0mr4471371b3a.12.1783608287807;
        Thu, 09 Jul 2026 07:44:47 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84866764f67sm612612b3a.21.2026.07.09.07.44.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 07:44:47 -0700 (PDT)
Message-ID: <45664250-b2d1-4dcb-83ca-e76d319c9cdb@gmail.com>
Date: Thu, 9 Jul 2026 23:44:43 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next] docs: submitting-patches: Fix section structure
 around DCO
To: weibu@redadmin.org
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org
References: <5f320260-5cb0-42cc-949a-c92404124618@gmail.com>
 <1bf78dca-1651-4173-938c-d76b3c8db229@infradead.org>
 <e942938989f17a884019324412d33031@redadmin.org>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <e942938989f17a884019324412d33031@redadmin.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On Thu, 09 Jul 2026 19:34:15 +0900, weibu@redadmin.org wrote:
> Maybe it would be better to send this as a follow-up patch after
> the original patch is merged, to avoid unnecessary churn.

What do you mean by "the original patch"?

Confused ...

Thanks, Akira

> 
> Thanks,
> Akiyoshi Kurita
[...]

