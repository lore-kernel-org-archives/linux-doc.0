Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD278282F0A
	for <linux-doc@vger.kernel.org>; Fri, 11 Sep 2026 00:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789088319; cv=none; b=kQGDYHu+cX8lHD7sRWfx/SS2xsz3O8tVMDexj9h2rWEWyrO2nO/MyLHimwska+eWRYYSGq0SbLMXTgsIpnvsCXOqGXDbZSAPdT7LCCqQz3ZphXhf9FzoI/TgVqbJK2WIOHaesFnF0NmADZe51iT0pfbAXXSHLHNp1EwXrqtvLeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789088319; c=relaxed/simple;
	bh=A265HADcB7R78V4B7WaaMJOPNRhCgF3KC+2zEGVJfuc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qvKgbIT0+damsNrsXFOIcSI15a+h1x2iIULjNPeMgf9mee2+a/m1n//QoYu9GV3X6/1n9/Ag1Uf46ZnVgal9L5+uJczExQHUciP69hq+diBh7M2D9IB3tqzG1URFb6cyhbT/TQTPl4PmFcyDw3Q3b5n80VjomY8NtJILzvxOe3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AO+9+bOA; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AO+9+bOA"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2d8f265cbe6so3331855ad.0
        for <linux-doc@vger.kernel.org>; Thu, 10 Sep 2026 17:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789088317; x=1789693117; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3zf8XnoSX09VWqI6ohFXF2kiQZv/9kfAXq5rTnrECXk=;
        b=AO+9+bOAKW+LuY+ctXvo42bX1umc8OwZPhpPtWQJnvdZ0j+Yov/S6HerXDbdEx+Ov4
         Cwf1+YqPvnnudxZFAm4+IP7raj0vJTnxryHHzpNeSeCqaJXHvo5inrydNSym4BXgxOuV
         c2iH1rdB+WyDcKtQpEGZAYa67hHfvN0DtkO0mROQNQGYnDpcaqWFDcXAjENzLBjSrycv
         pZOyMqYy/M8C0QQzcQYOIyRYj0hGHwuUPjeAZJOx29zwcAn8jLEJbH3Co8NdehdJ55Od
         bpN7f7KGHiCqqdNCAZRuGG+9gKd/ourcBvEO3xTP2eU1G5gk6vJQzmLqOu7xKiGQyonA
         1XwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789088317; x=1789693117;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3zf8XnoSX09VWqI6ohFXF2kiQZv/9kfAXq5rTnrECXk=;
        b=UyC0a8tZnXCXiL6tZ9C8+YgKq08Zz8SBxk4OkigrAHSDT8d5QT5/AkiB0Ot3IQK1Pd
         RMZT/wbnG/V2w37u3O0wyizGMEipC35jlRvHy+VYIAL/iAXGxj/3MF6L9ejuXocWXJzg
         hG3HVVv2PHcrQ1GMAbuwF9tpjNdz6XUO4bnrfxt3mTzozim344H7MrPMy56o72SAD/Hn
         vli/6/sNhGN1L2ut4BHNvnvPXpRkiGn5kpehLfxr3jOhmkSLRKTbjtDQGm1ylX02D/M8
         D/tKZfGRSxp5+hv5m3y84zd9H4Wqcpue8OmmZqOBIZUh+dQW716yZMO4Jae3JEAndkJZ
         0UMg==
X-Forwarded-Encrypted: i=1; AKwUvBwxw/Flfw9dEVreU8sPaDsB/x8mgJk+d+Vmk0+HmCqudeihvJfLrfSkQe+Ebmm0hWenw1XWMxqC/2Y=@vger.kernel.org
X-Gm-Message-State: AFuF++lag2URirHgHNLpfocvQSdkz3oi2HfuEWXSV6/7MoWSmozf2OuN
	4LdeIsHgC6cbjww7l5Vq7azqwWeQWRAipJDmzfNP/1U/igpuFjxmfx0v
X-Gm-Gg: AYBFou0I2pVzVD6XmgWEutGNV4htE83yoMIXVn3WRVldShTPZEu7p0gqAUam2rp/x+n
	MeR10v1j5odWuv5t4CSgoXH9Vec7qAPq7+rXOPHvW71iyR6cS56dYuM86OHFJpfZ+uYHkklx/v2
	hhqxFkdqcc9zcOERHyB0gUythXQwiCxkFUeYXIcFDMgQa2FIvjWfVAWshivrBuevNlwu0ugr6GP
	4z11Rwbvz1p2hqZJiic6oiMVdqR0KWh0sQvZkw7WppGS24Fqjjar+IOK7Y0Iil3KS1CIKa5FBax
	ZEYSTL+SDQFtLdtYS/xuYkskcebsopdDuwR8vrE5acwS90bKu6JRlvE3s0QBGpHwJ+7LO6wKVbm
	QUAZbZXtus53BGizqSZQUgGQBJueQMfFbIPGnPaSJOCPzXNbo5D00TRR84ry7EzTWEUqj5ZuNwT
	mgOc3G7eGlHxVtTC/TJwZRXDydp+xhyN9Ll4PLVz1IiyZSV44027sscZitBfaFjIN9EFk2k7qTN
	mqzm9RYMupW
X-Received: by 2002:a17:90a:fc48:b0:39a:e983:d4bd with SMTP id 98e67ed59e1d1-39d9c3527b5mr2180437a91.24.1789088317108;
        Thu, 10 Sep 2026 17:58:37 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b8f1f7sm1919922c88.11.2026.09.10.17.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 17:58:36 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 10 Sep 2026 17:58:35 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Thomas Richard (congatec GmbH)" <thomas.richard@bootlin.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Werner Gartner <Werner.Gartner@congatec.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, stable@kernel.org
Subject: Re: [PATCH 1/2] hwmon: (cgbc-hwmon): Fix current sensors ID lookup
Message-ID: <b7a59fe6-f8a9-49ae-bbff-c3785dc19ecd@roeck-us.net>
References: <20260910-cgbc-hwmon-fix-and-new-sensors-v1-0-ef13ae2fa147@bootlin.com>
 <20260910-cgbc-hwmon-fix-and-new-sensors-v1-1-ef13ae2fa147@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910-cgbc-hwmon-fix-and-new-sensors-v1-1-ef13ae2fa147@bootlin.com>

On Thu, Sep 10, 2026 at 03:28:21PM +0200, Thomas Richard (congatec GmbH) wrote:
> Current sensors on the Congatec Board Controller don't use consecutive IDs,
> unlike other sensor types (voltage, temperature, fan). The driver assumed
> consecutive IDs and performed a simple lookup, which caused an unknown
> sensor warning. Define current sensor IDs explicitly.
> 
> Changes the warning on conga-SA7 (type and channel are correct now).
> Before:
>   Board Controller returned an unknown sensor (type=2, channel=17), ignore it
> After:
>   Board Controller returned an unknown sensor (bc_type=1, bc_id=11), ignore it
> 
> Cc: stable@kernel.org
> Fixes: 08ebc9def79f ("hwmon: Add Congatec Board Controller monitoring driver")
> Signed-off-by: Thomas Richard (congatec GmbH) <thomas.richard@bootlin.com>

Applied.

Thanks,
Guenter
