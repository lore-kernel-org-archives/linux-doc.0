Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAAF849652
	for <linux-doc@vger.kernel.org>; Tue,  7 Jan 2025 16:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736268504; cv=none; b=B7OPNMkN4A4OR/MPAGEN7gn7JpW2xXPfT/Hg8VZJZflOyGKUSr1OR03LKmhMO1aOYvK0ur8tbDO5OeiUn9vahJdWofPTCxlcvAG+SaCfGXzzdYCRdaZj+xUxWVkH0kxiBcaXxJmgXI7vL16BSNJ5Lk5NwOICt34dpBUXKId1MD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736268504; c=relaxed/simple;
	bh=nAdNZglN2eO4OkvGU3IXwgna8Nskk9l2fhG//Xse65Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ChXlaGhgU6VNV+bKSHpeWM0F6lDc0bwaT4Y+1fgPyka+47+EHZWZXBi/x0hLAW+eazQtSrSWoJzPSh54S8IV0r9HViDRisqyiYCaaZPklz2kFdl4/RHg6UEyciihBsEZle3ftDj+q7UU6kzyngml3sZErJFxpzyDua8lElJ4xpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=S8PQbwgz; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="S8PQbwgz"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-71e17ab806bso8384239a34.2
        for <linux-doc@vger.kernel.org>; Tue, 07 Jan 2025 08:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736268501; x=1736873301; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t2CMOR/p6KhjwdOJ+daE2KH7z8aBE6xeU8fSpxafapw=;
        b=S8PQbwgzcxrh4EhaHyFV70m7F/TmiputzPKzMtWqFrsUuam2nzZP2arVJg+7yuOSD2
         PRKlkz97QrbzJ16ylMVJFDZnvOfk+56nDukJyNRnzhT9MzVEu5BsDLSkUsbRhQ6j0c+0
         Ici9fq3HarAduCxnTUgZbSiy6UPuQP9qPRGYu/tOL1xg4KcNa29ajHCqnSd0INOANayA
         DqPdNfrtzwd4KFLEG/LZptSOHKdn+ZhvCMPGuRAvsLb777P42FqEtnyZ1YPKfn0iqAN9
         3A2ARymBXWhTrJZX0O0iIzFmwKtCXh+6nlWNVqA76zTqrp9PD4kP+CjIxoZFTHcbmOzB
         Vxgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736268501; x=1736873301;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t2CMOR/p6KhjwdOJ+daE2KH7z8aBE6xeU8fSpxafapw=;
        b=oB8fOCbQz7oxVuvxYLZrBq2CPXG3PA09TQpDTXjgeOc6B8NIIKiCeRA/dmF93wTC/h
         U/RnU6gMsX4JjM4vzOeDzENp/QSQcr88lyayVj/R6DT/vt7jue4kVwTzyyMiDeFgeEYC
         S8q9eWt2Wag/NYkgpZF0AEv4Id5Fl1PUV0TMIq296QoBTi/+HktmuQGMHPv4gPHTgMqx
         M1p9+vrlF3rZp00sMmU9Bh/z4d9pW04pFn48FpmHLNUdDzvEqG0vghI0VBWhPRdT5Egy
         nTnXKZywst8JXD4PzV9u+ArLawk6WHacM6slzMLHLVEzzlJmhpgZG4B05fzMIW3XH+i8
         2XBg==
X-Forwarded-Encrypted: i=1; AJvYcCUWM178TzyE4x4OGbQvbyTfpF/+wpsAZk3DsETN/5rNpq53slkTMhTEgKdAM49O2ggLKfPEfk34sKU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0nVuH5H7eXQInTH1gx5mZtYqy035HWnReCP/WBOHHiykwEibj
	jJ8VvSl+0BxmwvQh5CNbnHYBKkmTzlT4LrLv7a/kPMWX4A7eA5fLqN/3Gudm4rs=
X-Gm-Gg: ASbGncu0v0HyJ3lk98sA1vCbVRMBT2WtVDDaMMXaeYCbSK41EmV89GS6dMneocq7kzX
	vl/ntcRm7Iu0YcCTE8anM5Ht/+hQLbvbeMyHofl5qAlh6KGzrtbehNQWVTkaIfVKN6M1l9Xd8qR
	/PoXZC14H4kQYBUi+6e4hAxQDBcalJ3b2YCOZ3LpC84/O+PJe2u3Ew3jEXM6JX5WEv+9pwQhZG5
	9SSuFiOsgcqlR4p02GIOpN4Lx6umLIcXWQfjFuRQdccWI7GSaL2rvf4cfzpz+0B3SatbQT/zxqT
	BOxQgPgCFzkVkfPi0g==
X-Google-Smtp-Source: AGHT+IHII89kez2WQk20utvd/AETbzX49+VrbyvKcDMVkyyN63b1MuFUr+kVHHKqUXgjrhD1B7itbw==
X-Received: by 2002:a05:6830:3108:b0:71a:5f45:ac3f with SMTP id 46e09a7af769-720ff67da00mr42829898a34.2.1736268500853;
        Tue, 07 Jan 2025 08:48:20 -0800 (PST)
Received: from [192.168.0.142] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-71fc976ba23sm10397861a34.1.2025.01.07.08.48.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2025 08:48:19 -0800 (PST)
Message-ID: <e3ef72e6-4f39-488f-9aaa-2bbc91e43bc4@baylibre.com>
Date: Tue, 7 Jan 2025 10:48:18 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] iio: adc: ad7380: do not use
 iio_device_claim_direct_scoped anymore
To: Julien Stephan <jstephan@baylibre.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20250107-ad7380-add-alert-support-v3-0-bce10afd656b@baylibre.com>
 <20250107-ad7380-add-alert-support-v3-1-bce10afd656b@baylibre.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <20250107-ad7380-add-alert-support-v3-1-bce10afd656b@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/7/25 2:48 AM, Julien Stephan wrote:
> Conditionnal scoped handlers are turning out to be a real pain:
> readability issues, compiler and linker handling issues among others so
> rollback and remove the scoped version of iio_dvice_claim_direct_mode.
> 
> To impove code readability factorize code to set oversampling ratio.
> 
> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> ---

FYI, might want to hold off on this until we see how [1] ends up.

[1]: https://lore.kernel.org/linux-iio/20250105172613.1204781-1-jic23@kernel.org/

