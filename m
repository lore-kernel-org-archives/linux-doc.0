Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 443E93ED13B
	for <linux-doc@vger.kernel.org>; Mon, 12 Oct 2026 13:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791813028; cv=none; b=lOjai0FIsIGlAqUL3StkVgfVM+/qmzas/qD0SZlqLOL8qA7siauqqo9JrmBGRcoBfij13n1hR2+/poBLUtxgs8Y23POqdQ8Ay+ph/09EIqH+YepU/+r5Rfs861mCcH5xo0NBwlHl3qn9N9WXam8TIZgj44K8Miel7RaNo+o8fRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791813028; c=relaxed/simple;
	bh=AOaJHzkVSqUbswf92A6xGyprhL7vg46+nlQdZPHjJRg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W2fSKX3lOGwBCgfUOTUja0dVfjnpvelcCi9njoVW8bAcToHyHKvmHX/RPXzjJbB6+GvqrkJIhJ/pNsYX5AOQN2zBAxkktFyn8iDHiAWwDoAPgPSgWLWyposp+Mk0PFWTwH4ZmiH2llIoRKQ8Gvop7EsftTYo+ghdXKLoKtQokYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jz0QyIzX; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jz0QyIzX"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso1072071f8f.3
        for <linux-doc@vger.kernel.org>; Mon, 12 Oct 2026 06:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791813025; x=1792417825; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zE6VoN+PiWAA9KAYU57i+n0fCcZ23h1hk73tpEWp1XQ=;
        b=Jz0QyIzXS6SOTx4hk1NekRhn8qhOepd9UyGB4Vg+zYY+4ufxsVw2viqS3KebXUD+NX
         jigTDkHE7NdJzugKAXUqtSw5+ObIu3Ok1KdVySagZnN6Upb3OHpdDv8QxKEtYAWoz4j1
         kMcBJS9wkFNbYADLxk9V8Vj4bSL8+iKr5v5XLR2oUAZbO0oN9q8KDXxbH58plTFNVrdn
         bROvq9sDJPPwXP5zfPwvSlrgyJFlmpcUvE0eNDLhZYJ9YZTdajV2Ngx12oT4tgvhw03N
         uzuGNTp3cbhZCjVJpBv1KSyFFaFE8zwpCmVObVVVt3wB346fI6s7IZfNaevagsgLjtRL
         MA9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791813025; x=1792417825;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zE6VoN+PiWAA9KAYU57i+n0fCcZ23h1hk73tpEWp1XQ=;
        b=xZmxIUAeIixDSYZOCkOvh9mk9IUR4CAcYD/kWukKc5NftfsAtNk9pEg1m50rNtiJkS
         KElr89LAksATpjSFbLx6rTRVs2Rpy9JsifxLnahr0yCQTjueowiEQsxrSq3VBruo+l9c
         oc2n2MTUH3IOFD6Qc0ZOFrPPk9l3WjOR+vhO+KrGWh6xTiMAhipIOxoIN11xu4S2Dcnc
         dSWKc+9cHsIc6PvwTw8TGg3+dcsOzcFqtQXu1aCE59Ku7qyY9Q87F3WrS15HJF7rFaSf
         Nj61YaAM+1PaaIwdqtQbX4H/I0V4U2vZevqT96Xj/2itZsPUWVHp52OXIfudrXzhMFPs
         d6/w==
X-Forwarded-Encrypted: i=1; AKwUvByh9duksAy8M0I+NU7ZRZex+3Giah3B54HEi8ibnV0R5oc4wOTtuS0RehMxOL7nla1oKlCOfv5BagY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJB4nIilJIFY+6lQycCEM1I+H4NB8fLlreXPVACzl++x4HvyNQt
	bIvpuypdW9eWxEcG6TUM7OOTqA5AnjuVu3qqf/nLcQhQHUA0AIMwRJhB
