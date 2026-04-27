Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4644137417B
	for <linux-doc@vger.kernel.org>; Mon, 27 Apr 2026 14:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777301668; cv=none; b=nnF9JWH0h6wlLhM6jFIvJ1f7GkoHyqD0W+okIyA+OhJ5mKNfyEClKFBvoa7oanaEZ3oscd/7ewYY+YfZW4skQvZupXd29WOb3b0X1o7Xfxj07suriuYbOmFDIja81mg81LSlQ59cNRg0Xh8pZyQsqOXzyhElswCdjEAZR1LEbTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777301668; c=relaxed/simple;
	bh=Ip6nIFEnAAxUuakAAg65nChKDrC5qKd6KGqNiKTpTrQ=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gVVB9atvGGyZd62Ou0wLTM/xI6JY3A/vEtB9Egw7u5vsV52xM1JJP2B/PH4rJ6j2Rz/Jkj+Kx1naetRcRmGsyLCwRpkhZ0/NjtbK9sQaRkNEisKFoYqAIOAgYzhT8H9V3s/yB22LN3IUMwduniJOWzAktUAHmVtpOfrVd2mZ8XA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QUrZFRZr; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QUrZFRZr"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4890098abbaso82174935e9.0
        for <linux-doc@vger.kernel.org>; Mon, 27 Apr 2026 07:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777301662; x=1777906462; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/JETeUbjFQm9odeqE/VInNt162gHxV6mtash7vYRFPU=;
        b=QUrZFRZrpzFPuteS49V7dONeCDamj0mPB5f+OMHtWHXy6YV057BmnyPldI3NmaOP9m
         OwCBqfoiUQS1E21EXYcT1Wp9TI2fZl/8+lb669+kqzI0V39ijtMpR+5h3tdrglnJmFW6
         yQE4W2UU3qJ3Xy1Pp7+1OyjZDsb//TAmLHbT91V3DpBv8T72pJISK0swkagQ3hTUrBcA
         0DYKPvUR9AsjOuGstCr0vbPqFp4517lON83na77IyQl+Tefhzs2X2g91HyGroq6rJYKK
         0WYD0BhAnle5122tPbf3jQ/h8uINVlGzsKRPY4yA6JnwXCpvHz5CHEEgv6LZNfrohJMb
         ta2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777301662; x=1777906462;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/JETeUbjFQm9odeqE/VInNt162gHxV6mtash7vYRFPU=;
        b=Lg2xjFIWpvKFPMZQ5vTV3TwUf+s+km2XVxWKrfoEzDNAUZg4ALJy5OQegianVd9gCj
         bJExQSQ5J/WQcFa+WdUzOf54gJoS8/ClcjP/mFRtQimET3Z5oMuwaytUJUucC7EWWkCG
         rLIrMp+cCwav9dw1CT1tUMZsVt+LPXgIk0qa2e+LFp6T0CAWlh8l5yJJQ3lh03x/o33C
         WcPWseeQVK6sb3QCbWsmroVsYBwHGmihAa7iNN0IBJV5Qa5M+DvW8GkTF9D6MvcZ+uLl
         pQhjFItD+VCtm2MmdCzBqQomNFt8VTSyNmjDs0EXKH6iNaH16TaPljpEd7UCVyAODC0Z
         dwRQ==
X-Forwarded-Encrypted: i=1; AFNElJ81ucFEpcZrsFEPngR8CDFbEWVGcVP9Awiz1qyRYT5Br1OqIvkCVnLpsPgnLnXVTiwFq1jfiIzypfM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKIljWfGF1YWD/i2/aluoD/isyzRZeEPW9s4bmkqluOTDp48eE
	8ePVhQo15jv1OlPUcaQ/H6NnBve7GHERUtd3Nvu3DuTnoEGpojtR3RQ1
X-Gm-Gg: AeBDietVwd2WzEocTzZDA8htHy7vw8rsnVmO5EEVQWqPbZeLT9I6aWjPnalsoZoimuF
	FcnMYMRGZRavOFdarWDBpC8RHUsuYPTTIBtfaUHCetbhg7iJUGFisbPieWoL9NrRyJ19LzW0J3g
	H3OUuYTWlI1tvFXLO7yACoU/s0vxvTW8MqsOMMIShfXy68xo3JSRJAQwYq2KdLzZo38QDG3gX+j
	vipb/86doiKIkkzkIdr4E7eE8PBUQ90y6BjAj1Knt15Rft3d7YYGwtUZ33NHuuqVYQR/kSR/Ob9
	YHKcXr1thnU1HCXBhyDTJZ2ozNp8JaaeOqb5e8z3+l+k7kwDNPJKw+PGn/i8km59z6K0BVcbW6d
	RU82Lm7qhkOZsgE0QMIhe+Jv4mCgUp6HLi+RJVPKVFYQwNKcl9JSTvQCE9ZBYofI39spjFZk+g9
	R2BdqJzDYZkVCq5iNqwC4JuVA8NmHRrPePiIfYhvb9njp1MKLtHYZf/ODxNqoxb5CxWKjCISHiy
	31VAIhOTrxMko0zU3FskpnQRIkEcm+ndgYVHKb4waFe565BplrrKw4P920HxQ==
