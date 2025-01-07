Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630A27081E
	for <linux-doc@vger.kernel.org>; Tue,  7 Jan 2025 16:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736268881; cv=none; b=Ez5wwxkLinc1ZNKLeEQ0zAeRYKAHOY0QP2xVe5gB8IDRVR7x98tbG+jV/K3g1iilhTgxxldtTWa2g0lrV6KDgwa4v9ozluWAIsCMwvYjW6AJ6QkqgaEHZ0YZFanAo0Z1ceSkoFNS/NV8uPEpIKDHh9Amrd6sl1Y45bVUMbmKNmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736268881; c=relaxed/simple;
	bh=dLgWc4KqJ81pgGk9fLIlOqeJ2PEP1t39aPLBxw2Cun8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q82iw5jkkiDQ920pYcxT2KmW505qTS+X2LhsPW/GS8uAGwtu/GXMw6zsLIbf1M7xCXBGTQiMBUdktX+kpT4bwaXnO4DBpqYVtKGzuuc//rmnCJfzaKO5NXm4SmzpeAhS5yknuaQuFqfmubpHbCfldwCNoBMRmM8862ZWfM25Pog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=nabmKMQ/; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="nabmKMQ/"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-71e565708beso8861723a34.1
        for <linux-doc@vger.kernel.org>; Tue, 07 Jan 2025 08:54:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736268876; x=1736873676; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E2scHcxGrBFtgqkDoS9/WXdRczqZsWf9JpruT9p8IRw=;
        b=nabmKMQ/TlZHeZBNWWXlWFIRfPlnD+IPH04Bctih7vL7oDe6hprm1SC48Uoma5hAxd
         wqCJ57/taPVpzj5UVj+f6IAG36tIWrGRtun+AEORCAiKopgzQDn07ShBGBhF/HCr+i7F
         rh6hIGWOCkA8vJBnL0pKVyh9HKZpHCZ9INjrqr147gowkAHy7Pwtd4AmfPPVdyoPKExh
         T2pUOqQoniDjla85/Sd2bkef7/EOA/3A5HcruLgwccHb3hAkog2GY8GYcGuxQIqcCfxl
         HHn6CzV3MSRJ8cnvofOnTJeRGY/0qMNbV/rUabBlMN5HNCjF52ZrFf7/nS7KB5IJ85wu
         h1Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736268876; x=1736873676;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E2scHcxGrBFtgqkDoS9/WXdRczqZsWf9JpruT9p8IRw=;
        b=tEohwPKdobvKFBpeMPEUWogyy5gNhusqYIF3Y6+pHPn+Ena2GTx85HVTlzhbZDYofT
         nFAMWY00Jz7Smr21A7iRHZet1P/tZzMflAvUGj57404vo39jZJbdL3aHruoKuKbmCIiZ
         Cg19EntWgpXNgQbKcKAgOAw4YUudYZl55O97gmPQ6riOV7fKSL/nEEMlI/AKVJS9borQ
         8mXo8KJXnz8arSnhj6qipKjq9YcQhonG4iyS5y+96EosRLOvHxGz0w4D8Gp/Xy0Xc5N1
         PC49nFRnwOJBCS8Fse86wG6z+HDvvL+wyV4w9JnxtmQkiEtauEnl+mOc6+eFOLnpPpEY
         vW5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXG6rhmfwfAT+CEJyuvECqpL9y1YmmKu3vPWvXT/IMIVhS9crSzDD+3mVF8tFO5i0CA3US24FnjlaI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5fQUlZvT9NwV/rey5ov7D+sZIeTJe79GhKaXX+EbYU0ORFsRk
	SRO2vY8lCJvSsSju5f1w9Y0Bv2rrEckhiEo2D4AmyEGIqqvenBj+xWfuFdjH5m9vvR62P2FR3h2
	6
X-Gm-Gg: ASbGncvQo+cbTt/Nsfovk4xZWdRg554lLGeBmNZ3Fi5LIyMiCzUMLJGU1PFnqMkyFOt
	bU8/IUe+16t6B9nDM0BcvKnKkwIMcC+Izm9Uf9uqF8xv9xrA0exo1dm8T0S7A5hWx+n/RagjC9d
	fnzjA7bcVZA2vOKNt+ItNzVliXsUKCj17gKzx3nQB8ZWuxFII6zXx+uORkgXvGG0BCLhxIIpZJi
	KRp3Ywa17x9A7RzddDheeVN42rP0CHVbvJy2dGvfiL5kn77Kc3sRSX22VamSEc2Ct55EyNAwNx4
	YIN3eHX/VjIsIosL0A==
X-Google-Smtp-Source: AGHT+IHl1wTuLkfYY9EW86dpDl4Naal0j7GzY2CsGRbhNytd/NgCUspbG28RXx8KWPjpGcxreyTdgw==
X-Received: by 2002:a05:6871:62c2:b0:29e:70c7:a3f7 with SMTP id 586e51a60fabf-2a7fb00ba8cmr26923887fac.4.1736268876500;
        Tue, 07 Jan 2025 08:54:36 -0800 (PST)
Received: from [192.168.0.142] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2a7d74c71edsm12483548fac.16.2025.01.07.08.54.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2025 08:54:35 -0800 (PST)
Message-ID: <ff6c464f-8cac-42bd-9c18-e883eaf0cf95@baylibre.com>
Date: Tue, 7 Jan 2025 10:54:33 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] iio: adc: ad7380: enable regmap cache
To: Julien Stephan <jstephan@baylibre.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20250107-ad7380-add-alert-support-v3-0-bce10afd656b@baylibre.com>
 <20250107-ad7380-add-alert-support-v3-2-bce10afd656b@baylibre.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <20250107-ad7380-add-alert-support-v3-2-bce10afd656b@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/7/25 2:48 AM, Julien Stephan wrote:
> Enable regmap cache, to avoid useless access on spi bus.
> 
> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> ---
Reviewed-by: David Lechner <dlechner@baylibre.com>

