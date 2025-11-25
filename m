Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8AF1C84BD
	for <linux-doc@vger.kernel.org>; Tue, 25 Nov 2025 15:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764083905; cv=none; b=VzU2cJee0SyBKnYr+J+x3oXK4s/hs3Pj2CwQKwtigQJAfF84knWrtmmXDbBUtJK+xNx/LcPdv1WizXmr+ccz85kRNu9nWG6kIbq82DrctE8qwgsMLmNB861pjiHcRFtna+roQrhDOdJSg6crJW6c/dwJihjoFNWoNqPPhdmWO9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764083905; c=relaxed/simple;
	bh=DsYokHG2TbxntUhInZ7n1fLbARG9fKvH875TbmWMMKA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XL5faDAHIBElrHp2M0fiwD2v5iv56vZ0QXf3P/bCXQSa2JOCO3WgjfodMFyhglGgqs92A9pQv4SvP42uxjLrJFxodJvIjwKDJ752bO4/yvU+2CVjNYBibw8P22bPxtDjmUnvq27TTpsiUT3Xj5vQhCvaPiPIYCua9e6herBwlTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=ZUgmPOVb; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="ZUgmPOVb"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-64149f78c0dso8566561a12.3
        for <linux-doc@vger.kernel.org>; Tue, 25 Nov 2025 07:18:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1764083901; x=1764688701; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TAsiLHds/qvfszqhkZLkqHZw/mWoHPv0/EdjTkOyfBM=;
        b=ZUgmPOVbWaBicSUtZFncsbIDjcoQuBStQj+z0YXEDZ1l8ItHFFSMJi0bKlIPwgz3VJ
         /Ya+CQVktg/AMXdLsh2vK+7q3FLHIk/MO6k/yOsVeBYyxd1/kJn4CR86jMKFwug1t5ig
         C70NMziSVKaz9HdDF7GYwIbi75bDyU1x19GiYsubmrK6XI+65xmjySQjD2JjiIdq5xbY
         FqKDG0L3ecrmr7PBDb8Ii2C+olMNRA/GRh96SUrbHlWp6m2zb96JSfY+gHkMb370+stV
         jVQ2T5SHt8RVoUDG5yw7p7geslLV3WO5l+eJGMIHLbeGtYoOyE40/YKx003+wE1fbVPX
         Mw9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764083901; x=1764688701;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TAsiLHds/qvfszqhkZLkqHZw/mWoHPv0/EdjTkOyfBM=;
        b=i0iPvTDoXQKNLFZfvYfAQA82XGvzsZ7WmY2bsoPRg6UzFGqKwDLi2t1E9dbmJXAxga
         j7GajgsxIBaUA7kDRD7pAn0wnxU6/Ii9odoyGQ/Um6tg9l8s6yYpk1s789xZwVptvdm9
         FP96vM5heNMMQOyN1aji6vRWdoDRAw45Ko18eIhnAqvK29OYQAP9RqjAaa+vrPVGLWl1
         GnCEzFGnwCHimh/SYoXNr8hWhiz7odNB/+aAqPgvH4A+O8OiUoXTLxt3e6DAwW1RvXI3
         w5vstH0UotynvI9+lyU/w8URhXjjRyM6LH+rV2XKCCLErEfri30NlrGrpCkTqOLb5dSi
         pZ/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXMwNFY9JePVZWfgRKI/Txi85L6sprVyzpg5K8cBQXWVM6YURKQrJP23aI6B7PtEGmaAsTq/10HThs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxk33Xvx4NC1RuLr7FSehv6uR/Hw8FhQqTO4GP2rmsHxm0uUVkZ
	VK3tKelY2xMGAzfkhy0bU0rW6t5A42SXYpgO9M+a22veG7VHKd+/giLEiPyNjzyAfEctt9NB6Z8
	O03X4f4DQ4T8/1l8kuxyk+QmOU6h3kqnrJIBeaUf9CQ==
X-Gm-Gg: ASbGncu0Vtf0KPdnLvXWlm1MpmAfeHu09aW2gm83NaKKjUJgGNbVBUkNVCjoti3mo2S
	6zUFQws8Yt9nw7e4udukXRU5Sy3q6JWxV/sf7KqvGfUDSw718FiYY7bDHbiAMTyoUpYCo69OabW
	Mk8eOjmxKLDHqODhrxT5VvDgo7Z2c4vqJ89GNqEhJ1YgPnu1958JLdFpDiY6/ezG4SnYoracV9U
	OC4T7fv0YE25b9HsahuSw3Re2ZOeKQgbO4HkE2bhvmMQbMxgPPzscOP3tesDKRfIGLU
