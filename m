Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795455473;
	b=cvL7yzcAQ5ADUlEBiZCCZ3c4Wz/pc0IaW5DWuV4UckRO0ztk8s4c1KHjgw0sr0uenn4H
	 RMFXLw7JXRqtdRm3MJxClce5GEI/fuPI8WW/k/qGOb3Kkk517In4Iwx86Y6O90xmop1zk
	 oKj0YAuVr7XIKHND7OrdZdjsBMAnpRnjE3BJJmRrI3kl1zUlLIEQA42jIUxvM4a0iDmcs
	 ISasVppkxxb1OmFTGe839Vm2A0saaQUA2jA5dFZAXZcnf7v6uCKcRi2oiXt/cDfHxq8QN
	 UdP7St43S5A4OvIwiL5G7AGpCcMBWScmWXvvdMAxyxbIKV3u7XzDOyZCw8mIHlS71og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795455473;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:Date:
	 Message-Id:To:Cc:In-Reply-To:References:X-Mailer;
	bh=NgtEXJffBQpLVIiTDFBBAZOSsnPW9SZ70tTul+WiIJQ=;
	b=yeWN1wxeAEJBDvQU81xzZgMLiDPJ8jh30eX4BdbYTAst/sqJdHn2AbrFIvxASj0zUIEm
	 Yk2mtLH5ey6RFEskxGNob9T+RG0FCwZRQwnJ1zQ7x0aznHcLFAYKyPbKisqB/famBWt2M
	 w6myzohOSWw8isGZUKG6DWp3fcqKRVYEHRjpq3cai4FsMr+K0dBHi8HlwtnpxBluSHcAR
	 y5w4i78a5E7KEvJ1yGsoMOSJynOBlcidQxUmG0w+Pvkpwb/V3oOyfVrqmhXUAVte1G5Fl
	 Yi8A35XijUAtEp8OnVjDv1iEmvpzwbqIta9XaJdk7XJhTINFKEyefHNFJHHMdtVLuDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bdfxaNLn;
	arc=none smtp.remote-ip=74.125.229.9
