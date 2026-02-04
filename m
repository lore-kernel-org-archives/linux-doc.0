Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E8B261B96
	for <linux-doc@vger.kernel.org>; Wed,  4 Feb 2026 07:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770188897; cv=none; b=Sr+2FiBGgMjxm7qCsYHD671WYM8KumY4uPxni0Too3Qt9EqZGmHABI4AgB/BJJSejn067xd85bkoXvW3/p+hUWMBkbgx5iF0VLw08nVxGEQxMkcKh6GTzHej7hZOPLyQG1Sd1cwiReDOBvo0bBww9IJwfQaVkAbW4MCNS3T8em0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770188897; c=relaxed/simple;
	bh=nZc2xi5zdfE0k9aodqhuuyxCv5YS9Ogmy++z4WwGvlA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZFIryj0VbMNUNd3xJSNwbGhp5RQNuPbZloma1JQuzw9A761Flb8oYClXC0U/42hhIxMS1X6d33gKLIvvayK/dZhvt5yDAy82rFDmpffIDG1lFty2CrUpRa4yTHECzUzZOK5tXzXYWUkJwJIh69wXK8brrS+K0kMPREBjZrIWUBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e1whEmtu; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e1whEmtu"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-432d28870ddso206056f8f.3
        for <linux-doc@vger.kernel.org>; Tue, 03 Feb 2026 23:08:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770188895; x=1770793695; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kqnpITCCQiIQonzXq9ScSS11b9xv/CuzslKyMe7TLdE=;
        b=e1whEmtun5UfQZIiU3dL0el4NLpHcA6q7nJ9jVU3drGNTu/II5icMGTQrmlseujkh8
         /WpdCBKYX5A17RO+yOPUdPEUu+l9ho+fpYEyI3/eJZHCUPAoU+DRvpOYTy6lLU7BNFVI
         ZYq1+hHv1LpC5s5fXpAGZK4pD+pWfgDR/ROL4rMjBY7W7V7AuoJW6cyL3dO00Qxy+A5q
         gouWd3js2G56adcwcC1D6bwFESyzmX7F2mZ1xF1RRz+L0HRzCUQRxz+/oBx1uCZ5KRpn
         c9G0hifSfNtNOOqTip7goKYOkvrsPoTK7Ipzngxg5G/I43webNNsljdrHS2ZTide7vTA
         r1SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770188895; x=1770793695;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kqnpITCCQiIQonzXq9ScSS11b9xv/CuzslKyMe7TLdE=;
        b=CY5C8/2/devy+oD1spJtFJQDjpGauXP7TLpZ4GxmuKOpmmArPeqR2gjWYUtPPBrBnX
         9RwqKDAnnMf5KKQJhFOLgbj0nB2v/FL4/qcqN6LAvbM00XC109zmlKV9k67rGOlOzy3f
         Pz3nkeQgLo/8EEyDmAZIHNnZSe6w83FZQhZ3P+lGfs7e/7P4/UbKdHVrjZX/9/sIMM4P
         LfTCRY+EHLgFAmm8+OpjZ97hEWzfSpXb4cFiwxXyI+m8/kzKLdNXXuvDCeOJ9IJ5LfG2
         l/V96yXjkR4QEixRtDRVPzhVS+9pJes+mROE5wG9MkhK5vHYLne/P7/kP2OP34FCd41q
         1J3g==
X-Forwarded-Encrypted: i=1; AJvYcCUjp8ykYen0vvB68ReqfC3rgowNpCfpKaeHFHVJGGCehjcSbrs/UtLAoCMRgk+vtHarm1hu/MfcnQ4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTyQDackjjMmFsIJmiS9GSXD66kbpeNmhD5U5TN3kqcmMBKG+V
	1RMbeXQn51/o85x4/qj9oN3qQl8+5nHL6/M3v5AmtRI7Dvinac2ZmlwY
