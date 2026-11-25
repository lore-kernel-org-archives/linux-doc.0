Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795621185;
	b=WfRf8gQfy4krGA4fUkKgQX9IrNudJzfXif5mMqbrHmbql7eU66ODCuZldVhe6X86IB+J
	 UMtt17tXTE165LzvkdcdDaDLoPZCMSxKWsuhaoCB6Yxb7yx2ZsTrndpsW1THZPK0iyiTZ
	 h8fHIl4xhWWfGe+weYg3G57nCb/PIYhTqvlnhYa5skL7a7q5yv8NT386GB8682Arclth3
	 4KqGa5r7NsG4mxpnhdrooUX2iY5EtLZoSOw34eeH8SqQZYDdoy/HZFht6NOcax+ERixqw
	 E14GygXA/ReUb8xhOeww65ehPEFMNbF77qEGzxjnZ9Q7xj4pyCxoAZRj9GyYpRI1e0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795621185;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=03OK5Wux5qBQjFwf+S+X4PZ6SO+iKxNmDWiFlrnb6so=;
	b=LRzAhGpwzFlCK03hACvSNln39QMiAuW4suoZ+yEX7HRi3kYBffy8SkY2LtKAyWtzELpE
	 J/fzUaHx9Xm28RaMeFASEBb/SYPgfS53AKQ4W4hwtY4eYcgx6AvI4UUlEzd5a7blimpRr
	 QlW2ByroCnvFNGqOvbUlLDE2pQ2rf9ciJrzUGfb1QLrqgGADzQIGzv3ihkQ1osWqSvX2v
	 gJyWWRo6gXsFDh+m8nPzs6xtjREG6ZDsmwY+EjS8yRckGeaqdYc1UflzxkfomxVoWLF/4
	 STmAJPxvsAzJ/rJS8FmIBED6efJ5trthp9ZCA+By6FqZJjAlZ4ejfdt/Q1LxLZIlyag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hZQkKpXf;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B2E606A687
	for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 15:39:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4B2E606A687
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hZQkKpXf
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a5348aaba5so6514535e9.0
        for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 07:39:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795621183; x=1796225983; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=03OK5Wux5qBQjFwf+S+X4PZ6SO+iKxNmDWiFlrnb6so=;
        b=hZQkKpXfoPCNOyIPGt3na6gHRDhBZ+SSP/SQA3rJHJZdqSm7Rqn+twjMd52AxubyQy
         vFD0Pnc3F4zWRaYn9vD46oH+u3j/NCE+HNKmR1h2U/ppARV1FO/vO2BXMGPp/imJBe7u
         CvqNLaHed8HmgawaaW54JlJPeoQuqrxdGP/0oHfFzObIHwATnPXumKuRH8eMi2ZyEhZ6
         qP0qxR9hxQZg2cwbh3S5OEBOng0kR2oEwMCPDOam3vgu64CMxGn4YxodQgsb4zQSAWWB
         wr6OLfgnXVJ2zeJLop02n0YA29iRtXdPDVrr2CDA9IG/r8zn0oKNfI/MqSZEr7K/Errl
         bQpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795621183; x=1796225983;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=03OK5Wux5qBQjFwf+S+X4PZ6SO+iKxNmDWiFlrnb6so=;
        b=hYsBo1E+Ufi4lEobd4fnasXLZ6z+s+9DkbN5M1SEpQW4RKEIPjbgKJ2UepJ6WzC2qW
         BRiwVcG243z3S1nEla6/dZHntFYCZyjs1db5GLK728/g3SJjOKOf3O0w/k79JcGb3jt+
         ulIuBfGSDCIstCxU//9pCmneDNVk5BGHvg7E/IwhzOxyGTPaSFK/FKMB9L2QP7hSVIXi
         rf+Phb9QdL4E2mUJHq80ykFj1aoh/EnnWcddSmOlwKpQ/9I4F0c2SiWpA/XU0aQ8vPhG
         Ez1ryZQqIlMCzSUP0jhSb9S4YNK73I/KBQwgfqtZE7Wi21WDAliSYoTAA6mhJ75a2/DH
         k82w==
