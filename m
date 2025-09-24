Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C893307ACD
	for <linux-doc@vger.kernel.org>; Wed, 24 Sep 2025 14:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758724605; cv=none; b=Rr9z3s7POH8X+suE8Y34RywZxi0rS6oXzhSoEzOPOifhZFECqYj6Nm3RZr+z+tsWFOMVFo9Yom96cnUpr4O+pn1zRMJcf+dx0zZBFopgTOA2umqTmcDk6Y6CiUETPJeDjQDCx9Y8CBrHdAzxgDK4m1OLDUJDXfHupF24F+GQ6PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758724605; c=relaxed/simple;
	bh=VidlVO50el1H467lJApxsWJXJg6s6uikstqa3zxjdVg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KlRjwf6KVaeAEw5wedNBo5DsPd8uSDui2dpxQxUqA5xvOh1A9Ws2reiRvOP/F+KDa1c5JsnioRAWKEUHGncny/xfwte6WDwCvAauWssUHW+Pi8zbZ385SwaEJoyXxymr9Kuoq9mR10TFBhzwveSK2VL0GnteaBRlqgg6raJaJ6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BXWTUPow; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BXWTUPow"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b557367479eso960856a12.0
        for <linux-doc@vger.kernel.org>; Wed, 24 Sep 2025 07:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758724603; x=1759329403; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AxgE/VwqMUnmRpk2sPi0rJ9F4/7o5NXDeAMdW4raKNM=;
        b=BXWTUPowVR1rYmOJKOswTxz5Idb79j9b3HcjQTtWHPOoT/Nsmr7L1MhKKUTyKHDCmc
         hY8VkTQswu9ZLT7Ur1tV9ERdtSNyXzMCRjw9QD6B62BqkrshWNIgYihDi2kKpstUhSAu
         KBS9yGyIpWiuSSAqRGJ6pkKoVJshiwn+0rZ3R/PTSUQF9apW6IXZWzl/Xuzv6H4JuYZn
         lOWgyEwwn0EDSZvb7+ep8ri0SwmWdlymVX6pOFrFAdG4vUQn/HM2SqD8EgDbtK/Bdo4K
         KQF0c0Ew2/ujlNOnQNlox5YDrE7D7g+yuKK9mgBgYwkhPT1KL1+Lqo3/4A0vhXzD4c3b
         S8QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758724603; x=1759329403;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AxgE/VwqMUnmRpk2sPi0rJ9F4/7o5NXDeAMdW4raKNM=;
        b=VnX5CHKr7M/Hbs7lkP3VEGG4x9Rsltu422gkRLzhMWD+IAupsjC3b0eUHRYa9TKnz+
         meSJfI0cVhARkW9PORoGxwaAvaaitsej49CxxhDbSru/JvxfTpvmGsrcjRRU+qehyh/B
         EmqFnWMMcaIHoG/0pU/8uZRQxUvOKvN/f5DPOT++VVnrkq4gLGpciugyWdLspQioYx4q
         1cQLWN2hN+Zexy0pUUPyw2LRsqq8dJu09W557KaHcpwUWPHe1j/9YYq+3ZYd6WIXteQ7
         eHzti3LcjqCS3LVHI2e5fC/0JS/lTi9CgM06LZcWy1sPbA1o86r1vyyIt1YICKzGyxPA
         ZHLg==
X-Forwarded-Encrypted: i=1; AJvYcCVQg6sKKQhe1WWTRkobvMzgGp5vxICBDU2n8t2W7456uM+AIOp7KKIW2Wn9HgIh4s35QM+zjgDH80I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa+6rJgGYmNOH6b19gX3M8SBPa9X7xFH03JNw1dsASUuCBo6lX
	6sR8bjgAHKRgnB9HiAwcx0EOIDfgoWiV/PkCrKfK7QNwALm84MSUNj23
X-Gm-Gg: ASbGncsu2Kp1AOb4l+CzbIUfBfg9U/bGAnrM7IqwZEQEx+R0+7toVBf/6PSiR0TkxQn
	cbUvsnj/reJrL+Opu8BQZVX58YfboIe9e7PB0EmXZ+gMeI6W0uNmpF8MqMXQGWpGL6mdzI3Ym7X
	SRG/tG6dPTvXgTeaJi82a6hrrzFXGvTiiFDt+2yrhEKb/EfREBP75V7xf5iQ5JJ/JOZLHez7wkR
	aJam+90soUjMZpNZ8Ai9BA2QfG8KW9H5gSDHUc3GNJrQYWeSoWU5wDTvOWhp8t/uWY2rNzr4qrw
	1sdqGlQgUSbbk/81exDxbVo4zLodo/doz/dBXGcf2ve7tc7oqYN1gYTYFH+3e2h/q+WExkaehoA
	2cWg3HszjzljHvlApBf8ptFSxAg90LTWAsPM=
X-Google-Smtp-Source: AGHT+IHu6iImWwWebqU0fIT3geKZJI+vQ7lMRP2q7Y6UID/bj52Rxi/gS4qRBD5nGfGbcaTqWRH+Jg==
X-Received: by 2002:a17:902:e5d0:b0:267:a231:34d0 with SMTP id d9443c01a7336-27cc5623567mr78793925ad.42.1758724603132;
        Wed, 24 Sep 2025 07:36:43 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-26980310ff8sm189560205ad.110.2025.09.24.07.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 07:36:42 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 24 Sep 2025 07:36:41 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Cosmo Chou <chou.cosmo@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	jdelvare@suse.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, corbet@lwn.net, cosmo.chou@quantatw.com
Subject: Re: [PATCH 1/2] dt-bindings: trivial-devices: add mps,mp5998
Message-ID: <4f57c182-d3d1-4007-80db-915ebbb6fe1f@roeck-us.net>
References: <20250916095026.800164-1-chou.cosmo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250916095026.800164-1-chou.cosmo@gmail.com>

On Tue, Sep 16, 2025 at 05:50:25PM +0800, Cosmo Chou wrote:
> Add dt-bindings for MPS mp5998 hot-swap controller.
> 
> Signed-off-by: Cosmo Chou <chou.cosmo@gmail.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Applied.

Guenter