X-Google-Smtp-Source: AGHT+IE0DHidFTCdre2PEQZkWO+6fXHnDyl1XZap9xXWaDlhJTWELszauIifJNX3sVuiB93zZccT0oD4UK2jv0u/xGI=
X-Received: by 2002:a05:6402:1447:b0:643:ce6:a7e6 with SMTP id
 4fb4d7f45d1cf-64555d22c5bmr13732647a12.31.1764083900798; Tue, 25 Nov 2025
 07:18:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251122222351.1059049-1-pasha.tatashin@soleen.com>
 <20251122222351.1059049-7-pasha.tatashin@soleen.com> <mafs0tsyjxwoa.fsf@kernel.org>
 <mafs0pl97xwj0.fsf@kernel.org>
In-Reply-To: <mafs0pl97xwj0.fsf@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Tue, 25 Nov 2025 10:17:41 -0500
X-Gm-Features: AWmQ_bm8wD9QREho2Mnzi5WuSu_89_AomH92z6tVmxt4j7_zxQmibtYMJWqN8Vs
Message-ID: <CA+CK2bDAFgH1o8zo3NrD1AOtiSF-aqP17Omg0iaWr+_vSVtTQA@mail.gmail.com>
Subject: Re: [PATCH v7 06/22] liveupdate: luo_file: implement file systems callbacks
To: Pratyush Yadav <pratyush@kernel.org>
Cc: jasonmiu@google.com, graf@amazon.com, rppt@kernel.org, dmatlack@google.com, 
	rientjes@google.com, corbet@lwn.net, rdunlap@infradead.org, 
	ilpo.jarvinen@linux.intel.com, kanie@linux.alibaba.com, ojeda@kernel.org, 
	aliceryhl@google.com, masahiroy@kernel.org, akpm@linux-foundation.org, 
	tj@kernel.org, yoann.congal@smile.fr, mmaurer@google.com, 
	roman.gushchin@linux.dev, chenridong@huawei.com, axboe@kernel.dk, 
	mark.rutland@arm.com, jannh@google.com, vincent.guittot@linaro.org, 
	hannes@cmpxchg.org, dan.j.williams@intel.com, david@redhat.com, 
	joel.granados@kernel.org, rostedt@goodmis.org, anna.schumaker@oracle.com, 
	song@kernel.org, linux@weissschuh.net, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, gregkh@linuxfoundation.org, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, rafael@kernel.org, 
	dakr@kernel.org, bartosz.golaszewski@linaro.org, cw00.choi@samsung.com, 
	myungjoo.ham@samsung.com, yesanishhere@gmail.com, Jonathan.Cameron@huawei.com, 
	quic_zijuhu@quicinc.com, aleksander.lobakin@intel.com, ira.weiny@intel.com, 
	andriy.shevchenko@linux.intel.com, leon@kernel.org, lukas@wunner.de, 
	bhelgaas@google.com, wagi@kernel.org, djeffery@redhat.com, 
	stuart.w.hayes@gmail.com, lennart@poettering.net, brauner@kernel.org, 
	linux-api@vger.kernel.org, linux-fsdevel@vger.kernel.org, saeedm@nvidia.com, 
	ajayachandra@nvidia.com, jgg@nvidia.com, parav@nvidia.com, leonro@nvidia.com, 
	witu@nvidia.com, hughd@google.com, skhawaja@google.com, chrisl@kernel.org
Content-Type: text/plain; charset="UTF-8"

> > +     if (err)
> > +             goto  err_files_mem;
>
>  Nit:                ^^ two spaces here.

Removed.

>
> > +
> > +     if (file_set->count == LUO_FILE_MAX) {
> > +             err = -ENOSPC;
> > +             goto err_files_mem;
> > +     }
> > +
> > +     err = -ENOENT;
> > +     luo_list_for_each_private(fh, &luo_file_handler_list, list) {
> > +             if (fh->ops->can_preserve(fh, file)) {
> > +                     err = 0;
> > +                     break;
> > +             }
> > +     }
> > +
> [...]
> > +int liveupdate_register_file_handler(struct liveupdate_file_handler *fh)
> > +{
> > +     struct liveupdate_file_handler *fh_iter;
> > +     int err;
> > +
> > +     if (!liveupdate_enabled())
> > +             return -EOPNOTSUPP;
> > +
> > +     /* Sanity check that all required callbacks are set */
> > +     if (!fh->ops->preserve || !fh->ops->unpreserve ||
> > +         !fh->ops->retrieve || !fh->ops->finish) {
>
>  You are still missing a check for can_preserve() here. It is a mandatory
>  callback and luo_preserve_file() calls it without checking for NULL.

Added.

>
>  With these and Mike's comments addressed,
>
>  Reviewed-by: Pratyush Yadav <pratyush@kernel.org>

Thanks.

>
> > +             return -EINVAL;
> > +     }
> > +
> [...]
>
> --
> Regards,
> Pratyush Yadav
