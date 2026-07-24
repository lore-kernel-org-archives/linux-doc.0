Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0454029ACFD
	for <linux-doc@vger.kernel.org>; Fri, 24 Jul 2026 17:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784915621; cv=none; b=fkCSkLNm0KycIvRJ7stO4gfeHhpy2HOxLTCvI602LdrUjwB5QU+1PumbSOH0dJq82sSueBlUd5GRp0Lst9gI85SVFxww3N/KoNMxubmGUCacC/Z+WCqCSb0Bh1jDHBWA1d8vwxCwQHQnGllH6Gwt1P8OXa/CKoKVGRpYRcsO8yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784915621; c=relaxed/simple;
	bh=0eJUOvMAodQaQVUUBrDQ7iEXUrNRHKQ89mRoDZj4ml0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S2ad2HVGyLwRqvby4sIX/tWOb41e3Rm14lNftwxi7XixdA+k3JLWGIpwabTjJMXYIuk5WtBzVg3vIEfYz+E7NiEh1HhRbE1/CrlKuGn1RG9ZARUEIFeAkfC9UKeeezaf3ZHmxaRPsqVqBIUsmN66MzLT7GPB8RgCgkg5Zk1Fe+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ha7RdxFo; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ha7RdxFo"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2caed617615so9029325ad.3
        for <linux-doc@vger.kernel.org>; Fri, 24 Jul 2026 10:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784915619; x=1785520419; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nqO6J9eeOnAlkJqEpMHHKd6wursBXbYPtLID4fIsp9M=;
        b=Ha7RdxFo8xUWk7R1ocnAfxnJ4K39CjEnXY48HZOEHUDSu3cGrqC+CA4oGJWfs5NT0b
         5XM12/VD1UcRTBatW277FuLmq4pNMpzizFegkMaPMp3Z1twHU7rZGpNHnPbjDeN48Vim
         jQ7wjQqUnwjR34BK70Mp7NLC5Xcdw2yBiPlGhbh9PatJ6T3Apnj+03uPAq/29LOru4Bo
         F29MNeAgWxoZSd1Ix7FXtEN5X9lckTEGgZMLiIvCXgY/HOSLTcGVUb2g2cLh9EDGkDXT
         2k2gsqrFlUeczSZ1uAsQkd7ApkeRGtpacxLacNAanIFYsIYMQ0X78LCemJjZAPK0hmIx
         rMkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784915619; x=1785520419;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nqO6J9eeOnAlkJqEpMHHKd6wursBXbYPtLID4fIsp9M=;
        b=sGZmPjg3Uo/Me9oILvYusuFpskQg4F+JLJi8jaJBWyWFT6UAD935lhZyq61kivn1Tj
         w6NwreaD7WesvsqlpolEtodufoX1HeBUGQSVF2RNNW3aR8bMBQG51UzxMUch3V3rl8zG
         YRqxAdXiYkeF15VbtiNuwm1JLzQtIim/bR7WqdQqQJJ4Zb5VyTAeMTl5T4pXM0BzE4Or
         XfLRt0VEe7jwmbnXaeWQ4Mfb6ZrbG50b8INFiD3cOoqXcXXcr9Q3LyIn8kCBY1YwmB//
         9llazruKVcXoeBJxG6IwnE0stXZgWj7aEOKwyU3nQtoID+TGEcGUTfJFcaR3t1G21+IP
         Cc4w==
X-Forwarded-Encrypted: i=1; AHgh+Rrk2Lu1UyMSe9csIg+29GfAQbboxmTlwrGwjdVRb+L52+yjAiEMFEC/nKraeA6Ic7/xrHXl8W0Zdjc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsrYO7Lhvu0Fy4kFLBlCBYNFGQCFVxLH0DhN4OTU/KDtw3sy1A
	V8yvO+1S+7sqkAPB7ssJJSPFrsTy/QRBvn8swzo7ycNYyn3rHRiPQHiV
X-Gm-Gg: AR+sD107I41uUHMvl5N3rwuLS4dEeTjw9swI8QmFEBHyntEoAsHkCT82ZqlFw083uIS
	90GG3ZjtIRx8FKc84Ru8E+N0J5soepB8iXgs4OgwdF4WwPnWuvz8RbJyDO1fhyihM7+CUfrVuYR
	ESD6YaXmW8nUTcx8mhDHP0cdrRuFV5BkQpSEd4BxI+k1tRmeg7QWiZM/qQ0rLymVDVWzOBCEZ0b
	FHmCFN3HbAmJNdW+rm+k1Q11R0s1m1z1nwA0THKtzZbsvXn71vjzBt6n5RAz5yox/pYuysZKtn5
	4F/Y4Jy7OFhBAt6dhvElm4n0BXldEJ7lHbd89TnilGUFahl2D77sH/Ov2ySVA1ar7xxwfTqu324
	+CsKe4xjCpaIjzfcYETumYz/nM4KoozqiHBfW5md7aA6qjQLk91UOnRIttr8mNDL506MnlhJHb9
	3BCazm6JA5OELRFjigLAY1Ikuj635rNyXVXPdc/SJusheGIeZtbnU=
