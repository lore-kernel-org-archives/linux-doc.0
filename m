Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD2D1BF3D
	for <linux-doc@vger.kernel.org>; Mon,  4 Mar 2024 09:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709543845; cv=none; b=tKi+xzO8HAhll7GJqNAYu7V2klhv/M2bGss0rtgBu9kctAQLlbhV5W40DNRvnEmFsOXrGzIImbt4IlP6CIyN3X/wYCIqQVwILUWRDhl7OVDXilsNJGa8TyHIELKEoSGTSXU56Ab9HbELDPPWIw1sJEKVhH/u99dy1DDypmjxK2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709543845; c=relaxed/simple;
	bh=0cH0sGgH29hlXLiK6gSK9NkKYoxG4zTANFmso2w03CI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FdOeE5cmEY66sMNPyJ8Nd6e7mF4TKgSJM3vgZVsaFOVUMr6jCel8VsBzvbz78/OALoKrdDuKsS58+nq/nuHQuNc9VmOX0L+rZptPITg1VsDMNw58GvDjwVPHnvsJeHPHj4INrKWmRdbjfDSbETq6t7fPjTUWhOvJxV22CgpIYzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZmfpqWs/; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZmfpqWs/"
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-4703e4d53b6so2357406137.1
        for <linux-doc@vger.kernel.org>; Mon, 04 Mar 2024 01:17:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709543842; x=1710148642; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0MwiZA1cBA+0PzvnzU74hfVNWNLRRcLuEqTA/3M/Bbo=;
        b=ZmfpqWs/wwjbGUncTcbhtxuETIFupyYg06RvDahAqP7UkyvuXaLPLSC5SESVrG7vHR
         5wcTFWS+L/WQvKCkCB3XMV0zqKC7dD0VJoDiVusF44s0/UQvBVSZvOHM57GIKmbOj5Ub
         tBvgj0Gd9Ny8iAL8rKBEOOr2+MdiE5PHOAyQZeo8OKtiNIUU1lGBHgCGYY6UKPLRJA49
         G4EcrGbR05geMG0wiUFIAQgsivoTyKqHUGEQsRLTY86EsK3sg5xQyMcJucLcmOF/BI8l
         EZW+kHTCvhDeMoWNB7q8KOPOfxZylvg+0mhuLcT0b0Tx3q0K0+X34NuugjHpk7UDCGau
         GedQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709543842; x=1710148642;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0MwiZA1cBA+0PzvnzU74hfVNWNLRRcLuEqTA/3M/Bbo=;
        b=vlfipvfi2nJrl8t6ZbcegGzKNu2DnU532gMZGP8HQjbuRze+Lr+x/36ejlJytYODfT
         LdEm1d0VOVBQvG2v4HJafkDNu8gEFlRwNv4tWCEdfWWSKmO0G4lMak1+MV9FFeEUfeEv
         OLxFNctdEbyel0uJIEf+D1wQupfhA0S+z0Fn07I2iJIWtckSYvKfbZ9LLMq0ETyUX9l1
         1yzTtCE59aCSlH6zJL4xdragLiaoV3vDqbVVIUrc5FNBHuV8DHPs46QbLRtgPayF8l5t
         8UlHiPI27WTxlcphOtn5GH9x3xaw2Pjei7RfucVfLI10fNzrfnrjZ+jXz8fhKVKA7ext
         hJMw==
X-Forwarded-Encrypted: i=1; AJvYcCXzQS3kX4jzFN+rqfMTq5xkL/3SZ0N3BvBIZwv//4+/8xws3PuYtRms/qx8hGn00YWZmDVwxiXk/RqDi2LSws50F3mH/5SB7ICy
X-Gm-Message-State: AOJu0YzLztrYh6buXwBMdE7Z/e/ln5cN2X+4vWj+YRZyNqtJ13DeGonc
	JVkgCGPyyAbcOdIWAjVqe3f4H9Fp23O9ianAyUxj6PY+5JjFvzt9rOOYnN6NLSn1nXGcmZZK0Bs
	cQqM1Y2lrbvyRYli7MIeXOQwi6+Nx6vwQIXfWBw==
