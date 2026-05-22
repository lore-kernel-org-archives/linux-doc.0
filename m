Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F1F403E88
	for <linux-doc@vger.kernel.org>; Fri, 22 May 2026 16:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779466080; cv=none; b=I52Dgzkri9BSNAQ76zLQsO2Jj9PuztYoiDgSHTGmQ234yIeuGsMn4i97tce0438cfD2Hozw/p0rKHOhgj4b0ak8XvznuhHhq2B9UehgxdyAZ3+LqELOgrsY6SCww9S3yPuCs5QlvXP0bCH7pKWmKspC87X+gKoC4RXqTwcVy9w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779466080; c=relaxed/simple;
	bh=Y7/9dPvS9wb8CHvtV6BRUh0jJlPmGU8DE0AFSiPSA8U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lA+Vm9+Ma6kL11MBJVtIV6ai6sk0UmaYdONePdv16Dd/m9hxLgbzIVPu3WtnLtYb7CT38prggcSzlks8vHgwkvE5Bj1cx4SQJoSXcbJd1SkBCO9hqW0UlcgFQKoYfHcEB9ghCHMaMo9LxT8tAvmh8Ty4rqq61L0k98WfxbhgLDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uAfikFmu; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uAfikFmu"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4904127c32cso8403185e9.2
        for <linux-doc@vger.kernel.org>; Fri, 22 May 2026 09:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779466077; x=1780070877; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZKfMNH2kUd3DMgQ8XsJCvcvLB0TOMk+MaTvVWRLAx/Q=;
        b=uAfikFmurOwmI9hezrpykg93cDZbmWN0u6ZdWjKGM0BGpcdTB3jMpKawfmFw6Pc5wW
         1KdyExzLFbyNMDLPtfIqk/BwMwV5zDBbU+k22b8RTlSxqL6cxDXeyP8ZvfHnzV7ypbLj
         hyqDYHQBZOCFsIQNMiGgjJhu9ToNyqoz111+IZi6VYa7baRI1OAiYHp7ogXrQn+ocTLx
         0FkVgoAxUj0jfxpAUP8wV87TtNRUkSl9YAdA7QUYjC0WBr+tr3ZJ6cD7uamBtTExxsl6
         C/8ql6sXYNJRyH/rX8F/1Zd0Jb5AdeHvg8KHtLb2/uHqOK3nlualR74OAY+SXbFRMWUi
         D/qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779466077; x=1780070877;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZKfMNH2kUd3DMgQ8XsJCvcvLB0TOMk+MaTvVWRLAx/Q=;
        b=g2vtjvKULACcV9dtOMIIVr7n8ahiReCOqiBL2Ensys8Z93rbRoGah2OaVb5Yiaiog7
         mbLbur0pR2pXtl/5s7xb8oGw8LiGD0EODcvTE6AvP1jV3yHeUbU8a1sAnx4QjcqP4Ibk
         e/W9aVb6kWkeP/nepAO9ZIBhuOtT5+tod57ZaKIgdRd9p1YGAXXwtpNQopgyYvqrQJNo
         EaA1zPYvq1FvMB+VP33+lrpSnvn163i9iKBjp6AtY9QsLBglNynt3DaDwzEwNWa/odWx
         QFv1MkCoxvNM9U4Is9nLGsUotz7GFONz8sWK2eZ1wc8SaZlq2EMUv/qQcaOzRu0Z2giE
         oltA==
X-Forwarded-Encrypted: i=1; AFNElJ+Uybey43aFNHStfNz5WUtM7wU7QUDQ7J5QP26Zo+rye+G8tA62j75TghqfPXQtf/tQzytiyf1OZsc=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywv1mdzqFu2F5km+rWmmVmF1vLhf4FYcmPKcqJHBfJ1MsU6uZe4
	tnhziXNGHnY3T2rm9cpUXh/ZKpwHHTtUByzgiSpmJYWTyR0TfBRoMDnuzkopX66m0nE=
