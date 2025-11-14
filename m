Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570522FAC0C
	for <linux-doc@vger.kernel.org>; Fri, 14 Nov 2025 09:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763114391; cv=none; b=XFt/pZYnaMO4A6paO8s+PJSy7tPrgBd33noDx0JYG9OsvR+WIHfZ9NKxnUWnP5rHudpMep8EBKUiVmU6PWY17bzmJkW23rPHXe49G9q3xyxYrtYz+2QXLAqkeW4BTkbp8AbfUc3dv6bG8XaX4dzsKTdHZ1PuQLVP+KQmx78eOVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763114391; c=relaxed/simple;
	bh=DHf7STu3fVuI0v0oulr9m9V/jFgWRVRL6YvEAHPEjVY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lTLV6LNjdhal6r07oF5i8rQfSKx7KF77pbs2NtJ4/d425NXsXQh5jvX26mH7MXFmv1yqrNgWjUyfAsqX3Rb2AqHULfWIG9ocOnRNEuupETdZ3MSjqaJjICQyOrKNCxBPIUwtVidwPm1id9vNvX1U72JU+SMU9exV4EeAu0tlOaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RD53t3h8; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RD53t3h8"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-42b312a086eso1077648f8f.2
        for <linux-doc@vger.kernel.org>; Fri, 14 Nov 2025 01:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763114388; x=1763719188; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nrQJj+UBZFNYF2dhW3PzZmg/h3v8iAh4uR7Mb9IBPf8=;
        b=RD53t3h885AXokyYceQkXKqhE+pJWNkvaS/jADy94wwCEpx2LjUlzVyB5VVbNIZT5v
         TL+rxM3ei9PxMoDbHUXL9ARlqmGDPZK759R65fh4eHB4xSxHejHc7opWKx2DNhws4R0M
         3hjyJfxVsHG84tsJXn1RSkGuQT09AUtbTE4DWfyiWG/mT3RqaxBnIdIZuCjm5O4y44oj
         tKC3S3uYCFYauvLi3QSVhs0hLL07iDBxlon+TNYrAymQWmX/ReGErVh0dqtKiBRZYOCT
         NdarqRBqEmxBXWFxBI8EMJdUcYeu5SUfoiLD98qZuX3muHyUiVqyF0jHbv8gIho20N2p
         Q6Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763114388; x=1763719188;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nrQJj+UBZFNYF2dhW3PzZmg/h3v8iAh4uR7Mb9IBPf8=;
        b=knrTZRxVtZiTYkblW3Ztxe48C0EoOY3YXTbqjM0wtZET6Kueo2XGS2kKIIn9otcS6M
         X/yaNTPyFhtHgbIBdgNR8WXxxkDe+H9caH1lctimlM4uzwmYCHng6shlPOfqkyBq/KrZ
         5JIvlpUfy+N5uWXndQWi0lpO1oK/Ip2XAIMjRwAzQL4HHBPQ4/zB/19VdZow4hKJu76e
         GASYBSZedgsuKksepvy0b+UKVSrBaYBoGCH1UDZgRP45W3z3XxbKO2NlQqC4KOtqwjsr
         yTHVML4OoXuVItUakny5PCNiKbJnTTkf+E+61f+RQOlnv35tGZuXUI4+CXYAj54B7wJi
         a+vw==
X-Forwarded-Encrypted: i=1; AJvYcCXI8VyrUQX0F4IBpbptYC48v/r8uBD1k7+2ebT/pVEnHGeZNI7VfTcGavwgBiq9DjUZOsXl2C72ev0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUAYx/cMAbggVBEG4vU6MEnsZ6ll4JT6oLTlldxbzT3YhjqeoB
	wCC5ju97wiclKZWU7KY8zBgGUQq6hXSOzGUW+LlHyvu/PaBKA1wJknaeI6XhivCVx20=
