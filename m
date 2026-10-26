Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793047751;
	b=KZwqG8OUMHldyoDvnC9GoFts4kZ+tGEzr+/wrrGWoKvzn9OZhDqD62w/QdrzIWnQBM3p
	 gmsBFLiZRFggOIx6BlUxbHmYDN5SK1yGt3WKRjppUmvKnsk3RUzzWRpkoN5nz+cGZQHsD
	 Nub4UcaLY03gw84vR0efMftFM4MkjBpLREovz/7UevzDMEhpgvcdBiv788CDZURungEAE
	 wpD+FDS9ziUVZt8aU7vaklrWk3gX93H9dbUMsYh/xikQxHiGRiMNjDMiho1BxHAQADOJE
	 MmRiAmgpph/PRoZnKiEMNfvs1B3C0bJJdx6QKFLJwAHLrYt4O2slYYaDc9ZnJIa7UJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793047751;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=9TGlJH8mE9LBOMpy8hUBezrc3b+6uaVNZir08Qhj/4Y=;
	b=Qr0G0+DyA57YCEw58xPhf4i8xtMrunrAFo1sk5SvcvGoIZf6fBNahrjESfLy0cTlyKQN
	 l0shjNo5uuvlFcNG8/Z8YwPS+Gq+mQ4pde17zl35ml2QTnWr/wd29/upoEWgbHb5JhHAE
	 iRJtz3KqVwVA5/AdnM8hnnr3LO39upuNoAxpwy0OT+IrT2TeGpZ5qj6kucGDOU/SpKERT
	 sGXmdNt/nCAevJ1OgzHJ9SEcaBl1Poq59era73aHfK5j7+lPrxsH8ceodqrXRq5Z4q3GJ
	 jG0jtUbdCS2IIxh4gIFzrUCvSxo7++klNIyMe3jx/8coguhpTbOji/uVgtE/QtAUecw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=n4LXTAiT;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470F8606A321
	for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 20:49:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 470F8606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=n4LXTAiT
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-35cd4e8bdbdso5627332eec.1
        for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 13:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793047750; x=1793652550; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9TGlJH8mE9LBOMpy8hUBezrc3b+6uaVNZir08Qhj/4Y=;
        b=n4LXTAiTiTGuyd3+2e5lsWMu8UQ99JNX5Jta2koR4OlN3EEsqjmoE743H8P9DiP5ls
         Pdt22tiAz4ntnvO+CahN5g48ngubMiFqSvWbswNGIwCy0lGdlyYSKS1jykFCkJGTLigy
         gzGr7oRl2jJBP4iZFqFq8i9Ss0s45J95vD++RZt25/9kEqPcZe0FQahoYB3cwdNJ326Z
         m8FCt7P+oPPFubt66n75aEdrv3sBlBCMFpUg3q1GM+F+4ertbWvJN+HI3gJJyzb8eTus
         RFQ1h5cT7RRu1LW5clr2d+eLWOBGEYZoGfxR1UkQxxCROz1GQyYbSftY4TZEG23c29ae
         BoHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793047750; x=1793652550;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9TGlJH8mE9LBOMpy8hUBezrc3b+6uaVNZir08Qhj/4Y=;
        b=bPj7baZ1iBPYBRd1Ys989/Amh7YMpbb+WgNQO41dpvEEJg2h0935qyVo3mf4RfOhK2
         X2tXH7i6Ei1evAked7UmjAA8qqx0iWZmEAsysRuVoBjbCUqQPoZsil0HAYMLaUXOgt0T
         B8KAMOitncM8qQiOe58yuD5bF6GudiOss0pKH2jnia2+jKCzn0XMpgWQtZ48om51t3GC
         58xwvLSgb8NN/GLs320ZbJisq63C5tQau/cB9qr5FEDrs8i96hCBMOSPiJTGJ2/PVdrf
         4Q/jvS2SG8FBAw5vZOinXfcV3XSpZzdAZctToktmx8DJcW7Jvr4l/4efI6AoJN9ZWnmL
         /sqQ==
X-Forwarded-Encrypted: i=1; AKwUvBwCRF2f49AktrPbXHbQ98dk8LSrsQHypvXGTYHLMO7/HHghckJ9nWiL5fyYBOqKEPG7R5DaLzk6Iu0=@vger.kernel.org
X-Gm-Message-State: AFq9FYK7DAbI0yM3HasNxA/QF0xqJ9/NIo35GbOk8/v6KS34h1/PV7/a
	YifA3ezqLjPbXsz5uC2w0qLUwVNKQUXFlsk9Tyw/YolVOnc0bXhSPiOZ
X-Gm-Gg: AYBFou2aOHU/I1b71lbleYLVDTAe0njmxqb67QNcyQeh03hIQnjwc7tzlbT1HQiVJgq
	DwvABj3Z0jcZ01R71uiqwD2WQEQ3sUngn4tATJOY/B4Q7KNPbr32avpWBfk3kFFlaRFYbrNSF2e
	rSmk8VFEzBvzhhQR/okM/60YXNEkn9Fi/hg1JoKPCSjYGXSXxFGGQxT8p+mGafrziZHUVAbjMEG
	PsGfCTgi5JBRI7NrVp9+2jHfxP03Ezxmox7pvaGp2wbHbvxort72Z1JKebN4jmddmDeYDeOSf/e
	nR4XoiQ0nR7CM2GjSq2m1ZNsTuEcmhLEERO+6fwxFoa0BelcttfndPEHrkF7mgKaHCQpAfjMRtw
	4WCZlNh0lnX/SpoipIoHbmiF0kv3538xSzDaQp18F/ijd2RXDG5k885sLuKDaPizo+8cU4Fz/tI
	9BsjoTut7jh3Q9AHCd6UBPtK/NEMv4o1gOBd8Z7tohKWIuwi/sVCIIsrYJB4+9TXK8UBDJG0xXE
	kKFxfTn4nWSo2xkEiuzrH/AqmdGJKHryAuTMr/4IkNe6RLLXIEcedbVJlflEKahY9m9d2yJDtFz
	HavZSoVxIA3bVRBhkq8RtbeWpY8bF0Tk0FNDzMGJehUl/J5IApUQYB0A8khs0kuR
X-Received: by 2002:a05:7022:ea5b:b0:1a0:e3e2:22a3 with SMTP id a92af1059eb24-1a0e3e22384mr5029745c88.31.1793047750376;
        Mon, 26 Oct 2026 13:49:10 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a2a5937dsm26657068c88.20.2026.10.26.13.49.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 13:49:10 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 26 Oct 2026 13:49:09 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Vas Zayarskiy <contact@vasily.cc>
Cc: Aleksa Savic <savicaleksa83@gmail.com>, Jack Doan <me@jackdoan.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v5 4/5] hwmon: (aquacomputer_d5next) Skip unknown
 firmware version offsets
Message-ID: <ed3574e9-51d7-4996-bfaa-8eced16a49cf@roeck-us.net>
References: <20260927191316.4137752-1-contact@vasily.cc>
 <20260927191316.4137752-5-contact@vasily.cc>
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
In-Reply-To: <20260927191316.4137752-5-contact@vasily.cc>

On Sun, Sep 27, 2026 at 10:13:15PM +0300, Vas Zayarskiy wrote:
> Only decode the firmware version when its offset is known, matching the
> condition used to expose the firmware_version debugfs file. This lets a
> device leave the offset at zero without interpreting the report ID and
> following byte as a firmware version.
> 
> Assisted-by: LLM sparse
> Signed-off-by: Vas Zayarskiy <contact@vasily.cc>

Applied.

Thanks,
Guenter
