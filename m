Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCBA9489FD4
	for <linux-doc@vger.kernel.org>; Thu, 10 Sep 2026 15:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789054264; cv=none; b=vGIiNJVRs+BheVRmk2a9FVhDleg5WMgPRxWMsnKvffFFSSAhaNmGjzXhnp4oPuxzkBz3BI4OJh5tBQI2GSR8Co0uCy9hhs8M6l7AgJoTmFB8LlfgS/OBL10UqXc7s4nhIZYPqgFj0mBDLm7uh4i0nabJaJXdkmCKLIwbQTBiLJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789054264; c=relaxed/simple;
	bh=FMHnlepWqkeA1WO3zWGVjn5CErzhzH93jlHtlDYDxvs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=smCvCt3FG4jKUwd9j31Q5K0x3lNcTB1xwmgv16JJ5hEqAxUy2XcRbkBN53nqGm7eiPmnfQxibZfZHEeoMqR+LVPbEwtgcWKLz2Y8UspBpNZyKBvtxqBnNSgG06dsNzf6PWgZf5+nQzhJEQUSXnROGC1z6qi184MiN5gL4YNb8CQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=ca0JJxB0; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="ca0JJxB0"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-4b39befc6a8so3998589b6e.1
        for <linux-doc@vger.kernel.org>; Thu, 10 Sep 2026 08:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789054261; x=1789659061; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GNXtzdTfuyw24dcBONWaDJipm3E8E6edNYMjDUcSm28=;
        b=ca0JJxB0nBscrqm0dnyACDdHPSPM4pLKOKKYzEl8M0FDXUdqHGunwXmwoh1PeGqQQR
         Re9sN32OUlz4/9haJ+tyhtM4NfQd0moJ8lDrqzHxuuPG2UHCkVSF0Ngs6aHTuSLLMBMX
         GswdLZTFv1tM0gNsyiaoqwtZTUYKr/iQqNqqPUO4k8fN+2KjKhrTd3iCzcQmapmvhO5A
         3kMYQdxT62c2WRO3JN6t07VdlKY0cbZPSe3FLMVeSf5VJLACZHhqDuNraiYvte+vtxUG
         9uRNfMPa5CC4P+6jmJ7gy7snPPDAmHri3GL6+cHD7reGedoXitaSl9SqfWIJYfGmbZMg
         v+Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789054261; x=1789659061;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GNXtzdTfuyw24dcBONWaDJipm3E8E6edNYMjDUcSm28=;
        b=QsNClZdsxOBbOHJpOgtdFvDAwi1uCKDEVAWwBSwp3Xiu6gEkVtpSCvV+ao+6rtqB27
         g0CqbetviRWyCgm/Sl00YbZoeXINLgNHcscOsGq9ps6u2jxo35x+nkCFDYDd9+MIwtB2
         ugAgqJcsoSvgHKNJy9bTj1kVcg+RMeRYTfaFNypuruMiz2djRZFtlv/JB/hwm0I6vqk8
         VgbiiLiZiel4iRSpbGUp5rOWTG8IU5u3mxaKtuZXxIa/zfdEX69YitUP7hUEV1f21fHV
         tTCoJWPdzyBjAg4lz0KYA0/DTvSLgyQSgewbJ27dKIr/1Qxt1H0jCdbKK70Oh8k3/Rp2
         XaKA==
X-Forwarded-Encrypted: i=1; AKwUvByQ1Cn72FQ3pIfVVNnpWpikUkUX5qnLgowxbm2NE/EOjSCCB6yBcrMXgUgAUmw13f+b0MiyoA95l4I=@vger.kernel.org
X-Gm-Message-State: AFuF++mC8wtHnxoBbYHfunXAwyVyXyZEnM8Z84m1qFyXz2EieQmnTs/x
	vzswRz7J7b/3Sa44C/PjNYAs8jZLAroaUAOBsnUmX+I3YTg+PzgUFI+BYg4t1U3VD0Igm4Xgb9F
	54BRY
X-Gm-Gg: AYBFou3G0zETywXgwKaxm9ifyFjWBcqW8RLzWx/VnNpkidvawu6liS+DdbW9H5Lv3z7
	W9ZPVqAOP+z9/fTwLHbxvau7v3DUgmkc3adEnmqPtGYyf1KKGtbeoqg+d4wWRG6QZ8rCV+rAfNI
	CGllILYnkon1hmnLLCBa0ufvgBJ3LO1rcK97efJcGWiXOEcKqEUa7mdPDOiEPFENRuLMyEmghP3
	vfXAbIlrDvN1A3rYGJUoNDPsT1KLtdGYc/lIq9jCTeOxF6zjoftbg3P6tTIRXp4xPN2ixn/eAYC
	9T8ZmKZN2E7c12XFSyhNSx2eI6uEiPSjo1CRNOPZsTPYhsUnR8hDVGd+NcY+I/N2Pv6ClUYqSSE
	rTzbbRRXE0DeK3umq5dlujnqqlgqj+dxVdNKF+3wimOeKLbYmGz57bBkkrDHFF6ps4DtEac4pHW
	baXHBJtW1G2fWow+VcwOs4f5Sm08GVV7vUfUSlHIYujb5mYO98sMm0YHWvRikTy8MZr4M5wJAin
	toP3/Qu2zvku1YNdrdE0mLoltmaTTzLRWcd8x5LpYSUQqPXG32/9MWRUPs=
X-Received: by 2002:a05:6808:c1b6:b0:4b1:b037:da8b with SMTP id 5614622812f47-4b9621b3457mr25643931b6e.11.1789054260657;
        Thu, 10 Sep 2026 08:31:00 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:a8c5:6332:5ea:5b26? ([2600:8803:e7e4:500:a8c5:6332:5ea:5b26])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b971675a96sm19552104b6e.11.2026.09.10.08.30.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 08:31:00 -0700 (PDT)
Message-ID: <dbe61875-4eed-4d8d-801b-af2e3daba752@baylibre.com>
Date: Thu, 10 Sep 2026 10:30:59 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] spi: docs: Use the multi-lane mode constants in examples
To: Karl Mehltretter <kmehltretter@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>,
 Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
References: <20260910033219.15996-1-kmehltretter@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260910033219.15996-1-kmehltretter@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/9/26 10:32 PM, Karl Mehltretter wrote:
> The multi-lane documentation names SPI_MULTI_BUS_MODE_* constants,
> including in the transfer initializers. The interface introduced with
> the document uses SPI_MULTI_LANE_MODE_*, so the examples refer to
> undefined macros.
> 
> Use the interface's constants in the descriptions and examples.
> 
> Fixes: 05c3bd745bb0 ("spi: Documentation: add page on multi-lane support")
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
Thanks!

Reviewed-by: David Lechner <dlechner@baylibre.com>

