Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F5CF313E0D
	for <linux-doc@vger.kernel.org>; Tue, 15 Sep 2026 13:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789479669; cv=none; b=V0kuLh1cgx34FHBhEZa/+Ip4jNyDg6/bWiFRgVq5KBpWK87vJu9MgQhbwO7icD0O9vj198eifDRq1BJVogpWEJmKDDMh9kcFTTXX5JdZc6IIV9vKyHqLU5tMquAQuMm2ISzEXEF2BabV4PkS/1+3uWGs+ougacRq9ySZ1GyELZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789479669; c=relaxed/simple;
	bh=B5rz/HvywjwIe0LUBJ1IJyXaj9n79ASijN34ANZfpEQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JHEMkaeAbDANOENqP63+yDCi6WYexWK38TFjy89I02G5/GZIFjs8bfIqb+KVyOqsm35rAm7qc1cWfz5K7VRG6DSbOOpU3Sy3nf+UlW+fLR6RfeIbF4K7o8R6CY1Vu3KEiEk24PpDydMti0QE8/pYmFs4SFV/4qLIwcqJ/jPiFOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rPIdmwnb; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rPIdmwnb"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d6ff2b8503so1755555ad.1
        for <linux-doc@vger.kernel.org>; Tue, 15 Sep 2026 06:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789479667; x=1790084467; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s2vjAIuglDzNtvLvUN1SnWxls+9kNR302LnOw/HxEJQ=;
        b=rPIdmwnbS/JISWDC99dOEGKcKTbgboHy8Nop+C2aqxiH4N0PQXyJkpIq173379jvFj
         8zDXsglYUIb93lcYgM+GpK7RbQl1nneLQiz1rGeEtJJRbsYCExVCRK8aLoYy1peKxzHb
         sCybGoYw6AYQXjPbLPl/HUrWYdVRmH2hYhkD2Y4ldqI6IbSLW/FdenD8N1I5yshrMkmp
         ZgIemKMXJYqE8+uTlqJMlqyOncAJsBRA2JProfPLyYn5MHgYM5BaJvBAKNcctfTmYgM3
         HQaqhsgWYiNvxohlc9dToBtyOtRccziAvdR2U4Glo6WNCbmjwBe3XfBeNwR9kl6NQsIX
         hgLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789479667; x=1790084467;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s2vjAIuglDzNtvLvUN1SnWxls+9kNR302LnOw/HxEJQ=;
        b=HuExM8f6bFrJjX6oQ/tgiT1ULe8P+Kb6AGuIOCMN0oKvIyg72euwajtqF5IGbFtVXN
         QPTEYgj1+INrtx72SdMn2pR7lEHfqNAgWgOHZabOtxRQrnEPVESZuQfy+8A0K/MQtZ36
         YP4fsPpya75W4lyhUycxSQmqRqaIpqgnSToTTi22KJ7TmXOslIYlrhlEPpvpQ4a9+IAv
         BUPLJDl9UL5jGdGaG+4KsSMau9Pu0J/RIyWC31FkcqHZBHlOxRdK4lJHcxncqsRsargp
         gumHD3DVopCXap/G2WcZ3sjS+JsxDwQuEhHg8cjAflQ0Sogz5cSq5+g5uXZztBEq2t8h
         YLCw==
X-Forwarded-Encrypted: i=1; AKwUvBzl+LK/LvapVmFjo6yuNE/Uc3k6bbAPD8i7wfZGP9u+hUMeGGN2BY++5XmKX7UE+P4lVZTwCz/pEV4=@vger.kernel.org
X-Gm-Message-State: AFuF++n91Gv6BU7Xn5CN9b6mEZk639XF5lOKxYXCwhqGHhlW7lItncQ4
	9Rc4MHx7Ma4CdzNipBvQbDPi1qzsrvht4891L3kKeLDnpwhw/aSRswvm
