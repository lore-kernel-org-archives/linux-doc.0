Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5748E1741C7
	for <linux-doc@vger.kernel.org>; Fri, 12 Jul 2024 15:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720798931; cv=none; b=KgfSXhtengqJ2DhB47yrYOPkfyyRIytAIiobJGmM63JgwhYOFSFg57oHe44z4IDNcsFp0ORKcx2EmHkzLcDbKjd7VqR/K/rt1TiqPKkWx4uW/wkWh6TtschZfNEFHOp6c6AM8kDFaqzUShar/qHbPj8wKm9aqSilFE14YlJT5II=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720798931; c=relaxed/simple;
	bh=PerLQsGPOdcki+rb2BaRmqqQZG5Ep3UsYnanpIb/RXM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HvQ08puXkxZUWcOcHs24HuZxWLsTLD43RzXmyHFTH2WqHdCQMqvqnpzxg92xDs4Uhn2gpfTcNSvU2a58a4lOOe6mByPYKypN/91xajUyKB9SSWOG6EqtBRDqgmnyEf73qyieRYsHAJ6U/X/dkkPmBv35Zsuo8oPlFUJgn21nQIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Pk8sEcrY; arc=none smtp.client-ip=209.85.166.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Pk8sEcrY"
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-375df7da74cso1112725ab.1
        for <linux-doc@vger.kernel.org>; Fri, 12 Jul 2024 08:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1720798928; x=1721403728; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cjkN5xvRxpA+4//2McOOt0YG0g1G/uYU5qxby58CkC4=;
        b=Pk8sEcrY3wV4yMwjMuSdAXEfi5DkqI/SWJrQ5QSmZDcJDdvY0paQdliWdpTYDplZGB
         70T4SZ1agdtM5TCa7C1qVQJu+WdYaA46rjbOx+CFhaZ/XqS94hA/V4Tk1Q88Dtn8njUW
         X3BrL2faT2FqG9ypWagkmOe7RcecVgFbcjVMA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720798928; x=1721403728;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cjkN5xvRxpA+4//2McOOt0YG0g1G/uYU5qxby58CkC4=;
        b=InnftneJ7Egk5+4R8QPs9D3uM2+xi71vMBfArnu+9/PUoS8sqlqX0jhR0f0ksnj5nr
         /le0t/aE2CFyPEeBEbYgPNP2v2pp+TaS3fyO8Nid5PmydqCIwKNh5JKJtu7YEww/CjxY
         6ivBWWJirUcO8mRI08NygfbXzcStdIcBuiU7nnZ2xNQNmgzko5MGJhXp30cHRl2by7PU
         /sPuL8lgYyVo6CyKFSg1aEIjfL/+/gaoxOlS3A/dpu+gvo+Mng4u9mS2uEIS6GGOGg5O
         AwGWh9nHaUHIwc0CRmQrN5bNXYNQBMtzweiycKRHbra7+LI0ZDVePemhIV+TD3O8ugHW
         bmIA==
X-Forwarded-Encrypted: i=1; AJvYcCX0H6m2RASxSwc+IUEcNv+tlGk6q8jhyB7/UDxnUIGmLqefONjQQs4gG5xoIFQbWpTcZj3p+JM6q2pNp6TM+B7E/w0fzTWXm6l4
X-Gm-Message-State: AOJu0YzX9vABUojyqiojlTynx0O58fi5B+TsUy6j3a+/qf8oFaZYKRgB
	HEiIJkcTZ4wptO5nw9OrXrNrvcJSRmpjTwgwac2j/9Z2XY5KgKv3sA+8TXFZU+Q=
X-Google-Smtp-Source: AGHT+IF2tvOoxiKqghI/PPmQklZQCJjZvrhtFAoLzyGcPRDRiTKTeFnjG27jQywyvWPycFPKhSSoSg==
X-Received: by 2002:a05:6602:737:b0:80a:4582:be31 with SMTP id ca18e2360f4ac-80a4582be67mr160405139f.3.1720798928396;
        Fri, 12 Jul 2024 08:42:08 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4c0b1af8229sm2481237173.7.2024.07.12.08.42.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jul 2024 08:42:08 -0700 (PDT)
Message-ID: <1a30aea2-e8e4-487d-81e4-dda5c1e8665e@linuxfoundation.org>
Date: Fri, 12 Jul 2024 09:42:07 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: maintainer: discourage taking conversations
 off-list
To: Mark Brown <broonie@kernel.org>, Jakub Kicinski <kuba@kernel.org>
Cc: corbet@lwn.net, workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20240712144903.392284-1-kuba@kernel.org>
 <7570937c-ead6-40bc-b17f-4ade34a2acf6@sirena.org.uk>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <7570937c-ead6-40bc-b17f-4ade34a2acf6@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/12/24 09:25, Mark Brown wrote:
> On Fri, Jul 12, 2024 at 07:49:03AM -0700, Jakub Kicinski wrote:
> 
>> +Open development
>> +----------------
>> +
>> +Discussions about user reported issues, and development of new code
>> +should be conducted in a manner typical for the larger subsystem.
>> +It is common for development within a single company to be conducted
>> +behind closed doors. However, maintainers must not redirect discussions
>> +and development related to the upstream code from the upstream mailing lists
>> +to closed forums or private conversations. Reasonable exceptions to this
>> +guidance include discussions about security related issues.
> 
> Reviewed-by: Mark Brown <broonie@kernel.org>
> 
> I do think it's fine for people to have open places like github as an
> option as well, so long as they're optional for contributors and things
> pass through the lists in a normal fashion at some point.  Directing
> people towards existing relevant discussions/reviews can work well.  The
> main issues are taking things out of all visibility and blocking
> contributors.

+1 It is important to point out the prior open conversations if any
that took place when patches go through reviews on kernel mailing
lists. This is the practice for the most part for work stemming from
discussions at conferences such as LPC.

Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah
