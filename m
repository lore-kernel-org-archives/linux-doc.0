Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51149357A3E
	for <linux-doc@vger.kernel.org>; Tue, 27 Jan 2026 22:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769552487; cv=none; b=O7VzrrNEZlzwCt5O+7bcywixmzwVIQHIdad/vnc8ivD2KvAbyNsq75fm6P5bcbRWbPD7rn8+k3RIdQz8zOOhaapRyfEeK8BRGJgkT/VDmX3Wggk3aBsozn0Rq9m1VRaqsRqI8WF4zwyzNnt5XzjhVXhLympHUGk2qDFrB+7oSIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769552487; c=relaxed/simple;
	bh=0bm1KvZ9RZh+xJqSgyXeAsRJGQKVVQZF2EVdIgQxwkI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n7gZb2dzyUnBLP3DsgcjSzyTCHEH4mTtNBwY34/hWwkYAS+m06eF0pKmA+nBbdvT5Qr++y2NGEKee31KEJX/1CXov4nNyq3uewD2dDy/EIBBaiAHpvDL4aP//W3rkl3YwAMf5D93kmQryWxExCNYnMk03Ww+9G0idtVzRF50VEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org; spf=pass smtp.mailfrom=networkplumber.org; dkim=pass (2048-bit key) header.d=networkplumber-org.20230601.gappssmtp.com header.i=@networkplumber-org.20230601.gappssmtp.com header.b=lIsE0a8v; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=networkplumber-org.20230601.gappssmtp.com header.i=@networkplumber-org.20230601.gappssmtp.com header.b="lIsE0a8v"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47edd6111b4so70349715e9.1
        for <linux-doc@vger.kernel.org>; Tue, 27 Jan 2026 14:21:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20230601.gappssmtp.com; s=20230601; t=1769552484; x=1770157284; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=10rIsxSqD2RcmvyIQ1g7gwllyOY4QtznnQ8CJGOxXHQ=;
        b=lIsE0a8vtGfxgWhJd2XCOu0CqTKG292Z6LSsyne/BmKtMXaYiZhyHvqFG+DuQtxvgp
         8Csf31JXsDroMezDJkym0SqWE4C+DD3WXG8AJt5PC082N+egd5CPtazXFUgMLbWZIVov
         Xt7o1cX4nab6/AwGsO08pRs5UXLCB/FJTGo9sbamjZfEHM4GzF8AJzonchjSPv73UBgy
         P6ydSG2T2V80Sz94q2StwQ1uNDHiC3VePWMZh6RlAsSCBhEOBXa6mrGtX9NokyREcqmf
         nEAG+ToR5Hj31CHK1nhDn7buC2nIAA1bngGo1Ic374EI5ShexxaWFy0/6IwlbMKm1AXk
         P6jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769552484; x=1770157284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=10rIsxSqD2RcmvyIQ1g7gwllyOY4QtznnQ8CJGOxXHQ=;
        b=Ko2NxwZOhDftkVovIVV13tnnQtPL+aLtJg2j/IMLY5WzVx08xkjXeTJcjJJanH9Ilr
         Rklf/C70qkjjm2SwdLASK3xaVy4RvngonW4vQPwsMgZ6LYsIAhi3DfkxxuPOOoQCgEVt
         JlJFYCCEzq5cjMZU/WezRIHv0kt77dt08XXhdrmt6NoyOA+Wgl2jAFECmiwaKnRWUctW
         JyrRranBHgKAjs/2gd/vFWtin2bJM0fBdM+DmPYlGp/CJCDpwzfYIz+KFfanSMe2u9Lx
         BP3nRjXLWIbx+E8V7bArspYCXjPKbQnzlniTIxfsk7Ee5S+CxojKru0PSAx1NI0ndYaj
         n+hA==
X-Forwarded-Encrypted: i=1; AJvYcCVg1fDz1swG5NgsSbeeDmgUt+YpO5a+dM1uRVo3VAT2x2Pjv3A7NmyZChRvMaclqpVKzBRKoKscZEY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZK+Ip/SD+YqTZblD8bqz+1oeR1PFOMEax/kjsFv8fprxKwwAU
	cFsR5EH47XDDWyk3YAUc3WyzknBr5DvwJALHZcDYRMoavDvBOaFKgqJwBZXI5b/Fzw0=
