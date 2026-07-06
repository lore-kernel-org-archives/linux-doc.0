Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10A6A13B7A3
	for <linux-doc@vger.kernel.org>; Mon,  6 Jul 2026 03:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783309922; cv=none; b=iAEu6VbRpshNKTo+Y3hPuMM1q2bgW4y1Onhc/4QxWMEiBngrcUBzscXMW8y/Q9ndxUY4Z4UFHGZxW1yCClNyvNbvF1KOC0DAlxssth9e1n+i/p+jks72epgTaxCkhMbS0USFP8wztMvbm2fpGaaQEo7XbwGGVfk1AG2d3XLIFWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783309922; c=relaxed/simple;
	bh=tbT6LA2EzO8/bVSMdY5KbNbdbbdZ/LoX3mzR939bYzM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZmnXk3Sw1ISLat8mEIiZAsEW+Bpoj7jRp1Lenwm2HZNazr6mbDmyQW3zuaDs/oP5gXuU25Eu3BlqgIIdJQwuOzPkWFekL4xLAooYd/x6G/ejl+2gu7pi7ZmS9ksMqlRFjvl8SPMJoSbURpcewxSQ7NFmBLVB3hJrnAFMjxi3vns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mwK2hdw0; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mwK2hdw0"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2cc891373e0so5849335ad.2
        for <linux-doc@vger.kernel.org>; Sun, 05 Jul 2026 20:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783309920; x=1783914720; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c/2hIGD6u2twTzuPmXPfOFFoHUmuJFfDxo8HGJg3xH4=;
        b=mwK2hdw01BaWxNwhYg+HgCqGtsWnXVA11/kWuSOM8TvZe0BxwBPh+lWsqjOSDk8ldi
         hE3Z61GGZE+Y/EEk7M008XAiRjYtrSDmKdKgwOAH51GvZ9DbMLCYqQ4KcejmGHG5FPSI
         Ki5dpLLvYSr01qQORmT3RqpOdlEacevPdrI7ezFcI6pjBm2oeo9UiAItXmJFy2oMUkbE
         IjF8R3hrFuGkSmtCvEWmAhk1OHsMBkw01r4a9OIROc0l30zRCpGzLl0jtZg3ofn9tLFQ
         r1tGHSH+BmCQh5nLBs6PLV5S/KLojf+ZdNX0DbS5ZE6DfB1NDD6knm2TVtmS4XZvEMmY
         0bqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783309920; x=1783914720;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c/2hIGD6u2twTzuPmXPfOFFoHUmuJFfDxo8HGJg3xH4=;
        b=QtUYGr8JkZ89auPx5d2z+aPjF//SjYDfAOxzj/mcjOblwlyN28J8/aNAXLwIAyeAAb
         RJBfAfydKcXG7KKv0D58BsrmoMEdFmavlwMZcgMSSujsd8b8zNpWpipRWRb4bfErJFkO
         f0s5+Xf8MmOD5da5JrTieu0sLBwOzDNxYi0iE3qLkBWRTujLrANyw5DDb21twYwRbDux
         sFUtZK+iEV6s8CHx9xWE135STYqbMVYUyaqauM/gBhuGHXHkdCvFyI3TY290mX5Yb7bj
         EBtZU66jsarnKx6lXgnIgmQj++KQBck7jSSGTAE8jzahyzOsRaPyIHo5CofgmIWwe6JR
         lwxw==
X-Forwarded-Encrypted: i=1; AHgh+RpYwiBBItYNQK12aufSQsY/o/ca7FIFWwJj7jLKUzkdVhKf7o9WH9GNa9ALVsNf8gvMwzw/v7aHdDo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwO8XFTkenDjdkhiC2RZjNJhxxjkvGj796zqP/xtES0/DXUtlwk
	RXmRhxObT5VrCODm7rytq26QH8ifu6x36PoYf0VXsIII3nLkI8Ap0P0+
X-Gm-Gg: AfdE7clUZlmuvFeQO9iBMxFIiaPWcueKH1PgZv0B6DTyqk02g0vSPXATED0nTM8txPb
	It8+qCYGELrj++ccMjFO3Ob62DTkNN/XHh4W+EU+weknIchEJmf5+FkKTjfCPnYag0nqvkrV963
	nxYIacDrYcTsZsOXPDgpoFv8Yh1AtQgoZ4PlAAcKlx4Lx+SQepukXXvXgDBDWOUm6LKEBOFByfw
	8r3VWbiIQbctTOTnGjb5IHYhH4LJJBf72n9e4QhvJx9hGeE494VCluVg1HIz0rtyloKLF2nfj//
	obW/nK91YtFoLrPwHwLJnChFzTNdNRm+3OPZV9Mr+lj5OC0ozwD18JExKf4ZybqvpldRhLLWzp9
	YFhIjOKKs76wbVANDDEvjh0dx1hzEGxN7YcJc/Mwj6tvERwV82vNu4BmMQhAub7Jr265ReCXheR
	5vXUdVDGMeJUnw
X-Received: by 2002:a17:903:943:b0:2c9:c6f3:457a with SMTP id d9443c01a7336-2cbb9eaae60mr86009405ad.31.1783309920356;
        Sun, 05 Jul 2026 20:52:00 -0700 (PDT)
Received: from [192.168.71.21] ([116.6.102.190])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad77657d6sm40289265ad.45.2026.07.05.20.51.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jul 2026 20:51:59 -0700 (PDT)
Message-ID: <d199d200-37bc-437b-94c4-d23b4d1bbe17@gmail.com>
Date: Mon, 6 Jul 2026 11:51:55 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs/zh_CN: fix CONFIG_CONPAT typo for CONFIG_COMPAT
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
 Dongliang Mu <dzm91@hust.edu.cn>, Shuah Khan <skhan@linuxfoundation.org>,
 Kees Cook <kees@kernel.org>, linux-doc@vger.kernel.org
Cc: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
 Jonathan Corbet <corbet@lwn.net>
References: <20260613183737.11434-1-enelsonmoore@gmail.com>
From: Alex Shi <seakeel@gmail.com>
Content-Language: en-US
In-Reply-To: <20260613183737.11434-1-enelsonmoore@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Applied, Thanks!

On 2026/6/14 02:37, Ethan Nelson-Moore wrote:
> The Simplified Chinese translation of security/self-protection.rst
> contains a typo CONFIG_CONPAT for CONFIG_COMPAT. Fix it.
> 
> Signed-off-by: Ethan Nelson-Moore<enelsonmoore@gmail.com>
> ---
> Changes in v2: remove unnecessary information from commit message
> 
>   Documentation/translations/zh_CN/security/self-protection.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/translations/zh_CN/security/self-protection.rst b/Documentation/translations/zh_CN/security/self-protection.rst
> index 93de9cee5c1a..ad96bb4a4995 100644
> --- a/Documentation/translations/zh_CN/security/self-protection.rst
> +++ b/Documentation/translations/zh_CN/security/self-protection.rst
> @@ -97,7 +97,7 @@ ARCH_OPTIONAL_KERNEL_RWX时的默认设置。
>   --------------------
>   
>   对于64位系统，一种消除许多系统调用最简单的方法是构建时不启用
> -CONFIG_CONPAT。然而，这种情况通常不可行。
> +CONFIG_COMPAT。然而，这种情况通常不可行。
>   
>   “seccomp”系统为用户空间提供了一种可选功能，提供了一种减少可供
>   运行中进程使用内核入口点数量的方法。这限制了可以访问内核代码
> -- 2.43.0
> 