X-Forwarded-Encrypted: i=1; AL+hErETaO5EPHvf0Uj7MOqJcbCqrX7RBoE2QT90ue+G3IH7MivIm9SIPVYcBtT9ybWY7oF83xzsiCuJgzE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8clt0NrMLQY2mfj2fmLQSfvy2SsHe3kHypPVyXYy9pIiwOvDus
	0Abf3KhMNVevMaEo9ozxMwgJhmTDiHcDooPsWguw1+JpRaxF6geWkxfQ
X-Gm-Gg: AZFdTZfBWxL8S1paDroBwylSKBpcLWoW5Oza9k9wUhUOXBogxxmAy1evgbeOBipc5Gx
	oQNi24Hv5vxcOF9ZWTFFHqHDMF+dDMnsrzv7df74D7cdlzCHnKkZ65UVar+zwjVcdYUBhFxRx7k
	sh5dlFvAyxC6XpeX3enyqeiawVTkBPopqO0/PA9ERjqQNED9sTV8Kh8pwjY6jo57+9vnK6DBasX
	4L57sb0Hc05kcHs0ZZOa7orXtWOKRWQ1x+QHurThLjy7qrEC5q62e45QUa19JeSdncQ48T2zOx7
	GGZ32K+/68TkrK7d4hqvXNRoUSoERYfhBTOiRqTdcjgTEOb8SQiNauzhLo5YdSzF370hk6fhKxm
	A5yvIWzVVa2IUIZG6f1o9Zc0kH5gOn3A+HJddevZvxSjThcFuiYig0LR6Yq27tgB9UcRw3Ix/9s
	CAc3X5S5Lf7aP9Q/Jg+fTpQ0NKIX1LY5dHzKlgJwvayv0le5UeSxccnn4Rg1dh/JGWs7vx1GdXa
	7KfP+UVfvPIfVrOC4mF2MCafl9XF2WKUzcATNCWnRoAsc7iDPt71Zo5huUu4AmKE40eH6EW2Q6e
	/nlA/8z2xu0AzNz+T9cE84rqee0=
X-Received: by 2002:a05:600c:828e:b0:4bb:7ad9:2f22 with SMTP id 5b1f17b1804b1-4bb887853e1mr340731425e9.0.1795621183256;
        Wed, 25 Nov 2026 07:39:43 -0800 (PST)
Received: from skbuf ([2a02:2f04:d401:2601:d3cc:6bc:a861:f9da])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a15absm474497565e9.9.2026.11.25.07.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 07:39:41 -0800 (PST)
Date: Wed, 25 Nov 2026 17:39:38 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Damien Le Moal <dlemoal@kernel.org>, 
	Niklas Cassel <cassel@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Aksh Garg <a-garg7@ti.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rhys Tumelty <rhys@tumelty.co.uk>, 
	Manikandan K Pillai <mpillai@cadence.com>, "vladimir.oltean@nxp.com" <vladimir.oltean@nxp.com>, 
	Qiang Yu <qiang.yu@oss.qualcomm.com>, Hans Zhang <18255117159@163.com>, Yao Zi <me@ziyao.cc>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, 
	linux-phy@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v5 8/8] ata: ahci_imx: Use bulk PHY APIs for calibration
 PHYs
Message-ID: <awcBID5pfFm2FadY@skbuf>
References: <20261125043639.249525-1-inochiama@gmail.com>
 <20261125043639.249525-1-inochiama@gmail.com>
 <20261125043639.249525-9-inochiama@gmail.com>
 <20261125043639.249525-9-inochiama@gmail.com>
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
In-Reply-To: <20261125043639.249525-9-inochiama@gmail.com>
 <20261125043639.249525-9-inochiama@gmail.com>

On Wed, Nov 25, 2026 at 12:36:39PM +0800, Inochi Amaoto wrote:
> The i.MX8QM SATA PHY relies on the first two HSIO lanes for shared
> impedance calibration. Store these calibration PHYs in a bulk array
> and acquire them by name with devm_phy_bulk_get().
> 
> Initialize both calibration PHYs before powering them on in lane order,
> then keep the SATA PHY initialization, mode selection and power-on
> separate. Use the bulk helpers to release the calibration PHYs after
> SATA startup and to unwind failures without repeating power-off after
> a failed bulk power-on.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
