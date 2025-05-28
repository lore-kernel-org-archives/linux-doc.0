Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630793FBB3
	for <linux-doc@vger.kernel.org>; Wed, 28 May 2025 19:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748459589; cv=none; b=ujztVB0nO51U2G10sofMWmbWq9ZU/bV1iIgWO9TDxZScKCdqlP4VcuKBvXcj3y/yTAJFi4/0VuOSMYYC6D/1r0muwiJar5ctvnFQ6Vh5CxkPjneKZYhBtXju+QQssSqIRtYbXi+39djpoSv6DGHSNxhXMNuxMVAxQtmE29vaBZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748459589; c=relaxed/simple;
	bh=1DsrmvdbPw6itl3vJ52knBKK6yOvu7vuaJ8HQqwZ+Ps=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D1mI7pIDKDtUTXdDGpLFWBkQhr+a3aMyq6h8HrBdEyeqx/RvAS7XXCwsvpkCicF2pxEfN84P3x4nxLzr1yFIwz8q37pHlHoiPjr/sC5kU/W7Y6TiTcJlH16waOTsv7oN7f+3q+7NaYSH4emAt/Mqn3492Xtj1E2FMCcez+K6oIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iKwxB3Ms; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iKwxB3Ms"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-551ed563740so98870e87.2
        for <linux-doc@vger.kernel.org>; Wed, 28 May 2025 12:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748459585; x=1749064385; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PGDPhsmZhFPLUE0e7mKHidePUZHitNrnRQ+jNJrByps=;
        b=iKwxB3MsZMo8ci/eZZra2C/N77llA4dVi1iNzGd3EW4hOqjvinNd5k2IlSCvjizS9B
         asj1Pkap1IVGtQupB9GfVUutTiQ1GbXHjMp28cpt0RSDgghUWre+PwDJdat4Az6RfvSm
         hRwM6HG9piL7ULW8/rjAxb7hN7+Hfl8UcY8dL1IUSVdaMrknnbzI+Q5XWwTcnLMYGbTD
         uwp6c5n3b0dKyyShzVJrzGKEQ7UqUsn/PLD5dXcQMrPJaxsjYndUYZVJSnOhrqDA0oMt
         P13vipXe97ACdmEJ4g2Cu5E6+7D9wqu1e+CkEfqR01o+3dNLWEPGjkGKCESDoIftv3iq
         oD+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748459585; x=1749064385;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PGDPhsmZhFPLUE0e7mKHidePUZHitNrnRQ+jNJrByps=;
        b=pKNcKZW4GR1OZ3sFwLkOQ4bHJfE/zPlRqId+1Ksuc5yVIZOCDPwBMJEy83JVbsdDQV
         Z4v8HeuQntkwfn2gjHjOOzBmOq86+GR1iu0R+8i0pmv3k6/nZQ7xru9uKbhzNRlxL9fR
         1RHqXjBWvqdpE27Z3W+b4SfLl5y8500WmAXqvSkredPcUuLur+k9H1sUAMQQDGdvNbab
         KdUsBghRT9bR1O84o54RCulcfwbH1kpLr90jrdFzdI/mgj3vWBrCWEKH2Yp5Y518n6L6
         F70ummY5N3TVqWMkQmurb9+Ufew88WTZgO3Na/hM95T4BlEOUkFJx3Xzrkbam/fywxQ3
         3IVA==
X-Forwarded-Encrypted: i=1; AJvYcCX2YRtmyiXhYZFZSExiHSnTYoN4hTTkmjLFpQ200fh8H0eQC7cDXM2okP7QS380Uq2huH4cS+hKE6c=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMWGH0jW5WXdSFnZH/mPizkS7JK246+NlmeQViDD5njw28Lc0q
	q3bDEcsmrwR30sDCAyYqopVPvdvmri409Hfg9ulX3Eho59znwJl5Lefyv7bAgWS/pWuzCyMbh3N
	6KipxJeNfW39exwW6zvgj4EIPkxh0NnFrZicVi13L
X-Gm-Gg: ASbGnctxdF5RWGmhEb0kN/E25XWWS+64gfDp29pXKFpA2ysIF1XgI0/IpJX3+v96+6k
	heJdfaaBir8iDMPmvuCK06PNggL1VQL2XApxWpjWPNDE18msyBxFHNGwKRfRPlo7us0QlAbkM5C
	BzWZjsDSRw4FDBJrEtOdMJXE4EOyAxUWMxevbskWO4xPs=
