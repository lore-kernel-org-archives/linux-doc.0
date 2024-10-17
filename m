Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1765F1D417C
	for <linux-doc@vger.kernel.org>; Thu, 17 Oct 2024 08:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729154439; cv=none; b=qTP1q1HsNSWw/wm5h3enIFdxoCCnYOWIngJSAJ9DSFejc11V6vpaqd9eW1Yr+IuIn88360zTnYAYOnpM6/jDY0QxiCNXHJq6U04fSN3RXgld2VgDvijVJTvZ3V9l/y7HAs7hHaV3OsLLQtqj1KEs8tAyJJ8Bo6yRfm/gr/1k7Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729154439; c=relaxed/simple;
	bh=DoqwkDHaw/s5msPYqtaB/PMRAXavMzh97F+WRmZF/FQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pueyIh8Ag+1nTq+udpW9DP5g7mzMbqhjDKaWQJH6LmZQiRdMoFvGfEiplb9mWEtxSqp4XlDiU3Hl30kj08RI29bkENmtSaWnyQX71or/ldNNVeO3cQVwWiHHGOkWyHNdVmRAVg3eGLBaZwJkAvSPL+/BD1xBOW3aMVQjgpxV5F4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org; spf=none smtp.mailfrom=blackwall.org; dkim=pass (2048-bit key) header.d=blackwall-org.20230601.gappssmtp.com header.i=@blackwall-org.20230601.gappssmtp.com header.b=QnLwzdkP; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall-org.20230601.gappssmtp.com header.i=@blackwall-org.20230601.gappssmtp.com header.b="QnLwzdkP"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43117ed8adbso9552555e9.2
        for <linux-doc@vger.kernel.org>; Thu, 17 Oct 2024 01:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall-org.20230601.gappssmtp.com; s=20230601; t=1729154436; x=1729759236; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nswFHJ27kf2VP/BAqhXCzxlHjdJWcgb2R9d96m4tGM4=;
        b=QnLwzdkPIKD3l7PlD5lJRUQA3oMZRJ8s0I3sGkYFLErJCXo9EsErbrSppyK0mAMKgt
         PDFpcwS2PsgQpHcrorfnB+KKpkd6/DOsT2smaNHpZRSmKJOkvT6sNf9vgTZYRuAcqhQH
         Htul/HXQ8Jn1D/8Ylqb2uljqTAT4n2r91NKU2+F+VMyxKT0s9mgF0XWp7gxpFfjMZ/31
         CtnVLRxTWmZEEDr3uVZGriaj9fkjfYSd3wTPuA3K6BiK/aPUvTlmjV30CaER693D6zVk
         WM143EzC3hcnwZxZo15cjCEUR+t2cCuyAQizDGNmyKYBa9D9xOfpv93TyOR6BLPJw9SY
         YwnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729154436; x=1729759236;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nswFHJ27kf2VP/BAqhXCzxlHjdJWcgb2R9d96m4tGM4=;
        b=QtKA8E/K8SE4WgW+Lpmx4sMrTcMFY16j45Ia/doDGhfE00KMBTfpOgCbIypY1YDHJl
         pX2lQPZxlr8TwpSXumbH5JRWeZrOLFuGj4g4rwbJ7Z0q4uR4MRHPyipMBoEcSPbKI2Lo
         Sprl+6zWC9VBODljrjufIK/BGfFOxaxmUb0Wi252bEBM8smrO2V12h8YxocfefRXDf3B
         +esNBwgCyPlRMq9DcwFxcwhbz5vGxgmSQm6Z3GMHtss6QstDPWt7Jt9cOlTXw//4R86D
         TBefU2reHtkm+8KuAG5E28PU4ytRMP0Kh4X4whKS/4pxyX5jjhNvgT6kJYc9e6vnzM0I
         EdcA==
X-Forwarded-Encrypted: i=1; AJvYcCX6B1eLJqiuhVymZeqXb1FOqkEqlfHfR/eCHgwDFP7F+Ei2011DSYWc/lq/+LgK04z3OvBNOuJ0QDM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0FZYfpq/9IgK4WKCB4Azl3F7Ywl9YJSVT+A3FTJMq41N2Ql5v
	N7wwwtVbyGxCXGITqqCOyxtc51RMKJ83CPtkBV1DTAWQ9THQ4y2at7eZ3RBJiFs=
X-Google-Smtp-Source: AGHT+IFuF+8cHcrpXZJRb2Yp8KK1CNOhbBWDw0VehuZuC9EeoOaHTNG+4EJu7KGKavy+Z550mFTjQA==
X-Received: by 2002:a05:600c:458d:b0:431:562a:54be with SMTP id 5b1f17b1804b1-431562a55f7mr26663315e9.9.1729154436169;
        Thu, 17 Oct 2024 01:40:36 -0700 (PDT)
Received: from [192.168.0.245] ([62.73.69.208])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43158c3bd59sm18453765e9.15.2024.10.17.01.40.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Oct 2024 01:40:35 -0700 (PDT)
Message-ID: <54164763-b635-4ff6-be88-56aeb461b494@blackwall.org>
Date: Thu, 17 Oct 2024 11:40:34 +0300
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv2 net-next 0/3] Bonding: returns detailed error about XDP
 failures
To: Hangbin Liu <liuhangbin@gmail.com>, netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Jiri Pirko <jiri@resnulli.us>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Andrii Nakryiko <andriin@fb.com>,
 Jussi Maki <joamaki@gmail.com>, Jay Vosburgh <jv@jvosburgh.net>,
 Andy Gospodarek <andy@greyhouse.net>, Jonathan Corbet <corbet@lwn.net>,
 Andrew Lunn <andrew+netdev@lunn.ch>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org
References: <20241017020638.6905-1-liuhangbin@gmail.com>
Content-Language: en-US
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20241017020638.6905-1-liuhangbin@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/10/2024 05:06, Hangbin Liu wrote:
> Based on discussion[1], this patch set returns detailed error about XDP
> failures. And update bonding document about XDP supports.
> 
> v2: update the title in the doc (Nikolay Aleksandrov)
> 
> [1] https://lore.kernel.org/netdev/8088f2a7-3ab1-4a1e-996d-c15703da13cc@blackwall.org/
> 
> Hangbin Liu (3):
>   bonding: return detailed error when loading native XDP fails
>   bonding: use correct return value
>   Documentation: bonding: add XDP support explanation
> 
>  Documentation/networking/bonding.rst | 12 ++++++++++++
>  drivers/net/bonding/bond_main.c      |  7 +++++--
>  2 files changed, 17 insertions(+), 2 deletions(-)
> 

Please CC reviewers when sending new versions. I was CCed on patches 1 and 2
probably due to the tag, but wasn't on patch 3 and had to search for
the series.

Thanks,
 Nik

