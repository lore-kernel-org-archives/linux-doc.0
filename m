Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5261B2AEED
	for <linux-doc@vger.kernel.org>; Fri, 28 Mar 2025 16:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743180017; cv=none; b=kqkW97IaPpOpjjcUO3xV4sYig0zuv26mCLJN+koCSQeGP6uKS7bJaFjH/Vl3KaODIollDWFm5VT+sgNf1uvDGXWSB4nCI7vw8pLN49WquXwcRUhkaEJcDXjt03waT87cYWibr0xJRpHUautWe3ldS575/GWHR4OlsdCnLnuVkZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743180017; c=relaxed/simple;
	bh=UfMGIFBA2NCp8X6+/ZlKX6NWlh6n9aKB62GIyfMRUvU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DYTBwM4w5alhiaij8So7aaMH4oldo2WY0eyCbcg0tkkujc8YD4FJl3S4W83SYDKjB/Znfa3noMZMUKUldRcG9IFFpiYme7SgSljdHA9z9/MxDos9Vw0p8IyNCJzqQEnJll2c6XAg/ya9YE9zGST7ZLWrWNjR06fnqsGNTLqQRP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=n+OA2Y25; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="n+OA2Y25"
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-6025007e9a0so410898eaf.1
        for <linux-doc@vger.kernel.org>; Fri, 28 Mar 2025 09:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743180013; x=1743784813; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dzrQJVTt8RVOtbppwh2ghVBNZYusJHBIFxOQR2w/3zs=;
        b=n+OA2Y25AB/Td3LiYIbe01/eQQyVT5ft3mgQrfiFSPx+KdL5o+7TEKw3bgXQ2zObKA
         NgZh4fdIr5gBaw8+hzhVj+nSuIfsBPNL+1EetNsoC0PryNXRSHZgSDE6cMCQYHK7oZGG
         alt3Xs4eBJuUvSqcpR3gN0E5XN05RrbFzbp6J9FROv+2ccUtagUzEiZJ4XlVzajT9o8n
         ZoiEpQOoZUA/O6chZnlt2gUwSSbMrdVAFbHNWvdH2eIn7vfkukQBZAWXygMVDjut31Zb
         S1tokCgQjiMRk4IOa/VBFJ3XwDw2cHYo8zOwO0DphGIVVvpM+5xjS4Ykpr78e8JsmMwk
         zylA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743180013; x=1743784813;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dzrQJVTt8RVOtbppwh2ghVBNZYusJHBIFxOQR2w/3zs=;
        b=VgMtDuZQF9djCqiz6+BDZPT6m67WFckT64BXwgPYolwdeHgVdTqpkOd2apldGXUjvG
         DqTUeppUZJtRVhhuINrciEXGB67Wo5o5s337Sr1CWzEmhBJWRu54k8tj+Mu86gI/oQIo
         pve6R8Et8Efmghyc3Ut66OsHxcCY0JckgNnFg2FDNqRwRgc8emhkA2SF2byTpfjcIjeX
         fP6h/K9UmTMVOBIxLZF7XIlU5E6pdA4uozaJqh+3x6uRK/Mfq8FsQxuRqQ1rQMTuaaWC
         paDCJqviqPviNpiprPGQxzhygHwyw9vU4wxxPUrZx1pgfaYSXAuiwT7IwBx5BpWU+cPD
         laxg==
X-Forwarded-Encrypted: i=1; AJvYcCVTVF9Q+JtKYzrCc7eAwAZ+pQuE7s4FQu/d+ifdrNkxXiaWO5zhJazvVOAyXjCOFxVb4Me8W7jwvIg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMT3wbh4ZjzgaquXzOSpGPAaG0IYwE3IEeXGAO4oz5LYO3wvl4
	37TxlAqjp9zKGX0WJjt3IYNAE2yMRm9WwmveoHX2rTSoUiLG9/anBA6h/ZnI05s=
