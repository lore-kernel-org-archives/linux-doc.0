Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795094215;
	b=aTwYy2GQL0KY2kuESZSqkkaUG1tjPjt1QUKmmQvwcWRbP4k1BcV4AKgXOx/UlDXDB2Xp
	 yhIba/OWEYnbzaUskStRCxpG7WY9kcBtZ9NwB5XmlDgKam7La01D305VGQ3NvGbDNrDp2
	 fFiouvIb2syiEWchw+irqV88as5gtmaQEgOe3cyYTNh9IDekmmn9o6s0mc2TDRw6QPIFH
	 7+u6mX6pS5cp6Zpq2SrCddEQBAPoxcDUt1yQlFYXH/c9yGCUrUezNBx5Rif3bYsSE/3oX
	 Tif8JWFo0vsTVI6vPmIgMdIe3wNzbqInsv9WvGnD08TTdP5J7qnIe2Nqf0NPu1uRemQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795094215;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=xp16DMasSnS+RYN1dXhyuGf4ecNuv1+Asdv6vIA9BOw=;
	b=hGokOd4lKDf0XWnfG3RAZWm0kQlLEUTPtskAikiL30HslkV7xXVlGs7Uc/AKJ/JKhyBP
	 zujb1qPG/L9g9Fc+Q4RsQ325wFxry+BY58LUr7yKCUUHpricmEeaceZrLjl+MJ5Ip2Pez
	 dFPB/goLw/tv/K6HnfWz3wZGr8oSPQCnNrTtNqZeKI+CCxg4tLEyft4jtCb43K14bofZj
	 9I1jRtswxcFdiFUgSFP/NlrM+xqI41QcENzGOygoDVAiJAGgXfOhhqrdqhTj2tRvU1MLq
	 L1EWjlKdCzAm6e1MLsJnUv7Ku/POzx4FLqOJaaNmXlTToJ87LfeNkhZFVPduvylhDoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h0OUjn+z;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6400606A32A
	for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 13:16:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6400606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h0OUjn+z
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4a3e706b5dfso1423253f8f.2
        for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 05:16:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795094213; x=1795699013; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xp16DMasSnS+RYN1dXhyuGf4ecNuv1+Asdv6vIA9BOw=;
        b=h0OUjn+zhoDQPLy2QjFZvhuAA08t9e8id7vx9JZ+zpe2vEFuypuEyoi94Jek6405hm
         5g51OnaBKIbXOhEk6PIfjn0Aku/Uxq0v3gHIIq3R4x60BQsGATBy5iUz/58T9HiPmzAC
         KTrvdGwlm5/cMZg7afeYb/Df9jvLwyqZDf3en3aARrYduyyj6mWZsJW5bcYpaah++KZN
         q6d/evb1D+38OdViKhHRv5BeMYmV1elUtdPDjmJDgxv8WlfvAcRGQir8EEZHwGgnPYo8
         cExUI7pdoF7+y49RGmh+2EBw/zxTWiY70V/x5h4kPLw2E9kTfQwoBZL25dhJhYFq/Wmr
         1vQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795094213; x=1795699013;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xp16DMasSnS+RYN1dXhyuGf4ecNuv1+Asdv6vIA9BOw=;
        b=sElIJWTdoyoUJ+QpUqlvtT0NpcdUpx7yxDn4jwSanCcBc7lTK2I2Ms/zSUNxmsiPW/
         UY0fi9zdPDvnIzXTkVGqtvO95T4PP8+wj+7dpvfSOB7l+YSY3cBkXOBTs36ZIh8Vm49/
         hsE8kPvBjvo9/9bkAXjLRVbk9h40GQMxGWa4wLXf+9bNtt60PGNxS1AJPpY4Hz62ZzAS
         53eeOpqmUcR+Wu2PKtyN0foEy6Dtxkoh+ovUorHnpP1TvTAjnN6DuuTzAJF/40qkpIi2
         Uxf9vtW4EkC3ZJVsLH2Qz8MKAMlRDPBLesFVHLOxg33Cy8XVKmrysxb4FVVsGNWpxP/6
         QBNw==
