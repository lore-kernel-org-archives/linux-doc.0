Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F13D379EF2
	for <linux-doc@vger.kernel.org>; Thu, 12 Mar 2026 08:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773304501; cv=none; b=DgW2uzRTizJsG491LmTwUIqAqsWADm4xMQJpSoW23QlnBLpEOqYbh/pQiaRvf4G9dpndsO/oj4Q3VmSqdOeI6svLNSJDc76ZQ4Wy8+Bqa5bIclXYvox6rFQgXRsk0vExEag6//Ke48E97ACrSc2auXZm36h36nC7/4wjCl5DScU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773304501; c=relaxed/simple;
	bh=HEFbmcFEHfAGcaqdN8AWPZHaVSbwHCyRRxbL06fN1Aw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qpZTBS+2zuc/+INBLI4F+FFXQ+FHHcBB0g+wsKH8SxYkCjTuiqtZcydiDQnIw939kVLdW75J7zbTM0UCkZ8tBCr9yn0aEWB8dNwsApejHRmzicBzUWMLJ2oEyQFECS/tWJm+nKjL6g7LjnGg6nTUOT8i6K/1yzmRrI8YsmDRAVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=UdvZpJSv; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="UdvZpJSv"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-439c6fc2910so571306f8f.0
        for <linux-doc@vger.kernel.org>; Thu, 12 Mar 2026 01:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1773304495; x=1773909295; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=G6aLENJtgw3KKH+EBlODshn2Ly+qSlwDf7sw9+i4eVY=;
        b=UdvZpJSv/Gz1k9WN42TpPqqvHZL+RQwr245QXejc0Vs0ixuWIfzEZr/IfR7DUW8lXw
         NsrV9oqjOasQaoz9bze1mZPvfPZSs20EFoDDUUDsew8j5K0zQm7LS1rreFG1N6G3+tLO
         RMZQnsvuoTkIrU19l6j8v16cYS1o/2qr0kKtw3q99/bTpMzYMCfSJQS0tCIxb66YOhC8
         T3WtwAvFjEZbr6QNs+p574v+OkM1ZQUC19HjymuyUeCOxzt2bgudC0MPygvJXWL8XQkv
         JOSP63AIksJiYbW8TMh4yetGVre3NXn02g+lxDfD32r7KywrCPeXECI87/hWUOISc04g
         I3jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773304495; x=1773909295;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G6aLENJtgw3KKH+EBlODshn2Ly+qSlwDf7sw9+i4eVY=;
        b=W76ypYO4R+4PooRRsJtUxwFB24g8/QNLhVZhTh4B92xW4cu77Ti00j/MzC0pvmzk2n
         kWjcMx/AlfEhSDldulK4vzjFBasxNkcgW2fBuwm4j1KgXZy9DNDu5xMQGXBZL+jEqoaG
         5UyWaEGmnsB3BPTQBswL0Vdr/EXLqDR4s+iqrf2F0jWqGM6AvniXMFAo6q0AclFH0w92
         c2mPCSsY3eL7vT9ypq0lXiUWZjxK60rztRAECctG4X6+cGxvXX+fLntRe4y9PL+UrN3l
         Xtj+5YNEg0GpyUoUGZyg6zwgL09/wUUnFuzFblf1v99Fhykx+W8il73nbBv1symQ+lHy
         Ljgw==
X-Forwarded-Encrypted: i=1; AJvYcCUxRgalXFWt8JLgYTipKz3zLkd0uH8RuBdaBr9/cpoguqnjmhoF+frK+9fc23/2b/70H4uSymjWqvY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEnKQiN6OuhCWFjqN3/SeAMCWPpMf5tyQSxSSNtFOtvb1kNvUq
	eB5axmY1lXOkfgd6V+jsukee7jzecjzrQnuJ3rrKjidU97Mmi+79RI6JBWTUuJmpQQA=
