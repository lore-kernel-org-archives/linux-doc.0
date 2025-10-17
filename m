Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C759621B9F5
	for <linux-doc@vger.kernel.org>; Fri, 17 Oct 2025 12:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760705534; cv=none; b=ebR0jiRko8/ztYDOnIEDn44cTE7n4BXBKt4GOI/4Vr292EBXVg5/LgMK/ZynjCTgJZa8YY5hZo2IzBjKjpV4oHSyUVNJg0DgetoddrY7pCyu9YF8k796U0bxaT07D+rscHE5UIj4kCW0CNtFY+1jbT0lclcTz22JG07KzzsYj74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760705534; c=relaxed/simple;
	bh=zGnu1o//e3bxZ1ijfWOYdQqIB9ZYrFiOJVInbImT8Dc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PFzKDqCrCbBHRAjVOjVu+MXi4BJ6xZHhRrmmc4IBHDtYyTZEZUBuECnE2Ex1qjuabJKbptb4i4nUT9H4QswkrqQwSahQiMyh6fER+okD7c6OY3mMxZOYx2rQIcNB/bLCI5TsXsqvxB66bjKj0ER519VmbJYBvBwSk3n7Ae1FxGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h7oIWL7I; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h7oIWL7I"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b553412a19bso1267981a12.1
        for <linux-doc@vger.kernel.org>; Fri, 17 Oct 2025 05:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760705532; x=1761310332; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GX1z7rpYYkyy+tiYD/wTVd32X+5BN3gi9AYpbkqHgFk=;
        b=h7oIWL7IwCLGHrBimR3oMBZXgeCMZnN/XxCiTCPU2CcQjHnOCbi1se8kasJFdoKArG
         VuTLLnjuwDxUYNh8aWwEH+7qpxlHfAwSxnZvwX0uW24CSGmQ2kETgOU7sjwcbeZGZWJO
         exmU+rU/tetqEfyrM70o5nkN5DzeQ5DaAUoWdi2PHbAWCdtJCLxkeN3tESoxeqpnxje3
         haFfBcI3t65wtccqVw79YUOUWyx070KV2fauJ66JjhQXj/aomuZxXLqJfW9FLFwophTe
         hpOuHnPq5GD5pzEdbGCbRXsgqjdFWt2VvEPA8jfBot7eh02dDc7lCIa9kp8Gb0wtMMFZ
         7G3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760705532; x=1761310332;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GX1z7rpYYkyy+tiYD/wTVd32X+5BN3gi9AYpbkqHgFk=;
        b=oxFYeVzSLxbHa7uiaLoW+pC7ZnUgRDHFLu8GH7P8hK+EPUIycUUJiE0hu+sWiqNjYO
         6kx9ODrLTDpLoxNszoHaIcq7TXbyT/bZ67yGODSMD8JHdhf8fFAh8haKZGF5265XGUdK
         HVsW+iSVDERO4lPrutQjhvBbdEKs2f/egjq+zPCu02g6EiJEzLqdS89kRqZhmm4vnr01
         KutiJxAl5oqkzfoq1Tp/YH2FRoGpHdtY3301gyJzq3IeZlMEVitqP4YfQyqbZ4OnxbGH
         OYsnitjIGehL6uzwwwHvBgYeNg9DQkXMIrNDigyZuuR6H1+WsGo5Lbgn9nn89hXjDstI
         v3Uw==
X-Forwarded-Encrypted: i=1; AJvYcCU+yG7jWj/luRaGdKD9To1XfvAPNPAc9QfZTYFZRisaew+r4qgd74VwWYYBx0pReWTqELg6bnbN3cY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4BETRLVMn7vYWVLRM4Klit9Sfu17OjH337KT65UxBdI0TixrP
	Rrb8sbtwapCP1dF2vFAcOXARHb7xFIWA3BWTRltZ4Tk/9JKPxcPaM6gy
