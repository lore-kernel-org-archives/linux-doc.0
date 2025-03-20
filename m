Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F85122A80C
	for <linux-doc@vger.kernel.org>; Thu, 20 Mar 2025 20:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742503689; cv=none; b=FfI8AaCsS1naBsi6UNc8WVnhUCFdLXb9NLdOOgY6VukKImaY7R/tAS9Z1ySpxhUTD2GsimVAjkVSO/JunfHh4yHvmwPoncQuMIwE4jCFdmZBMrfEP6DBpvg+9If9RZp2pHRzOJMUdNPwSNsk6PgvYtwdNxdyo4damAM2b79G0CM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742503689; c=relaxed/simple;
	bh=w4h+/8fL9J+p9KQSOjGKVkQlxbicGt5HKPq7/GWmc/s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G8y3GIlVc/VX9BUSHUgPoPSbsBp9LdOgvprUqFvSBirxDCcPeyUYPLDUbAT7aDYq7jlOSBptt5SDmNNdiB3cBJvQdHSmTtVqCsNyGHQSKbNhwjtf2xRnM4iMP+8iura/Oq73kRwN5S/Ma7diJIW164FyZJzTigD2CrF6jg05L40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=LvCtxvMI; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="LvCtxvMI"
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-5fcef5dc742so332031eaf.1
        for <linux-doc@vger.kernel.org>; Thu, 20 Mar 2025 13:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1742503685; x=1743108485; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NOIKlzsIUoqxD9nEckILpbLfS+//3DA7P6FxcgFgX1I=;
        b=LvCtxvMICD4IOByaajO/ZmOevSbJlryjl5iuxcnKIQz6Rb1XO9TOBksx7Jj57gKNVm
         rfRuRLYqhMCVL0upmDT8FX4tM18QP5r/8rcjKrnFrE95rw/lBYIY7XJuqoqm1dKZksMf
         UlNBG/s2r5GBOWc9JG/6P72xysAoUNsaWpZMiKhqLktYhwCgq/C0z/U6N563k1wUqHBt
         +4KljHvXO3FThxYrNRG5W1dAVTUEy57bwQp1EXXquf8uRRrQuLOoct//dljW4CgR12nx
         zfkYl9zCSVEBrW7I0/Dk5SWJBkGxV9xqogL5zYVgyFROgzNJ0P5flyO0v6WzKk3hBHXM
         zy2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742503685; x=1743108485;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NOIKlzsIUoqxD9nEckILpbLfS+//3DA7P6FxcgFgX1I=;
        b=l0KSzyE5OVhtSEk/76HJ1U7Ae6vrHTBNZixYJs6/8qA9FlBXgSSzOUYtfetTqfHxKL
         CDheuyPJniGgaZyZhkOKNDSWk4jPGHowXd9QApeBWhB1QjxtMHyNWGEbV/juPsrI2w8Q
         xKN+hTk0v9KnExND+7EZ594AcUMwFVQ/+cKalh/grxyk0J9UMgJiXE8pUWBEvyfQmU3P
         KPK7aHxxLE4WwlDIEa+/QYYEhEwEd1J5Oguxf79a4pyHhxVEVOMz5I/p67Vh4myieWDm
         Cs6FhakCxnNbe1gi5B5qtwtLi0LqWf6Kqd4RxnQ+bx4OI3ErSAdzw8tOkoyxWZELEndT
         CVvA==
X-Forwarded-Encrypted: i=1; AJvYcCWek6ai5GwymOxkPaFysHZBB6AxD8aYyFeDsfjWyv3z9RRFMuBbldA60jcHvq88XY4NjPbiYk7bEh0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyu5wEMU0j9/pFNY4X5YKH6d+lbQCGihNKyqvSCCW31xGTVCBMn
	Wr6+ox0An/3y154loBvM4qppyplnrlq1IftGqHkFwAObZ4uoiQ1M9lg/Gygk3N8=
X-Gm-Gg: ASbGncvk/bhdiDNysg/Sb0PoSMa47zlkzu9H9AdWZeE94NmdM3D7CBlBAfknBnyPb+F
	uhtK8Y+ivtnBF4BMNjmCoyoJBAkEkFrKEYu07fNh98UTrSIJ/jxIPR0dci3TUtZUMdqqDiZ/uTG
	xoVMoJfIzDgI/Ze8m7qRf1UgYTg6UXbW9B/Dcp5tRyZQZ2afEMLxMYK7By8Sp0V32yKUhOE9dD5
	7JY2UCW4ki8CsPJEcYolqb0p+QA9a0xOjJyqmQ6c8zqCkmjPV/HOmeH5nmuebzts/sLXbc488jH
	1/XbhIx9DLLvehLPUlo14ZV5vxVjPxdJroWW5uno4A/pKUbU0aR0jCOcNY/hv5xwBtDDiVphtP8
	NgMT25g==
X-Google-Smtp-Source: AGHT+IE0vhpxH7UDXDB9KJbEa1T/74UWrlWb1s0UUKXXPblhRsfUxYaG9aNkhXf3SmFfKn141a/Obg==
X-Received: by 2002:a05:6871:28d:b0:2c1:62e9:584b with SMTP id 586e51a60fabf-2c7805b2ca4mr626009fac.39.1742503684988;
        Thu, 20 Mar 2025 13:48:04 -0700 (PDT)
Received: from [192.168.0.113] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2c77f05ec85sm132955fac.32.2025.03.20.13.48.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Mar 2025 13:48:03 -0700 (PDT)
Message-ID: <fcbe9c0c-b088-4115-b5c3-8e6f8a0dc961@baylibre.com>
Date: Thu, 20 Mar 2025 15:48:03 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] Documentation: iio: ad4000: Describe offload
 support
To: Marcelo Schmitt <marcelo.schmitt@analog.com>, linux-iio@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: jic23@kernel.org, lars@metafoo.de, Michael.Hennerich@analog.com,
 corbet@lwn.net, marcelo.schmitt1@gmail.com
References: <cover.1742394806.git.marcelo.schmitt@analog.com>
 <888928d2224f5dad03a86b7108217f7b4b078979.1742394806.git.marcelo.schmitt@analog.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <888928d2224f5dad03a86b7108217f7b4b078979.1742394806.git.marcelo.schmitt@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/19/25 9:58 AM, Marcelo Schmitt wrote:
> When SPI offloading is supported, the IIO device provides different sysfs
> interfaces to allow using the adjusting the sample rate. Document SPI
> offload support for AD4000 and similar devices.
> 
> Signed-off-by: Marcelo Schmitt <marcelo.schmitt@analog.com>
> ---
Reviewed-by: David Lechner <dlechner@baylibre.com>

