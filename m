Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791CC45BE3
	for <linux-doc@vger.kernel.org>; Sat, 16 May 2026 12:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778934673; cv=none; b=qxfXKB71QkTXDlAlHYV4Y06j0G17z7L/XVfqeWwLN6LEeI3AK1+xq43NKnVs3bWj7u1nYMIGm1BBoDvd6U2eUlJf9+c1jpVDS3QtTHHB9AIIaMXjHZIE+xeS05nfxobGh2WttWWDvzUb/BkdljWdtKvA0wifuh8X19ZIx5VQgGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778934673; c=relaxed/simple;
	bh=dJXdJ0lmnP7ir35/UondfPerUTVVYAjHNJ34FEo9SvA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qcq1+agY1dKaLWc66PMHInV13ILteMQFAFKnA/ZhMj+20mso2OYMf3vuEOiu8loDk7JUt88VwgonO0NZ+VR9rT2p0iEtWRibEPhrkZgBGMd7tbb2eAYuBNIWrbhaCNzkNZw+ZgbtGX/zoYQGLDanSlskHW5al3evneP7vvLAwOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mz3p2DFO; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mz3p2DFO"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2c15849aa2cso789614eec.0
        for <linux-doc@vger.kernel.org>; Sat, 16 May 2026 05:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778934672; x=1779539472; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e+bci2f5OGK3dh7VqqAy2YTCiph4OJOXGP2QY6ToFAc=;
        b=mz3p2DFOq9xIjWKm2YOS0GvOB3+Lj1uXYws1V0mw8sPVq0y/K/6LVDbHVR3xiNWS6I
         RWa2pF1y9uj3H5dh/Ihxe4DVS8jkshZGw+kHn4DWLQFUVBJQk4hzvTU0IBhgGfoyWT8E
         4QAVnpvnCWAERJTDq5gkebMxbIbpgPC/47RlLlzetknIH855lH89LCy4U6aGrZz61KyP
         eznJ3dvDEk8A3WTYnKEGgj2v+KqwoJjjuiyokQIqeSLCL6umqYO+D8hhW9SfTv7SIjsX
         nYPmkU3B6iukAHXkin7p+VvhyWp0sMxaBP8hXayoPsJ1iGcTWbeJQe7mAvEMDbSb5aiW
         xDOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778934672; x=1779539472;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=e+bci2f5OGK3dh7VqqAy2YTCiph4OJOXGP2QY6ToFAc=;
        b=KPGkd2VK6hdORP722B7WRsxk5ztCbfHrFvJBxVTSJ0Qt0JEHLop/X3xBiOJrCkxpln
         fekbA5M0KETxkrsSnFxYW3T+QwbE4ZY3a49JPMvETg0HqfWLK01K1+f5Niyp5l4h4vk6
         v7u6Fgd91S+oeG1/0WuTZrUVQ1MAtemkjPbY/dUm2wp6RB7r30mZTf3IHadKJ0bMLi4t
         CIfsONnqu6rsGwB70y0wJ6AWeVutvDhBI6kH0aa9V43gJVLiGcpR9kh+XXaeBMoCh3BP
         2qzkQBSvZWbzbZeXEyrqarxts0oByRYa5/bWomDognHNnbpidhoGQOLvN2t7cqBmUjI9
         RHQA==
X-Forwarded-Encrypted: i=1; AFNElJ97nHVDOdIq23O/5I6wVPMSeAB8MMWK8AvMh5PvwIjGDuCwY1D0LvCyDCUpsqVG1nl/WDd2j2/dyj8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZz5WBmYS2PtrkJvw71aidPovxeJYCfRXDewZ/ai/zpwo98jRs
	es1VA5NMWOK8HQr95Dm2vfiNhG8soHftahW9aHBYb8kkk8c0qDTaGeXV
X-Gm-Gg: Acq92OFzpGyyIbAEx7FaKzoH67F7m9i+wNlkluqFi/AGuKREqjwTNRK32+feVKSkK5o
	abYYp5xAGuRcYAkoUd2+1RcA+8DI2Vwa1AuoMTgej9/l5B6YQXjZWcnmWQiSb7dLbOfW4b3PDHS
	3uFcMbOeaUqM57qCwv4AHGtUhx4aQU/CQ4RRsaqE7K3U5xPTgUe+/uqzUma5WPH8gyR7n5WZnS6
	f8LZIYFJegg146a8/4fVdY1vV3PU9cyufedlz+u/YARDVJhaDMi49cK987DGf2lv0y4auK2QQa9
	wpMf25lORg+k1xVnrXBbKGpQx6V3bfyCiv24h/H+VeSlJiKIYNwLjTBKC3Td1iuslhnNoTEWO5v
	A+ATpWKSZ/JHUI2kAQKLyZLGgN3+pzsVqk73OuY+tuSCgAF72P7yHWP0EBaoIivvNC02UPq15up
	51wq1u5FZVe+bWrZZpSD+Mmg2NYBP3KV/394O1
X-Received: by 2002:a05:7300:a907:b0:2c5:220c:5670 with SMTP id 5a478bee46e88-3039818eec3mr3207425eec.2.1778934671595;
        Sat, 16 May 2026 05:31:11 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302944ffb85sm9758806eec.7.2026.05.16.05.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 05:31:11 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 16 May 2026 05:31:10 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Chen-Shi-Hong <eric039eric@gmail.com>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: hwmon: adt7411: document supported sysfs
 attributes
Message-ID: <b10ee1de-9bb2-416f-a60a-f943dec75f10@roeck-us.net>
References: <20260516035245.1604-1-eric039eric@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260516035245.1604-1-eric039eric@gmail.com>

On Sat, May 16, 2026 at 11:52:31AM +0800, Chen-Shi-Hong wrote:
> The adt7411 driver exposes additional standard hwmon attributes beyond
> the ones currently listed in Documentation/hwmon/adt7411.rst.
> 
> Document voltage min/max/alarm attributes, temperature min/max and
> min_alarm/max_alarm attributes, and the temp2_fault attribute for the
> external temperature channel.
> 
> Also update the documentation to clarify that analog inputs in1 and in2
> are not available when the external temperature sensor is enabled, and
> remove the outdated statement claiming that external temperature support
> and limit registers are unsupported.
> 
> Signed-off-by: Chen-Shi-Hong <eric039eric@gmail.com>

Applied.

Thanks,
Guenter
