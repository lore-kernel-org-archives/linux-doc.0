Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com [209.85.215.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE6363624B3
	for <linux-doc@vger.kernel.org>; Fri,  8 May 2026 15:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778252598; cv=none; b=GY2QJ7mESTO2c5MqRHc6mNvEkKpU1gpzCOcYDNT1zGJvKsebB5KBCZTMwzAQJsUyGhp0ag36I2QuAliltvYvtemTMvB+wLSRTXyHultyefIEUTO6Ouq3K1nwua+7kVie+Ms8i45kIj4Py4DxU3qmxA2me1l7ny9St4QH7wp79u8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778252598; c=relaxed/simple;
	bh=Yc8G/OYaz0np5e+ifQwa6O1CU5HmHo+b4K8v6Tjxvs8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KNFnsCVv6lFyQalFcbckoXgFexRXAXqqONRjpCEo+dMiLWmClOxjGJ7dvIsHjUGGVEm3RPx2VzZwggq0m0iSshlid9Wpk86qkfJywdHNeNVbdIVpJSr6WHbnOZXi7q1tZM+g8aJzd//YM+R97lLLDNIBiebvMPJL01RRmeq0XQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iwhlcuSE; arc=none smtp.client-ip=209.85.215.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iwhlcuSE"
Received: by mail-pg1-f196.google.com with SMTP id 41be03b00d2f7-c80203b9d7bso858703a12.0
        for <linux-doc@vger.kernel.org>; Fri, 08 May 2026 08:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778252593; x=1778857393; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OCvkvD50FsVxDN97c8Hp0jXUGucP6UrrTJOe2Js6aRE=;
        b=iwhlcuSE1RFQW2tMj7c6OHS86RYq0Cr8bopzDoWjdgEhNUOx91pEsF8qHLVtRoYcpX
         toDk8UOGhdVxf9rWykP63/iEbJY0DCENeha6M0qNKzWdhB8uHse6vuj7omiMm1xbPzhf
         diAn5UqdUa5AiqVush6Ex/+pFWzc3Hp6J2mvNO/KZa6jj930gJ0w4gSYuJVWFs5RAIMR
         dGvAt4A1Cm06wdzEsAlmWhtrKhn0lK7euxhaaBB4EgQfcdMAMqN63yyYmfKs4L7s5rA/
         lUkUdTkx52qH0L1z6gQ19mJJ/hFM/sdw/C8NEQFHJgXBy6qKO4bjXgylqqitjrKLaQVe
         xrIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778252593; x=1778857393;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OCvkvD50FsVxDN97c8Hp0jXUGucP6UrrTJOe2Js6aRE=;
        b=b3jmUt7OGmi0f40CRiq4XIS4N/Elitxm8edDcylKdMpDPpPujE9VNfPCGZilOEPh97
         MDa1ayoaQxGhjUgvOzPXFfcj0LZbi6et1axap4tu7kAbwEoy6JLoS7Ortki5ihjJDbg9
         ZIimr0NZUwoa0hWVxx0425AHt3AD4x45z16JtoXTvnCh75B2WYONai0KgOehV3ci1o5S
         s3T8nOpkmRFf7x5jTjq1gRePhSLUfGEfPsa98m+UtKS6yPUgX1osi0J25oHLjFFfBpYe
         VjzzFY+8MpJdglNlZqsLelPzWNReheJ1jyJxgBTkBQ9+ec5X2aOpPhxpaHXy6aAdGdSw
         Ptbg==
X-Forwarded-Encrypted: i=1; AFNElJ8GvVkWQHbJr6ubaGZEUU9/jcTcluzlSW9Hcaz5jHgYWFSfqr0BBJzpGL/o6mMlU8gxZ96v+eJNe4A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMXaFCzJscxjmOAHvN6NMWqdTdhU1d7eB/6F4ToIsurdWs6EZt
	8Dzrqsjuj9SCKxenXSSEiUJqt7YBsWtEZdIRzYudz6ygazQ3mz0pWbZC
X-Gm-Gg: AeBDietJMsevIRd3j6QQbWcAX3CL7IkYPWTCADCW88C5tQdK0rVX2alKoz/Kh5+GIr0
	Bqe+n+pmZvoc1tL/u1lZlI3UzIJrI33GrQTzFL5eeXWJ0BUqeySa3s8YUH0uxANOeJBsdxvs3tC
	5IW14xGxQ+/GiJN1IWsoWHQ2Umnn0txX+nalPlslv0WKNTpWqv16cVPcOiOKspAlGlokNzzLUIA
	Jigtu7m1RDlY8JsSesMWyDJlw4Tc/QHjBbfEn5VoI5e0jNaSE3rKa4rOl8X6bc3TaZgt8amMG1N
	6+aDlqUcAzNmzsNESt62M9pQ77ikUe8sBbRA1eOXbGUes5bM98N3ndbaKv9dLQsbMaOAS05TYZT
	OqgezmnkNwtmzBu9lnJKX3QHxKkBqdLYveHlfIahZSFptFnmc1pnfB7vzXF99zYgaqJDb+mAMlw
	aAnWnGWx/lHwWYdMco
X-Received: by 2002:a05:6a20:244d:b0:3a3:a69c:216e with SMTP id adf61e73a8af0-3aa5ac23e75mr14422053637.38.1778252592814;
        Fri, 08 May 2026 08:03:12 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:48::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8396594645csm13180339b3a.14.2026.05.08.08.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 08:03:11 -0700 (PDT)
Date: Fri, 8 May 2026 08:03:11 -0700
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Bobby Eshleman <bobbyeshleman@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, 
	Dongliang Mu <dzm91@hust.edu.cn>, Michael Chan <michael.chan@broadcom.com>, 
	Pavan Chebbi <pavan.chebbi@broadcom.com>, Joshua Washington <joshwash@google.com>, 
	Harshitha Ramamurthy <hramamurthy@google.com>, Saeed Mahameed <saeedm@nvidia.com>, 
	Tariq Toukan <tariqt@nvidia.com>, Mark Bloch <mbloch@nvidia.com>, 
	Leon Romanovsky <leon@kernel.org>, Alexander Duyck <alexanderduyck@fb.com>, kernel-team@meta.com, 
	Daniel Borkmann <daniel@iogearbox.net>, Nikolay Aleksandrov <razor@blackwall.org>, 
	Shuah Khan <shuah@kernel.org>, dw@davidwei.uk, mohsin.bashr@gmail.com, willemb@google.com, 
	jiang.kun2@zte.com.cn, xu.xin16@zte.com.cn, wang.yaxin@zte.com.cn, 
	netdev@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rdma@vger.kernel.org, bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Stanislav Fomichev <sdf@fomichev.me>, Mina Almasry <almasrymina@google.com>, 
	Bobby Eshleman <bobbyeshleman@meta.com>
Subject: Re: [PATCH net-next v3 6/8] selftests: drv-net: refactor devmem
 command builders into lib module
Message-ID: <af37Eoq2TLjhI7kx@devvm7509.cco0.facebook.com>
References: <20260507-tcp-dm-netkit-v3-0-52821445867c@meta.com>
 <20260507-tcp-dm-netkit-v3-6-52821445867c@meta.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260507-tcp-dm-netkit-v3-6-52821445867c@meta.com>

On 05/07, Bobby Eshleman wrote:
> From: Bobby Eshleman <bobbyeshleman@meta.com>
> 
> Adding netkit-based devmem tests is a straight-forward copy of devmem
> test commands plus some args for the nk cases, so this patch breaks out
> these command builders into helpers used by both.
> 
> Though we tried to avoid libraries to avoid increasing the barrier of
> entry/complexity (see selftests/drivers/net/README.md, section "Avoid
> libraries and frameworks"), factoring out these functions seemed like
> the lesser of two evils in this case of using the same commands, just
> with slightly different args per environment.
> 
> I experimented with just having all of the tests in the same file to
> avoid having helpers in a library file, but because ksft_run() is
> limited to a single call per file, and the new tests will require
> different environments (NetDrvContEnv/NetDrvEpEnv), it would have been
> necessary to have each test set up its own environment instead of
> sharing one for the entire ksft_run() run. This came at the cost of
> ballooning the test time (from under 5s to 30s on my test system), so to
> strike a balance these tests were placed in separate files so they could
> keep a shared environment across a single ksft_run() run shared across
> all tests using the same env type (introduced in subsequent patches).
> 
> The helpers work transparently with both plain and netkit environments
> by inspecting cfg for netkit-specific attributes (netns, nk_queue,
> etc...).
> 
> Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
> ---

[..]

> Changes in v4:

This is a v3, but you already have changes for v4 :-p

Acked-by: Stanislav Fomichev <sdf@fomichev.me>
