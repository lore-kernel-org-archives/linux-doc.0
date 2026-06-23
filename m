Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B6E30C158
	for <linux-doc@vger.kernel.org>; Tue, 23 Jun 2026 18:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782239513; cv=none; b=SsZExi/1Ii8HVlrpeJXNjt3qdA1XjsR9C2n063gUWp87IY6VIs4htE1ImTID5i2bv1VaHKN+s+FUEJOlte+BeszL/f/y1TVICOjiRuBWjQdHoGM+pWLtfoVOeyYyjsLNcm+BORbZ00XWimA18trwPqollGsRrvQxqy7mlpKJWPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782239513; c=relaxed/simple;
	bh=a6v/lpFeLkHnDu+IGa4zSrsn/mm02YtnvEpTbfS3FQk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OzggEVwgoKh6vDoFPo2NQ0JT+ChdalIQ3HIX2KPcYop7M6UCU7Ng7ydi7pPeXhnguw1wafzJgRHEIpDoztwOPgk8V/GGvOPVKh0t+gupwH7A9HMauQ8BODRjndDaMPIu3WuTHobRAnK4VXn7U4QkIpdo3RPABHrrigSZGvVYSdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gASq32cQ; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gASq32cQ"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4627adcf4d6so157693f8f.3
        for <linux-doc@vger.kernel.org>; Tue, 23 Jun 2026 11:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782239510; x=1782844310; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=1WzoRhsusRl0gQfys6taa/vq131osq1TZkHvUeTyq2k=;
        b=gASq32cQQnOakdWdGAi4RKCu9gJ4gOgSadpTO6u8yjQhIeI9UkJLK8QVemzr/zH93r
         G9/KCwzJi0U9+L3zXYGQL/tceIXVLwWamlL00Gs4zvoEk8O1fnBfmOOuHynOG1SfxkyO
         SUCsf2A2TWUGeAdKPjfAn/nf+SQfYbLH0JCEqHBuy/fPBqHR/+ato5LVhdTS9r4cOtYv
         zJoQ3LDFNBxpwKjlTciRlPnNeNyOKeRANt8XnIrWTXVNsQvx/BDSV9vgwV9S0T+XY0kF
         0Fo3QnXiPTQM0OuTOs+c71C/EZeQBQnasKVwleqBu1m2XGTIvIpSGbDACuDh1mZR71Nt
         5Grw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782239510; x=1782844310;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1WzoRhsusRl0gQfys6taa/vq131osq1TZkHvUeTyq2k=;
        b=Df5CKPC7MK+Z1UsYgeC2ubOf+2IMQwemT5KP3xVU1hYDaQu+mztuzi+TWwQ+zDFaxj
         3nRqyBCPSgLl5gCJRK7XgDFhQBe1/X1Zg/p3uAcVgtEcsr+QabgHo1egXtjYfQtp+VQt
         iw7e/xswL6LnTxBbrWH1zrJqlHjUVZEtTjHk99nhXLHWDcLcOe2/pZH9SOGjIJX+KGzm
         TkR7s7qn7g2gQt9+HINl1gQrPnn5/bFB1iEA0OAyDz2aIzFdgtCNHspixZjziNae76cd
         B3De/bFjtNoOP+a4fPKN2OeYmlkd8piJ0RV4XcjEJJ2C5UjCJPbHGjxaWUE79o9yZe7l
         jlsQ==
X-Forwarded-Encrypted: i=1; AHgh+RplIN/CPZ77AX1yBgQfRj32E1kIZrKfzcOeQ5mjjNkr0AzJ1E52y0Fv1dWKDmmdJM3Lxih0C91iR38=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2Wog0lx+Ww/Hj3CpXYJiivarKZ3jGAeY/Bf6bxLiPyI/CuP8C
	r8i7m3TgWEaWQrMj1zwQzS6ztxU5dyAqU99QTrIACyAGkcIAR1PAAVOE
X-Gm-Gg: AfdE7cnWFsIQHgJXiv3MSvg6YHlGljyHJ26f8SFQSsnxMKfjiguXM4drRw1/udKJMjO
	kFx0yyZZbH5B2LUhXujIsuooKvBYOZeVakqYu+J7W63X3Mx/tZYwrZvsYSClpLMskw4j73kBZKK
	E8RokIOycKbGP/1+855rHT7Q/ewgoSb8eXRhAYh8cCK3wd/wq1TAN7nv2Zk/R6QIeWgLX2QwIBQ
	rhbjW74ACV4/cUm/iI0nmE6pjRs4oLXmmmJB+utcpf+WaQ/89fufWQbI2aDC//k20fuoJZv4W62
	tnikfasGxcviwM2HU9Y3Le82Rz18d8dJ88KGc8pN7Guk2kMuEpod/Ci3Llx7ZAHifHw0EyCR6SP
	gllfXEY7QZXMLgE8X+qda1zlR0I0COpgOrTLoVKx6wPmAj2269G2tbA3u7AzcdW6hMCcIQ3R/JC
	i+qzmXXQCj9YRSM+6n4vEu3+Dw38FdAmPPJ7WkoOwykIQtUosQZaRGmD4zs+nIxGtNRAGxtx+Fe
	/2z9Mq0
X-Received: by 2002:a05:6000:18af:b0:465:767a:3a15 with SMTP id ffacd0b85a97d-46c0a670fc9mr2639f8f.18.1782239510389;
        Tue, 23 Jun 2026 11:31:50 -0700 (PDT)
Received: from [10.128.11.131] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46666788282sm55782307f8f.17.2026.06.23.11.31.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 11:31:49 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <96b043ed-c527-4e5d-8eb7-631805da53fd@gmail.com>
Date: Tue, 23 Jun 2026 19:31:47 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 03/10] tracing/probes: Support dumping fetcharg program
 for debugging dynamic events
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <178217904992.643090.15726197350652241270.stgit@devnote2>
 <178217907822.643090.14693478306190628970.stgit@devnote2>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <178217907822.643090.14693478306190628970.stgit@devnote2>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Masami,

On 6/23/26 02:44, Masami Hiramatsu (Google) wrote:

> +config PROBE_EVENTS_DUMP_FETCHARG
> +	depends on PROBE_EVENTS
> +	bool "Dump of dynamic probe event fetch-arguments"
> +	default n

Sorry, kconfig nitpick: could you match the style used by the rest of
the config options in this file? E.g. the type and prompt come first in
the list of attributes?

- Julian Braha
