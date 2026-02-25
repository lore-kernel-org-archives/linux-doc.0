Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F0B312834
	for <linux-doc@vger.kernel.org>; Wed, 25 Feb 2026 21:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772054828; cv=none; b=T6AkWG6FLpOZWd/fo8c5OGBFJzVWV8fFpiDM6VFOgpmkkVlndRHEBkqHtCEPkTFcS3mPoAZB1FrIrgER2zvLhcqt9p1VhsV9Ul/fMeybHJdiVD3SOaBkJUAuHfCf+FqqnGn/3n2qelzubWnVaC+D1E0PSvmY83zq8YK0b3F6brQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772054828; c=relaxed/simple;
	bh=mh7qnXYQkA7Ahj7W/PrVnNLs2LTGDLU5gA4Glh8Uqq0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=qNmfhCMqg4X7g0qyIIoRPWlLuzEVXnadGDKnAGFjE00wK3x5IxTwSrOSRIb3pSjiB/CeDNJAJr7wjR6Iu2h6Dnka/uWVEWDOD8x1ALoL8/q+ViP8Mf2Ux2JPBnQ72qQJKXr3S2z7LdMUzRVItryQWhJChIONv2gwE39yfSQ+UyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=RUVhRHfi; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="RUVhRHfi"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-463b3697846so1287667b6e.0
        for <linux-doc@vger.kernel.org>; Wed, 25 Feb 2026 13:27:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1772054826; x=1772659626; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UbuookLTgSsWfKX0tCmhPtZVpYMExZUrx5/0NdEq/IM=;
        b=RUVhRHfia93HZfa9g1+zkbL4Qiik6Ub8KzGhSdJl0oq6lAudLwDOS3kc1VL9hshREV
         H5uJq/UeKWbxxh/miIWx0papVf1+ZsjXamQunOfnO/JUpoyT6L5acKbvq00OlbdbxF8C
         r+g5pJmthh888OeJXX6RdbRzu7vPzD0eueZRJyl3AZWBaUv0BidvtcMOumUUVBm0EX+L
         JKefV51DezaKZaD0SnnvMpb8qXDaeU+KxRaLSVTdmIUeU6EtlUnESjxM0DdTYwqk3dR9
         y1f2yec4qA0Gd4U6bA6JqaHcYlZpeDsYqUwSkVBCIG+5MSiM/Sx4nFY3/MEh9Uyh5yOz
         43jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772054826; x=1772659626;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UbuookLTgSsWfKX0tCmhPtZVpYMExZUrx5/0NdEq/IM=;
        b=qlWIb1wqOa45pnuh4EyV71aJOFjBsTb014nheN5Rcr5vDKToDPYuUtsxyfKBS6HqVw
         wwl5o7zpfVyUcYPdiAsDvOhd+Ghy2PiQYe0+3TzMUMboeMA9xctHvPu4USzwrPTNFWmz
         W36WYdWetW1Sp3dSdEfdmFiXsUWYqfv4zGAxcOwH/13m8o3hkbcIR2DHiP7SkSihOBx2
         aqxPoPqKsI2AYK8fjazWovOvoB0PMcdhKyElIW0TDEMFVOn+A2VjX92EW32u0oLoqs8C
         eQ00FBH8FSsiGtr1CHBU+Ogn/T5Ib5bDN65fXqulk1NXuASGPnFvnk7CameSoJLEAa27
         rMFw==
X-Forwarded-Encrypted: i=1; AJvYcCVg6qZlHMy/gwd0Y3jp1Rucrm+ZMvP6pvOTabJkhZ7tfrZrAHl9/Xw4h3tTkSWiSAC7LP+8EsV6N8A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxy7frZQOZDC9MvXtgWf2pa7Bw49ABLZRWf8mZeKSE+fafUKArL
	vbLe5y6xh9nt2fi6jt0hUWOCQ6Karge1ta8DvEX+a6gbJ178t2HifW6iYJw9Wc8QeoI=
