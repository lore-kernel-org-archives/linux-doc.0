Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73EC936405F
	for <linux-doc@vger.kernel.org>; Tue, 24 Feb 2026 15:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771946759; cv=none; b=EvkmOLHOuHd2Jz5LJDrMHm2mvku6HNa5mKBvrsexr1zvYoFCf0JJrXBBTnGZufqHSt3aXktlSXhSnxoy6TLJdh/O2Mt+qjMrNp812we5G2QY9TBaYN0vB8M7IHg+2+IlvJS5S9/12tTK6rwAqqDLg+JNSCX9plXvqPb9D+WtZrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771946759; c=relaxed/simple;
	bh=QnbAFPGFthzvasBmUjYWWjZFAYjww/ilHVXgXGc5JRM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GRQOTIIZyvlu3s5M64Q/+an9sGEI31S0VAyF03dSeL60v169f5JpHbXAWGmphspFAOqhaNUvRVfWEkdB2gFVKtu57SO6Zpy5XNkj0QeTQ9HwRAedopCRLriHuvwMm1FGscTstDYwUMJhVS3HX7V9qXdJXFsX+qqC2NwCMZZqoFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aN/i+j6a; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aN/i+j6a"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1277e072e2dso150439c88.0
        for <linux-doc@vger.kernel.org>; Tue, 24 Feb 2026 07:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771946758; x=1772551558; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vrV9BhMxEEs17TmWJHa8CNzBUwr0TwzU8O3qC1THpDI=;
        b=aN/i+j6a5JD5cyFWNNDYDTYXIAOZOhLz+ChjE/yEnqjRkzrNuNwkcbUNECkqJBg1pE
         DFTXvgJkiTnXeZs6X3rsZ9C2BHAbOU567iPIiPwpmFUzp745ZQTOaiq0cSlRYthDDE9c
         Cxsn8h+8onogw4XCMPNJLQJcCiPLBWbnZVobUlOdIx0gm5xIEJUOlthbEWG1AV1IpQan
         1xWpF4GOyaC0cJ42rgsNE37sGPd66fqpT+AACgpPEl5yezMuhtV5vxVqV/Zo8088lF9C
         A0d/3gUDI4jTs8s+q4RwNZTS6FP+rUHkE6Aa44QKSOTGANwBOAH5EgyhFfctmzkHKXKj
         86ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771946758; x=1772551558;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vrV9BhMxEEs17TmWJHa8CNzBUwr0TwzU8O3qC1THpDI=;
        b=rFlzT+AZ0b2p205eESr6KplThMKGKw/XeqIjaCgJs9ReL3TmTDnnItJvd9Zbv7bioY
         0juV9Y2SnnRGE0CJPlLu0MV//KWGKuXhFuDrglNnyAtgTBGabVz0WNFM+rR4rYoYkdOA
         Pmme7CDOHaN6dXqFPi00WHsxsYIDyFVwNkz9PogJ/uVXfskJbYPqBHLc6c/2Syn+H8/0
         2zrS/8ptPOx0vQu1NlXrPBe+7IwVm9xAhFnroWbNzFvKKHRblSxS+goZuISxnzFmFmRD
         XvHUmoeKf0BNusOA78jO4vFdSyvjGRxYn/GX/t8vLJsRiriqB9kknp/Nw4gkbKHuqFbl
         LqEg==
X-Forwarded-Encrypted: i=1; AJvYcCUO//GCsB4IEeyj2ShePQT3pOX591gRBVtVCXUXXd+zaC2/joXGqWKqwSbjjxBYbmzQ6TH7StQ8/90=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyl9aDN0JBjGb+UIO/lOFi0u4refoOUFxwrNhHZhIpFqX28LN+5
	Rzjqla7fuNmjzOtMntwrHdu6Pa3b+jIskO36RCq4A/ZTXKehSNNEeSrK
X-Gm-Gg: AZuq6aLaxItL/G/SCldwE2Z6kKKHmbvOz4hvXaeeFgwF0Bl1eJ0HZbW8BdjoZAvo4f8
	QORV32W4BJ5yzu+aROx+v1vmkW3s4evvYf4+KWRR+VoEnfEvkH5zyO0Txu8pi1V9+VJLzvZ3wb/
	DIm4qhHfR62NnTsfXUUZBDPR5WBrgOk+jpFovdLNBG5gUWEz4TGN/X1UoE/ZjkD6PoUDG7W9TU8
	OZmE7cqAVsdUcqtaQ0kIMSShs5G1ZVsP/BJtd14qxXp7ZmklauGdH9/Z0hDihgWE+JAgseXCdDD
	5+bc0eeHJFxFwM6aDp8D7fPMqbgoQazJDbpVNtBtbFWdFLw8zKtAq+uvMxPIOBtuj3sAD/PCTa8
	vUfFQnY4uUcz1n8kMkzp14OVMZGM2NCuLdzpVKSg6U/6jv1P3caIyNo1bTYnCHXsauMR51lPnUH
	SVyPlRYCKojYV64DqydjdBJOsvdP68kt/OTkZ6
X-Received: by 2002:a05:7022:421:b0:11b:ca88:c4f1 with SMTP id a92af1059eb24-1277f5606afmr123769c88.20.1771946757470;
        Tue, 24 Feb 2026 07:25:57 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1276af7ae99sm10658338c88.10.2026.02.24.07.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 07:25:56 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 24 Feb 2026 07:25:55 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Michael Walle <mwalle@kernel.org>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 3/8] Revert "hwmon: add SMARC-sAM67 support"
Message-ID: <05db17b0-d9f0-478d-bbe6-1efdd9802abc@roeck-us.net>
References: <20260223100459.844967-1-mwalle@kernel.org>
 <20260223100459.844967-4-mwalle@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223100459.844967-4-mwalle@kernel.org>

On Mon, Feb 23, 2026 at 11:04:48AM +0100, Michael Walle wrote:
> This reverts commit 443b39c82c322c9f3c38bea0389fe927ba00b3b4.
> 
> I was just informed that this product is discontinued (without being
> ever released to the market). Pull the plug and let's not waste any more
> maintainers time.
> 
> Signed-off-by: Michael Walle <mwalle@kernel.org>

Applied. Please let me know if there are any objections.

Guenter
