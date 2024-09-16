Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D409360
	for <linux-doc@vger.kernel.org>; Mon, 16 Sep 2024 07:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726472969; cv=none; b=SDjBzhE3BeD5iVwYse/Pf8qG9ESLXUHTOM1Kxtqh/wRZhpbJEPeyfriu5NOknOYiQBF8lMl3qjPp7DxJenuuI2W7l6ZNMyjBhme7BWEp2V62TUs69EBBfx2P5aru04h4yp9yVdXVPGlYlMOwKOxkuQU3fMZn91jjGc+prbND8T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726472969; c=relaxed/simple;
	bh=1MHpCDQVQqqgzqIbyzMgzsTbZZWoH6F3IUKjcpevkQA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pNBzn5nLci0bKg7VP6Lnkb+KsCrnp22VeJ5IOLkOQK+UMGCRwuZdzgorrusyVIT/4R8ohkR91/q0iv6e9oTvLRGq988/NmQE/gA+90z1MmhHSHgstxi2dLHFwqCm9fDUYtwGLdSD9qOjwjX7i2VqZ6RZzpi5DGqxswG8KhAdxFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=U8N5fwwj; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="U8N5fwwj"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7a9aec89347so241511485a.0
        for <linux-doc@vger.kernel.org>; Mon, 16 Sep 2024 00:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726472964; x=1727077764; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bRuvIqIMwhOwH+lOG9lXtXVM6bFb+PSyQglSW2kHCV4=;
        b=U8N5fwwjkgsWN/5xmr/y8j9N9mqlKBk1NMxYobeeGnHginG0pXS3a0jbphGND2llGQ
         Tf0+oSWi7s14UyHt+P1JwWZBEc2MiMXPq8MB6B7gyB/A4Xr9KnW1jsw3aSFcvr7v9hez
         60ESxX++oVlGK0+kvCJooIIBDp8wpiw7dXYII=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726472964; x=1727077764;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bRuvIqIMwhOwH+lOG9lXtXVM6bFb+PSyQglSW2kHCV4=;
        b=GXFRfqv1cmDAj8pY78/O9t+kRCirzhGWVEXUeOZYrLjk3aCIn3vI2bL8/gy1d7ju8d
         4emw2Uf+N78efoMNwDsIBZZBGS/fuX115AJV3iSieCzewEKNU7y2NxpjRTebnWAX0pQF
         d+3fFmZB27zDDjUkVF8cITR8eW9yd9e5m482ZHY0tlQVevabXWxVe96tkX2ptPuVwPBo
         HZihTZWeOjagERvxgH7j8g8nmgn5fjENsOmfhMoRH4vAqbkguzKRE2/oU0SkEqlzO5Zj
         LN7PG/ZSsMGofvjU2ThGlsgpQp8FMsB20wZwu8M+glrLYHBWCF66QTETlK7I9afJ+I5n
         U6zQ==
X-Forwarded-Encrypted: i=1; AJvYcCVO5Lv5ePP8cgX7vq4RYX1C4E01Lc1WYHN99sWm4r9ASjtBT8ppCbS32C2stVGj/WlE25W1hnyFKTA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJTdLS7HZOSnx8hna9jivrxQ34JQx/qiTeaS2mGDYeHHZICJFS
	Z3VsAI/hLCycXmL4+zhP7MdLeNXkMdGBU7ZHBo1xGmICHvM+t6ro1VychSVEbHGVmDjp//PVQE1
	dlw==
X-Google-Smtp-Source: AGHT+IGT7gaIwu0VIjlfsdwARo6kDRUBo16VtHWxu7BoJz7XqI51wdTtOj1hsW2Jb0D/fTbz/D0iZA==
X-Received: by 2002:a05:620a:1728:b0:7a9:b021:ee6 with SMTP id af79cd13be357-7a9e5ee2163mr2215457985a.11.1726472963675;
        Mon, 16 Sep 2024 00:49:23 -0700 (PDT)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com. [209.85.219.42])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7ab3e9b1c73sm226415985a.61.2024.09.16.00.49.22
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Sep 2024 00:49:22 -0700 (PDT)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6c34c02ff1cso24906236d6.2
        for <linux-doc@vger.kernel.org>; Mon, 16 Sep 2024 00:49:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVdw66dVBTiIDAaOv84dvf/s56dAPwmIwqtC6UN2L5aacVinLytMe73SBbSkNn2+Wv2U7O5p4Yj7pc=@vger.kernel.org
X-Received: by 2002:a05:6214:3b84:b0:6c5:17cf:d9fc with SMTP id
 6a1803df08f44-6c5736ecb6dmr232219486d6.46.1726472962244; Mon, 16 Sep 2024
 00:49:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240914070300.42936-1-changhuang.liang@starfivetech.com>
In-Reply-To: <20240914070300.42936-1-changhuang.liang@starfivetech.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 16 Sep 2024 00:49:10 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XBsBMogRYF3NH7qtZ0rDq+7wie8n_Dmyf6X_TfNJbcVw@mail.gmail.com>
Message-ID: <CAD=FV=XBsBMogRYF3NH7qtZ0rDq+7wie8n_Dmyf6X_TfNJbcVw@mail.gmail.com>
Subject: Re: [v1] Documentation: kgdb: Correct parameter error
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Jason Wessel <jason.wessel@windriver.com>, 
	Daniel Thompson <daniel.thompson@linaro.org>, Jonathan Corbet <corbet@lwn.net>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, kgdb-bugreport@lists.sourceforge.net, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Sep 14, 2024 at 12:03=E2=80=AFAM Changhuang Liang
<changhuang.liang@starfivetech.com> wrote:
>
> Module kgdb had been converted to debug_core since commit c433820971ff
> ("Move kernel/kgdb.c to kernel/debug/debug_core.c") be added, so let's
> correct the module parameter path.
>
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  Documentation/dev-tools/kgdb.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

I guess this could have a "Fixes" based on the commit mentioned in the
commit message. Patch looks right to me:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