X-Gm-Gg: ASbGncv0r7sI7oCRCbRwG9RBgZFTLoSw80ZCXvbruU9xq0+kGzKbmzVA9FOZnF1bWX2
	3WVlIGBT/AnUGyla5FRCPCNN1rewYcz0QHaVaWf8UsIM0QTjaf3w0plMFgpINlw4sSR8SjtwGyb
	VtLg7a1taN2s5DqS5SYxZnLzm9ySZ763AemsHDMOsp3HncP2lXwJZZFYKrHd1DOCDA73cGFDZgN
	fToWUQ2tRkgP4WdKsc0IipTN9igmkPMuUFVDyrsRw4NniY67kQNu16Y1Z0VqeaLELDirNsIIBCI
	ORTe37cKJk/6UuVqAPew+mqaFmT26scZHPhLS43Pp+w5rX5CKBgvC3U6hJ5xrOi5gvFYKkUIDrJ
	0nPk5e2f5CDLIWTcHIEipQTgxH2HXPY2X8d/HFNhlusTg6PekfhJ/UJ0gYIzF/eiVrAX5qixjC+
	DwDY+uE6Soit5Ta7Am
X-Google-Smtp-Source: AGHT+IHr/RGTftbN2wZlrzbDKOZVG2oNeQkhL8m189JNVIJ0i0dp6Io7uXTllB06dYu72314ISgwTQ==
X-Received: by 2002:a05:6000:2c09:b0:429:c2fb:c268 with SMTP id ffacd0b85a97d-42b5959ec5amr2193055f8f.56.1763114387741;
        Fri, 14 Nov 2025 01:59:47 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f17cbfsm8780535f8f.35.2025.11.14.01.59.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Nov 2025 01:59:47 -0800 (PST)
Message-ID: <67142b63-b413-4ed6-8526-b18b38667d42@linaro.org>
Date: Fri, 14 Nov 2025 09:59:46 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 13/13] coresight: docs: Document etm4x timestamp
 interval option
To: Randy Dunlap <rdunlap@infradead.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, Leo Yan <leo.yan@arm.com>
References: <20251112-james-cs-syncfreq-v4-0-165ba21401dc@linaro.org>
 <20251112-james-cs-syncfreq-v4-13-165ba21401dc@linaro.org>
 <0eb1a2b7-8064-4ac5-bcf8-b4898a8b5ac7@infradead.org>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <0eb1a2b7-8064-4ac5-bcf8-b4898a8b5ac7@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 14/11/2025 5:02 am, Randy Dunlap wrote:
> 
> 
> On 11/12/25 7:22 AM, James Clark wrote:
>> Document how the new field is used, maximum value and the interaction
>> with SYNC timestamps.
>>
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
>>   Documentation/trace/coresight/coresight.rst | 15 +++++++++++++--
>>   1 file changed, 13 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/trace/coresight/coresight.rst b/Documentation/trace/coresight/coresight.rst
>> index 806699871b80..80b5ed09d69b 100644
>> --- a/Documentation/trace/coresight/coresight.rst
>> +++ b/Documentation/trace/coresight/coresight.rst
>> @@ -613,8 +613,19 @@ They are also listed in the folder /sys/bus/event_source/devices/cs_etm/format/
>>        - Session local version of the system wide setting: :ref:`ETM_MODE_RETURNSTACK
>>          <coresight-return-stack>`
>>      * - timestamp
>> -     - Session local version of the system wide setting: :ref:`ETMv4_MODE_TIMESTAMP
>> -       <coresight-timestamp>`
>> +     - Controls generation and interval of timestamps.
>> +
>> +       0 = off, 1 = maximum interval .. 15 = minimum interval.
>> +
>> +       Values 1 - 14 use a counter that decrements every cycle to generate a
>> +       timestamp on underflow. The reload value for the counter is 2 raised to
>> +       the power of timestamp interval - 1. If the value is 1 then the reload
>> +       value is 1, if the value is 11 then the reload value is 1024 etc.
> 
> 	  value = 11: 2^11-1 = 2047
> 
> Maybe add some parens?
> 
> 

Will do. I had them but I removed them because it was in a sentence so 
it made it look like a side note. I think I'll change from words to symbols:

   The reload value for the counter is 2 ^ (interval - 1).

Thanks
James

