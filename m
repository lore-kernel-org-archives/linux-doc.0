Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AFA117BD6;
	Sat, 25 Jan 2025 15:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737819465; cv=none; b=HXGd8YV6wOnvYYILivIbKHqSgiVpGyQ71NGLcJx7dnnBRVYdWulirTsZvgxIKg+WK0BtqbzWw3mkPWFucuXvXmIM3oJATP0yClZ6wLRXuUeGaUGB63rxsBRpPa3XCY920u7TQDozkUGZh3Mkf8WQV+U/hLFltwb3AzxwZrZNGZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737819465; c=relaxed/simple;
	bh=E5k8aiBIEW8gUCxjZppZ//FcmUX4d7KWIpGCX6DBQZQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ccxsGfAmVdzOxe1lasYlreW1tzEuIyDUjUQrq3La4qqAy0kjIzn44JSiiFnoe88EgEME/mlQi0vyJmR5zcAqn4q2vQETyESHfXIllQkgEZCzqo0Or6hUlRWmOyPWrnPTBW8EW2Yb7ubjSrcjGFPd/U5juWBHUeVzTxqsn6CRC+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VkRzMDpn; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VkRzMDpn"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3ebb2d8dac4so1979902b6e.0;
        Sat, 25 Jan 2025 07:37:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737819461; x=1738424261; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8Ujybwc11JlQ0Nlvbt5954Kvys6UfrAI8hcenTMOtPA=;
        b=VkRzMDpnVFIROdpJIt6JPPGpFW5yQnyGqgJHwU46V40RKzKgo/saA3njoO+F509hBF
         PKBeB6YdviHnPw/Ze0IERI38xE48VQqD199obcAEB6uFnAhXdL1fBzof0lHUPw5XAz6x
         KC2YsIDbpQ1Ibbeq3+YPhKcl8SG3AjRWl87aK27WCRZclJsSJisMX3h9WWqMSihcLQi2
         pAbbLlASJRhNhMLdVm4HtVDC8tRih3pie48FHyjYeub8pMc+mswCuVXLTIbtU2Kbh/m3
         Bu69DXJb1kfhriGeH2NX6zCtE8m28LNwsrZ6OjRaPsOc+jFxWsTezB/mm/4d0MZyFjsK
         lXxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737819461; x=1738424261;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8Ujybwc11JlQ0Nlvbt5954Kvys6UfrAI8hcenTMOtPA=;
        b=FZ5Ma5YqUwOm84KTbLJpo6v+eK/P/7cWhcP+90xd1ly5+oDOZ62hwifDMFjvQYw1/d
         wy4zXzmG4tNeekI6w+CKbQvwH1m6ty2xs12cUgUkm/KalsfWaeOSVSF3o6ZHIFZbLysk
         QGFsUazVtwPcdVCIQhF3lAFl3B2BB+XhoGnxdqy+MMKEDTdJQPAIfoq1W7cDLvVXpiBg
         VzxzJaMHStsM4sQoCL5FomSReTUaq+OrUSa6K3/TKxLwfqs+GW4M9BjTdf2xBQLcCW5K
         zWQLc0IlGC9QaXR2w8mxDnlTmfunO0ur0o517p0J9MDKacrPqLfoN3P1QQ09CKNRE25/
         KuUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlkzVGsKAwGaAn6Z+a2ni+ZRx9Fp/kOuHwg3m+ca9IzQTebkU2Sp+Iz3YdHn6ul5vpwQFNagcuLGdh8DLY@vger.kernel.org, AJvYcCXKKlzds0okovRwiRFKS7aWvxKZ0OgUMML+d6rigcxxlHTgSvDxXMws99PKU22McmZnRwuvtIgquP8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRDZcLJM3w0v3ZtK7Wg1UEZvLQgnvMkIQRs992OikQj0c1Tejz
	rAEuW+Onw7/iOe+sdAEw849RF1YN8J4+Vql+wHFU+OAooYIDHUi4JW9qjA==
X-Gm-Gg: ASbGncttZ91/RHsom9JJriGR500XN4gasg8gSE+sG8g0kxZGctNTFcfVf1w1Orj1dDa
	POrO4cwro8r7+IPkXLAfaADvuybLIkehHwkKGdzk9RS77P55VhxLMJQIjeoa14W/TGWLiI5WHeJ
	xrSTroo2ArEq+OI2pLvHS5N37/CpUmNzEnr2mOBLmJnB6pi1tRfyDR3ueGCBYr+bv4DtyyZEvYV
	ATDXUEfE5BWuAq5NO9pM/6VYqhlUt4TfSsVDu1nLfupxGhDFEYvLP0x3pKHKcZSu6NDQjVC1f8p
	iIz6SrOwgX5efhRmQiJarc9e3KryZlyU+BagAOD05k33aNfpSFCTM6Fzob+HpQtadSLw
X-Google-Smtp-Source: AGHT+IEswwBLIk21B3C3okrczJfAdRWuSqYHB3Pw4rfti49qKgyKkWDO6oMXUxIxkIaKqwtCICnngg==
X-Received: by 2002:a05:6808:4d0d:b0:3ea:3db5:ffe6 with SMTP id 5614622812f47-3f19fd31de1mr17026866b6e.31.1737819461391;
        Sat, 25 Jan 2025 07:37:41 -0800 (PST)
Received: from ?IPV6:2603:8080:7400:36da:dff5:4180:2562:4c1e? ([2603:8080:7400:36da:dff5:4180:2562:4c1e])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5fa8b9a1f5bsm933887eaf.30.2025.01.25.07.37.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Jan 2025 07:37:40 -0800 (PST)
Message-ID: <c5ecf4a3-dbd4-4ba9-ae63-66ba396cecef@gmail.com>
Date: Sat, 25 Jan 2025 09:37:39 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mailmap, docs: Update email to carlos.bilbao@kernel.org
To: Jonathan Corbet <corbet@lwn.net>, carlos.bilbao@kernel.org
Cc: avadhut.naik@amd.com, akpm@linux-foundation.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250111161110.862131-1-carlos.bilbao@kernel.org>
 <87ikqiboqp.fsf@trenco.lwn.net>
 <6c8457ca-c43c-4d93-8493-bf4e5b22f3df@gmail.com>
 <87jzaqvfyt.fsf@trenco.lwn.net>
 <de9bf5aa-ef1b-4a12-8cf7-9fe0d050e4dc@gmail.com>
 <875xm9tg4z.fsf@trenco.lwn.net>
Content-Language: en-US
From: Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
In-Reply-To: <875xm9tg4z.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello,

On 1/20/25 13:54, Jonathan Corbet wrote:
> Carlos Bilbao <carlos.bilbao.osdev@gmail.com> writes:
>
>> By records I meant mappings of older to newer emails, which in my head
>> is .mailmap purpose with version control. Do you think some of the
>> mappings as I've added them are redundant and/or problematic?
> My point is that this line, which is in .mailmap now (and which your
> patch preserves):
>
>> Carlos Bilbao <carlos.bilbao.osdev@gmail.com> <carlos.bilbao@amd.com>
> ...says to map the @amd.com address to the gmail address.  But this new
> line:
>
>> Carlos Bilbao <carlos.bilbao@kernel.org> <carlos.bilbao@amd.com>
> says to map @amd.com to @kernel.org instead.  At best, this is
> nonsensical; at worst, you may not get the full remapping of @amd.com
> that you seem to want.  So ... why leave that line in place?


That makes sense, thanks forclarifying. Sending out a patch correcting this
and updating myemail in MAINTAINERS now. Enjoy the weekend!
>
> Thanks,
>
> jon

Regards,
Carlos
