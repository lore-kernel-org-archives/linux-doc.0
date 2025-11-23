Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B872923956E
	for <linux-doc@vger.kernel.org>; Sun, 23 Nov 2025 05:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763875618; cv=none; b=JIg6UnSn+7C2o7Zi+HS2atUVS7F2Mu5SWj2kLfwcAIz26h4sTzosRIxnzjqniapgUS9w/ecvkGyUMHPnqW9cpHjFVYMW6PRaj4IA2WwaMWhtRXGJTtq6xwa+yrAgNdTj9x2yqCGJSPMR1LJ3kdx2fdnNKi1gcMAl/3uC0p/q8wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763875618; c=relaxed/simple;
	bh=TGXkRSEj59v4fmzhBVXcKvoc6qvXVWnQBpWAuPhQ9cs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tU/gaSa5FVKnBPeo/Z7gvI7h3QsKE3uRZda4yRGeBOwCFHhqAlItSl/WtwXMggo7aEtwUp2lmANeFWMI6/Lz5WgfNUIY/8k5xc0O1XmZNtWHd81u7j7T+nkEDNhzmDHtQi6cqKK54BBAtrPoerDciRp78cdpxv4G+ENziZ8dVEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fCrLgi/q; arc=none smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fCrLgi/q"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-640c857ce02so3057267d50.0
        for <linux-doc@vger.kernel.org>; Sat, 22 Nov 2025 21:26:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763875616; x=1764480416; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PjGpsM7kYRfJ1b5sKAhrTAL0C4ggpD13VM0bgZNvJkA=;
        b=fCrLgi/qKGVqUuGUYsn/6yZ68RTI4GjmPbGkCXnzWVv2d1F6i8Ezk3wdNmHR9QLJD8
         d3A1cxliWMHXiZ/hlhc6qoN3bzjE89J8XqTJ+1vDV/rTmTUQwyeYWzWqeozEweWqUIqa
         UB4H+VJEq/02fZ6OsqOyqg98hoN7iSOR5T90+Jvj9VJacZ3GusUbwiWB5xFYPwjloYKN
         sCu73+I00AXrHqLlBvSetHB8aX6osriQKeEwpxdANEoO2r/voZTOnmqNvv9Mly1uXPmS
         xO0/5kIeeyBim9QKwP5IyZTsnw17ULAaukyOHZLtpAQuX4RqLqWFXRdhNEoeA0DodQy/
         rDlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763875616; x=1764480416;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PjGpsM7kYRfJ1b5sKAhrTAL0C4ggpD13VM0bgZNvJkA=;
        b=qHn/8M+DA+RVY7sBfm3d891200udlGbGUuhfMY6L003C5QoCy7gbS/VNUrqy6c9/Kz
         7IzGyJdIkU3A7e0KNrsEXFcfUknYp5LAgqHHL3eghR5uO8+6/OWRqiyFldnU/pUBxKMr
         SlmqUGQuPzzvDI0K5ursQxYvUT56S0iKoEXjF4uvY9pYY2L9RgTN8L0gK23P73conAqY
         DbjCtaB/2iXyCtm1eLbFxBatiW8D0dsm5ppYJXuoex8mKDPUIBz1QQ3Nq78nq50km80w
         vgB1y3PSfICdcm9rAtZAWa41/SerI/qOzEjUtRkb8e2Vk9W9UKQemvugkdNSoq/VlH5W
         RyXA==
X-Forwarded-Encrypted: i=1; AJvYcCU/OIUErwSw0Z9o9mdPgjMCL57B3n2xCfwHWV33sDOXwOAadptwsJQEXW4/O7sOnHCiXBR3UiWPCcw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRFVHWz72Jf0Rhr3AfNHiaQEadeSVHUP6sY30c0T9F61Xzx+k/
	3/SGS4wHfs/Mxm1QAfzV6EuCq2Xfj/bS8ln9LaZvNS/YGLwmYoHP0e91kLRTxWrqOlM=