X-Forwarded-Encrypted: i=1; AL+hErH6P9PGxuU4GD0DSRO9Ov1tw6s1Blt9YnfmnqXaQiQUf5yU3hft7qTEA4fkAjqAoMyjeQGrHVfu5Xs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8d3kf2zKiuCs+UBdYirXQOMS+csBpqFIb6qo0A3DDMm/Te0blO
	6Nf/w+VjXvImfdznkNf+11/KSF9tStCbE0x7WcYlMnDEdFqpY4eR5jM/Hdj7umCcixsHMw==
X-Gm-Gg: AZFdTZdu+w1BcODDTv55FLufSo4F9ZgUMctyD8e+xaruJRvrwidiX12jzm1qXG1qEH5
	kkPly7cyrv7oosCvUz45+paN/L9u/Dm6Kpz2+2cu8MyIG4kJ0V84QTK1yrGBPMeel1xEG0U7/dy
	hi+aaY4jnLQi5dSTTQgMZhbtw8UEmfwIvpcvfaYMEAPtr7PmW4D7t+p80CuWs7wAVy7lLcLM6gW
	OV6tTzVUN1niSMNUbdXd1fvBi/0we8phNpHf/feniGUCjqvl/Cy5upgRjf167LbD1wgNGAxFoVG
	VHJvocN4eWa4mAuMZvvqRoMKyQvVVb4LXiUWjD8Gmql4Zfxv0b9LdVzCDpugq9IzxSqgNgj7HHD
	jL95ybDAZHGRXSGeckSY5+KfFS/g/XFOKZttjqcuvfA9knxY+A3tSpcHuAzRWL2OVg+vjwhpoMk
	VJt5wP/u+bnEX/MulQMojP4JzSTialkn4Ho/FkhspKhNWxEYLudm2kD0RTbN+3jxYPmXQHyJJ1F
	x6sC8jdt09XUVht5EPvtr4cKZY0p8HGyoMn1YkeBScEW23qWM0l/xu4fGD+EVvKpnEeAn86e45u
	3LuBtuWC/KI9m3lGOO54djgc2h4AWinrKmneckdqjnfKZ/HxgIoPz+cvJwm+sFDUbIG5jLU37Dc
	/2LXHOtKGarPYofOA0j4WYmhXAEEYTmx02pLTMxy8/pqEc0YlPw1q60U2+IOQb5FSKVc=
X-Received: by 2002:a05:6000:460c:b0:4a3:976e:27a2 with SMTP id ffacd0b85a97d-4a63cb246e2mr12573377f8f.34.1795094213110;
        Thu, 19 Nov 2026 05:16:53 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65499752asm10015676f8f.11.2026.11.19.05.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 05:16:51 -0800 (PST)
Date: Thu, 19 Nov 2026 16:16:48 +0300
From: Dan Carpenter <error27@gmail.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Peter Zijlstra <peterz@infradead.org>,
	David Rientjes <rientjes@google.com>,
	Vlastimil Babka <vbabka@suse.cz>, Jonathan Corbet <corbet@lwn.net>,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] cleanup: Suggest using IS_ERR_OR_NULL() in cleanup
 functions
Message-ID: <av72wAOkKPOnp0c3@stanley.mountain>
References: <d5054be790f6980107cca32cf1e71f1df08d2a24.1795093760.git.geert+renesas@glider.be>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d5054be790f6980107cca32cf1e71f1df08d2a24.1795093760.git.geert+renesas@glider.be>

On Thu, Nov 19, 2026 at 02:14:29PM +0100, Geert Uytterhoeven wrote:
> Commit cd7eb8f83fcf258f ("mm/slab: make __free(kfree) accept error
> pointers") already hardened the cleanup functions for kfree() and
> kvfree().
> 
> Update the recommendation and example in the documentation, too.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Acked-by: Dan Carpenter <error27@gmail.com>

regards,
dan carpenter

