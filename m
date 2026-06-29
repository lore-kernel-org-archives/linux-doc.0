Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2FAF43C046
	for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 15:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782748724; cv=none; b=jNW1BJu/FpCy14Lp2UyAseJg8h1QMynGMK3DA1ObeBR8NlWDwe9qRLtJ+YrHF8JP3PeXAAfptCRpTPNadJkVOO5Vn7rpQUXLzSBJBG/Vn2z4nyjTkUBv8Zw+/zfCnedZKIjt1xfgv2ZyyoYVXLaM2RV08kyGU9QeAVX+4VJf+Ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782748724; c=relaxed/simple;
	bh=foYyIZBJ0MoCbq2Wo9LeCV4l3uwSOfWvCOadwIjww5I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DcTK53LeKLVPz5/IdwkTPjQ15G0cljwoq0+stuyVTwVvVtwZIiIDdmQzJZruk25vWTie4f5prhAzt3DzjWFzLcCHeU0vlllhm0HqbACtXjcM9mO/CRW9pRkvVYW4Qd27C1R9l70iETaiVCisjZAqLLQQeaHnExrJ4as0+zJ5W80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M5yW+nZR; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M5yW+nZR"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-13b29f58698so136899c88.1
        for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 08:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782748722; x=1783353522; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1dNCLst1AIC3Ocf1UQfyjRnOJqom+LQyhRLMmxgI9Os=;
        b=M5yW+nZRu4KlMW9hqTHQAKodZ7nziBA8W4q0F1YlqlnQCMFJ8Husqe+wZgcN7eADaW
         qL4IoGepqB9Rjr0YTVO99myzYrzVhRuQk7tXGYxgbY/JKom8KTdvbq/74Zpt+9+a9fma
         uF4LMtad0vactl3zmeq5A9RwvOVZ9MohnviUgNK2abM8UXwTrgBU4i/ckfpYZcXddtsH
         XLabMqJGibpcv8xTwih4nB+V05qklQYROwSUUv6t2eCd4nePz4Up+3dH35rHXYk46FzL
         GtnI+jqB3UE8/vt1Y1apraaiP86N4oyEhoCUOd4/97rRV4pPv7q7UdQCs4UbjgPdP1Or
         dIFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782748722; x=1783353522;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1dNCLst1AIC3Ocf1UQfyjRnOJqom+LQyhRLMmxgI9Os=;
        b=tG2aqFFJ5Lje5mBQZT7pR5qEaTUzBKA1h3+/7P1Sm4ryCzcZYgpKvDTtPE4Hyrobq9
         JzFdwYb+ICvGTLfL2xKjB6JfQzrTD9wArG5JuojWnUJEC9h/PGhjH4FVSr3WMakAWbj6
         QFH+KL5vZhJkDr4wV4sbsDYJ/CQ/5uQfh1tawcGp1Ptk3X/BQ8CA/Pxk64awiTMfAlE7
         DFBB3bPbI3s9gDagIc7ZXu2i4YITiSRau5itClm6uR10oDZ+pKmR5sEJma197TeMmUNh
         A9SFZs0MyRAysqiLbIBXCQ4Q1DAx2WShwv/NSGMb+WLlPz9AWRwYsK1eMrrEj3Ob/ulM
         pKig==
X-Forwarded-Encrypted: i=1; AHgh+Rq2V72wB3cAxKOItrlKigLP+2eMWVtnmvbijDUJus3r/fYyLATIhsMQNX7NJsFZJCXvARHU+PF4GJg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNHZ5AyXs0pWPqDWXMbPq8zFcoLPaWlCdfksGdNUH3xmrqmMJ+
	Du3Kk+fEqN5cv7kRuiOdh9R1iSgqJQ2UTHWlywSRsZLZ85yq0FSwI+Iy
X-Gm-Gg: AfdE7cnGxrm9WohVH/r/hVwxjabSzDvMeLfdNMosA0U1sbkZqW4ZEwOE77BUrla85bS
	Aer9Hd3x9qcFeXNZaLlzVWOlKbh7ap3JTrCWGAUhPwk5gY2jXJuLOzZ+OmBNyLPpFSLDD0a4d4c
	sWIXjL6Fm6tbdRckb84mz5MRJtwNhqnykqcNQu/RurnEeK9DmpfbyU4eVvezxng1QIdu8pkpKyg
	LKxkMke5t1E7o6/GYP3JFVR6E53UfKXP+m/dyjvnydCtWSTHZ1FlTS4GjEgjvHgmTHIGG69+JUY
	F516Tlauwqe1DMPcRfwaO6vHSOoWJT8/yB5fkcMzY/WggFnztAYqmyPOm0ucbMxh1f3qXqbg0we
	0FecrLWHcLB55kqPhhizN6lo5/kzFwjjoMQoC+R8MUdybdIEFEvosCwb6SdH0sPHTT+LQ3rS8tE
	z7pIrW0p5QgydtmL9+oQi7dZDMlQ==
X-Received: by 2002:a05:7301:4888:b0:30c:ab4d:382e with SMTP id 5a478bee46e88-30ee14ba46cmr26077eec.37.1782748721625;
        Mon, 29 Jun 2026 08:58:41 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c9c456cf5sm37515581eec.2.2026.06.29.08.58.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 08:58:41 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 29 Jun 2026 08:58:40 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Flaviu Nistor <flaviu.nistor@gmail.com>
Cc: Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] hwmon: (chipcap2) Add support for label
Message-ID: <d1d0b091-efac-4774-8435-510d12aff6a3@roeck-us.net>
References: <20260625160423.17882-1-flaviu.nistor@gmail.com>
 <20260625160423.17882-2-flaviu.nistor@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260625160423.17882-2-flaviu.nistor@gmail.com>

On Thu, Jun 25, 2026 at 07:04:23PM +0300, Flaviu Nistor wrote:
> Add support for label sysfs attribute similar to other hwmon devices.
> This is particularly useful for systems with multiple sensors on the
> same board, where identifying individual sensors is much easier since
> labels can be defined via device tree.
> 
> Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
> Reviewed-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

Applied.

Thanks,
Guenter
