Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793709122;
	b=DFqQGj+8RTsqj6716Jdk76Ysj/qt2KfugHWccFo2NYAmFNk4ZxQ3Uzh8Er/8vOih6fOw
	 3G/h7AwEgPKbgAo08HTFL+lDAh/MEvkcvYOefcoY1uifvhNSTgeSGPIhR0gWH7HwkbiHx
	 zsyaEiQurVuiA0kBi3kV0c7TBtXBjR+M1SXr6Iq/rE3X3i5cpGZg3nbbyS3+au9NzaNKw
	 0gLy2UBfxb+3i6UmrbCvTcyBVlQljhON2TOWu03DleMlOw1ir4K6DICXVIwFnQ7hBRD5n
	 7zCPOQjnUxIRib2lT3QUIzsUEr8NkgVVJjCJJgjX6hBXp0ucajMzwzN7upvc3RiiopA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793709122;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=IIfayYr3RFxyM2EsZlquLXo5wwHb0/isaRrVtj+Bh6Q=;
	b=Q/EDIVlMJv+uKyL3YaoMvi7NcO2Dh7iY6pwAKMFtIS+1SfHI2dYIzzz1mXgH8etCokCc
	 oVurzOE1O5VbasN71zpHjZOtvgEqidkdOJFzidcpioJorgxZ1QQTp0BO5e+bFyvmYn4N9
	 0i93j3GDdk13ohzG+gd1n3SL2WY7FX1+LylhJ9wA3JCCxtZbqiyOCtDGV8w23UuqSrmU/
	 BboG+jwujvYLRMYjrMvcbuImC2yMQR/BJqZ4kNBeHyWU9/pE8D+/Gf6tWa3WsQBwMzjw8
	 3S9rjnFAKPm2LQJlyFOHBDgaIe2mF8fwAtTvyU3cbPHzQAgtSzxIm7fclxuYEseGGkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=wW5Sb8Bh;
	arc=none smtp.remote-ip=209.85.167.54
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95117606A329
	for <linux-doc@vger.kernel.org>; Tue,  3 Nov 2026 12:32:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95117606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=wW5Sb8Bh
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5ba36cc21cdso5752330e87.1
        for <linux-doc@vger.kernel.org>; Tue, 03 Nov 2026 04:32:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1793709119; x=1794313919; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IIfayYr3RFxyM2EsZlquLXo5wwHb0/isaRrVtj+Bh6Q=;
        b=wW5Sb8Bh1tOSyGxMONymW2Vgt9LtgwvewWE3HdVh0cNKhUCkJ/YCPaEPxV9Ihr422L
         HyjMb5JsoDLbqcJSqhfZO34LE8WMGK70+JC/vz0DFTgNW5faDqqJczrOPqhedMpvy/7f
         mvt6q07q+UtCxxElc7JUCoCImPQ7uE3q3emliaxs3+TkpL83NAhzBTaV+hpVrRvA5OB7
         2fxj1g+zKHunZsWpo/2qWrqrD+x9xwKugBRhCk+DsP/HsdZR1btPOzjItqnSuAAU/utq
         eS0r5SYLcARtF49KqRWddUtulh6agloHpu+759V5ENZdj4Sojbl4mOsew/qSbyiez4Ep
         1J+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793709119; x=1794313919;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IIfayYr3RFxyM2EsZlquLXo5wwHb0/isaRrVtj+Bh6Q=;
        b=JIFgCLtk1l1/72CiyftVs2pws85PnHKoXHH7hMAVCWqQ3RKRQe9n/NoNZfUkt36n2V
         EpJJdpQF+cxreZaobUQzKBriw6EwW+h7f1HTkO+UgMlCoNsvu982mf9AHVKle+niwm0v
         b8vAgxvovFamzVU7ZK95Tb4AjBZLHrVdyy50tmAXHQMaj/IHH6QA141IyWIGeUmfMPvi
         hqGZ3BpkMyZ+6aZys8zSD8L+iRzqCccXA2EVspWjHRhDF0ywmTynRBV99HY1jL/Z1PKD
         wogw1Vjvw2IatPF92jEg2p2cm36A8+9ML9eTq9sidhLHVnSra5F+PpFQQpXOAc79D6C2
         2c1Q==