X-Gm-Gg: AYBFou2B0cvJhQsi1AyeHrBSzM3LPcTzUBPsbC72T7ttghV1J8YaNY1wDfgMIK6Ac5D
	33iWQbOEMKwMCaLmiU/g1GVwlg5ODtnd6b9jGoNMZfyg7MBJw2vevisHDQ7FNF13tceUSG/pZts
	LPnybfEIDhtjFzoJUuLqJRTFcmh4oi7DEFxAYmYr6HEguVL+GRGrGo7Hjh6Gn5ez5pYAy1zCRBp
	pCe43jsEiqsTWkt379sXK/P+Fh2Sq+eCMmE4KGJV/xI5suiSBUXHD4nuWYPz00ABB3ckjn00k7g
	hAoW+I+K1AL6o/2NvkJphn9vLUdY1Hl3o352XBjp3po2qOqIGr+DaAJdpAw69OtdYjlRI1WiuXx
	/21//B6fJUAgGyPTqwkJ3tV7jy/3wgE7ICh5e0x0L5Y08oueXoZuAO87/UlJj0LrK+7C6/1iHAE
	wkuk+iYn64Le38Kf8f+aa517wpBi8F6lDVuukRSWsQVZPHAOlcwbqbW5RQrq+eNUTeTFTj0g==
X-Received: by 2002:a17:902:8642:b0:2dd:7671:3101 with SMTP id d9443c01a7336-2dd76713155mr39390835ad.3.1789479667073;
        Tue, 15 Sep 2026 06:41:07 -0700 (PDT)
Received: from elitemini ([2400:4050:d860:9700:75bf:9e2e:8ac9:3001])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cfce707sm68398605ad.55.2026.09.15.06.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 06:41:06 -0700 (PDT)
Date: Tue, 15 Sep 2026 22:41:01 +0900
From: Masaharu Noguchi <nogunix@gmail.com>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Chen Miao <chenmiao.ku@gmail.com>, 
	Bagas Sanjaya <bagasdotme@gmail.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v2] docs: sphinx-pre-install: warn about unsupported
 Docutils versions
Message-ID: <aqlKnXHFVqO6baEW@elitemini>
References: <20260914-docs-sphinx-pre-install-docutils-v2-1-6a2a6deedd19@gmail.com>
 <b5df5eee-661e-4f46-9abf-1bd9cec8069d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b5df5eee-661e-4f46-9abf-1bd9cec8069d@gmail.com>

Hi Akira,

On Tue, 15 Sep 2026 16:52:03 +0900, Akira Yokosawa wrote:
> I think this can annoy people who only care HTML docs.
>
> Why not do this check after the PDF doc builds have actually failed.
>
> That is what sphinx-build-wrapper is doing with LatexFontChecker().check()
> (see line 557 of tools/docs/sphinx-build-wrapper)

You are right, and that is a better place for it.  v3 follows it: the
check moves into tools/lib/python/kdoc/docutils_version.py, shaped like
latex_fonts.py, and sphinx-build-wrapper calls it from the same two
build_failed branches, next to LatexFontChecker.  sphinx-pre-install is
left untouched.

Measured on a broken pair: htmldocs now prints nothing new and still
exits 0, and the message appears only when pdfdocs has actually failed,
just above the error.  A working pair stays quiet in both.

Thank you for pointing at Ubuntu 26.04 LTS; that turned out to be the
strongest case for having this at all, so I checked it.  It has Sphinx
8.2.3 with Docutils 0.22.4, and its python3-sphinx depends on
"python3-docutils (>= 0.20)" with no upper bound at all, where Fedora 44
arrives at the same pair by patching the "<0.22" that Sphinx declares.
Both fail the same way here:

	              core-api            admin-guide
	---------------------------------------------------------
	Ubuntu 26.04  FAILS 26x Dim       FAILS capacity, 13 p
	Fedora 44     FAILS 26x Dim       FAILS capacity, 13 p

An LTS makes this a good deal less transient than Fedora 44 alone.

v3 follows shortly.

Thanks,
Masaharu
