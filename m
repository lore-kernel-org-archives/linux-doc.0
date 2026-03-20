Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D4B3C5534
	for <linux-doc@vger.kernel.org>; Fri, 20 Mar 2026 14:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774017905; cv=none; b=PZQ1zxa6z7Wm24QCFzn0RJN+MWO3UdRDoP4xyA2CUeiQIyvly0N1/6TzayKc3GmKY9oXuzeGnKw4dLZRvGNh/g6MM2mn7JQRatvA5kOha5FB6N0J7YtZyM9754psWvqZ/HHkW4QiYGOqf2YpCanNucVL9njSBa/vihpZeEfKGa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774017905; c=relaxed/simple;
	bh=OTEFC0pinOqu0Up5UTAV4E3idzdTkrkojT3B1LPYHqA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ufvZnpH8YPkEEIAcLtJeYVw2dMDcWoigqodmlac5bl93ma1vayCoqfCXV+ceB0LC1G2OQZT9cfvXm2tFQ13qs12plI12MxTNcv9nUNsuFnd9OsDY753QGVFWMMe5ZU+eds6b/618KkpMlMslrD0NV5+B+QcRNQ1bU+s8FA3/uko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aLDO0jRp; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aLDO0jRp"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4853c1ca73aso18674705e9.2
        for <linux-doc@vger.kernel.org>; Fri, 20 Mar 2026 07:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774017902; x=1774622702; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3gFUsjpYnjCYoV2M+WjbPtxbeZtMIDawjXJ9ppKzFTQ=;
        b=aLDO0jRpXdI2vUdK18Zj7Kk9yE1aVOxIxettrXWHj3mx1S+AkwTd8yarrn5Z02ndRV
         KdZNS8osJfbFMLejckNXHyqVVbBR9ouOs1/4t9+OX7WImVtXbr+WmXfhWrnlVhxQoNKv
         Rr2hcKn1Mc+08G6Ak2CpeIsAxoZBwyPn24nbjrI79dhebDPrlBe7QAY5N2c4tg9pww/j
         hF9RVUOUahXgbffq/C412Xa0ZWlVo/KUhy6AXOB85H7P8uOIFhb7IJhkl9Msqk1oSI3E
         3MVUcWUFhDTmEOlBdaF4IlApV7xsOW8pRZLxFa6/+wTUvtMzc+7e7Dy87YhzzuZ5BEEp
         xElw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774017902; x=1774622702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3gFUsjpYnjCYoV2M+WjbPtxbeZtMIDawjXJ9ppKzFTQ=;
        b=ECFhUyMy01jMC5Lp9A3pwXg32wCrX4sI2znfcT8rUrZOdcQv+ZXfJkqO1ZNeH9UDPG
         w2qFX50ze+Ff8T8DGoNNU8IS19ZcfeREmEEinrvkFvFqAUixatHD0EZ47q3Pqvq3YM1n
         Uh46+iBhxlHkotSb7T2+biy6rgTUEQp6Ox/M01l6DawAxyS/GeHDTA+yJ6/VbQzg3tTU
         rA5QPj3tAFntunbfv2ZLSNMch63J49idX2zzYoH6x6Po9qv2pmElSKC7qUAtsB0ENteC
         4hac5wjkkZab27PpV9B2kAPcJyQ3BqLcVHxzvNJjyCeST73LHf8UXvcJA40R9kL09upD
         VeNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGkfKLKR1myD/0F2UfPTbhlNLNKOKL5aA2A85J9nVJUSASpVC6B1OgMkYYxQo/eHTxdlQqGyB7fkQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCh8dnXIBKU6z9AGkEHkYKl8dpin7O6jiEhupc5xYaIpdmjokY
	op1SPo4rta9NHpKcbIsvz9QRRMV40oiNuwKH4ZLANmf3BhGlH8XnVe+R
