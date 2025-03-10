Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6059312B73
	for <linux-doc@vger.kernel.org>; Mon, 10 Mar 2025 21:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741640510; cv=none; b=cLhrQChieWcHfTxy6Z3WSfYJNnP1F7A2nhIuZA5vrfKUb5qfhsler8Q+yb2T8a9GrF1jSxCsYUPQlc5uBa1Q6M4AB3CaGuRvwSzJNXLsdkkRvVJCcbWKMO0Qp95kdOQunZaXCLnVMt+EbsjK/V4E3o77v4GLq0jB7t7dpwsvP70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741640510; c=relaxed/simple;
	bh=uvl+tCTSBkpkA1JocRjArWmG37T36+NIL9cpQh3h/7o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B57/ig3ektUCQhNf63WaNye9xh3+H0yXxOqtMVfLJgXvR8LAp3kjyVJwEJmlUufAEBcCeHgKyQ9qDAvnZr9aMbMcFNmKNb+bCcyJ09HVFv73RgnQGXG/WRcD1YVs52zOjAkjMDxGKttxaCD7DWZJJiPoIthmQ1WD8S8+P7D8D4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=gD4So5IK; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="gD4So5IK"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-72726025fa5so924276a34.0
        for <linux-doc@vger.kernel.org>; Mon, 10 Mar 2025 14:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1741640506; x=1742245306; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mh6NBQiJXATQe2dlTg58r4IHLGmkgQvhFuYRHTx4JoI=;
        b=gD4So5IKpAvy5uKSGrhX3CF1MhN8VeXjcQST/2NIsihABLxIdspg/Dwd+gIw5xw1y0
         CJgrkqqYjLvpIlr5VrwOxkttdw5iAl2uEUJEARU4K6xUgi/CIp7DqlZfenA0HHPiAYYK
         utQXzq0EH3UmTzBi5KpZgzjr6V4FDyd7UP7SaKvoYhemwnLPiI61QSqMLJcSAnFAVI6u
         P1KvqD3SHTrxglYPOUpB2KcLmXB+gald9DA/8UZSKhrN03/QEzvZ2SmDmOtU3jCAYm58
         OMIme8YOUnhptFlyAO4qH3SErcyIYF63Jd2yRUnQadTdHu+pE5+AuDtclfVhkpR9MrUN
         PW4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741640506; x=1742245306;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mh6NBQiJXATQe2dlTg58r4IHLGmkgQvhFuYRHTx4JoI=;
        b=FSSrcYP3dgLzttW41cJhZrCccS6AHwtu/DK6jQjsKrl9nuAHFNdBsFeGMVYCKLRnvC
         x77l1G7h6+bhBdw7Aw0G0/AR6GhYoCwNR7d6JelFR5Lg67B2jdS26Kl1VkJ+eTkt+arb
         SUOqSnKYdu8jsqeBEiY9RT60+Q3EqQo2D9bcOqBgT+R6+H9pVHStv7THhHxJZ36mt0pU
         3XipjfQgsewxDJvXhnuCU0cnLf7Ee2jyKYGCUOD+lGiba84KGcTZ42C096CGI59Q/12p
         c+xP7gAKC6PmKy+bmhHCZCD0RzEyxnPWKIbDhS92YMaEC7UqIhaUnoscid7pSmm9p0/w
         K2dQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqrscgaZFje1S3eXvr1PacjIablVIDfLwFHzFwp7to98zTgigxO48phUkx7tb8vz24+X+9P0r9Rcg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyrtcst08H5xvk4dbu+bpnoZVcjKJ29a1xqZb+mqFNyIFyH7hqW
	pKvKC3hyq5SyjE7c91KOjZvpy0QdKp25iRC/mNYmoqTMDCP5ikFCjYoS6ALNDbw=
X-Gm-Gg: ASbGncuCWPrfMXxcYuKhzsL/GlP5TLt7+Bec/I8fZcCvu1poZ9DGm02sW06FTPJlTQz
	q/N4GFO0vcSYzTmOfmSj6JQ+k/w/CWUrat+ZaH8OOmV3HUdcF51vy6RLD8oM9ZM8Szn+cpjUrYb
	UqYackN7v5xdwrCXnZrSxvdbsyNKRc9QpkYk6QZxlYltn9/I4OswRSu++nWNTrPzQmnuyFoVQm6
	M0ViJzIGhKZztowb3OXDb5Fud/NLwBhdVnM2DZkA9ipxfQQjVBs/hl1+8Fe3oyoBtuC5jRnNtsA
	yDja8Mdlx+i2fnbunN0jt2Z8/AmvOFbxXqHncTw/WG0i3tH3VM1DeL3DFs6/dCWPYhoUg4OlOc7
	XeOr3cZ6zo5bKxDmM
X-Google-Smtp-Source: AGHT+IFws383NJzGNKMTduW7VFs/LhYVCds9An+PWkBfwPQGP9vDAELOMSUsERr+wmmRotC7x4j6MQ==
X-Received: by 2002:a05:6830:6a8d:b0:72a:11aa:6ebd with SMTP id 46e09a7af769-72a37c771c2mr8328040a34.23.1741640506456;
        Mon, 10 Mar 2025 14:01:46 -0700 (PDT)
Received: from [192.168.0.142] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-72a7c926001sm1298993a34.32.2025.03.10.14.01.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Mar 2025 14:01:46 -0700 (PDT)
Message-ID: <3fa4136e-b384-4c3b-a58d-773887b87552@baylibre.com>
Date: Mon, 10 Mar 2025 16:01:45 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/3] Add support for AD7191
To: Alisa-Dariana Roman <alisadariana@gmail.com>,
 Alisa-Dariana Roman <alisa.roman@analog.com>,
 "Rob Herring (Arm)" <robh@kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Ramona Gradinariu <ramona.bolboaca13@gmail.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
Cc: Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
References: <20250228141327.262488-1-alisa.roman@analog.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250228141327.262488-1-alisa.roman@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/28/25 8:05 AM, Alisa-Dariana Roman wrote:
> 

Probably too late...

Reviewed-by: David Lechner<dlechner@baylibre.com>

