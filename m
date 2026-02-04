Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D908366802
	for <linux-doc@vger.kernel.org>; Wed,  4 Feb 2026 07:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770189125; cv=none; b=LGtqA+aB0VbPzqnF83hxEH9TFGwAip2ITFlqtokBFPWEtXSD6+NxJb51axknBIuQiZUasMmgXUYKetdCwAZ5oFFuq773u8Y2xN5ffVaQr48lA9hWbFkeSZeQ+0NR320WUwQMarRuyzamLkTk5Pxz+ds0TC1OKDVAJMmqopX5ZNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770189125; c=relaxed/simple;
	bh=i2gmBapXr7BeRcHIh6yZN89wQPgVWerFuKcVi5666t4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fbsiMtjukEoD4ZBKg95OwZ6QUMWrAq5iED+EaBNKYMiSFyaa0mlS67CdGprRWBi/vDG3SOjTgIV/KW8eanhTLRGiHDAPc3hZmqiXlnb/N4y9SWpRNQJZMLVHFHOno3AuZUk8Ea5PGztFinSSLPvAJ7e9xVHgIjJabGWFQumPqZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=nrCTIdAB; arc=none smtp.client-ip=209.85.128.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="nrCTIdAB"
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-4801ea9bafdso2181845e9.3
        for <linux-doc@vger.kernel.org>; Tue, 03 Feb 2026 23:12:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1770189122; x=1770793922; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sRhtrQ9/jhzrEfyf0zU6+VS4W6Vs4vnnpMJiEJhAMj4=;
        b=nrCTIdABlWzStCVMICGz7awLjOO+9UZnyaadW3I1z2UFc7Qg++Ql4kotKvZ3TU8BLB
         JhrTNOnjdFe++8hMp5uvfUU6H2HT24jRMLT8fPoRch4QdQz8yVe58F0jjIz7i3Wt33oN
         23jPohArNx1cRghEm+UEkz7baPSQ2JEJVn7JFqsUyy1w2XoH0TlaK0gH4wByDSatc/mB
         fUjwaUt+40Lgvdo4a7p2uK51zApMYCs2sRFtKi2PqG5tUInlrIECT/XaA0Zi1qM/J8Ef
         yeqxNSLulBoar3+VgdqMSdDhY2NDpJkQuGyxO3AMESaHfVBRSO+ilwpZqW6eK5p2bmU1
         IuIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770189122; x=1770793922;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sRhtrQ9/jhzrEfyf0zU6+VS4W6Vs4vnnpMJiEJhAMj4=;
        b=al/zWFYAO34kWV4ocJ0sIb8t5crW4XngS2Fr3BolJXcZyvIYipklyc/vrTNxwi2/mc
         UB9ceN4uI/IhRSRJI5azjpQIFyR73s+/bMKZBVtARM2PKWGMj6wy+48htm2gVgOAPlrq
         AlTqi86qsQ3Mo79KIR0/cJsHNNxzveZV63LjxPbN27wX7l0uFIBOQDQShea/FV5p7I6O
         ZFw+DQV65K9DXSizDXVVucLPEFz7ttZildbmHuOVtgSX/3Wyate1JVDc8JKyHqmj8Wio
         V4QO7PbwyjKGD0axe0UNcSHrB8UFNM4p7b2/uyGsa6r5wf0XT6h6lMXgPpQeZgZuTwfb
         j3kA==
X-Forwarded-Encrypted: i=1; AJvYcCXL81i00D7KkUsIhFiVFzB76pIi9qq3ayqZUjmrEjVq8okqSwp4f3xRZcsUPhoO3lt1xee6EGAAkN4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxERDNZgmhnmj6C/GaF5kJGGNlqMmjPaSjEssD1juidF0g7ydWK
	QkzdzKaihX/84MH6uKhIseRvMzSlu4J0k0bv9+tL1vop+EFA73K+XpTlr6Z/V2sC2B8=
X-Gm-Gg: AZuq6aKDQv3B1jMx9yI5H75gS058AdQt+Cjq+EkSlbQRKIvaofGWippKTJKNG2kTDAW
	lLHmUPdiH16+o4IwyQ3iF3HmWpuKumypY1mDlCCOt3RAe5Unk+FKtJpyCMeLhzxHxrMIlqdNdxd
	dX89awfVnhxi3ZCv22PRx3PyOlNXj12X7yI+P0RhNbSinUaw5UV4RgIm8DpFTfGI2wCSTTuJk9d
	Ln0yGm8L5GZZCgsMIVMto0yeo8KnkUWjkQqF1JiNW34Zmk4kUnK6Hy2XASUrS0vo+rx8fPHG8gY
	BU5vF1K79jrYuUlrwMgLaT8IYTmTBjREGY427ZOj426TYECgwMbKYmow0QS9iM1UGjjko5EP7uD
	RCC2tCI7bfD71BvXcgnUMgiuynusbLqBfqWbVieQWZm3MP8XJtjEobeVvtJoU9XMnsvpgOH51Yd
	l3Sc/wpT1J7JDkTFI3lSynhJ1Q72+IhUA=
