Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2CC3603D2
	for <linux-doc@vger.kernel.org>; Thu, 12 Mar 2026 14:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773325802; cv=none; b=GgWKKK638M78C0bmljus98e7qUj+yqrqgQZ8TZISktFDpg1Gm3r4DpONNPENgbN+Z3DZU181jU+pcVasyJvBiTGyGPtPYHBbPuqG6hcNwDbnxiL1p4KJCPuFCo8+2R5DBwI/GvoTKzuPFRRHHXIAbAfGMCe8VsMcB7zn+PbjXcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773325802; c=relaxed/simple;
	bh=UWFL9/AlWB4G82QemscP/h3YWNXqRlJRdDFLB62NK4g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P/wj7U0Hvk91XvX60uB9d+BKKrSG/a8vLNej7JyYL0xPgOO8AGPk6H8H1z0BybjFAoNq/INxYyphxOTibb/P6HOrzbgNfL3EvEHmsr+TsJCfXOr17UtwQAc8PQNtCi9uFbUFqI3kBEDxbRs0twBmibEziyCwCgTqCU8E4czQlQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=kt1cPIX4; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="kt1cPIX4"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-439fe4985efso950675f8f.3
        for <linux-doc@vger.kernel.org>; Thu, 12 Mar 2026 07:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1773325797; x=1773930597; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EujO5n+9D3v/kt3E/tW4gqS3T8Dw8WwoBPDrs2+L3Eg=;
        b=kt1cPIX4SQMB3s7vdIw+iPpUjsp3fMEmpWCWkgExSGiljACs3dH/SJEMPuwFTVyT5Y
         QmcjwoYDTsnp0U1t/uc5GiqxTtSymRj1UHH89MIj7QAHXJJhhOH3KEO0Pu91F2b5I/yp
         2Zn2OZiNSS2REBgKuYUmmrgpj49h3LAWb/SmYINg6F2GiI1ijqgww1IQM1v6y6VrBLuJ
         aJ9x/lwL06WR7B+RlG1L80o7MtVM67Nk2sCZIsJGUv7taEF6pWthUs9KYZ03ymFvNgPi
         xZPYN468g4F8vKHGozCDxG4eVhEqgihGfhvQ7bgSmUsMkM3m0aUTPG2lzTDPzQzyy7kH
         Wc5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773325797; x=1773930597;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EujO5n+9D3v/kt3E/tW4gqS3T8Dw8WwoBPDrs2+L3Eg=;
        b=I0aqDUbr8V6QwEEdGLLVRRiOO10cY3TDNLVHRWw2IQ9tgJ3yQlt4G3gxQyui3ltMh1
         6v7S91b1YFEDDmDnsM/Y8c+oIidDF/Clfck5jNu4uPUQG6Cm3pR1pkyVZ5vgC+Mkqu0J
         sYWwzYw/ZIeveeBTcyuLceGoIwVoFKOxbKXEdzzEI+qU0Gae/g5/GEzQUG2+Eyifmevw
         G6ye2BDbeEndfvXbI4s9e5Kx6AYxp6QzoZuUyJV7EI91rW/rVOy6e1L1CkakEW6giN2V
         kH4mWyTnXGxwCazppjeRGTDWykZDC377DZLaOo/JIuQDaheAlGdGxxF2AhSpxSH+nDb5
         DAxw==
X-Forwarded-Encrypted: i=1; AJvYcCWtvBR1k9P9m+WoxrHCNjcwI5x6okVFlx/Ry9rFpeiVdNn3tHQXo6YLNauf5ZwEG1hRsMqRsd2Q/So=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/9URq6CW0xSFky1kfaVgzchRLDG4dPnrSoTJvSAudO5xadVUN
	aR1X7VjoW8bkVKA/JJJ0JRJvg9QY2VtknsXQTa7gvTVXKum17P818l+YszIH2eq99I0=
X-Gm-Gg: ATEYQzyI9HZEGatz90kQaLRxPPgJSCF3WW7ZAG0/ypSh5hRRwLEZzPqJ9HM08VilUwu
	IotduGZT0DLwNQKCKu3RcV7foJ0QhiJJTxSGIkIVK2wlnEMwGuxEpzBkt5656elnndzW4TpXhZ+
	0ZyvYcho0TA7XeY3PcVU7TNyKhZbKyBOqcWKRFBN6wHXpb278leUPR2gtUIkCaXvzn8Gu5MSqFB
	Co80XVw/cGChS/NNR83fHKlAajtZMtMVv1gFDILYgndvIAWutwtR2MRfdcUNhDf0mn01UTbePY3
	svr8I/E8jJPVOxTPrRFL0gV98qCSu9rB6S+5nZzna2w5EP7NGIorm8jUFMw74Lc6hSIr5SuOYni
	ow/F+skFQyLW7ohoDkkT4domyJoP2BagHoO//9lUBNJy1VccLs/qfwIQsWN7TtJWj0zh6E28ax5
	GYfx7k/bCYIBT9pLYtfS8NHdDBWh4DjwE=
