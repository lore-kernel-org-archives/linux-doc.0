Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D166E36A029
	for <linux-doc@vger.kernel.org>; Wed,  4 Mar 2026 10:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772619421; cv=none; b=fXgFrRWqqrEDixiDcnnixNnxekcy0qqDNQ6RDTLw0AMJHHXX7YX6/0HI1C8QfHRS/6EQhXtiizbf/P4feeX6BxCQD8cLWKc6t5rHVyoGC6e0HUJwQaB/ZDXbBR53UR06FpRipAuRXiPSwv8+rNAQv+isMTkTUKiX0BWZ2nAxEqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772619421; c=relaxed/simple;
	bh=e78qIDzHbDTqXVogJF+UVOVMy75B++Q+8NZ/1KY9TUY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jPvUXH6n8RjLGd0MSiiyQIcDObenIjFG1PLEZGo6FqRd9jD38rkGP56l3yUihvBnWNvqzLJ5rfpAujJ2Ip0AJF0TyT+Pdf3xQccChTJkkExINIf0mxm8+dLPCX8DU6+0buRrf6fp+A0eUvWSAvSh5ThzV69mS/Jhv6o87s9qTcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F+FSwpMX; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F+FSwpMX"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-483bd7354efso89379635e9.2
        for <linux-doc@vger.kernel.org>; Wed, 04 Mar 2026 02:16:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772619418; x=1773224218; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hYB3YNu9CO7wLt2ZT8Xt9m7azMQTOfSk/ijLWaYuruI=;
        b=F+FSwpMXpboj5Xote2ENRoHs8jokK6NZkRGnHXH4Qy3cV3lBdhiex5fHH9wNHAjdhK
         yqGvfBGwjpHrGAR+l6wgHNZa77l96PQY1fJWo2xhuCVwQp6WrSo/kVUGJtLRM+lpwMlz
         tP+31aj1JPS+X4nRNiTwhltna0Em727kkN2S2Iw7DmoBsbn1CDPDOHgMd18NfKRPRqk8
         0TvYXo1BoWGnRr73ONsX444mo+GUDtdoixmN6R+5aBXYazoDMqyRZ9QHPbl3AT1nnCk1
         +/K1DTBEv0BP29zEOeRkYIjutxE2ZIuX7lhUCht8CRZhQInAqHabKMqS5C73FREKZnDG
         otzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772619418; x=1773224218;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hYB3YNu9CO7wLt2ZT8Xt9m7azMQTOfSk/ijLWaYuruI=;
        b=OmqGyNtlJBfH5g4EuAA+/wHC00anasVa3zZMwbhGSfKyFlXTu+qb0UP32NZSVVjxhj
         6nCX55DmiqPF9GZR4XO75TGqXl+jTUdFpLIYhjsjyvQhsJJ2IGHSiJO+cP1YAi8iaLDe
         Qjyvf4y6r3jZ9ASBNrpnT+xWv1rSzuNPfhZq5KRMaaMzsZK5V6us07kfFTm9TBoedNQO
         saQ0Uzz7KM29ibkvzXYa9crSgri1akaAnFKMxX9iQaJIgb9xsk6TUAcGJwICyrgsfaJG
         Ce8V+pXi35/OaCSbxAh046UpOMvda8LfC7nvRr8/bg+24oA5SaMXUtJ/YojUVwk7AAHu
         Ebwg==
X-Forwarded-Encrypted: i=1; AJvYcCVF54cCsKfhLQnfm9yOtkHJ2HwHdlQkHsP+u2xb1LlEBoGsp5BFgdzKTDH4gXR9o853BNDuNGVYQZc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7x8JQAm+sQMZOKw19NUcYTh96Zx67G5bvG4vhNkOv0eJ0YrbE
	rmpett3vvV9fd/60DTpKQMCQQQybmZM+FakmAGYwnxX8kP0H5TfwC7dx
X-Gm-Gg: ATEYQzz87kp74fBfPnvTZHulkknq+RY54jsFAYJzk2Fomok8M57VdYiaXVwcbFxBIcD
	wf1HZ1N+cq0vYDTaGh0Q43a/EzCzrDf4gG1bkOhHdip2f22fsVlgMxxrUrc7jlfn+R9XRIQKyYw
	UaASWqzaPfMs4pBhIgfU4l5CzC8Pc1C4q+q95g8mhLn0qbTv5WWdjJwhOetFZGp1z6f7sTkRGOM
	oKcgLVXrJYXT3ngcA49MitiTQJN9VFghdJ+L/iRMTL4OfQEAf3OggaG1DO1Stmp3Z+QAaKTSttt
	dvH0TL8nm1l/ZlYPbAGTG5u8ARyjqvqud+tWRFe97T+HysOtpneLSFAayOzZZ9oopadSHiGY2MB
	4E3G9Er7ivwR7ZSW0DdMo3Okq3p/pwkLvWMXKHPWBDGm8ele+CXdY/ngJ1wQFivmRqS046TFkew
	ZgunLRmBPCguI4wuuNFlJdj4EtxexH2eQXBfoOShswBdVKFdItQSsJzwxAuRZ0FPx5
X-Received: by 2002:a05:600c:a51:b0:47d:3ffa:5f03 with SMTP id 5b1f17b1804b1-48519886ca3mr23059915e9.21.1772619417522;
        Wed, 04 Mar 2026 02:16:57 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48518839ae7sm36391845e9.1.2026.03.04.02.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 02:16:57 -0800 (PST)
Date: Wed, 4 Mar 2026 10:16:55 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Rodrigo Alencar via B4 Relay
 <devnull+rodrigo.alencar.analog.com@kernel.org>
Cc: rodrigo.alencar@analog.com, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-doc@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>, David
 Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich
 <Michael.Hennerich@analog.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v8 02/10] lib: kstrtox: add kstrntoull() helper
Message-ID: <20260304101655.620df7ee@pumpkin>
In-Reply-To: <20260303-adf41513-iio-driver-v8-2-8dd2417cc465@analog.com>
References: <20260303-adf41513-iio-driver-v8-0-8dd2417cc465@analog.com>
	<20260303-adf41513-iio-driver-v8-2-8dd2417cc465@analog.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 03 Mar 2026 13:27:07 +0000
Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org> wrote:

> From: Rodrigo Alencar <rodrigo.alencar@analog.com>
> 
> Add kstrntoull() function, which converts a string to an ULL with a max
> character limit. The function is an alternative integer parsing function
> that does not require a null-terminated string. It becomes a better option
> over simple_strtoull() or kstrtoull() when parsing integers from a buffer
> with custom delimiters without having to create temporary copies.
> The function is consumed inside the implementation _kstrtoull(),
> promoting reuse.

If you've got custom delimiters use a function that returns a pointer
to the character that terminated the conversion.
They save you having to find the delimiter as well as taking a copy.

	David

