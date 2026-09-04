Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562C04CCDC7
	for <linux-doc@vger.kernel.org>; Fri,  4 Sep 2026 05:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788500623; cv=none; b=LDRPralMhMMWusPEPHRDjrF16984zCvqY0rjfXzTcNpbrsp8Xuo3EL8+HrZdGwf2gLp9Qj0WkppiFR2vlmhEOVmHsFr4Ii5tEmAtVctOgXyq9FT9Tvw6rnXa2auZ3M+hfEw0BkGPtAEaHA/9csSGn3p5RLiD44X8BD4XgH874og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788500623; c=relaxed/simple;
	bh=87tW78USOIRu124aJptnXZ1ORwFWyuAoO45i3VE7Rzo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tRjRl4qPdFqVywjISlVp0zs17IlWEDKktSkYlJ0ADDdgdzD3cDdjM6Z21JpNUaRuCyQf1u8Xx9mcVnLChQID1pAFAuGKGAUiE5fEzqyotxcriN/gzoRprLK3/YPV2MyczsIvG83ms+yoiHSkuuwfVUj22A4iV95E4u4dWoBZSUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MSWx2XeQ; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MSWx2XeQ"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38759bcd877so609539a91.2
        for <linux-doc@vger.kernel.org>; Thu, 03 Sep 2026 22:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788500621; x=1789105421; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XxOcRRnDrKQlx91Y28n3fxGGvoUu/s1bIHpjhY19uNc=;
        b=MSWx2XeQ6YrKYuEm/m5Ku+TmLdgF3ADdeLrlhKjWuUYqYQsk7yysqySZ5F6SyNtK76
         eMAFuO+DBRnJvZ3w3JxHK5UB1g6mtzydM/mwbPM4GNNPVVTllQcKFMbDhAsZ1VzYs7kd
         9rir0tqJ43541t3lwj/+YOxuKm8DgoyrwP9ZFsZxm3Z64vEGHouWTDOTI8vQo1faapcD
         R+gO8HKSRtCVANqMSydPf5Y4iVfwVhxi1kfl9iXlaAecIMF/X2tGYwJ/QgEkWj3dSxdY
         96bHNVPa8OwG+jOZjx+XXNo6AX1S/x7cVET+dDm8PmEyGBD2UenaSmX33BP0hv+auRyg
         iS8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788500621; x=1789105421;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XxOcRRnDrKQlx91Y28n3fxGGvoUu/s1bIHpjhY19uNc=;
        b=rc2Lg1Zf0ywQjB3ViXXhArSdnVZqsvaL5G73ujjXWrguUVzYaFQCbS0UOwONSIgN/O
         ZTqgf4pp8lPgsX2kFMcaNshjQDbZ6mCyTG5y85sK4aUYM9j0wgG55ZT+MnvBCCkT8RAo
         eIzYhwAeasPlNQ03jVoqDzc/3Q+gpotPLCTpYwynP6Yud8A1h66jTKzcbIH8q92ySpiJ
         HL8QXv59Udp9oAdBrLCh8CaGhdZPHyABqU9BjpQxEGDuCnQN4+QVpkfBNscdOXXcE8Bm
         +/II2w9WomjC+wndtGq6W+k4IL8iTXyaNGCV141fXM2E+WICZXcQIAiH0/qDwWWomV88
         U5IQ==
X-Forwarded-Encrypted: i=1; AKwUvBwDsD//9T9dsxF4ELdN59gQcxwCcyH0X4AIurE/6eXNxjGUGXgMfVOOBS5/1ytjrW/etgOE4oEioaA=@vger.kernel.org
X-Gm-Message-State: AFuF++lilrvK2mWaYog5y6MiutkhlAQNwvavxAT9G0Bbsl8+h/oIti82
	SLOpFPhMVQ5LpgnpB2h95gIy94Ck5IeBUxTV1oAO5x2RZWRqp7CWJJUSjuOAR17NWNQ=
X-Gm-Gg: AYBFou1qy0BbY+tLxXh+FNLSkb6XwfgF4tZZwjVZfZUb98REBJHG/mkxLeIde8O2zCQ
	O5BOgzbEWnRfhSPzAYK+GnjsbADmxVlmPbAJ8roSFD1SvlCP8rMfzqsZOjVW+mng0Fk+INy5osD
	2ERsFg6LddAFgtZFM52pjHWJvPl0ASV8VN0xZOr9bugI76VR6GjQDdvYOuBGeidalNLqIt8Py7p
	j+5AgVTtmzOnVmV+K+ksEFIlBvBSfLYALgYNYgxYlyBIMlZR1G5YU5Lq4cOZGnXTXNpTJ5SiXl3
	F295bTo3gg7XqNmYKStOZvakQPhIoWvPwnm+TTs1cf+LnWp5Vy8VOlQ0BVnZR7FVeS/yuFPgHrD
	nJ7qtQiXwWAKb+5gYN4om4ajaBJh9mQXYiAr+j+wdUjvVwiic5lcNiuZVbzwF9Fd0O6ehs/JHm+
	iwjbof5SMnSNLqkm+pWuMY5y1TcdmaYg6Adlw96F8tfUcPVJBxiaUEd6lD9j9pasY=
X-Received: by 2002:a17:90a:ec8d:b0:37d:f983:7b5 with SMTP id 98e67ed59e1d1-39b26101c08mr5553870a91.9.1788500621351;
        Thu, 03 Sep 2026 22:43:41 -0700 (PDT)
Received: from localhost ([122.172.87.224])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243f780csm3885069c88.13.2026.09.03.22.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 22:43:40 -0700 (PDT)
Date: Fri, 4 Sep 2026 11:13:38 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shenwei Wang <shenwei.wang@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-imx@nxp.com, Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>,
	b-padhi@ti.com, Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v15 2/5] dt-bindings: remoteproc: imx_rproc: Add "rpmsg"
 subnode support
Message-ID: <appaikrdwu6GpSGy@vireshk-B250M-D3H>
References: <20260721204704.400781-1-shenwei.wang@oss.nxp.com>
 <20260721204704.400781-3-shenwei.wang@oss.nxp.com>
 <apmunD8bkKOu5_Vm@p14s>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apmunD8bkKOu5_Vm@p14s>

On 03-09-26, 11:30, Mathieu Poirier wrote:
> I'm proposing something like this:
> 
>                         $(transport) {
>                                 compatible = "$(transport),rpmsg";
>                                 #address-cells = <1>;
>                                 #size-cells = <0>;
> 
>                                 gpio {
>                                         compatible = "virtio,device29";

I would just change a minor thing here:

s/virtio/rpmsg/

This isn't a simple virtio-gpio device, since it doesn't have its own virtqueues
and uses virtqueues of virtio-rpmsg instead. So this may better be a
rpmsg,deviceX (where X is virtio ID) ?

>                                         reg = <3>
>                                         gpio-controller;
>                                         #gpio-cells = <2>;
>                                         interrupt-controller;
>                                         #interrupt-cells = <2>;
>                                 };  
>                                 gpio {
>                                         compatible = "virtio,device29";
>                                         reg = <4>
>                                         gpio-controller;
>                                         #gpio-cells = <2>;
>                                         interrupt-controller;
>                                         #interrupt-cells = <2>;
>                                 };  
>                         }

-- 
viresh
