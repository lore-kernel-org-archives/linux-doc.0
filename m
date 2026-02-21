Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81CA43112C0
	for <linux-doc@vger.kernel.org>; Sat, 21 Feb 2026 23:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771715036; cv=none; b=qBTovn7M2SuSUMnuv7jCqcogl7QSZ+k51wxEitw0nxsQd/sGp9NQcLsGlNLjEwIZtWOVdsqSncGl01mnB/NpVjHy1xYcXPAZysUerzH9+XJ62NH1ZLFYqGvJjK7EKldQRODKqIIf+PphFlqwHoW7biu6voQar2ZWLhL/w7vxjY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771715036; c=relaxed/simple;
	bh=dLn7pU8jF247dHaVpsieCO+El8PET6lRNPUBO6uklXE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N/X8ty0hQX8uG0niXtTgAd2ZdcOKT4gW6JUFZyiLTXQ/HHpComLykotx0DI3pHAV1870hr/kMhlFJvyFc0F1ESpMqUpl/lGBswC9e9KzT5RgEccYWlH3BdNlOfWZe9kwROHPOkgWUu45W2KrcQHSdoSpPSuRr6qNWSo8JhAywLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fyw2GEOD; arc=none smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fyw2GEOD"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-12732e6a123so619428c88.1
        for <linux-doc@vger.kernel.org>; Sat, 21 Feb 2026 15:03:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771715035; x=1772319835; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=26KB9AHM3wOxVAVaIjueh1jaK4iOkC93vngU+gNXVI4=;
        b=Fyw2GEODDnwVeWLoa+hnzk76WhYlBzBVF6dml1pAFdtRXPApNdyciYD2gaMU6fW3fp
         O/p3EGGwBiOq/avFbzCIyaWDKeTzwq+DKp6+CHrTgIn9ooZzqm1YM/HyOLS+QbZTrIqe
         FivmHLEM3Yx3cYQjtLBa5M2OG0DJqFSae4vX8oQkLV4bROoEG2vvwZjiksFzLljboQqg
         w7KYNEFu7LKdKbLJKLikTfXqfd5ttgTe5CRGKr9a8mQaNM8nQhKpxkOgo+R+VvmDjBzS
         IGZBJcx2qu2/O4dKZ8XC0sHcmsMd2tHH3iApccTWqBj+yjQl8ojLhkHmsZ2P6nxbepNJ
         ZRbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771715035; x=1772319835;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=26KB9AHM3wOxVAVaIjueh1jaK4iOkC93vngU+gNXVI4=;
        b=g37Ahtx9nEWAfQRzeq+FI+E2fPIOwZvxNfZ6JM2epmjxn1CMr8zDjHSBYkYpeSUnop
         Yn5ME0Cj+PC7S6jfN+1JC9eZH433LNg79zC2wyCVd5fE6/qs6GLx27KyzJTEp22napUc
         59Ud5NBkFkpah2AdlZ6m6ek1YnXKy8ivIMrG25CY07vUbeQEBSnju3K5CX0P+HOAFc49
         C1c4M7D6+bGDt8fE1/khi1t7PyaJ3GZ5zlXPbUlVaKZlxNlLNu8e4PbBmiU2Pu8utNjN
         xaLVXnAh039omaEC7voeln11q5rOn33v8d1c8p5lfTHZjLTKPW5u/0xiaYVTXXTFx7FT
         M4UA==
X-Forwarded-Encrypted: i=1; AJvYcCU+/uTAtRjX2GtGh5OOqpHEMaPqP4I8+Qp8HtvkLCISTxAxXDGT/2Vgt91nOWsyBCq11ZRsHzCTIuY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXKP3EP37E7mhdmxv1mkSQZP+24/88o0G+pqNQQap5NGbj1L2k
	CEzAFD5nXRpdJmqDqVPdu7dR6WMWyDor0YNmmdcdyb+Ul5D0sUjzle8W
X-Gm-Gg: AZuq6aKGOhWHCFS6Q9bfwjwv6DDmGJ0CzWbd7sNuOqcYkYJNhFEiTj3594Zg61W3Fu5
	gH+25cU2IYtlC3XDAfl0/LoVnvhxuLYEkMsuDg+Re2kSW7qL8gCg8rDrnyf0M+oIab6oAuVC5YF
	iy6SRnFzmAWx3aSzh4VRahHnewtYq6/LZouL270r3Rpn10uje+TQ62O1GzKUvzY/ofmqvXaj1kv
	Yu3ex5lVChboG6LuO9OGjEoJeHCMCVkC4WK7E4XSuLnPFM3wHDy404ZQd3lXpUCVKx0YsNhKJN8
	ilc5uiFLGHOumdF/sgD2zo1pLz2M9mcuB/FkOWSIR3upT2v3OtEQVBdFpa1t0l589D6ryevZn+z
	rt1U/vyz1f8AODR7yQynEFLmKPzEh0pZ9JkPMsBgFymX4IImMQrxrBge/eSmygHGm7FwAvHfCWK
	BKBpieEJS55qmmJf/FgkJtEyte+EIqrVzgOga7
X-Received: by 2002:a05:7022:6290:b0:123:2c98:f6af with SMTP id a92af1059eb24-1276acfe093mr2336471c88.14.1771715034615;
        Sat, 21 Feb 2026 15:03:54 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bd7dc167b2sm2066679eec.28.2026.02.21.15.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Feb 2026 15:03:53 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 21 Feb 2026 15:03:53 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Ian Ray <ian.ray@gehealthcare.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bence =?iso-8859-1?B?Q3Pza+Fz?= <bence98@sch.bme.hu>,
	=?utf-8?B?VG9tYcW+?= Zaman <tomaz@mono.si>,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH V3 2/3] hwmon: (ina2xx) Make it easier to add more devices
Message-ID: <34c879d6-de61-44cf-bb9d-214b73ad36c8@roeck-us.net>
References: <20260220112024.97446-1-ian.ray@gehealthcare.com>
 <20260220112024.97446-3-ian.ray@gehealthcare.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260220112024.97446-3-ian.ray@gehealthcare.com>

On Fri, Feb 20, 2026 at 01:20:21PM +0200, Ian Ray wrote:
> * Make sysfs entries documentation easier to maintain.
> * Use multi-line enum.
> * Correct "has_power_average" comment.
> 
> Create a new "has_update_interval" member for chips which support
> averaging.
> 
> Signed-off-by: Ian Ray <ian.ray@gehealthcare.com>
> Reviewed-by: Bence Csókás <bence98@sch.bme.hu> # v2

Applied.

Thanks,
Guenter
