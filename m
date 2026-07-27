Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A3D24248BA
	for <linux-doc@vger.kernel.org>; Mon, 27 Jul 2026 16:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785169801; cv=pass; b=fL9NTBYzzznlRklVhGkk50B2A5Ffl0hCGwRJqoaxbkLQAMzUsm2zfBdG6DbM9kjN7kTc9bGpDMGdD0L/+ONGPvLAhrYNmayxAGUTTaXIqOpBgo7b4RQWYYvIArdgtnjFZmshHbkLhCNCCtS85qJfAaGAxqTLb6hhRrmEqDl+ve4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785169801; c=relaxed/simple;
	bh=4fw+Tj0+DQysQ6LoLPz6sEIQDfLSYGRYcdm5yHyz104=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZRSMxX5N2t+5LLrzRxgD5b1dH3WQTI4OE5qi/N2iCAupyozIIe4AWaLhwI/kdcaytICzB6xAZaKcIyk+ZqnhPs4OKrvmrn9w+/lZ0Zhx3a0t+sHdsGJSj1xZI24FwH1xSaaAnPsId4G3jh8MHWCcJRd83/vEMnxtkbBDEaAEuI4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gWGd5pgr; arc=pass smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gWGd5pgr"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c1740c36c5cso401420566b.2
        for <linux-doc@vger.kernel.org>; Mon, 27 Jul 2026 09:29:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785169797; cv=none;
        d=google.com; s=arc-20260327;
        b=UCNMQ1E4/rvbA8+0LKjoPtF3o0NHUbJ0ADlXURGXJ2IGIJzhoOXS/IsolbnjiXTVVc
         UW43XoPvTShBlt32YTN5JMV52xrYdbTNkfMTfs3KdAnatbKi2w3ljLRcLEfK5/obvs9j
         1M4gP/UdfY8MGbPtI0F5qplxVQFa7NxtTVX6lf/n2gptpL5Y5b99TPaCjfPL5VFMAPzt
         8RdD7Sas5ipGpkxPF8UckkATVR7UIskauEWSA9q1+G07D8xej2cmJ7o0RGWif46zbhHN
         fE3QIPhltXABhCVr26InOsW4NWq62cc7QYKEC0kxJU2PGTn3f9cSQjwRbyQySWlqnKFp
         gPag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=yssewUfVkwN4cFK4Z6j0f4XwofFyqvtnyN84dqAF65I=;
        fh=2UbyarGF2aZNkja0pnBCIlY6c6SCZTvurNNgXS+IqCs=;
        b=O/0B93B0eAAKeoDs6SXn5GMdi2A9N7hn+fD64wQVYY8HPL+gPxFJY+ShDAgD/MGD2E
         1Obnur/xuABkM3K/Y9P3BAoeILX3mfnrJM4/JqKwCLkB5ZwjFsm2Vcr1UHWR/1H05iDA
         R/OqJDw7Oz1aoHYwFcmJj9PmvD89GrGZ+6YPg4/o2sYoUskzhNSQjBPHEa3q3WnBNUe4
         ncdPlPMktKX/VutCVhlO5BIanXxUNcVUUGs69jWWis1YHscimgfFeYa7dxpHLqIF8HSg
         gsN1MzM4K+AcyL2jt5MG+rRGe80vCSqjS4MLQIN2tCG52rSRKW6/u+BeexRPaKs4b2+C
         oLNQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785169797; x=1785774597; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yssewUfVkwN4cFK4Z6j0f4XwofFyqvtnyN84dqAF65I=;
        b=gWGd5pgrF+i8kAH/mOp2E+LAfYJzJS578qtFnTqQh8cz5w8FXc/doegNcSFrB3DwQV
         xZHAJjgkJCy+zyXK4RKSkv9y/YuMu6WyeGfxeHT+rxyO8rUHV4/sO38PyKjiL6O+XBfy
         Qpai5QA0QJnUm2SqZpsvtwCdXFM5WP0fVvb3X+hOp8WSG6w80hCzv6eUyqjLeWW0VXu7
         ZYvpwOP55/qYoup1MWf/qsGFJOI+3FMuyiL18xJsieC01zv6Q18Uo6tZPKnT9aNCowTd
         qj2HlvWlNhPVWPov7L65H/Aqbqr0F3HWZ951EU/BRenkXNzU7Z/htfSv/WGmPHmJZdbx
         Zjtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785169797; x=1785774597;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yssewUfVkwN4cFK4Z6j0f4XwofFyqvtnyN84dqAF65I=;
        b=fHmeuQE4qwyphEfBqmbETbiuSJ7Y1tF7vwAmG34cppCTUvemWIqjabGPc9HhHGD73G
         jrmmqOdveYi3SpFubH3kWtxzVHMS8r1nj478jQGCvAR56AqjVAn3XtAaUDXUGIP0jVsZ
         8edb8kiZ98xp8/TDsCqu4SI8rTZ0qdQ8vzRaowOaoMBa1qHxJ0qY9S1iYlih7ZU09lhL
         UQsV/F5ZebI3yS4YcWQXydekNLW35QimhYvpEzBz92L4AF6PSO7DMFjiftWkgbL3lk6F
         sgtO5nybAup4xLoHWVMCYiDrrVVcoeVWGXxxij+AgKIbEgMuge1T6dOaiifFbNrHTK+H
         KzZQ==
