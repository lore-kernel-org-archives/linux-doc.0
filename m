Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794566923;
	b=Rh8R7zFXIhzhyYmtYsKifp98VIi6R9ye0qj0jn8b750zl7xr3r4CzdjLzs15soDFizE2
	 zQdRt04P1NZuAdgNOEhn2tg2dzHfWFcELg0MEiYFsCSt1x2vJr1v0cj0R9oX+xEheHhjI
	 DNReq2D2ot8bbvVoUPkmlx8WtyK/fEQUzhyE4LqcFJd4uwRo9bkrqaOxwBk2pm3e42kKr
	 3p3bIKNjIPIza7v+zOhdlTwHXuCzDK2lZ8gkgBYFLbCTDCSPnkNPZmwHGS8RSTE14WVKk
	 LAkQ2lDTHMSHn338kJVTgb2qZJKQm6aK8rH2PJ65f36wWJQpqR+gnwNKwciR9YC0pvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794566923;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=VJxPZMTDTlkRuxk47N6sxM8yWbIf1M+mMGAPTSzyXHA=;
	b=mxkghOTB/YjCHfQrDTjfzJYDHzS2bQNSLzR99zMzjxNld9zM3BUuXULsQ+lCc/KaKMg+
	 /VwIX2/V7NX95IElLnXeT3g77zJ8TL3EEVSZ6s5h0Xb4P8zMVCoxM8qA0GAijG3dZGi2b
	 UxXVsPfZqIE4wDxmoPkqEXYaPD7IlDncNgWymZjfaMAxdS+FZtLo48qxHaV9A/7vAC2KP
	 kSJzK//TL/GJrtmT5ftBp/Fp38xXbj+VzGLYiE+Z1RnkKrdY0DKpEK1YEBUiAm2DDvLhv
	 5gK29IXpfoJx0GiCADBR0o4NUlWiWYB5sLEedOJV6B+9pqvJNv6uGgkdUxioWmtneWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="aLqDypN/";
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD88606A323
	for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 10:48:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BD88606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aLqDypN/
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e977109392so4126175ad.0
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 02:48:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794566922; x=1795171722; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VJxPZMTDTlkRuxk47N6sxM8yWbIf1M+mMGAPTSzyXHA=;
        b=aLqDypN/QcjUsI/x/ysWk/104EpShkzolZGcZAQSR2DS/ZPLmvV0bhD8+tjOb4zDKB
         3sG+jLRGCyz9a7sVjoc4PlGQimcPpsnfhockjffmdP4Wpc3HYSvt4CZIBb+7aDZdaCYA
         NokRoDNDEWSsX305alhvyQPDnjO6+b3v35gSPopoyefm0nkXnweC0ranoFoWSaITnfCe
         oJTRuTovP5aqfLVDBmmwxn+QzijxyDJGO1hgHWWB9lSiMKklmqUwnkm07p6o92s8dMo9
         EtA/j7t0O1uVE6BjX7IomtwHo31wBW4XFU5b7gACnRww7mDZmfsr7dD6Y1IbPujjGdlv
         B+pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794566922; x=1795171722;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VJxPZMTDTlkRuxk47N6sxM8yWbIf1M+mMGAPTSzyXHA=;
        b=Y8oUB3BIOnyl31WtNcwyMvmWKs6zEsPO1hvf+E+1zxBdvWYqJlbWnY9f2U6IIvSRJ8
         GN1Zf8oZxO55M3hZAN3rskaAWmKuDMkAL/wscAU03hV0Gn0N25Dpr3z8XO8aPWSk3kMC
         liDgACemaw/V/k1gMUQEXuQxu6HFZmak6VwNYmKJl1nDOCUhfalnd8MNgHgJoeETCJ6p
         4SkGcdbvZiOzoNe7jCOeyKgbbyj0s4HqYzCWmf08RnBgwDEaRSkMie/u47Jwhncm3fkc
         pd35qO6cZr6gVCIRqMeCdEmAJKqvIbOHmeOgTwIFgk5RsDiwryBxEBf+ewG4+oMde3IY
         GHAA==
