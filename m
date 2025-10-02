Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB702AF1D
	for <linux-doc@vger.kernel.org>; Thu,  2 Oct 2025 21:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759441251; cv=none; b=JPZYqNhnf2Ylk9psC0FQiHl7beHA0Y8JjUVdL+ZZeugKhD9o2A5INh6arlDzo1YntGohAO3yt41xceUdpGoVj9p01vy+DUTAucysci97kLIL2N9ppnEYzDKQLzBuL0ax/ZJDCW8wR48BlL3iWKy100B9hk1KJ5yII2dDRk23Vhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759441251; c=relaxed/simple;
	bh=4br5TXp20Sa42/FcnLphmQ5GaWo3dSD/pk6MBmPScJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YBehdO5dI4AEAg803scgBxsU8MfkjZH34bag4gqF+wJedBgOrvKkMZPQ6ELviOtsU/H2wrJ0ozXN52HZiR+dksYEzV6crkFXc9HkiSCNg8+0zY20Eon3e97rNFSovqivh9uIv8SRAmf+ZLvUIyl1UfMPrvr0rjtggcUEa89UkKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MOujQqn6; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MOujQqn6"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b5515eaefceso1349928a12.2
        for <linux-doc@vger.kernel.org>; Thu, 02 Oct 2025 14:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759441249; x=1760046049; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+g7WCpxhGw/kfoUiPXF0Q0M8PAzBxjz/5AXzmRXGxrc=;
        b=MOujQqn6snK0uKJg3td6LBFlTxmHHa0gKfAcaPvkUnqvbPzCG2IqkZSDxPa597OLJi
         jbkqhQtaHw11z9q9CwF+T2FZq5l6w07lFgEjixEnzWCu+65BVw5aF4T74bnpz+mM9DSl
         ehgFAI8Iy3NB+DMgRVhlo27AE6XI9Y5lwnxScCCuBBDHxAUsWomNYjNZLoCdCuO/WdYG
         XaCzd1qtDIBZrGm08drqE97vIIvvPlNzgi2vF8QNR09CUgqfZeL0NxXGk44/nNjjRdpy
         rA4zWVBbULJuJt6kIuQifjDYhhalSyGCmno8TJfh8N3udC25dKWRf5KH7nGyK1MqxJ0d
         rjYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759441249; x=1760046049;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+g7WCpxhGw/kfoUiPXF0Q0M8PAzBxjz/5AXzmRXGxrc=;
        b=fW7y1pVTsP0LSnrFTKdyU9SZpIDNiKlHZXUiZ+sq9ISmfcp55ImmuWwYoBxZJPXqTW
         L1N5thlpt8LjB2oH2JZIMGc0ISWwwry7mB9m6hzsOkd4DV1ZJR8YXWxAsimZk2F9c9p1
         GUC80VxlrRZ8t7+uUVSGkiCb5TFVi2DUcBTtlR2ZlQLzz26A0jDnpyWh921pF6NORD6s
         O7/FpvlijAclKXAgHU+g7jziZrBOriwAgqNmKO+zVrW3hswkR6x36OE3BK92+vn/r3rf
         NZJY7KOwDGDqDW2DVhZze1JMexfYCMxfozf4/HD8Uz/H9Ugyeq+J1uBp5GK3k6bdWGmL
         HP3g==
X-Forwarded-Encrypted: i=1; AJvYcCXb66hqr6prWFbVjO6OEl4Z9Go1en6zvpAuFRyrsVn4P+eILkyxRqjSo9hgH62qUHEevqQfFEgALcY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQ5XLCQEl0Uw9U1Qu4JlXzzcKQKnjQLO2hX4jBdty2mRBs4Tki
	4Xp9bpdGpvg31074NQ5MhFlDt9k6WD8zIWIgo3EzYnMTqFbe12Y9QrZ+
X-Gm-Gg: ASbGnctj+5DYyr2dSO5B/T8NqC6a6kAwuS9hHIAvbTpexsEIuG3Kvy7Z9wb9n7Xwn2K
	v8usBgJc+EOHOMMHkY5+CzsmDQoVIspvDpphRnk7sQmNY+c3pr7LIHSYowG+u+rMzjo7bxpgEt4
	ZMWB/M4GFVXDsMwvyvBh/kWjHGakTTBNv+GqkYR0s8+pm7PeO2rxR8hOkq5ZOIWCKbjv+YVYt7c
	U/L9oIKH27v+YL7B1lt3uTdk402o/nI9NqJAAl9KPLaQ5HoT2H2BNiLEXX2cAgdp2gmvDnZ3e3L
	LbWG/RDiMwppLEyHBQsWafcQ9kjAGPSO51USgqLP7Gwjfw/gSctu0IkXgirwmbsZ6A36ha/4Lpm
	xFCRd5ySbiiztEB7g5nrmw3QN94Mr96cDTw7tJczxGleRhQErIuqjv+lU15g=
X-Google-Smtp-Source: AGHT+IEZKtfG4lWFJ+VDJNIZB0rz102xqLGloS2pPVhFCwbbWN3EfpP8unSWU8sfUUl8oUSB1hU8Rg==
X-Received: by 2002:a17:902:ce0a:b0:28b:4ca5:d522 with SMTP id d9443c01a7336-28e9a65656bmr8167645ad.39.1759441249357;
        Thu, 02 Oct 2025 14:40:49 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d11191bsm30420125ad.11.2025.10.02.14.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 14:40:48 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 2 Oct 2025 14:40:47 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/2] hwmon: (pmbus/max34440): Update adpm12160 coeff due
 to latest FW
Message-ID: <00cdf890-9f7a-4f98-b170-a50fa8d5ff37@roeck-us.net>
References: <20251001-hwmon-next-v1-0-f8ca6a648203@analog.com>
 <20251001-hwmon-next-v1-1-f8ca6a648203@analog.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251001-hwmon-next-v1-1-f8ca6a648203@analog.com>

On Wed, Oct 01, 2025 at 08:37:07AM +0800, Alexis Czezar Torreno wrote:
> adpm12160 is a dc-dc power module. The firmware was updated and the
> coeeficients in the pmbus_driver_info needs to be updated. Since the
> part has not yet released with older FW, this permanent change to
> reflect the latest should be ok.
> 
> Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>

Applied.

Thanks,
Guenter
