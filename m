Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795455536;
	b=r4Z8MsXLEQn1CFJpc8xg9McBgmG+cJfaERM7ue2mw9V4yAeSeVjxr5uLu8zc35spds74
	 HCSMye4bnO4IPxAX4fmBltLMaQGjfR+Moxw6Ge1mAsBZVb0zmY2cQM7OI8BmWHEZ16mj4
	 xiLGn8DomWTDZ4un+bqvufNLPDNklJ6Y6v9343s/TibNOBKcnkYfy5b4b683gFSJbfrmb
	 RiWvwNW33usu8ViALq82NSrsbRj8ovOkGkT18rfD2uSe1Sd7v2ynNCpyGdj+GiS0qlIpq
	 +lVlAmL1SQy6YgYKSu5e2WzMprR5pp1zISWlAKQsG9vw8ypaDt0Bp9v2MCZdGz6LujA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795455536;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:Date:
	 Message-Id:To:Cc:In-Reply-To:References:X-Mailer;
	bh=80pkZVTQUzpocvFf4Q4AZ1jQYJsntKDso7wWkNMkYVU=;
	b=arHrIXxvG5bxEHiU8mTKUmJDkr6myNsgRUIhssd7hWc0nTmhPypf13wZIFb+g8KHvLnc
	 dkzbCULsq18sPTNx9DpZSaddCzTzcfftUlJswCMY2hzx1Gwge1stmKKufb0Mi7CHz0owN
	 BkbbhVFEhKhBeGW59GhGSpyfbp4T/1TqjJ8rlVNlgTU0kjFFcYRWq/n0rEbiHoGQTHHYq
	 5GR5qvOUbTZkf9QzpuEwqGdXibHlXLAtWxdK5mK9BgT5Nv24ODGL64HilhpeCEKVzemc/
	 DMUt44fcnSiStSWEZjUBchWUyrxcl8v6SX1gDRufAy8SmtDCVWBUMEVEaFo43MMDQdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FAvDZK55;
	arc=none smtp.remote-ip=74.125.229.8
Received: from mail-dy2-f8.google.com (mail-dy2-f8.google.com [74.125.229.8])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576D5606A333
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 17:38:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 576D5606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FAvDZK55
Received: by mail-dy2-f8.google.com with SMTP id 5a478bee46e88-36a6ce64b95so1376631eec.1
        for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 09:38:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795455534; x=1796060334; darn=vger.kernel.org;
        h=references:in-reply-to:cc:to:message-id:date:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=80pkZVTQUzpocvFf4Q4AZ1jQYJsntKDso7wWkNMkYVU=;
        b=FAvDZK55ZXmxXQ1J4HXLz1yrxLK6RtdWZqmBnpGISxdX0Z1+vmisvhhK1CA1oZzxBN
         0VjMksOPx2nu4ij2Ref47siUjPvZuAbprXix1npvF8WGhevHukwlMZfAg6L+V/DI/yx+
         uKYazc2hhJIEfLNtuE+xcCqX9dee2Qz5Cvxs7FjIdQiDiTNCaqQRhQK0z6WHadlTCquc
         wLlqHMuS1hCdT7Xozm+vEXr9cMjR9pyCrKiQ4e9iRXA0ZXJN9iazYN9Typ0VRWt7Fygy
         510mKGQhBoLzgotpWuTKAkyCSPHm26Ru8Uz7qtrzCvzhCi8QoGFQOqrWvc/kWFiWjzV9
         iF0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795455534; x=1796060334;
        h=references:in-reply-to:cc:to:message-id:date:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=80pkZVTQUzpocvFf4Q4AZ1jQYJsntKDso7wWkNMkYVU=;
        b=I2LB8pMCqYTo40X62+wwPLeURmn8mR27J9ryCxn+oLp5vhxIAG6aYZlLnChK94je7L
         KrIJBXgsGtnQaeH/VB2emo2Z/oSmXjVDxe0IuzdCPnlNOYvWQczwaPDU3H8lpkA7bdoK
         keDMLDAXqBAkby1Fyyo0TGNC6xDy5I8wdEIpMw+DwDbYfd9y4o6znmXgaxfd2jfa2n7J
         DM7ZALck8wWAymKfKKTEjSv6PVTm9Skm5r0GduuXr/BArFBbMprLKX/H2Qp+ZoYWTYBm
         wThuPufERg7Z9AHMQmdCWgWDrv6YzxmSW7Dpwn4sJ+Yr+nxCOurFDWaw4eO9pEqV1+le
         JlgQ==
