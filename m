Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA87B2EA470
	for <linux-doc@vger.kernel.org>; Wed, 29 Oct 2025 02:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761703934; cv=none; b=mNGzL+Hllbm/3bHxe+0YSciZLP5CJ5dZaCV2RHuL1c/acs33r7BdojRiFkrZFrzD1My40BhFyt65JUIyzo48SfaSuWHO37LHEaLD4K/EqPPBjAA/QlUvkueuXu6eGxpL4VK8rMCwaFxJnt+RjFimu/ZNR1GRxb10rJzIEd/WmtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761703934; c=relaxed/simple;
	bh=2u/Wk1NbGM/WLbKJV6fG6r7efUoHGK3ttrd2UF7emsc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V5Anik/bupe2wJFi3tgWEhI6Tc1XK/8aSsF4X/0WDEJyJe7Etcsu7+UMoNPGqgq95JvietetxNpDRAoABr7+fOBrFukt3eoASIhOE9UNgvwcA7xM1tvtLw294MpWIcRlW5EwukAfQiZG2NfipryWhi/CZHKKVHI3lITmPaz1P/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ICh07P37; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ICh07P37"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7a27ab05a2dso5786931b3a.2
        for <linux-doc@vger.kernel.org>; Tue, 28 Oct 2025 19:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761703932; x=1762308732; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N8CrrLgMZrC5k6N21+LS9cAyTSZpxUBjaCGZs29jiuA=;
        b=ICh07P37XUywEIBx4LF33DW7w7roUo8ABJkqMP4eV9MLbVURRIjotTuaFnyh3emPeX
         U9kz1WgFC4GvyTKZJspwM47HF8M2gwxF01ZVwsDLQ97ZaHgtapokE/gVbo7KyLQwQyAj
         3He8nJqh+qokvB7wJitk1T8a+0fK5JOxXXkD4rbNACd03eT75mnKvzitsUuCbPWormxZ
         ytcfqcV63Ulesi/60IXKSorpTijaUIJy384dmYiys5BjEp5TZJD3hZYHfATARMRjQ6Gq
         bm7YSgWxUiNyNh2uAuVhWDQLqLe22io+BK9NVuLNLN+NrHsD6lNcZRCa4J8syGf4YMyB
         WbFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761703932; x=1762308732;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N8CrrLgMZrC5k6N21+LS9cAyTSZpxUBjaCGZs29jiuA=;
        b=tymNDJ0JRqfZ+fc9DuuhV34nK4EfVpmd2DZ4YbKpRimZGOmScmMyBa7ZylJJKwK0lG
         7OsTJ/X6aHrmJmNdtZyh+vuJdevPrHjw/1ObyTIS15eXSrIpSCnmQL8inf5eeiWGwRO4
         GY3yUHSZhl8FOQ+0HT2TC/KVwnHaVxauiM52xHZkQnQJ4dHG5ITb3KOgiAJ0FoompeFD
         MXXfp1171Aw3aIiJMQNdZlYlndzs3A+Tvbih51pT4Ui70uUbjgCBtmlpc5eGjODS2Ou4
         iA0KJvQ4+z78EfiGfBtUY0O+7oEfJYWL5imiTUXHfrcaoSBh/RDaagRmAJt6SZVfpY3v
         bnig==
X-Forwarded-Encrypted: i=1; AJvYcCUCAPPiebPQvdM5ixj6ZReHwJCs1S8gDzmjePl0fp1jAlj3wp4NQBSiXn9CMc05zFNmrOf/3ZuiAo8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yws8M03XKfw86wN3AVtyKqs5BQR64sDQIxGPnFAYNDftA59QKx0
	CLeVNclrZGZgIobofQdYb5p0xBoPNtnoPWiQATA4zkfHV4uVmxxoAsbo
