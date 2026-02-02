Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 349023793DA
	for <linux-doc@vger.kernel.org>; Mon,  2 Feb 2026 15:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770045585; cv=none; b=lpstQ4dIv6mU9ZDPiYxII8wDcRmbIv0FSSI9xdGLgfDU0aDx4Hibx0nRZ8tfC/TgqizN62tPFqwt/OGTeOO5S0nncy8XMGP/2fp1KAqAdZwokS+Yy2wlxW6CxBLGycsNsXsCIfp5cJVdzWWHZfrqq0cmPFjBt0XIjwPPFnkk0CY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770045585; c=relaxed/simple;
	bh=uP35BjHP69iEkEReK/ap1DE7ub/2t/vOmSL1SXSsJfc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VPcXnhQTW6KRoftMnh0E2HBmRWevkKVtYKbdb7jIjkGpxjd0yKFXOWmhd5gzPyjbLp27NwOGqO1VhBunl6IugzNGgfBIqEFxtm2XXI5e4wNZiCw/WlbWKoVI8mc5KwJFKu8zIN1skg0FSSHqSJTruqXn8OpDPP8z4aK3WdA0MfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j0dnTX9T; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j0dnTX9T"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4806ce0f97bso39071615e9.0
        for <linux-doc@vger.kernel.org>; Mon, 02 Feb 2026 07:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770045582; x=1770650382; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uP35BjHP69iEkEReK/ap1DE7ub/2t/vOmSL1SXSsJfc=;
        b=j0dnTX9THcxsVN9fsfMKvFc8kop3ZLIkMRS/Nv+h3JHVkz1K6V2j3Kp3yyEa9deGln
         t2W/b5rGKWR0bWrt5vn2yIwHIG1zPJzin7+AnctU06qR0y/SZ3DbJdpjUpfnGvqb4zme
         KdhWQPUvU4urdkEwQYNnPkoshlsmbpyLTq4dvmnQZIFb0cDHYBYxjQM/XTPsdI3B1ZQp
         4/TeQWxLzXC1V1okzWOgBUhOzcyyDlD71tPzLSBlrDcG2FgFz0n/3IDb4rOKhbps5+R1
         +R5lqNmDlZHyP1HG5YxCvnoLNZkds/Trbpx1nYk83HD5HxZUoU3JGUccDvLsaaZKBXDO
         NqFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770045582; x=1770650382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uP35BjHP69iEkEReK/ap1DE7ub/2t/vOmSL1SXSsJfc=;
        b=cFjqSKwpIUSVW8hUf8Rza1Xcl2a1j8Flvri1FHAEOR5aEbdCYpjHp7ACKvlsSEuC/D
         T8RAcqzobbr8EuRP/KdCxLG4fy5bN8Xw5s3oSG7XU83C35lrTakuUqbv7CPSZbIDG1z2
         eoErWYSmxcq+LnDbgeCsWFmpRXZPeS3bOTcYD+HYyGNb5uEXMC7lqnTvVhssc2lmr7Hp
         HD3dj78Ps0joOero//cyEo23HQDTKC0o1iFupA9zs89gaikX0tGdB06sLJy/lykCJJRf
         hu5XDy7u6nBFxOPr1AVxPFeTQxShT1jpwtPJn8eaGGnDrXTlR16dTiMGP5PAFu8CH1nR
         IwLg==
X-Forwarded-Encrypted: i=1; AJvYcCW3B2NqAaLE0d/v5kfI8Tfw57nJ9ZFi8Qy8rrIempaTPDsYbO4sHRkmC9WEae70L+w/gf5AtdHRek4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy24c/27GfPI/lvxBhv09gzzKhGjr9Tbi/et8Jj6DsC/2DvYs5m
	n/00OYiB0XXLMki/E0YyPRAQe4Ri4QwUsgS22C6IR50gjbfd+OS7AVjF
X-Gm-Gg: AZuq6aLBrhNrLdgMM9lrQr/XufUjyPnddltn5aEVsC1ZsjONcCezNx7PpaWSHtzTa++
	F6R3u6dB3k4dQVhVbAr0QNxGwxhHMNUkla7/MalVST/HYxUSKWQQEAVfZ0iZW7CZLf/sJcIkOna
	jqrf0qCnY3jQhwyp7NbSpU4tV4e8RvxELDMjFtur+ZxYkPkYHcuoZw3+Sy/i8+0Hi+cJJkbl+oo
	kG4DzGvgIOzjvWKmYkqPbd/Xp1ekk4MP22rEhWusQ8tjQb2envyNQfQ3YvHqlq7ZyQHkWtztrW1
	DlU7/sFWvqznTkvTb7RnFGwwjnm/V2djhZg39C7GlvBMFyGoU8BcUnLUHWNlzVWKkzJdFdridrg
	/9bJCC1JFfHNMCuwSCt5Yn3dx8ZFvSHSx+tV6wpUNWsbJo9+6M8gIQwtd+EmqAtGZlw2jLv6kZK
	W4XWQ2iQRjwTiOIlwJ+VFciRg7Z4g5GgfqkZN9XAugYsK0wA==
X-Received: by 2002:a05:600c:4e8a:b0:477:73e9:dc17 with SMTP id 5b1f17b1804b1-482db4992famr160196255e9.35.1770045582145;
        Mon, 02 Feb 2026 07:19:42 -0800 (PST)
Received: from DB-VM.1337.ma ([197.230.240.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806cddffe9sm584093275e9.4.2026.02.02.07.19.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 07:19:41 -0800 (PST)
From: Taha Ed-Dafili <0rayn.dev@gmail.com>
To: dlechner@baylibre.com
Cc: 0rayn.dev@gmail.com,
	Michael.Hennerich@analog.com,
	andy@kernel.org,
	corbet@lwn.net,
	jic23@kernel.org,
	lars@metafoo.de,
	linux-doc@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel-mentees-archive@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	me@brighamcampbell.com,
	nuno.sa@analog.com,
	rdunlap@infradead.org,
	skhan@linuxfoundation.org
Subject: Re: [PATCH v2 2/4] iio: core: Add IIO_EV_INFO_SCALE to event info
Date: Mon,  2 Feb 2026 10:19:34 -0500
Message-ID: <20260202151939.15893-1-0rayn.dev@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <afa85a59-07c7-46c9-990a-b0b34599cdc3@baylibre.com>
References: <afa85a59-07c7-46c9-990a-b0b34599cdc3@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi David,

Thanks for the feedback. You're right—"missing" was poor wording; I’ll
rephrase to "implement support in the core" for v3 to reflect that this
is an infrastructure addition.

Regarding existing users, the current lack of IIO_EV_INFO_SCALE in the core
forces developers into manual workarounds to stay ABI-compliant. For
instance, in drivers/iio/accel/mma8452.c, the developer used
IIO_CONST_ATTR_NAMED to create a manual in_accel_scale and linked it via
.event_attrs. This approach is static and bypasses the standard event_spec
infrastructure.

My goal with adding IIO_EV_INFO_SCALE is to provide a standard path to
report these scales dynamically through read_event_value(), ensuring ABI
compliance without manual sysfs boilerplate.

Does this core infrastructure approach seem like the right architectural
path, or would you prefer I stick to a driver-level attribute for the
ADXL345? Regardless of the path chosen, I will address your other comments
in the next version: I'll fix the "in scale" typo and add the new scale
entries to the adxl345 documentation table.

Thanks,
Taha
