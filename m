Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792975053;
	b=5RYe2gkx+JdngVgfsX4lRzPomofZyXkHxdfYNXpEvRnUTWj4ufub8rJrtbSJQvq2q/77
	 LNHlZ8Y7VX3jbhlfVQUYLX6TjyhGy0uDo2QWm6Ogk71q4CkEUJHUtHa3VavyPVLf7TFN0
	 i3vHV2KncCYAlj4U9uYjH+lwxKjTCN4VizQPtZXlduE/aIVyW4A1Ppk8na5ua90dqg2ys
	 skyq42rJWflzKSa8weX5meclZpf3+KabDKQqfc01k7GdTZCSpbyxSSkyMZHBswqqVJzgU
	 EVFRIEWSVcsRyfmmQY07iHEy2ixDD7c0txIm5deOaM3NiJEw7fpsgJkM8Pk8PN42AFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792975053;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=/r2wCtdnrDJsEXzwIAQNFz7BfQauVg6nVHFaCnIJdp0=;
	b=kl2ZXz2wzrwmoC36WWLWQG7cRSOlWLU8cGGzDHKDMzL0kSzIMXT9aO0Qa1xxFI5l95mn
	 2wnWULgY+A+yzX9Zb+ZQa2yDRBIriKXbLS3RQ9j9JqTZHAMKusKuHDK1xCPPZCaeIA8Gy
	 TnvzfZtK/P/ACQmVXAzNCKdjwel08lWb7QPB2I5v8FkwoAN3XIFo3TpvufyLaEe+n9PLJ
	 sGt+Lpc77EKiWbNByRYPvqovnpkLXQaKH9PJtzilN870ogNu5DzCU1W9a41J6CcuA+nSZ
	 LaDX9e6uRFAUNNwao3ofoghBbW1zMd2hdFHazWbzqtGizaOlun2afFQNrQ0QDfs4FVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kQ4KO2JE;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D6E606A31E
	for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 00:37:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74D6E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kQ4KO2JE
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3ab752f6244so2253035a91.2
        for <linux-doc@vger.kernel.org>; Sun, 25 Oct 2026 17:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792975053; x=1793579853; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/r2wCtdnrDJsEXzwIAQNFz7BfQauVg6nVHFaCnIJdp0=;
        b=kQ4KO2JEql3oihR/SCtBt1vJKCgrVRl25/fb2gLlEZFJPuafW+8/uX0PuylfUgsOeQ
         ZBiFgxQamRcLUW/InXMrst3KtjE4PFLNoUmTzwWab9UKnsDnwpjniuqfFR7LRGOSs54E
         NDBHGmnbJtXdkmD81sndY+WXvXwNHCUvdPBon1Iz5VJlwYL7PLSbJxnoLzmSJY72zX9u
         VDw+njuTy+YQhTtd3HZqwgQvEO0eQ6c4VExJt78JybsY6X3judkiVcwhlQCUBSLwGfSe
         jSauTJB8gN2PthrXekPk0v2YN0Trk3OUmhj9F0TzJyV4FcQl9D6vwG21LroJpTEuVOIT
         +0XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792975053; x=1793579853;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/r2wCtdnrDJsEXzwIAQNFz7BfQauVg6nVHFaCnIJdp0=;
        b=MBpir0ZfF8JxfrUrXCrvzBTP7iaauZObMvt9Vzy61E8uhGbbWNG3T0rlz3W8ljpgRr
         mxsHwu56iV1yUaMa303o3S4jRkuKPNZm15iwNz7OhzVDIBd6xdSxZ7QVHeFmKtnkcWYI
         vQUEpXwYn9RcAcw6DAdCrDVYstsreT00pb1EGg4tdqGj1tpKuDyjyZn7psF6OfU6PMrN
         PnX2tWoRj+XakJ4YlXcGD5CEkjt6YwYhajZOhxDQi6WSt9JzirL3rNnXi0JsnqLzEkj9
         RlWR1NnMwmxRgyMu2yubTs7oChcFax8ckHOb0nxk6hKD1+hdwZBsd+ruTtaLFcrhXNeH
         WufQ==
