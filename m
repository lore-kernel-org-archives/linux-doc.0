Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F295D38BF8D
	for <linux-doc@vger.kernel.org>; Fri, 24 Jul 2026 06:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784875751; cv=pass; b=SRxU2t6V1yNHPur1XJjHwJkc92wN3Wxo6o8AfRlidf9ct+TVsYajWcROWysHltpqL8/icjcRdiEn8eX+DLtWcdKh25LyObKbHrsgi+2CrWgRfhNLwHILq8X21YgMl3JSDEIRdeN3RoU3IIM8LhdlPjTyvfZIS6lstU9/vP8YzhQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784875751; c=relaxed/simple;
	bh=qHJ3iSvLxWTe93Xmvgg0eDfNABO/02uwH+5n0OOAs+Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sMAyZsHvIdmIdJn+m+8g4T9tSSQq654CApOVj2QQHz4za5xaDSnkiJTtTdGgZ2TyrcmErJcqgTd9V6u0A8gJ58QepUDqQW4hukVKuZqL40ubbeU7Qx0GvutnPWD7nH6XEnqw7cyRkVT5+ziicxdvAAAdTcxZy9eFOm37rXRCnvQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q+jP16lO; arc=pass smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q+jP16lO"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5aeb7ccb9f0so9454e87.0
        for <linux-doc@vger.kernel.org>; Thu, 23 Jul 2026 23:49:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784875746; cv=none;
        d=google.com; s=arc-20260327;
        b=iSfPRZm6O7Ujm8V6Ya+3mU2+qP40nBz5w7i6Fj+X2uEYjEkIvqF0T26mb7bb9xY/xt
         Sc5WurtNaFoJPp9pplYHU+fFOp6Slc+pl5x7Hv1PHhV2ERc9voSZnmQEc1BzQ5cRCUhl
         sqsENhIv2WlWQYONGDEhP3fvyrjjaNdKssaw+nJXHCJdLd55y8UNmyXU2atbTQszAmxR
         pwwwZScEMSwwp7NmOWYr3nOr58et8wLXlhAW6UjtWs1xWrMbtRopcruCTV7ZLqUZGpux
         uelYQHOmffEpRnYVJtaYXecjaaqsK+x8w7VWRe40+4v0/jUj0sXSM7FwdlnL6mgJxikv
         a48w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qHJ3iSvLxWTe93Xmvgg0eDfNABO/02uwH+5n0OOAs+Y=;
        fh=XAf3PZb+h6SLwWkvCW1ipcsT4q67TW0MXuiPkfj4RWo=;
        b=G9Gdd2Y4vM9ejgvX+sZJFPnRGtQuMK2UZpwutQLW0+HEk0h6FizLRxRy9adD5OQyTx
         0KgUhCeiXPSPfbQRNf8R+jPGtn7b32GNAY17FiqWWj1ZB/mlXa/xu8+wFzvV84cwQkag
         6VK7rMychlA5tHaQ5QoxsJBNy7jPzNYGS8SN4SrvNeqcDGJmDCxRNSyiEVyNXBoPUCRP
         rFki1T8VEUurjushybv24A5oO99PIjN+xZlOuj3WsRrDbLAsq9FlnVyBpdDZRxh2xl0b
         PNBvraYY0DNQPl8b/EcNBS8s2IEcqjBOSkXA3POJ1QEqwJdDgA4tw8s/5Fd4wfkm2qpV
         RgcA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784875746; x=1785480546; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qHJ3iSvLxWTe93Xmvgg0eDfNABO/02uwH+5n0OOAs+Y=;
        b=Q+jP16lOeLelIs/vnIXFbls4vWQl94k6JwpsteM85rnhrSZLe7GrFLp22I+GLiHzt8
         wdnx+rNijmIbr6AHozsfVTSuUqh/+tozpDz24QVosh9AwWqhYmzzkjzc4wDqt1ci5X2E
         8SDpt/elVLAnhCR6QUr2r+Z/5dwmaU1PWqsWzdAJPT9v98EYJCOdnDjIJR4bfmzfgA64
         u+l0sfTiIqIpCopEXyKTSvoDSJ02h6AMG2d6LKHLAIB7yKb9J2pSooFWvDQkAUjDAz/p
         kGbYZLS3YoyZqAvSHOL+K1A0c9bKR2LZ+0iri2r/AOL0BTKWjGxP37y61zH+qOrCcFVC
         VTkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784875746; x=1785480546;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qHJ3iSvLxWTe93Xmvgg0eDfNABO/02uwH+5n0OOAs+Y=;
        b=IS4y6Z7Fc15uzAgHg5A6E+pOFsMvYqy2pUpnQcQpuMjnbCcEtXtLAy3FUlLG+QQ3Ld
         LdozSVfgPI8nvG88qBiEes5TQRfPyDT+hyZp3kfexu3fvtajJx+1k7on+SLDBpv0WuCD
         IhlyarVk98X5MDXozhHSw/XpDqFeSK1PSvzagZc0z9thL72CxKK6OM9o9+OCwg8BmuKp
         I8pBUtIRURNk4XtNyB57DFcWPvKWSq6vr8KgyCWbIp3kt3GPIYAfgtkKWseORkZ7aCEt
         WA3reaZ8Ozb0NNGqXfBqCVvytO94eip1li081yrIgtYsKi0AbEE98I6MHc7ER4WeGxAm
         Zx8w==
