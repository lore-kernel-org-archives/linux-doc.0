Received: from mail-pz2-f32.google.com (mail-pz2-f32.google.com [74.125.228.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6DD93E0230
	for <linux-doc@vger.kernel.org>; Wed, 16 Sep 2026 17:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789581597; cv=none; b=sCV3XbEV5J//qnims6tKbjLsnse38x9f0H0aLLingef7/z3pd8Mi9n5xR5T0FGkmPLcY/9bht8l3y63vvGTbIF1tcNvRnBHtJpy2H23BjC4e33cO/5hL8mPNinBQANfbZEI4qM1wY+SoaaHXxC44fwE+5oXlMGMkLeJRTTalBJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789581597; c=relaxed/simple;
	bh=UhfkSWBEIWzdAe0+wWGogj/0ppyAnsI8r+XgL3qtEFM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RLQKEij4MMMbjgWU8vI/rCwEE9kh698uYv1G+k4FY5RNejW8jO0OH9Z1Ma5prXQf8No8DaKbPxL5dFKh9/HTgEDvIQ50mJk+R8yC0//PZyhEZsAF86CMrH2zCEO7yWi+LY3u8zq9GVHxaWzsCdVWes5eTMx1IvFWAIu93AAABgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NJxf/+gC; arc=none smtp.client-ip=74.125.228.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NJxf/+gC"
Received: by mail-pz2-f32.google.com with SMTP id 41be03b00d2f7-cc4d04d73b8so984842a12.1
        for <linux-doc@vger.kernel.org>; Wed, 16 Sep 2026 10:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789581588; x=1790186388; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TUanCZUnYDp7fC6sIRvl/mkL+Nam5P8R5i++JsfjtEI=;
        b=NJxf/+gC9p36SJJ/hKwDKPFkdQLU2JVM2dJEhwQAvUnhuLc3NS4X1H1o3la5ZFhSnQ
         +mkCxtnlsj8PTFX4c5zHUbETHBB1OnUO29jgWYTCzKphyXwGlbKTo/RTxeG5NXsuorBH
         ieDjLanFgBqwt9GsLUojowAXQo0ArjoYjfds+zqUyNisJtvjXCVH4MkbZXinrpaGl/uV
         SnRBlobGN9vP/MMXcHg8Py8LMCqTzlu2jUDS3y+CKzV7KPb0EeXIKndLJDXyVrv7hku+
         tWtbWBNHG0J61fy8chJ+Cvwh4YN2QWfn5WFWfBu6zf2Kl3GD/RgIX69tsqvom1UYcJKi
         TZAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789581588; x=1790186388;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TUanCZUnYDp7fC6sIRvl/mkL+Nam5P8R5i++JsfjtEI=;
        b=im2HpqqtQQMTImXI+t55yD+D5PzrqC2zcEXto5cxvuga17kaYwxcTCwqJxPd2FHMoj
         i08u8hG7ukv+kIi5DuG+zZfRHjl4Uu8GxFRUu+bz2QACPEARddtvBm+z3bycU7j49v+Q
         HnrvipU1nrp6m3hi5Xtl09JOqiOqTYg6W4fNfs1bfVRexQ41enoNFRl1HrpwWkWlkil7
         LuV355M3ZUupli93oFBKJPwJsREPwuPaW4M/1qciIoOaPPpR1nE59RyLsiGVEMQvTs3+
         Zb/HRoIr19lwD03N0A+79e6ULsOo7zKBKsWEAoS8R5tpebcKU28qytw9svdZIj6IP60N
         QOrw==
X-Forwarded-Encrypted: i=1; AKwUvBxXmUNfKZlsGp1y3qlduczXZsalLGBNqPmeGYey2pwB5QMNkqh95YlTY4qkcxQ9stCyxJSxK2w/YZc=@vger.kernel.org
X-Gm-Message-State: AFuF++lCX/FF5gAzMmUe0RFO2NnXWTPchKCpeZsGMsBYw6QF0rse5GZY
	ptzMUWnP0xjw44DSLtln608h5I7UQKpBTfpAI7diV8fTDXuvfkWcy31u
X-Gm-Gg: AYBFou07BW1AX/pm9otZRRhBQiwl1C8DsWaZ4Enojn9dpSVZMgI7OYxRKqrQXhwnBJd
	YHSk++cF93+rE6Aiab9D40Df1tMhpPyKvT9IPL+QqsZ5vFbbuIt8OmqGkl1ryJwgm3XMbgOaseo
	gH+vY87Kds/Tum0guvp4qMU7NN0SW8TK6/ThoUcIV38j2r+1wS40ejAit9xQfBYY73wFpYFJ/Lr
	oTuieJEhkP3embhePoicQp3e4NpbbzjHsoTNv3T8+/nqEsBU48nz2hZSD4xH0iT1Rs+tdsp7Evv
	LDYSWxsNEyhATOvF/TrYzcOJNsoX1XmTvuIZoUSjYI4iuz0RsuQCNL42L1zJVGSH46bcZCz6qca
	FWlIyEqpEUjSLg/406x2u4bGT3S7tTKTNQ3sMzdU0Z5AeNEc/3+TOqcF10iRYzR8kA9Nj3mFPae
	N9JHByPN3c+dVBK7gdZDbwd99qInAaLe3NbYFB0GyK+D3AUTksnG7IXPcOgw8rQ8NfeSfuYE2bL
	nE4ddRqqlIV/6Z+gBcMZYE8uFsZt9370Hc7/LkfSaWXR+fyr5mJvbMIBT8=
X-Received: by 2002:a05:6300:614a:b0:3d1:8876:fb1e with SMTP id adf61e73a8af0-3dd5f06f373mr8839492637.0.1789581587781;
        Wed, 16 Sep 2026 10:59:47 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14395cacce6sm7865911c88.1.2026.09.16.10.59.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 10:59:47 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <a335dcbc-6bfa-4ef2-9c7d-4cee985fc3d5@roeck-us.net>
Date: Wed, 16 Sep 2026 10:59:45 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] hwmon: (pmbus/tps53679) Fix TPS53676 phase page
 decoding
To: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 Sanman Pradhan <psanman@juniper.net>
References: <c0a3c877-eeab-4cff-ab2a-bb567f0dc3d1@roeck-us.net>
 <20260916174553.643587-1-sanman.pradhan@hpe.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260916174553.643587-1-sanman.pradhan@hpe.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/16/26 10:46, Pradhan, Sanman wrote:
> From: Sanman Pradhan <psanman@juniper.net>
> 
> Thank you for reviewing and applying the patches.
> 
> I think tps536c7_identify() has the same single-page PAGE
> issue you pointed out for tps53676.
> 
> I already have a C7 patch that selects page 0 for single-page parts. I
> can send it on top of your tps53676 fix so the two stay consistent, or
> fold it into that fix if you prefer.
> 

Please send your patch. I didn't have time to write the patch for tps53676,
so if you have some spare time please go ahead and submit a patch for that
chip as well.

Thanks,
Guenter

