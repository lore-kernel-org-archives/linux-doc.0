Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396A03A9624
	for <linux-doc@vger.kernel.org>; Tue, 21 Jul 2026 11:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784634498; cv=none; b=lgNimjMtUydTwEus2vRXa6MPv5ioHeKT/lpf7Fs1uplYJw6glRaThVNSorVhu5Mi7VbYMJ+hwTNWsSoKyR5xoDTzIqNBdQhNYqHzvGbK6Zsb/T98VAosK3FPBQ5Lz3cwPGLhNIfc6ltCFMMJdc0qZNTsKKCwgATt7Y+ficKnOe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784634498; c=relaxed/simple;
	bh=EwpVX7ZHMTLsHnk7KktRMqnoJ2PHnWSUNUhXFSL8Nmg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S1trcnR1QWvO5a7LFScgVTDPk02YdHBDpXj699U9yc+zgo2NjM3DUQnZb28KY56Zxyib81avhfX48bMfXdRjV0JeygEAGsLZkhqfczH2LzuIECZRM2Z6F17+/9vUlNp4U3MyOY/Ce5rueSzZ38V9ASO0Gc0BhXK2O15UXIUWYus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OrrRGBci; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OrrRGBci"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ce7d2adef4so111895735ad.3
        for <linux-doc@vger.kernel.org>; Tue, 21 Jul 2026 04:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784634497; x=1785239297; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zdYBxmmt+QH571hWt4TmDhR35+9SuouIs4ZUf0AXqHw=;
        b=OrrRGBciOmB7upzIMxRSufL2CnCLTJiAzNEKr1AqxY2MzZKl+1VvgsnAW1+tcVkwIC
         XAPO59JvrD1lx7MpOAYs3AOjz4CBv1NU0bDcnAFHzOLeufhD4nfEU2Uuj139B3h7yfxk
         OA2jy4pEFMSOE+/J7odK7Q3gcnGufl3TrOiS6Vlc4j5H0mR9P9lgU41weFvmsFX0zdQR
         mpabohnMkDs/z/z2La9r9K/Msc6RDbVUfWWiMvWgWdPfaIfbkXQtZtBT7HVjnYiD31a9
         kWkDqrqNYu3nWBRw9663V4N/9MOqNrMvSA05dh2WyZLZD6VVgqGPuWGxyGLwJiKXEuDh
         96wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784634497; x=1785239297;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zdYBxmmt+QH571hWt4TmDhR35+9SuouIs4ZUf0AXqHw=;
        b=nwND9RNcv/EyhlqtIaIYAdlHtNZkr37W5IL3UwiAtDFS2NkqrLeIdbkgs34XRAghnA
         72aBs1/kz1htDLPPuxXnpChOnyxotWIMmrlyhrGm2B0gI5QIOy9pokHGjrO2er5qrAdG
         WzJohWZ6d4GziUojUGBnFzW90pKHN5iVgw86eiIvzBS1Jh3t3UaLjlaRLplX1s5Bo3wk
         Djg4gfgk9k8KnJvqdO29K8n6cEfqmLO19DuWGBoGIIYt7yBPcc7cZ8GFtezmwz1fLzw0
         33Fov9iqUCg2tl0moLHgOO4sifWgRQHU63p6gpgvcH5lGDGKj/mMac5Zjq8ERLvgf7DG
         62NQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr6iIFI3/0sDh9o2F7bcN5zr05j18xuEQXNC2sGtHYr4ROskY7jc9yxkIn8TDZvqiVG2sajBIJMDvI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4ONXvRmAFZ1Sgs0FMp1x0Vnj4GO7RCnYqqdQEs+VkbxRlr4Mo
	bSY+L2LYCc9OTsFLvkhXf2zmrytKerGQX/kKP7OD9DVnjUIRo0zRp9s+
X-Gm-Gg: AR+sD10r7ZDmfW2ZQEwIlTLYWJ6IlIknT6kvoWlXPPr4QLVryw1wHoJx6bFcogEoxsr
	AVZTHENdEtpuGQQ66SjeJ9MYEuVI5mWGrnKsataClFj+lIDn1LwkXMUl6zzcB2BQtLE4KARJWXp
	UZgb1EhtOVLOcUeF20GxjT4b1XzMGnK64+iQdTs2bE+CDxf81mcUVB6XHmzoYZOStG4cRX3Yve6
	3rlCKGmsS12EOPvKo2j1SuCS9LM5SMzEf21vRWvV3AQUHyWsqmmVXlJ4RBI6G37r/MIsyaSnELA
	h7SzSnfBJLo1H4uQi9umyTTLq6ztyaDYaRes7WCQeGVpf5Cxg2m5N1MnxwjaYNi/VQo64t6YtiI
	fETklj7KvL6eGvuNr/ccU8qHFXlXFI8ZQsbQvXhqDK8YkGASSYtaU8ikWztYykhJgJYwOv57KI6
	D+CtNpwubFOjEaAlLk4RduOFynLCIVj2IuaPaLmpfa/O5Ug6P0LLaTO8dQug==
X-Received: by 2002:a17:902:d984:b0:2ca:11af:5ee9 with SMTP id d9443c01a7336-2cf3494b34dmr199820265ad.25.1784634496590;
        Tue, 21 Jul 2026 04:48:16 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448d9b0sm74755305ad.13.2026.07.21.04.48.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 04:48:16 -0700 (PDT)
Message-ID: <4a75b54a-04ea-4f94-bd62-a18e0ce26ebe@gmail.com>
Date: Tue, 21 Jul 2026 20:48:09 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] docs/ja_JP: translate submitting-patches.rst
 (sign-off)
To: Akiyoshi Kurita <weibu@redadmin.org>, corbet@lwn.net
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Akira Yokosawa <akiyks@gmail.com>
References: <20260720223410.421262-1-weibu@redadmin.org>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20260720223410.421262-1-weibu@redadmin.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Tue, 21 Jul 2026 07:34:10 +0900, Akiyoshi Kurita wrote:
> Translate the "Include PATCH in the subject" and "Sign your work -
> the Developer's Certificate of Origin" sections into Japanese.
> 
> Keep the DCO text in English as the original certificate text, and add
> a Japanese note that the sign-off refers to the English DCO text.
> 
> Use a reStructuredText note directive to make it clear that the note is
> specific to the Japanese translation.
> 
> Signed-off-by: Akiyoshi Kurita <weibu@redadmin.org>
Acked-by: Akira Yokosawa <akiyks@gmail.com>

Thanks, Akira

> ---
> Changes in v6:
> 
> Remove the extra blank line at EOF introduced during the rebase.
> 
>  .../ja_JP/process/submitting-patches.rst      | 77 +++++++++++++++++++
>  1 file changed, 77 insertions(+)
> 
[...]