X-Gm-Gg: ATEYQzy4nNe9ssyJQvlCjlbtuABRn5TESLqlFqGQeD3D0P4UTSf7JCqrfjfhwW7GfhF
	5PDpXS4YBgyxz3BrY5uCkE+ifNp+J2S7rqGug0BP1QJA0JJfY8zgMAR08EBUc/aumWXLBmPWNhz
	nDpiFG3wPfSWMCCFqoQw4p8F3maDMHUYcRcIYdtJlQvpmgb+L9KOXjje/bCNoq9piBRSgUnDqBg
	toQHyXLFZSEqoGC0xpUInwTG/MxUm6VHCKQkCXzCK0sAhlWZINCGNYq2qaC4GQ13Qx53ptvKnsK
	noWAjDdvY/YoJr0tEkE9wQ2I/unfEYoioeQxnWY6MmaFU3S+FnxiozvCbGgix6vy2uWsJWf4Dd2
	8j+1uf16G9PLXTBMnQwTPySew2kzlOstC0h7iLgLkDwmtbbOHfM4CZFiZRDuC58ltYwHDoZLHD0
	DtkLSRF2AvXMskajNAoVP8wmCGmlvuSiXxFojxp/5+3A==
X-Received: by 2002:a5d:584a:0:b0:439:ad2d:99f1 with SMTP id ffacd0b85a97d-439f843cd0dmr10192185f8f.54.1773304494998;
        Thu, 12 Mar 2026 01:34:54 -0700 (PDT)
Received: from FV6GYCPJ69 ([85.163.81.98])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe1affe9sm6406633f8f.15.2026.03.12.01.34.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 01:34:54 -0700 (PDT)
Date: Thu, 12 Mar 2026 09:34:52 +0100
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
Message-ID: <go5wr5qa7wxe7i4kkcbmecomshpkesr26alq4qmlbpjr72hxgt@mpwq6eufylpn>
References: <jssifysprwuafkinc3dguspngxmplrngqxvotp76vhvu4e5lp6@e7mdrjqc5rme>
 <20260304101522.09da1f58@kernel.org>
 <np44uzfn6jea56uht4yq4te5clapgj7pk6ygyvkl22wxumwnvt@nrpvzjqzxenq>
 <20260305063729.7e40775d@kernel.org>
 <ni23r4jiwgc6zjjsubtl4ujjgxzwpxrylumofdwxgozfnieynm@zirlbneaz6p2>
 <20260306120301.0ebe1ab2@kernel.org>
 <74dcd7c5-8a2b-49a7-a23c-174d17a61955@nvidia.com>
 <20260309133341.7e08b35d@kernel.org>
 <5de5103e-e2e4-4b72-9c3c-22847728fbb8@nvidia.com>
 <20260311145126.7dcca532@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260311145126.7dcca532@kernel.org>

Wed, Mar 11, 2026 at 10:51:26PM +0100, kuba@kernel.org wrote:
>On Wed, 11 Mar 2026 20:24:08 +0200 Or Har-Toov wrote:
>> For the dump-it command:
>> devlink resource show
>> pci/0000:03:00.0:
>> <resource>
>> pci/0000:03:00.0/196608:
>> <port-resource>
>> pci/0000:03:00.0/196609:
>> <port-resource>
>> pci/0000:03:00.1:
>> <resource>
>> pci/0000:03:00.1/262144:
>> <port-resource>
>> 
>> devlink resource show scope port
>> pci/0000:03:00.0/196608:
>> <port-resource>
>> pci/0000:03:00.0/196609:
>> <port-resource>
>> pci/0000:03:00.1/262144:
>> <port-resource>
>> 
>> devlink resource show scope dev
>> pci/0000:03:00.0:
>> <resource>
>> pci/0000:03:00.1:
>> <resource>
>
>LGTM

I don't see the benefit of exposing the scope to the user to be honest.
I mean, dump would show all, dump with "dev" handle would be used as a
selector to dump only things related to "dev". What is the use case of
this "scope" granularity?


>
>> For the do-it command:
>> devlink resource show pci/0000:03:00.0
>> pci/0000:03:00.0:
>> <resource>
>> pci/0000:03:00.0/196608:
>> <port-resource>
>> pci/0000:03:00.0/196609:
>> <port-resource>
>> 
>> devlink resource show pci/0000:03:00.0 scope port
>> pci/0000:03:00.0/196608:
>> <port-resource>
>> pci/0000:03:00.0/196609:
>> <port-resource>
>> 
>> devlink resource show pci/0000:03:00.0  scope dev
>> pci/0000:03:00.0:
>> <resource>
>
>Do we have to touch doit? Maybe we should let doit be what it is now
>and consider it legacy going forward? doit which is in fact a filtered
>dump is a bit of a mistake in the first place, from Netlink's
>perspective.

I don't think we should. If user wants doit, he is going to specify the
object (dev/port). If user is interested only in things related to
single device, he should do dump with selector (dev).

Let's make this simple.
