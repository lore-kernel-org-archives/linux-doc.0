Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D974729E10F
	for <linux-doc@vger.kernel.org>; Sun,  9 Aug 2026 22:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786315671; cv=none; b=AkX3a8C33ycfHkW0Sdn5QGngt+4mJ9pghDG74j1f9H3XcTgbyrY7bB78es878dq6DSwUFXaCUD68bjj1n3eLBXUIeJ8/CjqkScBzTEmr1zqS9R+VTfWAr8VMZlSFcgMiryAeeaR/HHAnp6ag1YcLwPnkl5cfQiKPYXi5WW8E8zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786315671; c=relaxed/simple;
	bh=7eQKbi9H6lwMDW0BuRtpPcHm1ojEdQdv+td/osI0L+g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IdZZimlBpUEYVBaNIzuabB7PU6q84eNtdTkKy6hw/xvsY/bjNho62M3YrCfKvtPIzyKQ7KTw8Wv4vsih5cIXbeImnfuq4ee8JDURjdZN6oiP6yIHr6satrR2lTv/bcxHE2jV1SfzAOqkMLOeMky1fm950y5F+i7/MPHG01rQunA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mkkMWFr2; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mkkMWFr2"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38e58034d05so1178557a91.2
        for <linux-doc@vger.kernel.org>; Sun, 09 Aug 2026 15:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786315669; x=1786920469; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EHSSOEpvhI+W25FvdjNvlDYK2Y6ftqlzZ6mGw9r4mzk=;
        b=mkkMWFr2iGr+tvft7jB7+n2FsHDdACGWbUFFmLXneXGNCY227Bh8wK1GPNVuMso5ht
         XQWk4PSqCVIYGqPFaj+uIh0nD87xmMZ4Q6+qp09kEMeZu9mcaawgjKWbysSwdI/YQ0nG
         ZUifXcLe/0t3wWDhGLIJpR2s6ryRe2jrceLPdEsVB8rt7bI57mNoug1qwgeezp635LqU
         OrRbUrc4BJeSR60vqVAw+4tJwkUmXXGaMrjwTB24T1qkX1c7YBgb189ZYtbKwlPYWfmb
         5gnHGQ2s1Fn/1IOKA8cDqM7fAPzGydI3js52tHJjSz/jZnH95o2xlER1KI/dnXam9D78
         KGqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786315669; x=1786920469;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EHSSOEpvhI+W25FvdjNvlDYK2Y6ftqlzZ6mGw9r4mzk=;
        b=RfLzOdl6/28cRrpbYabkaeIALxWQ465i+z+AIHQ2zqeh1/L8hIX/2bxbIp5j4zLC1l
         +XduoDUS7geqGY3kXYy4vF+H2+8DquUm2MvaOzV/0SiulSjLVXUWMZBj/1xT/QKOd++f
         1djiXW0UoN1rsTUVZWEz0E5oYu6+IT86MwTJqdQjv6RdoDTAfG7DkxHbvLcdkkxTyIY2
         1UL20hOcapMdr3P2q98vRwizCnPZR+tu2dnxFgAU1kTRCtJs/G4wNBJAWMZIdA4dSUqZ
         NdqqR7AFwZcqOpQMmTYvGyvLDzfg8AySgeY6dOIx3XCj18U3P+4Wrt5tgjsbk5kwBO0S
         stdQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpqlgu/w3Tbb8S8k0fvsAv3NYta57+Uq5jFe2fytWgytFZfmbjCbpcEcTzggK5yVrJL2wTU/AAEzD4=@vger.kernel.org
X-Gm-Message-State: AOJu0YySShN1J/LO+0IkE8pLWU9a8B1ifRIYpjac0QX7Sf6NV9piEqIx
	aAac+ponfiuDx54QtVSd7uX5TVPd9Lo05fU4yh2jsAQ+JSVf1DIPGU5A
X-Gm-Gg: AR+sD10kEsDP16rJYXocFTvTrIxqxZ4w4xbTHNWhUxcAFJsPmwpxMSpd4OjrlzxqRBV
	f0QaBDI/VwPYA2PAoHjMKytXSo6YN5sIzo4pU4TIrbTzuHMw64vPUYuMnv4zAi4vj1zZT+saCKq
	oD13yhlzahQivig9nQmZ16n1YTSU4MG2CLqz2Plh1JPoH5htNsH5FST3URMO3Kw9W4+QZSrfByH
	rzJRVWZjH+KzuzswI9Cbk1u1qFN0zHr0aKEuMJKWnCpu9xqDLS4mNlYMWwa14lulXUKSh+YQwnR
	+qq2w5yesvvB5bOt6rDTi7a3n2lhjfX4bL+Cd/R+pMR9riGzjnwnxMlTQ/vMiaw43S29eJQAaAe
	4I7YSOnKDdJYbHY/fYiXDB8qO450iQ0Z3G6gPhi9TbI0QyOb9McEKbhOuLqVc9UdG3uW9Wuh30o
	ZG2aHoOKVh9J5XIgu3q9bx30lIIqrYYtMSoFert+8vrmXGcz3SSKEPxpea6AuiEI9OZilCUe6Rx
	42mUARCP3Xc
X-Received: by 2002:a17:90a:ec8b:b0:38f:aab1:5148 with SMTP id 98e67ed59e1d1-3903c5d313bmr40425670a91.13.1786315669157;
        Sun, 09 Aug 2026 15:47:49 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3925ff24b91sm9681127a91.9.2026.08.09.15.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 15:47:48 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 9 Aug 2026 15:47:47 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Eugene Shalygin <eugene.shalygin@gmail.com>
Cc: Rodrigo Araujo <araujo.rm@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	"open list:HARDWARE MONITORING" <linux-hwmon@vger.kernel.org>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] hwmon: (asus-ec-sensors) add ROG STRIX Z390-E GAMING
Message-ID: <803dd4d8-9569-4e7a-905d-4dea1a51be4e@roeck-us.net>
References: <20260809212705.1501382-1-eugene.shalygin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260809212705.1501382-1-eugene.shalygin@gmail.com>

On Sun, Aug 09, 2026 at 11:26:53PM +0200, Eugene Shalygin wrote:
> From: Rodrigo Araujo <araujo.rm@gmail.com>
> 
> The ROG STRIX Z390-E GAMING and Z390-F GAMING are essentially the
> same board apart from the E's onboard WiFi, so they share the same
> EC sensor layout.
> 
> Signed-off-by: Rodrigo Araujo <araujo.rm@gmail.com>
> Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>

Applied.

Thanks,
Guenter
