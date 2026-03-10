Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E3D33BBAA
	for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 09:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773134776; cv=none; b=BaoRnHy4AcfJW3p5sePXAy38Zji+EqqSZPkMa51uVCQX9vqFsAGtlIIN9NbAa61eUCeSJFtakHPRQnvlxTo1oBmGWwq6yaC/WePJsXV/KrUloYI7CKJ7hLmCUKuGqG7tnXxybIouJQ6tjbsSh87nLnuCACXvpwLZ5Ugl83kLGMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773134776; c=relaxed/simple;
	bh=+JiCqqCkfhiKX6/spAppUcZcveAjdN0jHQheQ+7ABPE=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jmVX12twSXVxMiwXCwB20pVhNnDOfxWbmRGdmYcVNzqTSuj5d21bqOinXDL8xjBDrD9h6BdKEQpJzTnyro5uRyeE4Di0Jdglu272zMgX2fr0jIDSjvcXAzADVHY8BxLln6uwt0y/7gkgO71GILq+cQDsBrdj5xWp9lD+if4lyd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WMnYVyEk; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WMnYVyEk"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b886fc047d5so2052578966b.3
        for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 02:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773134774; x=1773739574; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UCpjD/WHCFz9S12dNYwHUW2VFUf+GTEfEGzPxPYB5Yk=;
        b=WMnYVyEkawrQe/oFLRBcziogRnjlma7Fex0OxuEfeS4HVZNEzE5KqGTdyk7SIQsSP3
         T6IFIwQlhVcVBpA4k2J+V4PvfENGb9YdnRqmsxNzDvBTNrgyLqWsh3kvul4PxMA/mD1Z
         XMcxTxmxGMyiTc7kEQMxJVX8VXa5G3wY0/60rT+Nu0w1Ky/vT6OYWxYaphEVeH30RrNw
         zwgs1ivOp4QfDmq5PUEVN+R2SVF23RnJW8agED7I09N4ZUy67OZIX0JruoftByWoTyEn
         z7L0PLmbwInPBJjl69t5AZmlnFqQsOhjDeZpTkHYs7Kp+9kryEknoM6Upd48eSmYbvE0
         1VBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773134774; x=1773739574;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UCpjD/WHCFz9S12dNYwHUW2VFUf+GTEfEGzPxPYB5Yk=;
        b=szu4OHIcl5Sbuwk3QUYzTbPbtBxh35qf32Inlp2X2r+s8btL6rpuw5G/rkwZRZfxg3
         /Fq2cQfzymwm3qWRvxXZAZ3tGbZUqporBIYJBphtBVXgomjL6A3H6R6BC4b9TZAkO595
         tTD92vHfrlQkfZGtSUx3iYv4cZxTpiyRm/Otcv1XUqW1F9Ck26cf+E/eeu4SZY0IXdXu
         hE1t+pQXCkLiA2bPYlvXRVwWWLmgZhDsWbOFiR5CrkqTU332mPwqDc7fUIC6VDS6RAdy
         P+fM+1JmQAYywemOvmr/Kz7B8EV4LME3AQlUTxUe20K4eLB58GoY5O6NJrx2IYDX+aAg
         4fiw==
X-Forwarded-Encrypted: i=1; AJvYcCV+etDq/LFt3Z9Qm5Wq1G051W0aIGyLbc9HP38SOBSHKmJR46rSm1/CQKzWk7DaTG7ZkneT6N7Y1qM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyoaFw6ll9n4J7Q4jbhI+Jw4KmtHAdvwrW5zBZD82Hw7t6rz9h
	UfOpdP37Fp1EAoSdEKB6pWUtpWe6XJ1JlJ4tuHtIE0sxGCLR1wG/ga0d
