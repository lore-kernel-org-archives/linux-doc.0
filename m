Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D8B44C4FC
	for <linux-doc@vger.kernel.org>; Fri, 24 Jul 2026 17:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784914031; cv=none; b=nuDl7ENyeznFhmt+w1xnaXsc928NGmBXb7DniDlphRgzwzTq0nAGoDoD5kiiCcK4VbQIEEyDjYR/AXZu+6YKMlGafaTByf7CaTHo/6s/BfIJn+x5yPTDodMrlGxZtazIDK1uUnEsHjseOWxlfxtJzj7MT+uNcseWqiCoB07ADrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784914031; c=relaxed/simple;
	bh=7/2f7PPDnywk//9ri199+3+jB563CTBa1UTHshm9lEw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m6kGlM19yaxiWHM3iruQ+cSykPa6ZkDudmHRMWXfF6rq+6F/RZZ3vKujEE56KJkjjHGIzlvtu2DRwbIg7Xa/qkVLa6poOZhnx4ytYS6s1s6i10MEfXx1NYoJt5ewhoqmhGPFxvEFSxgNgXxVH4EkNnyB1yVBrGZPkaTAvmLu3w0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kXTEdlON; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kXTEdlON"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8485bd28dd0so771077b3a.2
        for <linux-doc@vger.kernel.org>; Fri, 24 Jul 2026 10:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784914025; x=1785518825; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=U26xbPdFXYP/dp7KbvYNjIdHJ0Q5KZ3g0wD5029039Y=;
        b=kXTEdlONs7ay7JjThyas2ZWACxH6wqfR4gRleUJ/nom6Nx51Fm/FAbFGrDd06/KKqA
         r2izXs8Zuo4G52TDij254xKO/PWBdZcS7azvVkzPO+PkyD6E4phyNLrPYW42RcaI5bYp
         HLzVXsKH+VrXDAdF4dfGmPYIjrVqIwfGjWsYGhJFx61p2b+Ke51o3t8fh6j7Cs1cbZ9U
         QLuaL0JWl4chTY7Jr7gkQtsaieegNsoGNvpiEk/BL+RZXo6QcxqXKxtmF93xEkmoo2xq
         G9X5ers1gRDXeKvhAhMmIQB/R/SOHdevXENglJT7Drlmaw6eJ5TgRpWtFmEk+Q41g8Lq
         QBsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784914025; x=1785518825;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U26xbPdFXYP/dp7KbvYNjIdHJ0Q5KZ3g0wD5029039Y=;
        b=BHU51miSB6CDjhHLZn4HuKfGmrbuyEM0fD6C0jfKvAuolIld9DO9/u+19LXfEPcrQM
         oOTfXtKn0nOis5aZX66p+17fWi5ytz3qBsiEa07qPuLmF8bRU8VaiI+pxRowSwgjg0SF
         htUy+24Md49czIxywkVgveHzFpqqwBA64WUpqb1+N8H4hAYxe2H1dMYajhTag1zBqz3b
         UPXuXvYZXCd5ftjyPN+6pwCzr7ZjrSPc3verqcMphbxoXd6xI2q2pTiOvXaLNMyRr3/d
         3GWCAAKgwktdO3gPv2lTb/eEwLB6faUbgWidtruIL8EmEQpKgzKN9UjcX/T5sp2NGhJK
         Onrw==
X-Forwarded-Encrypted: i=1; AHgh+RrUx9ufrFH9eQPRg0Cw14MNBT1u6LzQamTQ2Nrcqjj0yc1fLSwRbMcruUTcFTxZWyC8r28nW6nR+l0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVho4yG5kdfwSZ0NJtvXmtorzZyoFOgeHftooeE+fCkQ+yP9EE
	O2oq8GmBikft+9t+MIkxSSiwIA0qCv0fIrgh5OQUzb9Ts6gUNYkyk3aK
X-Gm-Gg: AR+sD10UM4qXoEMCbJMu3EZqp1RM7EBHi2MgmfHU9soe3whmWJS126YYTwDOGuIAovs
	Re50Wd5LUaTl4qHCtmH3TeeG23FkYDHauz74bU8pLSs5YJGGZKPA5CQQ2VxWJJyFmOZc9Difmf0
	diTRt44/8jGbC0TsWDfU0GBDtdOzKwVHRjYzcx7BHv805+b9DCbibjCs/ZJMe3i/0vl3IrX8dpA
	aol2NItfJyh11gKRxFVSxSHffK+m16AdkBYArnD3EPbE6YUtAtqN1PlvqOZgQ3bDNDAi6eVxUaS
	2cw4SH7EJNTv1mT6yXGzwRRX3iB3zgSwCJKOObZoYSl9XjFHWxuD1O+dEb7nI76+iOalSiH8Ltl
	89Q9dnAEzwN6nrCrbnR4LS7pUNB9aR6RJ8xWHOtTsxGAabw6/IwYIPWBe7ZF78TCyIamWBP6Rdn
	MlZKkpE/soaakbkDg=
X-Received: by 2002:a05:6a00:4b51:b0:847:8f8a:a05d with SMTP id d2e1a72fcca58-84e2bc6b53dmr8461030b3a.29.1784914025173;
        Fri, 24 Jul 2026 10:27:05 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e53258428sm229838b3a.12.2026.07.24.10.27.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 10:27:04 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 24 Jul 2026 10:27:03 -0700
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
	Georgi Vlaev <gvlaev@juniper.net>,
	Dhruva Devineni <ddevineni@juniper.net>,
	Debjit Ghosh <dghosh@juniper.net>,
	Jawahar Balaji Thirumalaisamy <jawaharb@juniper.net>,
	Avadhut Naik <avadhutn@juniper.net>,
	Santhanakrishnan Balraj <sbalraj@juniper.net>,
	Brian Mak <makb@juniper.net>
Subject: Re: [PATCH v3 2/2] hwmon: (pmbus/vt7505) Add driver for Analog
 Devices MAX16545/MAX16550 and Volterra VT7505
Message-ID: <ff49ae92-cff8-489b-b702-9d8fb8dd4c69@roeck-us.net>
References: <20260724164919.247162-1-sanman.pradhan@hpe.com>
 <20260724164919.247162-3-sanman.pradhan@hpe.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260724164919.247162-3-sanman.pradhan@hpe.com>

On Fri, Jul 24, 2026 at 04:50:00PM +0000, Pradhan, Sanman wrote:
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
...
> +static void vt7505_set_m(int *m, u32 rload)
> +{
> +	u64 val = (u64)*m * rload;
> +
> +	/* Make sure m fits the s32 type */
> +	*m = DIV_ROUND_CLOSEST_ULL(val, 1000);

The largest possible value of m is 7578. That means that this _will_
overflow if rload >= 283383960 because 283383960 * 7578 / 1000 =
2147483648.88, rounded up to to 2147483649 == 0x80000001.

Please add a range check in the probe function.

Thanks,
Guenter
