Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793042000;
	b=1Wm9PKHem4GnfI+YFKcVVdB3z7uVKMKnoxWiZyFoVHRvJ8xSXWbPnBNdRbZy7XWyHGUn
	 peTSdkcUhH4ATv0fMcgXkVF8jbDLMLLg36J6rV3fcUISUgbryMq6kUKSd4SHodob+Mf0G
	 1I6gO9BFX3hsxzPIj7cwldmmSHTMeVGFhE9npp0WFL/URgSrG1mmkqqSZDOtr/Ry6Li3T
	 zXYR+A/gO0/ZBJp7MEjRHfPJ/ZH8BJCxlYs9BaZGw45JImVVxQgM/s563pLFlIeJ9m2qO
	 VtMA6w3LPLZ8yd1uYrjEbROgGMm9aK3uYJJ+pJaTZ+EuV1bfBwOyTynKT0xdpySA4Eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793042000;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=XLkJpQWco9n5sMNhMe9Rfty/fDIzzK2dX/PPWjtzMU4=;
	b=fHaBCMOYJts2V5aSCycryjUmMCGXZZYTrhjt49iqbEZ/c3hRzDfhTsLPoxvF0+6/0jNb
	 FJHXJF3bwMKRRmhgqzRhNtwLDBsrc+w7U2LMyVbECFdCknaXNoQMKnJXjw58rGGQjrAB1
	 N0XyLXEx/jZK7YRD3mFOgsQ1pFjw7Fy+vM/UcsJNA4AnOEuzOgc5DWdtZEBC5eIaF2KIN
	 khpJCpPi4CRAzDfNB+J3p9hgIqSQaILnZjIppn0EmeeorhH/3n+PfvL+mxzpQ9dOPu8iH
	 VsB2QhaQsORX66yg49NwZY7erU7pZOXAQ0prKrk10kYivIIPry6PCcrqwfZ/o37OUCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CQQTClel;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CE6E606A31A
	for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 19:13:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CE6E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CQQTClel
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-15ea896ddc8so5831805c88.0
        for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 12:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793041999; x=1793646799; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XLkJpQWco9n5sMNhMe9Rfty/fDIzzK2dX/PPWjtzMU4=;
        b=CQQTClelF4Z/y1v1UKcARaJfZ2oWDcixPOJDkotrofreXPGW19wumCKvJyACKbtJ2j
         3Ldi/Kz4d5QPEAc/T3wJ09OqTnf3OU/JbpSKIA02sReTxeYEOAWBMCpTGGmEtMrqxkUK
         CrTHirElSsEtq+lLIc3g7mzJfNsqAROk8B4TCgiKHFWBzabG/oFAIVlb2VNeXijG2UPT
         sUNyumvg5MrbwWEY9W1wuUL5DcJvvEpUic+iRRZsSXSdxe5mWvfWzBwMYvJoq9aHLzVY
         CQL8+kLLjqhfmjskjxHhFQsd1tcAEprAG2PozEDtk6zjl9Kb9qlg47kJnucj0ixTqTHg
         nWJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793041999; x=1793646799;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XLkJpQWco9n5sMNhMe9Rfty/fDIzzK2dX/PPWjtzMU4=;
        b=aCKb1gs9KDhOd34Tl1KvJDdlO1eeJSCWoAtj9yCL+rRLjLWOmP8ONdzmWk8UJF9kw7
         FVhS57gFW4TZ0a5B1/YFVv30SefW03bKwHBmhfiulsV3Pv8guKlL2GuXWStqY+PZw0wg
         2rQB17aeXpvhGtZAxgfAaNRLbxH12qbCf98u97k+tE+IpJvG1V9aiBaKVvxVG/7PGINm
         XBAHKmsoj3z20F7dUeo9WM6j0hDR8TxOG1vAPWd7BCr5yzmRk02tvFcZw2dE0Nvd0dhT
         2LzFecNQa6cnRiZ/c1Fs1RfSR+1U2Sk91oBdcn1ax1H6w01oNhecYJAbv05u6s5MaqXg
         0B2A==
X-Forwarded-Encrypted: i=1; AKwUvBzXru9fYr7nOaSi3fmM7LrWWNVX99R4wpHWmy+0eMfwC1rkjoBiy/qi0/2lLlKBvlSiGuOJ0Sj1vb8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKLf+d9/ywNQ9b4z9F3iv0vTMFDBk3AgQtnF0MNqnqrDAOxkNqx
	0qafbY0Eb7GPluK1+Ekrtrw6zWbBSNbdDHitfiHMw6NHG8NnH1IVFED7
X-Gm-Gg: AYBFou0SM8RemWsm/nXLP6Xfi3rU9LsJfFAK4fsiPEaj/HCTs/nsb+o1Xch/FULxXoS
	tMS6Bxya+V8/bFWB7hwuO1Kgg0Z6rfLBei85zvl5TJ8CJ22VfRsigeCB9uE/628WjmBBOl5mX5q
	Eo0sxkJhKX4de9IneWcrSfuR+vyqajkzUITIZyYbF1enAdn3FJWuVUkDt4HfEfhyyybFVoXnC0M
	54i10sH0/skmJbhJlZ1XQCpq3qHOEPZj57QmMgesUE7NhINas7iLdyzPqB9dKEgRvonNF0TV/kj
	b6rjVz/1flpPuEqTLP/3ArzHvwXJnNq2ev5sbZlWLti95Bzn1zKSNmQaKGh2jAbqvGsijDKPNLX
	TGfQXTFBt+mHdrJnfDjg65coV+o5ErIhgXyjYncdky6000/Nbw3EKlS6mpCXCyiR5tNjAzrAAV7
	PFfqvM+t9JxKU2RXPQjGovDMrFoNck5qej310a8WXRR6nMIw6g0TWDpnIl5xf2Z8plLE1Mhxva8
	4nlJ8e5+gR9CBradI/wEB8FZcGzN1ZV29Y9fh/xCWUw68bOyR4lq9BHNFq1ujHuxy7YLG5Fs6lG
	spRcqNPr6OVUp/Y=
X-Received: by 2002:a05:701b:4309:b0:151:6e80:baa9 with SMTP id a92af1059eb24-19933e10e2cmr10466847c88.12.1793041999000;
        Mon, 26 Oct 2026 12:13:19 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a1bfaf25sm26826628c88.14.2026.10.26.12.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 12:13:18 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 26 Oct 2026 12:13:16 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Hamza Mahfooz <someguy@effective-light.com>
Cc: linux-hwmon@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] hwmon: (nct6683) Report the duty cycle of NCT6687D-R
 system fans
Message-ID: <0c8f35ac-3c92-4b1d-a027-7d8912751109@roeck-us.net>
References: <20261004153250.516730-1-someguy@effective-light.com>
 <20261004153250.516730-2-someguy@effective-light.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261004153250.516730-2-someguy@effective-light.com>

On Sun, Oct 04, 2026 at 11:32:49AM -0400, Hamza Mahfooz wrote:
> Recent MSI boards (customer ID 0x20d) use an NCT6687D-R. Its system fans
> are connected to channels 10-15, which have no fan output configuration
> register, so their duty cycle is not reported.
> 
> According to a reverse engineered register map, the duty cycle of these
> channels is reported in register (0xe00 + channel - 10). Report it for the
> system fans that are present, so that pwmN matches fanN. To do so,
> support up to 16 pwm channels, indexed by fan channel.
> 
> Signed-off-by: Hamza Mahfooz <someguy@effective-light.com>

Applied.

Thanks,
Guenter