X-Forwarded-Encrypted: i=1; AL+hErF4U9c0aMTOSyTLplgKlncSsUznzXBT0a6JSJwaAU10mxwCYzPXG3umqZmCiEjsrxbcJPMig9Rsyr0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9RUcpYjNUtJuJUWiy2T/Hg6Oom+YFyenrzJX608vPWFqnvJBtV
	agwSUzMA0mF2kRNHo5sTPWmpbj5D7JrcKFznTcR8E+xc1ecZ/VrCemrW
X-Gm-Gg: AZFdTZcfbC2m+yTw+Rv9ChcI6Hqd6W2fuDx3bSjOQLhF1PuYhOG1/LuQoK/En/W1cR5
	K8FvzDbhdq72nG28kcPewgiDCMkslPmGhNfjoyZXKst40/J81TF4zrHEcEF4vkW271zVCpq2OvG
	3s01HWF2jwzmZ5xhHz6+mEWRpElBpU9oW7/+8BdwFl3/dd7pgLCUgDEk91sE6oTRGcm//cDN5dQ
	3uPpetD6EpyBmM6TSORaBY6FCHO2OHuDU+uLJIkLRy5uwU3OIC9USgFK1+THGdD/9YAZxeIgYH2
	Z+daBV7Yhl8zsA/GyW7GUOBuYwXYW6FOm/LhHqbr0fVoYVBAyCnw+fwDjI9YrHJAjfUK8SL+L53
	kYZwEYBRvw0w71G+zCA941ELKltwEQXowlOdudx67cwLkPF0uy+hVEibpQGKcEqSc68LJ7unnKN
	3TWlDmDvLuYrqNVw095NapYGJA+8aYv/sT9HAqw+/81/O7T4SrfV1UNfLqp0SfbKxNo1yuegLJV
	ZCmNtpOeKWRYXRW+IYiMouorHb4EN7k3Ea2hdVlRstYSu1TIUuqLmeBjQmaAU3/yNWv0iERnDIM
	piTN/fEd/hlM02xpomIQfiCykabHfnuEI9sGkeLfyX1uH/YopvyLqiKEnb7ETWl8sGYCg4P7xeA
	7HmLZe2lQnBYLV/lKXbr+jy4ULjLAmE1Zpf7+Gcag5giTKWtuZs1nVB0zhktlig==
X-Received: by 2002:a05:7301:3d19:b0:376:ce6a:a499 with SMTP id 5a478bee46e88-3857122312dmr17033613eec.36.1795455534319;
        Mon, 23 Nov 2026 09:38:54 -0800 (PST)
Received: from localhost (n106-71-19-159.sun21.vic.optusnet.com.au. [106.71.19.159])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567abb870sm31532302eec.25.2026.11.23.09.38.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 09:38:54 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 25/27] Docs/mm/damon/design: update for user report
 support
From: Aveline Noir <jm5905938@gmail.com>
Date: Tue, 24 Nov 2026 03:49:24 +1100
Message-Id: <179545256496.4.12112355431870219445.b4-reply@b4>
To: SJ Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 Jonathan Corbet <corbet@lwn.net>, damon@lists.linux.dev, 
 Lian Wang <lianux.mm@gmail.com>, linux-doc@vger.kernel.org, 
 linux-mm@kvack.org, Randy Dunlap <rdunlap@infradead.org>, 
 Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20261121210013.130397-26-sj@kernel.org>
References: <20261121210013.130397-1-sj@kernel.org>
 <20261121210013.130397-26-sj@kernel.org>
X-Mailer: b4 0.16.0

Hi SJ,

On Sat, 21 Nov 2026 13:00:09 -0800 SJ Park wrote:

> Update DAMON design document for the newly aded user_report type data
> attribute reports.

LGTM, thanks.

Reviewed-by: Aveline Noir <jm5905938@gmail.com>

Thanks,
Aveline Noir
