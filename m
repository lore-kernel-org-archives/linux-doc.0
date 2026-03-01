Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C58175A8F
	for <linux-doc@vger.kernel.org>; Sun,  1 Mar 2026 23:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772409165; cv=none; b=uJYC46TYYogHrLw2pswIPxKC0RnJZr6rUYDgNSGqqrbW1LeC6h1UU0alUvakiFJRWJOhHwMWAju3861nbEhFSwKHWzTpg+bpiGSxrdjIuKo6CUkfRRdJ+WovrV0i6M5k1uDWD/an3aqjZvQFQxktkiI/i3eBJpnZew/6d0QeOxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772409165; c=relaxed/simple;
	bh=EiOaD919/Ki9hwuytZuFNkKMYcH2NPBKSuybFjO5HE0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X3AEvDVoouoluXh6FTINeiW7YCwRfPRYDaoj3zYRvj9aJ2jIZyXZIAxSVhqS5/Hh2kYVuqCSO+bMInXRK34RsChrmlkqot6J/PB2RBW2LIWPAX/pPZXFShLeLiS5VbKHJvNEFwL5gjE7XbL+klsF2SP/Vxguuc0+5g8e8EiAjFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G34/d7FP; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G34/d7FP"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1273349c56bso4599533c88.0
        for <linux-doc@vger.kernel.org>; Sun, 01 Mar 2026 15:52:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772409163; x=1773013963; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=guE+l9uR0OWbERsCagbK6n6r7rQeTJbRR5tO4b3XCrI=;
        b=G34/d7FPD03RuYlzbQdzrChaMLwlkeRJMFNbY1gSF4mKgZIk/OsYsXVWRsJeoIDzBD
         cAdyXkml789aOIzPYieYEXgGfEBqgiy2Vux066gF6BUQVD4ELmUV0/4JsUmdUQSmPhd1
         3BS4SBxkQ8afIEsr84yuk+4uZWMsoENszku5KAIXONDsbfG4OGBVI5pB0J0YB92S5P0o
         yjLj0pHV/p9XnzA4A0s+OCLlhl+PYgrhMDmev8AJ7YJ9WV2T/+NApskQQBp/ST42N0Q3
         T0Pfy+PZAUKDW4qetWa9z2lvIKGFAOP5FmsU3A+3uFD4KIRcB7CmT8lKYpCzhdKbleam
         ZVXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772409163; x=1773013963;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=guE+l9uR0OWbERsCagbK6n6r7rQeTJbRR5tO4b3XCrI=;
        b=FkFG0AL4r3oSRcfHDtWZOzf+yAdXv5sfIi3zhUUI7pWM4lBKyHY+69IKHWolEBG/Ma
         vaFWjTH3xwKsyMi/uA3uFV4GHCQwLbxtKX5fekVchkMTlJ3ctL7ByhRbz1XIFgNX3aOb
         yglN8E6MIgSPf3fNIWMBSXQdNUA3MXVxZABo5Ia73+wANSoGD1BDCJR9p5Zze/M9ow/o
         xoNMyrGjcRVGf8pcC08JdlF6+rUcFGRXPY0jNtiTZxbYxetyuSvdqTbpR4XmSn28TE87
         CkKcv+rr2yG8oe/wfUp6trwXlLYeUG7KJxYRqu/FF7WLV0UyRgZOgT4qErBoW0G2IH4/
         aEQA==
X-Forwarded-Encrypted: i=1; AJvYcCWnpOfNfSV9EDfZiFIN+WfFn4lmIQyWSsDLtZRymzsG7M//IRAbmf4kyw1svsa138UGwq730yyE7fM=@vger.kernel.org
X-Gm-Message-State: AOJu0YznK6/RV5klAr/+0tVfuQBGa137y4x+9uvao+nfLpUsZWBnYbSp
	HHGE5S9wfwR5EMcE0j/kgFgpDT8XiOa1HL75dVAgr1p8dk2qhnMMOapv
X-Gm-Gg: ATEYQzzHS5RXEgZNWikrPfKgwgz4oPvQvdQCbdCEqZMOKOynlVlP5BfoUEmwOExjRXD
	n3Nzjbdh4ysZVdrl5X0krzDmxMdfnurIyfXg/EMuDsqKn6Sq3/Jq3i/aFWe8NaKZ5AmbWh2XzZ8
	cVrHzW7lMooXeCwL9+dWbXuESajkUQkT4eV65etOBj8wlX5kAdmbPT9IJUgl0+JqFUdEI1dUOjW
	08ufsy6Sw2IOLSrslr8CrDgZ13GHUlabE8OzELmOSVmaMmi53QsyPHYsJ0vl5xSS8NI8UQ/JT0G
	IXPNuMqGxqKSTzKwKQEvcQWJMNYYKhKDQgFU5jWDAt5nMLE8eR41wWwPAupMvrm7EBchQYHTvB5
	Lk1x2IXXdJZKfpOO1EnqyQlcQh0B4eM2R3PSkF7HCIxYhO7NhPSiuqeMrNxYQVyY7Z9cfqeI7AZ
	14ktOiFqrXl/22+zUa3Do4hqSNMKnLESwDHTpl
X-Received: by 2002:a05:7300:d4ce:b0:2ba:7863:f0a8 with SMTP id 5a478bee46e88-2bde1e8434emr4036316eec.36.1772409163423;
        Sun, 01 Mar 2026 15:52:43 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be09bc9ec4sm2421751eec.24.2026.03.01.15.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 15:52:42 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 1 Mar 2026 15:52:42 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Flaviu Nistor <flaviu.nistor@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v2] hwmon: tmp102: Add support for TMP110 and TMP113
 devices
Message-ID: <04c0e2ca-6af0-4e25-a2e5-815be9926bc5@roeck-us.net>
References: <20260225095132.29954-1-flaviu.nistor@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260225095132.29954-1-flaviu.nistor@gmail.com>

On Wed, Feb 25, 2026 at 11:51:32AM +0200, Flaviu Nistor wrote:
> TMP110 and TMP113 temperature sensors are software compatible
> with TMP102 sensor but have different accuracy (maximum error).
> 
> Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>

Applied.

Thanks,
Guenter
