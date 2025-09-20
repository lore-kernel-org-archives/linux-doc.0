Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F8BD80C02
	for <linux-doc@vger.kernel.org>; Sat, 20 Sep 2025 14:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758379390; cv=none; b=FHkiKwSbqL+cbVr3Ffkz98G+l7KKgUDOcpDHvC3P2xGIxvQ7Rwf7g5T64TFtd5/P4dwY44zd5ZcZAXfdXYd4Swm14w1+smNgqRK2fzRKdt/9+jjCSs8l2FKN7L+IhZ/T7iL4kbbkEG1haimriC/UNHR1jEuP6iLB45p5GnxFT5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758379390; c=relaxed/simple;
	bh=reGQ0DWfCnnIVp/Nxw5dBkwic445/96e5CXDstaYNKA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nMX93KQRUzNwLGT8hvESRw+JMaAQWS9wlKo9cTelvU7Xd0b/G59G9AzZBK49HfC5FzlurraYpaSKoWuuH4V76Yx2vMOSdYb9Q4WMW/D/TMUCd2iEF34R0U+Onwcc53jTEENElf6kxzmHqta2auC9Tjw040kc+PT0ZKfr4gzOiyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=3SQ+H65M; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="3SQ+H65M"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-750b77699b4so2263962a34.2
        for <linux-doc@vger.kernel.org>; Sat, 20 Sep 2025 07:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1758379387; x=1758984187; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/zr1FxzQeV23WAfXkGwnch/VhAJlzRpqociU7pEguSA=;
        b=3SQ+H65Mq7lmz1B5VG20x9Lq90j5XOP0m6A9igV9aIJktsX2S+XYfV8k40KiAfLXLI
         F4ynoVa80m9k1y+BFmkiBJDY++D1LOfVFsYh3SiDi2s09tmRoBKfgBoMC6JfNkaGNF6g
         zONNJcYhNQyRJjAz2SwfU+05xp9sLB3vkt6VNsYhrWP2jrdiotxv0kgfqXtz9iDTggUd
         wQgl5Hu1BHqzbKCvtsyEVkAY+zxaavsHVzrSRCKKOcw19LIHHJP5kqTH6EECU+ylMHAI
         5CNuh8Bi6BvwUP/cTwXTw5mtEd+v1sRXJxAbC12HV2/RjkkMVFh7Ef8GhLYhSjwLFk8A
         YDLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758379387; x=1758984187;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/zr1FxzQeV23WAfXkGwnch/VhAJlzRpqociU7pEguSA=;
        b=wG370WRhGIdX8cytOf4M5uWN99FUSSBOPuljWz2J550pWg1OihUSxn3Ea+zM7FH5Dg
         0kSuow6x2QJlLzJydxgvCc4kl3L+gJwHyCtr0tW/N7MOpQ7We8IwpqdyXG6hX/oF3mvy
         1Q/0gWPmO6Ya0L9wBsqJnqXvOWbEbm+x8mIHcYdayIk84S6n9hriWTPbJSKJYJmnHPB5
         HzPxfrfQ6bQVHWUPhX7W5OlhjNYAmgr41Y6g6sSx1wpOkHivKrNDNil5I5QXnLS2nJGz
         V9xDEU39o5yvyrRLTm4NAqPz79Ns6ebJjF4NvXt6jS5+DxnzqrbscaCMufltzC8MFynR
         be4g==
X-Forwarded-Encrypted: i=1; AJvYcCV8o2WK5WfVmh46wTF1f/UVwOZLndv2P4M1euqe76YEGXWPvtCf/u0xURohsD9OvJZ0a8lb7uIKPIo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOPjQlIhSvd3RK3+g+FcQ8A9QMido74Vh16TZEx5cyztreCdT0
	IBqjWbfdKnVWkh8Dq4xmMzD+ElSrVOlLysnYO9JeuEAV7KLFxlPDukUiXwoGu05sK64=
X-Gm-Gg: ASbGncuhFx6HF116bDMvN0DyqUwmlcgv6dNiJNewZz8tNW7dQ+0AElwMjxtaVuo2A4d
	xBLU26si+5Yb0/0LNIOvvpZ8OdfkLpyhkZXOGY5hxlvyWnb+5+VuMfa9Tkw4kZ/sjhZl5KUGmLU
	SupemT9B41u78Manw/zDHVSw0Nt42kikgLvqDfW+H8oU0BMUViD22m5EJsCVfg/h9LMjM4Quf6W
	mOW8qr/nuDCQVNwoVdPd1n2O84efndXMt1z5Y8p3FQ+WDWomlSIRCcaajhpx60Kx8xhC8Avsi1I
	FuadRD8nTnUH8bVTHXF8qCS1LzUFzeSv/qFLaccdLKD3oBKrT1SEaXIZxXe6LT5a8rODKA4UNwa
	Yj+OCAGeMpEEjMJS3ypYCb3Smw/EfvEPIHQn+FZnFJNGfbRR987Z69NoU0PleY3FX+b3MFFWCjF
	s=
X-Google-Smtp-Source: AGHT+IFRMjIdQHCqLYdQqsM4bOgBkQvcyRd2wt9TOxoiyYemPs4kzShqexKQOBSerVYHshLpIqXW1Q==
X-Received: by 2002:a05:6830:6606:b0:750:69c2:365f with SMTP id 46e09a7af769-76f6e58bc30mr4230967a34.4.1758379387269;
        Sat, 20 Sep 2025 07:43:07 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:14ea:b68a:f92c:93c4? ([2600:8803:e7e4:1d00:14ea:b68a:f92c:93c4])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-625dbca6014sm2701941eaf.25.2025.09.20.07.43.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 20 Sep 2025 07:43:05 -0700 (PDT)
Message-ID: <7021b57f-bad0-425d-a7a1-3a613a408a42@baylibre.com>
Date: Sat, 20 Sep 2025 09:43:04 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] iio: adc: ad4030: Add SPI offload support
To: Jonathan Cameron <jic23@kernel.org>,
 Marcelo Schmitt <marcelo.schmitt@analog.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-kernel@vger.kernel.org, michael.hennerich@analog.com,
 nuno.sa@analog.com, eblanc@baylibre.com, andy@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, corbet@lwn.net,
 marcelo.schmitt1@gmail.com, Sergiu Cuciurean <sergiu.cuciurean@analog.com>,
 Trevor Gamblin <tgamblin@baylibre.com>, Axel Haslam <ahaslam@baylibre.com>
References: <cover.1758214628.git.marcelo.schmitt@analog.com>
 <da55c0ed6fe895dc84e79c8b64e5923a4851e58f.1758214628.git.marcelo.schmitt@analog.com>
 <20250920104251.3f7dcbb2@jic23-huawei>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250920104251.3f7dcbb2@jic23-huawei>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/20/25 4:42 AM, Jonathan Cameron wrote:
> On Thu, 18 Sep 2025 14:39:10 -0300
> Marcelo Schmitt <marcelo.schmitt@analog.com> wrote:
> 

...

> 
> Just one thing I noticed today.  If nothing else comes up I can fix that
> up whilst applying.  However, this will benefit from review from others
> + the IIO tree is effectively closed for this cycle so we have lots of time
> to tidy up any remaining stuff.
> 
FYI, I have some comments on this patch I am working on but will be some
time next week before I send it since I would also like to actually test
this since I have the hardware.