X-Forwarded-Encrypted: i=1; AKwUvBxYgPPp372R+VNR4b8GpAl/Si/1ju69hok3Q5P3Tj+eLIlVQRbVEx5MoOyck/NnKJAmgs8WGXsCkBw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9wggsD6UsCG2MabezBxUrpKoVPiacVpY7kCsm9lVV5ULzagKzK
	EJQ8XZ9u8rG/cuYjDFxLZI2X9dGJRJ1HWMrTTdesRb6uUP7wr35TlOr2hL4Xppc9hII=
X-Gm-Gg: AYBFou0xNcPYixq3/+PFn+6+LwjTDZxJNjvP5gisjLEBcJd5yoGsmxhY0gf4VMOHNLk
	DMlutHZ+JVBPjYRUVt4/NNcjYNWnBb+I0q6Ct6dDrmilPF8ozfVb90nfVmg9YXkVPwdpIaSKuR8
	1HgOzdgZ+knYEkmqkvtkYbjpTO4xnH1iq4juDFq37pFbDtEsizznydcIoZ8Pr3MWGwf1ihMurxm
	Mskt7kfVeBmGawc+hsC3uy7MlNM9XgMAeDIP7xyKdg9xbQ+PXPEiHQvjt9cA0jSXsVSnJ1VieOc
	XCHt1CdoLkxE6F6BEv6QxWxZ3uFMr9fGjocxNmyFWWtRWdKiZnwFzwxHvA9x1dBnuuD8KzHUwSX
	XA/RSeBfCgD7VWnkJTb+Sa/XnAUV9Fo2zWWTiKtQxnwQ3IhFsecwxINS222q4pYfVoH6bTknZPr
	Hma7TnalqhMk/9ftTf9Q44xq8k1Bn70C4jzv3yxPgbnnfV6cCJU9o0S5VcVIqipWvep06c1MQTS
	5H/ELaPvf56fgf/xSUXhVP10WgRGioxZtnd9y5qQlaU3l+QQ6NZAwnk+NBokx+WjxO47U1tkYky
	zED2RwAdJ6LxjNhNz3E5yXwu3ZRlvzoMftyf
X-Received: by 2002:a05:6512:31c7:b0:5bf:cfcc:5440 with SMTP id 2adb3069b0e04-5bfd951d842mr4004970e87.8.1793709118568;
        Tue, 03 Nov 2026 04:31:58 -0800 (PST)
Received: from localhost ([208.127.45.21])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfea410206sm964002e87.10.2026.11.03.04.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 04:31:57 -0800 (PST)
Date: Tue, 3 Nov 2026 13:31:53 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Petr Oros <poros@redhat.com>
Cc: netdev@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Vadim Fedorenko <vadim.fedorenko@linux.dev>, Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>, 
	Ivan Vecera <ivecera@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next 00/14] dpll: add a simulated DPLL device driver
Message-ID: <aunT5wlkgVJ9xyTb@FV6GYCPJ69>
References: <20261103093910.596225-1-poros@redhat.com>
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
In-Reply-To: <20261103093910.596225-1-poros@redhat.com>

Tue, Nov 03, 2026 at 10:38:56AM +0100, poros@redhat.com wrote:
>The DPLL subsystem has no in-tree driver that can run without real
>hardware, so core changes and userspace tooling are hard to exercise in
>CI, and the pin-on-pin and reference sync paths see almost no coverage
>outside the vendors' labs. This series adds dpllsim, a simulated DPLL
>device driver, together with selftests that run against it.
>
>The driver is controlled through configfs, following gpio-sim. Writing a

Why not debugfs? Works good for netdevsim.

[..]
