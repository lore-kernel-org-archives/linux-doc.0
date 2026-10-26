Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793048247;
	b=UmrjC/rAMVmyNJpVwPEWOi/z65Rt2iePTxXxGE6HLtsIfCa2HhETskHGuSkCpXMWUmAu
	 wBk6MAVBDT4NXjYsd1ntzeDtdvDaFi0zTzepxG1AtU92LPPa6I7zuDjxVk1+kM0J6q1Mu
	 Psqd4fm+0Rkdr30eyBvh1gcAE1Qnva7VX6QxBX4YVDpG9lzzeUNG6F0DcG74Zn8FLLd/j
	 hUYYibNI1GV0gBl59SqsCkDZmRYgkdPpRAaqMl0bOtcdSae0S/oDrakVAcXL1LT3a68WC
	 jgA9FjdrsQ/Oj+x1gm2SRCaE06sRIpKbrJ0X23pLsl0bIoUUetznSrinfhJlESPUWDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793048247;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=gVaw9mrhCO1RVtyfenFMqeXyg1oQSWJjgFw7LeR7BOI=;
	b=wcYj0adfp1aDPkvfWZGzb58ZBISITplAo0wKOPFwfpIi75Kk01yLAzoCEeQg8eEwME/v
	 F/IYtqcUYaJ8RqU6b0Jfl4G7T8JLMb//D5UJENRvaG9KGgL1cyMX3pdIAmS2SQ3qdio81
	 +1pQG0EayAP+dSj4g0idAxzXUoTtYgQ/emODQh5CAFSUgDmfhHar8Wr41FLGl7ja3GNFr
	 4cCrOpECRSRmPrew2O0pQp07wSLqpuzUaQgr4aOTbMBK7wAiRr8Hfl+V4fABtodpNpnuW
	 ec1ALuhej3wBf513qUphnOnY7gkCIcmAUaXiyJaDApoVEp4pf+7AgPmu7uNTYvXvcrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SVKvyrXn;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21767606A31A
	for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 20:57:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21767606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SVKvyrXn
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-35cd4e8bdbdso5636859eec.1
        for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 13:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793048246; x=1793653046; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gVaw9mrhCO1RVtyfenFMqeXyg1oQSWJjgFw7LeR7BOI=;
        b=SVKvyrXnxaxe3wPPZZ1ORnZQD+FmJn3puBBneOzZPNYO1atUqVpzFkYCg0tlekPSbq
         oec7KSDZC2EmgC2lgU2WejVpB0D1owomNjdecD7/lAIj5RSVH9xPNz7fZcUWPdhhgcqk
         PQn4cR2OpyfjawPUs5XnarLKpLJpSsqe2j6y+MUvVNDbhocTXH47tMn0EtKJXoqHUHpq
         fqrQPAFSOLCDcF3MZ4MuoMas2Yf1nPqkcZDJFzxIxs4Jb5pedpVbtzQWyYM3Kl3QEJKe
         V9wjgLUNbTDJGYc2bUBb13eU4CKy+/VYxoR1Vy2zn5cFPEHNvcXgvkfpmLN3YR9LItaC
         w0sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793048246; x=1793653046;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gVaw9mrhCO1RVtyfenFMqeXyg1oQSWJjgFw7LeR7BOI=;
        b=COchD66W9DCE/wZNmx3DisuLkIEs/yUFsakbzUQzp4RkCvK3m6IWFcZV0Z+zFNLGoh
         EZVREFRaI8eEg03O+xIO9gj5YshnJ4HGks/lmISEFBI3vVkvl/+51hUXOBKReQvd3TVm
         49sHcgK5+0b8xVHog3zaxwU/zkr5HvHZDdp90ReTb9q6itoy/eWiOEWCsLha2UbK/xJ/
         h7Cz1g95ZVlIVlNL/ccjtLgkC0QJFUl7EXRRQPA4CDl4WhhgvQldrKa6LXM4zvYOCR60
         NTkieiV01BM/QwxNA+NI9j+wHUBrgvThcxiXVny9s0lz4iG4A8zR/r3ejs0+XZrlVcwK
         ukQA==
