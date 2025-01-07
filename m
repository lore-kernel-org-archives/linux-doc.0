Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E091990B7
	for <linux-doc@vger.kernel.org>; Tue,  7 Jan 2025 17:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736269322; cv=none; b=fL4FV8TtgC3K6jiYKxV+/cPFVFBlY5Geb/QpWzIQAonQACTT1s2i3T7BYJXkCWf/EbaXabpwCWh88QXB3haV66y2bYUbXrKqpuMgJI3C1Au8Wb0vmRmikOG6oe2DyAyrHfWkHg1y8rHlbdYtYBkQdjM4GeuAPq41sJp4FHFC2cE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736269322; c=relaxed/simple;
	bh=SIh6qOKcdkudvuD1pgk+dzHncIoptzQ0cHWK0cu3YoQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s8STS4yZ3SqlUPecv1su5KBiI68LJKWSmtsLMMBsY1U1wMNkPT+yOFQD/H7Kyk0CCO9GK1f6XS1xphavinlnqczLF9kURB5WFQRi79lso/N9Cs64bj+q7xux1KPQLRqk17EBM6JuLtkXQU9cDnWEVbaexzv+26BkVzjDxtGt5r4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ETJXkqOw; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ETJXkqOw"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-71e2bc5b90fso8302289a34.0
        for <linux-doc@vger.kernel.org>; Tue, 07 Jan 2025 09:01:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736269318; x=1736874118; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E2Xw5YGwLuLuQ5alI8ci2vm3J9f/nfoY4U9UPEK6bog=;
        b=ETJXkqOwRul5H/sNWwy4a3rQ12kR2UZXA51vX5/dqNuV6zMO+gbaG2c40WQr2LI5X0
         a3ITrTh7rz+BN6BK5BcTXtQSZGdiCKc27NrUQ8vJaXK/K7Yun8UITDl+uoPCg4SOxb0y
         CqqmzfayZi8MCa6PuavcYf/DW4Z9PZ44v/ChE6Mbj+few6bNE0rSNSqL+Wf0vR3SWOFN
         LXChLdDiYhrY8NaUZCMkNwPav/3EdC+URbBoBn2yLeI/H8KDwEOkwbRiOhSmqBuTrYJg
         CZ4jyrWLxG3RjQ7KtxSIVAfxmXBJFJhQJmdPMRDLzTgSwO7QfBwg8XiZVefoLb+nHIUz
         g3gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736269318; x=1736874118;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E2Xw5YGwLuLuQ5alI8ci2vm3J9f/nfoY4U9UPEK6bog=;
        b=OoL/d/aDgHl63PKceLPwBDBGaeGmB/qdnPJKtmOyBPyYxc0q2lT43uXMrNpmXX0o8t
         acFeOVcIYaKH97ZBK4Kd8zrzKNIPTbu2c2GGJHj87KjNHMmVw40nYKCNdQ+7MADP2M62
         EmCWSHPVamz0BcD/ZGrjhUzeROJaSk/RCR2KxdugjbLvdxsXqBhjCs4FFFtSTwrRShx8
         eXCpffKbma/dcWpS8+PKKOrlJYUPK0LNGOcXq4a4Tx6B0AbkXYf04+sEJBX4FEvADwTx
         L/ZtpWlAAYt13Y2AEd8njH7CXMa1HaHWRi/P/748xz07ykN4Sf4tgW1zJe+/W87le3BL
         VdPA==
X-Forwarded-Encrypted: i=1; AJvYcCUqEd0CSFknkzY28T8ZEuSgO3rmxPt3nR8OK4UUBrGD5VldhGghJ/d+l2Wj8y64jOqTL7fBfuMMOtg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyH7HykgdX4xPo15sLubanpnTubcQuRDmjg/gVaIl0kLSG8e1kP
	vo0uW/XTpaUEONzdbTL4xIodpj05rhuhgU5QON4Z97WMb6sTAQZnXtwU2hytmIesLCLfP0rE5+x
	v
X-Gm-Gg: ASbGnctC8uRoZ+tNAGFcwgkm0B3dFKlnT4mgkgTnCMCZVaDIHJuwoDmDh6+v+W1E1yO
	x25RmsII3RAxHH5scBE5IGF4zDGjCQ9PtuEG7EQ4E7jRYDplSNez4dGK2tRytVHyQKas3Gere4R
	tyGjOboWbrR3npRCS2NJsKBXVb9uxD6RvolU+xRo0w4vSw5snIuFl+dj3L7B63PJQNqqDSTHlkA
	SzpwndZCqadFdXWDOSUM6W6LDOvnyANg+W8rPeGLhzldYpW2+4U7KvC5b0lLJOi2jDsnlfxkEwo
	krFK/huLtV5DbMckcA==
X-Google-Smtp-Source: AGHT+IFeif2Crw099fkoAT98xtAlA9RKnYOPliiLdjtMjx4XxPuCMEcDCL5u4GaHbz9K19tu7OmgEA==
X-Received: by 2002:a05:6830:6a8d:b0:71e:ae7:3530 with SMTP id 46e09a7af769-720ff869e90mr35880696a34.17.1736269316925;
        Tue, 07 Jan 2025 09:01:56 -0800 (PST)
Received: from [192.168.0.142] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-71fc9764193sm10305027a34.13.2025.01.07.09.01.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2025 09:01:55 -0800 (PST)
Message-ID: <4273761d-0cdb-4ca6-b905-748854e35558@baylibre.com>
Date: Tue, 7 Jan 2025 11:01:54 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] iio: adc: ad7380: do not store osr in private data
 structure
To: Julien Stephan <jstephan@baylibre.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20250107-ad7380-add-alert-support-v3-0-bce10afd656b@baylibre.com>
 <20250107-ad7380-add-alert-support-v3-3-bce10afd656b@baylibre.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <20250107-ad7380-add-alert-support-v3-3-bce10afd656b@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/7/25 2:48 AM, Julien Stephan wrote:
> Since regmap cache is now enabled, we don't need to store the
> oversampling ratio in the private data structure.
> 
> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> ---
Reviewed-by: David Lechner <dlechner@baylibre.com>

