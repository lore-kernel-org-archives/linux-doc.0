Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05068347C6
	for <linux-doc@vger.kernel.org>; Thu, 12 Feb 2026 09:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770887618; cv=none; b=Rem/BPvjIAGXPJ2KFs1Ayd/9JR7aHY8+HOyBQihYoDB7WJeZo3vzD2uJNAe6UVZBCWp3actgc6AASym8j6hzGPse4FjGHFSwwiPsEm72cF7ljakP/yyYxaVOnrt9cMpnWwO7mBQVfqzikbNqAgBvH+/lbUKp+E8FPnqcOsfXokE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770887618; c=relaxed/simple;
	bh=6g/CfwrSiSpX4PzjT+5c0IfwtZX96ZQZE35njKJMIAc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vBBgTYyG9RH7yBJkg48RpDZ0Aj+qG9h3w6FRTQ3eb2/rm2FvXT6oplClxY9vy/5gzXQv/5N7qVESbonP+SGuYtD5PFreZ2D9zCptcM7N2nhc078Up2qCZJB2Rd8aqrfjM7v287ZUoovX1IA8uIornQxscDF/DANxLne2B6zB6ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ae75wrbv; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ae75wrbv"
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-4836d9d54f6so102145e9.1
        for <linux-doc@vger.kernel.org>; Thu, 12 Feb 2026 01:13:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770887615; x=1771492415; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=v52+nJkOYCsoxRiSmOJCpaAdmkTUJTGO81WVi4TlMMY=;
        b=ae75wrbv27NJBkqia5zFq4uGl30qQGFAFZ9roM0PqWnTAqxsYRuOKyRxyH19xb46GY
         UBvW3W94b9xZySqlkFV1VIP4BKH6i8Q6E8nSyjgSVt+K9R0yKRcCNvqmYbtWKijtSk5P
         wLeXkDn4uf9CPPj3E+NsBfqQR2hdnNIAwZ3Q9hOPgYXUe0r2Dh3GFul3KOCpdG6U21Bt
         VI6e6a+hfkXQEl0DePAW5++8CZJZVRACJ1YA1Ki5kTFhsPHlCNM8zYkksH9kTANKuWOv
         wx1QAjla32poRWM1H4CAtBDlnTmIkeprmvSkM9pvvCOO7sco5LQuXMqCeAbneKE/7aGr
         oM2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770887615; x=1771492415;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v52+nJkOYCsoxRiSmOJCpaAdmkTUJTGO81WVi4TlMMY=;
        b=FWaS7dQaZzl9lU99MmIna024XUHLCAy3ymd6wnubeM8gezTaMKybjA/+63flQ1YOyw
         +BE4m947Ho2glJL6eRB9ODItPhA2y0ViUFnjN05S7fnbeJodC9M1juQATRmNx5yKpN+C
         +0vN6uxWZt2hkOAp7l+bFZARikn2haaAwChYpbCVSYOYCnvPEZrFgsk/lHl6KfqJzFpB
         kODzgWKyFMvSX287rmEqHnvkMHHOAa4YQKa+M6j5G8NwOhpnpTBbvI+T4+ebe8QrcmcG
         o0KERe8ylUUiui1iR9tJ5nt0BhRbzjMq4rllcYsmm2O39spRO3O6Yyl8JTuVdF5g5swL
         qb8g==
X-Forwarded-Encrypted: i=1; AJvYcCXb0N7M5EKBP94AevTnCs3FzEkIFh0bMdwsQ6Wn76FfypXnVocaDdWINoUKPxgmU4hYL4M7Fg38xOk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrWO5qTT7P7pJYRThPFdI4JJwlaVletJ6cx5OtLfcce7/2BKqy
	mmP2uc4ZwU33hyg/u6s6vOfXlXR8JMhduW2EluIprroMx2jNQsPopt3Y
