Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732EE2288F7
	for <linux-doc@vger.kernel.org>; Sun, 30 Nov 2025 22:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764541321; cv=none; b=sfpk15ZciK4wEKZTSus4JK0H4BMAoUBzuxB6/MMFpe5SQOTMCdttgsebf71BK2WdnzE6V99VhDS+phf+xFWVgsBXDwF5irRvjxOHKrkndHwrccYJxy8l2dhpKXSATdLj+JuzBkDEqJZjDo/VRwMAyXTjVsRbU6/voc0GJbnIsbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764541321; c=relaxed/simple;
	bh=nWpDQmZNg8zKVk12QskQ7NNS05C4fI/JmZBKLdKyu8Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tg6/qBEcMhsUpNFUpELkYd0x2H720wCu3IV+TPmuPrebvbcfbUJgHc4gRIp/nmjrv9dvOrSOyGTDuXilA6Oxp0lz1T9agYmsFBQqp8I4xbbAfM1bmFWZmISCM+AUxZ0dnbf3zOpav5bX7O++m+swOOEOnQYwXhwbKkHZ5OmCm5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4779ce2a624so34494835e9.2
        for <linux-doc@vger.kernel.org>; Sun, 30 Nov 2025 14:21:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764541318; x=1765146118;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nWpDQmZNg8zKVk12QskQ7NNS05C4fI/JmZBKLdKyu8Q=;
        b=k9YTH45OGf4972d49cLf8gXJuclWSQcQzFZrc5aiH8V4gJR5+kAUzpQJwl3WxjiPDZ
         dX0wdBG3GdRUGdiqpj/0snnONmT97DmVh2i1msTkS38GpXzv2F0U0dewgAT6gD2G/nFK
         xgnj3H/INIrTMwMKbae2CK54En4o27NgimZSeW+1dsJKA6yr4v63N7mhRFLm4BtN6s5R
         CS28l5+kLLQywBTXzcdsY2Co4HYpGrbNIYN4Pd9++hvE68aoceBSI9BjCoM7RNmi8YA/
         9v0p+k1VIfeU8MYpKUwRa9hCw+iEVfyK/FjVyJvupof7h/ID7vtN9pSPkAwm9B3Tm+3r
         /EQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZxBvGB9miTLCmnppqXlvz71/SirAqGVbBIuc5ksiPbPglU3krCm4stm0f3wuNrH9tcp/twN6KgSo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz390sv0Oda74XKQ9OqAKqTeopm+z5IPHxZuxQxQdDhyOeAiTu
	xl+VVyDzZUgE5lNuiDWjWceyqVG2VbukASCz0nNJeIOkIyEUDWZ83g/d
X-Gm-Gg: ASbGncsnsPiTBOyaicSTd5bBhUy2sg/tIz7/1I0uNCNhyjgDXVxAQDRAcDV4Smrh/ZI
	9w0YyjrlbA/U5spp7IBRWYsgU44lcpTycRSLfdEmomSr9+6xy2pkzGBnzErTabyfoBeItQaVLeA
	OJ8Ccj6JC8gUSX2x/cnUsHVqPa20tJy/RR10GhBqJKBMov+plFDLUxAi3I7ZcR/GXfPvi7yCnbj
	ETA9hTo/1AhDGq64ikesnko+iBa9HYX2l/U5jQ9ytaOb9l8eYzyes/qX2ZJKo1yc6QOiXQeJdp5
	McQ6rulOPE5VuFdwyjRbI07MWxWjOxz72HdJJmRRc4YeXWYcTDoH88YBfCBkAAD4KpkefrzKarK
	LY9pJm5UJaCbb42kSLwfxB0hyc2G2D8bDr5qWLKE6fDnhGa/uk8+4cptsrfPp3KTgx8ysDsL6Bt
	5wuSbAjiPSeGx71/bj5HEp27V8ttMpJVf/IBsvBoTV
X-Google-Smtp-Source: AGHT+IEaDq7D6ajMDVwbhmEysEzsY+1ogXGwoywM0VuEEVuoRMtFYjkQRVWQHiyxGuNw2ezMfnKldQ==
X-Received: by 2002:a05:600c:1c1b:b0:471:14b1:da13 with SMTP id 5b1f17b1804b1-47904aebebdmr256111855e9.14.1764541317764;
        Sun, 30 Nov 2025 14:21:57 -0800 (PST)
Received: from [10.100.102.74] (89-138-71-2.bb.netvision.net.il. [89.138.71.2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790530f0a4sm142367985e9.8.2025.11.30.14.21.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Nov 2025 14:21:57 -0800 (PST)
Message-ID: <93c631e9-a07e-4293-a59e-81be85270687@grimberg.me>
Date: Mon, 1 Dec 2025 00:21:55 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/6] net/handshake: Store the key serial number on
 completion
To: alistair23@gmail.com, chuck.lever@oracle.com, hare@kernel.org,
 kernel-tls-handshake@lists.linux.dev, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-nvme@lists.infradead.org, linux-nfs@vger.kernel.org
Cc: kbusch@kernel.org, axboe@kernel.dk, hch@lst.de, kch@nvidia.com,
 hare@suse.de, Alistair Francis <alistair.francis@wdc.com>
References: <20251112042720.3695972-1-alistair.francis@wdc.com>
 <20251112042720.3695972-2-alistair.francis@wdc.com>
Content-Language: en-US
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20251112042720.3695972-2-alistair.francis@wdc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
