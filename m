Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793202221;
	b=NvYC3bdHt17OqFGR3oa2Ms18hAT0BGKBissVmmCGUoVVw5Wyz3okIAVHASrCQ1DXHDct
	 MMaUDPtygeLafV1L3jff42u0Wduf1C5n9maaJte0sdtOUYC4ixmqWnwf8QJ5tqtT2C7F9
	 Fdg6o9sCu2BcrKP6QmFxSdaMb6clgiqlzIK8tj8DYZznCQzgHVpP81CUMwMETmXI+U6Tn
	 4qBypvd7zIWbd9Gogy1ffRxQoJ/qEWeaD8AZzzlz5Kn9FL7WRxgau4fpa36CNMGrF4ST9
	 uvZilXxtaZpwnRKGsQOuo75rND4aQ0l4xu4Q9jf9r49n1LkSj+EUAHnsOCwCs1Hqndg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793202221;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=DVOOLLsmYNxFDN2neSUnVtuLeg8VjPxhidpQKIzCTQU=;
	b=PP3Vq3JbwpVs/6pTI4ddpB5XYHPJ3UkcQdCh1CAWsiXzWzk7+aVipa4vwlCL44ZaEG9m
	 ph/qinCt+7px3O5rzQ+cAlhCRveHiPlolvWt9JFbJJjpr2bcIiVrzWFMYcVSSpaAWV/DP
	 NY9mqueBBa00z6xWGaF+ZI07eZHvUGJzCw8wl1wILFzAw7bBEk5OX1+EDPjz5Dy2xjiRf
	 uLdDqvr6npELy9Q59Y4vj4v7lKiv02/nM0Yk4IW6hRWOLizSLbQFZvutT0ftS2VLqGqCE
	 X/J3V854uljhNt6Q/by/F8AQA3s/ID9WCLjYhU6nyUYEC8miuC7k+VskCh5qrHnHQgA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IQqFfx4r;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.182
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B60A606A31C
	for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 15:43:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B60A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IQqFfx4r
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3ac97e45a79so8187051fa.3
        for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 08:43:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793202219; cv=none;
        d=google.com; s=arc-20260327;
        b=a23qbr/8a8reqpHo7vDO2mTgrw4ct1hJoR6UaL5ed9mcA+c29KJsyhtnKyfwbpMRmM
         tUVS/RkV969iIdmgVepqfpMCYD+IZ0d+u3rxlw2T2Ex1VDq5qdVE6kiS/Luhk5RYTpuc
         CxVeJYn80UFKXWBCbiouEQNw/RlJP0bz6Kvm7ddV9s2NET06EZI4neRx4KrY8xv/4OvG
         7vfLNJL3PrHotqpNW6ATQxtNNqY0/WYErIjupNF1gIxztHLB5OtgU1w4O0yzzvLz3A8Q
         VM3hcxzSteln/p9ALlfqGdLCPNOro+cZtuXX9WHFz0Phvr5eQqHjEhdPbVKwx9Fo+MwI
         eWQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=DVOOLLsmYNxFDN2neSUnVtuLeg8VjPxhidpQKIzCTQU=;
        fh=sOI0TgVMIxaoriifejSIN9zx9k56tzgEaA+U1namxa8=;
        b=AaBeszkWeVA7A8fiAjg3BRaqjo4SRNxoM1960UToQGQZCtaiG2ZC1hsorRMkm5//T7
         EHkXazNtp580dot6ZrHZtLbTnkUQJ+jKFheU0g1WlhondN7vntZVNjQj47oYtnLeS8YL
         utxyCMiwX8P/h1HtIRohNzeAHzPgBIa5rlrDd5HjcDvSZYpIgRlW4mJJ7gERKYISpm+7
         EYouUg/15xUui5wKi9pLBhawERKzW8ft240HEEQ2pxaYFnReP6k6wC6OKmYT2bRWOy7S
         axEnYUrZYyACGdqKgCrvFlZLIGj/XTLepEvnjWKvsibqah21N2tgncMsUX80z4E0LZmK
         ZQWg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793202219; x=1793807019; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DVOOLLsmYNxFDN2neSUnVtuLeg8VjPxhidpQKIzCTQU=;
        b=IQqFfx4rbHCH0DIbi12l9QSCcD8sp0iAlKzsIwur+LBHKnWKd/48ZuVFlLQNinGfzr
         9+Jo8u9YjtY2gCbZhM1ugN0iZtjD2W+/ojRI/m6WMJd7z/RrsP9dYE/fZYsxTua4gggJ
         uD6HlfED8L3zw2HF5AnLxho7zYACgkuUk2AqKR5OWARGiCo3LGLkBoqS4CTzllOsB3Z8
         nyjPcVw1WWWKJi9nVqMCFzd7c+B/I5apujBIaHDB+SRM0PPq21JDPnOl97nYfK4/YHl7
         Z9EAWa637ZT6Oh/UFWyyDOjnEVSQR1irS5ClX9iWEAwTJG4MCMNgWf1Ac/Zfl1RNMU0/
         0OwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793202219; x=1793807019;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DVOOLLsmYNxFDN2neSUnVtuLeg8VjPxhidpQKIzCTQU=;
        b=rgdzmJhUhuvYotWIpFuzSTQRobY0lQRBedCfhPat1GSoWJtLQWi8ynryUkuje9spkx
         dUptgAdnvzsDErDxNTuiUu3LeMHthK5hflGA13KJYMJypfXiza0mALkextp6qPrTRFZ8
         SEbcgTRFDHZGZ5rZF7Y1NbhcGUVT2G+2LXsNx9JAMNi5wDqY3NAI+KyMHLumDGtb/zyI
         fSQC/va8c7udFaSx8IWm2IGerNTml/rMcHl64HNy+NkR86sPMS6Q7aOUpybPIituYYmP
         /FIOYvFiA/35yaMZ9t+T9AgBHWXUXrvUkShfF0W07H2wjtGtAqoG4BiM5R91NYyzVMuO
         TkYw==
