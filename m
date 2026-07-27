Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E0141A56F
	for <linux-doc@vger.kernel.org>; Mon, 27 Jul 2026 14:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785163545; cv=none; b=eImd3IgsVzClW3tNe3oG0GiSIG1oitvMeW/UPY2YACcC+Y+UdDFTdLjlhvQ0JKTvdvx1YinJjLoan2pg04L6zjPJFIEKr3lRdVdmnsyWWv2jY+NeAdsSwxj/DyUoBoqkFw/1sa0pbeWZiGerEcK35yzi+RcC63mgbCldtomwjRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785163545; c=relaxed/simple;
	bh=TRQNemJU0zS79g/J4enfOrZKplEZddMF1OAmtUzc9ho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=juTs9uPxV325xKqG5gRGV+lJyNu4+hLmOJK3+e3Yw5UkZsBfHs+L+VoexFnRTC4XM9n01V7iT91Bl5gQ6UaOi1pwBXHitrtoK56UXHmCCHDHPNLNo/++GryhXCgqVG6qRAcEpZG4rtYPszbBjscUPfg8UPdE1W8z7pkJOu3gqN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=byWA0BWv; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="byWA0BWv"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c966b9ee9cbso1403538a12.1
        for <linux-doc@vger.kernel.org>; Mon, 27 Jul 2026 07:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785163543; x=1785768343; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KAGgkFqzP96xx/+bNop2DzU5y4t0TVlGWAhIbONjPIo=;
        b=byWA0BWvGW8fGgI091FdsEcrFvt4I25/Tpv9v6UrJNzLSxcVEnBJ8XSpHwdt+rZj3t
         75EweMkNDF1Jr1+sdGRahEmpveHG485EGMs7VoK1Kh5byEhwH8RkLpBQWdOXhsgc2oCe
         1ee4e0ou8x7gVRwluWW2I4RAxKCgKOqv7qVkW+S1f+5bLldeUqZEHUZ7P/lmq5B3Pk0a
         AuyQgevhQucNkqeXjaK7j/m1ZbfSu8zUpBgT1zOvFjRz0VVnmj6cFuXGXqhAHVoxO0BN
         K/1U53PK7xeN5m5y5jCudZ0jITVpvO7gjWJ76iSNAlemYGEkYWce0whtWLyfFS9cXut5
         Bj/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785163543; x=1785768343;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KAGgkFqzP96xx/+bNop2DzU5y4t0TVlGWAhIbONjPIo=;
        b=QWwCzriNZI95SndYmybbqeJnHDW4JRkXF+zBlOvygNEzncURv6nGXu0tczYzOoPQYm
         pfepe8bJmqht6qSllo7/1Oij5Onc+DoFa2u4o1/0IWbceyUr0ic52DulSlblVtzV6ejp
         1djkoQvM95jUwL+r82+kytWhFB5VdSVFiKXgv/tconkfKYfCm1aIOQ3K+1AkfMUbkF5f
         vkxGjtnTGk0IlBwWu9K6Lye9MzVpgtdfB6I0EJeOdy4+0VpwkpgqZ3UUIraiFF81GAvr
         A5sfJfPfMbwsuEbN9htlSV/5duS0NUsuYiWQR1YzlPzG1Pb5zGF4y0CpCu6KUNoAmx+y
         hi1Q==
X-Forwarded-Encrypted: i=1; AHgh+RoenRfmIbgjEX10sKIqQycYtIZbkl5JEr8iNPZ2iUDDQQ9I34VaWfS32nbG8bk2xk14DJOHyX/Ej+o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDGJokymQdWCkUn7pcAPjTX79NihzwPmG+vAD4bNE+TIHhxRjV
	teokHvz116EtQzL2hkD+lIUhR3vH8ARxCoVKxouulVLh6ReQarjXU375
