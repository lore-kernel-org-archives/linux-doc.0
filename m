Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72D91ACED5
	for <linux-doc@vger.kernel.org>; Sat, 14 Mar 2026 02:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773453673; cv=none; b=hJ22XhgVz84pnByOeDJYhjkrF/N/nV3QdeaOHNAZFXtksS8hX0aIaOzS9txx7+bT8G6fxwJ76Jt2xdT+j14Wm8GwWZXwsb9qT+YyZ6Tywo9NiYFkYwRrYY9V3X1s+L3VIrUEii8yHfCnQEnDW3ZeNAX8W2PpQIk9/mbyPJRhPy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773453673; c=relaxed/simple;
	bh=dCvYTlqh1MWL8IyixDf4AN02tdUmB4IFN+TyGNNiUIs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rVPaK2Zak3tGwksrrCvQCmHfCdzQugZQ1rqF7BwBaisRcWsMwpqgSf4FWTrJMNXvsJf98dLnszuRbTISon6DGdihH77uSOh22/AAdvOsTuprjWHT+i3/f+1lP8fLXLulfIX09OpDNGjUmjT3+QPruCb7Dj/EKJIq4q0w9LnPW+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=gBQ5NluD; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="gBQ5NluD"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-794719afcd4so27317237b3.1
        for <linux-doc@vger.kernel.org>; Fri, 13 Mar 2026 19:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1773453671; x=1774058471; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dCvYTlqh1MWL8IyixDf4AN02tdUmB4IFN+TyGNNiUIs=;
        b=gBQ5NluDIG581J3kPITnKU8dTay039ACWLrsptI9EHwtGpBmuGrwQ9FyKqVJRgYVlw
         OWfsrrqcdxelWpA8aoBkSY2cqevLsEbCVK8LFSq+fW9BD21y3fuZBp+8jSMgTEpgm5m2
         htSohajL5aEgR5+Zv5QFbgoKoUdMrUXUZ6S0VPzlVvTNCTH1ibtxzscBFhiCwNGphUgY
         q3AY5XEPIIT0Cj/R02OQcbj70btad+udqY6mnG05sSJfEPD4OyGDl6l03KuDdJatSPhL
         1aJwmzMSwqBnhZJjKNJo0yJysEbX+N6y+BLigdnukUEGioEY9Mkwca+o4POGiXbzDJhc
         hYlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773453671; x=1774058471;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dCvYTlqh1MWL8IyixDf4AN02tdUmB4IFN+TyGNNiUIs=;
        b=lEK5dtkZ/IpLkR0UgHJPFni1KMzBkys/3Rmo6zv7P6n/gEoxWxOoGH1TW3ciV5pqRw
         e2NDrKATivRFYsz2ONt0VDn6R9GT+s3HprtdAcwXXWcF3M36M1+LTsv4nDpvdz2sg9gY
         XYRXQ0s7gjaEk/an80OqUI6FN4JCITQ6iddbp0jurlpXOL7UmIxTUcVe0YHmcxrBhHfQ
         9icK6F4yKbRchlUhjDrWwrMYzP+jV75GczcHukaGjYm9JpGVZ60E5yUF4aiOfos04jIr
         c1z3a0/sp6BWB7ieHfCri3B+Ezq395FbS4+XC/VlCxxVAFqmXl/gw4aHjhFP9ecGyEse
         CeSg==
X-Forwarded-Encrypted: i=1; AJvYcCX3m2p/vEi8+/hfHPzdqWg6Vy5wqZUDUmIDchwq+XY8JwJSsAWQudrmWT2eNZE0LSo31uyos+VBPQM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yycgzx0ulQrvy28XzUQx/seAVxWismPvqrwb3K+Q6hR1CPegLVM
	4uk54lNE6gF/cMOK5IIgJ3gebUmK8wc94h0MUkWe9PKFTLTDgG1wtL9lToTNslabnAI=
X-Gm-Gg: ATEYQzzdsBM3k2eJVN9pQT75FPK/8eQPC6Ddft3Zv7SLN3u7QEmcI6+OjmJVsF48j+b
	hujlerXQyzzjG9PAI9bsZkpRdQl1yein0YtbWISOUaMb4hyR69YvuIN0Cmapj/4hEc9SnzkGBnm
	kxzec2b0En8wEhKn4BttBBjjVE80fplOAtCtT9h++4Mmclh9Z3rSldA4T3amPW1JFDiJzwAcnMo
	duhGAfganxBmEFvfTfCKWF9vFkNflOnTcx8L0HWTra0+nfWZPqWG0OCajKt7uyEcYtm+1R7KW92
	vu5SPYgo5ezu9HU+Mjfbdl/99irSwvPCelV520kCuxlYEnN9NvzNvGapN7OMLqFlp7oVHu+18ZC
	ANVAItyPuDqfDDSJh24gsPfMjUMcNWJjDGU0MLkrlc9/nfgSVg3klOzQys4L+WDZUDKof+GCvjK
	iMyibVKfl5agy5vBdkMggp1egvirL9CtE+8I0=
X-Received: by 2002:a05:690c:6e87:b0:798:1636:c330 with SMTP id 00721157ae682-79a1c18818bmr60490517b3.34.1773453670899;
        Fri, 13 Mar 2026 19:01:10 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.103.33])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79917ee4a8esm58267877b3.32.2026.03.13.19.01.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 19:01:10 -0700 (PDT)
Message-ID: <47e9a3e0-c056-41e8-a175-442a3ba7e355@sifive.com>
Date: Fri, 13 Mar 2026 21:01:09 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/1] update riscv prctl for discovering V extension
To: Yao Zihong <zihong.plct@isrc.iscas.ac.cn>, andybnac@gmail.com
Cc: alex@ghiti.fr, eric.lin@sifive.com, greentime.hu@sifive.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, nick.hu@sifive.com, nylon.chen@sifive.com,
 paul.walmsley@sifive.com, pjw@kernel.org, vincent.chen@sifive.com,
 yongxuan.wang@sifive.com, zong.li@sifive.com
References: <20260117233228.36088-1-andybnac@gmail.com>
 <20260313092012.64446-1-zihong.plct@isrc.iscas.ac.cn>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20260313092012.64446-1-zihong.plct@isrc.iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 2026-03-13 4:19 AM, Yao Zihong wrote:
> It has been a while since the last activity on this thread,
> so I would like to gently ping for comments.

There was some off-list discussion about this around this time (anyone involved
please correct me, it has been several weeks), and my understanding of the
sentiment was that:

1) These sysctl and prctl() interfaces were introduced because adding vector
state to the signal frame was technically an ABI break, due to increasing the
minimum signal stack size. The prctl() provided an escape hatch for users to run
existing software that used a smaller signal stack size. Notably, this existing
software necessarily did not use RVV, because any C runtime that supported RVV
would have enforced a larger minimum signal stack size.

2) Using these interfaces for another reason is unsupported, and anyone doing so
gets to keep both pieces. Software that was aware of RVV at compile time is not
expected to ever run with the sysctl/prctl() disabled at runtime.

3) Therefore, hwprobe() is sufficient for detecting the presence of the various
vector extensions. The case where hwprobe() says RVV is available, but its usage
traps, is considered a configuration error.

Regards,
Samuel

