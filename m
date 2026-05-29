Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5FB3390C94
	for <linux-doc@vger.kernel.org>; Fri, 29 May 2026 19:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780084704; cv=pass; b=QnXXhy0dB2rPa/kNmO28f91gBtnqb0uT64fYxXxUth2spYQmJoK+Fd2Wd4VfB/6y0EiLQX7PVTiwpNUOu7Ms2cIUG0+WMxW+t5vtUpUrZT8p+7ra4ZY+Q6YiEhPCX1hOIoczOu0eCsU9c753TEgNEBA6QHXxgwNA9+s+mn7FZGo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780084704; c=relaxed/simple;
	bh=mdMW6L6vLM7AETD1AJOGuPexCgv94MM9Av8w35YdBjo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H+PUxDwKxHQtddyEyEWWMFdJpiNCvgC5UXSvCwv8zHr3U6JkLFtJibLVQooBb40fHpauhljiKVEeMdCuGaVS0yKe2/Ne8f9CvOxnaqpPru2hcSCiNdj0/niuoKw+uRdXovWEPjRLiL10dzmSeumzApFUmD48JuNg0zOXZWAmIaU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o6znuUZS; arc=pass smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o6znuUZS"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4905e190c71so71065875e9.3
        for <linux-doc@vger.kernel.org>; Fri, 29 May 2026 12:58:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780084701; cv=none;
        d=google.com; s=arc-20240605;
        b=d7LdoI8hpwN1HhGfTbS+kp7wTS3QCJkZSHjpOb8cIEq0AEA+svxn7NbEU2Fr6W/buj
         avnHY85o64xlKNGJB32GyqtImLHxVQ4PxMfw+eb+heA6ebW/WYSbN/MUAaXrcMFN4lj+
         AOUVomsy3GLewvcofAPvw6U3bT3ztlpakDxUJNOSLTG38+Sz2XO+ddrjmL+AJ1r/SuTj
         6LUr0ZAXmtrknBQnZQ+81nAJGwcEf0zA5sX210L+kSHj4QrtvHATkR7Och2ilK7NRWrd
         FjerapuI4x1Ty5sDK2TNNhdX5LJ1HPoh3RxybYuolLLfBxugOAHNAy0uOexiccZv6oA4
         2alg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LfwYj4DA5FPfcIbVqcNLhmYJgj92y6YUeOF+OaLYeaY=;
        fh=YnHbk9tCHr50PQCs+1mNIP9uT9xWEjWHIpEvqizXXKI=;
        b=GZSW9XA8X9XId+m095jhf8VxQNWy2nukFJVjzHtpcgs1yBScFAiFu31xcxsJqrF8FG
         KyiUxIbQhd5v3PzotX4qSG6oNghLCmMLVR8t5NWP8dhju9XoI6/5PHLm+RTLBu+wFYvt
         RwLNl+ya7MstUamBzizxepTA/GWCCbijGsGWNqM8fG+sxHuxERQ/DNJyzI0SyT2pRU55
         w0fXNRjg2hBIYvE2+8L5kr/yvcETQh0guf3mS8L9cOzSrdLHTDekeGMCm/8cwszOywJz
         Hd3/KyKGkipRWSjVtbotFA2jq3H2vKuWQMFEQ6a+3fspV2XHoBiBt3D/Ms9rwoSdWWY8
         TxFQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780084701; x=1780689501; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LfwYj4DA5FPfcIbVqcNLhmYJgj92y6YUeOF+OaLYeaY=;
        b=o6znuUZSJv+kt+BcNYd9Nw+PTuUPcR7zEO0tMwYd12Sl7Kl50eTOnC43IMsC2CRlg4
         +HCgMyVptthi0NZ810a5B6GdVFPFpWWVrwyOam7Yx3SVTtCAC/VRmVSuuSkjVd/e69/+
         vEDrKIz8MTAVAer0ybZEl3WQv826E3pptznX9mRooSYzYZ9dhsro14kJywbpx/CEUGEZ
         GnZMfgaEXopiPxzdBFvO1HyNYVs1bR/Ll0QktgWr36wRgysD4GQK5fq3hTCWONxuIAJC
         6c7NtXCCZgbWjnZh26XXjTmKX9+bdRGZIi/5aFTY/2A6wddZ+MPKFdga4JoNUYxAL+mW
         xoyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780084701; x=1780689501;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LfwYj4DA5FPfcIbVqcNLhmYJgj92y6YUeOF+OaLYeaY=;
        b=eeHaEUYIZL/Rk4MorZdvubeaC7G5EmWfrHMTFu8wUG0zgOwf/FM7nAoTwORMpxEo92
         R16DFLFTaYW7PY0Zx59BUjU12cBQugNuN7KtpEh5xBM110cZTAK7idZ36rvQTnECGcaD
         XgvQ/Ib5PknEblGIKHxCBFZYRvtyCj47ylFgGHGSMvutnkbVng0d/89eYEJ7HHvA2pdv
         8ukUENBB2al6K3qCqH2JzwinTK6aaKEPXjVz5SrTUjIxnd02tPY4m7PdIR77aHT5Z925
         FYOk4lj8jlm6wBm8ZyrVzOc5a2WsrKhdcoXGA/17CriJts3bAry2gwh02Vp+2NYCj+OW
         5VUw==