X-Google-Smtp-Source: AGHT+IGm58EGp6zyEamWAbvLgFuXFt0fgBxhzGA+FlV7PlF7jNoSc6rWzROVnOONJMROb+xdl1spvGMBUyIuuAKRJpw=
X-Received: by 2002:a05:6102:1590:b0:472:9b30:567a with SMTP id
 g16-20020a056102159000b004729b30567amr6374784vsv.3.1709543842338; Mon, 04 Mar
 2024 01:17:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240223095133.109046-1-balint.dobszay@arm.com>
 <20240223095133.109046-2-balint.dobszay@arm.com> <CAFA6WYNW9-7gCZQSEaV=Gcr+GLdu25rQ8MpTg9yNpX7OwyZ0Tg@mail.gmail.com>
 <4E68610D-8F2B-4E27-AE5C-45CB59D7FEC0@arm.com>
In-Reply-To: <4E68610D-8F2B-4E27-AE5C-45CB59D7FEC0@arm.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Mon, 4 Mar 2024 14:47:11 +0530
Message-ID: <CAFA6WYNz57v_S9CBQHUjvPdzcP9FWuDN0ciPNvgUZY_-m3JKRg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] tee: optee: Move pool_op helper functions
To: Balint Dobszay <balint.dobszay@arm.com>
Cc: op-tee@lists.trustedfirmware.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	jens.wiklander@linaro.org, corbet@lwn.net, sudeep.holla@arm.com, 
	rdunlap@infradead.org, krzk@kernel.org, gyorgy.szing@arm.com
Content-Type: text/plain; charset="UTF-8"

Hi Balint,

On Mon, 4 Mar 2024 at 14:33, Balint Dobszay <balint.dobszay@arm.com> wrote:
>
> Hi Sumit,
>

[snip]

> >> diff --git a/include/linux/tee_drv.h b/include/linux/tee_drv.h
> >> index 911ddf92dcee..4cf402424e71 100644
> >> --- a/include/linux/tee_drv.h
> >> +++ b/include/linux/tee_drv.h
> >> @@ -275,6 +275,17 @@ void *tee_get_drvdata(struct tee_device *teedev);
> >>  struct tee_shm *tee_shm_alloc_priv_buf(struct tee_context *ctx, size_t size);
> >>  struct tee_shm *tee_shm_alloc_kernel_buf(struct tee_context *ctx, size_t size);
> >>
> >> +int tee_shm_pool_op_alloc_helper(struct tee_shm_pool *pool, struct tee_shm *shm,
> >> +                                size_t size, size_t align,
> >> +                                int (*shm_register)(struct tee_context *ctx,
> >> +                                                    struct tee_shm *shm,
> >> +                                                    struct page **pages,
> >> +                                                    size_t num_pages,
> >> +                                                    unsigned long start));
> >> +void tee_shm_pool_op_free_helper(struct tee_shm_pool *pool, struct tee_shm *shm,
> >> +                                int (*shm_unregister)(struct tee_context *ctx,
> >> +                                                      struct tee_shm *shm));
> >> +
> >
> > These rather belong to drivers/tee/tee_private.h as we shouldn't
> > expose them to other kernel client drivers.
>
> As per the discussion in the other thread I'll ignore this.
>

Then it will have conflicts with this [1] patch. If you are fine to
incorporate [1] in your series then the right place for these function
declarations should be include/linux/tee_core.h.

[1] https://www.spinics.net/lists/kernel/msg5122983.html

-Sumit

> Regards,
> Balint
>
> >>  struct tee_shm *tee_shm_register_kernel_buf(struct tee_context *ctx,
> >>                                             void *addr, size_t length);
> >>
> >> --
> >> 2.34.1
> >>