X-Forwarded-Encrypted: i=1; AKwUvBydWkQgcMC/wqtxUn6I4u4sKgJuqFO0BUOSY2rYTBWBECJ8+M+ydf2gHpzeTFbqlFhT2dG1LrbpLtg=@vger.kernel.org
X-Gm-Message-State: AFq9FYInZgPTnbLUJJiGTcySwk+04zlZr7RdaCoNPjbJRoc9GS6HlJrD
	jOecyjD76RQbHkz/mvgYo5qdBhy4WJBfap2uAHKO2ELzmQcZqnI3Qaqj
X-Gm-Gg: AYBFou3KcUbWVrUC28XCxNHyiTCxsWR8r3RU7jcea+ONlUt/P3qrtn4YgYatSbQs9fx
	AfpkUi95CM0/YXPXKOgz2w6xB18W2Zhq6IlY+sJPopKLv8EPMtqZ/JyyMLdBWQ7O/+Jd7vIT96P
	Jd8MHsaEc17HK8g4ZYz0HTO7O9zMqi1VGb26RipOQWkcEVnvDFBooioUsGDiblarrkgXBsDqPiZ
	5Y0JU5bXGqARfrDPARwx5C39k8yB6zQVCXjlQnydHrERkowg3cKKeBGiKqjv971NWmveb39/71D
	mkfR1bZff5sCG93jjwlzt+CYO9k7S7JjYO/IJdx/5oI5wXfZ4INtEVDHdKpj2BpZlan6ChdpF5m
	daJox1It4ZIN9MOJfEI5kdP7DOf89Dhjgp6GULiMufIjQlet4dZyvL71t5x/bZlhPoq76dx+iWf
	Ol/uFGlbDJu0iuZn+Lsf1ycn7nrQs3L0yx1zIXOuaYHpK1gdKJ9DNd4yU5TPjqeBUpZ8cYhs0Xk
	3APUp8DbV3WCN8WdoqsocpKfTv0P8JK652kf46pD3mmM6MZh7IggFit6PPBdy2gljjocQ==
X-Received: by 2002:a17:90b:17c9:b0:3ac:a139:1b14 with SMTP id 98e67ed59e1d1-3adeafc4fddmr4768147a91.57.1792975052754;
        Sun, 25 Oct 2026 17:37:32 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae29c7e756sm600001a91.16.2026.10.25.17.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 17:37:32 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 25 Oct 2026 17:37:31 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Lars Petter Mostad <lars.petter.mostad@appear.net>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 3/4] hwmon: (pmbus_core) Support relative encoding of
 vout related commands
Message-ID: <30747603-76ac-4032-b3ce-4e24f1a5f55e@roeck-us.net>
References: <20261020-hwmon-pmbus-fs1412-v4-0-27ece4e43d04@nexthop.ai>
 <20261020-hwmon-pmbus-fs1412-v4-3-27ece4e43d04@nexthop.ai>
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
In-Reply-To: <20261020-hwmon-pmbus-fs1412-v4-3-27ece4e43d04@nexthop.ai>

On Tue, Oct 20, 2026 at 08:02:07PM -0700, Abdurrahman Hussain wrote:
> From: Lars Petter Mostad <lars.petter.mostad@appear.net>
> 
> PMBus 1.3 allows for relative encoding of voltages in certain output
> voltage related commands. These commands are encoded relative to
> VOUT_COMMAND. Support this when encoding/decoding commands.
> 
> Signed-off-by: Lars Petter Mostad <lars.petter.mostad@appear.net>
> [abdurrahman: rebased; check VOUT_MODE for 0xff before testing the
>  relative bit; use signed division and clamp the user value before
>  scaling; reject a VOUT_COMMAND that decodes to 0 or less, or above
>  INT_MAX mV, at probe and from the regulator, and scale the relative
>  limits by it without overflowing s64; update the cached VOUT_COMMAND
>  only after a successful write; decode the regulator margins with the
>  register they were read from, and in relative mode bound the output
>  voltage only by MFR_VOUT_MIN/MAX, since VOUT_MARGIN_LOW/HIGH move with
>  VOUT_COMMAND]
> Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>

Applied.

Thanks,
Guenter