X-Gm-Gg: AZuq6aKg7+oF3sROnuSZJADpWB19neMWjfRWoa3nFBfikehftr54WE/K5t5VcJCZ80f
	EfuqE4hlkVG1s96eWW5B0BXHUlOFB82/sipyle5qQxZgqBbnvs84AJOBoFXVenLuxFbkKlT8iXF
	VrudQ6zDTv7kExKWObFhJyqyTd3RvtIJOzbY7ZSyCYUbHNbg7vfkk5YZhdWX++hPGMJnhno1kKo
	WM3aCWDxZ2+NblC9QQuRfE3Ei8z9np54Vg3JDFR9S/jyztBCXYB3lbC5trinibpDmq41reb2vgT
	hF1Hwolq9BtPa9nvZsT0GN2W/U+6YdeU06IrE9qdZ7uINccRzm/2tiHFw1HFfpNGa7exlNzeVrf
	50kc69E1+gTB/a2Evm/eTHhzhSyZc/OXjCpQ6/owm8CB8Y9GfYZ+2/sz+ei4PYYJieu4kPV15ar
	Si4tDqfkny3NuUxj4=
X-Received: by 2002:a05:600c:1d9a:b0:47d:6f12:de57 with SMTP id 5b1f17b1804b1-4836570b489mr15560455e9.4.1770887615033;
        Thu, 12 Feb 2026 01:13:35 -0800 (PST)
Received: from skbuf ([2a02:2f04:d501:d900:2f75:bf70:f0b9:4586])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4836131d52bsm34123735e9.28.2026.02.12.01.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 01:13:34 -0800 (PST)
Date: Thu, 12 Feb 2026 11:13:32 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
	linux-phy@lists.infradead.org
Subject: Re: [PATCH net-next] doc: generic phy: update generic PHY
 documentation
Message-ID: <20260212091332.qcpi3qyynmdp4acv@skbuf>
References: <E1vo0mF-00000007kbg-1OeA@rmk-PC.armlinux.org.uk>
 <20260211154839.lbh4uovxr5b5s4nv@skbuf>
 <E1vo0mF-00000007kbg-1OeA@rmk-PC.armlinux.org.uk>
 <20260211154839.lbh4uovxr5b5s4nv@skbuf>
 <aYzHL1qwew5p-xoq@shell.armlinux.org.uk>
 <aYzHL1qwew5p-xoq@shell.armlinux.org.uk>
 <20260211193006.ad2piivyoqhvg22r@skbuf>
 <aYznE1FIbs_0OcPR@shell.armlinux.org.uk>
 <aY1hs4XKZSpvKd3B@vaman>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aY1hs4XKZSpvKd3B@vaman>

On Thu, Feb 12, 2026 at 10:44:27AM +0530, Vinod Koul wrote:
> Lets document that call order is immaterial and driver is expected to
> work both ways? As I said earlier logically people would set things up
> and power up, and on the fly mode changes can be handled internally in
> the driver by doing off-set-on dance.

FWIW, I already started telling people during review to not rely on call
order:
https://lore.kernel.org/linux-phy/20260210193516.temrg46yozxma7xb@skbuf

I don't mind continuing to scan for this in new submissions. Then, only
the topic of existing drivers remains to be resolved.

> Thinking out loud, we can also move this into framework and ensure when
> modes are set, we do off-set-on dance so that onus on providers is
> removed. Moving into fwk might expose some bugs in drivers though...
> 
> One thing I agree is that we should have consistency. How we drive that
> can be agreed upon.
> 
> Thanks
> -- 
> ~Vinod

I kind of like the fact that the framework doesn't have power vs mode
assumptions built in.

Also thinking out loud, we could do something else - introduce something
similar in spirit to CONFIG_DEBUG_TEST_DRIVER_REMOVE, which would be a
debug option that sees what power state the PHY is in during the
phy_set_mode_ext() call, flips it before calling ->set_mode() (calling
either ->power_on() or ->power_off()), and restores it after the call.

Having this option should also give PHY provider developers a quick way
of testing both calling orders without modifying the consumers.
