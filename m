Received: from mail-ed2-f17.google.com (mail-ed2-f17.google.com [74.125.228.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B690A49B464
	for <linux-doc@vger.kernel.org>; Thu, 17 Sep 2026 08:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789634938; cv=none; b=hIm2TQK/eI7nERm0mtYd4+Y2wfFrpmJtC5GK+DZCHSFlffbBRzeXrs6fkBzu9rTH3DLAbXkcmi8yXEPfwNefY5MbBMZyTkRU4xx6b2ZbVIVQHFhVOsnntEA7i8COLGi8EfZO4OqqLJD/YfSrBRw04tbdxrfDtNBlfAsa4/vmmT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789634938; c=relaxed/simple;
	bh=mOJQt2vsWvrLdsJ2aAlHSWLo42eJ2H0/jIjEjOIaHAE=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-Version:Content-Type; b=ShJL3yDn2FsfYMj8DbSBEerDgEl6efRFlrD4piyXqExeW/wdZCmBv1qUerqUeHIjPCM5Roh2IPnBSMds0KB8AL1KI659XxogTGQFPbaqOg3SZXAyj5jXaPwdkqfo99GuLdyNmGRQZZIAzgG8Q5H9FQJBh4NrrRNV7+YW3heOw3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z4t42vmb; arc=none smtp.client-ip=74.125.228.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z4t42vmb"
Received: by mail-ed2-f17.google.com with SMTP id 4fb4d7f45d1cf-6a9dfe4dfc0so950618a12.0
        for <linux-doc@vger.kernel.org>; Thu, 17 Sep 2026 01:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789634920; x=1790239720; darn=vger.kernel.org;
        h=content-type:mime-version:user-agent:references:message-id:date
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mOJQt2vsWvrLdsJ2aAlHSWLo42eJ2H0/jIjEjOIaHAE=;
        b=Z4t42vmb92hSSVClm8ybubh8P4qrx+xmGFBUExvsKVsFgomiSLtdosDxVHrRP1nMzG
         /+Mb/Ng6okHzVpJ93bmULRZBMRqLWziVE2eWt44+mwkqvyOsGgm3i0gqUg3hX65dLPNW
         M5WCIrqeEEXU3RZDZupJBz9ns9Shlxw6Ju0hjCH+Ne8AZJzKx/h5B5J9t/GJS18EnYdz
         NokKJ6MuExf5OagnCjBdKEZXMoCdI5Z83ulJao3dE7KbAzImOBPO+ykKBOJh3bP52SQp
         zGTYWxY5ltlQvIFyNjxFA2yAqhu9WGvEvEzwLkmxLr+voWXww/JcogY0T256VHk9E0Dm
         aYHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789634920; x=1790239720;
        h=content-type:mime-version:user-agent:references:message-id:date
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=mOJQt2vsWvrLdsJ2aAlHSWLo42eJ2H0/jIjEjOIaHAE=;
        b=IS+ZlLfldAAEKzkSodhBrk7ZkpVk+8YUM6XCQd1hszBFwYudNYWsoF0nyi0vFMp4hz
         Li1x36FRQbpbj9nBmYPVCh10jmwV+nMAndeJdaH7roVPNVNr8a7xXEQygffHwGE3sEc6
         vxXPIgsFJcq0XIdKBAFr1IreYImRGb8WWSUsybEsbjzdeHKdRJy2o4fFLPDa9+f8RWzr
         f3+l+uDyrXUhPPJCj+hzDekMjUjnNIpEkjJWvEs0c+1KRW0NGTVoPjerdhUKRwsGzkbB
         6H5qnxkP+rCGQt7L4PlQ7zcseag36a3JNlCGamt9ZwAcnVtXVPj52mmjcH7UfDxkQbR1
         9whA==
X-Forwarded-Encrypted: i=1; AKwUvBxI2q71xrdwKOCIYOFMs6jZg/FhvklA2uGIBRGZNJikhDytYmyxlMavu39TiK3DO5+FHWvP3UMrx5s=@vger.kernel.org
X-Gm-Message-State: AFuF++mBV5gy1C+XF9VxZZxqmIkYHciEqqPlSIcftvMIIPldjb9DqFYo
	x6h2SVBRxNgZFPWj3wES2Pojbccv2DsA234/Apw/Tlb9OV0nor/HDTv9EQbQ1w==
X-Gm-Gg: AYBFou2LmM1dvCXrTyxo9PaQhc2e7M0c/8Xdmjpe5mnvQ4KDs5+ut6f7OhphKy8RMt3
	EvPvOg/+EjEwkNDDrONQQK21kMW0XUs6mGIG/h6/EASk9BoD3GDkOyXMT5Px1cPM2HZJa3QfEbF
	PV89zmRDhSGUFeXsMWjzCseE3g9pH0kQumvFK48bnFjkO/GmZhW+FOJaJPP/GjPrNOyVeck9Hms
	jFQdrLnmlgH3MHbybshmaP4tkZi92nl0HsCwNh9dhzqS1n5D5wxNUGl1761oD78SeKqX0vJyf8L
	jT6vRZ9jDdozVjYPo8ZOETnspv4cjBeaghuu/Yb92TzqhbDLRCh4SGHEpSnmc7AHJuIyQTSXimR
	gxqSXQ9iD47ZCOTtaFT3ix4Fse0+wO4hi16tt8yj/gnIQKFJtvM/+XES3TmqektdddjMZlnclpY
	7IUoucM+ZhiHTFwxG5moy+yXIMfmnrUA6Fi0EjcV4e879CW/6GSzCWzJagCi47P5/Put60qOOUH
	LtIV5XP
X-Received: by 2002:a17:907:1c91:b0:c25:2cbe:edeb with SMTP id a640c23a62f3a-c29e521b5bcmr397397166b.21.1789634919601;
        Thu, 17 Sep 2026 01:48:39 -0700 (PDT)
Received: from imac ([150.228.9.167])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de68fdbcsm245938866b.59.2026.09.17.01.48.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 01:48:38 -0700 (PDT)
From: Donald Hunter <donald.hunter@gmail.com>
To: Ayananta Paul <ayanantapaul@gmail.com>
Cc: kuba@kernel.org,  davem@davemloft.net,  edumazet@google.com,
  pabeni@redhat.com,  horms@kernel.org,  netdev@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-doc@vger.kernel.org
Subject: Re: [PATCH] Documentation: netlink: fix spelling in tcp_metrics.yaml
In-Reply-To: <20260729034147.6970-1-ayanantapaul@gmail.com>
Date: Wed, 29 Jul 2026 10:27:21 +0100
Message-ID: <m2cxw6i1s6.fsf@gmail.com>
References: <20260729034147.6970-1-ayanantapaul@gmail.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Ayananta Paul <ayanantapaul@gmail.com> writes:

> Correct the spelling of "reordering" which was incorrectly
> written as "reodering" on lines 113 and 115.
>
> Issues identified using `codespell -D - -S "*.bin,*.o,*.a,*.so,*.ko,*.gz,*.png,*.jpg" Documentation/`
>
> Signed-off-by: Ayananta Paul <ayanantapaul@gmail.com>

Reviewed-by: Donald Hunter <donald.hunter@gmail.com>