X-Gm-Gg: ASbGncv/czMEKBuPUdGq10yXNmsL1RQbphIUo1WAEJkkyjpm1G0QDFNlzvEQwj6Vz/7
	EOzoOa/vbldc9SFbP99rpTyxopTwnfJqgGBDHQhDAeRWFv5XDfsJAyYllB6JMepL8L+QLW71o33
	TW8M83uNUCoyyJl0rF0ON+St1TODEo6UB4rIov5Oyw9dVHdoaVzn8rye9eVRpCHDh+Lx1r3msY2
	0SXzBWhVsy4GEH5TT6hU5Vzs6SMmtBAui8rKLKvdDFVjbAzZwydfJy+5ENE+v+XBIwSEfGcmQcG
	ku7MbFvNiYpL2Q2GhYLpqvwDyA3+fG/dO8VgQrdZnzgxpg96VfVfxUVerW48QIF5y/klhaAb5ew
	z1ZLSBMqFr/LSrTpds6nnKXGjI1gwogswaoNXJbl1ATIwwsPMlkpfz7ha6EmFtYDIKF4bq/yFdc
	rakDTEFeKJoUYX8kbryoPtBrk=
X-Google-Smtp-Source: AGHT+IHBD+b3NB37DW1NNJU0Y7CRgNRfgj81Km3ty7iNT68DqbwCZ3dOZD5XoX8w64DGClNML1SwEg==
X-Received: by 2002:a17:902:f642:b0:28a:5b8b:1f6b with SMTP id d9443c01a7336-290c9cbbd49mr47303555ad.21.1760705531800;
        Fri, 17 Oct 2025 05:52:11 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33bb6522d67sm5481626a91.5.2025.10.17.05.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 05:52:11 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 17 Oct 2025 05:52:10 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Ankan Biswas <spyjetfayed@gmail.com>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, khalid@kernel.org,
	david.hunter.linux@gmail.com, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH 2/3] docs/hwmon: Add missing datasheet links for Maxim
 chips
Message-ID: <bfbbbf63-bd7d-4b2c-9e03-a3d3c3db04b3@roeck-us.net>
References: <20251017105740.17646-1-spyjetfayed@gmail.com>
 <20251017105740.17646-3-spyjetfayed@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251017105740.17646-3-spyjetfayed@gmail.com>

On Fri, Oct 17, 2025 at 04:27:17PM +0530, Ankan Biswas wrote:
> In 2021, Maxim Integrated was acquired by Analog Devices.
> maxim-ic.com & maximintegrated.com links redirect to analog.com.
> 
> Missing datasheets now available at Analog Devices added.
> 
> Signed-off-by: Ankan Biswas <spyjetfayed@gmail.com>
> ---
>  Documentation/hwmon/ds1621.rst   | 20 +++++++++++++++-----
>  Documentation/hwmon/lm75.rst     | 13 ++++++++-----
>  Documentation/hwmon/max15301.rst |  8 ++++++--
>  Documentation/hwmon/max31827.rst |  5 +++++
>  Documentation/hwmon/max77705.rst |  4 +++-
>  Documentation/hwmon/pmbus.rst    |  4 ++--
>  6 files changed, 39 insertions(+), 15 deletions(-)
> 
> diff --git a/Documentation/hwmon/ds1621.rst b/Documentation/hwmon/ds1621.rst
> index 552b37e9dd34..415d4c3043a7 100644
> --- a/Documentation/hwmon/ds1621.rst
> +++ b/Documentation/hwmon/ds1621.rst
> @@ -9,7 +9,9 @@ Supported chips:
>  
>      Addresses scanned: none
>  
> -    Datasheet: Publicly available from www.maximintegrated.com
> +    Datasheet: Publicly available at the Analog Devices website

The "Publicly available... " text is intended to identify the web site
if a direct link is not provided. Either the text or a link, but not both.

Guenter