X-Forwarded-Encrypted: i=1; AKwUvBwPD2OPY27UNSA67X6pXQU5fyfOr2Oe76pwyxkgrds1efM9yKuk+DlUaZhfR/lsHt9yc7CuIaZ5XRo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ0FRuRe5K3q90zlhIPM7sETI10+9AOOK54oldfrrdzqYXVCK2d
	cYbk09tIMKp5UBnck4BdEsHXXNNmekB/uYktyInCokeE55Uu1SPwIw/a
X-Gm-Gg: AYBFou2gNCixZHcm2qsObKThGjPYhrPH9tsPoFWGBMYSKRYUrLCR81ZosT3E073w2Mu
	DLXIkqKW72W594q0NKieZNQzalMzqk8j915Ju6/n3jrw/ieJI+kjjV5ffnk8JDR+Zr2NrjFTZ4o
	u/kTB6IbNxoprpgIq6dDVsCR09opVUN6gpWTUuZOBNpm+CRiCb4Uei2JblKBm0eFkX8MBwzRs7P
	p3kEwpT94qsF7cwQoStXVhtv/owtlVxx1xYbgS8yJ4cHTH5/LToSc13qR8/wSAorBzDlO2Ot+Dl
	IOl4PIXcA/Z88lI5r4Bp+/fb5u9vLf8ko7upG34GcHCHE+FsFjv7nxA/jqWvBnfWNRxAyVz4fcj
	4xdmpTtKZVVbU4ryO+jEnLhmMRTG5fxeRSG/g/E7yaqY7S475p6eLRyAnaLV4Irn5GyQhp/DUM5
	b5a89K5w+N6Vdm5d03nV7X9KwJMd/Npp948oTwJJbrmYSzXseiKcTRJhrnucU36O7jUb50bGzQB
	yQA2ZSOXzts9ux9Ge0Pexrr8KjP6iKlAko9qK73coirnEpDZxr0epzqkAodUoeB2OAX70SKeXwX
	5wvsaWLypvI+DHY=
X-Received: by 2002:a05:7300:7fa3:b0:36a:fec:d8b0 with SMTP id 5a478bee46e88-36a0fecda6emr1183915eec.25.1793048246156;
        Mon, 26 Oct 2026 13:57:26 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a064510b0sm10004470eec.2.2026.10.26.13.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 13:57:25 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 26 Oct 2026 13:57:24 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Alexei Solcanu <alexei.solcanu@pm.me>
Cc: Cryolitia PukNgae <cryolitia@uniontech.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Antheas Kapenekakis <lkml@antheas.dev>
Subject: Re: [PATCH v2 1/2] hwmon: (gpd-fan) Reset both fans to automatic on
 duo boards
Message-ID: <481ec234-15a1-45df-9e7b-9c280ddde9a3@roeck-us.net>
References: <20260926-gpd-fan-duo-auto-v2-0-0a2ea41ee3b5@pm.me>
 <20260926-gpd-fan-duo-auto-v2-1-0a2ea41ee3b5@pm.me>
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
In-Reply-To: <20260926-gpd-fan-duo-auto-v2-1-0a2ea41ee3b5@pm.me>

On Sat, Sep 26, 2026 at 04:11:20PM -0400, Alexei Solcanu wrote:
> From: Alexei Solcanu <alexei.solcanu@pm.me>
> 
> On boards using gpd_duo_drvdata (GPD Duo, GPD Win 5), writing
> pwm1_enable=2 only returns the first fan to EC control. The second fan
> keeps its last manual duty cycle, e.g. full speed after pwm1=255, so a
> fan control tool that exits leaves it running at that speed.
> 
> gpd_duo_write_pwm() writes both fan registers (pwm_write and
> pwm_write + 1), but switching to automatic only clears pwm_write.
> Also clear pwm_write + 1, so both fans return to EC control.
> 
> Tested on a GPD Win 5 (G1618-05). Not tested on the GPD Duo.
> 
> Fixes: 0ab88e239439 ("hwmon: add GPD devices sensor driver")
> Assisted-by: LLM
> Signed-off-by: Alexei Solcanu <alexei.solcanu@pm.me>
> Reviewed-by: Antheas Kapenekakis <lkml@antheas.dev>

Applied.

Thanks,
Guenter