X-Google-Smtp-Source: AGHT+IENSrWlJkxNFY4TOuDnvof9fLD0sj9JLDZQmVPx55WZqPCCzxZDtUORACYNFiuISGW1oR25nrmY+3RgCW6ZaZk=
X-Received: by 2002:a05:6512:1189:b0:553:2ee0:7720 with SMTP id
 2adb3069b0e04-5532ee077e2mr1435406e87.0.1748459585117; Wed, 28 May 2025
 12:13:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515182322.117840-1-pasha.tatashin@soleen.com> <20250515182322.117840-7-pasha.tatashin@soleen.com>
In-Reply-To: <20250515182322.117840-7-pasha.tatashin@soleen.com>
From: David Matlack <dmatlack@google.com>
Date: Wed, 28 May 2025 12:12:38 -0700
X-Gm-Features: AX0GCFuTxrjiUSGmZ0OzPPrEPW0tlYNVcfu7l32SNjf8l-9qIDQ4iNLU10iGMiQ
Message-ID: <CALzav=dzvVgmwxhh9ic6mTjQL32srzAOH-wXgkksXTa2rd=TNw@mail.gmail.com>
Subject: Re: [RFC v2 06/16] luo: luo_subsystems: add subsystem registration
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: pratyush@kernel.org, jasonmiu@google.com, graf@amazon.com, 
	changyuanl@google.com, rppt@kernel.org, rientjes@google.com, corbet@lwn.net, 
	rdunlap@infradead.org, ilpo.jarvinen@linux.intel.com, kanie@linux.alibaba.com, 
	ojeda@kernel.org, aliceryhl@google.com, masahiroy@kernel.org, 
	akpm@linux-foundation.org, tj@kernel.org, yoann.congal@smile.fr, 
	mmaurer@google.com, roman.gushchin@linux.dev, chenridong@huawei.com, 
	axboe@kernel.dk, mark.rutland@arm.com, jannh@google.com, 
	vincent.guittot@linaro.org, hannes@cmpxchg.org, dan.j.williams@intel.com, 
	david@redhat.com, joel.granados@kernel.org, rostedt@goodmis.org, 
	anna.schumaker@oracle.com, song@kernel.org, zhangguopeng@kylinos.cn, 
	linux@weissschuh.net, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, gregkh@linuxfoundation.org, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, 
	hpa@zytor.com, rafael@kernel.org, dakr@kernel.org, 
	bartosz.golaszewski@linaro.org, cw00.choi@samsung.com, 
	myungjoo.ham@samsung.com, yesanishhere@gmail.com, Jonathan.Cameron@huawei.com, 
	quic_zijuhu@quicinc.com, aleksander.lobakin@intel.com, ira.weiny@intel.com, 
	andriy.shevchenko@linux.intel.com, leon@kernel.org, lukas@wunner.de, 
	bhelgaas@google.com, wagi@kernel.org, djeffery@redhat.com, 
	stuart.w.hayes@gmail.com, ptyadav@amazon.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 15, 2025 at 11:23=E2=80=AFAM Pasha Tatashin
<pasha.tatashin@soleen.com> wrote:
>
> +int liveupdate_register_subsystem(struct liveupdate_subsystem *h)
> +{
> +       struct liveupdate_subsystem *iter;
> +       int ret =3D 0;
> +
> +       luo_state_read_enter();
> +       if (!liveupdate_state_normal() && !liveupdate_state_updated()) {
> +               luo_state_read_exit();
> +               return -EBUSY;
> +       }
> +
> +       mutex_lock(&luo_subsystem_list_mutex);
> +       list_for_each_entry(iter, &luo_subsystems_list, list) {
> +               if (iter =3D=3D h) {
> +                       pr_warn("Subsystem '%s' (%p) already registered.\=
n",
> +                               h->name, h);
> +                       ret =3D -EEXIST;
> +                       goto out_unlock;
> +               }
> +
> +               if (!strcmp(iter->name, h->name)) {
> +                       pr_err("Subsystem with name '%s' already register=
ed.\n",
> +                              h->name);
> +                       ret =3D -EEXIST;
> +                       goto out_unlock;
> +               }
> +       }
> +
> +       INIT_LIST_HEAD(&h->list);
> +       list_add_tail(&h->list, &luo_subsystems_list);
> +
> +out_unlock:
> +       mutex_unlock(&luo_subsystem_list_mutex);
> +       luo_state_read_exit();
> +
> +       return ret;
> +}

Suggest using guard()() and scoped_guard() throughout this series
instead of manual lock/unlock and up/down. That will simplify the code
and reduce the chance of silly bugs where a code path misses an
unlock/down.
