Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57828307AC5
	for <linux-doc@vger.kernel.org>; Wed, 24 Sep 2025 14:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758724699; cv=none; b=F/dEJlzpaiglUiiEWZMk9ECzY7qT9b2pIP7ktakZWoaMvnIvKRfIoggzkROUx8bdoze2n1T6rgtkVLK+E9yUguMYnYNAJIUjynv0HcLb4xep/bBSQos1BCOI2Vn9n4nBGy2lEm6p7SrrUBgLtJD8cyn3S8va0YhbkLbIEX59q4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758724699; c=relaxed/simple;
	bh=z4kOzNKrt1YHasVRJGOjxknq262Dt5Qz+bhd7P3hKW0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tudnWVMQtdv/Glf7S/zlX3fboaqNK1KaR11EspZyfj7LW4d+Puved8YAbWgTYm6cXE3HMgzG5npLYSgeIv/GaRPcrCtTDpnrdTjy+SBf83N+e+AghXybdn0u4NLp8x/h/YLD2X87/MAI1Jalx0TfsLjD/KKRNMv8T27YaBM64cI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OUBiMUp8; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OUBiMUp8"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-27c369f8986so26146955ad.3
        for <linux-doc@vger.kernel.org>; Wed, 24 Sep 2025 07:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758724697; x=1759329497; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7FKs+A770otT1hMK/+muE0W9EUNGUj8tGucYnsoqh3w=;
        b=OUBiMUp8eU8cP4tTldTSDz8HaBnzEjFkVN5VM6444aVpCHpyGZ8K0NEsDoRY3vW41R
         HnqXg4OMxuhYwta0IvDhMvA6cBXPoiFp75dEbby26G/m4ipXoBytvbs7WtyxkP0bPQDG
         l+CSmjNQ+co03g1SPLU5moDmqgdNVXiRuSbRxMOxlMosgvBgkJ6Yo24TQnE1C4EClAdY
         CLanv925t+TqJdyfMMQqoe7YHcAX2ZpaDx/aekzRgSMyY3OH01d+MmfhEzpzGpiWosCN
         i+lSzciJF1iESeY9shTKM+7CuDkT0w0ZiNwJmqu7aYv47AXiwUA9skGh6zVgE5jEqyu3
         PVkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758724697; x=1759329497;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7FKs+A770otT1hMK/+muE0W9EUNGUj8tGucYnsoqh3w=;
        b=wLDHPUHaqFMXuNeXiAy5138PcpL0DnTJTiV2O8gxh6y8Ykiqxja6WDI9lRs82d7NSZ
         K5qP/nBbxf1u5f1rO9nUl/W+9TPu3IicJRmIQT/jnQeZ1FXLJZNk5tiuzvxUNSS0G91d
         4qg61c1QnxzHFlcAkxTIym2XzIJNUu/HHqNWSS7cefGXsTp+Z0jUERX/qk3enR5wQTXZ
         unyLE47oeaqey6w0tS6jiZ9pNmD9IiXTiTcqGx2pk1ZcRx+5ydX96mTKlSZLlJmNWqS8
         rUFhC1g+O6MZsvIemysKEUXZn9/Sh83ElQ5t/9UUkqPXTZicKxB8c56XdhD6uL4tKpiT
         BNXw==
X-Forwarded-Encrypted: i=1; AJvYcCXzjNHhqvRAonlfRhOCMkIoryhJGRGvEaC+Ff/YQg5XfwKpjx5GDjm877fZ0opxwa9HFqj4AAaPbnw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1Eib0tiNsCIeoC8+hEkF4gghbn23RIRjveBKZX9+OwtIDodmG
	sK+gGcT1u5CLy5CibtymWbGVBTH6syWKCQnJaDnOOt+NO4TIjoC6d/8N
X-Gm-Gg: ASbGncvNvzviLeNbhW39GQA5/ACV+njjfATxZ4pnKE5fF9O5MVdbCEHwYj/WkMeM//Z
	tln+46KZmiUioQpyYD7UolkfUL00CJEuWqc0lStLGM7KWY+SJ4TKqAmzAD9w8GnPWLCyqnnXm7J
	Q6Ghxndycl0UZOuaLa/F1bV8wJqSvSRnaDjDtiEaup6cREa3/AuiPtNLPRBbvXjpnCvPourU68L
	bZmhXdkl4SAQvhCsIMtJNxxtHUodd56NJoL7zvO6LUfLr4iqFHHS2j1z5ObcKdHxUCMNayw1TiB
	XgI2qlyH2Q3LK5F12tTm92TiJuJEuc2fSO+qlV9+sstm6RjeOz9svS/9OnrS2ohA9LAUaBtr3Vz
	CJ8nhNGmcSveRVp4uCGr1/A5IAiPoyf9hbw0=
X-Google-Smtp-Source: AGHT+IFnWLOdHL6EKD5bcnYki0oGZdxMqsJkwwvFoAddBVqOFVNBl9Ak/lLPOlpJgM6fEJ+dHVv4Pg==
X-Received: by 2002:a17:902:f549:b0:24b:62ef:9d38 with SMTP id d9443c01a7336-27cc34502b6mr74638195ad.19.1758724697443;
        Wed, 24 Sep 2025 07:38:17 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-269800531a0sm194313035ad.16.2025.09.24.07.38.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 07:38:16 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 24 Sep 2025 07:38:16 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Cosmo Chou <chou.cosmo@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	jdelvare@suse.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, corbet@lwn.net, cosmo.chou@quantatw.com
Subject: Re: [PATCH 2/2] hwmon: (pmbus/mp5990) add support for MP5998
Message-ID: <a3658e9c-6039-4591-9ccf-c429bd900803@roeck-us.net>
References: <20250916095026.800164-1-chou.cosmo@gmail.com>
 <20250916095026.800164-2-chou.cosmo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250916095026.800164-2-chou.cosmo@gmail.com>

On Tue, Sep 16, 2025 at 05:50:26PM +0800, Cosmo Chou wrote:
> Add support for the MPS MP5998 hot-swap controller. Like MP5990, MP5998
> uses EFUSE_CFG (0xC4) bit 9 to indicate linear/direct data format.
> 
> Signed-off-by: Cosmo Chou <chou.cosmo@gmail.com>

Applied.

Guenter
