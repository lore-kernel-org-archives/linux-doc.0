Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE1522DF99
	for <linux-doc@vger.kernel.org>; Sat, 18 Oct 2025 12:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760791819; cv=none; b=NiK8wFa3d/j22WLIppui8R8wIKtHZbinU6vZFp9lgop25guA03S/mu5XI2xQa79WF3ltcsqtHwNDAdPS5DT6EwHv+u3X0WBqdbFFbffouAhAgEpKY4up3GP9SETjqbqR7vFAQBusBndshaELrMYp1975YwKjAzEU9qvFeH07Jds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760791819; c=relaxed/simple;
	bh=JOhRgmB3DaDqj/0okhYJAPGij+Zt4PIUmY8n5GbX1DE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RG2i80suKD8N6wIopynaj2I9b4dKTB3ihrEreMdtTr1GJSnC3I88w+hvWeJy775+iHuFeAiUF0xU6Qa9H3o5r5KoCip0f6Sfoh1hQUpnXLH1VCAZPizwRLUid63NDjOwBfsiiOhhwb2FXK4Gvm3+SJ/koLwLRd8hjhxBH/8cBlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fw3zI/Sq; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fw3zI/Sq"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b67ae7e76abso2109383a12.3
        for <linux-doc@vger.kernel.org>; Sat, 18 Oct 2025 05:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760791818; x=1761396618; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sYQhiSmjIKAg9JpgY81CKHBnsaXySUjIdDWp5EpwSqw=;
        b=Fw3zI/SqZl3cgkqNzT+1oKFCWSaZs0qCgrtmcTIf4oFqdwfqkpDA5qE8cQ5UNcsO7G
         JZF9MZZVUCkJtJSVtJs3mNHtVYbww1Mte06xUIRDmKtW7nV6VG+WcY7G9xxYjjlg69RO
         BkAJGIy1q1yrJ3syx6Yh0kFAUFiInDS5jVebibMC4xt8XAXaL8WmF1DjZfyD3Wy4jy6P
         G6Q+5QUHhToUmTxucWJgHbX7Gtt9HdRVugT3naKFELJaE4bl2qLAJgDX6g1cagCsySxw
         fzP/aVWR6UcRy9bRbD5jsutsth027K529KIPb/FYgXZTIC9UBwuh/dz4EsExo7uzM8hE
         fUvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760791818; x=1761396618;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sYQhiSmjIKAg9JpgY81CKHBnsaXySUjIdDWp5EpwSqw=;
        b=g88QOwaKQ3iSWEXPIaKZ1vnJ1NuoLRNrBRsqOrCqneLOVRxDWXsGbTIHEMRnk+mms6
         ojTETvbc+0pu6RYiugwwbM4E05ulweVZZZs29hHG/KKUe5Aqu6NUJ+SGQbm56g6V059X
         PQN7NTF+2QDkQxFe16Gdw9y+YS7RQVwJ5emHeWf5auIuLzFX7Xc0d+eL4dtEMz5XUiC5
         BLEKrBG70X7uLfr+QzbA7OJCEYXbjekEGGykyI2JxaJUe+q654bJ66rv/CpB2bgQMkCU
         TW+zh/L3dehIlENECtnWJmORNbmUDaMywsm7v/P+j3rZRVkq46kCQZExFCj7DBVI905K
         jS2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWE0IX/gp7VmJPo3H1tZ1OnjLQRSMIwrevAYjPNAxFIfumA2G/G5IrvlW25XVA8BmnjjIEumpKYr78=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBxUppjIk75QyUjJCx4HfWoAzTwjWET4SXdgoPxCM1HyMRAkCd
	crXI8IGeK8LdSnqgZW+/Wf/Bnr0/qLCYYJJ7wbQxlh+cjs+xX8K3vlHv
X-Gm-Gg: ASbGncsAHNoB93JLtyjDFrA8n6P69Ak/6PWB7JYLiYpcLneeDLvlStx8cuApCzfZX/X
	3vkEcAZuWaEb8n2nf/zr/RFqvf8jdAmRne/c3uSLpFMcf8It2TCtRL5NC43gyRVthJIsyH/vyiF
	yMq72HoASprGEzph/VHgGBcI9EA98q3pMzlueLpR6u0Y7XHBOaKxsAbeR2Oa1xd22ksoiKz+7Zd
	ZWjdH0Mbz8w3aOb6T+WDqKeIc+K0CTUnl8uGs6AhYfvEtpxnwVtC9fe4LOwjY1Kzl0dblAIiNG6
	W6qWmbTlf8kQbzQqlQgDxq/VvGJQarjdo+wxXz7Yo3SUMLsBqMnTkBP7CX4IuHA+TarMw5yl91W
	mQV1kDC3yYQg2ElkeN5/ZNUVzGktGz+5t6vEenzCIjK6d5dH2PuCxh9AbUHgSB4nflC31izqRsT
	mLbN9c6FF5leBy36Avji1fI9Bwd2nJKrSgRA==
X-Google-Smtp-Source: AGHT+IFp+N9rk211Uet/daZeKCeaXRrs242HKJkWvO8lWmZmRSdRDNcuzgrJxXar0a7TiUsx8ojtlw==
X-Received: by 2002:a17:903:2b06:b0:272:f9c3:31fb with SMTP id d9443c01a7336-290cba4dbb5mr86424535ad.58.1760791817569;
        Sat, 18 Oct 2025 05:50:17 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-292471fdcf9sm25575825ad.91.2025.10.18.05.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Oct 2025 05:50:17 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 18 Oct 2025 05:50:15 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Ankan Biswas <spyjetfayed@gmail.com>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, khalid@kernel.org,
	david.hunter.linux@gmail.com, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH v2 2/3] Add missing datasheet links for Maxim chips
Message-ID: <6e12dd80-e02f-42cb-848b-6c79378e25ad@roeck-us.net>
References: <20251017105740.17646-1-spyjetfayed@gmail.com>
 <20251017161422.4404-1-spyjetfayed@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251017161422.4404-1-spyjetfayed@gmail.com>

On Fri, Oct 17, 2025 at 09:38:05PM +0530, Ankan Biswas wrote:
> In 2021, Maxim Integrated was acquired by Analog Devices.
> maxim-ic.com & maximintegrated.com links redirect to analog.com.
> 
> Missing datasheets now available at Analog Devices added.
> 
> Signed-off-by: Ankan Biswas <spyjetfayed@gmail.com>

Applied.

Thanks,
Guenter
