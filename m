Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE426221D89
	for <linux-doc@vger.kernel.org>; Sat,  2 May 2026 09:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777714252; cv=none; b=AgWX8idWk1VgESrXgohWZkN0px0MnuKsfiGqAEH17IDg5Rkj+2h7rlzNf6WELuCpQDKAZbx9Ytt4pxqE3ZrrGx++3XOllwl/mJmiilVf/zp87AUjULsB0BgSYw/lhyawqFvqxAuI6f4r2hSXbN+HTBlQ2IRjhgWM260hx4IlgJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777714252; c=relaxed/simple;
	bh=uKF1qmtRTfIm6xDiZUskZlGyxzPEAsrkscint6pWwP4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KHEoKu10DibjkP4fk5abdcl/OrX3T/0z3xm+IyploellFWPfRQMxkMjBUpg0ByeDsYddPTPLZjcboFNj3kPb+5KZvoHXlhr/AbY+Kkgxrv0JW8rHzm+l4/6OZ9XfDjGZs3ENKD4HCTRrgc9Z5OJJlVRp42KJoZ3Fd18KCHQyZeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UBNM3+o0; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UBNM3+o0"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-835386ff122so97960b3a.3
        for <linux-doc@vger.kernel.org>; Sat, 02 May 2026 02:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777714250; x=1778319050; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9sA6+Ur9hXMXrR0E8duGUO4Cz9s8A4G1etroyL69Eac=;
        b=UBNM3+o0ht+sq4u+btQahfIvmf0EPJ+IY/QeKOH4Oy7Rp4D4wGgScql+Kx4s0BCPTh
         2lN+nm2llTOjiPtFoCwmb8tAV1QSA7DN890qGGPobx/MJy5ct+IBHjNDutwLVbyJnjVE
         j8xItwcre16khR5qyoGLSO27925MVe5lF4iU+doQLQsJiST/FxXidfaUABRCz3IPcbcG
         un9wGbbBM3PUkDjntcvPHJitm3IJ0kSR2Kvkkuw4YxkeFiJkS7/l94bAuIDl7mnaT68L
         GVDoIJBc4mzTKokXl6YXTrRREULdYxBYj1xP0uFu5++Vqmve80NOn4ZJkofd8QFpvV26
         8e8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777714250; x=1778319050;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9sA6+Ur9hXMXrR0E8duGUO4Cz9s8A4G1etroyL69Eac=;
        b=ZqBhaUIBzGmYXv68LoWLUaqJQYe1bba1lr5fQEgFv/cxfLgyWC+7UBWyLgy+3mu5a1
         181mJEU6Y6n6wAmfUOxJYCDcZsm3KUQ3Nzfyd2e68PtILO8FX1o0F0v4xkCKt7nV6DO3
         WXmY9JA2jCNIgHzja6O65FXHD95cIkgGJfePpbsN+8G9hqba4R01psyUIhITGdh1JbxT
         bJlBkiXTkoAyj4AOcEDt5yPpfaVCIIND3h222/bspkVs56+sbwLwd+gCuKGH3YJc79oN
         CLFPDUHxQlfJt41zUfJsBG4F8Kk1wQko/N7OQrha9cYBKKgicfNqkmiuMdA8zH8kP3CN
         IExw==
X-Forwarded-Encrypted: i=1; AFNElJ99TYRbDoyfBQHqCOFgP0E/eINq2sPkP4vws/EM4mEgCzOjr+yXtUKMoUnJHtYTPt/jjYKZXshmCp8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKqfudWBFeni5kWb3H3PAd2H+/U1HzaXYmwf6IE4y1HkClDVLl
	VmiW6CfoVXld+doDfOC1CTiH5H30nG8RS1UjONOxpS92anwq4Knlcbqu
X-Gm-Gg: AeBDiethsaXxPr1XC8vJ9LIKsYYNaYtCY8G/SXXh80AjF2JCtuq8y4ziFRrWBVWudmu
	PnU5ossM0qPwJPutvIDPVj5uWYxzSA2xH89kJGRV6j4Mnv3vDzKM8UaDGCw06oBEolpwZG1d3e8
	pVBlI0J4fAuLd6iLHfqTkIE9OuZj6DEDsCXnA+rpE7A4Okz/o62s2BsaCPVWpkPvobpwV9zXHeO
	VNUe2Mpw5vJtub2Yt1PwDATF5lk95kRIAFLNM7H7vExXgQUSRZrXlde/3SALpfpsF7GIomTEE5d
	+OiTI8fWiq/pKs+Lxe4ltcEuAmubuv/bNkERgkHHRyPsd8UmOcGPp6LedNTPWqRMtT3GOwLpDww
	x//g64awrDJxZF6vge7k1jNOlhuFDEON1WK6CJRDSgVGsb9fA1e+43WhWQZJTgZx6cG0ZuBAnc8
	QViG03pPn5z/30915OzvkzeHTzyuKYC06TTrvS+9NTwmylrOhfKtPv+GDO8QYViHMu+QXQy/1tv
	KIsUuw=
X-Received: by 2002:a05:6a00:448b:b0:82c:d986:e917 with SMTP id d2e1a72fcca58-8352d17725cmr2500384b3a.22.1777714250167;
        Sat, 02 May 2026 02:30:50 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83515875bb5sm5115935b3a.14.2026.05.02.02.30.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 May 2026 02:30:49 -0700 (PDT)
Message-ID: <a188f973-7cba-4951-ba02-b9dbf5185a47@gmail.com>
Date: Sat, 2 May 2026 18:30:46 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] docs/ja_JP: translate more of submitting-patches.rst
To: Akiyoshi Kurita <weibu@redadmin.org>
Cc: linux-kernel@vger.kernel.org, corbet@lwn.net, linux-doc@vger.kernel.org
References: <20260502070143.1015416-1-weibu@redadmin.org>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20260502070143.1015416-1-weibu@redadmin.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Sat,  2 May 2026 16:01:43 +0900, Akiyoshi Kurita wrote:
> Translate the "Separate your changes", "Style-check your changes",
> and "Select the recipients for your patch" sections in
> Documentation/translations/ja_JP/process/submitting-patches.rst.
> 
> Keep the wording close to the English text and wrap lines to match
> the style used in the surrounding Japanese translation.
> 
> Signed-off-by: Akiyoshi Kurita <weibu@redadmin.org>
> ---
> v4:
> - Rebase onto docs-next
> 
>  .../ja_JP/process/submitting-patches.rst      | 127 +++++++++++++++++-
>  1 file changed, 120 insertions(+), 7 deletions(-)
> 

Looks good to me.

Acked-by: Akira Yokosawa <akiyks@gmail.com>

Thanks, Akira

