Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF3C1B0110
	for <linux-doc@vger.kernel.org>; Wed, 31 Jul 2024 13:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722433603; cv=none; b=mj4xx96477xqFy1nn8jnZp5aSh8r9tIQ32fkwZLvEJetxwMbAftbVXFnr2EchdcOh6vWVIp/XutDUsQ21iRkYC8hsMbuX9Hjkn3lJfGqdlBfO+NcKHQORVNVeGM9Scl4d3aQoAreGLFj7Z02ThRJRcjlROOANzRvDonMxXrbWj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722433603; c=relaxed/simple;
	bh=mu+HLrI1Ymh6ksIqB53D7Kg3u4ZNuM7JfCZKD8WKZNc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=scFMg6uXZyILd2GPro//spF84hPUGCeRu3VBq8qmumYBZMLwTgjrpIeSQ5d3d0wSQe3Kj37kPmpFwprGOEQ+Ev1fZTduGOw2wmF1yPHHKAIV6AaTGbv/IZoUuM5VqeUVgmkY9qZmeUDZjKrs2Nxkezpie3S+QiveiQN08Hvio8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=i4dDoiIx; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="i4dDoiIx"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3db12a2f530so3578451b6e.1
        for <linux-doc@vger.kernel.org>; Wed, 31 Jul 2024 06:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1722433599; x=1723038399; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H7vD3eKKTv5tPXuuxbjAuAQHvioAr6xjrjdcvgmcq4w=;
        b=i4dDoiIx6cpmv3I3ndlGXxcz9+nZTK3ad/GkTM17t9rGCmsnnkVZqqto4tXoupfHAC
         5fCOhH/6r3jsJgSpRQNwGukHPz8VBzVomkO4KtsfkwkWd7d5RISARuP/kdwDJLp0vKn2
         TrthGQeWBouTui4z1mgJGelhamJ1uRFgeqjtf4wMgBMq6Sa5Bn5VgsBFuOMrouz/DRRf
         QawUXnwiLVZMG9Jm3iKdO0adlJJXvYUKH3/pWYc/ilYDJZtXQsunp8lQ4mT/X82ubjIM
         B+R8ttWv1oUhGRky3B6krcqPsDbDh50p4nzye1gyrMFwOBbaOfjxMBi4PoVChJIUEtz6
         f2Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722433599; x=1723038399;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H7vD3eKKTv5tPXuuxbjAuAQHvioAr6xjrjdcvgmcq4w=;
        b=ipa1W+An8Nw4VnSjuZwt8GnKEYQvS1Q5Sa7VbGFq2LXjXKUvwcjpCSOezsIy0H4lAz
         bpSXDgQkTMfdyq954mqnLL+6Jzh3Umf/ieetBmuA7NHQoH3oSQURcTkp+GWsx8nYihOB
         c/rtr8rJKUET5NsF/Kes+YvLB+DLfhMecT08wcQh+gr10bvrFPmsM9DFrYife1/Kl6BD
         2vGRiQUEValJIfy+8uRRrTTEH1o+K+iaMV8wr3laRUH6/tZIkN3fn+xUe++hg07vll1c
         zsd9TXN406klAJfEeu1C4ftT1N3cccPl9shuWJhpHcUOhmIh8/QEQJ9+dahczYzY1Gs5
         8HmQ==
X-Forwarded-Encrypted: i=1; AJvYcCWD3GhATXEBF1cfMyFjhnHAt81aD65Eebx2CILLlSJ50C7YykouSbTkxAjZHQVSAme+1ACsurV00AySUIcUjeD0hn69o9u1lX7o
X-Gm-Message-State: AOJu0YwAnW/WH1XcOOvbk34DJBHKWNdtVFS/eXRTDqa8SQmqcelDrx2q
	rEB8gjzbxZv/3rPjl1COSKgAduF+eLNH09b5ld8CG8hBUXCZmQKfApmCrlFYqhg=
X-Google-Smtp-Source: AGHT+IFoaWfKvyUnGI7JL6JXSlixBfZm6Ni2JS1S6+YbYteDvT28li4alGmtAKFRsoCuSlkySjldwg==
X-Received: by 2002:a05:6808:bd5:b0:3d9:3b17:f752 with SMTP id 5614622812f47-3db23ac334amr20323307b6e.26.1722433599672;
        Wed, 31 Jul 2024 06:46:39 -0700 (PDT)
Received: from [192.168.0.142] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3db41ff72a2sm682020b6e.43.2024.07.31.06.46.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Jul 2024 06:46:39 -0700 (PDT)
Message-ID: <931de9a9-f391-4609-b067-eaf5c5105451@baylibre.com>
Date: Wed, 31 Jul 2024 08:46:38 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] ad7380: add support for single-ended parts
To: Julien Stephan <jstephan@baylibre.com>,
 Michael Hennerich <michael.hennerich@analog.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Jonathan Cameron <jic23@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20240731-ad7380-add-single-ended-chips-v2-0-cd63bf05744c@baylibre.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20240731-ad7380-add-single-ended-chips-v2-0-cd63bf05744c@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/31/24 2:05 AM, Julien Stephan wrote:
> This series will add support for ad7386/7/8 (16/14/12 bits) unsigned,
> dual simultaneous sampling, single-ended compatible parts, and the
> corresponding ad7386-4/7-4/8-4 4 channels to ad7380 driver.
> 
For the whole series,

Reviewed-by: David Lechner <dlechner@baylibre.com>

