Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F6FB3C0619
	for <linux-doc@vger.kernel.org>; Mon,  7 Sep 2026 20:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788814380; cv=none; b=WV8emkwS/51Xq1Ixk1ipCsutKtLAmW4c9tax0fC7dApnzT87P7VsUCfahKVx9BNd5WDdFuv+L4n7Mo1WFmFaCRroyv6Q0VMADLQ6m6MH8qNXHl3mJaIhsWEq1cR3Rp5FdO0M4tR8udcE6A06WvkmlXWTeOAphabx3OkNrTSx6+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788814380; c=relaxed/simple;
	bh=HSRA27bv0CSjidcVERjNYFlK+wUZ6/j+WxBFA3lQiNg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=kcZre1dBjrdA2csJclwusiLTo2XKrLjzPeEykIXZPSepEAN5o839NmrDTlwhDQnUBEiGO0T6PZpNjINCXSGw7BaYgk6CbcBRU1RB4+wLuZFgD6HWH6bccls6KVZ1hytqE+NhukxnOE/LehMTmr7j3jX7nkBxWV2tXzfFmL8fwck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F2JLcaRV; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F2JLcaRV"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4957eefd361so30765135e9.1
        for <linux-doc@vger.kernel.org>; Mon, 07 Sep 2026 13:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788814375; x=1789419175; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eQjT79f/PL7EerkiFGV6aTGjf3ylMrdZfagr1i24BYY=;
        b=F2JLcaRV2EWkuVkdYe+bCv+CLh/FzlZDHwNSX1zBKM0AVNH0O61dMx2xZcrsmwJ39e
         9ZwUbtECjkJ167xG41wezAfQCI4++GvVx/mDMSH6YfxTiipdxJAYma4pqqhcrYL5ueeu
         jPJLuzyaJWW7Gn8Ewcom+g99k0UW32n7R9TT4osyXiyicalc6ovWYtvTLmIH7x6A5/+3
         d6NwCUr6rSZ2hEcx9RrCmHRNPWBGYY039JR2BaqzjkGhzd2IlR/cETVq6B0m5twgsxmt
         7qg+2zDJLxtplQyF63sMlAHDHPjXa1jEh+25N7TKEJ/4+Uq7zKZnYQml7SlmiU3GjCkq
         xLKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788814375; x=1789419175;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eQjT79f/PL7EerkiFGV6aTGjf3ylMrdZfagr1i24BYY=;
        b=MvEjtcrijhJrOQjQwV89nA1YApwo+D3JorIH8bVO+yuxI3PrYgs6PKhjKztaZVNp6j
         8ywT4eakHkr2oRG/9nA33YmFBhRbLl2s7bREJ6rkqvmdrMe5YkUvxGRQGSndUMMBU0CD
         2kMzatM+wc0iuNrMfH6qjpwM9Pfb71FSpONuhHwuIbrgTa74xBZGEu6xgy/jG/HcU++C
         JCL77DJy53NT/otS4MtOgq3Vvj3Or+A3iEZXK78zJfwHag+EF48V23JC+gz04THJOWAC
         6KGZkVxOJ/fG/v4AaZvMNdsCM5jCavb1QW/1znJNcQH093wXADMMrVx3eidkieHanNke
         UA+g==
X-Forwarded-Encrypted: i=1; AKwUvBwx0GhTA4Wi6LzWWoR6AI5YvUFwN9u3++RF92ecctdCgQ3yLHsLYfJ3L3rT0lHSsdo2fSqW9vyDnks=@vger.kernel.org
X-Gm-Message-State: AFuF++mbusqRzmp7/u/tgtk7UttrKdTXcOr68DyDQVIhg6EJ5BhJVpsX
	JrmAa+9XyPzag3Iz7WVlrU2B0GwnxY9svfjZ6oWE0/4k6OR5oX6Y7DPo
X-Gm-Gg: AYBFou1Yj64Lvsrx+l7KqXt2ip8msTRe5mjLizkrSSDLuvpW+wxwjbXiGNmVB7KESgG
	mPfAPP3FEweHF6HjLIAOWhPtLftjjgdi2YiTcDQGcTh+UkuV78jV1SUhwEFBSFzhgNt/azX9eO1
	I/RIedfOB4vsHw2PCC7NdVOIOlAsNQHT3p1cfE+UG6oblDCN+ZglcJJNFTRr2A2Qxmdc+Fo2EZb
	uoxH4KPEUEBWTnznPLKwyNStYf6k2Koe3x22hAP6iVK7Snk++eyxE54LE2J0H7q9pCvl3TFZklX
	T32dL6Od2KC84v8hDOBMDMb4Xn7Z8ZeuheSw7VC37NJkJRYr4WLW+KKcL4BTkd+MaUAnuqfHtvw
	0Ogx4KyokD2iHPnBYSvfYidZgOFKwC+LDF0V+dYj0FM6UvpvIgu+X5x8wFHZUj0exKP3seijuVN
	DuV4bF1t7LiUtlXnN3Oi7R7MpvwcAEaYYJ32MFcvpQu0LapD9pjsgbzf/vxW++ijimPXUQZ8gRl
	aqkOP2QditI09tgrAk+WutnCAkK12Pn0EVhPjOQ+8WE6O7wHopqxAMV
X-Received: by 2002:a05:600c:34d0:b0:49c:fc6e:a3d3 with SMTP id 5b1f17b1804b1-49cfc6ea71amr202238935e9.18.1788814375238;
        Mon, 07 Sep 2026 13:52:55 -0700 (PDT)
Received: from [10.128.10.232] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5d476esm462304515e9.1.2026.09.07.13.52.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 13:52:54 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <7d625678-18e4-4231-b5ad-d840a37cf029@gmail.com>
Date: Mon, 7 Sep 2026 21:52:53 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Julian Braha <julianbraha@gmail.com>
Subject: Re: [PATCH v2] docs: kconfig: fix shell function syntax in caveats
To: Erkan Erdem <hexvalid@gmail.com>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nsc@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Kees Cook <kees@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>,
 llvm@lists.linux.dev
References: <20260907103739.23212-1-hexvalid@gmail.com>
Content-Language: en-US
In-Reply-To: <20260907103739.23212-1-hexvalid@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/7/26 11:37, Erkan Erdem wrote:
> Kconfig separates a function name from its arguments with a comma, but
> the caveats section uses Make-style whitespace in its shell calls.
> These expressions expand as undefined variables rather than invoking
> the shell function, so the supposedly working CC_HAS_ENDIAN_FLAG
> example fails to parse.
> 
> Add the missing commas to the shell calls in this section. Keep the
> Make examples unchanged.
> 
> Fixes: 316d55d55f49 ("Documentation: kconfig: document a new Kconfig macro language")
> Assisted-by: LLM
> Signed-off-by: Erkan Erdem <hexvalid@gmail.com>
> ---
Reviewed-by: Julian Braha <julianbraha@gmail.com>