X-Received: by 2002:a05:6a21:7991:b0:3c6:3c5b:ff1f with SMTP id adf61e73a8af0-3c63c5c7ae7mr5464395637.22.1784915619261;
        Fri, 24 Jul 2026 10:53:39 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbbb66e0ccdsm362049a12.32.2026.07.24.10.53.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 10:53:38 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <acd92cd2-ec1d-447e-9e80-35ec5289fd0f@roeck-us.net>
Date: Fri, 24 Jul 2026 10:53:36 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] hwmon: (pmbus/vt7505) Add driver for Analog
 Devices MAX16545/MAX16550 and Volterra VT7505
To: "Pradhan, Sanman" <sanman.pradhan@hpe.com>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Cc: "robh@kernel.org" <robh@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "krzk@kernel.org"
 <krzk@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "corbet@lwn.net" <corbet@lwn.net>,
 "skhan@linuxfoundation.org" <skhan@linuxfoundation.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Sanman Pradhan <psanman@juniper.net>, Debjit Ghosh <dghosh@juniper.net>,
 Jawahar Balaji Thirumalaisamy <jawaharb@juniper.net>,
 Santhanakrishnan Balraj <sbalraj@juniper.net>, Brian Mak <makb@juniper.net>
References: <20260724164919.247162-1-sanman.pradhan@hpe.com>
 <20260724164919.247162-3-sanman.pradhan@hpe.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260724164919.247162-3-sanman.pradhan@hpe.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 7/24/26 09:50, Pradhan, Sanman wrote:
> From: Georgi Vlaev <gvlaev@juniper.net>
> 
> Add a PMBus driver for the Analog Devices MAX16545 and MAX16550, and the
> Volterra VT7505 controllers. The driver reports input/output voltage,
> input/output current, input power and temperature over PMBus. All values
> use the direct data format. Peak input voltage, output voltage, output
> current, input power and temperature readings are exposed and can be
> reset.
> 
> The reported current and power depend on the external current-report
> resistor connected to the ILOAD pin, which can be provided through the
> "adi,rload-ohms" device tree property.
> 
> On the MAX16550 and VT7505, the severe-OCP deglitch time can optionally
> be configured with the "adi,ocp-severe-filter-us" device tree property.
> When omitted, the existing hardware setting is left unchanged.
> 
> Signed-off-by: Georgi Vlaev <gvlaev@juniper.net>
> Co-developed-by: Dhruva Devineni <ddevineni@juniper.net>
> Signed-off-by: Dhruva Devineni <ddevineni@juniper.net>
> Co-developed-by: Debjit Ghosh <dghosh@juniper.net>
> Signed-off-by: Debjit Ghosh <dghosh@juniper.net>
> Co-developed-by: JawaharBalaji Thirumalaisamy <jawaharb@juniper.net>
> Signed-off-by: JawaharBalaji Thirumalaisamy <jawaharb@juniper.net>
> Co-developed-by: Avadhut Naik <avadhutn@juniper.net>
> Signed-off-by: Avadhut Naik <avadhutn@juniper.net>
> Co-developed-by: Santhanakrishnan Balraj <sbalraj@juniper.net>
> Signed-off-by: Santhanakrishnan Balraj <sbalraj@juniper.net>
> Co-developed-by: Brian Mak <makb@juniper.net>
> Signed-off-by: Brian Mak <makb@juniper.net>
> Signed-off-by: Sanman Pradhan <psanman@juniper.net>
> ---

I get delivery errors for the following addresses.
     ddevineni@juniper.net
     gvlaev@juniper.net
     avadhutn@juniper.net

meaning they are quite obviously _not_ involved in the patch approval path.
Please drop those addresses. Also, per Documentation/process/submitting-patches.rst:

  Any further SoBs (Signed-off-by:'s) following the author's SoB are from
  people handling and transporting the patch, but were not involved in its
  development. SoB chains should reflect the **real** route a patch took
  as it was propagated to the maintainers and ultimately to Linus, with
  the first SoB entry signalling primary authorship of a single author.

Does the above SoB sequence really reflect the approval patch for this
patch ?

Thanks,
Guenter

