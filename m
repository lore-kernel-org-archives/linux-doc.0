Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795767353;
	b=QHKfN89pqSiWbkB/ZtKD9I/4Z/a6oDr2M5GnXFKNvrkC2HliTWNv0s5AylcW01CXOc3Z
	 ynKtzOt5cbnk62suVE2LwmgqBeJ5i9wXMvOPHNVWen9tW0CqLv4G8id7dWGTmkeK72H6t
	 PZQdTKqNSsi7SMr6MMMHcjSsRBBxX4U37hWStDBtuhLmWqp9p00AX5+r/knCtLd1gtkOK
	 xZAoSlFQ1BXz6tfr1C4pg1EEq3n73R7AUUTfIjEcsuGt+P1P+IY0MoF5y4pMYzKTZy99q
	 8NZdecH2XrO7oB+CHwXQaYiX4ws23NdVDow6JZyqrlPIPMfr0zs54nnebnFM5rDHT8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795767353;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=xSHbyuLo8+jHlfLB0ZEI4lSFJZKYzZWMHdxr04F6zYY=;
	b=ZkS4S1yDRAwFJ781dvLyOnRGi0jc2YT4+FIGOHZ8ooOvf2EnLYiyjxniPNS45KJ5UAHc
	 5kuekqFvkDXEwIhxYWNTsS1eXn3pB3/EzsI1cFhw2OXAXxRVtYvZTDzLwpkO7e1IWtwA+
	 eL/Csa7fBcHViUtRbIb+Gf0twa71b9swQsllCcr9HBSuFOAoMREtJnBzZ7IrCr7U9t3g+
	 Lb5eKrqqGUgG7yE0hspvNfBCBhEMN8bNsWTJTAS3NaiVirWAHieVhwdcVSIDA3B9rwjcm
	 FQjAuK+uuc5awlx8/7UoBddHkpakon7msIHS79ny3nqG9vc5vhL+mrs7zhOmEqyoB5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TL9a2m8z;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75DC3606A31E
	for <linux-doc@vger.kernel.org>; Fri, 27 Nov 2026 08:15:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75DC3606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TL9a2m8z
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3b09a83d12aso5487161a91.2
        for <linux-doc@vger.kernel.org>; Fri, 27 Nov 2026 00:15:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795767353; x=1796372153; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xSHbyuLo8+jHlfLB0ZEI4lSFJZKYzZWMHdxr04F6zYY=;
        b=TL9a2m8z51NMpG3KmEXqbNcNivDxdpeGg9HP7gN/rB6Q3xmBqGs8DsHbTV14WPToxZ
         JSVsQGJZbmeeOj6stIr/yvfZ4bRTEEzUVltNcco47PEZGfLhtzmEEWW7AC6QI7NHwk3r
         tg/F8Sj9nqCbVWNuwjaJ8O7GZKAb8pMNG5+Bp0/0ld+8VR5id4+q5kaFov1p0yJoe7wt
         GLfWj7g56t+68xZ9onjc7an/gGFIkHPZYubPjel4KzUO1nP8E9tB8yyk0qGS6Z9TMyY9
         WclYB5CpdCswwWMrSmP0boNoMqCfP/5sNyH7hkvmT2oFPFPuXw+S45UWG3+tdXauavMZ
         FKQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795767353; x=1796372153;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xSHbyuLo8+jHlfLB0ZEI4lSFJZKYzZWMHdxr04F6zYY=;
        b=uHzCme9WGehF7lmiEgj8Maz87OmaxP9tRIXO5Zk9qHINQ4bj4fC9IPdqMDo+kfia6h
         MPITVKmgp34Rzepa71nVYgRr8hxj7LZTrORVfBmKw1Mql/PE3LuNjFanmQ1X1226k2aL
         /TvUDB0YQY9xtCAomqNp0rv4AnfBy4OIoLHRDQTnp1KMzoaES7aARan6xBFGAtZCrHFW
         JU5i2SRIHDjPbEGQSrvWg7JrsBtp1+bzwoUA37xFBLJ9UHOpUkaBZH5sm/k2UvdE606l
         VzeTO69eJb5pqEqOfPWKSzla1WqbuFuxdbWI2F9rMWTUpPJwYyLKMUStFyILbi5l7r7D
         EMDA==