X-Gm-Gg: AYBFou2g+FvLmqLNB9pdhrzbTr0k5w1NUc1pNA8lj4up/mFeSErUag++iuyDVefQe3/
	fCc38SYW5SXBPVmaztKb9/OQDthS3Mq8/L6CWQBK5addI8y1q8slEG83Z2C1jS87LIEKayJJOfi
	RoAKiIoQtbSR74M02jLOO2OZOQe/lNWB8NYIGKrQVE4AtCNK3P5UywrGLk1oBXmbP+bEP7/kB9C
	9biioOx6+Ld+VuFkbVBJuIwj+kKEc+/Hk8ZyrzN6rlA20/4wE2nrPNCJLFz7b9tSOnPjaPzJ98L
	2NkWkI5CzBdeHiJsmcmBF/cDcnK01Gzwc829zcHVFxCtuNyMANV+Urwe+0xUEnMSDJXGe6IoHhv
	vIRWgMeol+RxyiBu0T05a2rrVIsHQLZsNiosJh1FBS8T80/o4pptobq4vwcLq+lyeO7gGPn5It1
	L+6/i3pGrFNz1T81xtOU/8WD13fd4tXvPOjH87BhP3Izmnt7AEEhMkV1p2IZbwlVU7SSkpXSub8
	I1yC9gnlSLahlc00vgOX18mtZhnCjbqXMB7oTaxT3wmEZGHcGLOm+o9kPqftIlAaKWqd9ZYiN05
	LDVch48djtXz2A7H4R8OgeAHARXkr/ynyYQeHg7ZTNnvXCkLup3vsZRsUi3zNEYG4DsyABMYvXb
	dNG03TGGinq2BRHdMAGjqDrlseSK43oPAC6jL385+TX5XuYrRPI5M++Hgx/ez98+zMTX2cARbB2
	8uFsq2
X-Received: by 2002:a05:600c:8b28:b0:49f:ff7b:f056 with SMTP id 5b1f17b1804b1-4a18e4a3c24mr158578585e9.9.1791813025261;
        Mon, 12 Oct 2026 06:50:25 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a19f249692sm166741385e9.3.2026.10.12.06.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 06:50:24 -0700 (PDT)
Date: Mon, 12 Oct 2026 15:50:22 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Antoniu Miclaus <antoniu.miclaus@analog.com>
Cc: Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>, Michael Hennerich
 <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, David
 Lechner <dlechner@baylibre.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, "Shuah Khan" <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Marcelo Schmitt
 <marcelo.schmitt@analog.com>, Radu Sabau <radu.sabau@analog.com>, Janani
 Sunil <janani.sunil@analog.com>, Salih Erim <salih.erim@amd.com>, Jishnu
 Prakash <jishnu.prakash@oss.qualcomm.com>, Jakub Szczudlo
 <jakubszczudlo40@gmail.com>, <linux@analog.com>,
 <linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
Subject: Re: [PATCH 3/4] iio: adc: ade9000: add support for ADE9039
Message-ID: <20261012155022.00000412@gmail.com>
In-Reply-To: <20261012111342.48040-4-antoniu.miclaus@analog.com>
References: <20261012111342.48040-1-antoniu.miclaus@analog.com>
	<20261012111342.48040-4-antoniu.miclaus@analog.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 12 Oct 2026 14:13:39 +0300
Antoniu Miclaus <antoniu.miclaus@analog.com> wrote:

> The ADE9039 is a polyphase energy metering device that is register
> compatible with the ADE9000 for every register the driver touches. The
> differences relevant to the driver are that it shares the full-scale codes
> of the ADE9078 rather than those of the ADE9000, and that it has no total
> reactive power register: the register map has no AVAR at 0x211 and no
> AVAROS at 0x010, only the fundamental AFVAR and AFVAROS.
> 
> Add a chip_info for it and a channel table that keeps the dip/swell events
> of the ADE9000 but drops the three total reactive power channels. The
> fundamental reactive energy channels are unaffected, as AFVARHR is present.
> 
> No change is needed in the CALIBBIAS path: with no channel carrying the
> AVAR address, that case is simply never reached for this part.
> 
> Signed-off-by: Antoniu Miclaus <antoniu.miclaus@analog.com>
> ---

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards,
Joshua Crofts