X-Gm-Gg: ATEYQzzFmcTPue3JoEaAYgiuWfrvOo+lxRmZtrLviU/NOnGrajgEZMogruEtkelBqFX
	rdfxSeUJe7UKtq0S9XgFollu29aSPAx2h1rtOD3NphLpz1Vh/bPa9vYBEEoP2SduUb46qUnAkHT
	2lDDNXyUGi4MNriTa8pm1GEUenCN4WnXAlgz8/uFN1vhb1uObTcJuDydcvlFIKnrM7nkq79mpyj
	rLnnx/zgONj7OFFm8xpXwyzddop3DlL6WYeUSmvjtgo2XEn1AZ3jxNebeKHVp9OVhfoGoGl2vhi
	yTYubD13Ct8H9tj8xf8JNL7OjDDWaKKBGcCGYnbdec/pdB5jWaeFcznfKPsZyYiOyUXvcDQbOYl
	zjwl1OYd+L22MQc4IHErQNBnAWYdDWS7rVN36NDY5EmXM/K17Uvo4zUfXwUTVsd+15KYnDrr2pF
	w4syLxD7cj6iO8UbuYs+uEWwxu6BGbzvewkcS6b+yUE1CqdTAt/Bjh/EjUALwxhEPerTptHtW9T
	Fc=
X-Received: by 2002:a05:600c:548c:b0:486:f634:ef1 with SMTP id 5b1f17b1804b1-486ff027176mr52957895e9.17.1774017901787;
        Fri, 20 Mar 2026 07:45:01 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48700658441sm72115895e9.4.2026.03.20.07.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 07:45:01 -0700 (PDT)
Date: Fri, 20 Mar 2026 14:44:59 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
 rodrigo.alencar@analog.com, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-doc@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>, David
 Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich
 <Michael.Hennerich@analog.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v8 02/10] lib: kstrtox: add kstrntoull() helper
Message-ID: <20260320144459.705c8e60@pumpkin>
In-Reply-To: <qsquhriyrepndxwexox35oi5i7v4klb64lajuk3j3pfozkjiew@fp55l4znck4o>
References: <20260303-adf41513-iio-driver-v8-0-8dd2417cc465@analog.com>
	<20260303-adf41513-iio-driver-v8-2-8dd2417cc465@analog.com>
	<aabm23jCikXs1l6F@ashevche-desk.local>
	<qcloiwjlbehs4yyuttvrt46monh7isef4d5nzuwlaby6uxfael@j3trvc5jwosy>
	<4mtdzxfj656sjr66npabfvrr7yd7q26l2unhsihjtniz4ossfj@g3qnzonoary6>
	<rygken7oujyoupeanrdnl7r7smesa7js6sn3jsafbajc4sm3jh@adeslfqwwf3x>
	<ab00clb7LL-bmJWe@ashevche-desk.local>
	<ixvzb5mni2lhz733f4fvvzhozmpezkx5s2q7sash3wv3u2g7ov@pgs6pve6kxrq>
	<ab08aHbudFWEtLi8@ashevche-desk.local>
	<qsquhriyrepndxwexox35oi5i7v4klb64lajuk3j3pfozkjiew@fp55l4znck4o>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 20 Mar 2026 12:41:57 +0000
Rodrigo Alencar <455.rodrigo.alencar@gmail.com> wrote:

...
> > Some (stupid) thoughts loudly. IIUC even if we implement '%g' in scanf(), it
> > wont help you as you want to have more precise values. Do I get it correct?  
> 
> If I am parsing 3.14159265359 with 6 decimal precision I want to stop at:
> 
> frac = 141592
> int = 3
> 
> and ignore the rest.
> 

If you add an 'upper limit' parameter and return a pointer to the digit
that exceeds the limit (which would normally get processed as a syntax error)
then you could have:
	int_part = strtoull(pi, &end, ~0ull, 10);
	if (end[0] == '.' && isdigit(end[1])) {
		frac = strtoull(end + 2, &end, 999999, 10);
		while (isdigit(*end))
			end++;
	}

Passing in the limit should help strtol() are strtoi() as well.

	David
