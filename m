Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 531BB1991B8
	for <linux-doc@vger.kernel.org>; Thu, 27 Mar 2025 16:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743092067; cv=none; b=sGG9PbUkz1QpPW4bI1fd+Sif7i7iMxe+PUCaSesUYbUjRLXZJXYP54EXeMxNkYBoAHPh/AnIld7axcPOHeFxl6306QuEtgSY+IoA7j7y3Bp8qwNW0c+0LFL90k4k0keEa1Pkk8sJiMFv70RDg8xCQfL77OJcLGXZlVcxse6IIjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743092067; c=relaxed/simple;
	bh=GNhVFB92K5K7JKIG4jp0Cs6nn7gAJCe0a7Uemu1nmnw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZmthwbAyyXsOmIk3l/tBoqQatdlNB01SUN5+HPsexgEMUoHcBmjdz2C4uClm0qc552Uk47Q+VsdQRyQYDR+i+6F1FXBGPZXw6J1gi0AGPTMLIb8RNV1rETlHsxKCemWjIoMKhxmSLX03b4aIeEqBtjtyeWLUir/mtpZeAoIdN4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=nxF/g/+u; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="nxF/g/+u"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-72c0cf1922bso186587a34.0
        for <linux-doc@vger.kernel.org>; Thu, 27 Mar 2025 09:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743092065; x=1743696865; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wBGuzgbgjNkNQcqVUiXqm271oXZ59Yt1bKTopnf6yGI=;
        b=nxF/g/+uqgnCDGfbHIK3MTUOKyl6X0UaHqew8MyVZlaGhor9RneQnCFGze43fa5Pfu
         He2fEM8KXp/hm9SrEvZUd3JLdFMOG2UmkMI0s4nJRVtWOyPG8yxtJlYiuYw3eIXpGnWN
         NYbNU5wRoRzDc13nszm9uXUW7RSK0gsxM/DGFTwLFgM3B568FvWsxi+t7kr0Q8gB7Q0G
         QJKT9394hFd6q63Key+eeslueFANbpvh6ommClB7hPqhe7ljgOA2gx+aMOlNGjJzi0DM
         sKCUr2tBBgGKMB6XmoGxUc+IIwEHiujHNe6ClngjJgBVkgsAdEKmrKRICOCgkxonh34/
         ZXsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743092065; x=1743696865;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wBGuzgbgjNkNQcqVUiXqm271oXZ59Yt1bKTopnf6yGI=;
        b=AtqxIBk60awKzHYgZNtSiREuGMGU9zovngA48OvUXLOA6+KEwlikfCo6hC92GcuOE+
         0563Nqc0Au6SdT+5ysYndVApG/MnFnf/jtWhDQ2vKzOQBQWsJ/6vZw7PNKrj/4/21uUN
         e7SC+cJzJZM3sGF0D1+JN2SlSPdLlVfQBTf70dgXmawJirDxXLwZVpM1l+VHHZ3JXEks
         TfS25cwpQLhztgqSDapwpBMTgJGNx/jy7Od2VOnvLYyU363JR/qKLQy2g3214j7veOmr
         k7KuXTojuqxZ0a2T2clBkw/BJO5JHBCmQ4KCMRmxyVfrZ7QgSaQ1YtXRvUKEcgtU8sFb
         iKzQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8hjteky86AqN3zaJfEZADPHqT7Pge9UcD/Jmn0Gw7Z0QxedaxoYkc4fFOn0qI9bRMMbaiB+LcQ/A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yym885EQsPwMaYkpCFRUQ3z0mCiKi7omVIZ+5BnXKrKfCdBPUy4
	Jf659ntB6AdLgJFtFofQf+fB9NhRLREJxut+sm7y45Yxj/EBXAYqBeFdPq3F1xQ=
X-Gm-Gg: ASbGncumvkyOwjitcNcKPSQPSk2zU6Uhc0n2WJeiZ+r5WeU6XOcpqhg3QI+Ur6tOJWF
	MVpXV5Dd23UGyLFyMvGfBRlndPimFctTsOuPgtTN+2HFJ5u8sn2A8ta+oUvrEOHUoPZLPNvDuTK
	xBABY6XzDCiigZ/xI1QZtvlZWxq0imucmOFdWg8HIUAQuLhpdNMGRvw17grqZsPXVeZzgseSfuM
	sllzFLRqA2aoCL5nUKB/1ieD2ws2TnOArRffRPgzxVuNNvJEOo4GvhaHzcGmw0XMoWE8tpm6hm0
	XC8cHCJaval2tqrf+OGXjoyLfSxDIDLhjbRJg3UzoS7otCJcB0KSz/L21e9BI7uKZ1lHtUHjRj+
	Kh9zpcg==
X-Google-Smtp-Source: AGHT+IHQtT1DhyUe9XWbkgNCSz3KecGCefNVcwrr5ys75LAC9LLkn90zz5VjZC9zznoSGi6+KerVrw==
X-Received: by 2002:a05:6830:2116:b0:72b:a020:a2c0 with SMTP id 46e09a7af769-72c4c9f2c77mr2663755a34.17.1743092065276;
        Thu, 27 Mar 2025 09:14:25 -0700 (PDT)
Received: from [192.168.0.113] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-72c580fa72fsm35908a34.41.2025.03.27.09.14.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Mar 2025 09:14:23 -0700 (PDT)
Message-ID: <ab73f7d5-77fb-4264-ab4a-03ee78aeee06@baylibre.com>
Date: Thu, 27 Mar 2025 11:14:23 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] Documentation: iio: ad4000: Add new supported
 parts
To: Marcelo Schmitt <marcelo.schmitt@analog.com>, linux-iio@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: jic23@kernel.org, lars@metafoo.de, Michael.Hennerich@analog.com,
 corbet@lwn.net, marcelo.schmitt1@gmail.com
References: <cover.1742992305.git.marcelo.schmitt@analog.com>
 <bb57e4452cb6bf9f644c0ea2c248d4b72ecc65b8.1742992305.git.marcelo.schmitt@analog.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <bb57e4452cb6bf9f644c0ea2c248d4b72ecc65b8.1742992305.git.marcelo.schmitt@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/26/25 8:25 AM, Marcelo Schmitt wrote:
> Commit <c3948d090080> ("iio: adc: ad4000: Add support for PulSAR devices"),
> extended the ad4000 driver supports many single-channel PulSAR devices.
> 
> Update IIO ad4000 documentation with the extra list of supported devices.
> 
> Signed-off-by: Marcelo Schmitt <marcelo.schmitt@analog.com>
> ---
Don't forget to pick up tags. I already gave my:


Reviewed-by: David Lechner <dlechner@baylibre.com>