X-Gm-Gg: ATEYQzx8ddfMSgoKxqUb/cpqYGeOospHYvGZ8KQY0ss1MCEslfwhP0X40M/9X2hGcKN
	ANapdJWG+UuEWnxuCBCE4cqZJEUUwZ1Vz62iKRGBQhP+v5FYYThte5v4Q0F0LuBiSFvTsMUmXPp
	nwORFHRqhwwLhaWJJ4M8bYluiGXFZ2it9Ty0xKaCo4VaKMxryvFeW0dFi5gZd8kdHJrgR33aZzy
	icd0usjjD3e6M43jqxerK9FqgVA4j93dWSu+rh/JeSgeQcufBiFUBC1E1MDOGaoW4pPTgf6vCq0
	jo6kJXOZnn69/EY+GRCmtqBRJcycxeWWM5XXPLm52PTTMT0Np7XAE2+My0d0548zFtpt0tihg/2
	VCr82F0HgN/UpBDCVGaEeSIUgprvfCcJNzKbDgnXnEhC8qRjkSWAG01Sl4t2mI3Cel76othX+sB
	7nAJM1fxKKUdg3/UpimcwLsfzAZnp2pZhp2OZ4k8kh2hJ8/BGXFH3zJ+yz4TUtivJju712E+KaJ
	+Nt8siazlBn9fudo45W5mBDFcpXsF+xF/fMs9FOISxVlODij+Q=
X-Received: by 2002:a17:907:e10c:b0:b96:dd06:8d9 with SMTP id a640c23a62f3a-b96dd061152mr324301866b.60.1773134773760;
        Tue, 10 Mar 2026 02:26:13 -0700 (PDT)
Received: from RDEALENC-L01.ad.analog.com (24.206.116.131.netskope-rdns.com. [24.206.116.131])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b942ef8b7c0sm453212466b.20.2026.03.10.02.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 02:26:13 -0700 (PDT)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rdealenc@rdealenc-l01.ad.analog.com>
Date: Tue, 10 Mar 2026 09:26:11 +0000
To: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>, 
	David Laight <david.laight.linux@gmail.com>, 
	Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org>
Cc: rodrigo.alencar@analog.com, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	Andy Shevchenko <andy@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v8 02/10] lib: kstrtox: add kstrntoull() helper
Message-ID: <zhjkurpwbuvirh3k4a4c3lfeu5semu4rjszvej4hnx7scjyk2q@v4r7oqexwsjl>
References: <20260303-adf41513-iio-driver-v8-0-8dd2417cc465@analog.com>
 <20260303-adf41513-iio-driver-v8-2-8dd2417cc465@analog.com>
 <20260304101655.620df7ee@pumpkin>
 <6et7t3o6fjiinpkvpsmoxjhp6edn23dgclbulaxg5paccdotgp@amtf33da5dhf>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6et7t3o6fjiinpkvpsmoxjhp6edn23dgclbulaxg5paccdotgp@amtf33da5dhf>

On 26/03/04 11:41AM, Rodrigo Alencar wrote:
> On 26/03/04 10:16AM, David Laight wrote:
> > On Tue, 03 Mar 2026 13:27:07 +0000
> > Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org> wrote:
> > 
> > > From: Rodrigo Alencar <rodrigo.alencar@analog.com>
> > > 
> > > Add kstrntoull() function, which converts a string to an ULL with a max
> > > character limit. The function is an alternative integer parsing function
> > > that does not require a null-terminated string. It becomes a better option
> > > over simple_strtoull() or kstrtoull() when parsing integers from a buffer
> > > with custom delimiters without having to create temporary copies.
> > > The function is consumed inside the implementation _kstrtoull(),
> > > promoting reuse.
> > 
> > If you've got custom delimiters use a function that returns a pointer
> > to the character that terminated the conversion.
> > They save you having to find the delimiter as well as taking a copy.
> 
> understood, how about this prototype then:
> 
> const char __must_check *kstrntoull(const char *s, unsigned int base,
> 				    unsigned long long *res, size_t max_chars); 
> 
> to be used like:
> 
> 	end = kstrntoull(s, base, &res, INT_MAX);
> 	if (IS_ERR(end)) {
> 		/* return or handle error */
> 		return PTR_ERR(end);
> 	}

Hi David,

Do you have any other feedback? the function prototype can also be changed as
follows:

int __must_check *kstrntoull(const char *s, const char **endp, unsigned int base,
			     unsigned long long *res, size_t max_chars);

so that a pointer to the terminated character is passes as a parameter.
which one would be the preference?

-- 
Kind regards,

Rodrigo Alencar