X-Gm-Gg: Acq92OGXGdkuhNtxYtY/fNKGpN/Km0+Rw73Mv4C7IrmFvToto0pYMV8X1H1VlBkyU5S
	ydMjOgrl4PigJQVBfwdYj1whck44QYqOBN5IrnB6BL83oeQawjl+Ec6j0EI9CQR2sh8U+s+EKST
	dZyAC2fs1IXIokeYJTfgdfeqnMKVwaeVDgGfK7WPUQkeHkeOdMefn9801oNzFgJt91BJvZo0WyQ
	MEFKlJvOw0+9f6lqPJ+FzSoIOwzPCLjArdGNSAXwiAVcq0nDLpvER2DuVncjgeP+CkAxksieK8X
	ZEq6SnOIm+cep+SLQjAvkSRJd2npJknNW79bwUzOW5XhiLN/8hjwQ498EYxz+hY+hth3nNGS9Y0
	Al7dxTxtDzsZfHDfXY8cxccov31GwtAntUaA3JDITVaFFEA+HZ9TfuI+Hephjq2ajH1FsoO2Cxd
	JQCjTQ30jb/w/fff5wLcWStylEvwu7c/DiRnzLK3gJ4A==
X-Received: by 2002:a05:600c:1393:b0:489:c57:7836 with SMTP id 5b1f17b1804b1-490428e5b31mr62133915e9.27.1779466076932;
        Fri, 22 May 2026 09:07:56 -0700 (PDT)
Received: from [10.11.12.110] ([82.76.215.73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454c600esm52915925e9.3.2026.05.22.09.07.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 09:07:56 -0700 (PDT)
Message-ID: <779f2680-2c67-4bbd-9576-bde8e83d111d@linaro.org>
Date: Fri, 22 May 2026 19:07:53 +0300
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/28] mtd: spi-nor: swp: Improve locking user
 experience
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Takahiro Kuwano <takahiro.kuwano@infineon.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Sean Anderson <sean.anderson@linux.dev>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, stable@kernel.org
References: <20260507-winbond-v6-18-rc1-spi-nor-swp-v5-0-93453e1a9597@bootlin.com>
 <20260507-winbond-v6-18-rc1-spi-nor-swp-v5-4-93453e1a9597@bootlin.com>
 <9432f07f-3724-4257-b6ab-84721e619f78@linaro.org>
 <875x4fphgr.fsf@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <875x4fphgr.fsf@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/22/26 6:55 PM, Miquel Raynal wrote:
> On 22/05/2026 at 12:10:45 +03, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
> 
>> On 5/7/26 7:46 PM, Miquel Raynal wrote:
>>> Fixes: 3dd8012a8eeb ("mtd: spi-nor: add TB (Top/Bottom) protect support")
>>> Cc: stable@kernel.org
>> Fixes shall be the first patches in the set.
> 
> Technically speaking all four first patches are fixes, except I don't
> ask the first one to be backported. The reason why we ask fixes to be
> first in the series is because we want them to be as independent as
> possible from previous cleanups/changes. Here each four first patch are
> targeting completely different places and should not interact with each
> other. Anyway, I will re-shuffle the patches.

you don't need to resend just for that I think. Pratyush or Michael can
re-shuffle when applying.

> 
> As for Sashiko's feedback, the AI raises the same point as our previous
> discussion: the QE bit handling is really bad, and I am working on

I forgot what we talked about, sorry.

> improving this, in another series which waits for this one to land.
> 
> However the other warning it raises is IMO wrong: mixed-modes chips
> (either read or write working in quad mode, and the other in single

that's good to know, thanks. It assures people that the AI feedback was
considered.

> mode) should enable their QE bit anyway. Please raise a warning if you
> think this assumption is wrong.

Not sure if I'll be able to allocate time to review it. No blockers from
my side.

Cheers,
ta
