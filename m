Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C9C38FA6
	for <linux-doc@vger.kernel.org>; Fri, 24 Oct 2025 00:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761266731; cv=none; b=giMUXqoMsIQWwMOos1zo93S2CbclRRpBJ9as/yq4krsOwXx+NtmiHFqcjo/K6lauaGEdmyrcX++ign+Tqc+LWy+ba4VVGDwbfoKm/q4FHqt5LByNp7vydsv6u4XLLLsVWwpjudwYhDWw92k9Sdy934bj7hZVduMO/YXMtTCo2T0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761266731; c=relaxed/simple;
	bh=dp/cP8zcAEvQUvgno1S48/Mi8rnaT41MC9uZ0aZ6H9E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r2brgFr2Qaj+laG+eOUUolin9dC2g6+e9k89MkLHIeHxc7K+kNfO9ZJBB74C/Cq8iTGOWRmk2Om8CAnJnrTYWWKxsu/yZ99uWi3JZBY0c6g96v2VDat81PyQjwR/SgTxdxyHEDBfqYw0wm2WbfJc5iedfLDUON2xTCiVVyx9PEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mw1l1vku; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mw1l1vku"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7a23208a0c2so1210400b3a.0
        for <linux-doc@vger.kernel.org>; Thu, 23 Oct 2025 17:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761266730; x=1761871530; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BiQAoFGDew/ZqTfreZLnGJFxaRca4v0mR/t0Zt3wPxM=;
        b=mw1l1vku56L7HpDQG9IYJY0DNNmV2gMQZKbybN1aKpHuZ92bFsXihhEB0RV4kg8SOV
         VasqW8wWBn88fB0b+tmfiMAMl0RXuraDXvxcWUkIpp+mEm7Iv/UaRp7H6WTBCT1pV2k+
         GghpZmzjbxuCIlhkHXM5iCS5tEaFrBbgW9XUZ3/VqEWh2uIs0Jc8oCJSZFR3qtujaHb1
         3IxcVnpdWNAz7flPUyFUO8ch9pigfM7COSUuxy+TosQ5xIkvcsrEUxQwzWyN2cZfuV0S
         eNgKyTrj/VIIZr3teOWIYgncNGolU+qXXfpC0dUWvfnsmZ5KTC5WeT64fN1/RDC4P9eD
         SrFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761266730; x=1761871530;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BiQAoFGDew/ZqTfreZLnGJFxaRca4v0mR/t0Zt3wPxM=;
        b=FM0g2fQvHWSplRWgoGS1GxGNzP7rFPmD29+ssi/+6MvBprlA/nmo9ZFE+NR0Uocia8
         kiqw4cjYt5H7ZnGcTM1W1ccUCUOXfu38iVOgTv6mJDlfllT8lgrZopHKOnN0zPtYrzwO
         6uH6RWedEEnHRrQ7sflDrcCwkJYpF39L6ewu2bYs2GO7fBJlJFnuv7MMnbZyD+gQh1rH
         YujvsJ04ikr9tcYpOxlRMpaoOE5p7QhNoKuQ9MzPBGXLIKw3G2VA5lbSFaBbH967TVyS
         zy3bm0KBRcZYbtGt9mg/cIQGgCLb51/4Sojrqr7oC+mzZ/1QwOVAVwRqSOLbEc0bcog2
         X4HA==
X-Forwarded-Encrypted: i=1; AJvYcCWF4VH/H/bw3NjKVkicISsGcNzNQ8N9KV/pEeRXZgdImvy/o6cwNw8q3AHvaCHoO9xkSdbliM2Aef4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwaWFBOvuCZcUYI6JWXtgN61NaCYzOd3JU2dOVpV7l6xiuj9ybQ
	UiZnk+WBh6xo2WHpXqgEZCBTHt4JKqTmBI9BiAfiRzNesfiKxm6C6VGx
X-Gm-Gg: ASbGnct2F1y2k/8DVmPreV0+NPlWMCk/T8y5VdouF+A2VSv63/7OSKwVBHfSV1m4eIt
	9nSQIbzE/kKcTrzwOI3/Qevaz7b6uMjXQjvZXhoNtD9WyAi5hOUFyMkyJNSqdH+/2ydzulL7jRU
	YdRKTv4+38+lbS97u9LgqEP93I1+lY3P1AJrXJQ7zdNh/Lm1RZzJKpIpYNeEriYyoQ1elzirRT0
	25X6IoXZj8qaMjDHftaw/mthIq+9otbiqLdABi4MiJp3V8DNOJzwps8iGaO4ivNVVUE3r5LkDWy
	xNKVaCWpCoXMoINz3VBWkBHxumLZoGKbI+/DzPbBqK8HvbcCceJqIA/gYH6bHZF34NeotswE8zJ
	tNlxR8K/jILE5w75W5MdqwhHPTqq5szi3x5IG+3S/H6T1qMIAdORgfWRVIw/DR4ymn558DIChOo
	YawnTnpoMl2yZLdmFrm3I=
X-Google-Smtp-Source: AGHT+IFnnZIKoGCQomFCAGHPFnchCLdxRUrJ5xP0ExMryJO2JZfGanXAzObKKUl27Cc8JB6hozrsOQ==
X-Received: by 2002:a05:6a21:6daa:b0:32d:b924:ed87 with SMTP id adf61e73a8af0-334a854ac50mr33328122637.20.1761266729651;
        Thu, 23 Oct 2025 17:45:29 -0700 (PDT)
Received: from [192.168.0.150] ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a274a602c8sm3973490b3a.7.2025.10.23.17.45.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 17:45:28 -0700 (PDT)
Message-ID: <c1400c7e-ba80-4814-b5a0-3d326d97d4dd@gmail.com>
Date: Fri, 24 Oct 2025 07:45:17 +0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2] Documentation: ARCnet: Update obsolete
 contact info
To: Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Linux Networking <netdev@vger.kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Michael Grzeschik <m.grzeschik@pengutronix.de>,
 Avery Pennarun <apenwarr@worldvisions.ca>
References: <20251023025506.23779-1-bagasdotme@gmail.com>
 <295b96fd-4ece-4e11-be1c-9d92d93b94b7@infradead.org>
 <aPnqn6jDiJkZiUfR@archie.me>
 <b77b8a60-2809-4849-8a6e-a391eacf050b@infradead.org>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <b77b8a60-2809-4849-8a6e-a391eacf050b@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/23/25 23:43, Randy Dunlap wrote:
> 
> 
> On 10/23/25 1:43 AM, Bagas Sanjaya wrote:
>> On Wed, Oct 22, 2025 at 09:21:43PM -0700, Randy Dunlap wrote:
>>> I found the ARCnet Trade Association at
>>>    www.arcnet.cc
>>
>> That's ARCNET Resource Center.
> 
> OK, the ATA is  https://arcnet.cc/abtata.htm
> 
> I suggest changing the link.  what do you think?
> 

Fair enough.

-- 
An old man doll... just what I always wanted! - Clara
