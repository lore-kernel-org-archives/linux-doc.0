Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5867112E1CD
	for <linux-doc@vger.kernel.org>; Wed,  7 Aug 2024 16:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723048571; cv=none; b=a7dVwIiflzPKJqmW3PNdfdpAjIqonPZhoeq1Vpzyu/6oxsVc/Ouvd4rTO4Q7UDcC7hS/HjF54oelXaJptm6HJTrjM/BOURIHbXuRHuURT3QSU+IOGYC1LF9PqsOm4Xi5xcK8QDN561Qq++anobgMLyN/B8ajx4G1DpFc9cDgEmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723048571; c=relaxed/simple;
	bh=/UUFPXwduSwOc2ctYJXT9XVb3pkCQoON/rgnDJ8c5JM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mP6PyB7sQgsuRckZ07SXA0PUqyOGJ/E0T2FWpJwVFmd/b+EwAvpPWR4JYXpfTaK3ExtSe6K8h7GBBTl6xKWm0ti7SiC3w4s0Q25AY8I29imcguHNpi2fQ8Vl0V4D9lIlJBrKOtdF7p/WcBOKGaYDGzJdxXOJ1fLKG+5ch+bbiW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=OZmSZ7ms; arc=none smtp.client-ip=209.85.166.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="OZmSZ7ms"
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-3748ec0cae2so25245ab.3
        for <linux-doc@vger.kernel.org>; Wed, 07 Aug 2024 09:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1723048569; x=1723653369; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=49l+wVm5TMHoomacz0eHsSWfYb1l2BtYnXda9lBCRRw=;
        b=OZmSZ7msSjm9CYdHNP8uY2K0lAVPtx2e9mMzRAxkVYqVtJ0HuM/TgoHoRsCAfrF2AU
         LsmJBahD6fhNf8t6OFnuDd/+PQuknm+KSoIr4vqDKyJddSQTV8kSNa9hkqIY2eN7vRHv
         hSYuKPpRgYEp71s9kfdyj3hxpe3xHs4+MJyio=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723048569; x=1723653369;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=49l+wVm5TMHoomacz0eHsSWfYb1l2BtYnXda9lBCRRw=;
        b=Jg2JZfuZmahZc6/ryVIPvUGIZwBybmDVUdpCVpqTgAF7bMNBqd7trHsLZTERVnTZPi
         jEKbwXDzanxWtRNsYnApnsXAA6KU0t9nE1jqdr7CpQHjhu8+RgLCwYAB7vh91zTOb20g
         aLD+sH8C3yam1pK4RE7jFycr1yg9l8UvHtjjKs/PHsCCQjaToOEBIV6D3x9c3AnQus2X
         vVw0yQaAnppV8kijvqoYH/RB3+SGiJRwywZY4tVADjnsbEFHAGqoBLWvbgjOT7qd+cYc
         2aImZkMJVgqoLlkGRZGgDMAVt/4hpAPx27RNojkSjJysletnqDEW5Fk2j862CzdjCqEd
         tb2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUZj5qU2rXyIA4zrtiKK8YMWuU9+0rlu2j5x7atFHJejxLdCbv9T9Pynin4DMSSd3AnMtumdnNJDfs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5TEWa2OkXYNzQCeqPnVa/SZxxY+XD22V5kVsK7u/9yNpqxWq+
	eFunVYncgxPFHVnBwQw9VL0X0Y+JZRKlYvhadJPt+uVaQcde8ZwTDtWz5yJLozh4PKBgAr37BZ7
	l
X-Google-Smtp-Source: AGHT+IGmjuKcPN/Nvy++qhdeQDPhh3wVg0WvCfy0F9oBE+EJcQpcvJ/N2Pphu2v/nHTGSA4TNiY5xA==
X-Received: by 2002:a05:6602:4613:b0:81f:86e1:5a84 with SMTP id ca18e2360f4ac-81fd43981demr1306498339f.2.1723048569367;
        Wed, 07 Aug 2024 09:36:09 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4c8d69a8294sm2882174173.45.2024.08.07.09.36.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Aug 2024 09:36:09 -0700 (PDT)
Message-ID: <a4ad0239-b296-4204-85f4-a3e8cdbd9c9d@linuxfoundation.org>
Date: Wed, 7 Aug 2024 10:36:08 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Fix a spelling error in a doc of bcachefs
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Xiaxi Shen <shenxiaxi26@gmail.com>, corbet@lwn.net,
 javier.carrasco.cruz@gmail.com,
 "open list:BCACHEFS" <linux-bcachefs@vger.kernel.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20240807071005.16329-1-shenxiaxi26@gmail.com>
 <2dfa76a7-eeae-4b05-bfcd-684ae7ade963@linuxfoundation.org>
 <bdws7d7askhlctcwfgwieml56dr4vqjuvi7bavwkldjdcuzk3u@cbneggmx2w2b>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <bdws7d7askhlctcwfgwieml56dr4vqjuvi7bavwkldjdcuzk3u@cbneggmx2w2b>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/7/24 10:06, Kent Overstreet wrote:
> On Wed, Aug 07, 2024 at 09:42:12AM GMT, Shuah Khan wrote:
>> On 8/7/24 01:10, Xiaxi Shen wrote:
>>
>> Missing commit message --
> 
> I wasn't going to commit this, because I don't like taking patches that
> do nothing more than fix spelling, but since it in fact does not need a
> commit message for something so trivial I am applying it.

Sure. Your preference.

I don't accept patches without commit message even if it is trivial.

thanks,
-- Shuah