X-Forwarded-Encrypted: i=1; AHgh+RpaRXJh6SfrxFCc1ZgBcEJtrfNgpMLp9O6skPfFs1gfUEblOY0DUMyZXuHv1YjOe+lUxkiN4m+cgrQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfAe3W0n5K7K4vn4s+wLFXobzz1rB4Np0wqjKJ8FHPjFmyE3rQ
	yVELUs1i1f1b0Bq2JlX21CaCrdjsSJGzV42Fkm8j0xWbnsXf3BOQM3NhN0BR3zIWyCthNiGUybY
	XBmjSKdsQzOsDwKG6elqHO58RWZGArqE=
X-Gm-Gg: AR+sD12u6CmGY21ujH74qqWZNcN9dBt6xdf1/zoEWY137qOBiU6EyJq72wld4sg4fpr
	OJIH1AtF1TCjVa+6yPdWiLLUagmxChWBdvq8z/qRxF5ol6D8PSLCco1XH5O2h8W9RcMFZRokm85
	/+DXzmosYCYSt0m2N/z/LVIElYkWCL7hvtpnZO79VAiQkhyQzFpAgQDAIwHMfWdYMyt5Eiwx+vO
	V9aKHjqNkcKnIRtsLj1ttnL+ZDqI+4sEtJ+Q8UTZryhB9d8olqzToeQzxMZLUoLxZPKyw7jX5mD
	Gf7vdn+g2ShynK2dZiXKO1naoBajLySJOXMVvjfeR2n+umk=
X-Received: by 2002:a17:906:7315:b0:c16:589d:c969 with SMTP id
 a640c23a62f3a-c1f1f0391camr387687866b.43.1785169797067; Mon, 27 Jul 2026
 09:29:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260717195336.98500-1-nikhilsolanke5@gmail.com>
 <20260717195336.98500-2-nikhilsolanke5@gmail.com> <20260726182946.79a4ef98.michal.pecio@gmail.com>
 <CAFgddh+1Bk=CFkKYNzB=L++UejkhCEcTHp4A2JL2v+P6uBuF2w@mail.gmail.com> <a0db0e6d-ba94-4577-ac11-6f2d26055427@rowland.harvard.edu>
In-Reply-To: <a0db0e6d-ba94-4577-ac11-6f2d26055427@rowland.harvard.edu>
From: Nikhil Solanke <nikhilsolanke5@gmail.com>
Date: Mon, 27 Jul 2026 21:59:42 +0530
X-Gm-Features: AUfX_mzffcfuwQcRNau6f9N-lR3BG3pBZBzfB8I2zKVV0zqs6e1HssoZ4dKzImA
Message-ID: <CAFgddhKMGMw1rv8EOHyW9ZNMGPW8U5yGCuLYBgef9a+FcMwX_Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] usbcore: Add quirk for 255-bytes initial config read
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Michal Pecio <michal.pecio@gmail.com>, linux-usb@vger.kernel.org, 
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, corbet@lwn.net, 
	skhan@linuxfoundation.org, linux-doc@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 27 Jul 2026 at 21:43, Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Mon, Jul 27, 2026 at 08:55:27PM +0530, Nikhil Solanke wrote:
> > For the remaining comment and log message wording, I'd prefer to keep
> > the current version for now unless there's a strong objection. The
> > patch has already gone through several review rounds and I'd like to
> > avoid extending the review cycle further over comment phrasing,
> > especially since the implementation itself now seems to be in good
> > shape.
>
> I strongly agree with Michal; the comments are overly long and contain
> information that the reader doesn't need to know.  You don't have to use
> the exact wording in his suggestions, but something like it would be a
> big improvement.
>
> Alan Stern

Alright I'll do those changes too then.

Thanks,
Nikhil Solanke