X-Gm-Gg: ASbGncvxhsXmhhpmQ+NNm+Umwq1vI1R/a8kuadXoDBwuui5pMdSQp0xAvYTum6NtXeX
	yHYfS9Nu/nKUyxAA8u3rSWrCE/ANqHmGOUvoXsNtGMznQwC8KuIP3hI4aXwRUFRmNoismG1kpbH
	wjgn+DyqF/v/nJGD3K11vT6L9Lmcgp8VgbpspQT6mLpggZL0nB4km0wUEw15Bc/YnWfnxQkBdEc
	VESwVrDq8RTLmBIZpMy6hI0blbSJ/sPCUZBG1TIbhHxjd7vsMIhdhB0cfdmj/3ofjKuxRRLOsWx
	AuO1daZmQWNTrhxpPGn+2VuubIXMMs760M67V/byPRn04jb4w9/a2WZ8VnYtRfW9j5WuvPn3cTJ
	s/NiANw==
X-Google-Smtp-Source: AGHT+IFsPyxd+WXijsrvJhUw6MhgClDj2ObmqnNkt7n1gwXZWKnnQoPsZ/k6D1o8Tiv7eFjViSnK0A==
X-Received: by 2002:a05:6808:244f:b0:3f7:4b65:582f with SMTP id 5614622812f47-3fefa56dcddmr5562104b6e.17.1743180013168;
        Fri, 28 Mar 2025 09:40:13 -0700 (PDT)
Received: from [192.168.0.113] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-602843bc042sm389572eaf.0.2025.03.28.09.40.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Mar 2025 09:40:11 -0700 (PDT)
Message-ID: <68db2225-4519-4436-bee2-24fbe320ac4f@baylibre.com>
Date: Fri, 28 Mar 2025 11:40:10 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] iio: dac: ad3552r-hs: add support for internal ramp
To: =?UTF-8?Q?Nuno_S=C3=A1?= <noname.nuno@gmail.com>,
 Angelo Dureghello <adureghello@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Jonathan Corbet <corbet@lwn.net>,
 Olivier Moysan <olivier.moysan@foss.st.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>
Cc: linux-iio@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250321-wip-bl-ad3552r-fixes-v1-0-3c1aa249d163@baylibre.com>
 <20250321-wip-bl-ad3552r-fixes-v1-4-3c1aa249d163@baylibre.com>
 <2d12ff156996876e5bd85c793c07bb0c6747981c.camel@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <2d12ff156996876e5bd85c793c07bb0c6747981c.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 3/28/25 3:28 AM, Nuno Sá wrote:
> On Fri, 2025-03-21 at 21:28 +0100, Angelo Dureghello wrote:
>> From: Angelo Dureghello <adureghello@baylibre.com>
>>
>> The ad3552r can be feeded from the HDL controller by an internally
>> generated 16bit ramp, useful for debug pourposes. Add debugfs a file
>> to enable or disable it.
>>
>> Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
>> ---

...

>> +static ssize_t ad3552r_hs_write_data_source(struct file *f,
>> +					    const char __user *userbuf,
>> +					    size_t count, loff_t *ppos)
>> +{
>> +	struct ad3552r_hs_state *st = file_inode(f)->i_private;
>> +	char buf[64];
>> +	int ret;
>> +
>> +	ret = simple_write_to_buffer(buf, sizeof(buf) - 1, ppos, userbuf,
>> +				     count);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	buf[count] = 0;
>> +
>> +	if (count == 10 && !strncmp(buf, "iio-buffer", 10)) {
>> +		ret = ad3552r_hs_set_data_source(st, IIO_BACKEND_EXTERNAL);
>> +		if (ret)
>> +			return ret;
>> +	} else if (count == 22 && !strncmp(buf, "backend-ramp-generator", 22)) {
>> +		ret = ad3552r_hs_set_data_source(st,
>> +			IIO_BACKEND_INTERNAL_RAMP_16BIT);
>> +		if (ret)
>> +			return ret;
>> +	} else {
>> +		return -EINVAL;
>> +	}
> 
> Are we expected to add more data types in the future? If not, this could be simply an
> enable/disable ramp generator thing... It would be much simpler.

Angelo actually had implemented it that way originally. :-)

I suggested to change it to a string because the HDL project for this family
of DACs actually has 3 possibilities for the data source:

	* Selectable input source: DMA/ADC/TEST_RAMP;

And there are other potential sources from the generic AXI DAC like
0x00: internal tone (DDS) that seems somewhat likely to be seen in the future.

> 
> Anyways, you could define a static array and use match_string()?
> 
> Lastly, for insterfaces like this, it's always helpful to have an _available kind of
> attribute.
> 
> - Nuno Sá
> 
> 
> 
>>  
>>  static const struct of_device_id ad3552r_hs_of_id[] = {
>>
> 
> 