X-Gm-Gg: AR+sD11k3ITDjMa5rtc4u+/6tekZZmZJvy1t/HZhbLkPTqxk4eKtbp/JVbhemN5uAZe
	xkYrGcEkc9fJgAqMpqmpgTdlTczL/FdhrZmEtI3uU+rjaJzPM159Lz2gzpyLGPsVQLdIZd2KcCZ
	fzPSL2TvA0LF8OBCg8EEYYA7ZOKKmHpy3mET17eWcRVRJ1OlHkb+zDD28M7nFC2MLYa/6n4DONY
	th7iQ9XtJKBaiK+gPmgw+SMKNsW3MPrn9RUcu/eY6RhIkHvtan37Zgc/3m4nTt0ZoCWe+1cyxMY
	CIOXs9hBPksXqO5+eVVyzhdRyZEA3f520AFIgI3T6EG47yMj7AeppdDgVpjOa8LXG8SqLqzB5z+
	LbO/0csf9NohigeJnDksIWHInGlG74rXZv0tNqpmanLuShxa/Wxqh2v51mklZGJJ9cJPZbgbhin
	z+LenfMDTvWbQJWK6BLWH22+yFFg==
X-Received: by 2002:a05:6a20:94ce:b0:3c0:9c19:659e with SMTP id adf61e73a8af0-3c67e00cac0mr8474498637.70.1785163543389;
        Mon, 27 Jul 2026 07:45:43 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc288a79sm32967946eec.0.2026.07.27.07.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 07:45:42 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 27 Jul 2026 07:45:42 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"krzk@kernel.org" <krzk@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"corbet@lwn.net" <corbet@lwn.net>,
	"skhan@linuxfoundation.org" <skhan@linuxfoundation.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Sanman Pradhan <psanman@juniper.net>,
	Debjit Ghosh <dghosh@juniper.net>,
	Jawahar Balaji Thirumalaisamy <jawaharb@juniper.net>,
	Santhanakrishnan Balraj <sbalraj@juniper.net>,
	Brian Mak <makb@juniper.net>, Georgi Vlaev <gvlaev@juniper.net>,
	Dhruva Devineni <ddevineni@juniper.net>,
	Avadhut Naik <avadhutn@juniper.net>
Subject: Re: [PATCH v4 2/2] hwmon: (pmbus/vt7505) Add driver for Analog
 Devices MAX16545/MAX16550 and Volterra VT7505
Message-ID: <eb7f53ad-f996-4e13-aa67-0b70b6e399bd@roeck-us.net>
References: <20260725211945.288415-1-sanman.pradhan@hpe.com>
 <20260725211945.288415-3-sanman.pradhan@hpe.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260725211945.288415-3-sanman.pradhan@hpe.com>

On Sat, Jul 25, 2026 at 09:20:14PM +0000, Pradhan, Sanman wrote:
> From: Georgi Vlaev <gvlaev@juniper.net>
> 
> Add a PMBus driver for the Analog Devices MAX16545 and MAX16550, and the
> Volterra VT7505 controllers. The driver reports input/output voltage,
> input/output current, input power and temperature over PMBus. All values
> use the direct data format. Peak input voltage, output voltage, output
> current, input power and temperature readings are exposed and can be
> reset.
> 
> The reported current and power depend on the external current-report
> resistor connected to the ILOAD pin, which can be provided through the
> "adi,rload-ohms" device tree property.
> 
> On the MAX16550 and VT7505, the severe-OCP deglitch time can optionally
> be configured with the "adi,ocp-severe-filter-us" device tree property.
> When omitted, the existing hardware setting is left unchanged.
> 
> Co-developed-by: Dhruva Devineni <ddevineni@juniper.net>
> Co-developed-by: Debjit Ghosh <dghosh@juniper.net>
> Co-developed-by: JawaharBalaji Thirumalaisamy <jawaharb@juniper.net>
> Co-developed-by: Avadhut Naik <avadhutn@juniper.net>
> Co-developed-by: Santhanakrishnan Balraj <sbalraj@juniper.net>
> Co-developed-by: Brian Mak <makb@juniper.net>
> Signed-off-by: Georgi Vlaev <gvlaev@juniper.net>
> Signed-off-by: Sanman Pradhan <psanman@juniper.net>

Applied.

Thanks,
Guenter