X-Gm-Gg: ATEYQzxWG1eHS4w2mkYvnndp3IBEgr1axR5xFhaGrxCGzNmzRq3tZjHOYclPKbmpGRQ
	QJcBL3uDFcPOtSrlKPQ1MimnrZ8YLmnYAPFY4qimAUQrKJUoiLSyBkA0p26zVY0OC60piMr2KPK
	cxdh13Fu5yMd5mfYWP33Gd6HJ4vpIitufZQQKawo/N1MCQdDmCYlkRX4mKx25DHk8oUb7h33US2
	vK7UjKHoK2BPgJT23jeJy60HnQT6dJCkQg4jwVMOFApBswCFk8se0NDof8pmKJtG6lcw6401RId
	8i25d1a70uWk2zUiXQNZiM/G8H/u/vUmptl9q0Bzm1M4ECIwRvbzamuznjg3CRG/9XZKtpNHhM9
	E5YoWdJJw7ElqKu1fsi1ogqQYQ41ldyn+/JQuXpmCoWKPlsZR2a82d4/7gytKCTrkrYdlXolsVv
	poPtmYk7OYQLTYWdtqBIT4fCE92o6wr+0lOg4QDoW4nYwFTw/7xEq4qH5VPGBa/abPytiJRnE=
X-Received: by 2002:a05:6870:e310:b0:3d2:e6a7:e938 with SMTP id 586e51a60fabf-41609ea9226mr370316fac.15.1772054825834;
        Wed, 25 Feb 2026 13:27:05 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:146:def2:caeb:cb1f? ([2600:8803:e7e4:500:146:def2:caeb:cb1f])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4160cf2572bsm64198fac.2.2026.02.25.13.27.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Feb 2026 13:27:05 -0800 (PST)
Message-ID: <9c0d071c-b842-47e8-87bd-4e06afec57ef@baylibre.com>
Date: Wed, 25 Feb 2026 15:27:03 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/7] iio: ABI: Add support for floating-point numbers
 in buffer scan elements
To: Francesco Lavra <flavra@baylibre.com>, Jonathan Cameron
 <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20260225100421.2366864-1-flavra@baylibre.com>
 <20260225101748.2368295-1-flavra@baylibre.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260225101748.2368295-1-flavra@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/25/26 4:17 AM, Francesco Lavra wrote:
> In the data storage description of a scan element, the first character
> after the colon can have the values 's' and 'u' to specify signed and
> unsigned integers, respectively.
> Add 'f' as an allowed value to specify floating-point numbers formatted
> according to the IEEE 754 standard.
> 
> Signed-off-by: Francesco Lavra <flavra@baylibre.com>
> ---
>  Documentation/ABI/testing/sysfs-bus-iio  | 33 +++++++++++++-----------
>  Documentation/driver-api/iio/buffers.rst |  5 ++--
>  Documentation/iio/iio_devbuf.rst         |  3 ++-
>  3 files changed, 23 insertions(+), 18 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-iio b/Documentation/ABI/testing/sysfs-bus-iio
> index 5f87dcee78f7..61961bca4dce 100644
> --- a/Documentation/ABI/testing/sysfs-bus-iio
> +++ b/Documentation/ABI/testing/sysfs-bus-iio
> @@ -1510,21 +1510,24 @@ Contact:	linux-iio@vger.kernel.org
>  Description:
>  		Description of the scan element data storage within the buffer
>  		and hence the form in which it is read from user-space.
> -		Form is [be|le]:[s|u]bits/storagebits[>>shift].
> -		be or le specifies big or little endian. s or u specifies if
> -		signed (2's complement) or unsigned. bits is the number of bits
> -		of data and storagebits is the space (after padding) that it
> -		occupies in the buffer. shift if specified, is the shift that
> -		needs to be applied prior to masking out unused bits. Some
> -		devices put their data in the middle of the transferred elements
> -		with additional information on both sides.  Note that some
> -		devices will have additional information in the unused bits
> -		so to get a clean value, the bits value must be used to mask
> -		the buffer output value appropriately.  The storagebits value
> -		also specifies the data alignment.  So s48/64>>2 will be a
> -		signed 48 bit integer stored in a 64 bit location aligned to
> -		a 64 bit boundary. To obtain the clean value, shift right 2
> -		and apply a mask to zero the top 16 bits of the result.
> +		Form is [be|le]:[s|u|f]bits/storagebits[>>shift].

Not related to this patch, but I notice that this is missing "repeat".
\