X-Forwarded-Encrypted: i=1; AHgh+RoszKhXu/ednTOYwgltkCGpPoM+MKnzv0fcy9DwrUm3QeKkvZbyBUT6QDKlT53pvK9GKZBiY9tJvyg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQSWvdAlsNp50f26Ky7nYEtMP/S8NWJyJEVx/gJOQxCjVTUQ2W
	VJo7+4DhIja5mjrrBoJzRcYtQZWAb9iHwU8/bIK+/ZlkeoTH5g5xsjtAqIvpelTfgE8/ZtVv7wH
	oHwFN3j8CEejJ9AT6iJHvm6e+B6dnxwk=
X-Gm-Gg: AR+sD11V0Ac3q8uGunwLS6AUD5stx+6DpmUya3bxWHkQHEX28caztzVLIIIYh5yZT3P
	P0xJrHcjbbMSASWmV0NRxsGFeWu8UfSlH1rvO9PyZMgcKHOcJmK9ythSHRVdO56uD6VzTNwRKv2
	56CdTMsPbubPe001iAsarlzjriXLr/vbVn3AyxrnB1utkqup01EzMmepoVhLCnckVHLln2jhW4s
	+Eg3dCdIdNJ9Wqsm1ovLfRULIMzp/K2tPVkwQ8b3Rtfy+ZMvTRJmw5t4bU1ymc7Xq/A4eCesIlJ
	7dMcbevsBPx/1D9g/UMEHIL8NCfylTL8QuJXQdLFdolkmCtd5CCvNRs=
X-Received: by 2002:a05:6512:220e:b0:5ae:bf3b:cb0 with SMTP id
 2adb3069b0e04-5b2b7b17f02mr375739e87.3.1784875746100; Thu, 23 Jul 2026
 23:49:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260721215542.98435-1-chenyou910331@gmail.com>
 <20260721215542.98435-6-chenyou910331@gmail.com> <amCrB5xVlENcIzAN@wyuan.org>
In-Reply-To: <amCrB5xVlENcIzAN@wyuan.org>
From: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Date: Fri, 24 Jul 2026 14:48:54 +0800
X-Gm-Features: AUfX_mzwYCUpGTt4lYrj14PRuTy5VFI3o1gCgWWfnY5W9YYVi2D7NCsSSYKf3kg
Message-ID: <CAKspUh+=oLCwiTK7eYNn3Av7bFcqj7k8nAs6JouwKY3L_G4W1A@mail.gmail.com>
Subject: Re: [PATCH 05/16] docs/zh_TW: process: localize terminology in email-clients.rst
To: Weijie Yuan <wy@wyuan.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>, Dongliang Mu <dzm91@hust.edu.cn>, 
	Yanteng Si <si.yanteng@linux.dev>, Hu Haowen <2023002089@link.tyut.edu.cn>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 22, 2026 at 07:35:35PM +0800, Weijie Yuan wrote:
> Better wrap the commit message to ~72 columns?
> The same for 03/16 & 04/16.

Will do, in this patch and in 03/16 and 04/16 as well. I replied on
the cover letter about the wrapping convention in general.

Thanks.

Chen-Yu

Weijie Yuan <wy@wyuan.org> =E6=96=BC 2026=E5=B9=B47=E6=9C=8822=E6=97=A5=E9=
=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=887:35=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Wed, Jul 22, 2026 at 05:55:31AM +0800, Chen-Yu Yeh wrote:
> > Localize mainland terms to Taiwanese Mandarin (=E6=96=87=E6=9C=AC=E2=86=
=92=E6=96=87=E5=AD=97, =E8=8F=9C=E5=96=AE=E2=86=92=E9=81=B8=E5=96=AE,
> > =E8=A8=AD=E7=BD=AE=E2=86=92=E8=A8=AD=E5=AE=9A, =E9=BC=A0=E6=A8=99=E2=86=
=92=E6=BB=91=E9=BC=A0, ...) and sync with the English original: mention
> > the Thunderbird "Toggle Line Wrap" extension as an alternative to
> > editing mailnews.wraplength.
> >
> > update to commit 4971ca2007e3 ("docs: process: email-client: add Thunde=
rbird "Toggle Line Wrap" extension")
>
> Better wrap the commit message to ~72 columns?
>
> like this?
>
> update to commit 4971ca2007e3 ("docs: process: email-client: add
> Thunderbird "Toggle Line Wrap" extension")
>
> The same for 03/16 & 04/16.
>
> The rest of this patch seems good.
>
> Thanks.
