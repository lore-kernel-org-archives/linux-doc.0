Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBCAE848A
	for <linux-doc@vger.kernel.org>; Sun, 18 Feb 2024 09:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708250331; cv=none; b=FAGUta4Qr0A1sLhUQl2AnDowm2VkRRRPYds3jNlwpJhGKD6tYRLX7kWmfSgsRYDByjnPfngf+e7560Auu4tJqJ+c+XQauwO3JEnVL3wg20FqJyHymPE15PBdQb01k9dL63gplhzLo/hNggdhz4kqDFdbjZsGDgKpnaCvZ3/1lqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708250331; c=relaxed/simple;
	bh=GFd6q6TDJsPCFLX5bsGnMskeqJgQWdH9kwUXTWlpiE0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gi5WXb+LwJxyuqi2bioSTvd51kPyFzNhRjDXHClD+3N/lxPsHZjKHBUoRShyWvhefUJ3qf0LVGSqgROawvcFEDeS/XoMp/Yr9tRv4rhfIFEfyuQn2CxmOdvIX4oWBA/istApTKjXgBdR/dGZYfGfSnzYmoKly6nblkgjOWAZwcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CQdKbWEU; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CQdKbWEU"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2997a92e23bso94302a91.3
        for <linux-doc@vger.kernel.org>; Sun, 18 Feb 2024 01:58:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708250329; x=1708855129; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0wdJmgvKu5l1mjfhd7RljLwlhgJ8s2u0rgS2x2cicVM=;
        b=CQdKbWEUleMxEzIznQWEd9ehWxwexlTJ+AOl0C14ZY9Jb+1ZtvHyOsxuy/k0F++4em
         Ph0Y3PhtxcNm6hwNCntfaxPPqIAQ33dDDcQZj0RfwBsOAvYQOKqwznMchogjLrQQ+w27
         jNt2ATjn/ipKnRUNxTuOKfUdiQDJ1bmS7VWqsPr2pzjErhemZZfaoAZT0mxOeNIeiGfm
         EY9YXDHu9ONySrpNTaYx/MpxIyoLt1tO54SY3FMQ1/wWpkPIqVYBWtMcaMc8/KYbun9I
         gDZS0zoqew8AubX+8fcVBRHT8jkOPp1AaR4NglzgH9C5Gi1m4DUzAhwrqznyl2bQNH6h
         KcHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708250329; x=1708855129;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0wdJmgvKu5l1mjfhd7RljLwlhgJ8s2u0rgS2x2cicVM=;
        b=AbQIPS+b3ZFB8/MbXtHWmZ+SALrVyAIZTb12iSVLk2LZ9qcWsCvHFKtOJ85C8Dy5xW
         CuAKT7A4RySr7Pp9sO7tI6c958xFQvZk3ZrLCBcxcxScUO3pDXVaV341zOkNi4vm5hEu
         Mq/VjtO1qps9d92PXy9VxWQgWWnexkrV2hArxslCobaoHCNVFskCH2oOKTDiR4AMFYE6
         s/53C+dLASgaBKAm0s4dUq6abKCimLUgtxv1TpA+ZYVPHU22uwqadInRiebwDcQH1sZT
         w7PN3fwZ3/9jz8o38lfvzmxkD9cZN4oR4c4NsiCUjn9M3JD7TWl45kbdnVkzKLvxLGZU
         TTLA==
X-Forwarded-Encrypted: i=1; AJvYcCVO/z0Psg2mMznqgAEXryBMCClVLLpEM5ZWDdhJil9F3dIUTTxOMXKCrrZZZD7WMWWnJYUEUfHRV+6Wflp6bRWBzuW09Oi2jWgP
X-Gm-Message-State: AOJu0YwQbd2B6sIIaM4Hr/52zRdOQSCPNCX+UJHikGl5PWtZylcx6xAg
	aVvKnJBPO4lRdRhVl7N2s3vA8ABrEQrWg7Uc4+iL6rC+9uzEZNCv
X-Google-Smtp-Source: AGHT+IF0LjBypN6LNarHAi4nFdQ4nbRimYdJzDwLHIJAYaYlLn53tJGzoXPkQmgBDgm37FB3X7GW1g==
X-Received: by 2002:a17:903:120c:b0:1d9:c367:2032 with SMTP id l12-20020a170903120c00b001d9c3672032mr10837166plh.10.1708250328962;
        Sun, 18 Feb 2024 01:58:48 -0800 (PST)
Received: from [10.0.2.15] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id f9-20020a17090274c900b001d9eefef30csm2481666plt.6.2024.02.18.01.58.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Feb 2024 01:58:48 -0800 (PST)
Message-ID: <64908dd3-17c9-47e3-a076-d78105fb823b@gmail.com>
Date: Sun, 18 Feb 2024 18:58:47 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: PDF misery
To: Jonathan Corbet <corbet@lwn.net>
Cc: Vegard Nossum <vegard.nossum@oracle.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-doc@vger.kernel.org,
 Akira Yokosawa <akiyks@gmail.com>
References: <8734tqsrt7.fsf@meer.lwn.net>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <8734tqsrt7.fsf@meer.lwn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Jon,

A few comments on PDF of CJK docs. 

On Sat, 17 Feb 2024 14:29:24 -0700, Jonathan Corbet wrote:
> [...]
> 
> The *other* problem is that PDF generation of the Chinese, Korean, or
> Japanese translations fails with:
> 
>   xdvipdfmx:fatal: Invalid TTC index number
> 
> This, I am thinking, is likely some sort of F39 bug.  xdvipdfmx is
> finding the CJK fonts just fine, but then something clearly goes wrong.
> I'll try to find the time to narrow that down and perhaps put in a
> proper bug report.

I think this is because xdvipdfmx accesses NotoSansCJK-VF.ttc, which is
a variable font.  xdvipdfmx/xetex can't work with such fonts (yet).
See note at the bottom for more info on variable fonts support.

It sounds like you have google-noto-sans-cjk-vf-fonts installed on your
system besides google-noto-sans-cjk-fonts.

What does

    fc-list | grep NotoSansCJK-VF.ttc

say?

I'm wondering why xdvipdfmx behaves that way despite the fontconfig
setting with:

        fc-match "Noto Sans CJK SC"

    returning:

        NotoSansCJK-Regular.ttc: "Noto Sans CJK SC" "Regular"

This might be a bug in xdvipdfmx worth reporting.  Or there might
be glitches in the fontconfig setting.


Uninstalling google-noto-sans-cjk-vf-fonts (and
google-noto-serif-cjk-vf-fonts in case you have it) should resolve
the issue for you, that is if you can safely uninstall it/them.


* Note on variable fonts support:

In the announcement of LaTeX fontspec package v2.9a release [1], there is
an entry:

    - Support variable fonts under LuaLaTeX.

It is not explicitly mentioned there, but in the opening paragraph
of Part III "Selecting font features" Chapter 7 "Variable fonts" of
fontspec's package documentation, there is a sentence which reads:

    Currently OpenType variable fonts are only supported in LuaTEX, while
    Multiple Master fonts only work with XETEX.

As the xeCJK package requires xelatex, variable fonts are not in
our options, I guess.

[1]: https://ctan.org/ctan-ann/id/mailman.6477.1707925238.3764.ctan-ann@ctan.org

HTH, Akira