X-Gm-Message-State: APuU4Z8hlHCkUNSpgtBzn9rz8aEvRg/CEJfOZZTazbfnWyjscriWt3FS
	EyR+6ydgSs7BbhStfvPqKwuxeJmaOemePk7NQ32j0fBky6m4LyGNGti5
X-Gm-Gg: AZFdTZesBD4IAbj0sMtb9bTDFIgN2pD+EpPAIybaTo9L1eYG27NT/rv6bZx7Yg+kzxz
	WkN8A19DRE3qt/K7+P/PIJKrsJF4s7R29M7hBDZGzDwsYs9fi26vHrTso6i8f+sqwzSssG8dz+2
	dfnN2Ah1VGF68NlOzTbEzQDMyLnJ9cN6BSckN/RYxgFkqCaCcfqKb7Omnl1jetyZvAynP3ZxGoN
	xRMcwcIsdJYf/u/Ss3LJx4pTE3qPinBuVKOTGx3aumBJnkwDCWpP6h5oMRSmF9i7hkNJcVItqAf
	5NdBiDqAqFRlQNotdI5QhV21pMsENZstrSuErHNifhifObG/EC8GPxBNz1oLP61TipgIE267+lA
	DbV1kSpvg+ExStKYgn88x4/WvKhn1h6GnIxoQHKaOM0Ae9Wvpke/ue0uBgfWefDht6vWehqm1eC
	szaaFs0OYp7sMpP+b6EKszUselJGCuhp6vzDYhK35kisPAvQeuciDBhvRznW0FiZJntUbMLIkOQ
	5plbjZeGKE+k1LZP6qQGi7I11y+KAWsMvQWGur157PVagv8x6/niR/+9tQ3UPnJufo2421GtB9j
	0Ah83EfSougF/1eWhsISc4fcXRuX4MNoMXx77+zEXzXnwYc6Wz8=
X-Received: by 2002:a17:90b:4c4f:b0:3b1:ae88:5c31 with SMTP id 98e67ed59e1d1-3b41c959673mr24446571a91.43.1795767352768;
        Fri, 27 Nov 2026 00:15:52 -0800 (PST)
Received: from [198.18.0.1] (104.194.78.75.16clouds.com. [104.194.78.75])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ec698dsm39412779a91.14.2026.11.27.00.15.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 00:15:52 -0800 (PST)
Message-ID: <273c5571-8e0c-4b5d-a3ac-a716575fd1f7@gmail.com>
Date: Fri, 27 Nov 2026 16:15:48 +0800
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: What's cooking in Chinese docs (Nov 2026, #05)
To: Weijie Yuan <wy@wyuan.org>
Cc: linux-doc@vger.kernel.org, Alex Shi <alexs@kernel.org>,
 Dongliang Mu <dzm91@hust.edu.cn>, Yanteng Si <si.yanteng@linux.dev>,
 Chen-Yu Yeh <chenyou910331@gmail.com>
References: <awRWXw8KsV_TJs9A@wyuan.org>
 <5bcd13dd-5164-4a0b-bec0-c8fdd795cf11@gmail.com> <awkC0plVerzZe-hi@wyuan.org>
From: Alex Shi <seakeel@gmail.com>
Content-Language: en-US
In-Reply-To: <awkC0plVerzZe-hi@wyuan.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2026/11/27 12:10, Weijie Yuan wrote:
> On Fri, Nov 27, 2026 at 11:13:12AM +0800, Alex Shi wrote:
>
>>> * Weijie Yuan 2026-10-21
>>>     [PATCH v3 0/2] docs/zh_CN: cleanup headers
>>>     [PATCH v3 1/2] docs/zh_CN: remove translator-related headers
>>>     [PATCH v3 2/2] docs/zh_CN: remove Translator field in header template
>>>
>>>     Partly reviewed by Dongliang with an extra question to Jon.
>>>     source:<cover.1792569583.git.wy@wyuan.org>
>> Can not find in linux-doc emailing list.
> Ah, so sorry. My manual operation at that time must have gone wrong.
> Now I have a script to do this, and should be much better.
>
> They are here:
>
> https://lore.kernel.org/linux-doc/cover.1792745468.git.wy@wyuan.org/
Ops,  too much conflict on the 2nd patches.

Do you mind to rebase your patches?

Thanks
Alex
