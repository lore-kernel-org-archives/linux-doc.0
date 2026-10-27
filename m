Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793143327;
	b=NLqR2TBLHI3jTLXCTgfCdM2Mvzk7/ySARN1a2gZM0hnWJNnKlAFfmHSXBapeJTQMpXlN
	 dmdqfuWHsgxG25MVZF63PG/TjTniXVVQhHuZah8oWE1iWgydwsGEnVeKY2taPeEOoNIA+
	 N88a0z3GmSoA5hYXMGBnS2O3Phk2cH43bMXBjLrk0duIRvTaGVsJbKCGB0gwd8KhTPSy2
	 Il8p+RYpE64/AemIkpbq4T+WATzRn8a7wFcxAx3r6zSBB2wAfmxlgjVQfEu2OTYfUmdPj
	 UmkVK2UDgMX85WMLE+8nwgeWPn5dygbYbTQzsulyNYpBNW0O5HZtlxmjLsRk0Duu9Kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793143327;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YtzWIw2tmWzRFpwiGfEGzs4PBBxO5+sgv4xgYivcggQ=;
	b=1TG2KeC31ril0M9XIsqB6h5lcjNly++6yjlx5uwhBD5aK0xy2qQIPjNBtbwjBqUL11Vb
	 OVU32kVJ4O2wX3ha4TATSm055sspyshfipkB573A1PCrdYaNjFUNGijvUDh3kVUXyA6u4
	 GHn6b8i/yvTKTFhO0Lnab9vQZXu2C4kj5MXO73S5mWp6+g7BzWjXTkObITtHLgbWtmY7C
	 /NX7VybUyPPjscfJvVdyvwTol2UjCf0VmIuEUi2EjegujI0v6fSqWdh/o85xDxokjrSGw
	 6n77t1LewLupZwg0ZliQXmcl8XTZFKT9gzgxsorb2Fo78Iv3g7zB3gD5nLtAyCMiQhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=cnpHGUZb;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39A8D606A324
	for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 23:22:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39A8D606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=cnpHGUZb
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3282db206d3so745130eec.0
        for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 16:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1793143326; x=1793748126; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YtzWIw2tmWzRFpwiGfEGzs4PBBxO5+sgv4xgYivcggQ=;
        b=cnpHGUZbIKXsy7Jf8Ah8l/Y9ojHH0W/E2odwf9XisvJjDJI63dzMH3uQl4gs4gJ3zY
         xhYKKpqUSuwcBBIh7xhZMANRcfsp+FfY4S38Hc4kh4FtJ2GLgyHF28dPPi44q1COF8sA
         zcMhITryXJ0kjjf3S5BAUvlvehHxdXi0Y/2ipK8ASxMw5IqYCcNugp9iKd2sJMGxs6kE
         lMVFRaQdI25EEajy5Ab/zvquzVQL264Nq6TdiuavjD/KbJkv/cXQrfhW1ZWEloSXP0SX
         efAbTyBrke7ELIcdyFBRh+pzX7DvyVPJ+NdqDSc6RzNVirCSxg5pfATeR2I40+ii9OCA
         yWxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793143326; x=1793748126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YtzWIw2tmWzRFpwiGfEGzs4PBBxO5+sgv4xgYivcggQ=;
        b=QIxJ87GMBW5AaLOcg74kOlQNuH9TEKBfQWg+2E+8NH3cgkxgibLB7401fq+jD2NXr7
         wZxq8pD5K3N9VevuIVCeiXGyYaIGXe7NtwNa3ko0zJq8qADhAXqDAu/G+FInsgKx20yT
         9eJBJoIOlaVRor8jbIDiwoZtwQ1cDhIpc8ByNpk1+R+LYwMdbVJtdfWEtFqlGSJ9DPZK
         4qG1uT0dHcZIQdyllq9OTJ3ByWOo9Jkiu+nPJe9FTILAunVOMxHc+JYbLKeYnufinjj4
         0NthMI/mUH+dNGc+y6dOCjn2xr4uVdxVdDAnXQYwHuz+ryJGUKkF9WdoOjdN5qKU29BB
         YGZQ==
X-Forwarded-Encrypted: i=1; AKwUvBwvNSSXGZZyGq3ytj/VxumHjl4RAIFq9roKrpdjoP/GkBti+cyv3GfdEXWs5AUR2BMHshmtpMQyOPw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKpRepkBt0sNFJCD1gMhGZkP5/BhkM4cMFWwp+QfsYCc4LBEXg9
	PjlLOe6YxUT9ZzHYds7djryM4OxFJsB4dXEzx/kYlgY0hL6O1AUvSy3/JU5fDAclR4ibYMZrvJ/
	lKmyCgCw=
