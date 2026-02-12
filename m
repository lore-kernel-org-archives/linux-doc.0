Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F1223F424
	for <linux-doc@vger.kernel.org>; Thu, 12 Feb 2026 10:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770892689; cv=none; b=FWOU98iSBGf0ehFaGWbJjsvFNVc7NixOs0zzJHhjo6aDCuzBQkDZKZflkpe3TWWekBKVSpqzGsNsXU08d4BmeiQhOtIV4WEVV+evsFxYjk8laQzFS/u3vVgkare5wbIXauZWrpLbcTl8ka/9J+O3RQbKDVzDXSnUlIV8AUdILx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770892689; c=relaxed/simple;
	bh=YMSEKQ20QRpw7d3IGth6vDRvfP4mhaig8cgdZ4qypig=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SCuDBLXhP7mdcK+YXjYbHr5yrLK1DPjgjdVPQ6L/2ZE5p56R7XHeec1YENtZIwWdlg/45LlxClBkFwl7ZQZI+0I7y/wr3sgxoydY/8RMXpCaRc90wVar729gzUzTCOgEz1D9tKobT+rzMXWrYc/yHWQ8hxze4pBZU3ZR1KtOORM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SvMbxJRT; arc=none smtp.client-ip=209.85.221.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SvMbxJRT"
Received: by mail-wr1-f66.google.com with SMTP id ffacd0b85a97d-436333dcc42so686962f8f.0
        for <linux-doc@vger.kernel.org>; Thu, 12 Feb 2026 02:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770892687; x=1771497487; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EHvH2NxXNZ50ASeOsz2aD1KixOOY7ZptsiQm52Vzawc=;
        b=SvMbxJRTAM8pM8Xh7BPkAb6zzJ2tK4F1m0N+JB9HJTR5ESqkb++/RuNEuaWRxCfatV
         /Lj4R6M27z4GcvfUd4BJwkshCVGDZZbP2g3ZCraofxRZElrydvrWpsxXDFmp0pc4zyLF
         YNdZ9sCfbDDO/X3BsTVe/umJn3fNORa86vwl5/H9mYSixvBO0IM1u4Pm/v7Bilez+fCy
         UKIOBc48SRcMyi61csAf4+HEtZfnwjKirlLa6gqRUD3HS5NhzsIti2ZwO6n7EIBaz0A9
         eIexMUCKLoz1qEAu6+e5c4nmA+EZvcBKmu50tFBbFO+mkOW2HdeKfYJ5exXOw1apa2L+
         dGgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770892687; x=1771497487;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EHvH2NxXNZ50ASeOsz2aD1KixOOY7ZptsiQm52Vzawc=;
        b=ivE7MzH4vXuDvo/5rpTdH/92ESxp5WWw3urjIcF2DcVW8Qmjj5UiugJzbIbpj3jz7G
         xrCQLfLSGg1/OXnYwArVYYe0wdYJDZJCNvL09blIkWwP/ZrPY6NzbA2p6Etjz0QeOdbL
         XCfQgQPBW7ilXsn+mS4aRadDVdEKelioLeS+R2rjujpKW6wlTZFF2fb3ZeGAxBgIVx5c
         s3RvKrBXLlPSMXAJhv3elFpfcDpPI5uyIyCeQ5xCyjg6nhV8yzdJF5FrKyhX3K0AfS5t
         gQnoTrpeye+QnaWfFj2+qVhGjDjGaR/spZ1frZD4FrP/FtmyK/NFYf2EiLN5jlCxqhGS
         CuUg==
X-Forwarded-Encrypted: i=1; AJvYcCXXjE97OJqtgo7fwH6fKyEfryXSW34VyM9ghHtMGHuwqGDc5cdJ67LpLj0S6yXhh0hO+V+vvbYutXs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyjbs1FsbNIk2F3ljDtywKl6Oqo3jsbly/pfN7AmaAnTqYBqRsY
	H4FuCp9guj9JlnggUZdozuKGRwe24KSzp2wO5p/m9GIhCDq/VfVy8qmm
