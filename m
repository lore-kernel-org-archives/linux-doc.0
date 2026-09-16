Received: from mail-pj2-f32.google.com (mail-pj2-f32.google.com [74.125.227.160])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB9B356759
	for <linux-doc@vger.kernel.org>; Wed, 16 Sep 2026 14:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.160
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789570588; cv=none; b=IoTwwAMxr0KgxPcHx4ZBVRSj4VQbJmfTGgC/pqc9rn8YZoUvLM6qP7az1zl/CwYKXA+Q+NcXhkRLUwudBoUv34weFvcQv6mU9HvXOusWKnGW/1uVjllb0WY83XBZ2A6HEuTa8Dz/DVufcyS+rK87GdIL1KcFDCBaIWZlHofkmBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789570588; c=relaxed/simple;
	bh=w5hmfYQd5qS6jmp5if4MTfMkG4gKJAqCpM+ctVlrJx8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=akqsoJSZTW/g3Tzj0YqKNOS+ABOgpv6M2KGSO3fqRZR64OxeX26PzkFk9oukgsUM1sAbDNmX9M2ESgOPzDl/yffCt9sDSn002wCsaEdO6tXIxliTxaX4xrkHyl0DJ3Yn//a1ucFOrRiaOIg7vnDQIsPZOAog7NJCtjAZzDOVQG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gpsB+0pX; arc=none smtp.client-ip=74.125.227.160
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gpsB+0pX"
Received: by mail-pj2-f32.google.com with SMTP id d9443c01a7336-2d747f05ffdso8303465ad.1
        for <linux-doc@vger.kernel.org>; Wed, 16 Sep 2026 07:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789570587; x=1790175387; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fOtt4epAjEgetEW4Rf7UpxEkjN1u8RJ270fhKCbRhRQ=;
        b=gpsB+0pXhV5Fpk8oz8ZAIm1e0F4oG/SJmYb8KutcgEoeU5P5gRBEKrOTTOmuVSszWx
         /sgU9r4nBZP6Ne3OZjTW0ZJNsMaGgR3HYblsJ8JyO9V/bcATeox1PrPLWL6XihGJ12Xo
         U0gemKPW3fIh5pvfnbrYk9orM+IzDKn3hN/2A8Luoc73QZpAITuQ/U+Lyp6AghAt13P9
         323JOe8rt8BB0Q+5IpCDQnnVOJFFN83tHNSt4D2xayA7VQCOxZOiMEpijOypzwSjrMRu
         CV0YVG+9j8Y507nBIm4Hp1LmqNh9sKlMnulMvMb1wWKZlzj0Bhg/MU8TkUgHnkhDvyYw
         YQpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789570587; x=1790175387;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fOtt4epAjEgetEW4Rf7UpxEkjN1u8RJ270fhKCbRhRQ=;
        b=lSuN8qG0NBFhJ8ASjGgn5wvV33wHGZy7bWCUNMmgsUvh83eY/ztem1oqHks9uz6g8G
         6t+Zy4seHInYLkhy1Ndb7SdpFWB7HyKbBUqWNrEzvWvQLfy4oBedXxagdpc4Gjk3mKrX
         SPlphIqsvMWZGPuDXZ07Al5E/xzUMXZd5KFyGz+48t8sI7xE5VwQWjTr/1XBp7s5DeA2
         YSevTbFQF+mekMxMhLQjZAIlUs39gEDoIE5ZH7ejBz5Qy+h7yBargAR+AznfRPIIDgPT
         MYvrPDkn39To6bD7h+F+fNIUpwAOvJIHUGWdNaDWO+vB3JOdmlLTXHnwfbBpF1NVf3yz
         mIkA==
X-Forwarded-Encrypted: i=1; AKwUvBy2pmZrbJ8wC8UBCF1iqI9GM05kXsVRxZY2XnFaExV4LfJTNEyMtZKwn1tOGI42xMdSBV/FxiKL7GQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lXVYxTqgPbGgf1KGaabWzPASMD/T58xoCh/EK3y0T6eWRwFU5a
	bk7YmPbu+FjpfT0GrxGh6Q0UY1VeO4YteUwrBnnUBGU3EgUgQlAL18Du
X-Gm-Gg: AYBFou0zLUbZ0ddZ0Ch17nS8jBCUNR8WiJNej4nKvvH78UkMpefnuWT/AJwoiMnzEfn
	4YPMaYV1hEo0XN5UGK7MW7haLW2AnPMJaUUUDoZH4U0HfC1VJo/hstvtWsZTqMUYGBaVuQXjtdC
	LKwHUegvhQGlszb7hh9Zgj+Z3OGXm+y02MRec2o6eQ4IYVfEkmepR4+UG60gTMha3E7tANFRrUz
	6qgLPjg5nRJWemDwIxYNdbV7GFYnTofa3Zqp6VFnt+xmWFeh0oPyxVo+WFHXBSr5jCdD/YWVazJ
	WS7+2IBg7PnK9Qp5xIZxrGwcHoVFgXIrRlXDtVdMK8Gnll9LINN9uaQ8txk9WLysGROHPv7utmB
	PY0N4N3lYVLOV0I/TF72CnPzZL1PlWj1mLEQ7jKEqIXzIXpHORq59OYzdOR4c/Qry7uJAN0nLha
	sHTqrScJt8RgYPmvWoYcxugZsORYYochE5/Fi8o6xyl6KhUt9sRaYn+UcDzd7DZZCXzkfyRZvEq
	s1WNXQDh6aZ
X-Received: by 2002:a17:902:d588:b0:2dd:7593:8634 with SMTP id d9443c01a7336-2dd8e412565mr65993445ad.13.1789570586585;
        Wed, 16 Sep 2026 07:56:26 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89d8fe00sm13413325ad.12.2026.09.16.07.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 07:56:26 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 16 Sep 2026 07:56:25 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Sanman Pradhan <psanman@juniper.net>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH v2 1/3] hwmon: (pmbus/tps53679) Fix TPS53676 phase page
 decoding
Message-ID: <c0a3c877-eeab-4cff-ab2a-bb567f0dc3d1@roeck-us.net>
References: <20260915164823.160977-1-sanman.pradhan@hpe.com>
 <20260915164823.160977-2-sanman.pradhan@hpe.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915164823.160977-2-sanman.pradhan@hpe.com>

On Tue, Sep 15, 2026 at 04:48:35PM +0000, Pradhan, Sanman wrote:
> From: Sanman Pradhan <psanman@juniper.net>
> 
> tps53676_identify() reads the USER_DATA_03 phase configuration to count
> the phases assigned to each channel and derive the number of PMBus pages.
> In each 16-bit phase descriptor the channel (PAGE) is encoded in bit 4 and
> the firing order in bits 3:0, but the code tested bit 3 (0x08), which is
> part of the firing-order field.
> 
> TPS53676 supports up to seven phases, so firing-order bit 3 is never set.
> As a result the existing test classifies every enabled phase as channel A.
> On a dual-channel configuration the phases assigned to channel B are
> therefore miscounted as channel A and page 1 is not exposed.
> 
> Test the PAGE field (bit 4) instead.
> 
> Fixes: cb3d37b59012 ("hwmon: (pmbus/tps53679) Add support for TI TPS53676")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sanman Pradhan <psanman@juniper.net>

Applied.

I'll fix the other problem separately.

Thanks,
Guenter
