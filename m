Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 960D3350A3F
	for <linux-doc@vger.kernel.org>; Sat, 21 Feb 2026 16:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771692632; cv=none; b=VRSN7KMIYmlQJIcVSx1UBJCP2Lz6raUqiKOA0NxxA0bzhu7hPlYrWMgbQjGD7cnmZceZp1DpTUixa053JESj//utAX34Md2PpWlr4eKpRMyN2nfGd3+UjLsGw6AO0la8sk+Opr6dBp6WsnSlZtNxkbdgr7cTX+EU+miN4sTYbzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771692632; c=relaxed/simple;
	bh=k0kbTCd3YN71jU3N1V4yS8+kudpxzQ5zJw9wwwMv0IE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jh5EX6/m6dWwE480CbOcAMc08Y22j4GqSJOlcNRNyuiHr//P083Mk3xeXwJXkM/LFO2Itm6vyI7SkpRYF+QLB7iOEk354OYamGz8l0xvWn5DpMBode5n9jd+VYJ8uR4rvPZNGrK5e28aTS3GLmOXNmetTOBSzQ0eHDoBhBeRodk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=OTp/6C7r; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="OTp/6C7r"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-40ede943bf0so1834326fac.2
        for <linux-doc@vger.kernel.org>; Sat, 21 Feb 2026 08:50:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1771692630; x=1772297430; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=izviceERiQz5P0hhZDsw9CstV6qug4ZWHDz4Ohmg/48=;
        b=OTp/6C7rxVNDCMikSVRrq9w+Dcl2XFr1Aa/Ej40pphFDNgA4wO486Edp41W4gWyWbb
         oJj3SIMCbV13EGmYRNC9RMexnSvMK1/Wsl6C+Td2dz/0+Yupvym1efPmVXrzKcO9IMau
         4S6etkpwVyqMztI4S3EIMK0JKZMSTVVe/CVVAZo3kSz5MGxayamJpEw5MLo93arc8gBn
         GkHI9IlEhsroOlEbKBsGTTzLVf0XSl96XfyWcWUKV29dLBHRjPFyCBTH43ZzUNZLM0yN
         I/obDzI9TzSJjFAcNhBmObuDJd6Mht72KDmsK/MGzHKc6rYE4X6i5rhsr6Cf2sBAmMTA
         6fpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771692630; x=1772297430;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=izviceERiQz5P0hhZDsw9CstV6qug4ZWHDz4Ohmg/48=;
        b=MAp8qX7rago9AP3GYd0CNwZpw6hAPFXM8B2/UYWDckAlH/Iupms7UpFD8cVwVNL8Hy
         ++VsXZPEJeyGeLgAgvJc3QMn8iUPTbxPBFusoV6lD3FpSGyYLAD4NwGxcB1nbJuwHXFr
         luFqojrfbxgLWq8ZJpykS0W2QbN4Ing7TsLXSKGeKx1nJJtDeyXfhJLJcsGQcWg4G3RR
         sLYitmjSq8Xfz0eXyBaKHHIlEIQXM8eaIRKQE+0EXG+ehYnreI+SLf5e2wwy3KScegvB
         GF6TN0kPv+i6n8lGP82kQ/nnpbhmY3KVXiDNLebEvPgv/GrsuZ0678TMQYcCmtOODKd+
         9Fog==
X-Forwarded-Encrypted: i=1; AJvYcCUZYuYsIjO0+uixDKJFP3VeWSTH2mcVNOKU5ld1/DBeujI9T8mKukTLuRv5/K/Uk+2poAp63Lu6sL0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yymu+mrxH7FZVz9KzMjObSARA/sHJ9BJa1bfkFe8k2Q+NRMW+mC
	vF9m+Q1eU+ajC3ggqddxczFvrfBhkizoarYifzoWLCuWB6p4Tbu2nk+sJulvsn1SlgM=
X-Gm-Gg: AZuq6aKq+8nl4BkoC6zafh2s8heqt81kLbedhRKpE6XqU/OlSr/OMXhmr+s0yHyKbdS
	itE2mmkBCo8DCvMuL0Kc+OncLNWjEjrEzvvvSEhn7jD5x2FHRgKXyfuiIbSp8c5BNwpMX4smzux
	2PBYgDYvnBAYmdhLs4R4Wfvv66O2nC5zhTDQ152bu6/Hx/sgVAYUFeoZU/wJvTWlsOAzk2XgpLt
	ktdLCZ4FDbU0O6+CLhvQ1JZWqKCXloIB/+81iwyrXTW9G1zvgUzGoSon8XuovP1xzJT1/svJpUN
	jimVflTSj2DjhyU9nYCakh5IigriRd+K1hWECpH++tTh5pr3LrMrki3s0i85rJIDUyq0ERwj/RZ
	/dioYX8m0TuW5kpe0e67T4ZG+685A0DMDVnlITNZTfFs9sztUj9nJ4V7ccVtube8rAl/vtsf39c
	BayEEA69SHx/POPooUhrKukKJpP547LIp5uC30r4pk7VDkK8Z4W+5xkbMg1h/wqZ/Mfl/7kQ==
X-Received: by 2002:a05:6870:32c9:b0:409:81eb:cf56 with SMTP id 586e51a60fabf-4157b0ea290mr1837629fac.27.1771692630414;
        Sat, 21 Feb 2026 08:50:30 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:611:96af:f385:64bf? ([2600:8803:e7e4:500:611:96af:f385:64bf])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4157cd54ed8sm2806005fac.1.2026.02.21.08.50.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Feb 2026 08:50:30 -0800 (PST)
Message-ID: <7e3f7285-f302-4940-b7d0-8e8f2f2fa996@baylibre.com>
Date: Sat, 21 Feb 2026 10:50:28 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] docs: iio: adxl345: update math and examples for
 scaling
To: Taha Ed-Dafili <0rayn.dev@gmail.com>, linux-iio@vger.kernel.org,
 jic23@kernel.org
Cc: rdunlap@infradead.org, skhan@linuxfoundation.org,
 linux-kernel-mentees-archive@lists.linuxfoundation.org, nuno.sa@analog.com,
 andy@kernel.org, corbet@lwn.net, lars@metafoo.de,
 Michael.Hennerich@analog.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260221141251.34855-1-0rayn.dev@gmail.com>
 <20260221141251.34855-5-0rayn.dev@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260221141251.34855-5-0rayn.dev@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/21/26 8:12 AM, Taha Ed-Dafili wrote:
> Update the documentation to reflect the addition of event scaling
> and correct existing technical errors in scale values.
> 
> Key changes:
> - Fix the 62.5 g/LSB typo to 62.5 mg/LSB and add SI unit conversion.
> - Correct decimal precision of in_accel_scale and
>   in_accel_scale_available to match the actual SI unit (m/s^2)
>   values reported by the driver.
> - Document the newly generated event scale attributes in the ABI table
>   (e.g., in_accel_mag_rising_scale, in_accel_gesture_singletap_scale).
> - Also sorted the existing table entries alphabetically as suggested
>   by David Lechner.

If we do a v5, it would be nice to do the sorting in PATCH 1/4 since
we are already doing tidying there. It would make it easier to see the
actual changes here.

> - Add a sysfs example showing how to read and interpret the newly
>   implemented event scale factor.
> 
