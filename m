Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793777149;
	b=l3UvHYHNiaVZ7AyLGuK71OslWdiqSCNXXMdUb8H+ocyV6YMN1MoEj7vZZMROxsa+mymj
	 EpXcl/MWrY+bFjqkDN8XDWvQJxCZMmLjeDGXPzbRC51huf8HElfxOU8daWfuSX8OxStDX
	 JmknXrujTBYHT/q2nzIGslnxx6P0V15Nrwhht7FvYRDF2Zqire00HlNrJcaOLqJ2cPalw
	 WDqvw9L+gX5niqXpg6DTPVqcPy9A5QqNw93YROtrGxq1SGo1r3aXfkp03AZhfVS6z//GE
	 tRsA1u26uiV55AU8OEPJXYUNTHh/35uCiBi3ApXTmfEBvea1Spoij70twg920ptePng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793777149;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=HGf7LW+11fFCmkfZDnBYSiu7NHiZ1J+7B7vrKk2MO+o=;
	b=Oj7xFL7In0Bm58HowQEDeGKiDbeWUDe1KuARVK3xztdoGjpdVuIum2AH3mi4lHUeggIy
	 9b95ANyEmooVs0uR82GTxqIk+bW7yQgqREuuMbsJGIQbG59JjM5rr2ye3c/S4Wa3g30Df
	 2gza5whq4iXRsU0FfUoBy/t+2t+e9gWCEJROtweYuIRLE7tztY/xl34+WfMLZKuggfRmZ
	 zEDVBLDfK8/j1mM59xDzDFkNBWJI7hz/OYUPTy2QApkbioDyZGD+CXlVf9AtLigIDVEOd
	 aNuTk1octfQy+WmUTmU8Efzf4gqO3EhX1r6H4ugJCDW74ZvciahghXyQhdVo2Hbv21Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=osandov.com;
	spf=none smtp.mailfrom=osandov.com;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD8C606A329
	for <linux-doc@vger.kernel.org>; Wed,  4 Nov 2026 07:25:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FD8C606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3adb9cbb0c3so62553a91.1
        for <linux-doc@vger.kernel.org>; Tue, 03 Nov 2026 23:25:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20260707.gappssmtp.com; s=20260707; t=1793777148; x=1794381948; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HGf7LW+11fFCmkfZDnBYSiu7NHiZ1J+7B7vrKk2MO+o=;
        b=VRgHZidZURljCrK0HH3V2vKy9f31BQ0iYTP43G6ikNvBR4QjOxKvexYUY5uUu+JitD
         T9TOLxU3AuwSiEfvs+OeG0AzPdwnVqjedfkdmdtpWZVvyj1FCA9sCGyKG3IfgqeMduF7
         tADytHQvwR9g70pEF30quutiy5cwA5plryhJHjdgJ/FA7lKi9UOpU0Hi2aHxpB9zmmLz
         p7lB/1HmvqOF5+WzgD1Xyuwg3Sd7aC8aoth5hS9HATjN45F4AIk9OThyjOW0PZmMn8Gb
         PyeFm2ozp72iY7GtQJs9SMMvKa8+VY3YqslwzoN50PyVfinzUal3mgUUKUFwvo9oFTcD
         Kj2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793777148; x=1794381948;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HGf7LW+11fFCmkfZDnBYSiu7NHiZ1J+7B7vrKk2MO+o=;
        b=c+syJt4qx2f77U/iKg0V5cB9ehz5V8WNVHLeNd19oveqUCZv36zL034mexZ/Ay/WaC
         GSm9VsBYJJr2RS0s5TzlW/kBBuiHTVovJ2IaUw2GQ3FpO5StT1FClLTHciloOyvEzhRJ
         ZEtg0FQ0c9IJDj4U49IYIKn/mQ533KUQVmIgQH+X7zwIABQUcvD3rWuBgo2AfhoNypYL
         dm0MX/zs4epF+K0RYv0E9VMbg7K6rA6wtu0ALzGNhFM3b+QlnT1mAej+Ux0rhpwZb1jy
         Mxt0RSwifU/DDdPxkFZW4DZOSGDnLt/9RDkhPNU6qKaDod5pPYhqQjBUXCNmIEqtdx6o
         m6dg==
X-Forwarded-Encrypted: i=1; AKwUvBwikimJe0eG0AhdcmHAHeRWNqq776BVbDdSiWK1ONSzDr2g4lRS7ddUOaSTYtmkbh44QY1CZH6Z2vw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9qB/MH47jr4+hCXJuQZKWOsOASJN5WwSV5F+Zj3Ejis8ElXW7h
	QCPiigwmhl9GuKHW76PyGb/zYWWeNM3YkIQhepYttzbN6NrlYrZ/Ik1Ph85X8Zp2/L4=
