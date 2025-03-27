Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE0E16F265
	for <linux-doc@vger.kernel.org>; Thu, 27 Mar 2025 16:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743092116; cv=none; b=t4R57nH3H9W9o9w0ClkIVcXil6Heram6Jv3WBy80D4ESYybp6+1SeyfLvmbG2ApDLPgjq86pr1T72seh4m0fumphCAm/bmqHb816Q1aVgixKeMIBnGVsgn57suBYfyPl4KK40SiOevFMn1fPhaGjKp8fQ1PURSZYClfm+jp780M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743092116; c=relaxed/simple;
	bh=qWWCTQ68mq7j+CUwFi2K1aEUZ53AMjvsxRJpUc0PO8w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G66SV1pHKVLpYvr4Wbp9CyNnPcu2AjVbAzQu+oS+I/7hYxQdGgVepx5aDVxto/GsrcR/21gLnRpTte4+FxLVNlKtsLaxqsx502RXXNBLq+Qaovi4GK9R6m4Eds1xjK3Ivm95sqFQ4XL6rli9+oq4Hj6Z5gaIG+D+f7YQ983Y+JM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=wm0+CTRj; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="wm0+CTRj"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-72bd828f18dso474838a34.2
        for <linux-doc@vger.kernel.org>; Thu, 27 Mar 2025 09:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743092113; x=1743696913; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fnEqDZEWlinHyAAguReDuv9plr3mmwmYbGy/mnA8rGU=;
        b=wm0+CTRjodY77i5hgLK8nMtFll1NDLVnJpX31fyi9QDKk52Z6MYN75egd3KYf0p2Sg
         HgawHQz1jBO74gdTCiF6RO1PsmcZz5jUC0W1ub04QFFqkxW3tV4e3exLSSyvDP0lDder
         TyHhKsQTtaCxWoecyI9AbGw90AysowdEuVfhEqTg+x9m5cF6Fx2czdifJMHASuZeBBcp
         LRkHt/IOo7CDKtS/pceyzVQ8SmNb6VoErOV2YrzuYTBgioi9Ssp5lNqdLjdexacFGmUk
         47wNT8oQgmJ2nOqbH/sgP9csbAaCpQjTmE2+hI8B6b2N9HGFNUhLzn3uBdAvc8pphMFz
         lm4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743092113; x=1743696913;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fnEqDZEWlinHyAAguReDuv9plr3mmwmYbGy/mnA8rGU=;
        b=XWaAZqJuyJgYkVv3SSf4zA7QGYkGYJjdtIxI2cZ0mRGFt+HAL35EwstgXqjZMmGdro
         HrIZAi61NT4Yl2fjxzheVelMtd9k49awIpFjr8N3qtmBwbqJL5eFJWRTXYCkaFY34ZvP
         i8EJg/kumci0xc7vPUZic/izs/nUB/x/7grmf0tbeeaRuVuFA36CLVeOh0TaSPHyc9nV
         5rMv7421YKZm5ga5bhTOwV/umS/sKY+McZv6OlcxgShJ4477BNwHLqzSpyI5lz0ldjuw
         DZwqLxhnREDE5Lz5kEh7kLn/XuLloCcj0/JILadizsj0FIkAo9uY2/gfZdLwBrEK1IMb
         lzfw==
X-Forwarded-Encrypted: i=1; AJvYcCX85O7eP1ZnSLI7PkLE58w1nlfWI5TkgxO1/Aw8wJGjH4JKnnE9/kq2Qk2LTGIVEjKsEJrNwGagcq4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTyZnWuE/3+DNPrX/GwLlNLjauNjVph5t+NNnGXgys4wlcyKHR
	+f/kvCBME6QtwlU/1y6f2qqiFJ/akAAHqVNCx2wt+l3CJW+8HwBx6sE3iGWVm9U=
X-Gm-Gg: ASbGncvFd7aNQWbNXiTUktfVcEX+klLz4Qg0TXQnHclQZQ3UDZNYp4OiAoCK77HTFN0
	IJS6FWlhhJ3YUSgsyO0u9U6enBPVwLWvfyO+mcDsm4pHOpuORAlMzjWe4+IfZX7Kg6FIkngURCd
	0YuK3Ud65hLumRW+jyaEC14TArL7f5eSM+R9iDL4Yoj9HVUivTDpqvpGeEQS8ZXPZCgyZSOsocP
	t9GI7mIjEZRlFhpfpFz1eYCxGE7VPItw3bt5XQ4shBg8EAFrf7T3eOINfzZcE+biXL64hNVzJdb
	UKKBG3a/R42Vm/cC72S/fm7i8oKMiFH/CQzwGL/n8erEkzdLTji5vY73Qv5yz4ZqHrkhUOkRf/3
	3OdaWI93OTDcC4r8L
X-Google-Smtp-Source: AGHT+IHiFiIz7UFhPR1z1zzLH+wMQcHJDifB2bdOLA/PHdSiNHWEb/VWM8B3r45fvBHqZCOtSMsSlw==
X-Received: by 2002:a05:6830:4187:b0:727:439c:d18b with SMTP id 46e09a7af769-72c4c97a4ccmr3152769a34.15.1743092113322;
        Thu, 27 Mar 2025 09:15:13 -0700 (PDT)
Received: from [192.168.0.113] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-72c5828ae78sm33512a34.60.2025.03.27.09.15.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Mar 2025 09:15:12 -0700 (PDT)
Message-ID: <227eaefb-a1d8-488f-9fc3-6d00baa4a56a@baylibre.com>
Date: Thu, 27 Mar 2025 11:15:12 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] Documentation: iio: ad4000: Describe offload
 support
To: Marcelo Schmitt <marcelo.schmitt@analog.com>, linux-iio@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: jic23@kernel.org, lars@metafoo.de, Michael.Hennerich@analog.com,
 corbet@lwn.net, marcelo.schmitt1@gmail.com
References: <cover.1742992305.git.marcelo.schmitt@analog.com>
 <92b7db8eddce5b11476352405ed7695107ba7745.1742992305.git.marcelo.schmitt@analog.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <92b7db8eddce5b11476352405ed7695107ba7745.1742992305.git.marcelo.schmitt@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/26/25 8:25 AM, Marcelo Schmitt wrote:
> When SPI offloading is supported, the IIO device provides different sysfs
> interfaces to allow using the adjusting the sample rate. Document SPI
> offload support for AD4000 and similar devices.
> 
> Signed-off-by: Marcelo Schmitt <marcelo.schmitt@analog.com>
> ---
Reviewed-by: David Lechner <dlechner@baylibre.com>


