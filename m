Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73CF73451C1
	for <linux-doc@vger.kernel.org>; Sat, 12 Sep 2026 14:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789222864; cv=none; b=ZVxrCuYBSPfOr84e+6tlZOlW7SyrLP88RgHv/nF+wCiP6ndRlLE89vgGdcmetAqG2crfFuitSooDnkTbvg1VB7OSXUtd2sgTyPL8qp8fmNJrDqOkiT1DlyE2rWiJ/WX+l0bnp7w7CnAz5o68eeiUJ+5asTqfLW88+SOTulNA1XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789222864; c=relaxed/simple;
	bh=Uiy8nevCbQFi+tO7PRMHhK5e5/ieop6sXofJo9kMfiU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KDEYsScAjTRLNIrE+ocmw+EEv6TjXltWQnjceQZVrnnWwa90hgojodh/MWxDjPjD2Exee88t/gws3IGhIz4p+/CBxTI4i56vaafHwp0oWKJdyYmBcQacO4fbJACLyBvKLg8p2TmQOaaSDbSXQ9J2IaEkBA8rRiQEwer+Jwo0DMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S4eW1a/W; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S4eW1a/W"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cc4c7fab7b6so2222991a12.0
        for <linux-doc@vger.kernel.org>; Sat, 12 Sep 2026 07:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789222863; x=1789827663; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tHeNLogRQjCpZaDFq26lFx7YUh4OKGaTu/lrQFFabec=;
        b=S4eW1a/WJY0sJgpNhNHwz+iZxFN9+fQfwkTp+5w+SI9Jz1DZ/bgSz1PUpzGrdwh4n0
         39gFa2CbNbIs+iPErSwVki75FdeEfL5ljaoF4EYJcLLvo/NolOiX7t4adSSyeG6FvVQi
         XRYaVqrzmNC0fzpLBeKP1AqQD2O+uEaPSRg9knE6D71ABERtBBwA4ChfGdstUj/QwOcr
         RdVwEE3wrqWGzq5sDo9nei6OaESl272McGEKQX0zHSOmqhxsi6tRgM+cEdvjFkurmxML
         b14xXksmhv8pjJs7SVGXU2NJNsr/1n/L8tCDvbT7BHdAoWIzY/80V+ZcWj8uaFL1b5W+
         zPCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789222863; x=1789827663;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tHeNLogRQjCpZaDFq26lFx7YUh4OKGaTu/lrQFFabec=;
        b=ZcvFCtubEOASjJzNwHdnL0mlL5q0Mzr7Xe+Lpxqfyh7/msHLVcXiSgSr4GkbFqICxj
         I5h9pOqbQwQ2AQcZTwZzpphE5kxE2vY5HO3UlY5OBUcTUhruZJNYfPbcBJc/AUk72M1n
         aimpYh2MF4MjfpODzxVEPyAfsp+ct8ACumKwh3Akflw7zDMwnCGja1xquhMgPGU7nEIR
         5x9QS/t8SWjGcGoLXHQQlEGshmGQIxI0N7FgDtfTFzNvpmPJmujHsD5a90IeG1lCDZ+n
         nr4P6BAtjzUaXsb2X3WF6obc+jOvM9kOriSYuVwPgkwMGSPXwWAjqmDaEfhkV2aQ+PlW
         7LiQ==
X-Forwarded-Encrypted: i=1; AKwUvBzpRwGY4t2lxh0m71V22uRYT9FvfC32rv1EkoGMqKRKEVdw5qJKMIm5AMzEPWa8BwBovC6gYKwYGKA=@vger.kernel.org
X-Gm-Message-State: AFuF++mAjBQRkOlQ49/w2+H0XSm5ToBD3iFxP4XXt8x03NFzGcOB4Izi
	aIuJm98DOMU1jD878HrmJVOSMZZ+VF4audFxdbvKoPJr6HVJIfk3oudk
X-Gm-Gg: AYBFou1fCp2CeiXKuB46CC6aHJgnCNURB1MUwNE1F70fSK2mgjG8Lmlb0t88JN7/DYH
	Dyiwng21LLA43vTYTV4EF+dYlCihESCac2dIQ5FFnIOkSK0EjcXIC1TrKqeL4Qqa5G56UwAs5OH
	384IsGis/9cYBtDCJ95fmnPPTcEqULGoH32d9bnKtBVdRSmwWl6TBnNMctJJZS2a01Ip/cMRc+m
	tmn7Z+D9fLHOHHFp11p9HQa90wBLMxyf4fal2s65InKjVLR+JtoNDl8xTI28BulKnYv9wAJfYXt
	8dRoEBrJBIxe40Pb9+DXkKQy+S9Zim5o1B1HvW2uCgYcf8iefG585VEg1XVwxPzITecF0JkIDS2
	NMOur/8mSQxxt32iwhTTbLri9aJ5JFCqL20uzBbf6psrBeDbPBuubP5e3R9qxSrKAMJpW9EywFr
	JZ4a246OTp7TmIVxaal1HfzkP0cUEebe7LooS3RYFBvdXl/tLMtkGJfGmJcZ9E8pvsphyQ5mCjb
	q2GhrHXgdis
X-Received: by 2002:a17:90b:5823:b0:398:bdb0:adb7 with SMTP id 98e67ed59e1d1-39d9c0aad8dmr16717402a91.16.1789222862658;
        Sat, 12 Sep 2026 07:21:02 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d95994375sm10643910a91.17.2026.09.12.07.21.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 07:21:01 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 12 Sep 2026 07:21:00 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v2 2/4] hwmon: (pmbus/core) Add mapping function to
 pmbus_read_block_data()
Message-ID: <a4e0335f-7724-4bbe-b624-2aef0990dc8c@roeck-us.net>
References: <20260911-hwmon-max20826-support-v2-0-5e30cbd97d84@analog.com>
 <20260911-hwmon-max20826-support-v2-2-5e30cbd97d84@analog.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260911-hwmon-max20826-support-v2-2-5e30cbd97d84@analog.com>

On Fri, Sep 11, 2026 at 02:53:38PM +0100, Nuno Sá wrote:
> This is in preparation for adding support to a device which needs to
> use it's own read_block implementation.
> 
> The MAX20826 family is one such device. When not in PMBus page mode, each
> of its two rails sits at a different I2C address, so selecting the rail
> cannot be done through pmbus_set_page() and has to be handled by the
> driver.
> 
> Signed-off-by: Nuno Sá <nuno.sa@analog.com>

Applied.

Thanks,
Guenter
