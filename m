Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D6B17485
	for <linux-doc@vger.kernel.org>; Fri, 18 Oct 2024 22:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729291766; cv=none; b=s19XBRxJAmQ96XtX6b7NRi9F+x1OAgXPF5avzahVT7UOa3VlRhc7RJ2Y4MegJpnFun4etE/9nn2tVdqHQYvetHJXupiBLmwpCIeU8KO36zGQnhv4VjRnxggF4yc8WN7R67KLjMeEnV/FaYxBoPnyR9MYrINN83yyrDrS+mKZKRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729291766; c=relaxed/simple;
	bh=1bBwuyzzVOCNx5VvAd10N7xgL2slk66JywXHsESICFc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KFs6niaYtQz2clsByZaIheHYGD584zNCJMZfBLAxcVUZGR6sb1X0QTi4nRI8W7A8sodV3QyNKd9PezBEJ42u+iAxFHxV/rK5T4tYRV5qklAPSFaXgroZoUD8CJH+uSRQD3lQbs2H86iftc7Hh8BYCBzR1cvvogr6B49Utz3jD7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=aODlrxz2; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="aODlrxz2"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2fb5fa911aaso41544751fa.2
        for <linux-doc@vger.kernel.org>; Fri, 18 Oct 2024 15:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729291761; x=1729896561; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+s7F+58hcUpSSjAioENK+2lQzzQuZ6ITMw0yi3ng4I8=;
        b=aODlrxz2egE2Ndi+RivO0gpKBgT4w7RlDti9FobiiIHtmXFqfdSfhrScs9Yze0HwA8
         tgKIPmoKBc36FAxoPLVxe7eSire5v+T0iK31y8thEOX/YRpezIMYTbkP8gH56IXUDvsw
         twZ7qLOgogSepxxqf4ws/l9KFU5E/Lhi2aPkA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729291761; x=1729896561;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+s7F+58hcUpSSjAioENK+2lQzzQuZ6ITMw0yi3ng4I8=;
        b=mWg28kXPZGFQjYwnjvPv/XhzMJLObnvdm5e9frgSfJTVYL6GsPswGaThkRDMmNrm2F
         BuaCMqVZYVPSuzU2KtsiyPNLFgA5JCIO1GvOrQQDneofH2q+Q344tXv73ONOkmMN5jI+
         AEBhVAbWTBOg+FemvONM85sB9xGSbUS3lZ5glAhCUilg/moHQ0kajMjhIEsLn0kAZH+C
         y7K4hpirjcIcbjEmysoHlOYzOYOy4AUC0VwxQBmkt+74PdXutWEhqFqZvwWaM7r9c/cY
         CD4v9Fb2Ccv4VTtHQ4/lKuosTaFTVmgtP5cabi1NLSw+My6Ls1HYx52yOYmsjw4tHZFi
         YefQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAoeN6N1M+D7DSsUVJXy6su+6H0k+7q3yzwLr3aQuhmsKfiouqYWziy3ufexI0LaqEPAYIx2rWsmY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxArc0tuAaQd8v36YN6U1Ig5BPNv4R9dpDQllqzHOUNDgmVQfpH
	h9gmYVgaZQcMwyZBYva6EZH7j2nQ9p6zizQyFG7xxT6dGn4wrE4n06bSNYoiZ+uBWdDrK9jfpN/
	w4g==
X-Google-Smtp-Source: AGHT+IHSzz6u16ies+bzFlnEgC9QHfpM2V4u7c16lZ8dA0nTDLxdlSEHFv/NKbrNGfF3JXhW4/pbcQ==
X-Received: by 2002:a05:6512:12cc:b0:535:6a34:b8c3 with SMTP id 2adb3069b0e04-53a1533f6eemr3594075e87.5.1729291761449;
        Fri, 18 Oct 2024 15:49:21 -0700 (PDT)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com. [209.85.167.44])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a151f0d71sm339058e87.166.2024.10.18.15.49.20
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Oct 2024 15:49:21 -0700 (PDT)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-539e1543ab8so4666910e87.2
        for <linux-doc@vger.kernel.org>; Fri, 18 Oct 2024 15:49:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXeE6q/6Tz0YnIyoKboTF5ez9CMDiuCMi+D/TCAR5RW3OcdnJ+chWibIKdRjsjqD9DyPxpXJxa2Qjs=@vger.kernel.org
X-Received: by 2002:a05:6512:39d3:b0:530:e0fd:4a97 with SMTP id
 2adb3069b0e04-53a151cf94emr3965821e87.0.1729291759641; Fri, 18 Oct 2024
 15:49:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241018163136.GA795979@lichtman.org> <20241018175540.GA796909@lichtman.org>
 <20241018223536.GA799515@lichtman.org>
In-Reply-To: <20241018223536.GA799515@lichtman.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 18 Oct 2024 15:49:04 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UaNLoJBuzp_qrCVdYaq=-OB+726mWu4q9DCeTrZhpv9A@mail.gmail.com>
Message-ID: <CAD=FV=UaNLoJBuzp_qrCVdYaq=-OB+726mWu4q9DCeTrZhpv9A@mail.gmail.com>
Subject: Re: [PATCH v3] Documentation: English fixes in kgdb/kdb article
To: Nir Lichtman <nir@lichtman.org>
Cc: jason.wessel@windriver.com, daniel.thompson@linaro.org, corbet@lwn.net, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Oct 18, 2024 at 3:35=E2=80=AFPM Nir Lichtman <nir@lichtman.org> wro=
te:
>
> Minor grammar and typos fixed in the kgdb/kdb article
>
> Signed-off-by: Nir Lichtman <nir@lichtman.org>
> ---
>  Documentation/dev-tools/kgdb.rst | 16 +++++++---------
>  1 file changed, 7 insertions(+), 9 deletions(-)

You could have kept my tag, but in any case giving it again:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