X-Gm-Gg: AYBFou1leGMFa57bABwnOGOgX2z72wqa5uWtB85Zp0h8Zyogn9/1MVeldocd2jZSY+l
	CIyjYBmA902YEew0Vda0eQYFMnnPb/lzMQfiTry05ZCWeB8ky9Iexg1t/hKn0lpqmtQ6B6Hdg5M
	g3e6fM55IeDXgp3bu4m5zMbEJMifcosXJs+n/2OuSHxm/qLVSJAflHgxXpaOuxScw3bvi4y/2sH
	e4fXOTjIVBdA75/YaRgnRcbidwgNwfrk0rtfq+l/Ck5iaLdW1Qeq6MW4Awew3JD73lRPSq4S6rs
	SA5/m2E4c3D/AB57pMLLiKeZvwBBX0hUPgRI7Zbw7nmSNOEzTmBkp+nZQQoOCGtKHpf3vQ1+VLX
	/VNKeWKGhF18F+lvlHfchVJyYzoZE6zVlSg0020S69MvqTlxB2I1f6z1IS0NwJdow2jmNPs+aPC
	6pAfbyXFkn2rm5/BKpwdq135Wi0bCNhvbdk3aehhD88mDXPhzKymfl3KKGmj9KD7oSwQ4jI3eG8
	rim8iNkbyaBu+a5JLU1tugF1qki1TIUAGQu2QvmNyaqp5JDQrJioQyu6aOKfiRKcoshXz/xxWZ/
	17f/+tKlt4aHSvTkdKHNiwvh4qKaLhdq0z9Ptf46sZlcYn50id7gNV9z+ZgIEGqVeO4Rjq2KJtT
	y5NNK+PBWuXOzfs/RZAoc+fuvETGKyVrxw7uJbltK3MneJQYlR/qB62nE
X-Received: by 2002:a17:90b:4488:b0:3b0:9a3e:bf8b with SMTP id 98e67ed59e1d1-3b09a3ec031mr1494219a91.6.1793777147801;
        Tue, 03 Nov 2026 23:25:47 -0800 (PST)
Received: from os-N5J97HY9XQ.tail2dda0.ts.net (c-67-185-21-237.hsd1.wa.comcast.net. [67.185.21.237])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b09311866fsm2861006a91.17.2026.11.03.23.25.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 23:25:47 -0800 (PST)
Date: Tue, 3 Nov 2026 23:25:46 -0800
From: Omar Sandoval <osandov@osandov.com>
To: Chris Down <chris@chrisdown.name>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-debuggers@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [PATCH] proc/kcore: Allow disabling /proc/kcore at boot
Message-ID: <aurd-kCBE7ebENUl@os-N5J97HY9XQ.tail2dda0.ts.net>
References: <auAmuqZyUodq3iqk@chrisdown.name>
 <auKKisespDm1xLLg@os-N5J97HY9XQ>
 <auOEhTNaKzu8dgEy@chrisdown.name>
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
In-Reply-To: <auOEhTNaKzu8dgEy@chrisdown.name>

On Fri, Oct 30, 2026 at 01:38:13AM +0800, Chris Down wrote:
> Hi Omar,
> 
> Thanks for taking a look!
> 
> Omar Sandoval writes:
> > The code looks correct, but is there a reason that /proc/kcore
> > (CAP_SYS_RAWIO) is any more concerning than other ways to read kernel
> > memory (e.g., CAP_BPF + CAP_PERFMON)?
> 
> Not in terms of what it can read, indeed. I would say the distinction is
> more about who needs each capability and what we can remove.
> 
> Abstractly speaking CAP_SYS_RAWIO may be needed for hardware access without
> necessarily wanting to grant general RAM access. STRICT_DEVMEM already makes
> that possible for /dev/mem, but /proc/kcore gives the same capability to do
> general purpose RAM reading anyway.
> 
> In our case in particular, a process with CAP_SYS_RAWIO doesn't necessarily
> have CAP_BPF and CAP_PERFMON, so keeping BPF available doesn't make removing
> kcore redundant.  On the hosts in question, BPF tracing and BPF LSM are part
> of the monitoring and sandboxing we rely on, so we can't remove it from the
> kernel entirely, but we nevertheless keep CAP_BPF and CAP_PERFMON away from
> guest facing processes. Nothing on those host uses /proc/kcore, so we remove
> it as one more gap to close.
> 
> For that reason those hosts already run with CONFIG_PROC_KCORE=n, while
> other hosts keep kcore to aid debugging, since they have a different threat
> model.  This patch, then, lets us preserve those choices while using the
> same kernel image.
> 
> In retrospect I should have explained that better in the commit message :-)
> I can update it for v2. Does that make more sense? Let me know if I can
> clarify further.
> 
> Thanks!

Yeah, with a bit more justification in the commit message I'm fine with
this.

Thanks,
Omar
