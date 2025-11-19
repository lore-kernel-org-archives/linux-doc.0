Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B202E352934
	for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 11:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763550387; cv=none; b=F3hmss+HMRG1C45ost2l3l25AEL1tmBtoDQ7EQdpk+7JRTuGMRrlRvBYPocDS5QwD4dLvxkUmDtpQAhJy39utACzt9KXFabqvwZeCvJ6nYwhIq3gkQBjE814obvL7+eZexnVJ5LqPL77tHInLDtag16bDbyr4VwjMTTqkxzMXc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763550387; c=relaxed/simple;
	bh=NxRHBvmhBNy0u0ARSVXMJmHRZdZL/TXaEXR831k4zAw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KD6ipWQBocgxc91ZmAskSgmjfmpOQrvrO89dSFhgCsFXMnzWdKs0hIzXxbAmLyQmASq+Ngk8DeRJcw0ABeDQTaQX0vRxEczbjfrRF0lR1lExrCBafeiQOV6y2CcNRvFwvaq+r+RUaJ3BUBcOEVnKgJYBT/ckeI5NA7SJBKe6QPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AJ93164d; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AJ93164d"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-bbf2c3eccc9so542754a12.0
        for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 03:06:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763550385; x=1764155185; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8YuhWF3HD+vwBnfM+I0OX4Ic78IWql3v0gIt+QlEwX0=;
        b=AJ93164dbJ1dfsmF5hTUr7rog89vhep7NK2g4u/uBgOYHDkdnQ8YxU+oVSe4Voj5Xw
         BIicUOa2y5FutIs/5/ju+lBgQKMPc3qMnzowjpG0zzUzjSlI35VeSKKyHfo9vBcp1pt9
         5BvglaOefb3/gqWFGbXRbi7pRXAxK/zgBQlcPWUDf7yB1CX1FbsSQ9Ynnv12aRBnGebL
         2GDmlSVHZQ3QhGLoA2knpiAVkOtqmRcv9AGULnp+jM02kWQVy1pZQUJt0kaKeV65y4TI
         lqrFHo2j/PP/0xLirCnhEwkMESfcVcoTcAAj04LEmxticrT8sBw34zMw0EafL2PDGDdR
         XUaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763550385; x=1764155185;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8YuhWF3HD+vwBnfM+I0OX4Ic78IWql3v0gIt+QlEwX0=;
        b=UOTrjrFlW193KyJKdHeR3i/De9PYMX74heis8wsb9fKQXdiMq/Nj9jKL1LW+/cuIcd
         wB5XlXOQsmcK7RhfY+slBgFkWScB9wFQzBSHbVc2EnGB2x8tIHLMXcLAizeagHRIXGSc
         ThDxZBNxewoV3fcVHLB2SzlnVxFXb9YlHjQJILdhslZ2v7hfvKkyoIYeOeAieo35Jk38
         vlFmUNrWU3ZWIJhYJaeYR7Jo+cl75BE3c/Gs4pTfUHkJsGvNBYWcRiQGI4EVlXFNZYhO
         IKxkAXm2sz2jwu7oZoHsLn1jJB2NWMlDBeoRi6rsknkBNpB707r07HRFVFWGM3Wwh96S
         buNw==
X-Forwarded-Encrypted: i=1; AJvYcCU9TwaYTFwq8r5PASuGFqNxwNIA4V7yghxFC+nEI9djv+X2/JCFuLxDik+RsKlPhW5IkzadQu8MFxk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxgw+vHB4KRVnTPC1jFzaZP39XxdCOMMk2NRZFsKdy61ki0w2Ql
	GrWPTyVqJ6ZDSp9+9oxx4jtv1ZVG3y5EOjQwPp6QALuET9FA+3z4TK4a
X-Gm-Gg: ASbGncv2m4GLK4tLvkUkG741SNscreeZrGBsIuKRAXj7zdSrdFxOvNCndBx7d1R6ppc
	ryYMLCSrtiC1qC3yXLRe2mpx9m+Nz6F2DrxbNSPfWl/XSWZdk/OpHYg/3RyuLBlqTmsVDpiBxbb
	I1KzFUsxIYHKKIvXLugNkYKuoyXPotCce569PzBlCxV1zriNLNljh8UqC7MeZkkaVzFoQ1cZQ/J
	Mv2HzKsMR4me20koxPKaIXU1h/CtsikuaT7VfCD+uyNihF0x28pQr2jVVF/w27m3qUuWpFlYBRX
	9tbfZU2HT+BwbdX3Ml8ha8IAuQys9HIdBvVDgeTvlJEULgtXw6KjeezAF4OuR5PDqun2Dl4osO/
	pPyF9PQdwQMDho6xeS2vzT7VmuqpxEznEeymLVqqLSDaBdAl+RG/ZKtvMnxw6plrf3oIOwudBu8
	llGn3m/5IwS1M5RChVNg==
X-Google-Smtp-Source: AGHT+IH50all20trXpBdSJ7R7Sw4Uwv+WJ2AA2lxSbaPJ/o3j7wljJttlmySgXviAjfj8jKijFfhjA==
X-Received: by 2002:a17:903:1a84:b0:25c:43f7:7e40 with SMTP id d9443c01a7336-29a061ffff1mr26440615ad.10.1763550384797;
        Wed, 19 Nov 2025 03:06:24 -0800 (PST)
Received: from [192.168.1.50] ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2b0c92sm204805405ad.69.2025.11.19.03.06.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 03:06:24 -0800 (PST)
Message-ID: <1cb2ece2-9175-480b-acc0-bd1cd3bf2327@gmail.com>
Date: Wed, 19 Nov 2025 18:06:17 +0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] Documentation: gpio: Add a compatibility and
 feature list for PCA953x
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: =?UTF-8?Q?Levente_R=C3=A9v=C3=A9sz?= <levente.revesz@eilabs.com>,
 linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>
References: <20251112224924.2091880-1-andriy.shevchenko@linux.intel.com>
 <aRfWouKGA7q2ufCV@archie.me> <aRzBGhsLA_s1rJbM@smile.fi.intel.com>
 <CAMRc=Mci_jEp-8TW9+hAyb=viMy69SXDSE99k0Rsss_0b7ZY1w@mail.gmail.com>
 <aR2Jqrjb5dN9LeWq@smile.fi.intel.com>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <aR2Jqrjb5dN9LeWq@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/19/25 16:11, Andy Shevchenko wrote:
> On Wed, Nov 19, 2025 at 08:51:54AM +0100, Bartosz Golaszewski wrote:
>> Is there anything else to address or is it good to go?
> 
> I believe it's good to go, as per last Bagas' email (as I read it). In any case
> it's documentation and can be amended in-tree.
> 

Hence:

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

-- 
An old man doll... just what I always wanted! - Clara
