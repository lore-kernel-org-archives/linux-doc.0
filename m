Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4456A259CAC
	for <linux-doc@vger.kernel.org>; Mon, 30 Jun 2025 14:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751295184; cv=none; b=BXc6S/+WEM+VqTlB0SFM5extV2LNGVrMl8OGTney2uLgY0tCSN/E/H4/C2zoWSP+Qme92218rxupoXAFjbacrS7eWznRCoqsG8v8RZz5+yClMMM3jLGaoDVpMg3hJtINOO2dKbjyVbbS0ZBLHpK8HAlTpuRWXuppndQ4iQE2ADk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751295184; c=relaxed/simple;
	bh=EKbypWq1FlONhmPWIS5B8mEdbfenWC/UIXb4JIHYn3o=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ljC62v+R7YxXuHdo1qUGNkQHEZqFq9XrStw035oCCRP5LuIasW2rNCH3U2oy5qvJMSd8pE6J50diHiE6cATp3lSkSW5w7h9zgOIkgdPEh+KR/PWVAUy7BtdF+toWz3YC8iB9SisQKmWMebsTFFqqXOh/3uBvxIquUYbYlx9qfuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com; spf=pass smtp.mailfrom=6wind.com; dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b=GgYPgXu6; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=6wind.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b="GgYPgXu6"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4519dd6523dso1755715e9.1
        for <linux-doc@vger.kernel.org>; Mon, 30 Jun 2025 07:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=6wind.com; s=google; t=1751295182; x=1751899982; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:to:subject:reply-to:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DehbCpLPPr5Vcumpumwy3dIrriLwUg9jpAUh57SLAgA=;
        b=GgYPgXu6GKp3JrqrkWfWtJObK7Zb3UNdmw25rrdj4U0AfWJKiAqMaNjhMAHmmQKMFe
         Nhfz8cN55i6/6AV241/X8TOCCsL94ifivSueywgpurE2MDGCKijEPOw9LOys0RNFJfn/
         5RkIgwwNfNSQP0wvN4Brqb/h1gTYUuYJVWBcqvQ3oGKlRUtHE2lepBGN1Q+aX72MmJqh
         ayUb8KvtdrGcAEUQeIYnSotiUYDpm5+TpsxqBMV+hxnEJiS/EjJhossRVQSJIldTf339
         8EolnaQ/8ZHDbhy2cu+a6p6MTwlqxStG+kKUwMENlyPVrxONrrjJbVCG2pN9IH4rzpY5
         5bEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751295182; x=1751899982;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:to:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DehbCpLPPr5Vcumpumwy3dIrriLwUg9jpAUh57SLAgA=;
        b=X6LtnU3iiYz4NkruRQpYPNOUc1TNSx31DAJQ+AaSNAsEymFDVqt0SGO12s65JyD9pS
         a+nMWVnJIWnWP3JsTq62x/PGnvxZGJq03/ShcWAk9JXd/IqGeBz4Cu6SntQ3O+/9Jpap
         TGAsGQe46gn9kQc/vh6kS5NF1oSphY6fiqIcA0oL2JgKGrrAi/zabbGBiBlDTZEYq2Ci
         mfj1HLeMPNoeV+h6YeDkxhSlHjU73VELbswRp/imGe6RJ50OhbEW/ZME8Ge4hyEwRydV
         OURQVEdLEn+IICqkua1ZaU5gChNPyvci03v1FTNQC05MjlOuwi9Y+1LtcNksjPOAjWPA
         2+DA==
X-Forwarded-Encrypted: i=1; AJvYcCUKYYXrXk1i5woZPcmsYlUQZC1kQb3iae0xGegRyozbMHIqAarcAVxzFs1ibS4bFbZOVUrGNKLiHX8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfAZdaktu46xwJBK0v6NWf4CQ5Fnzj1qHb1c1P2nGiYOGWu3iS
	S4tufbeV16EVHUwlasJ4w3hF7UOd3pgiVE0JP4DTidXiUhbtO2iiJDlliWmQ1pNKqIM=
X-Gm-Gg: ASbGnctS6nKbUF2/0IwexHRggmJvYlxRaAIsCQ642cuYyclxhYDpXIaPoDnKYpyOahX
	+aIKRmBA6gha2nJdj3lgK2uz/OEG1pSr4jjY5MVkqQOjkVlY7JMrtHb7TgFXYbuyn5qkGCSrWjX
	HcpjpAPbe7L9x0lTpRKHu2PanB0IPSimGRZRAE251KJZvvrongBLMCMgZjzCzWDSRmtN9qfUcsY
	lpDdMo/E0MOiPRierZ9Kebw0v77Tv+TqcIIL9otAxtWXmEQh55czIjtv5S4wlq9exysIp6qdqpM
	XNLtfArO20EYVPrzJ1LJ392Mrs8oUs47xuzxRiuDlKFtvQgjwY1PpdWVk5YSyuSDu0TsbTqF1ci
	92p8QpGasVP8rtCER7Fhl/LGVnEpGtpRWPrfoEf8vY3xoRSY=
X-Google-Smtp-Source: AGHT+IHObVBNzcK8FpD8U2h2CjhRiaENGj7cVHQZqmRm89+X/AW/+VEluKUeztSst+wELveye9ytNA==
X-Received: by 2002:a05:600c:c0c3:20b0:453:bf1:8895 with SMTP id 5b1f17b1804b1-453955642e3mr18964535e9.5.1751295181618;
        Mon, 30 Jun 2025 07:53:01 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:b41:c160:cc64:16a4:75d:d7e2? ([2a01:e0a:b41:c160:cc64:16a4:75d:d7e2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45396f24796sm76136635e9.1.2025.06.30.07.53.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 07:53:00 -0700 (PDT)
Message-ID: <99780599-91e8-4fc7-98be-1afa849e7db2@6wind.com>
Date: Mon, 30 Jun 2025 16:53:00 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: nicolas.dichtel@6wind.com
Subject: Re: [PATCH] ipv6: add `do_forwarding` sysctl to enable per-interface
 forwarding
To: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, David Ahern <dsahern@kernel.org>,
 netdev@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250625142607.828873-1-g.goller@proxmox.com>
 <f674f8ac-8c4a-4c1c-9704-31a3116b56d6@6wind.com>
 <hx3lbafvwebj7u7eqh4zz72gu6r7y6dn2il7vepylecvvrkeeh@hybyi2oizwuj>
From: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Content-Language: en-US
Organization: 6WIND
In-Reply-To: <hx3lbafvwebj7u7eqh4zz72gu6r7y6dn2il7vepylecvvrkeeh@hybyi2oizwuj>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Le 27/06/2025 à 16:47, Gabriel Goller a écrit :
[snip]
> 
> Sent a new patch just now, thanks for reviewing!
> 
FWIW, I didn't see any new patch from you.


Regards,
Nicolas
