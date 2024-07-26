Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F142C6B6
	for <linux-doc@vger.kernel.org>; Fri, 26 Jul 2024 08:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721983134; cv=none; b=kgpHnwOWZkM+Tu7DxqUUrQ6FUrBBV7BvMfz6wc5057MIaPfmPUmbLt1gvZiW/QJ10eUte2brHDo23spVu4+h1BMvzBKYEMO8nmH0Z8z45mggARf9MEKfZZ20msX89lobT3G9ukXKq1ZXR77OrZuIJU69X/0MQh4oIoU454bfgpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721983134; c=relaxed/simple;
	bh=7AC3Io4Kt9BTDyWoNjxZ+pYRus05WYj+r0HbJ1+e7Zw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uX5yE2y/57PRDgZ2HvizIz511Acz5CVgnv91UVfxLHkTrluIxsT5TB61zqDMWmF76KVXTf2UXAa5vhhhdfGDmcsGmABfkLb3LKeXE3HqjMW8Hf1YA/SIx9FXGMKgjkinKgizeWlVlXE0G9vfmxChYOxMOrR6FCwYdo0JhV1mN6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mvlqX+CE; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mvlqX+CE"
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-825809a4decso168099241.0
        for <linux-doc@vger.kernel.org>; Fri, 26 Jul 2024 01:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1721983131; x=1722587931; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pZJmKdKLNSWaXA2BcuG9HwA3qZIS9BmYVk7uzNf6lpA=;
        b=mvlqX+CE4gPt00k5v6io3IPnVrE6ynGSLvwS2EHjdbqBaD4ew0NckHg3eNr8zGOUa4
         osHTRK+eh4/64ZX8iH2f5/9bJ+Xg+Ep/OEkO2YJMU/Hhe1iuMKZJMGWUjZ0LIr9XTjSE
         mEdDopw3uyegMVPzlhAfum+QMV1G4mz9ujMgPY2mLx5ZMlE2i/ocgRT/bsXjCAX+23w8
         CnsJbPeRuKFMMJM8qs4qTz0PdEyMWQj+b6djfQnSDTyY4JzXOmZQlP1TwhwAR+v/O/x9
         x/k66iEY4fxC1BO/ogLsvriSDLnDhnyzOLAjveszcE18sjz4x+YmCDOEYgK29WO/75FJ
         jg6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721983131; x=1722587931;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pZJmKdKLNSWaXA2BcuG9HwA3qZIS9BmYVk7uzNf6lpA=;
        b=dFa2MfmKjaUrrTe4h0Gk4+t07ZoQntc1kQ97kohdGCwYq5R9H78Q8KtbwPP7EtQfaJ
         r4yNoIw49ctCCx27SC7w8LyMrMTpmWoCs06IhA3WzC69rFfoA1Ki5AelkYNjDdHC2Sjb
         31IUtUgnyLP9fbykBLzxeGw3j1xabDfD7irAOrJBbYV3p2fHkWbn9wv98uPoclpPbSFU
         nPGZ9ISBk1/Xfz9RuhPCZtD0D1/hi3qLyz6tOzIkw1tpYzF2Q5w+afjBFMesaRGSp6iw
         4lyxDGkf4vaOe9iW/KLExb1KBnzdc6MPsaJCGAqo/TMJEwYDhFTb9IXPwSbPj4yYxAkA
         GXzA==
X-Forwarded-Encrypted: i=1; AJvYcCU5+i+HMLrOnbhOTor16xszKhNoecGrrCm1y6lid98b2K7Z4X9BtM0b7Q+xm4rSsFp4X8+TdBNgv4XLFVr5hALzuLiI6MypEV3+
X-Gm-Message-State: AOJu0YyIppfnkWP7hTxNnHJrWrHS8Fsfd+KTkfLmDfkY2tdXo7VEVL0s
	ZtGjAZti/HGiMl5Et427C9/7wOeZKLNkYzb25J+o5h8P6Ts5MHNynJeSHmdTYE800sxQRT703Zz
	rqINUOg3vIsSVZvjSHvmRLwhjuGVOd6uV9Yjt
X-Google-Smtp-Source: AGHT+IF8iWTh7DzXW7vu2uBQSe7BEb4YfC0rN9WlsW4xPwpj1weMX+fzAgT4q3Nh4F140wvi8BfU2ZkkeRutUx+hgVg=
X-Received: by 2002:a05:6102:3350:b0:48f:dfb3:f26a with SMTP id
 ada2fe7eead31-493d64737f9mr6876725137.15.1721983131330; Fri, 26 Jul 2024
 01:38:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240725174632.23803-1-tttturtleruss@hust.edu.cn> <a6285062-4e36-431e-b902-48f4bee620e0@hust.edu.cn>
In-Reply-To: <a6285062-4e36-431e-b902-48f4bee620e0@hust.edu.cn>
From: Marco Elver <elver@google.com>
Date: Fri, 26 Jul 2024 10:38:13 +0200
Message-ID: <CANpmjNOiMFUM8KxV8Gj_LTSbC_qLYSh+34Ma8gC1LFCgjtPRsA@mail.gmail.com>
Subject: Re: [PATCH] docs: update dev-tools/kcsan.rst url about KTSAN
To: Dongliang Mu <dzm91@hust.edu.cn>
Cc: Haoyang Liu <tttturtleruss@hust.edu.cn>, Dmitry Vyukov <dvyukov@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, hust-os-kernel-patches@googlegroups.com, 
	kasan-dev@googlegroups.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 26 Jul 2024 at 03:36, Dongliang Mu <dzm91@hust.edu.cn> wrote:
>
>
> On 2024/7/26 01:46, Haoyang Liu wrote:
> > The KTSAN doc has moved to
> > https://github.com/google/kernel-sanitizers/blob/master/KTSAN.md.
> > Update the url in kcsan.rst accordingly.
> >
> > Signed-off-by: Haoyang Liu <tttturtleruss@hust.edu.cn>
>
> Although the old link is still accessible, I agree to use the newer one.
>
> If this patch is merged, you need to change your Chinese version to
> catch up.
>
> Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>
>
> > ---
> >   Documentation/dev-tools/kcsan.rst | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/dev-tools/kcsan.rst b/Documentation/dev-tools/kcsan.rst
> > index 02143f060b22..d81c42d1063e 100644
> > --- a/Documentation/dev-tools/kcsan.rst
> > +++ b/Documentation/dev-tools/kcsan.rst
> > @@ -361,7 +361,8 @@ Alternatives Considered
> >   -----------------------
> >
> >   An alternative data race detection approach for the kernel can be found in the
> > -`Kernel Thread Sanitizer (KTSAN) <https://github.com/google/ktsan/wiki>`_.
> > +`Kernel Thread Sanitizer (KTSAN)
> > +<https://github.com/google/kernel-sanitizers/blob/master/KTSAN.md>`_.
> >   KTSAN is a happens-before data race detector, which explicitly establishes the
> >   happens-before order between memory operations, which can then be used to
> >   determine data races as defined in `Data Races`_.

Acked-by: Marco Elver <elver@google.com>

Do you have a tree to take your other patch ("docs/zh_CN: Add
dev-tools/kcsan Chinese translation") through? If so, I would suggest
that you ask that maintainer to take both patches, this and the
Chinese translation patch. (Otherwise, I will queue this patch to be
remembered but it'll be a while until it reaches mainline.)