X-Received: by 2002:a05:600c:8b30:b0:47d:264e:b435 with SMTP id 5b1f17b1804b1-4830e96ada6mr26786065e9.22.1770189122438;
        Tue, 03 Feb 2026 23:12:02 -0800 (PST)
Received: from FV6GYCPJ69 ([2001:1ae9:6084:ab00:9519:b02d:f49f:3f52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43617e38ec5sm4645607f8f.14.2026.02.03.23.12.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 23:12:02 -0800 (PST)
Date: Wed, 4 Feb 2026 08:12:00 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Tariq Toukan <tariqt@nvidia.com>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Donald Hunter <donald.hunter@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Saeed Mahameed <saeedm@nvidia.com>, 
	Leon Romanovsky <leon@kernel.org>, Mark Bloch <mbloch@nvidia.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-rdma@vger.kernel.org, 
	Gal Pressman <gal@nvidia.com>, Moshe Shemesh <moshe@nvidia.com>, 
	Carolina Jubran <cjubran@nvidia.com>, Cosmin Ratiu <cratiu@nvidia.com>, Jiri Pirko <jiri@nvidia.com>, 
	Randy Dunlap <rdunlap@infradead.org>, Simon Horman <horms@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH net-next V7 01/14] documentation: networking: add shared
 devlink documentation
Message-ID: <3edheaanzxgutuyryorfzlfjvizlorpj4y3ard5js7mp44hfii@4a36de6wazfd>
References: <20260128112544.1661250-1-tariqt@nvidia.com>
 <20260128112544.1661250-2-tariqt@nvidia.com>
 <20260202194023.412bb454@kernel.org>
 <u7uicnxkcirhacpzjimss2pqsuhbngg4ticqrz45iqchkk2ha2@t3eem6w6hhur>
 <20260203190105.2cc28e71@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203190105.2cc28e71@kernel.org>

Wed, Feb 04, 2026 at 04:01:05AM +0100, kuba@kernel.org wrote:
>On Tue, 3 Feb 2026 10:18:22 +0100 Jiri Pirko wrote:
>> Tue, Feb 03, 2026 at 04:40:23AM +0100, kuba@kernel.org wrote:
>> >There needs to be a note here clearly stating the the use of "shared
>> >devlink instace" is a hack for legacy drivers, and new drivers should
>> >have a single devlink instance for the entire device. The fact that
>> >single instance is always preferred, and *more correct* must be made
>> >very clear to the reader. Ideally the single instance multiple function
>> >implementation would leverage the infra added here for collecting the
>> >functions, however.  
>> 
>> How exactly you can have a single devlink instance for multiple PFs of a
>> same device? I don't really understand how that could work, considering
>> dynamic binds/unbinds of the PFs within single host and/or multiple VMs
>> passing PFs to.
>
>The same way you currently gather up the devlink instances to create
>the shared instance.

What's the backing device / handle (busname/devname)? Best would be to
draw a picture, as always :)


>
>> >> +The implementation uses:
>> >> +
>> >> +* **Faux device**: Virtual device backing the shared devlink instance  
>> >
>> >"backing"? It isn't backing anything, its just another hack because we
>> >made the mistake of tying devlink instances to $bus/$device as an id.
>> >Now we need a fake device to have an identifier.  
>> 
>> Okay. I originally wanted to use an id, similar to what we have in
>> the dpll. However I was forced by community to tie the instance to
>> bus/device. It is how it is, any idea how to relax this bond?
>
>Interesting! I was curious to research how we ended up here, found this:
>https://lore.kernel.org/netdev/20160225225803.GA2191@nanopsycho.orion/
>My reading is that Hannes was arguing against the _NAME attribute but
>both _NAME and _INDEX were deleted? I think there's nothing wrong with
>an index.

He argues for "stable topology indentifiers", which randomly assigned
index is not.


>
>FWIW using devlink day to day, the bus/device is not at all useful as
>an identifier. Most of code touching devlink at Meta either matches
>on devlink dev info or assumes there's one instance on the system.

Okay, what's your suggestion going foreward then?


>
>> >> +Similarly to other nested devlink instance relationships, devlink lock of
>> >> +the shared instance should be always taken after the devlink lock of PF.  
>> >
>> >of an instance, not a PF  
>> 
>> lock of PF devlink instance. I think that is what the text says, no?
>
>Sorry, I was trying to flag that using PF is not necessary great cause
>we may support this on other functions in the future.

You are right, will fix this.

Thanks!

