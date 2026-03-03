Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD3EE33F384
	for <linux-doc@vger.kernel.org>; Tue,  3 Mar 2026 15:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772551420; cv=pass; b=PadRWYlgn5Z+xJHMi9jzjd52wRN+hm5toZoDUp92D2nnlOYqH0UCSxXb9ya5JVs44u06Zi87AfkjblCMN85IMJhhlCDGkaeoZKydXRkBzNZueGlCsQaDrXs9fmvkpWQDW8wiQWShoDRkwoTnq36rB3GVQXI24VoNt29McTdvIRQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772551420; c=relaxed/simple;
	bh=+hOYBjv2tr/ICJLAtXLjMEmSe6vKJHH7uOfwrf8crZA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=trVgzME3k2plmYwVNu1o6GbOIcgAiPcdNftQTJSqZ1qC1HehicUiJELBoJZxfMqyCKQoY+rmLyQwYuSfDSq0XX/i9V4N9oLD6yz2Q+33UxrX9JdS1BlYuXZToECozqrB87YeNBYcaQqf9T2GMoJ3ZMS2SNz2NIOuppfGE2jG85A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=U88FcJaW; arc=pass smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="U88FcJaW"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1275750cf9cso4617723c88.0
        for <linux-doc@vger.kernel.org>; Tue, 03 Mar 2026 07:23:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772551418; cv=none;
        d=google.com; s=arc-20240605;
        b=K4ZG3Tr/yQ8zCUgLMQHyDgWmQxC1R+BemYDvS9v/o8neTggg031qZIAiJQw4mi8Ae1
         wVP51VGmXfsFlLmaZY10T0jpWvZKtJnxmWCakSuAMpdyH14YNTD/Qg67CjKO7VWG57TK
         7g5AcQpzmrR5JY5b5IbmTj4GjIS2igxQteDAkQ2S0Tw+T8F9THsEKImboGb8tSqczVmC
         YAmc/RquBJV11RXBRWoofnFt04LHRJpnHq5Yxp14TRJLG0xnjeGpG6qYdds8MDDXzJAT
         tD2Ei/NRPClxz3nc6q9LE8EGiGvUcUdKAgpkbJm4vx5qWqNqxW0gMk7W2sr/anF8u+C7
         BqdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=PIHHMa2z4DUfmfcEzutr+tGhOCrJS86irFkaV0WK1+Q=;
        fh=33Go7m4lygc1IEyczWG4Lr6mfBAf38BXJLIv6d32Uy8=;
        b=L5Nb78EwbjAPmT5KfBsoWd/Stmsdw2eohUf3dbtsOkYzojhx/FntG4rdFbW1/1D9W2
         BBfDr8hmkrdG6bl3wHCncQacscS1giqRPTMyLAOa5IThnc3Vg3aOuDv7jnLHdFgaeEB1
         WFi6GXfuJ/tD/X2pAbHf5vD/9/s5E9t81yhRUCzzfQi88xM69b0FSyJMR4Kq11ppQ6eL
         dDgYEWZI8gHva60Ih4/O9deKcorDpy/mxwohXqHK4JhRCGeVrN2ZEyuHlOjpUqPAYr4m
         wIxrmMBcyaqoNPPI22lQmQb5q+pkrt3nS47XeWA/3pokQ/raQcygk4aY5bjv3a+AIZH6
         xj5g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772551418; x=1773156218; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PIHHMa2z4DUfmfcEzutr+tGhOCrJS86irFkaV0WK1+Q=;
        b=U88FcJaW3s9Qv0RpQpbEQ2vwhTTsJorREAmemt9SHtCKMkGIXT4fP2yyJKj0rVSOaX
         0nu/yYTgaHvOo+j9FKH944C6BGzaW8pSWRgExmlfDiwJZIVEu6bVK6mYlXieTO6fjP6o
         sH9P3duZr13zRcxwkyGT37Gg2Un/4awQBbtLSaClhw8DwUUaKZ/RTOwTq69Lu2xLMoeg
         gnml+e2/+2duMASrCzJw6ByQ8lIqH2eZN0w+INFgL9pigY9WAUMSdv/DVDoce0MWYZw8
         7BwxcvMWC4l96BHk3jYPobJ991X1Zuev4az0QIZvIbdSzOiizKACXSKsFnPPpsL6Y3uJ
         qYjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772551418; x=1773156218;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PIHHMa2z4DUfmfcEzutr+tGhOCrJS86irFkaV0WK1+Q=;
        b=Y/EDu+vbnDuvuyZSgBbWXZZncAOij+Xtaavyw5YfnZLNA/sJzZjXAF5QPPF9e+ZleN
         uJsEcKjhvV+irn0JOHBWMRlyyBKSZ2KIK2d208NIRC1XM/I+lV1X/mvFO4emfev0Nuy+
         i0GaxJbc0aB0NL3o9M7kEE+TvZJf83BNpvxJPkCv/wrTeGQhThFEPxLib3d2geWlSlrz
         bmXMKe0oUJNAnjefTlpPp+QSCml36y9Nv+RSMHla2233cKNkE92qbT/Hay6xUHEQgSOH
         TBjnog4dsIjzt+nccQj3VWc4VeCaAwmBhTP0r3j3zWGCtvV92HxvGEFmZHxHip6Lhgqs
         MmTA==
