Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FBB63043DB
	for <linux-doc@vger.kernel.org>; Sat, 25 Apr 2026 21:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777153476; cv=none; b=sid6UGfPgxTKwYay1t/6jmQ9xrSsUZc0Tsxd+bJFYReTTTIK7s7imqJzgbI8X8qp087LL0CWJX0Y2QWATC2ZhQLF8zHrItvfgc/Nt69qdecBvD1iY8cpLahAsaCRATDf4xPLQAizvKSMapm20HKgiY4vnHGOYHAVU9H6wOps3ZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777153476; c=relaxed/simple;
	bh=vtdsiym4Y2IGQQwewhHUQFHiy2pQQPMwFhKuEcdkJpI=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CshiXHLJCX74740Q0Rh5CnA08olJ6r1G+q2YRHwxXCd6NXbrr+N7PRtHGDRskRaasuWmnArKUTlad0wVomStQfpW1t7gOU6nCAbcanTg1GCN+8iwKchNaPOLA3Fy1Tvy11B2M1x3N0WjcNIbjMntxhO+Ju16X8Xa0IT72T/PRfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T8y9lmKj; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T8y9lmKj"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488ff90d6c7so74809965e9.2
        for <linux-doc@vger.kernel.org>; Sat, 25 Apr 2026 14:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777153474; x=1777758274; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O/ED0Y4PmfOedW8XVTz2ekjmiBfYIa5o8q7WIKYBzL4=;
        b=T8y9lmKj7LncWlHTqeJXg1T6vERQHQfDn1q2MCzw+L3ukIndOYFCwz8BItQZAJoZfE
         zqzueV5Ytssqa6LM+UCfJdJRievS+p9s5ZZmHt2I92JjL1HNPehoW/09LXk9RUam0v+w
         LR7U7cOjIdjGSqxSdpVfFQlyY19Hrgn1zIdiFFBDeTE0vWVm+HY1qPTOCjhDXasFb37d
         jLdiASJszW7ldqJhc8y4Jm17I5n3E4OUWpnty+K1CZ28XUjj5UkYaZf0tvPFpCzDxZC5
         0T9Ic9mRgjqe8gQv+AugVBifWGrw+a+UVfQPspY2irIyCDPoAbn7kSNTJjRfpspLJ1fr
         V1uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777153474; x=1777758274;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O/ED0Y4PmfOedW8XVTz2ekjmiBfYIa5o8q7WIKYBzL4=;
        b=b5QT+lJPzFcyd7IZYbNn+5MJ0Kx4I+XpAJtN2bvsKgpwwJVC5Iiwi6bduJktdyRFbZ
         Jdwmzfi6oLKABxhETxe3Eq/6c94vSiNrUxmIphTzjB1aUM47T5gVp62v3tNGllQCIxje
         qa8AHETvE/3l40LRmB/8ix3IEHrw8+U8cEXXtQGAH+kmiLppm2jkVfwJYl0N5G45sWDZ
         S8RWua+lU3KqEmVpYtt+2/PRnSGnuxywzV/cC5fA7hC/DYYSd6LkLhJv8PQKTH54hHUv
         GKTndIiDDdjg0Fikn7SFlPf6ZdLjV7SsZJIsiglx/DiSYI3rgeeA6lO4+3eVJAAJ7Xza
         LwKA==
X-Forwarded-Encrypted: i=1; AFNElJ9Bb7kgUIAY6id0dFZ/xuBVb5LrbBqEPbm/txV42qCV/qu7S1YITiwg23udZxykWq61NDhJCGk/dMk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1F9OrlRCvjpOzw0YT+zrjT8b/DL5NPYSKZQioarglCUSGOkPV
	qLjihrHPh7/UZmzFvBbGOHGX5c4jQjvAtZj4BHOJNhisnKxT6rQTK9e9
X-Gm-Gg: AeBDiet/XC1enkL5tPoU/wmSSsLi3PnHASItAwEDZ+QZEECuUCqHrpxMXjM3+Ss9Ri4
	xVcBdDvwumhFtbMMKEOavdcHy6VroSdKVWvAYS0aVFHhqQA4wVIPe5arpaDrQROKxLfKn8ae54L
	Lky38cGlGeCjjeU4stHtXB3E8+Lfew4VCpA8QI1AZgBjNcfdEp4HZr40JrKrveuBKWR1+f61gqO
	CqiLHVMyCOB77yH+4gC/1xIYcVvU3oE675Xe5wpzeenZq6q3HthimkP2n3cQSp9WVouqTa/HFUv
	Vxd6ffx0WjYfx3DeOjcibrtpXakwzi3XElzVVoq/SiqIUWbSqA4UnHXRfKxW8FPIbrlvNZYb3BU
	z0RS8f9Px1z17Sjy66sNQQYjhNj/bO1NN1l7QS8lzL1sfFXmn3KlreriDdZKFQy8hSxBQZHIXSo
	sn27DOD5czF31wyeVl+h1zrENF92AlkbfQKWsWOeDtF60QOOc6ukcfdA1hm4C7oVv8g4ppa/4SL
	wYZOKx6+ounV2wQJtIQdjsm6HsD/MvSu+rmINPBuF3VYoMcZVP+a9okQLfyKA==
X-Received: by 2002:a05:600c:5295:b0:486:f634:ef1 with SMTP id 5b1f17b1804b1-488fb77d0fdmr526610895e9.17.1777153473832;
        Sat, 25 Apr 2026 14:44:33 -0700 (PDT)
Received: from RDEALENC-L01.ad.analog.com (24.206.116.103.netskope-rdns.com. [24.206.116.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc10777csm770862455e9.8.2026.04.25.14.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 14:44:33 -0700 (PDT)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rdealenc@rdealenc-l01.ad.analog.com>
Date: Sat, 25 Apr 2026 22:44:28 +0100
To: Alexey Dobriyan <adobriyan@gmail.com>, 
	Rodrigo Alencar <rodrigo.alencar@analog.com>
Cc: linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v10 02/11] lib: kstrtox: add kstrtoudec64() and
 kstrtodec64()
Message-ID: <7ytjm7q4noyhofptadss6r5f6ibrvntdtafntj6yjuaegnvjzc@j3lrtcj2lje3>
References: <4b7b42fb-e3db-4218-9deb-ad609e07bfb0@p183>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4b7b42fb-e3db-4218-9deb-ad609e07bfb0@p183>

On 26/04/25 09:57PM, Alexey Dobriyan wrote:
> Rodrigo Alencar wrote:
> 
> > kstrtoudec64
> > kstrtodec64
> 
> The only comment I have is to maybe sneak in "fixed point" into names
> somehow. Or change to kstrtou64_scaled() because return type is not real
> fixed point type.
> 
> 	A.lexey

I understand that a decimal number is inherently a fixed precision number
with pre-defined scale. The "64" in "dec64" tells that we are storing it in
a 64-bit variable.

kstrtou64_scaled() does not tell me anything about a decimal point handling,
or that the base 10 is taken for granted. Maybe a typedef on u64/s64 to udec64
or dec64 can make things clearer?
I suppose the documentation header of the function would be enough for that.
As it is clear, the function intent is not to return a "fixed point type",
but its scaled representation in u64/s64.

-- 
Kind regards,

Rodrigo Alencar
