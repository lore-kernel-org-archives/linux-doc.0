Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B4B1A9F82
	for <linux-doc@vger.kernel.org>; Tue, 27 Jan 2026 00:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769473470; cv=none; b=lgumA2yc647VYttL9ws2iGQc6F2yzzbnJ3yLcV/qSD6F7RSFUBOM4NjrfcuEvBLz9r0RS/QirkYa1SUTgJ+qChEPXq+85i05glAjJmitZcro/H9eMXhbAAaQMTvQsX6NiUMZLHFNxE3XHmokIdGxgiFIV7PN2dqL8uE5J+OPqLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769473470; c=relaxed/simple;
	bh=ACpZPpzSm6uu6fLQoYPtsLzX6esHERNtAJ4I1LSnkgY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pGyMw9kzwETh0E9IKDZG3xNQeWo4AzfjS4o6ksMJY9uKUwXUx9p4Z7y1DAIlrVJ2H7zgU6EHSPQMbTT8C/+BDC6BQvvtNZR0yMGIk0dVOkoRB55MKhRX6OMWnNz1Drwz4LUCKLMi/40u793I6SV+YjKymmsP/SAREzhIDGkMFcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f35izipv; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f35izipv"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-81f4c0e2b42so2566275b3a.1
        for <linux-doc@vger.kernel.org>; Mon, 26 Jan 2026 16:24:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769473468; x=1770078268; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uvE6c4On0NDkZlHYWRtTJlRv2fTiNlkcBcwXsGT/WiQ=;
        b=f35izipvDbdRZKiL2Z2RCpAn8YBJbiTmmWChjXlo5CiUMW/tPPjUFIBHebyGETlYOM
         ETEnagYRicXfpKKcnEY1u4x4CFuVuB64m+TLf+19oz2hW7/3Pu5ceOH4qCn1mjTNyY4a
         /KTcoY1CEAxdu1uA2Nar403I/4M5XCuqLCO2iHo0lFyZIxkiqXzZScNpDDpqRskSEsKu
         t9Zl4loriMSImwxp5QwH2ahII/rF3Ju3/DwhVO3AtMMnolHM55aRtmF22rx7mQ10TwSh
         08euR42cUBoicU8QXPMp5tGcQKrtAhtkYvbWLIfJeOa/5gWD+B4EbbFFBXC63TPtYOk7
         6BDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769473468; x=1770078268;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uvE6c4On0NDkZlHYWRtTJlRv2fTiNlkcBcwXsGT/WiQ=;
        b=ewzXSwmjFCNAKn3VLUe9LqfbJF9pRzYn46r8BBYseWTMCWspJDbo80/t6Jo5VISaC5
         HHp/UMLF0459kB+y/3KJ8HNXvjY/FcScxybcOdSdGypxr68CVipZa74DIo+AteL4Hrb/
         1Ec7uV1Euj3hoMhq2TKhgYnGfMi63y7MGX1x/ueGlYthInomfw+k9TFatPYETQyrZAMR
         6cR2uFVB65H14636NUHiCu2qtVKQB19xhnG0cpxsUxkuVVXFJ/J6VvNsyIhLVP7Y0Rub
         6v18TruJ8WsXLdMt1bWplllWurqV7x6AeosM2nkDw0O8ekkIbZxbhoRGVVjR/R5QDVyF
         gIAA==
X-Forwarded-Encrypted: i=1; AJvYcCUkd34oeZMRpM92qftK6SNKvzMSBSNszqPBKvUOONlOuqVMYEuZw+kjxXpBag7oIkIdMk08fLo1jj0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIDgSSG7IteUcfhDFtHWgHu2BWl5HJgr67v5RavWqJwQhF7+c5
	LmoVBG9JJzV4uReIKLu1KHpHH32jMjXYW1mlcMxmRSQApUMdbTsavZ5Z
X-Gm-Gg: AZuq6aJ2qya0eWqiH7qkFjwL0qw7MwzZbTB+VSxAkNM/CYzDyE9X4B8qtEhyOreSNxf
	i5KfWWCwQqpnCNpTowKDjIVfyYb4zLV04kkDZmZdJuRmCrCwltFl9IEK632TZsyunfn0L0V0BSl
	Y3GewFKd2ZBiA3ihv/NhIPGt/95II3LxOHo24xteEXqpe1BRr2bRuqNwRyRHfFRtCtSsoJoiLUr
	j0oI4sy3TyYEViDtMS8QQ3vMSZyzQdigD22P/IKZO5oM2MAv0kfraaHV7vMVyQHVJpkkeVDj17f
	VisBdnLFsIgze1DZg8usQtgwDncjN8IQWh4spSIA8QRl15WLTIsyTvnbtuXioZMX95Xju/WELqU
	nwrs50SgmGX+Y71O1YeG8pAB+MqO4Jm8Hm/u8Uw0qxLTQJ46KuQKbbExWueinWPaJI9gY0aVGkm
	tSrkYoa9MwAqfhmLSqfm6GfdhD
X-Received: by 2002:a05:6a00:2496:b0:81f:3c77:a24c with SMTP id d2e1a72fcca58-823692f3e1emr3516b3a.66.1769473468610;
        Mon, 26 Jan 2026 16:24:28 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8231877005dsm10131115b3a.68.2026.01.26.16.24.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 16:24:28 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 26 Jan 2026 16:24:27 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas@weissschuh.net>,
	Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Dustin Howett <dustin@howett.net>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Stephen Horvath <s.horvath@outlook.com.au>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, Sung-Chi Li <lschyi@chromium.org>,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 2/4] hwmon: (cros_ec) Add support for fan target speed
Message-ID: <f8cfde51-a2bf-4718-b9d4-064a4375a057@roeck-us.net>
References: <20260118-cros_ec-hwmon-pwm-v2-0-77eb1709b031@weissschuh.net>
 <20260118-cros_ec-hwmon-pwm-v2-2-77eb1709b031@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260118-cros_ec-hwmon-pwm-v2-2-77eb1709b031@weissschuh.net>

On Sun, Jan 18, 2026 at 10:45:56AM +0100, Thomas Weiﬂschuh wrote:
> Use EC_CMD_PWM_GET_FAN_TARGET_RPM to retrieve the target fan speed.
> The EC only supports this for the first fan.
> 
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>
> Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>

Applied.

Thanks,
Guenter