X-Received: by 2002:a05:600d:8447:b0:489:1ff5:edda with SMTP id 5b1f17b1804b1-4891ff5efe1mr344587045e9.6.1777301661761;
        Mon, 27 Apr 2026 07:54:21 -0700 (PDT)
Received: from RDEALENC-L01.ad.analog.com (24.206.116.131.netskope-rdns.com. [24.206.116.131])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a575d531esm144632665e9.13.2026.04.27.07.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 07:54:21 -0700 (PDT)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rdealenc@rdealenc-l01.ad.analog.com>
Date: Mon, 27 Apr 2026 15:54:14 +0100
To: Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>, 
	Jonathan Cameron <jic23@kernel.org>
Cc: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>, 
	Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org>, rodrigo.alencar@analog.com, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-hardening@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, David Lechner <dlechner@baylibre.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: Re: [PATCH RFC v3 9/9] docs: iio: add documentation for ad9910 driver
Message-ID: <acpq4fyekssspgche7q6g5ns57y25alalooorybqfz2fzdr2yu@wj6seookj4ip>
References: <20260417-ad9910-iio-driver-v3-0-29b93712a228@analog.com>
 <20260417-ad9910-iio-driver-v3-9-29b93712a228@analog.com>
 <20260426141007.345c76e4@jic23-huawei>
 <lkvrmc6y2z45b4qsmaxg3c2iaiar6hjmim3hdbkxqx3536yx3p@o6h7de4ire2d>
 <20260427104608.7819a134@jic23-huawei>
 <ae84112jP9UcsHYG@nsa>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ae84112jP9UcsHYG@nsa>

On 26/04/27 11:31AM, Nuno Sá wrote:
> On Mon, Apr 27, 2026 at 10:46:08AM +0100, Jonathan Cameron wrote:
> > On Sun, 26 Apr 2026 21:42:15 +0100
> > Rodrigo Alencar <455.rodrigo.alencar@gmail.com> wrote:
> > 
> > > On 26/04/26 02:10PM, Jonathan Cameron wrote:
> > > > On Fri, 17 Apr 2026 09:17:38 +0100
> > > > Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org> wrote:
> > > >   
> > > > > From: Rodrigo Alencar <rodrigo.alencar@analog.com>
> > > > > 
> > > > > Add documentation for the AD9910 DDS IIO driver, which describes channels,
> > > > > DDS modes, attributes and ABI usage examples.
> > > > > 
> > > > > Signed-off-by: Rodrigo Alencar <rodrigo.alencar@analog.com>  
> > > > 
> > > > Hi Rodrigo,
> > > > 
> > > > I think this is getting close to something workable subject to some tweaks
> > > > to not make the priority thing visible and use rate of change parameters
> > > > so /Sec rather than steps.  
> > > 
> > > I am not sure about this one. Getting the value into units per seconds will
> > > increase the range of values by a lot, e.g., for the frequency case the step
> > > size can range from a few Hz up to the entire supported range (hundreds of
> > > MHz), and if you consider that one would often have the sampling_frequency
> > > at 250 MHz... an attribute frequency_roc could have an order of 10^17 Hz/s,
> > > and I am not sure how practical is that, although it can have a physical meaning,
> > > like a "chirp slope".
> > 
> > That scaling is indeed a bit of a pain though it will go in a 64 bit int
> > however, seems likely we'll get higher frequency devices one day that will
> > limb even faster.
> > 
> > Maybe wait and see if anyone else has input on this.	
> 
> If we think things like RF DACs (which internally - typically - make use
> of things like DDS), we can already go to the GHz "world".
> 
> Not saying we already have such a device that would map the new ABI with
> bigger values (we might have but nothing I'm aware of from the top of my
> head) but just saying the above is, indeed, very likely to pop up at some
> time.
> 
> Just something to bear in mind :)
> 
> - Nuno Sá

under this Documentation/ABI/testing/sysfs-bus-iio-impedance-analyzer-ad5933,
there is ABI: /sys/bus/iio/devices/iio:deviceX/out_altvoltageY_frequency_increment

which seems to be a similar concept to the step used here.

-- 
Kind regards,

Rodrigo Alencar
