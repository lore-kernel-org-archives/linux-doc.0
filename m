Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 260B737A494
	for <linux-doc@vger.kernel.org>; Thu,  9 Jul 2026 12:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783598885; cv=pass; b=sPynbd9Xizkht8ZbceNQRgFkb0uKM+YLD+NUu1PYA7xjYVEybV+K05+R6VAbb9TYh5oK5X0jaDQ7yyfA2GjBUkG8JtepRgnCubmprWmMQ/iSe2sZdg8fqf9msHz54hqwSYo2MlIB872rh4gy1IYrpUWTs1OqW1HSuzqtyKkn7c4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783598885; c=relaxed/simple;
	bh=a6Y1S5Ajy1SpXzNXk0LIHBNb0oBZqXDnfQ4G7nbeaC0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cBu2TecipaKRxcQ3w+fTbB/rkFIsHfvkHPuVzbrIoxepiE2QC36qJNMBW/G2LL3SG4zV0I+gDR62xvOmZyPGVm0UBpBZz9kM3wVnUN5soYWMYQ+o2qDACzhpJf2Hc7W6Xtnlpceg606S+MDUdjY1DVaCtlHhknYA9OoxxxL82Cc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MLVJ5Kjo; arc=pass smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MLVJ5Kjo"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-8ef1dc934d1so7787396d6.0
        for <linux-doc@vger.kernel.org>; Thu, 09 Jul 2026 05:08:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783598883; cv=none;
        d=google.com; s=arc-20260327;
        b=Q0AbJO4WQcjo42HvjawvZqrPyzrDgJr401GnRulvz0ZhvNss2WW5R16wfjBLwU6XKw
         qoKYAEFgXT7Ke9QHV5r9odQWzXZCKLeYxl1pDqyyScfVVBOdzP1Xld54k5FmsmXY41/u
         vG96T47IvVXRdKNG6s5xEoo39heGggC5ZSoWQEif9xLBWqHr30n+tf1K/tuEJg/rH5bV
         VzRGaoazXAWxKhxPDOR9tYCh3HtetZNOnn9HvoafE4Ilx6776hFp+PrJiPB8213xbjm2
         /3eygdZ3zlbFpV2rQJX9uD8hgDGFMiVfAjG4ORejoEfeD3cGTLswfCguGiYGOGVYD0lD
         UwHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=a6Y1S5Ajy1SpXzNXk0LIHBNb0oBZqXDnfQ4G7nbeaC0=;
        fh=7DnqmBIQHfFHYmwXd6CstbhbtbVjU4DpUu27lbBDx8k=;
        b=BtISza6KG138BPR9Gqa/dmvhR7a450MvdXAxUuJzObOPsrZVi281o5vkG9Sa74+nUj
         fcVcTLj/M+RWlcqe0L6kmeGRlSaOmInggKGgQce0XHtWwFauLebcqVZHlYYVXKZ+mnkA
         PgqHrBayByCYLH6hD3xrraxUAquTkDnuAvc1xX9JnzMII7YTG/VUA8iWjCwNGdCBUREa
         AvN+jUgjMUDGEX1PzQeXwuzAdwbEHAXkWaBDjX1yPfXhkurhPcd3+gRd2BNQRWKfVUAF
         pcnIhmaeDMZ+JEfz9NE9Pa1IlvTrq925YLzZGhjqiDJYc7zLh2lSWrnpSEniTZrQgzrl
         Fe6Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783598883; x=1784203683; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=a6Y1S5Ajy1SpXzNXk0LIHBNb0oBZqXDnfQ4G7nbeaC0=;
        b=MLVJ5KjoR4L7tJJTUlXZy1y3l9rnMYSYSEtMFwlS2iMI/Lq+4SLOPiA8oqzeh/qKzK
         cvtAQjs/VDIK79OAvnH0gomCQaCIlc6Vd62Hh0r5ut4SpHNBx+ZpSx43qSMWqj1Yfhsv
         c0qFh+U4TIrsYt46SXPHYM/tbJNxvuLVtZxdjGRYAEKxdyEe/WYTzuKplj1Ee/B1y7wh
         5GfCxH4d8PLjRcVEy2shorEViwfBxf8IGtpSAx3gK+bQCMXP6B+7bpOFZP0RLqQRt8CL
         8mdI5gc+/tuIgpmCghDnLzlWnHGV6vS1w8pogYcTxn6X76hDBzboLpOHeILAohiwlZcE
         cUHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783598883; x=1784203683;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a6Y1S5Ajy1SpXzNXk0LIHBNb0oBZqXDnfQ4G7nbeaC0=;
        b=B/PdtvFFUalH5cZ0tTXih+KnWNNUWp1Rm8HkLDIrW20CxGAawXNDiIUgrMM2KnnnpR
         KSARPfqWn6njKSl9spNIRrlTmL0CAsD62IZSRrvGjEL8tqSYObBPipXhgS4hM18QqiUW
         ITfAGKK+HhhyW0NyxCoFHmxAk0+ffYwRBKhgbl28RU6cwylGIriHEJudKJwQS1SnVNEq
         pxNim+lE9VgzXjQztNZrKiXKAkWwhHUj4WUVqWPnQr3O3jk0BvoZMTpc5z70Ngsvddhq
         vo6ej+2IsEc416MWGuDdtp4Qxukc6WK+4UCwWClec0JeWya4/wmfIL4s/zZBr4BQubNY
         lpcQ==
