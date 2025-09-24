Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 648EE3101D5
	for <linux-doc@vger.kernel.org>; Wed, 24 Sep 2025 14:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758725613; cv=none; b=hZInHD3GNC+3Tw9luNDDrngO01P5hXXAFrrsmQfpmop/pEDYvECd8Uus+KHHV3m2MzCCaSzJBrRAQa82GpyFcT4qMB2qqCD9xikfb3zlguowzqLJxCeo9jcRFjKMC1VlYPM5lTftnEngVtffpjUxlP6jwxH7XpTwSsmofZddxHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758725613; c=relaxed/simple;
	bh=yM/Q+X92fTlkNYlGxigRsIYhUdkygT31tNqbJqR8rLk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o5qvxzJes7cKuCyZ0IwP83Y7lcEzruNwGbGvOrs1pJkluq2DpwU8jzPERrVmUAwwRThKlkUAaAtbpfbQNj9fcXhrikraFPXLNyitW0EmAJMT4rmbyq+QO9qn1rjswqbzePG0iu9HNi7V9z3N0S4bEzl2DkaeCymzUYrcxwNuB5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EGMXIV9t; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EGMXIV9t"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-26f0c5455e2so35643495ad.3
        for <linux-doc@vger.kernel.org>; Wed, 24 Sep 2025 07:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758725612; x=1759330412; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/3NJ6x5Kdp89Akvi+2hnn1AXNw69P1zSYTXvdA/OXZA=;
        b=EGMXIV9tUKUdZlTJ7F6/RmTACuQtSD3XNPEO2xf7cCTaKRIFdsGMsqMgTfpX1GlgX1
         XrvyyfuecHlK/V0Rd5OwOMYOwJTQ2aoCS+TaqyQK1b2wc6leWzSqnwAmBTzTazsoatbg
         o/zF9QBrGQ9CCca/sGOXFP+B7j7SjnTIdokeNXfp+0VbBdfjgdkd+5xURshJPe7qG6dM
         luI2YDyPt7EdDbrS7c/N/psTJ4rf6iKZAq0oxq9IrZROhffIds7euXJigCkjvpj6+YOD
         GhnurF9vgZsfUBdVVVyXjYPnrWzJDwfdORjC8BpdcwGJxvwT8XRbXEkn5+PiuXC2ojD5
         B/EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758725612; x=1759330412;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/3NJ6x5Kdp89Akvi+2hnn1AXNw69P1zSYTXvdA/OXZA=;
        b=q9fX4RaeIZhltv1/2XwTLmuSs9wCcGk5/lSlS+1tY+fDM1TEiKdMdT3zD9NN6tlSs/
         XMeW60orE1F8tvtr0ZYu8YP/vnkO6ku5EwfbFRdim7fk/7BhYHaLFyABKNSaG5vllnRE
         Yr2n3qRS9rBm1vcHexyaDfvCH91/KvvsWtQwDM2F75wIQpX+QZwx6ekC9TJcORX+NzYT
         GedIfmwmyJCOvuboe8Ykb5c5MzI7fddC8wiKX8sVV587zqj2MSi57nPCDJsftXz0AhVg
         2Qk1oS/sRVia+mAcnA4vDpuVARJsfd0PCAG0AYyUQIEbVEYGUVO02I52QQgFDN20cFjI
         SX2A==
X-Forwarded-Encrypted: i=1; AJvYcCX0PWjwjuGnObW9mmcImT8ul0Ad6vuvZmk+HK5xIqakK4zhSW2cLk6yij0xuGg64JOrkDAXIffUvNI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEgAea+rTRwtP4y2Jbj1reFAC1XR2/VUKGbXl6QAvHKns6wbQf
	0bhgsxFoOLJIg5ezk8DuIJkJDlvK2KrLO9mLTkus1FVdiw6KVJpgD8Xl
X-Gm-Gg: ASbGncvmCwpoaoc+Ef57CKYZ+4+RVzQbU+bflEQBiuOvxSZK5Jf17mPg8yQ3Puzw3aO
	WXmanLCx9GctgehoTcZcL5J8Q5GKIKbHcKHXPDsPe6Ix/vI9vlNVkDiT4qXcy5Jljh64p1P5PdM
	ywvK7xqnBQWUSV7Iw/7vNgmbcZkAm6vTJ6ujJ7VCcXTK/EYERLi18Aa7zTW44qUax7ljc3WUZRo
	LRuVz5uwubUe7lzoDi3PWudLZ46Azw1ELJw80hZGW5lek0xx+ul/CYQO0s9A+tTRoo6/g2QS839
	gLzUT3g93O1FpMvyCk1d/PTxueU7ZXXhAras+YDZRaWd2WPxwYGMHfAZzID4Mo1paeu9vqarN5p
	+ej8bhSSNOl9CAAqXzkUdnsqmpNmQ8AZHzj0=
X-Google-Smtp-Source: AGHT+IHwdBjJXGvCWrYxZfTaJY8CaOaLZ3+d2LVxSNcLp40JjFPUdhB/JhjXkWgZBBL3x2RWHHNt/Q==
X-Received: by 2002:a17:903:3d06:b0:275:7ee4:83bc with SMTP id d9443c01a7336-27ed49b8694mr315435ad.2.1758725611709;
        Wed, 24 Sep 2025 07:53:31 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-26afe6385afsm155848085ad.39.2025.09.24.07.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 07:53:31 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 24 Sep 2025 07:53:30 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: wenswang@yeah.net
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	jdelvare@suse.com, corbet@lwn.net, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: Add MPS mp2925 and mp2929
Message-ID: <03adf64f-e583-4de2-97bc-0a4a9778d5a6@roeck-us.net>
References: <20250918080349.1154140-1-wenswang@yeah.net>
 <20250918080603.1154497-1-wenswang@yeah.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250918080603.1154497-1-wenswang@yeah.net>

On Thu, Sep 18, 2025 at 04:06:02PM +0800, wenswang@yeah.net wrote:
> From: Wensheng Wang <wenswang@yeah.net>
> 
> Add support for MPS mp2925 and mp2929 controller.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Wensheng Wang <wenswang@yeah.net>

Applied.

Guenter