X-Forwarded-Encrypted: i=1; AL+hErEC913RROzN2Lpgv5h3fA1+sLWyrVYdxKTwdfbeJe1n2MTlGJRRnTvMM2iJSq8k3OeTAUhFLd9xm68=@vger.kernel.org
X-Gm-Message-State: APuU4Z/91a4fm/NJ89ivSWmPClK/6Ry4EolYwqwM7T45vTS1VXTmC2/U
	ezjGAUXmLVMikkLFPozoZ2EfDK2EgePdG9q3JFUwaD7VXQ8DZUbzRBGF
X-Gm-Gg: AYBFou1RYgb9nV75ow8GTyHzbfXGWHff1YiI6VZKG/Dbp2p6PwPsMVC82oi8nl/0ZLU
	8fIg+89enjUaiUCK5iWPbzffPjkIFW22YJrvatSp80OslgXzkMHy+O9n2CedTxsCjHU95hPSQ48
	+Sx1tTU7HmrHJUhk0PJ160EsrApJdvK08nkJrzbl+Dsl8vmFcIe7h9afQcyVPOUT8nMQJphmf7v
	nb4LD/qUWzY2QssG85EJLD79AxkLA6iO/QkceOkvuvzJTFMbXCykni2GeSjcqUDyphkoP5q6R1T
	WDKtZk54bRVyn4SncZd+7u8OpNxX937iTqbm1OYs/EZUIIJ5GfIEJPVW3HFhg2ymO9qHba0uwe2
	52pBzXP/Xbio/G/1SVKGtaLuljXu92fj1eOi2NjwKmoAoKdWdtIJ5lXmscZrWlT/5E0kdrRmVVq
	HvHJwZv+7no83H1KwFssIBZ2EwmlU9IkS2JNOaqLPBEDBxNiSdkQgEmhD8Ko0PLXs0CtBI35bKL
	ZU4KDbKGCQq0ozgdZ7L1sAvDMO7HpT+9mx78eATNzctN4NWPThPOkr1A39OfWro0SrWWvAk4lNw
	rRFc0KxTYY+0vodgUTZCCLPU5EoMh6P9nrbt1pnlDPoI5GtnOhCueo7fnK5/TaM6bEjkpCNKoVr
	RxmnMqqZDfzWb9SWF9pE=
X-Received: by 2002:a17:902:db0c:b0:2dd:c100:4248 with SMTP id d9443c01a7336-2ee0dc35db0mr20668645ad.44.1794566922402;
        Fri, 13 Nov 2026 02:48:42 -0800 (PST)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f75c875sm8140875ad.15.2026.11.13.02.48.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 02:48:41 -0800 (PST)
Message-ID: <d2b47b79-a579-4ac2-84ef-de477dd84a66@gmail.com>
Date: Fri, 13 Nov 2026 19:48:40 +0900
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs/ja_JP: translate submitting-patches.rst (patch
 format)
To: Akiyoshi Kurita <weibu@redadmin.org>, Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261106225619.12869-1-weibu@redadmin.org>
 <20261113024405.871312-1-weibu@redadmin.org>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20261113024405.871312-1-weibu@redadmin.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Fri, 13 Nov 2026 11:44:05 +0900, Akiyoshi Kurita wrote:
> Translate the sections describing permission requirements for
> adding tags, the canonical patch format, and subject line
> conventions into Japanese.
> 
> Update existing cross-references to point to the newly
> translated section.
> 
> Signed-off-by: Akiyoshi Kurita <weibu@redadmin.org>
> ---
> Changes in v2:
> - Reword the explanation of subject line sorting as suggested
>   by Akira Yokosawa.
> - Translate "global" as "大域的" instead of "世界的".
> 

Looks good to me now.

Reviewed-by: Akira Yokosawa <akiyks@gmail.com>

Thanks!

>  .../ja_JP/process/submitting-patches.rst      | 108 ++++++++++++++++--
>  1 file changed, 100 insertions(+), 8 deletions(-)
[...]