X-Received: by 2002:a5d:5f86:0:b0:439:c279:32e9 with SMTP id ffacd0b85a97d-439f8423c4cmr12520707f8f.39.1773325797433;
        Thu, 12 Mar 2026 07:29:57 -0700 (PDT)
Received: from FV6GYCPJ69 ([85.163.81.98])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe1b287dsm8471226f8f.17.2026.03.12.07.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 07:29:56 -0700 (PDT)
Date: Thu, 12 Mar 2026 15:29:53 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Or Har-Toov <ohartoov@nvidia.com>, Tariq Toukan <tariqt@nvidia.com>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Donald Hunter <donald.hunter@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Saeed Mahameed <saeedm@nvidia.com>, Leon Romanovsky <leon@kernel.org>, 
	Mark Bloch <mbloch@nvidia.com>, Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-rdma@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Gal Pressman <gal@nvidia.com>, 
	Dragos Tatulea <dtatulea@nvidia.com>, Shay Drory <shayd@nvidia.com>, Jiri Pirko <jiri@nvidia.com>, 
	Moshe Shemesh <moshe@nvidia.com>
Subject: Re: [PATCH net-next V3 00/10] devlink: add per-port resource support
Message-ID: <fw6blzybx7hmvxvqoiy7civmzbf4yuhn2xzdna4apypkuwvck7@xh7iwjt27vi6>
References: <np44uzfn6jea56uht4yq4te5clapgj7pk6ygyvkl22wxumwnvt@nrpvzjqzxenq>
 <20260305063729.7e40775d@kernel.org>
 <ni23r4jiwgc6zjjsubtl4ujjgxzwpxrylumofdwxgozfnieynm@zirlbneaz6p2>
 <20260306120301.0ebe1ab2@kernel.org>
 <74dcd7c5-8a2b-49a7-a23c-174d17a61955@nvidia.com>
 <20260309133341.7e08b35d@kernel.org>
 <5de5103e-e2e4-4b72-9c3c-22847728fbb8@nvidia.com>
 <20260311145126.7dcca532@kernel.org>
 <go5wr5qa7wxe7i4kkcbmecomshpkesr26alq4qmlbpjr72hxgt@mpwq6eufylpn>
 <20260312071916.6b759c3f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312071916.6b759c3f@kernel.org>

Thu, Mar 12, 2026 at 03:19:16PM +0100, kuba@kernel.org wrote:
>On Thu, 12 Mar 2026 09:34:52 +0100 Jiri Pirko wrote:
>> >> devlink resource show scope dev
>> >> pci/0000:03:00.0:
>> >> <resource>
>> >> pci/0000:03:00.1:
>> >> <resource>  
>> >
>> >LGTM  
>> 
>> I don't see the benefit of exposing the scope to the user to be honest.
>> I mean, dump would show all, dump with "dev" handle would be used as a
>> selector to dump only things related to "dev". What is the use case of
>> this "scope" granularity?
>
>If we follow the logic that dump should show the user relevant
>resources, no matter which sub-object they are attached to -
>having a dev specified should only filter the objects to match
>the dev, including resources which are on ports of that dev.
>
>IDK if there's a strong use case for allowing the user to set
>scope on CLI but also - I don't see why not?

At least some small sense of consistency with other dumps? Health
reporter and region does not have scope and output mixture of dev-based
and port-based objects. Why to confuse user?


>
>> >> For the do-it command:
>> >> devlink resource show pci/0000:03:00.0
>> >> pci/0000:03:00.0:
>> >> <resource>
>> >> pci/0000:03:00.0/196608:
>> >> <port-resource>
>> >> pci/0000:03:00.0/196609:
>> >> <port-resource>
>> >> 
>> >> devlink resource show pci/0000:03:00.0 scope port
>> >> pci/0000:03:00.0/196608:
>> >> <port-resource>
>> >> pci/0000:03:00.0/196609:
>> >> <port-resource>
>> >> 
>> >> devlink resource show pci/0000:03:00.0  scope dev
>> >> pci/0000:03:00.0:
>> >> <resource>  
>> >
>> >Do we have to touch doit? Maybe we should let doit be what it is now
>> >and consider it legacy going forward? doit which is in fact a filtered
>> >dump is a bit of a mistake in the first place, from Netlink's
>> >perspective.  
>> 
>> I don't think we should. If user wants doit, he is going to specify the
>> object (dev/port). If user is interested only in things related to
>> single device, he should do dump with selector (dev).
>
>Could you confirm that you're agreeing that we should leave doit as is?
>I'm not 100% sure after reading this twice :)

Yes.