X-Gm-Gg: AYBFou2QJ1L6puXYUoOmZHUwTWYXVTiTQsPeZ5gwURnctfku6IAYeE799Fs1Lfad8FZ
	W5ImGGg4iq+eUMn+NU63kBOL81kXTZWpof7ME4b6/0/vpmLMJMNazPCnuta2mCGnxQbfh3Uqn5g
	UrtvVsncnHN/QKxagUzmNOPoG675vKDZzdgrXAM2umDxm+VA9LfEo3wTWU9No+3FW1oeCd/vu7e
	RMfka3qmzYpcs1Jg9+HqwynyxZR525d9fDeSPCiQaS4f1/Xy4YpnyshDkbTd8G1GIHnkGabOZSC
	etCiW4EYlKpC8k0Iie4fYL0fio6A533SdtH+b+EOAVoBeNjikivEgKwzgye7gjHFj0qRxN4mo4d
	t2MOMDaBcquUCnM6KDVTECJvOxuejkn7NITpJxCeOdgnaU3kPqJT7tVY4z+IzsoIzh9t/WaXJ89
	BvHYbYeJaHUJrkIvkzTVThgEerLi1q43V6FV7jfHHVLgFykeJHuJjhbs3VdfOHpZxq0cLqbSJ2q
	CtsD60lnki5LVonqD5/EZ0rnLjV51a4WePTmDWmRFCD+f8UMnOi23zXpr+qQ6UZV9AvCW+j5X8B
	kkaeRJz9M3IXxZQ=
X-Received: by 2002:a05:693c:8946:10b0:369:f7d2:d7a0 with SMTP id 5a478bee46e88-36a20407ad2mr1240160eec.25.1793143326214;
        Tue, 27 Oct 2026 16:22:06 -0700 (PDT)
Received: from kevin.us-west-1.nexthop.ai ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a238da3e1sm73101eec.8.2026.10.27.16.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 16:22:05 -0700 (PDT)
From: Kevin Jia <kjia@nexthop.ai>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Abdurrahman Hussain <abdurrahman@nexthop.ai>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 3/3] hwmon: (fs1603) Add driver for TDK FS160x and FS1006 uPOL converters
Date: Tue, 27 Oct 2026 23:21:57 +0000
Message-ID: <20261027232157.3395142-1-kjia@nexthop.ai>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <3735b504-30ba-4656-927c-d321248102e1@roeck-us.net>
References: <20261020-fs1603-v2-3-0986107a5cd2@nexthop.ai> <3735b504-30ba-4656-927c-d321248102e1@roeck-us.net>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Oct 26, 2026 at 03:04:45PM -0700, Guenter Roeck wrote:
> > +static const struct of_device_id fs1603_of_match[] = {
> > +	{ .compatible = "tdk,fs1603", .data = &fs1603_models[fs1603] },
> > +	{ .compatible = "tdk,fs1604", .data = &fs1603_models[fs1604] },
> > +	{ .compatible = "tdk,fs1606", .data = &fs1603_models[fs1606] },
> > +	{ .compatible = "tdk,fs1606-0600",
> > +	  .data = &fs1603_models[fs1606_0600] },
> > +	{ .compatible = "tdk,fs1606-2500",
> > +	  .data = &fs1603_models[fs1606_2500] },
> > +	{ .compatible = "tdk,fs1006-5000",
> > +	  .data = &fs1603_models[fs1006] },
> > +	{ .compatible = "tdk,fs1006-3300",
> > +	  .data = &fs1603_models[fs1006] },
>
> Why those extra compatibles ? I can see that -0600 and -2500 are
> needed, but the others could just use tdk,fs1606.

The FS1606 reports in 10 mV steps from a 300 mV base, while the FS1603,
FS1604 and FS1006 report in 20 mV steps from a 600 mV base, so they can't
use tdk,fs1606. They do encode telemetry the same way as each other, as
does the FS1606-2500.

So for v3, I'd like to move the bindings to a dedicated tdk,fs1603.yaml,
where the FS1604, FS1006-3300, FS1006-5000 and FS1606-2500 list
tdk,fs1603 as a fallback. The driver would then only match tdk,fs1603,
tdk,fs1606 and tdk,fs1606-0600, with three sets of model data. I'd also
drop the OCSet check and patch 1/3.

How does that sound? And is there anything else you'd like me to change
before I send v3?

Thanks,
Kevin
