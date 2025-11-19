Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 985FD3563D8
	for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 17:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763572791; cv=none; b=gM6b5W2zuXQ46HM+5KwrG/lUzrnTrkQAoKnF7PprKX2Y1hb9N221QHGu4ptxeYfXHebzWEqW/N4GCo7ICBB6oxDz3XOIiJJRh6A05biABi6/Qf3nph6kA+vHsr2ySaDfMXS7pcof6IYC0nNOE+hHYWIpvD+WuIFj22NgM6uPRDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763572791; c=relaxed/simple;
	bh=UTnsObU+5/BfOz0pGlvdtOsTqbuwL/EFPcGG/OAK6zw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f2qwVAy27mMS3GWveyJIe8HPh1XUUuxGZ4A/ufDtYnvu3RruNvpq3HVubAIZAlI6hRONFCb4n10nIlGXsponj41zRJTGocEpIpu/JzpqLmN2ISYQr5akQ6a8T4FF+xBK57hVSwd+vFbMzE4d+dnxVOhkdMQL3cfFPS6Wz8egDsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FV5ypvbi; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FV5ypvbi"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b7636c96b9aso162825666b.2
        for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 09:19:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763572786; x=1764177586; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yoCeIVGZrihZGBDqvC+f7PXwUd8OXTG8E9X1EYx2gXI=;
        b=FV5ypvbi0c1g1GVk2oRsP6V206ZBIPZ7DJw2Dh/yBQnEfaS3DrvxlCAdZa95+c9xXg
         bb+YFjEt0Ozp3d1PN5x5v+gw6obj0/B1ZiDwzThrcRnW6dJPSATTCaO4vm4/vXoY2ktw
         Adxh515goJVC8qrnbUjtonPWEe0Sb9+/8Lc0xBZu/s53ak5v30IUP1ZNEwpBZvcs9gYb
         72/A/K/toru0tYBR3OdDptgRzjWnWBGekiqSFSK8CnV27FW+3CnlMu0IARu1Py4YdVUa
         eO3C1NMgAFiZy7mnCThN43IgsUfXy9UFfab+494llewzIA2JuHwjX5tikjxOQjypiAPV
         z7ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763572786; x=1764177586;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yoCeIVGZrihZGBDqvC+f7PXwUd8OXTG8E9X1EYx2gXI=;
        b=qBt8NHDMf8GmH8MvtDpNlM87cyplNjdCAhPGSZFTdviPiQFJp1gBBtouBx+8Euyw64
         777Dxaf+XAEO/y5R6f8SEF0VmVXyBSzt2NsVckqTmBreGoy6DHVeY2Cigkx4R+xYrYdH
         PdKmN6HDkKZiAOlV2gRQ/IiVqUa8squvpA4WsOAK3Uq97Qm98rMjTpoeGZSUaJZ/DxnN
         jeyAv0BH6IV6P2MUPYAO+dWqigvWTOEj3/QtEwL4k1pPfKpM9BLuDZWW1i15h899HoeA
         wvbH1xflQYtnQLBD7BBo00gmPa08mH1za6AbS8aBhqGwhJ2qxBSOWIZjiiQQY4QbyTQi
         fNXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTpMkpzSqSmdtHnR4OvRKZMtSQfSeUfVXQa/8sf2AjZpaQ1Dn1OjUdR+hBldPVtEO3sReARN6vsQ4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxH9d6XyhKgfVwe5mgdeAEU8w0E/4EN+AzvMkidUxjAbzdJ28Q5
	4NqmFwD7RnitZbCt3wKEk9+JyGXehDN5W9q985kXxkOmdiQrjs07oPotmqjZP4RgHpo=