X-Gm-Gg: AZuq6aKMaW7+t7AAsLU9xB0yYzlo4PoYCwv4Wr/h4ZOskjCKEbmEZB3vJocPKWJ2l9J
	Z5mdMPDs58ZF0z9kzyCrKIV7Eukk8jFt7r7/Iw6lXeQUSDnOOZvthrvWqvJ55hPunw/ZQFX1Sf6
	2ToyV9JEffa3+La2evnZWryYz8tY1Lry1haIsCdGZGYJBVZ4HoepzaWs0W2fUGZ95r5nLnWGl9A
	bcxLgmAyxRRtgFdddiVaH6503xBRGo+Ag3Fc2oRoCjmXiNxvnEamITv3YnVrlsIqFMEgrOFBB1D
	pSveCuHFCavj4dgFMkQ/L10ru3/Ualmfyna9rIEvE0tAuLqfWkXMLx+Ytwcu/UoBYlzfBaMvYMQ
	Dh1hIuOxsjIcxpaG6p46b79HrYhKXVUOk2SDwDV0ZHbYXu2L4RKvyMO2Fi4w1Rc1dHFbIqpQJc1
	873PRNAyOUALeuPto=
X-Received: by 2002:a05:600c:c16f:b0:477:9dd9:ac57 with SMTP id 5b1f17b1804b1-4836561a23bmr17586025e9.0.1770892686309;
        Thu, 12 Feb 2026 02:38:06 -0800 (PST)
Received: from skbuf ([2a02:2f04:d501:d900:2f75:bf70:f0b9:4586])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d835f6bsm167527835e9.14.2026.02.12.02.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 02:38:05 -0800 (PST)
Date: Thu, 12 Feb 2026 12:38:03 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
	linux-phy@lists.infradead.org
Subject: Re: [PATCH net-next] doc: generic phy: update generic PHY
 documentation
Message-ID: <20260212103803.xut4sjbypgb26mo4@skbuf>
References: <20260211154839.lbh4uovxr5b5s4nv@skbuf>
 <E1vo0mF-00000007kbg-1OeA@rmk-PC.armlinux.org.uk>
 <20260211154839.lbh4uovxr5b5s4nv@skbuf>
 <aYzHL1qwew5p-xoq@shell.armlinux.org.uk>
 <aYzHL1qwew5p-xoq@shell.armlinux.org.uk>
 <20260211193006.ad2piivyoqhvg22r@skbuf>
 <aYznE1FIbs_0OcPR@shell.armlinux.org.uk>
 <aY1hs4XKZSpvKd3B@vaman>
 <20260212091332.qcpi3qyynmdp4acv@skbuf>
 <aY2lFTIALH7qEJmM@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aY2lFTIALH7qEJmM@shell.armlinux.org.uk>

On Thu, Feb 12, 2026 at 10:01:57AM +0000, Russell King (Oracle) wrote:
> I'm also going to point out that phy-core allows ->set_mode() to be
> unimplemented, yet the phy_mode is stored. It looks to me like this is
> intentional part of the API, which means that phy_set_mode*() is not
> expected to always result in the hardware being programmed. That
> brings up the obvious question: if phy_set_mode() is not expected to
> always reprogram the hardware, then what phy API call should follow
> this to ensure the hardware is reprogrammed.
> 
> On the other hand, if the API intention was that ->set_mode() must be
> implemented if phy_set_mode*() is to be accepted, then surely
> phy_set_mode_ext() should be checking that phy->ops->set_mode exists,
> and returning -EOPNOTSUPP if it doesn't.

This is a relatively new development.

commit d58c04e305afbaa9dda7969151f06c4efe2c98b0
Author: Dmitry Baryshkov <lumag@kernel.org>
Date:   Sun Feb 9 14:31:45 2025 +0200

    phy: core: don't require set_mode() callback for phy_get_mode() to work

    As reported by Damon Ding, the phy_get_mode() call doesn't work as
    expected unless the PHY driver has a .set_mode() call. This prompts PHY
    drivers to have empty stubs for .set_mode() for the sake of being able
    to get the mode.

    Make .set_mode() callback truly optional and update PHY's mode even if
    it there is none.

    Cc: Damon Ding <damon.ding@rock-chips.com>
    Link: https://lore.kernel.org/r/96f8310f-93f1-4bcb-8637-137e1159ff83@rock-chips.com
    Tested-by: Damon Ding <damon.ding@rock-chips.com>
    Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
    Link: https://lore.kernel.org/r/20250209-phy-fix-set-moe-v2-1-76e248503856@linaro.org
    Signed-off-by: Vinod Koul <vkoul@kernel.org>

If only lore.kernel.org wasn't down, so I could see the back story in
the link...