X-Gm-Message-State: AOJu0YzPX5g2Cn/Jo+NoiqdY+XFJF1wEl0P6ctOCZ6JkRgj3ZvQBtrWh
	bax7TzKRmBnrbvAG4q5ki6PteGaNFA1wRmtDfjDVfbfQqJi3nsyM+YD+/wmTmtScjb6ml+8svSJ
	MlC8/gBmAisf7jalApOkSHtVCvH3TNaq/hSVeHfE=
X-Gm-Gg: AfdE7ckg+kSBplOGj/kyiRWg/xXqQANoVk7684FC7tOc1YEF6kbigTGAjROnnKQpYby
	Z7x7MWoDpoNiGaaqIp8P2FsZj6dAQZGjg8ERA5OIjoiqkwmfku0Go5ULgkJFkhm+ZKyzLfKXHP7
	zKpNMNJ7l/tAgjmmGuR9RcjiBWy7dS4IilkyYrJzEsZlTq16lqim8BaJii3SSOblAgy//g2m3k/
	BQOajEMetR/69NLzubv89abhFVxSrGBk69g7YNaFib4FgYLMZIJx4exi1L939cQ1gnVOVtOm+UY
	f6XxWX8xUQCyo5WQ4qawQ0LWcsmU9E3bIj28lqm6hBe+lsLQVfB9PufHphDtd7I29hfFAMAJ8wO
	CvLd3+qA87w==
X-Received: by 2002:a05:6214:19c7:b0:8ef:2d29:699 with SMTP id
 6a1803df08f44-8ffea63a4e5mr28748676d6.12.1783598882780; Thu, 09 Jul 2026
 05:08:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260707195122.1655-1-ygorotavio.sjc@gmail.com>
In-Reply-To: <20260707195122.1655-1-ygorotavio.sjc@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Thu, 9 Jul 2026 09:07:50 -0300
X-Gm-Features: AUfX_mzfwRS4KaHe-OAgV6V_Nq3-V9fkUTqd6x3zPWT43efOZa6-QEFXlceIz4A
Message-ID: <CAMAsx6dGQLDKzFvbkUUgoECswDsWvdnUhc8x7xhJE5qYhJnGZA@mail.gmail.com>
Subject: Re: [PATCH] docs: pt_BR: Translate file process/email-clients to
 Brazilian Portuguese
To: Ygor Otavio <ygorotavio.sjc@gmail.com>
Cc: linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em ter., 7 de jul. de 2026 =C3=A0s 16:51, Ygor Otavio
<ygorotavio.sjc@gmail.com> escreveu:
>
> Translates the documentation regarding
> Email clients info for Linux
> into Brazilian Portuguese, maintaining
> consistency with original formatting rules.
>
> Signed-off-by: Ygor Otavio <ygorotavio.sjc@gmail.com>

Hi Ygor,

Thanks for the patch! I applied it to my tree, but when running make
htmldocs, I noticed a few rST formatting warnings in the new file:
Lines 83 and 328: Bullet list ends without a blank line.
Line 138: Inline interpreted text start-string without end-string
(likely a missing asterisk or backtick, or an incorrect space inside
the formatting).
Could you please fix these syntax issues and send a v2 of the patch?

Thanks!"
