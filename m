Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B2D1F4C8E
	for <linux-doc@vger.kernel.org>; Sun,  1 Mar 2026 23:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772409120; cv=none; b=jhZIStv2cFEqdF67PJzFFXhex/0Z4P9fDfh4ifGsWRhmK/58u2KFtoCpsJYNKsAqifyN/S9zPx1GwPHPydmfHLZyk3WtS1yPrWrQovr9epqRTn5MVRXyg7onqSmNc2Dlh0J5POiPdsiweMI7xsHYASUQnxx1wc6IsU9B3q7NBtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772409120; c=relaxed/simple;
	bh=BUbG9VHoEMwn6jZhEe9i4ZwgG6crNviML3hjzpid2Dk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SRtpmg7afFFsTYtkKglk3+Xff10Ctx68RMBBROpcJ3fKjbNNaZCWNNXqP1WDMWtCsyUK7nk+2xiaLK5iyXt3AUEm+bp6ooYYl5X+wf/RYdYef5Zondu/Fh1hr5kQzA39weZ3K+jKz8G9zJcL6aZsC61A25ZH2PM7fPl1iysBa2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BHrWjNgK; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BHrWjNgK"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-12732165d1eso3980351c88.1
        for <linux-doc@vger.kernel.org>; Sun, 01 Mar 2026 15:51:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772409118; x=1773013918; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZVqD17OuZxx4cythfStgDT/uYwbR00pycs97eaa/Hlw=;
        b=BHrWjNgKtP6JvbRI8niy3m3M8v3exrY3paVX9qblX1GeP+HJFSgRxmxDdMilE2XT9w
         WZO/0yUEvWwbcpsLP+ZS2gtXaP1AWGJrfgAX5uLVND3IIyWp6WPlv+p9EqSNde628clB
         dTf7igLUC7C8GL9kwVdESUFHNKCWC1fvc7ZNalu6MybU8WFxQXRxdn0EEMMdKcrKIfQ1
         HD0naBSg1DrC9y4BiKgp5webrHGKDOJED9ZwTfALvECYUEG93YQpOPJZTPEHlyxrA4TI
         nttYucOQSZnxHb0M2JOlmRAQoqvsdKb/x3L8MZTp+4208KX3+yMgnOHQuiwc+60T1uhg
         j5EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772409118; x=1773013918;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZVqD17OuZxx4cythfStgDT/uYwbR00pycs97eaa/Hlw=;
        b=NpkUmn6sfcHr8LkMDNIPregCdisGEh3o4gM142CIhhj4HH2GSPutLXae9A0y9ScAcJ
         Am4w6mM7kaTRI4hWdoU7Ch6SDHDaeUDC2qy8gflJx6AatJZLpZgiGYfyhUmn04XO8vkq
         IUqyJFPFWc1rovghbcQwep83VFKCBx9m16rwYE0vfxh+7ziGhlccvXdjcnvDfBlB8Iv5
         gkn56ouAmVZ/kcOT0nuvTn9PR73him+sadRSTDBpZLN6elx4Y2WlpUV6vZEaGWn8uVWy
         tg8y/7+c/HU5q8YXaLsCnaXjfsxnGBdbs/uekSUpOmU9H6WzFtDskf9bsFshht+YVVaN
         VbKw==
X-Forwarded-Encrypted: i=1; AJvYcCXtXByHj5VQPhfw+t9JqIrkp+B6XJpY9+f0fhdQlT1z7aSPanV1NUAP22vYYpxSrVaj/NAukcRp++E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/OdYk4MtNgn03lzswI3UHS+ul3daWFZ4emXP19lRjIV7DyfSQ
	P/OLnZ/WC9ePY+SeefmHL3svlclbeWmYc2Ht1TqqPSpBawpGeSTygnj/
X-Gm-Gg: ATEYQzy0JnerHiSWyy2QVdlS81shOlenO2zFNZzJ/3TYP9UUcuVNUEakdJJ+p0YX/MT
	g8nG+SACAYtT01zpOqXY+nfQYm/4+KmvfiJQeRbKpg3M81E5zbYDZcslH2lgrtWivZSihbgxiC6
	enYxwEkHLofQm0WSyy+riv/FPahmwANBGmHBpEwM73FbX8bizV65/2uirOJZlyV8WJ9rwJnUjui
	C7shjepeUoY2NiYp6JhrI7KkQ0gHcuMr3rpAMW61FU7UmgTYeZf5aQrSBsEiCLUM3lwxgwkjzQ4
	g1N7Z3M40CT7nKThrYLZLSED5DgYv8GUw6UDosqbHAhNJvzftCN31Fo4INT50zse0uNqZHwZPZ+
	W0CJZBfLudrawgQkk2NCkHxEK2LD4icwHkVpbBNhI3lY7J+9CI+ne2H0G/8aUReovwIiSb/g7bb
	LwhJivCiGl/sXjRt/vPbw/o1LBxkkkA/vP6ZGTjeGt76jIBeg=
X-Received: by 2002:a05:7022:ea55:20b0:127:9cad:1a65 with SMTP id a92af1059eb24-1279cad2199mr858655c88.14.1772409118320;
        Sun, 01 Mar 2026 15:51:58 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12789a43a18sm14535779c88.13.2026.03.01.15.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 15:51:57 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 1 Mar 2026 15:51:56 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Eugene Shalygin <eugene.shalygin@gmail.com>
Cc: Volodimir Buchakchiyskiy <vladimirbuchakchiiskiy@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (asus-ec-sensors) add ROG STRIX Z790-H GAMING WIFI
Message-ID: <9f4b0e26-fb25-4053-986a-0e5cf02dc538@roeck-us.net>
References: <20260228114412.358148-1-eugene.shalygin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260228114412.358148-1-eugene.shalygin@gmail.com>

On Sat, Feb 28, 2026 at 12:44:02PM +0100, Eugene Shalygin wrote:
> From: Volodimir Buchakchiyskiy <vladimirbuchakchiiskiy@gmail.com>
> 
> Add limited support for ROG STRIX Z790-H GAMING WIFI (VRM temp and
> T_Sensor only).
> 
> Signed-off-by: Volodimir Buchakchiyskiy <vladimirbuchakchiiskiy@gmail.com>
> Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>

Applied.

Thanks,
Guenter
