Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412A728751C
	for <linux-doc@vger.kernel.org>; Tue, 26 Aug 2025 22:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756246832; cv=none; b=r7xTFn1uLaNLGNbiwmRu+r6JkxrBumRGegMkAIpks2gf8kRU4EoXKcJNvzrphOZwW1groKqInotSbkc7f71V0j4C8HS4VXrGXn0zBKPc6A2Qy06+kK4I7WMhF0TrAWE56d6L6WWpjmTF/c+nqEqtyPtL+fvQjG3tvuRwdXZvt08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756246832; c=relaxed/simple;
	bh=e73dqOyKAr7aCy1rumBgO8qBoCQd+jQ2sWMxR1cIDXA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l0BT2QBvtHUwa0bqS4bIyleJw8l+vKyi/kTmb2qIiIlcHvSAQ4huo1NFjeP5xmN/l+xISqJaBn7lwvAfzozprC/N1Ho3TaOPh6CokrMcQt4OEG1M5vZn2iQpDEQcXGQTjfgtN4mlubfasfcoaPxJHBdZZC9QWSrAftIcSTzCwg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com; spf=pass smtp.mailfrom=cloud.com; dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b=FiRWB8Qo; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="FiRWB8Qo"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45a1b004a31so47071685e9.0
        for <linux-doc@vger.kernel.org>; Tue, 26 Aug 2025 15:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1756246828; x=1756851628; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=e73dqOyKAr7aCy1rumBgO8qBoCQd+jQ2sWMxR1cIDXA=;
        b=FiRWB8Qo8JQ03J9/ph7Y2FTWmiV7v0ikQeKc+F8vPTbQB3lWSaQf++5a81K0blNgAt
         QQgCTGUC7eWaIy2ZgaTZhSIXokL1nC3lZDUBa9EjY3XHd7qPcat13NiIy+nCaCDQk0HX
         C0JghQaJ3Zzs1jU3F9O/nAlN0V8gjuEDGTPQA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756246828; x=1756851628;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e73dqOyKAr7aCy1rumBgO8qBoCQd+jQ2sWMxR1cIDXA=;
        b=ndHk4GK8yC5j13D9DGCFj4y4LwuhPwFikF4MYN3C76RnyxVh5/lBDw+9Qp2ZN6twPm
         AtOgsq1R4jDletmZNCCIvbF5mWgPOP4JMFEcDYDojf7kJYbO45wgTwFpz+mRls8kl4xZ
         eHzpbaadqSfHkyZ8MjUW8sX2hGAz9jqRAJJGnDXmfE9tyYozsA3wVQWXAZvvbhzlCA4R
         8AlnKcePrOi9U5KMuCkEypqSnPMNT4v04sqCIMA1sNv9FFrQsfyM6GV+xL6vftC5LCN6
         D8ZqS4JSbkw9I+uQEGnlafWXLagOQZHgqIeOREcIasAcR3bguWpuKJM5jdMW5m7BwQTm
         QLZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWeNVa7Qyw2+UDymUT+WrAGz1QkPZEfM9ePsEnKJE3FdZ/aWtn4EZroRvgp0iaQPTE//p41Xh3PGmk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyYaUWv6OPveyApr2URm9AOOG+D8HHIQswFKctPfmflVd1tbjF
	RCezznH36uBHfoEE3+EoGKUlz1jIJCirH4K8g+PRZs4DVgRTkgQJQKw/CZAjZMbYbsU=
X-Gm-Gg: ASbGnctH0VyINTQuAFLv0LTlNLemnN6IqIuoeHUIgPnfXMKD94Ca/HZENg/w74MQ2nV
	1MMgt4vzshAgClu0yS174Ppf2M8cy0VIDuRzjvxQscmhc3qehoMe2fVpFMD6wmFJ/f9W2SRY8EO
	GdrfytVMg8r8+M8a5uDgC6Mp4oJbwaYb40FnJ3mioS24ZMY/djv+m8OO4EZTfaXuni+hiJ0QcNz
	mJvNRU93JyglTSKED/ApAEKimATJLSFTT6R2Nu1XPsOvZulsODoFqK9+T3LmQJ2duys3HlbtDTV
	ymBllElA7ptQ9OiQB/i4t6LFeoiHFpwrTBZU2dGqeZViGjTt4NSToxl96Wz4F4LG51SXmUfg1Oo
	pIvw9sdWGN6FtpTEpf1ApY9+7vo8GNxapaPySGZTlna4Z6H6dL3oEeXscf9Cg18DXwZQ8
X-Google-Smtp-Source: AGHT+IGsBgRTDUWy5x4ztvDXqWNYDNjM1gHz4vj487vO6yPrxRRM1lAUWhWpoD2HOw2KfNXdTLCuvQ==
X-Received: by 2002:a05:600c:154f:b0:456:1560:7c63 with SMTP id 5b1f17b1804b1-45b5179cf31mr146042435e9.3.1756246828491;
        Tue, 26 Aug 2025 15:20:28 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net. [195.149.20.212])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b6f334c95sm3498925e9.25.2025.08.26.15.20.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Aug 2025 15:20:28 -0700 (PDT)
Message-ID: <2f84aed4-8da2-4ac0-8714-3fb1aca51515@citrix.com>
Date: Tue, 26 Aug 2025 23:20:27 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 06/20] KVM: VMX: Set FRED MSR intercepts
To: Xin Li <xin@zytor.com>, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org, linux-doc@vger.kernel.org
Cc: pbonzini@redhat.com, seanjc@google.com, corbet@lwn.net,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, luto@kernel.org,
 peterz@infradead.org, chao.gao@intel.com, hch@infradead.org
References: <20250821223630.984383-1-xin@zytor.com>
 <20250821223630.984383-7-xin@zytor.com>
 <2dd8c323-7654-4a28-86f1-d743b70d10b1@zytor.com>
 <36e0a671-6463-4bab-b5f1-63499838358d@citrix.com>
 <c44d5ea1-444c-4405-9182-8cd3f6faede4@zytor.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <c44d5ea1-444c-4405-9182-8cd3f6faede4@zytor.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26/08/2025 11:03 pm, Xin Li wrote:
> On 8/26/2025 11:50 AM, Andrew Cooper wrote:
>> This distinction only matters for guests, and adding the CET-SS
>> precondition makes things simpler overall for both VMMs and guests.  So
>> can't this just be fixed up before being integrated into the SDM?
>
> +1 :)

I've just realised why these MSRs are tied together in this way.

As written, the VMX Entry/Exit Load/Save FRED controls do not allow for
a logical configuration of FRED && !CET-SS.  Both sets of stack pointers
are treated the same.

This is horrible.  I'm less certain if this can simply be fixed by
changing the SDM.

~Andrew