X-Gm-Gg: ASbGncty/pYBE/yYofjsK0rJzl1WSXXE6Vq4AALjX+MkwqGqcDMy6nNjFpvOKbm8z5H
	AyIDWo/CZywoRo+z9G03jB9qst2ljxsCpQxB/mhEo0EKLBSn0bMQh/ElUrMormqhEZCU4UQqbSs
	//+pU06mHEt0SRPtV816kEb+WRr1TgX3d3CU/znvAsv/F3V850NbNFJOQGLnaWPiFXg1EPvbqHO
	nox8Et6UdkbScAzH4qDheMoZVjwkHWhlTNYLxs8n08WelqtBDx0EEwQme3m6wm1uBkKglC9DZ7N
	QxIt0v1lwrkNj1/zbmfLRDC+nkXtWufbT/kBNdE9MidIOlEtCuIXyFVaFkgZK0qX6Pkcoyhxo8N
	tLX7ZzlN52pP5JJqloqoZU0HkqXrKvMacmfYxeb32QVgUTfYmJmhCgfZePM1CMxL75L2jqWOiGF
	wAhuzNKa87cVNfrI6MSFQYvX+ZL/xDVoimu2Qc2vWE8lrbWA==
X-Google-Smtp-Source: AGHT+IHrFtNt4K3MmW+9CM5WKiqHKSvULkjAxuQ8fyOB5ct3Cncp0QJTotTouwywzfBMkVjNxjtoVQ==
X-Received: by 2002:a05:6a20:a127:b0:334:92ac:6027 with SMTP id adf61e73a8af0-34653335584mr1361914637.20.1761703931937;
        Tue, 28 Oct 2025 19:12:11 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b712ce3a6efsm11727966a12.24.2025.10.28.19.12.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Oct 2025 19:12:11 -0700 (PDT)
Message-ID: <91aef821-6355-4135-b179-69b845a827f6@gmail.com>
Date: Wed, 29 Oct 2025 11:12:08 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/docs/sphinx-build-wrapper: Emit $SPHINXOPTS later
 in args list
To: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 Akira Yokosawa <akiyks@gmail.com>
References: <eaf4bfd8-fb80-45d0-b3ec-4047692ebbed@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <eaf4bfd8-fb80-45d0-b3ec-4047692ebbed@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Sun, 19 Oct 2025 23:24:51 +0900, Akira Yokosawa wrote:
> The option list to sphinx-build via SPHINXOPTS should have higher
> priority than those the wrapper comes up with.
> sphinx-build will choose the latest one if there are duplicates.
> 
> To restore the behavior of Makefile era, when the documentation builds
> at https://www.kernel.org/doc/html/next/ had been depending on it,
> reorder the flag list.
> 
> Reported-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
> Closes: https://lore.kernel.org/20251007-awesome-guan-of-greatness-e6ec75@lemur/
> Reported-by: Akira Yokosawa <akiyks@gmail.com>
> Closes: https://lore.kernel.org/c35e690f-0579-49cb-850c-07af98e5253a@gmail.com/
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
> Hi,
> 
> Not having hearing from Mauro on this _minor_ regression, I went
> forward and made this fix.
> 
> Konstantin, could you test this against your doc build environment
> for linux-next?

Jon, could you consider applying this fix and making it be tested
directly at https://www.kernel.org/doc/html/next/ ?

The custom "next-2025mmdd" tag there would be helpful for us to catch
regressions in linux-next docs builds.

        Thanks, Akira

> 
> Regards,
> Akira
> --
>  tools/docs/sphinx-build-wrapper | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/docs/sphinx-build-wrapper b/tools/docs/sphinx-build-wrapper
> index 3e6d166d4102..1efaca3d16aa 100755
> --- a/tools/docs/sphinx-build-wrapper
> +++ b/tools/docs/sphinx-build-wrapper
> @@ -298,8 +298,8 @@ class SphinxBuilder:
>  
>              cmd += [sphinx_build]
>              cmd += [f"-j{n_jobs}"]
> -            cmd += self.sphinxopts
>              cmd += build_args
> +            cmd += self.sphinxopts
>  
>              if self.verbose:
>                  print(" ".join(cmd))
> 
> base-commit: 96b546c241b11a97ba1247580208c554458e7866

