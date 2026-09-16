Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E44A44AF9D7
	for <linux-doc@vger.kernel.org>; Wed, 16 Sep 2026 21:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789595842; cv=none; b=DPzeIsYOQS9W8iJ79uI728iOxYBvk3xffzenW/aDU8OtkoR4qt7TC+AT/E8RR7ygzplp5kdramHF4rwjwOIGbbBGTYkDTNn8cT/iHuhKUR2wF8rYsk8DYEVzyakHerQI6XLitUry07iHr9SYQz4t/HCwlWgJNaUuHcZGOxDApbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789595842; c=relaxed/simple;
	bh=r2huojaIA0LnZu4Tl80T3zwgfYPivrD9nPSDp+67hkY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qkfyydRzaX/aHu+V0hSuGse7KoN16Ku6+QZDNTkrfej1HQlZSbew3KRi5ki526/YvxPdVVDSWrspFlr1KlRWM7WPaO99SYCE/4eKEOK28cmDx7iPA3p75SvUub1lFeWP9dTQhSn6GUlK1v74YpUYtLHrBitRBSqa0q96sSm4wJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IWUNV5Nx; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IWUNV5Nx"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49fbca514f8so451535e9.2
        for <linux-doc@vger.kernel.org>; Wed, 16 Sep 2026 14:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789595829; x=1790200629; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mpm+rXQ1nRbGhGlarYrHhDYEJtHCvYuH4SNSCHxwBYg=;
        b=IWUNV5Nxlbcs8aA7X5OjQ2vQad3/VDLyoPXltbPPFo8IoA3BbLuO8UQ6d5N9MnD/i0
         6WvGBwOmiNZOBOsl5z4ypzAsPtr5OVaE3VTss70oegwJgjuHlJTmNCVg2OQoIydbyYKC
         KNHt0EiPOOpD5agUGw44EHmX2NAtGeOov6MuDp0T53nQAY/BV681j/IofRzgH047Y00t
         j//FcJDnJOIkvjW8aoVssTL3pX3lKI9IEGUNydyU2hJogAqGXdcSnsBDjaNFDs6LGHxJ
         b1yIix9/JYMLp99YDKFBsZ/LFIauNlCjZvWeTJRDzIGwScyOv6uho/5uo2k4/DAifXiZ
         bMIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789595829; x=1790200629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mpm+rXQ1nRbGhGlarYrHhDYEJtHCvYuH4SNSCHxwBYg=;
        b=pR4S7q/SXN8V4VuZVJO3ZVEpucoMRW1XkousQeZh6TaenGVETQLnBgfoqiN8DJPoHY
         pa3CEHGkD+L6lsXi1DI8ZILT248t1Aq1yaYEdvh+mXFD2UQ97uE3IjDs07gEd+5BD20u
         +b+hEEvGlUU686fTNTqwbmYcpX6u6uU64AK9Ie8fCOLVp2Tf7k/oipPtfUi3S5yPYyzm
         5phLNYiSn+DR2TTNh0bPTMnmW2+XL9alJrDmFM4avgl9MOt77dl4DO3k/PxRK3rVV37x
         DXXqSS3RQpHCk9dWF4ddmzCyh1I0pRI4sk7RaJ9HW6JqV2kQyf3abiFNyqePslWj3FAe
         ZLoQ==
X-Gm-Message-State: AFuF++m35DK/3YTlIAv8RkZYsEEbTDNZk+yPFKNrYa2O22Z0yfYyCjRZ
	PtH4xJa+AFtAR2NNw4ut5ykSZsh5FZDJK8ctkvUPcbplDptAwWHzL7yM
X-Gm-Gg: AYBFou3H7kBKyfttiOqy5lWPZ4wzGnBu/sfECMG/kiwiZ6PSWzhd/rcKPC+lbvAgyaX
	xgRvN4nwTVlk2b4Fm5ulApC2nesP+LhcKNAbZmSR1Ex2V8jSCF8iIPFXpeWnP/MwlrberrKugdi
	xlxOmCgM/TYjYEI94cYJ2BLJX5LU6AyQzKmAD7A7Ou2xXj6lVPoh17/l904bh0byRpp0l34CXW/
	eevjxZr1WYkqxpOeA0u9AbJwt6mvfQ5aWL0KsEu1TnI717hN52fdT9dJcZj3c9lUJ/Byf5RneSg
	4rZhfK+Ps8eyocK3YCVuw0ByhaADBLP8+OjVIEblBbx7Zv+qYjwBH925nny9qr9vJaQcRGGYS9T
	QkldtCiyWdDKgHYecruznM2KQhtXHnlXCZ7ViLB1WrPjHxJNv+II0VWhl+aeiZJ0pF+nmxkXntc
	jgzHnWCnRwel3CFeLilDqQ9itU9hAsEONRMFFMypgOSq2VZ6VJt1/q2sLGxiwvF6MctlzZ+XxAI
	v3RzR9o24LRQRRFj50=
X-Received: by 2002:a05:600c:3492:b0:49e:7c8b:fdef with SMTP id 5b1f17b1804b1-49eb7329b2emr42924465e9.2.1789595828416;
        Wed, 16 Sep 2026 14:57:08 -0700 (PDT)
Received: from Nuel20.localdomain ([105.118.73.8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd247809sm35546005e9.11.2026.09.16.14.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 14:57:07 -0700 (PDT)
From: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
To: rdunlap@infradead.org
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	intel-wired-lan@lists.osuosl.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	mchehab@kernel.org,
	aleksander.lobakin@intel.com,
	aleksandr.loktionov@intel.com,
	tudor.ambarus@linaro.org,
	bvanassche@acm.org,
	emmaonana18@gmail.com
Subject: Re: [PATCH v2] docs: kdoc: fix struct_group_tagged() parsing regression
Date: Wed, 16 Sep 2026 22:56:46 +0100
Message-ID: <20260916215646.23185-1-emmaonana18@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <f0591ce9-2e8f-4777-90ab-b9159b7d8f20@infradead.org>
References: <f0591ce9-2e8f-4777-90ab-b9159b7d8f20@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Randy,

Yes, that was a mistake. 

I have now sent a corrected v2.

Thanks,
Onana