X-Gm-Gg: ASbGncuin9eF0wjAw1buIoFA/nyqdc+jdgnnaupyOIcfVJc86zxlZOWERs1pAtyoUTR
	JjRUQnidQ6arYqQZGBPMYczglv2ywRq3ifeXhjVyYbJp8iLKElCfu89qlqf7RPyqiDOnCD8gvEv
	keaDJfpX4xYImd0YGcXUbidE0jkBiz6pWV0KxgiQjK65K2VHpLpWzBwgFa5KFibm6OIMxkt3HTt
	xE79AM91MUK6erHFHf5Jlni8KX2y+ytzfUcvrdE+SlTq0ywhkfj4ae3hl0OGedE3kAbeCyUS9Ou
	jLBI4nDTKeNaH4j8KpG/rH3VBB3RFUm1ARuh3RNhW4Vd+lcBQp/5cEaYU8B8syz00dgcPbbptmd
	DCHerE1YDTowZFM2aFF716uzTHRSn72biKKiR9lzhCwwdX5ef0lLlEgB7E1xPjJl+0biVNkDxVH
	pPLczFW+L6SntkO4aUd3X6yB2+8O+YcJON86ekVkaZWg==
X-Google-Smtp-Source: AGHT+IHFXlBYjBXYt8PjoVc6j/wKQUSsTRCIrYOrIhFX/QpfdOU8ruX00omnczPPKhikD5LHpvnGDw==
X-Received: by 2002:a17:907:2d12:b0:b73:572d:3b07 with SMTP id a640c23a62f3a-b736782d087mr2292251166b.28.1763572785909;
        Wed, 19 Nov 2025 09:19:45 -0800 (PST)
Received: from [10.101.2.140] ([93.122.165.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fdaa15asm1625320866b.57.2025.11.19.09.19.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 09:19:45 -0800 (PST)
Message-ID: <d24c4f4c-e58e-483d-adeb-9ec1799c80dc@linaro.org>
Date: Wed, 19 Nov 2025 19:19:42 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/26] Introduce meminspect
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, tglx@linutronix.de, andersson@kernel.org,
 pmladek@suse.com, rdunlap@infradead.org, corbet@lwn.net, david@redhat.com,
 mhocko@suse.com, tudor.ambarus@linaro.org, mukesh.ojha@oss.qualcomm.com,
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org,
 jonechou@google.com, rostedt@goodmis.org, linux-doc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-arch@vger.kernel.org, tony.luck@intel.com, kees@kernel.org
References: <20251119154427.1033475-1-eugen.hristev@linaro.org>
 <6c9b0aa2-820c-4153-ad64-cd2a45f7cf32@lucifer.local>
 <19171859-94ac-4f41-b100-70a1497e62e6@linaro.org>
 <dc9a8462-8384-4e9a-94e1-778fc763fa9a@lucifer.local>
Content-Language: en-US
From: Eugen Hristev <eugen.hristev@linaro.org>
In-Reply-To: <dc9a8462-8384-4e9a-94e1-778fc763fa9a@lucifer.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/19/25 19:14, Lorenzo Stoakes wrote:
> On Wed, Nov 19, 2025 at 07:11:23PM +0200, Eugen Hristev wrote:
>>
>>
>> On 11/19/25 18:30, Lorenzo Stoakes wrote:
>>> Hi Eugen,
>>>
>>> You've not run scripts/get_maintainer.pl so this is missing a ton of maintainers
>>> that you're required to send this to. This is not a great start for a huge 26
>>> patch series that seems to want to make very significant changes.
>>>
>>> Please try to follow proper kernel procedure.
>>
>> Hi Lorenzo,
>>
>> I included the relevant mailing lists, but indeed I have not cc-ed every
>> individual maintainer. Do you think it would be appropriate to resend it
>> as-is to everyone cc-ed (PATCH RESEND) or just do that for the next
>> revision ?
> 
> Yeah probably fine to do on respin :)
> 
> But obviously let's not land this without at least 1 respin/resend.

Definitely. This isn't something that would land without a lot of reviews.
I am sorry again and hope to hear your opinion on it as well.

Thanks,
Eugen

> 
> Thanks, Lorenzo