X-Gm-Gg: AZuq6aLFAx/eLK7yWBLDQy197t3FYQzgiN8owM+n6JViM3J2M3PYG5lM/OFHHZAKxx+
	wY/ZNoRqhnENnNXGYP4rd0z0K/ulY4JlS325Si048v01qvHD4el8EgDbQ5MMEHndKrYBtoC4tYa
	mR9zw/+4apOckBYnfmKsaIgmNPx13Dt0VapOpA4+xOo1Ov3L7wDwAPzUjT7Joz8OFqnm/udgRBa
	Qqzw8KNYrqaRFKM5DO2lQANdk0FdxYO/w+gDD8KjAvELBwAQcp+ah3R/9H9LW2KRDZOr9nxAP8u
	6HmOP8M4V95zQ8pMQ3QjbpVN8Lnzj68etK3vvLXhhSEHv9k5G8Oi0dODzL6ZMqHXYBmUZBZf1+U
	JvzjLtcl2wIUeiCq1iwkQe8oh4ZYL+xCK9+PpndeL95aEb6y+jh7E1PQti/ZQzXuusV+KVJ+HPf
	pl12tKX7yyUf20Az3kAtR33++PtmXp
X-Received: by 2002:a05:6000:2888:b0:435:8d02:b9cd with SMTP id ffacd0b85a97d-43617e3d500mr2536235f8f.26.1770188894959;
        Tue, 03 Feb 2026 23:08:14 -0800 (PST)
Received: from [10.80.1.200] ([72.25.96.16])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43617e38fbbsm4578360f8f.13.2026.02.03.23.08.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 23:08:14 -0800 (PST)
Message-ID: <f3e5ef08-c073-4f96-b874-8fcf8c72af2a@gmail.com>
Date: Wed, 4 Feb 2026 09:08:13 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 4/5] selftest: netdevsim: Add devlink port
 resource test
To: Jakub Kicinski <kuba@kernel.org>, Tariq Toukan <tariqt@nvidia.com>
Cc: Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@google.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Donald Hunter <donald.hunter@gmail.com>,
 Jiri Pirko <jiri@resnulli.us>, Jonathan Corbet <corbet@lwn.net>,
 Saeed Mahameed <saeedm@nvidia.com>, Leon Romanovsky <leon@kernel.org>,
 Mark Bloch <mbloch@nvidia.com>, Shuah Khan <shuah@kernel.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Gal Pressman <gal@nvidia.com>,
 Moshe Shemesh <moshe@nvidia.com>, Shay Drori <shayd@nvidia.com>,
 Jiri Pirko <jiri@nvidia.com>, Or Har-Toov <ohartoov@nvidia.com>
References: <20260203071033.1709445-1-tariqt@nvidia.com>
 <20260203071033.1709445-5-tariqt@nvidia.com>
 <ce09e17d-2b74-4bda-a8ec-352c92659a6e@redhat.com>
 <20260203182652.39a3620d@kernel.org>
Content-Language: en-US
From: Tariq Toukan <ttoukan.linux@gmail.com>
In-Reply-To: <20260203182652.39a3620d@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 04/02/2026 4:26, Jakub Kicinski wrote:
> On Tue, 3 Feb 2026 11:16:45 +0100 Paolo Abeni wrote:
>> # Error: netdevsim: Exceeded number of supported fib entries.
>> # Error: netdevsim: Exceeded number of supported fib entries.
>> # kernel answers: Operation not permitted
>> # TEST: resource test                                                 [ OK ]
>> # Command "resource" not found
>> # Command "resource" not found
>> # TEST: port resource test                                            [FAIL]
>> # Failed to show port resource for netdevsim/netdevsim10/0
>> # TEST: dev_info test                                                 [ OK ]
>> # TEST: empty reporter test                                           [ OK ]
>> # kernel answers: Success
>> # kernel answers: Success
>> # ./devlink.sh: line 614: echo: write error: Invalid argument
>> # Error: netdevsim: User setup the recover to fail for testing purposes.
> 
> I suppose this is because iproute2 needs patching. Tariq, could you
> post the user space bits or share a link where we can pull them from?
> I'll revive this in PW once we have CLI updated..
> 

Right. I'll include a pointer in the next submission.
We're fixing the code to fail gracefully (i.e. skip) if userspace 
doesn't have the needed support.