Received: from mail-dy2-f9.google.com (mail-dy2-f9.google.com [74.125.229.9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBEC3606A31E
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 17:37:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBEC3606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bdfxaNLn
Received: by mail-dy2-f9.google.com with SMTP id 5a478bee46e88-3678f64d078so4260248eec.1
        for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 09:37:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795455472; x=1796060272; darn=vger.kernel.org;
        h=references:in-reply-to:cc:to:message-id:date:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NgtEXJffBQpLVIiTDFBBAZOSsnPW9SZ70tTul+WiIJQ=;
        b=bdfxaNLnIA/XPdPNdFvN/TqB4shHhZHJe1aTYDdMemWRoVaY9h64N31W2H3wccKXsV
         eCzE1Jma7eXOSNJ2Hlu8ef2PA5Ssnc8VHGMMg44J6x3vTLBGT+ah5nfk7Q76nvbIbaUA
         6iipbb4/PuF/e63NHYr1kzqWyWej9/g/TbCOSfl/muyP0jsYpUQCB9oiska3NSI0CUAi
         Ao5CbXjNXVXw8btvAJ4E0V2YgG9qIhf4yIep0atMFWpJTnyANdH61PywBQUsHSZ+IWd7
         TSoorYZOUGnLmmMgT7YIwrV71PAv4WjQSOfgunPmLT5QWgdSvKG1uNErm33XlumwV79u
         vjTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795455472; x=1796060272;
        h=references:in-reply-to:cc:to:message-id:date:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NgtEXJffBQpLVIiTDFBBAZOSsnPW9SZ70tTul+WiIJQ=;
        b=UaYn3A7jUiexjgBaMRPHxTMagcn0AWOy22OFsDz1fAgeUXnMzCK/mZfG4SpPySs7fj
         E9AJWIgQEyWYPTTrGZA+oz8Q/JxnKzl9+F0yCPHsltp9x5WuRKDWt9rOin4xQlU8xbyb
         SUgcFayg6YtmetkiK87n+LK2/SVTk8XRgF8m18GXorHTjuuJFXqeFY/OVgBvjaZZNxsu
         s0TS3hCz8AOl7OWbGvysYwtJAgP2yfpQYQmHFGy9u5LUGkAeEKwg1mz+GKe97Tje5PLo
         b4o0OnJe8lCA+IrWjGKc4wcFbbkzpDrPifUZ1NAO9JwPvZJ/i5nYLLDJo3Q7IZSmJBZo
         6HDA==
X-Forwarded-Encrypted: i=1; AL+hErF4Zsk2NEJ662qDqljj8gwcLC2ijLPLREBKxGWUhLUJ86PAzJt6+x6XugqzI5olqrPN8Gfb0Y65Z0k=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Zd5yD31pIoOAlcmx3IftkAR8eLnSM2LIzaCThsqvGM073Hwro
	YJNe+br3ynMYYx2jQLODhgtaaCzkzGzIr33e+i+fVZfKDZxtmO3Xlj6R
X-Gm-Gg: AZFdTZfp6JGDJKogzIdeU7Vag4J3qMeSZn7NAKa6ZaM66o3HQ0pvkM5FidIInakWUjq
	wQwdV5xY5XzJO6dpGExz+mf7gkDqukjRJQc6MBvjJbTJ294xVOmwq6ZTICTRkvdqWfR1q266pKL
	OAwKHqQ7dtA4/pw7G9EU75gh329mNYaMxZ9/JJge7bpbSJ2mJr2a/Ht3V+GFqN5n1HfHCVK6Nra
	PmTogsgBeqyYiHmWY5az/ENivXPEBZ0lKBY4On7om0OuyhQ7SqVvGOqwJDKclrgxwzn6h1mY9RM
	6bMhO76qE1HnEvS24XL/j9ohFRnOvQyPWAzzfHQNNAI0iMuI2Uz+CY9nkawNguNhhvKgiT8uc70
	oJkd9HLihjbzKIIxQyCnmwG77V+8Cy5aNmKuVHU/c0i23qPz6q3Zqef/INPirP6GF54We5UkUYa
	jZwHEmJIEF7uuSx0gTzxURjJIPdpmciMKpKdCOMcCpv4vn4Iui2g0OmjG5pujvhblpUouYrBZBb
	5PzHAFKznaC1CZo3mbfD5MwXeW5jlXJ4kYcayumGeSb47hPb/ygnu4SgZ5VCvGebEuBTM1gg8E6
	eH2fF8CkOJwmycX1t0gA2kherQ2ozSuc18qtq9Yw+opNbHjJT086n9UNgQrtWV3ERibJ/enj61J
	sPkvBLO/n+OCdxlmu7Lv7JAHvGaKpuSvEAA8nY0I1Kl1O5Ra8Ul+GjTsWjyPYdA==
X-Received: by 2002:a05:7301:e0cd:b0:375:dbeb:b363 with SMTP id 5a478bee46e88-38570f221dcmr13195033eec.28.1795455471745;
        Mon, 23 Nov 2026 09:37:51 -0800 (PST)
Received: from localhost (n106-71-19-159.sun21.vic.optusnet.com.au. [106.71.19.159])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567abb870sm31532302eec.25.2026.11.23.09.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 09:37:51 -0800 (PST)
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
Subject: Re: [PATCH 18/27] Docs/admin-guide/mm/damon/usage: update for
 REPORT_MADE probe filter
From: Aveline Noir <jm5905938@gmail.com>
Date: Tue, 24 Nov 2026 03:49:24 +1100
Message-Id: <179545256491.4.1283840104529125616.b4-reply@b4>
To: SJ Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 Jonathan Corbet <corbet@lwn.net>, damon@lists.linux.dev, 
 Lian Wang <lianux.mm@gmail.com>, linux-doc@vger.kernel.org, 
 linux-mm@kvack.org, Randy Dunlap <rdunlap@infradead.org>, 
 Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20261121210013.130397-19-sj@kernel.org>
References: <20261121210013.130397-1-sj@kernel.org>
 <20261121210013.130397-19-sj@kernel.org>
X-Mailer: b4 0.16.0

Hi SJ,

On Sat, 21 Nov 2026 13:00:02 -0800 SJ Park wrote:

> Update DAMON usage document for the newly added REPORT_MADE type probe
> filter support.

LGTM, thanks.

Reviewed-by: Aveline Noir <jm5905938@gmail.com>

Thanks,
Aveline Noir