X-Forwarded-Encrypted: i=1; AFNElJ+T61B9vOhmA1LBsdRAup1hM3l7TICb5y28yHHL0pEtnbEuAE9DXizm3/TekaGPnZ5wQeRWJbT6buo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKf0yCzQk3X3+GRBe3izZBQ5blnnSoA24/vqD/JCIVsz5KqOld
	QCrNyhzDj/bT/AW+HaVQTp9p4ee/hZTdXZ5FqHHsv9ttfV5YkliosGkqeamUUZ9f7/sh90UZ6DQ
	aoXs9V1t0MPRLX5SLq72tffea9ncS9ae770C2
X-Gm-Gg: Acq92OHidOo/ubrHMJ7cEI1cac859pejwAEIr5YX3OpMExHn2lBzaf9W6Zcl9NvSHnE
	O7JCsRMqI9rids5fM+/9d/c7/t0ffooVIoWKZcbKgvoxnpTbdVpaJsbwGGhR2ZJX9dJcfH7RiXN
	3QhbcHRfyIssxTyZpktB4BY9NrUl8VQASfAgne/s1d5YzfJDqI1VctGvGz65X267S3lFwsME3V2
	nFLQQxO234YKzt0v7cnpGOksBILtxP4+bR20h1cpHGkBH6fENowiZzMg3bp4cjCVo+8oCLjE9IR
	O3Oh3mwtsPEka4caJz6I8kcYMYVRLOrhRsfk9J+73vYyp+SArjbi9Dd/6Y/z
X-Received: by 2002:a05:600c:1d86:b0:48e:60a3:220a with SMTP id
 5b1f17b1804b1-490a28aa789mr19945345e9.0.1780084701135; Fri, 29 May 2026
 12:58:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260526114601.67041-1-jiahao.kernel@gmail.com> <20260526114601.67041-3-jiahao.kernel@gmail.com>
In-Reply-To: <20260526114601.67041-3-jiahao.kernel@gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Fri, 29 May 2026 12:58:09 -0700
X-Gm-Features: AVHnY4KgMD945lA_grdRhWAHXr8MpUc0KE7VWOqQOVSVohEoWbBZtrIU7fMWjKc
Message-ID: <CAKEwX=MQe_KFZe2vBXQYh0aa-x+E8AzNwmyjJGJk4tDoS9ML3A@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] mm/zswap: Implement proactive writeback
To: Hao Jia <jiahao.kernel@gmail.com>
Cc: akpm@linux-foundation.org, tj@kernel.org, hannes@cmpxchg.org, 
	shakeel.butt@linux.dev, mhocko@kernel.org, yosry@kernel.org, mkoutny@suse.com, 
	chengming.zhou@linux.dev, muchun.song@linux.dev, roman.gushchin@linux.dev, 
	cgroups@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Hao Jia <jiahao1@lixiang.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 26, 2026 at 4:46=E2=80=AFAM Hao Jia <jiahao.kernel@gmail.com> w=
rote:
>
> From: Hao Jia <jiahao1@lixiang.com>
>
> Zswap currently writes back pages to backing swap reactively, triggered
> either by the shrinker or when the pool reaches its size limit. There is
> no mechanism to control the amount of writeback for a specific memory
> cgroup. However, users may want to proactively write back zswap pages,
> e.g., to free up memory for other applications or to prepare for
> memory-intensive workloads.
>
> Introduce a "zswap_writeback_only" key to the memory.reclaim cgroup
> interface. When specified, this key bypasses standard memory reclaim
> and exclusively performs proactive zswap writeback up to the requested
> budget. If omitted, the default reclaim behavior remains unchanged.
>
> Example usage:
>   # Write back 100MB of pages from zswap to the backing swap
>   echo "100M zswap_writeback_only" > memory.reclaim

Hmmm, so this 100MB is the pre-compression size? i.e if this 100 MB
compresses to 25 MB, then you're only freeing 25 MB?

I'm ok-ish with this, but can you document it?

The rest seems solid to me, FWIW. I'll defer to Johannes and Yosry for
opinions on zswap-only proactive reclaim.
