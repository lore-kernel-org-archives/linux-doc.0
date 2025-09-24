Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F312E145B3F
	for <linux-doc@vger.kernel.org>; Wed, 24 Sep 2025 19:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758742235; cv=none; b=mVDWCAS441FZSC1ZANr/OTKJhEdQukzHg136xfKbQ6aS0H94uPrr3/Te03q8tp7ZBvGi4dGhPtjRWk2g56SvW/aNRhYqBc9Ym24Mnt3odINyc+bPL1KGcBL2NGMPxt3x8VHLEB4zXv9CWNQ2B5HDcJaXq23t4NALnQbcM6nT8oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758742235; c=relaxed/simple;
	bh=/e4i971/r7Fw/eEhFZtksigrKbXlOazlZrmnop2pcDs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FhiaWoaGmWmkS28hfcRKiyrcTl/SRkQRRdT4gBG7qr5eY3jr3QRY59+1c0mM3pneTHE81Aq/0hbaRwh8d+COcnzB2KrED4h5v16MEUW91K35/PUUyfHjhcHOQE/3wzWkuLBYSZeHnw73aHmHpKxCRda+yiNPlUD6iGxP7PyTseQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dy9r53sX; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dy9r53sX"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b5526b7c54eso109213a12.0
        for <linux-doc@vger.kernel.org>; Wed, 24 Sep 2025 12:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758742233; x=1759347033; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WUNFCslYIEFTynDU+6nP8kR8zycndcSpw/ZB7QnT4fg=;
        b=Dy9r53sXzjFA4OGosg08HJwOXziqxlItDQtBwhIUQBYF3ya2z2YaKYYqDROzkYHnR5
         jgobOyaaXamafXOK8TmIoAtxEJhEwiovtAeHJSG8i1wE289enI9+XkNSN3o6qpZicvsD
         wsbiIFclzdeGe5lTdRXD3jeIgdMg2XAsV+l5rVX/Jhpyw5K4ez7k4YP6aNH1bdzyXv+Q
         JZ6Ge3JY9uk1A7iMrQXnrRo/2ZIZUxe2xVtMBjODEsamHv1+eOWf6m+Qjx2Vzx5HnbcT
         0Ywl2ryUMZdnL1wdqY1+Cri6419o9v0cqL5u2ke7J2k/AlLuPd8hVRnYeUn63HtEFJdD
         7eYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758742233; x=1759347033;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WUNFCslYIEFTynDU+6nP8kR8zycndcSpw/ZB7QnT4fg=;
        b=ZQQIhcpRxOOaxu+HjtmUgcdtmQ2Vo4vJC9tZS7r5+2Pm1Djjcl2J2rfao6PC2b7ZXR
         S2kviUBJCuTLIjs+f3q++HtSl3DmmH/TfYp9bU+J/2XZqMVYts/MeaQ2g/ePIhGhAIy+
         HN9Uxmf45QBHGi9NK/PC4DzZg36ubAdpNgR+4tRY6ZwIAdC2Y+wqdijQ8a8gjJSWLkXX
         x/COH0oH73ma1Ce8s7vwBP3cjQkUVpUaaZjp54MM/N8aXeSfo1ZfcysC5L+1dfiQL7ER
         kzOIrni2o9J9BhU7BTvGMiCKCeIZQHoXmLoicc2EHCgBrBMuQQY3arSim1TfcTdpIfqc
         ryGA==
X-Forwarded-Encrypted: i=1; AJvYcCWm9zRNI+ETtJpzSksfEIOOHLHYZ8e0t5UrXkmdlyVv70k/VldtaMx1KPdJoyIkR4sezCI397Umu4Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2NW2ZFSRTVHFAZx8OL2poC3H67DZYgTVck2ALAzxNsQTgzVmc
	juLOzXn1vAj/K4BekEsxSkWPC1ENvEZf+OwhIS8l9Pqw4ARdNAOIO0Zq
X-Gm-Gg: ASbGncuStFogHbIRNnKlJiX/bMVe5ftTv38NrOosX1/cWHXqcgth/gM1G1HoRJlOzKt
	9b5LVIcFLKhOUOOg056o+yMMxE2RWBI3N5tV6BAGQ4beQNKcRlFBhGrEteTcGaCqe0IbDdxxeOx
	Jij5i3mV+iZWLbAm6aHpNJyEjNDHfx26jYhVg3Op1vrfNKk7irqXJ0lt3r41v3d+OMIii/EBELs
	8BQRQu2sCanDJpC+2btRtw0nvTtZt7I6OH/7B4ptq3PAo0ARV7kiZKaLs8012S/RUSGrjq3zJMT
	zAXQyJOIHZMxrdA3qtOA5vNuac8/StRFMsnoHK/kFgynDb18LJghEDl35VTvrQjTsa+QQSH+e8c
	qdZQlSWju40Fqg/vZlY/J1HllgjtLnRMlPgw=
X-Google-Smtp-Source: AGHT+IGXgHIPGwjBqDVM78HsNs0PblmkiXDMpBXIECEl2ksSHuLIfRokrz6fPJ65rOVTJopiGyU7Nw==
X-Received: by 2002:a17:902:c403:b0:23f:fa79:15d0 with SMTP id d9443c01a7336-27ed4a986e0mr7756055ad.46.1758742233251;
        Wed, 24 Sep 2025 12:30:33 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed68821d3sm181785ad.83.2025.09.24.12.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 12:30:32 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 24 Sep 2025 12:30:31 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Sung-Chi Li <lschyi@google.com>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Jonathan Corbet <corbet@lwn.net>, chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, Sung-Chi Li <lschyi@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Subject: Re: [PATCH v6 1/3] platform/chrome: update pwm fan control host
 commands
Message-ID: <60ecaa03-8cf1-493d-84fb-16c0ae71357d@roeck-us.net>
References: <20250911-cros_ec_fan-v6-0-a1446cc098af@google.com>
 <20250911-cros_ec_fan-v6-1-a1446cc098af@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250911-cros_ec_fan-v6-1-a1446cc098af@google.com>

On Thu, Sep 11, 2025 at 06:56:34AM +0000, Sung-Chi Li wrote:
> From: Sung-Chi Li <lschyi@chromium.org>
> 
> Update cros_ec_commands.h to include definitions for getting PWM fan
> duty, getting and setting the fan control mode.
> 
> Signed-off-by: Sung-Chi Li <lschyi@chromium.org>
> Acked-by: Tzung-Bi Shih <tzungbi@kernel.org>
> Reviewed-by: Thomas Weiﬂschuh <linux@weissschuh.net>

Applied.
Guenter
