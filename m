Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94DDE1AB6F1
	for <linux-doc@vger.kernel.org>; Thu,  5 Mar 2026 01:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772674607; cv=none; b=FhkIcyr6krHROO9ByLNXPmtELJLOrfs8WOJ6H/icF1VBK5S5UWfuu6J7bMbOU3AWXHouZJYhfMRNgOI43MKpPnRnlLlesdL/tyK/bEKdWgEYboTL51gysjydNLr2jlQlzNs76EA+uG3EVLu6UBx9RjrShGfC4u5Tqt6fizrvl84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772674607; c=relaxed/simple;
	bh=E46tJhu+6s81m4gUea+xkRGYMYCZVoGrL+k8ZcSdvww=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b9uEC+AitawMS/gLOSElOeHDA8g4vDdBrt0i2uYXDMd7hkaloXUc2HwW/cDMzlKbpKE9eWjgq65ofHxxSNLutk9AEOS4WGTQp+q2weTIUFCujZ2JajoP2rw9pwB9gVmXlDdDualU0khHBvyH04kcYCN3ZtwkJtm+1wmWgPcg8FY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BEaWgOx0; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BEaWgOx0"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-35983877dc5so1987266a91.2
        for <linux-doc@vger.kernel.org>; Wed, 04 Mar 2026 17:36:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772674606; x=1773279406; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lqIa5loS+UBDTN9nPFk4k91mm5BOMoTKsoDwc/4GnjQ=;
        b=BEaWgOx0yIYU38iWmK6xbZ7mxR8VAsQy+CE/tEK2OFZhNnsns7+LmZQDDzOBfSaGEG
         sOUUVWvRk3uhW4OTgTBVf8+Fkw/N6uu91po9o4iIVvWb+uulqrfnwuFMwsDskuezRrA8
         yoHoV0kDXbQlh6oSUPo4rzVFRZAXaRB0EBjOSp4uRFriaf9dyyOFnVk6B/2a1LlsxogI
         AB4Vt2wGDqvYtyHYd28TMcdbXtwywul50+rpULRBfSZM/K1YvdCs9HBVQtjLkAzmlUdX
         IyLF1sr0iG/pnlefcwKu7SOCKFrdV9TinIYKBOQJ/D+FfMIiiegQtsDCEmXGMc5RA/+c
         IR+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772674606; x=1773279406;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lqIa5loS+UBDTN9nPFk4k91mm5BOMoTKsoDwc/4GnjQ=;
        b=ImZLU8qy21ttsol0aGwSJyFn9kqrvZIZwOMAJK8rrv1+90b0apbT6X3QdQkKAINft2
         aL48GAGmdgZVQOHcA1YQbnrYxxx3SdQW6ClenFS/aLLZdu4phhGEqWS9QO7nqGUg7Sr0
         vRA80FrODCdDoGOchmitD8HUGL7ugYqvYvxs1/x0jHJMm8iAGD7/PAHhZW/Z9zMUe66H
         /GPpTla+Fjvc1wc53WYxZ+FPznz33LE96hadBtTf2pQW88D6EWZACq1y6ExsgE9qQyuF
         HJtsPogMFh7CA05Y3ntksuCNe+Yhl7Jh7CoCnyFVNoPRh3FLJSZgFJpRvYIqe3Ihq0/h
         LMSg==
X-Forwarded-Encrypted: i=1; AJvYcCW6UoFnbTyfo6UAlpg0Smdi8JaoFuTks9qDqjUbBiX/wOFERWv2HDjKvD53tdoGBQ77s8f71JrGz7Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBzesq7wa+1fVwbN2aU/qqQ5djXQTw8X5vCFEyvfHI0jiwRh5x
	NRd/nZimSPzBFG2v7RW8046r5FztvUwUUxAATgHRkohWG6T8WfxD/Qw1
X-Gm-Gg: ATEYQzyGNp1Cr7e8FoE4WNYbnZazT0eubTkkcf9N1gyzai+dV3GbAIUH6fLgSaAlvSd
	UtqbbYtNt3lkzbPKC38N7Ar4OqPh5dvjyDsGDYGrvmNtKIQHyinqE2sgMCiMFY2T+y5BpyNnSbX
	c4pa5cNS5ERjVgfaXXUqgEQJht9FG2gCQJqczl4Ohfri5AZKTpawW+WYvMknJRYi0l8kgZeiWHY
	G8pp/CJsPkfuA60X2rtYMV5uqrZnTo4lZjB9T4WOfk7zlQUjsO5lCrQ6JI+iy/y68R/DUuhHSX8
	UWo9zub4pEm6JrTHbBPuC+Y3Hb4vP8CgJm5CfSrcyUP099867c965f5j7ElnOq3xSLDvMBi8Hv7
	gSTRMyz1byo0P/6jLXKfOJwxaVREunUqMx7WoblXk9PssaudZ0ImXcXK/PfoUpuqM3gArsWbV58
	gctA7WNAqYEEXJKAWlR+a1jBovIzffwaL2rL9A+ywoZ284Nu5mHye721XO+qRmPZl0
X-Received: by 2002:a17:90b:52c6:b0:359:8d38:cdf5 with SMTP id 98e67ed59e1d1-359a69ae18amr3527827a91.2.1772674605890;
        Wed, 04 Mar 2026 17:36:45 -0800 (PST)
Received: from ?IPV6:240e:38b:d99:bc01:efca:5b50:aaf3:bb27? ([240e:38b:d99:bc01:efca:5b50:aaf3:bb27])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359b2d554a2sm179816a91.6.2026.03.04.17.36.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 17:36:45 -0800 (PST)
Message-ID: <9e1d404b-2145-481d-930d-c3ba5be0a520@gmail.com>
Date: Thu, 5 Mar 2026 09:36:39 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/8] Add Chinese translation for USB subsystem
To: Greg KH <gregkh@linuxfoundation.org>,
 BaiKefan <baikefan@leap-io-kernel.com>
Cc: si.yanteng@linux.dev, linux-usb@vger.kernel.org, alexs@kernel.org,
 dzm91@hust.edu.cn, corbet@lwn.net, linux-doc@vger.kernel.org,
 doubled@leap-io-kernel.com
References: <cover.1765180570.git.baikefan@leap-io-kernel.com>
 <20260303194105.00004696@leap-io-kernel.com>
 <2026030412-mystify-ride-9103@gregkh>
Content-Language: en-US
From: Alex Shi <seakeel@gmail.com>
In-Reply-To: <2026030412-mystify-ride-9103@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Baikefan,

Please rebase the patchset on latest Jon's tree 
(git://git.lwn.net/linux.git docs-next) and cc to USB maintainers with 
all testing you past.

Thanks
Alex

On 2026/3/4 22:51, Greg KH wrote:
> On Tue, Mar 03, 2026 at 07:41:05PM +0800, BaiKefan wrote:
>> Hi Yanteng and Alexs,
>>
>> A few months ago, I submitted a patch for the Chinese translation of
>> the USB documentation.
>>
>> Following your suggestion, I forwarded it to the USB subsystem
>> maintainer for further review, but I haven’t received any response yet.
> I do not see the forward to the USB subsystem maintainer, where did that
> happen?
> 
> thanks,
> 
> greg k-h