X-Gm-Gg: AZuq6aLlWy2E+imG0n7465ic0b3EaYis1ikfppxi19C3K/Uaasb9CLE8YCD23wTb/za
	S8hppMvhqp/nKxZgr2UB53+Kztw398mDwvt4YWjxZOUSouYem4C+Dq8/AFD9bJfPvrZm30G3jye
	1bgngP2yMXEn2xYlCf6JoCf6v8GWWzHfZtSVi24r2FUlXKynCIWBAXSErialBZVIIhYCnTunT8p
	wSdoWlLWvioDzAf8fSAOw65bejAKrnT1NmXdle/yIm2dHsTfIn22y8S9XoSb9WVrOeOmaF5t0tR
	d1gJIupzSjaAZQkJeWxelHpPNrF6bwQ+VPTKxB8ilu4RBsd52j3fR33OL1y5plO0gyQt2IlmNQb
	LQm56qOUQIwaSvc1FaxSvzGDwkaEKPPeNLYVeRAGYwrn9ysjvav7KTFo2Qc/bmT7HQPA3i+WpIz
	XIyxWx+mP4Iq3qnlYSIZups2DJ/ar3LZVcGSRUqqOSRZMKa3W2oebh
X-Received: by 2002:a05:6000:22c9:b0:435:bd00:3978 with SMTP id ffacd0b85a97d-435dd1d3268mr4741687f8f.60.1769552483523;
        Tue, 27 Jan 2026 14:21:23 -0800 (PST)
Received: from phoenix.local (204-195-96-226.wavecable.com. [204.195.96.226])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10e483asm1844349f8f.3.2026.01.27.14.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 14:21:23 -0800 (PST)
Date: Tue, 27 Jan 2026 14:21:13 -0800
From: Stephen Hemminger <stephen@networkplumber.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Simon Horman <horms@kernel.org>, "illusion.wang"
 <illusion.wang@nebula-matrix.com>, dimon.zhao@nebula-matrix.com,
 alvin.wang@nebula-matrix.com, sam.chen@nebula-matrix.com,
 netdev@vger.kernel.org, andrew+netdev@lunn.ch, corbet@lwn.net,
 linux-doc@vger.kernel.org, lorenzo@kernel.org, pabeni@redhat.com,
 vadim.fedorenko@linux.dev, lukas.bulwahn@redhat.com, hawk@kernel.org,
 ast@kernel.org, bpf@vger.kernel.org, sdf@fomichev.me, daniel@iogearbox.net,
 john.fastabend@gmail.com, edumazet@google.com, open list
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 net-next 00/15] nbl driver for Nebulamatrix NICs
Message-ID: <20260127142113.3309fc99@phoenix.local>
In-Reply-To: <20260127105304.21279cc2@kernel.org>
References: <20260123011804.31263-1-illusion.wang@nebula-matrix.com>
	<aXj-uam1HodC0851@horms.kernel.org>
	<20260127105304.21279cc2@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 27 Jan 2026 10:53:04 -0800
Jakub Kicinski <kuba@kernel.org> wrote:

> On Tue, 27 Jan 2026 18:06:49 +0000 Simon Horman wrote:
> > As per Jakub's advice in his review of v1 [*],
> > Please try to create a minimal driver in the order of ~5kLoC.  
> 
> Perhaps other maintainers will disagree, but for ease of review
> and to avoid the huge reposts perhaps we should consider merging
> something like patches 1 and 3* first, as the initial series.
> And then you can build up the driver from there in reasonable,
> 5kLoC-at-a-time series?
> 
>  * patch 3 currently includes things which do not seem machine
>    generated / like register descriptors like structs added to
>    nbl_def_channel.h and nbl_include.h
> 

Part of the size problem is that the driver has multiple layers:
resources, channels, etc and lots of code that tries to be common
across OS's. This can lead to bloat.  Very few drivers have done
that successfully. 