X-Gm-Gg: ASbGncvUwKsooLhoORf+/fbs5eN44YIvDrORgLt5Cmm8KiIiyZbfz/80tyCFekkdJY6
	bPI4ndOrtechRKaNJatsH+xxtK9mT7wFuwuNG5kxKSYvlhkNSL3RvzbVCuLvNROXV2XJIDaugIC
	Nx1RESswotb0HGRM/CazibFjLgQI9wnyI4O8SADKBuDA5CPabekyXxDehi6LW2jI3kXLPLHLju0
	4AiY2IUYdheEt0Uf3HL5lsk/dMWs6TrDXex7jMWEOwXKEwsXY8x28A051g/kV3pAQ8VRJKYKeoP
	RE0O92gvoquLdWSJc70IUWs5wzl3o+rxIrQpeVi6hGLrN26+Z7UhJNZH1Aj+5mJVU8tEXa+p14r
	B4FFxCAde9kUT1yu8PWN6L1BWVvTpiovrPd2KQE4FM6TTDcqCGBkBp2OlxvQ2hHv6v5jU9Kv3cj
	kh+tp/n2ieVbltkkrHBXwUld4MhPUEFatPhTlqfQ==
X-Google-Smtp-Source: AGHT+IGSQt2BTiVNAI0ftQDsp6uHPWYBlgr1u3c0+GKuB+achzoTPUutVGMMtrB15Fti6j+iDLhFgQ==
X-Received: by 2002:a05:690e:1403:b0:63f:b545:9981 with SMTP id 956f58d0204a3-64302a61134mr5220318d50.2.1763875615695;
        Sat, 22 Nov 2025 21:26:55 -0800 (PST)
Received: from [192.168.2.226] (104.194.78.75.16clouds.com. [104.194.78.75])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78a79957082sm31908257b3.50.2025.11.22.21.26.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Nov 2025 21:26:55 -0800 (PST)
Message-ID: <411b7025-a09c-4597-9b24-b6f8527ef77b@gmail.com>
Date: Sun, 23 Nov 2025 13:26:45 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] docs/zh_CN: Add wd719x.rst translation
To: Yujie Zhang <yjzhang@leap-io-kernel.com>
Cc: alexs@kernel.org, si.yanteng@linux.dev, dzm91@hust.edu.cn,
 corbet@lwn.net, linux-doc@vger.kernel.org, doubled@leap-io-kernel.com
References: <cover.1763112421.git.yjzhang@leap-io-kernel.com>
 <f9720c918de47890c536124e7866859c866c67f4.1763112421.git.yjzhang@leap-io-kernel.com>
 <CAJy-AmkoqiOEf3mqCzYWYSVEdttEQrOJ_29MpUHm9+GW6DcYcg@mail.gmail.com>
 <9f59f865-4fc2-411a-9978-ea86f39bc746@leap-io-kernel.com>
Content-Language: en-US
From: Alex Shi <seakeel@gmail.com>
In-Reply-To: <9f59f865-4fc2-411a-9978-ea86f39bc746@leap-io-kernel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2025/11/23 12:00, Yujie Zhang wrote:
> Hi Alex,
> 
> Thanks for your review.
> 
> I have run make htmldocs locally and the generated HTML output looks 
> correct on my side — I didn’t see rendering issues or warnings related 
> to this header section.
> 
> Could you please point out which part of the format violates the RST 
> rules, or what specific issue you observed in the HTML output?
> I’d like to fix it properly.

https://en.wikipedia.org/wiki/ReStructuredText
https://www.sphinx-doc.org/en/master/usage/restructuredtext/basics.html

There's plenty docs of the RST syntax online. Please check and follow them.

> 
> Thanks again for your feedback.
> 
> Best regards,
> Yujie Zhang
> 
> 在 2025/11/22 22:29, Alex Shi 写道:

