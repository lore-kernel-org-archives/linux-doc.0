Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793047692;
	b=m0WnUfOufBYwCdRDDhWja8EYbbmTysTVUeGHumK9ktLd4npOZOal1KSgpEjsfupw8/1f
	 aprevMGps9jg4mogO0+2uU3sRM9r5105V6MJCCOPHjN8aXxWP9DtJqMC1VuUUtrCHkj8+
	 i1Mkhxig8fNW6Bu1mAPqRrzZ2+ZRd4lpqVqE+zutazRxV6+Lrtq+ofytbFTLXlV+1jU6g
	 3P+vUJs7Uq4zFte4iQZ2EcQ/DR5BR56nipOmZKzdrnj15dJinAzJNIDjGJdcuZwa1Scwc
	 hZqifnD3y6+H+JygyTozae/706IaolNJ9oUFFQzv+EkRXygM1iphJhdWs0dCsvcpHLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793047692;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Glp98pc/SIynZfFFbJ2RDbYRZ6AZRnouVLPAAYzRp9o=;
	b=J87gDzqJ4ec4P9lXA9qEnG8wrLgAhJsPnd51F1oAY6HTWLjnu1NZZ27tF3mySPGrl9lF
	 BmjdpneUkz5HlE4yqL2pmNx2D1W77c7gfHBKBUIty6BGCKIL/ppMY0KYuDfVTcimsZC3s
	 erRE81F15dR8YCYlStK0Cv3lgHQc5z1ucNg2pGNebLNnVlXzNz47t/9AXLJJzCioPmn8c
	 6wU13NTxP6ooTqpkG4i66v+dZOuhtM6k646xQolwSrRcI7JtiqXwMah+CwRo+7BrbVsC6
	 PN5JcUruYgbEMCB0J5ku/ZdpaIAwIQ2tQGKE+6ardmX/nU0aIQpwUg6e7RfISsrahTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KTZC5w+K;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5698606A31D
	for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 20:48:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5698606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KTZC5w+K
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3550c917fd3so5160820eec.0
        for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 13:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793047691; x=1793652491; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Glp98pc/SIynZfFFbJ2RDbYRZ6AZRnouVLPAAYzRp9o=;
        b=KTZC5w+K8RiWwTzcTwge2bRfsNiXTSiL049VP2sWKoRAF4OVkB6fg8a5vDxKXAEWoH
         5lhPqe8wzjSyi2HbnmHEfpe+BdXH/x+IQzRpSOAeNbEJ3wfT5MBGY0tOp7bmxzU8MsBV
         b5ub3iyL6GNijJ6SHc/fJY2ZoFm2TVfw3wy8TcsUzK9mEiW7KFqurL7h78Sc6nnHOcFP
         ZmNnYkYRG54oNH9yvTFDVkVzZAmdeI1HR4CbbpcNpR/Ax4mp+uNoljj423qaHhOts/wC
         GZrbWxqzpe4yuG3VAP2VP48MfPAMm7kcr54wgATuJXRmFq2mZKMunxSM3Zrfh09wWq5T
         trtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793047691; x=1793652491;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Glp98pc/SIynZfFFbJ2RDbYRZ6AZRnouVLPAAYzRp9o=;
        b=kldcYVIGyp/v4PvTbMvAQxguGAdShLrehHZx0ipz1XdOj7Q4cGvqz7k+eKBU7elVg4
         LcnJUtsi6Pl1tKxamtC9fVD4VLFrj6YfZfFA8C5+sBnc762WWyDYiB5wMyHT3jMkPSPO
         BZI5MCyG0dy0JcYeBcHoW0+VqrIsbNr/zg36QjkupgZg2G9eOV6zzWeCfMcZqiGQtt3L
         nFfQWcOKYPofBC40KOrBGzEmxsjmWEenfDsAjIvlt21BeTANhEgak0V6CuNIykbd5NOd
         myN5zRhA61q1iRs1jTwC6b94Nh4I1G41evO7Nu7PWMiW8PfQWAqg8bQyXCmNazqHB2l6
         zpoA==
X-Forwarded-Encrypted: i=1; AKwUvBy7QJzVlhZVdBU5Pt+CixSDULK8J6HnuTJ9CNCU4zZF84V5SDbtwUwx8NLE1hKyoHOllMpWRkZs8JI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJDKIqbBGS5rW8KEsnCDevSwkIRZOtimDKf50IGVd2RJAh+rjl2
	sjJlskZgGQl37XRIpbbhlPdzajIkEr0cIhDHWB7VnGUucTpqsxTQxGXY
X-Gm-Gg: AYBFou2vqN/mEIPYk/UXbw/kjrK+KObqJmMPfJsmYcP/QpgX0gCaqKe21PcH35nSz1G
	XYLR2lzr2MKr5yiNpsfcrLXb7d972hFe4kuCnDKNCsrbMdoNopwyOVR7dmxH7ZW6s3RWlcRR68Y
	uS+cGrRicNNUjBdrgyhQ0QoEZt7DJZaa7L8l3ui6xHKSh2VDF9Qx4j2xBWfzNb0u0J67El568WF
	+ke29HGkFI9CBh7ci0SP26XxxqAWyHWuzv3iQWVRkFnccS1vpv5ETG3Bdse3I4iMLa8nzS58ckA
	N3qsw0IWV8jc39K9kFhnSGBtCTWkKzSIgQlWwzAUQQSf4NTgIkmReckNILyK5KFkhK8h7uLLZUE
	SmEzWagES0hyGtpkBUI+QQbsO5AWPnQY267L4wxdWsFXhqKURRw4KkQavLTKL4NeDP9yfZt5wcc
	EgqwhqrUqE/bRB23KxOXbAHird179uLVNp5aCTc5eJSRbM6kR3FdIGde9JeTzoCPYxyLbNDZdQE
	/W4ZuGi+ikhZ2FXeIX8t7jR8rP8GMobkISGXlSnWz/3ekDaIgcVGUxd7XAcwmGKUdMuVyE1Ec4b
	0EVxRNj4CFLH8K/u367UU+ZezbkGVdWF8kFrt8t/Yqo=
X-Received: by 2002:a05:7301:fa2:b0:34b:5ab2:e200 with SMTP id 5a478bee46e88-369e8455879mr10717768eec.14.1793047690766;
        Mon, 26 Oct 2026 13:48:10 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec50bcsm51555058eec.23.2026.10.26.13.48.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 13:48:10 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 26 Oct 2026 13:48:09 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Vas Zayarskiy <contact@vasily.cc>
Cc: Aleksa Savic <savicaleksa83@gmail.com>, Jack Doan <me@jackdoan.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v5 2/5] hwmon: (aquacomputer_d5next) Expire the initial
 sensor cache
Message-ID: <f80ee5ea-a00c-4238-941f-5644ea966f7e@roeck-us.net>
References: <20260927191316.4137752-1-contact@vasily.cc>
 <20260927191316.4137752-3-contact@vasily.cc>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260927191316.4137752-3-contact@vasily.cc>

On Sun, Sep 27, 2026 at 10:13:13PM +0300, Vas Zayarskiy wrote:
> The initial update timestamp makes the cache expire at the current
> jiffy. Since aqc_read() uses time_after(), a read in that same jiffy can
> expose zero-initialized data or skip the first legacy report request.
> 
> Initialize the timestamp one tick earlier so the cache starts expired
> for every supported device.
> 
> Assisted-by: LLM sparse
> Signed-off-by: Vas Zayarskiy <contact@vasily.cc>

Applied.

Thanks,
Guenter