X-Forwarded-Encrypted: i=1; AKwUvBwMQO0NHkRgvJCXvMf1MT1Smdd17A6h8mrrdtVwSI+kSUns5Q1eG5fOtdKWlxj/ssqPXvwBKhsSYNU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKQI2sty8tmANagZZiDq3rrsj1qBi8UqPGqdnU5IvkCmn3v4uPu
	uJnO0NqyqXbOvKWUeJRnJy6PV0XwypCNI92wDyHuR6R/D9aqhFYf69oTqjkOlw9WV9VurLRylQJ
	YWHlVthsjOolaOhkl8sXJtbldMyTH0Zw=
X-Gm-Gg: AYBFou3l6S3I0T2Pz+9/PmBad2i16ze3jPc0I7CeZdW881gIyObvlftJYrWC2y5pLW2
	wlYMiiPb/+VAKKlQh+rSHlpENkSIn8/iZ45462ivob4ASeG03nq2PDIstTQpsjxHq8fvzbWxbj0
	XK7AdLWPBrDk846o+iaJXN5Uh6oVWsobyS2XEvSiFQqamIjf/kIQB//m3QKJA/2oNiLBDKbpj4l
	y10yebtWg52m/yxcw5dQl32+TdZV+pHJsnlTefuTua7tsGt6DxvgQd7mo1kpMbwXU/MqeM56iwG
	n5scsdV6dc1CckZsnmMO0HAJugXckaeeBWffPDwbZf7DI7x545V5ifxN70JYp297B2jXV1rbVWF
	d1pe+CGC+VZ78CYz7MlF67I4P8ffkNBGKGHIJoQN81YbuGvYtPW4rratufh8+9LBq8DUW6bPyo2
	wSNRzkvwwm/95SUsw1RYrZxRyYnhWHHASXyzho1qkY30Ky3xCy
X-Received: by 2002:a05:6512:3a93:b0:5be:52d8:f70a with SMTP id
 2adb3069b0e04-5bfcad1f7b2mr1381582e87.34.1793202219168; Wed, 28 Oct 2026
 08:43:39 -0700 (PDT)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028024333.795917-1-ruanjinjie@huawei.com> <20261028024333.795917-3-ruanjinjie@huawei.com>
In-Reply-To: <20261028024333.795917-3-ruanjinjie@huawei.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Wed, 28 Oct 2026 12:43:26 -0300
X-Gm-Features: AclHuK8ctFKN0EMd2E0XLfbEQe99ggeVXVUtiN5LeR_vMR1AjTiWTZfSaXZksYc
Message-ID: <CAMAsx6eMqJdM6BDZB=mxn8JSayyYSv7oMdsM_yy89q+p1xigiQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] docs: sched-preemption: Fix the list of
 runtime-selectable models
To: ruanjinjie@huawei.com
Cc: corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 27, 2026 11:44 PM, Jinjie Ruan <ruanjinjie@huawei.com> wrote:
>
> CONFIG_PREEMPT_DYNAMIC now depends on CONFIG_ARCH_HAS_PREEMPT_LAZY, so the
> none and voluntary models can no longer be selected at runtime; passing
> either to preempt= is rejected with "Dynamic Preempt: unsupported mode".
>
> Drop them from the table of runtime-selectable models, and describe the
> build-time situation instead of implying the choice simply depends on the
> architecture offering lazy preemption.  Keep the per-model descriptions
> below, which still explain how a scheduling request is honoured under
> models used by other kernels.
>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  Documentation/scheduler/sched-preemption.rst | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)

Hi Jinjie,

Thanks for the patch. I validated it: checkpatch and the scheduler docs
build (SPHINXDIRS=scheduler) report no errors or new warnings, the table
renders as expected, and the changes match current mainline
(PREEMPT_DYNAMIC depends on ARCH_HAS_PREEMPT_LAZY, d3d16750693b).

Reviewed-by: Daniel Pereira <danielmaraboo@gmail.com>

Best regards,
Daniel
