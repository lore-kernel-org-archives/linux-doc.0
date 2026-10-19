Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54A535A952
	for <linux-doc@vger.kernel.org>; Mon, 19 Oct 2026 04:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792383118; cv=none; b=F3UZ6zN4tDvkNiQB/ruc9v3KNgRL54BPvZVSAHJPPyLh0NLkZzxejiFJ8JqXt6N8clKHOvrALbM5A04CFHzzne8gn8nYgM6HqZm7l11ykxmkb2Q6+UULuodM+ZBZIULYv/u88xoucH/C1mxf9Ov9/bm1QxuoYgin3+FsbJDf5g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792383118; c=relaxed/simple;
	bh=Gyt6ha969KUHQxQPuh/s8Hf5K7QXr0NuPykQZun3bvo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bwAiQzrWpi2jN6wVCxSN5Dll3pIpKNcrPMes4r2fSZphKWo8Gjwith+S+xSokHPF89WtcJTTPowBmTHEocJ3qrp+EXCYwvaiiKsEFro0sSSCafddmQ0KR6CbSnK0JpQ3JD0A1/mVI740hqEs2PNJerYwwkDRwM7fk3fDw7FbdS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S7zUea2I; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S7zUea2I"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-35d7fa491deso1943969eec.1
        for <linux-doc@vger.kernel.org>; Sun, 18 Oct 2026 21:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792383116; x=1792987916; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jU57XbVpQ833Hr6SJRavUp1FZo0BckbSiKcwzJSb5wU=;
        b=S7zUea2IJhFg7cFMFtMoJx9iNVfE3je7aLDApmMY8CQv/P3X8HZ9rBKA4cJLrn1y5D
         RJehKoa3RS9cooqP/yuQXkymX5UdE0TNXlo7GFDfbZRIumlJS3Td9CQWeQTjbXXfwcRs
         lox5Wu6Xnz5fZlMEehLwTFl2ybCX82jwNXKU7l7ylEosKe6O6XcPuVtjdgwje8jPqWEa
         IQ2Bnx/kEBPaySsw9Jd+Ej6oOgNZlwsW7fBEvN1NULyebPPOTbdXrlYaIYn5LLUeo/mO
         +iXOFhpYLCnrWK04h6Kg5UxgnbWagzLMMzGSGrNfD7w7nbdEx+k0mG65mmaTC6mp/Yvj
         2bCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792383116; x=1792987916;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jU57XbVpQ833Hr6SJRavUp1FZo0BckbSiKcwzJSb5wU=;
        b=KLTd3LRMw9oIYmV0Dv62lcqjWMmJHMdJYx0ThlxA9+LkRPo0EmTM0d+Uz2J8d+9uBq
         3c/E6CL7nZP2HaJ8JEKTpGGM9sldqPyf5uyXeNRWJQDlmd1Lk4Fh4LomqOyR1q5bY2Ak
         dbtFmUaWjRgQuUoVmft+m87sZyzd/yQdQLzErNsXrjbtcEPLs0uyIHByhdQjw9AjW4/7
         7uis+VyUVWbT1cDPmgiER85O/urOVbpuKBQakZ9W9wX/5D/kSqIngUGInV2zi4Zx+cBP
         /v1HsTkqZSEOnlraG5oKzurF2k65A7z+CJGeA4OE17HBIk4ZR/RVbE3BRY8oHJJVKCn7
         pMmg==
X-Forwarded-Encrypted: i=1; AKwUvBwYmGtQtmW7aMUMfYHyqZDzr5BkON7/dZzIGPbJ4BNfbp9x6jmJ6E7twXUUgAHyexcwjawymv5krFw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ35S4qLKj3UWlBCyAVvf6g2mMr1jbh/gWs38KE4tVSUXTHZAAo
	6qkJd125kLotnkMm2FdU2OWW/VS8Jzho0095+AmYudYVMBhKE0l5EQiQ
X-Gm-Gg: AYBFou2qW2RMk/rLUggKKbAWcrM/G1t1k5aRsaqqA4oCEA4KKJq01QtJ2ZdxKoXHVjD
	k7si75BcsIW32YqvAJb/2cOvwJF/T8rgBoWug8aN+YQEHnO3jFhpOIr2RCIqBEuivwpdfmLw5ol
	mC09UvY2pWlRaNwo1taToA45DiGQHjP8sUhodvDq+cmPjpXIS30jlBeXNIh3gmrLqAyQhDgmsIs
	0gCVXpow8wLdEjxDsWUpC3ehKjsQ3Yw9WrKCaPBGVQzB3kGtf4s2kgXCrosXvkPzwmy4lyppEbc
	+PDqwEt88myj00Z7WyVakp30GSubc/4SNSW/u5rmNvecmwncXeR1OoCqs69uXl1O3gkJOR52BhJ
	NtdzUziuQHbeQIRdTGdGeH/gmbnodIFMKuRtw4TVOoxlTDHTznDXq1YSVpwDAJBvWIqjf24dSEb
	F67GBlRkLmyYzxnkb2RS/L//ix9RKmipH/+eowWH0ktZ9pmj2xndmRLA2k+4ZakLFKW9wDU7IeU
	wHGs5N3X4EAfN8ffpAzcIMq465HzLs7fwE5i6ZWnvk8EjEZsw==
X-Received: by 2002:a05:693c:65c8:b0:34c:6edc:f4d with SMTP id 5a478bee46e88-3619ed15f04mr8711921eec.1.1792383115871;
        Sun, 18 Oct 2026 21:11:55 -0700 (PDT)
Received: from ?IPV6:240e:38b:e68:5200:e917:1926:549e:76a? ([240e:38b:e68:5200:e917:1926:549e:76a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360819be413sm28296713eec.13.2026.10.18.21.11.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Oct 2026 21:11:55 -0700 (PDT)
Message-ID: <966ea621-9d1e-4d52-8351-5dcbf88f93b7@gmail.com>
Date: Mon, 19 Oct 2026 12:11:50 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] docs: doc-guide: add a guide for translators
To: Weijie Yuan <wy@wyuan.org>, Daniel Pereira <danielmaraboo@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>,
 Chen-Yu Yeh <chenyou910331@gmail.com>,
 Federico Vaga <federico.vaga@vaga.pv.it>, Akira Yokosawa <akiyks@gmail.com>,
 Carlos Bilbao <carlos.bilbao@kernel.org>, Avadhut Naik
 <avadhut.naik@amd.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jani Nikula <jani.nikula@linux.intel.com>
References: <20261015125644.12908-1-danielmaraboo@gmail.com>
 <20261015125644.12908-2-danielmaraboo@gmail.com> <atQ_mXYNqs4tnDpW@wyuan.org>
From: Alex Shi <seakeel@gmail.com>
Content-Language: en-US
In-Reply-To: <atQ_mXYNqs4tnDpW@wyuan.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2026/10/18 11:40, Weijie Yuan wrote:
> Oh, btw. There's a comment about ":Original:" from Jani [1]:

It's good to remove them if no one needs this. But I didn't know other 
type documents...

> 
> | I'm wondering, are these :Original: fields useful anymore since the
> | translations extension adds the button to switch between languages?
> |
> | The pretty much hard-coded expectation is that the English version at
> | path/to/foo.rst is the original, and its translations are at
> | translations/xx_YY/path/to/foo.rst.
> |
> | I.e. neither the HTML nor the RST benefit from it, and it's just
> | repetition.
> 
> Perhaps we could have a bit of discussion here?
