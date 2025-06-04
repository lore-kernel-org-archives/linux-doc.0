Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9786028BA8B
	for <linux-doc@vger.kernel.org>; Wed,  4 Jun 2025 09:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749028213; cv=none; b=MfGTWwGr7MFLOYbOssSmYm4aynmHcZ9VZ6SY+TAUbqck6LiYZMs9Dr3nC8CHm0XHnimcFGel+wnOTvf/SAtiNFYeBVM4JeH7tvFuGdaEHS9bD8gCPqToxNhageNqn7xqWevoYcnaQtbOF7AzM6seZeMKT/kcOXsotzsuawkskWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749028213; c=relaxed/simple;
	bh=oMW4MaSwYK2mtMHKkMAV4IJupcfvcbWA0rhfA8QumkE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DMC99iucee77nBjwYLM1minN+0xxUtylex5ebC0jW8IphRa/NxLz1J366ySnD+ggrikWT5sd4wvs6ZIObhBo+020+Y9twrcehTfmvE3qwBCIv7jJHUpbwCf/F5lzNslGWrlTYC6N9us45wcdgv61/H5neM29clHP1JIDoQBr4NM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=WxZFvWXm; arc=none smtp.client-ip=209.85.221.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="WxZFvWXm"
Received: by mail-wr1-f66.google.com with SMTP id ffacd0b85a97d-3a366843fa6so3479004f8f.1
        for <linux-doc@vger.kernel.org>; Wed, 04 Jun 2025 02:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749028209; x=1749633009; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CwmthOPo3ZeLQxOOTrEK+OkcJyUZaBTnj0LjrMJahQQ=;
        b=WxZFvWXmWUyomFHlC3XbrdIdOPi/tsaJ3iKX36VyBqNPlfZsk7/CuWYTdpBAZXcfZl
         n+pbUrGPvRyd1leBkaCDvhYitVP44K+WSPbYLnH1sV4WSDuERuTH5esa4KMWYbZSlGOn
         kh+v6mEkZdIypchHCjVff8rqlSXDq+hZr99VkK5NVP5P2k/SPJsVruErjCpTVxgMz8mX
         2WOUpsNq5qWl4yKo6r2MvX7cLUryBkF2xsrlnbNu8YB33RCgPjdpXAJ3UzpfmVEU+D0y
         uduETeb0VxtapyjwN+RRFG6t3DiKh96zhZL/242U+j+9cCDE83KP7QiJ9vaiqdBqnmCH
         c9tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749028209; x=1749633009;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CwmthOPo3ZeLQxOOTrEK+OkcJyUZaBTnj0LjrMJahQQ=;
        b=UxZphKAIMcyFs7R9CTk1sVdHm981WXIeIE/aP3b/lYT0+FQmDaF8G+N+x1RoRXaW7g
         6Ei9epCmvmGtDlx2mCJbtZVGsiDhc0DLM9ly0yM/5WR9f2u3JuYeWP42z2/+psY880lP
         WuyYAQT8GoaARaFSr5DrAdgbBWqERyAfvQx6puH3vC+Rau8PhlcC4hKdQkM1N6cSZAzH
         swri67YTtzofgS9sdL3/quvcTB+PX7df9X11x+YYQgkEfhwieDqwRFKHdi5DuFHg2U4N
         odE/WMmrLfoy37IubHmEzjaAe3n/Mdc2niGG9v+jPcMl5uIzG891Q25GVYH2FbI51JkS
         LJwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhS9aYvVeJTan+qHaVLyFqg18QiBu7gLV+Qj5fi7ACiuiC1mx0w7+0TFb3j93c1Bzd/Km/7Y7g+RQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAXmzRBKsBwbL4eROJoldpYLev2aJTqvAAfjPlVGUg2roI1erm
	8tcqYLvrSrF9/LXjICI/UDwGihCPY5dlAnPK8XFJA3MkW17DSAqT8gp6H1xAGJiDJCI=
X-Gm-Gg: ASbGncueD6RW04u2BA20apMO4lwKIxU24E2JeEe1xLIbw3CiiheociHt9/iuoIIoD7M
	OBbV+k4Lh4TEhHRyhU9CJksNpgxXb2MasMO6C7LQolcz8bdI86Zq3sWgD2fO/rGD5uv1dR/uYB6
	toI11uh24q3WSW2lBvDQ2EsPKzehOszDEqu21KeINX0fOZLVzXW+JKgdegzo1bM3j9YIGhMLCt1
	rNqKqoUIu3UzX0DXwR/qWptov4yiBn6Pede7gKgicGH0eXH9+G8NbXypKFrNULv4EH2TvfDjJXH
	y0WJes+PaGTJ8QUy4tu/ivbQLd4v0+AvmWZJOYPWu/+mjxBoZfT7EOo9N/j5nZDIAnxy6A==
X-Google-Smtp-Source: AGHT+IHwbnqda0WUALZPR6BH5wV/ac7KPGSXsO6qAre2G/QftXFom+glyTD0clAk18FXdlE5JE+qRA==
X-Received: by 2002:a05:6000:4011:b0:3a4:f7df:7564 with SMTP id ffacd0b85a97d-3a51d6832f3mr1560987f8f.0.1749028208696;
        Wed, 04 Jun 2025 02:10:08 -0700 (PDT)
Received: from [10.0.1.22] (109-81-1-248.rct.o2.cz. [109.81.1.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5215e4ce1sm877352f8f.37.2025.06.04.02.10.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 02:10:08 -0700 (PDT)
Message-ID: <95f14895-5c30-44e6-b185-824aacf0f997@suse.com>
Date: Wed, 4 Jun 2025 11:10:07 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] module: Wrap EXPORT_SYMBOL_GPL_FOR_MODULES() example in
 literal code block
To: Bagas Sanjaya <bagasdotme@gmail.com>,
 Masahiro Yamada <masahiroy@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Linux Kernel Build System <linux-kbuild@vger.kernel.org>,
 Matthias Maennich <maennich@google.com>, Jonathan Corbet <corbet@lwn.net>,
 Peter Zijlstra <peterz@infradead.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>
References: <20250604005110.13040-1-bagasdotme@gmail.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20250604005110.13040-1-bagasdotme@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/4/25 2:51 AM, Bagas Sanjaya wrote:
> Stephen Rothwell reports htmldocs warning:
> 
> Documentation/core-api/symbol-namespaces.rst:90: WARNING: Inline emphasis start-string without end-string. [docutils]
> 
> Fix the warning by wrapping EXPORT_SYMBOL_GPL_FOR_MODULES() example in
> literal code block, just like other examples in symbol namespaces
> documentation.
> 
> Fixes: 707f853d7fa3 ("module: Provide EXPORT_SYMBOL_GPL_FOR_MODULES() helper")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Closes: https://lore.kernel.org/linux-next/20250526180350.06b825de@canb.auug.org.au/
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>

An earlier patch for the problem was sent in
https://lore.kernel.org/all/20250526211039.163449-1-khaledelnaggarlinux@gmail.com/.

The fix should go through the kbuild tree as the problem currently
originates on its for-next branch.

-- 
Thanks,
Petr