X-Forwarded-Encrypted: i=1; AJvYcCU33YNs2Qic+Y2x9Xwqp4gi5TuwkxRtqJhb6eUy0dR2WasQ4VnsG6MkFOZmzv7W9uJL0k8wGgkugoQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4iNEhc8G+PTZGXycHPaMNxJjEra1khVmjZDKPthAqwqK1KOYz
	N3Zkb8AOsfWicUsGuA+KLqVcOJpRQLB7J5C7dNCj+mgCB1LiJ9h8975/qr1MoxSxAVo9z5XJTwT
	ZK3PU7R7PEfKc9Ju4CgeVTEt+5ydZ88Ya7HWBcdNs
X-Gm-Gg: ATEYQzzfbND4phvK3dQlrkroeyYcOVTq/P0izzX5f46IkdeNjUAxWl89+IKxkyKc3Ss
	0R2FxtrbOH9yQvDWqo7D1vhIfkZNYAN9yHUYl2agWWfDBcxC63GvRw5mF/uE6te4/bVL5Rw+NE/
	6dCFTmXtSK5rh4vbZaz9WqgswNS47F0+XdL9GPBA5/HaN/0KMRQhJNVJGi9ZfKUsd0EajMahvCi
	InPoug1r2wmJGKaVbEXfyckUTcBBj/bCVjKyNeYwLpfGW7wUukTd50mH4/g05dxValnqC9moxnj
	IQf5BNpcQNiYM2tOKNRtEL8CNfXRxADpLlw3wYM=
X-Received: by 2002:a05:7022:4581:b0:127:867f:2449 with SMTP id
 a92af1059eb24-1278fb68797mr5039051c88.1.1772551417377; Tue, 03 Mar 2026
 07:23:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260225203639.3159463-1-elver@google.com> <CAG_fn=WAwHUpoay2kY6rkEZQGYxoDGVJYf5B59Y80ht7++Lmqw@mail.gmail.com>
In-Reply-To: <CAG_fn=WAwHUpoay2kY6rkEZQGYxoDGVJYf5B59Y80ht7++Lmqw@mail.gmail.com>
From: Marco Elver <elver@google.com>
Date: Tue, 3 Mar 2026 16:22:59 +0100
X-Gm-Features: AaiRm52TnSdEwOc95PvpVa-fbDTzQ1yxTDERFj9HFe2UexnD_a7PDTE86NyKr14
Message-ID: <CANpmjNNfz9TQcnZWkTXEAzVNdUAAYfBv0-FB-e7oV5PCfsYR5Q@mail.gmail.com>
Subject: Re: [PATCH] kfence: add kfence.fault parameter
To: Alexander Potapenko <glider@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Dmitry Vyukov <dvyukov@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
	workflows@vger.kernel.org, linux-mm@kvack.org, 
	Ernesto Martinez Garcia <ernesto.martinezgarcia@tugraz.at>, Kees Cook <kees@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 3 Mar 2026 at 12:20, Alexander Potapenko <glider@google.com> wrote:
>
> > @@ -830,7 +835,8 @@ static void kfence_check_all_canary(void)
> >  static int kfence_check_canary_callback(struct notifier_block *nb,
> >                                         unsigned long reason, void *arg)
> >  {
> > -       kfence_check_all_canary();
> > +       if (READ_ONCE(kfence_enabled))
> > +               kfence_check_all_canary();
>
> By the way, should we also check for kfence_enabled when reporting errors?

Not sure, I think it might be redundant - I don't see a way we should
get to the reporting path if KFENCE is disabled. And if there
currently is a way to get there, we should check kfence_enabled before
(such as in this panic notifier now).

> > @@ -1307,12 +1314,14 @@ bool kfence_handle_page_fault(unsigned long addr, bool is_write, struct pt_regs
> >         if (to_report) {
> >                 raw_spin_lock_irqsave(&to_report->lock, flags);
> >                 to_report->unprotected_page = unprotected_page;
> > -               kfence_report_error(addr, is_write, regs, to_report, error_type);
> > +               fault = kfence_report_error(addr, is_write, regs, to_report, error_type);
> >                 raw_spin_unlock_irqrestore(&to_report->lock, flags);
> >         } else {
> >                 /* This may be a UAF or OOB access, but we can't be sure. */
> > -               kfence_report_error(addr, is_write, regs, NULL, KFENCE_ERROR_INVALID);
> > +               fault = kfence_report_error(addr, is_write, regs, NULL, KFENCE_ERROR_INVALID);
> >         }
> >
> > +       kfence_handle_fault(fault);
> > +
> >         return kfence_unprotect(addr); /* Unprotect and let access proceed. */
>
> If kfence_handle_fault() oopses, kfence_unprotect() will never be
> called, is that the desired behavior?

It is - consider multiple kernel threads running into the same OOB or
UAF. We should oops them all, otherwise this change is almost no
benefit.

> >         /* Require non-NULL meta, except if KFENCE_ERROR_INVALID. */
> >         if (WARN_ON(type != KFENCE_ERROR_INVALID && !meta))
> > -               return;
> > +               return KFENCE_FAULT_NONE;
>
> We explicitly don't panic here; guess it should be fine...

Yes - it's a KFENCE bug if we get here, the WARN is fine.
