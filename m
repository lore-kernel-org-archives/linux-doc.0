Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 579FB21B9D2
	for <linux-doc@vger.kernel.org>; Fri, 19 Dec 2025 05:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766122524; cv=none; b=pLXZ3L6S59LHmI40ATbn4NQ+darwvlk1EoqCkPMmbB508yaFCsOSiHlEEFJy9X3Zq+qv3NzHO2hx6MsuGGNzoYNH9j7YgRePgO/JwZPi+z3hNTNEjsTTufK1tfQeFyVGWpA3KgtrZ3uTb+iVR70e4SNrdD3cKlyewhnpkBOumgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766122524; c=relaxed/simple;
	bh=ZhvazSte91iU+jx4QdnhFUqokDPmeF886UFAsqdeOG8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OX0rtBhVlp56/ZgNgMX6JhK7fzCdEGFpi8Vj6InA1nwHzvFxRRk8QKDr/HR28Hs56FLee/dEibmxcDTFG8/LPQ8UzoCAHQz3O7jL3t8zynP9rOAVYXiheQ9FMj6TsWZ3NZKqNANDibkGbyf4w7h9gwnD+Fc50h7/zTbWfmBV74g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bs9p6BI7; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bs9p6BI7"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2a0ac29fca1so12514385ad.2
        for <linux-doc@vger.kernel.org>; Thu, 18 Dec 2025 21:35:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766122523; x=1766727323; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rMTTCuooxMDzb9iO4B2W3oktqAuVxYafRzDCiEnReDQ=;
        b=bs9p6BI7bmrcIORWo/ouvVkwMR2MJQw79BRm4iUgC8T1NeTqSeo+SIADqNiNXFRdBy
         xpFumRz9sK7PWNGUEHAGHUx7DUyiU79cCqzGvukkli+WKMq08QlsDDf4E/uoWwMsoibF
         y/OxEkomcR0WUXCfg7uCZ0RiR2knOXmgWWBzqtRaU2AOYYSCHWQT85fZFxbFuu5ICWmo
         GTHlHqXNFPE7lseUwS7pbfyIcSDCu2NQduswrqexxUVDYQ6JrJCxzQc13bW8WIsTbgig
         fSiCHh5BHSWQwvBsZoHuaPDFJxCfEOJxCVSyTZUpR4LN+QGxXyrL7fPpfDqBj64gCmSn
         e9ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766122523; x=1766727323;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rMTTCuooxMDzb9iO4B2W3oktqAuVxYafRzDCiEnReDQ=;
        b=dD5vLXqhqvdxLInNBrwobe4GFMZradxNeUNKVu2v0oFyaOcYuunRM5jZxaZDJ6Yz6S
         HILWQN+gYWd3wt0PAXzb4vxvfmF3+L2yhihUNQfXdwdqlA7a9Ebb/KByHvmAPyK10w/9
         4i3sOgPUtyvPwVm4abIETVZ4G/ZTNrt71fl4H8NjByOrNS+vjTSHH8dY2qeVLL+gTFkK
         VxVYRtf/ksIEe3k3L8WUvc6EGjoVdn27+fg/LOnu/2Hzyn3IzPKmu0RiWJKtm1rcnQS8
         kHc94EpZIcf19zsoi+Uln3Q8X93rofEp1kTPs19y2T+i8BLYeuvUyJJZRBa9AQmIWOWK
         P7WA==
X-Forwarded-Encrypted: i=1; AJvYcCWOluCCUtAoYC8U9SqyZT4OLgPCuVxpt/hwA+fTrd9bRuTZHb56qHy9QizvkH64nGJSME0h874tdD4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIou8x8bBvp2r+VpdB0EaxV4UpIPFdxS7FR5grkI+xDGrLofby
	+AEsio4Nz0E/P0ANSLcB+9so19bWzLggQZOshtfog8dgkw4YKk9lhS0x
X-Gm-Gg: AY/fxX5H3hyewHXZOIQkDfKvLbEHYuvuiQhgoOHG41IeD8AEbnqm9iQsYVjZF2yTTB3
	MNjyF77tXwa58WPW/slzAkeZnzLKkuSI5TxPZQbnpLPJk9XreS8yU/GHXxUQpXrlrVsxQRjMhHz
	Z2tV2ElkMdyDBmIjvrSA+1KlVIZ7ciHN20gPYZntbI8R1P1LN43wycN9n/4Svou0uA+Nq+czpDL
	I9KI0BOOo9oADDVvEO/5UOLbcizt1lHPnkc7p8SdS6MzYj8F+HYUquGx/FdIuXyaCzELNvs33tw
	/Us3jRwfPT0GwbglXhSsh8SNpPYwAAdRE1XoSZtxsdboCKLxNXFLOo7cJUkQkHCWevqhol5KnGe
	len1k/XYnSHyESBZBV0GsKuYVdNPVNClDHjD/sldrM4wNMp5ntr02qtOlMaKBmZvFtB2YntLKTt
	fLL224rVuaCYGKOtl7sPbt489Gn7W6VWxFiz3Eci62vZvuQGDTLnjNa1BF2fimiAc=
X-Google-Smtp-Source: AGHT+IEckbGoyBwvIpN7+hsyYKZeqS+PjBBpgEAIEIby7FqmlE1JAmvvNFeTVYuKm8/epNSNg9/pVA==
X-Received: by 2002:a05:7023:d03:b0:11b:9e5e:1a40 with SMTP id a92af1059eb24-121722ab330mr2043333c88.15.1766122522555;
        Thu, 18 Dec 2025 21:35:22 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:c932:b7cf:9dde:f662])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1217243bbe3sm4998600c88.0.2025.12.18.21.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 21:35:22 -0800 (PST)
Date: Thu, 18 Dec 2025 21:35:19 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: david@ixit.cz
Cc: Jonathan Corbet <corbet@lwn.net>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Casey Connolly <casey.connolly@linaro.org>, Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>, 
	linux-input@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, phone-devel@vger.kernel.org, 
	Gergo Koteles <soyer@irl.hu>
Subject: Re: [PATCH v8 1/2] Input: add ABS_SND_PROFILE
Message-ID: <ipazh76ewhshd3rtgjr4oz45zaqqmsqfdstu6nbxo3ctrd2x7k@wpd3tyywk5ay>
References: <20251113-op6-tri-state-v8-0-54073f3874bc@ixit.cz>
 <20251113-op6-tri-state-v8-1-54073f3874bc@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251113-op6-tri-state-v8-1-54073f3874bc@ixit.cz>

On Thu, Nov 13, 2025 at 05:02:58PM +0100, David Heidelberg via B4 Relay wrote:
> From: Gergo Koteles <soyer@irl.hu>
> 
> ABS_SND_PROFILE used to describe the state of a multi-value sound profile
> switch. This will be used for the alert-slider on OnePlus phones or other
> phones.
> 
> Profile values added as SND_PROFLE_(SILENT|VIBRATE|RING) identifiers
> to input-event-codes.h so they can be used from DTS.
> 
> Signed-off-by: Gergo Koteles <soyer@irl.hu>
> Reviewed-by: Bjorn Andersson <andersson@kernel.org>
> Tested-by: Guido Günther <agx@sigxcpu.org> # oneplus,fajita & oneplus,enchilada
> Reviewed-by: Guido Günther <agx@sigxcpu.org>
> Signed-off-by: David Heidelberg <david@ixit.cz>

Applied, thank you.

-- 
Dmitry
