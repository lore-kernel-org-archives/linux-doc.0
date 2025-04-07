Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE401A9B5D
	for <linux-doc@vger.kernel.org>; Mon,  7 Apr 2025 13:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744033558; cv=none; b=O49wrX7sANlq1cNyZ2ihjarKDtqzDR5RLwxxGWR80Wp/xoEy6TX13zTsjnQSWydV29QRH++SnJjaJG1hQ4qud5YUaBHR00KbYzQOHQQzGg/AnlN/apeO7NAzoLsXdbRtUC7ZcdXv0eMqrfTKL4cfRqhbk3tfVitht7bbg/tVDe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744033558; c=relaxed/simple;
	bh=wBZH5iAFwW7ArNMczcU5Wr8pTX9IBSGe5V6n0W1eMyM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Aeqw6osU0vbv1Ptnn8SWZzYshi0xjuRrRa7TnvEwr1aqzRYAW+WbGNOqLyed9VZW7itOjzl3bIfAS5eFRIj0ygPC44khPp4bFJbRFibvP/LbJ3y7voBZB12yJcmUxGS4qp6qe34WrbORS/xOcJK/rGRctq0YGYyR1oRb60tGo7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=Zxlwoub1; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="Zxlwoub1"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43d0782d787so30142035e9.0
        for <linux-doc@vger.kernel.org>; Mon, 07 Apr 2025 06:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1744033554; x=1744638354; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mmI/GUCyaMoVDShjSc3OzomwLudeRUjOXZtn/UkzEJ0=;
        b=Zxlwoub1nw7MRCr5WddlQUj0F2cX/pufvDREj229C0xJ1vgu4weVHF4koEe1EyDXwv
         papbNZXx1R132nP4HOKDDSYXy7ebH7fok89//EDVzgD3AykBL5ocM9xhOTUX/vDVh/zf
         zvW5gLSMLIOAzSKhHAq4aq6CWxCtNJBT88e8pirL90F0J1x2F3M8A8li5Ezq14yrJ8oX
         1kTrbKha398uzgf1W8/i7q5KY1L2aXvcvJIzdCM9RqFgJDYdU8ugIUt9qwaQXJGRcBCd
         84TgCjxaVmCQvx/s8eask1z0TKcot8+FfV7AJZpYEPVFt2N/5jrQvRsNHwpCo9NqZRbK
         bnLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744033554; x=1744638354;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mmI/GUCyaMoVDShjSc3OzomwLudeRUjOXZtn/UkzEJ0=;
        b=LHvcVHaq+Hgtup/jlhzYDv812CW1+k2WVngz1GPxpL3Ai6PyotXTwpY/FujNZVWWT6
         WSfCsCfDnrcBB0Kx3H9jv1JzaW4LWZ6nzZOlG+/R+WVflseSRGRAz45wHLY5VlNHZSYJ
         R8DxoOKQPr1MW7aJHxzMZ7nkFp/5bXOmtxaolEEhkf5ajcKVg8+Yhtzv7lqj1/0gYYkP
         HRfnVYUJsNchYcxIbJH6TNuU5qTkxVw+zvQnwMWiY3yDD5E1CsNzpKmiW/d/LuNvb1Xk
         8WiNuGdG15YacQf26+oT2k9I81RbJgb/Hxbs2/9nkysjAvf5XJhJ2zsajSVXov2gcZw3
         rM8w==
X-Forwarded-Encrypted: i=1; AJvYcCW8H8uj6cibb6nkLYFNYwupljP4OD2bjH1K1tbclH/utt3+kum+Pslod3e7Y+FYnaRcxWGXo7N8nq8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhaY05gFTOkGRJFmLgFy9u0kdMESt3ukxXgbhXG3ScZDMMHjps
	zPsNZrCpvbB3cf0q47zUtEjTN77dVWS4ol/mnzTN3qxReFo6NPkUVdiDzh5t+Ww=
X-Gm-Gg: ASbGncsXG5uN1XwEakrTNxwcbCQZ7h4WHjo42/xsV+ZmAE5j1QobvC9KfUIWu6vnG+Y
	Ukr+ZCYmYV++kNaUMm9hpvI8H5Y6pDfkY8ibK2wmqYvB6uHLiII/H5OwI9GS0V9JcmLRgFIB4Rg
	RqmvpG87MEoDZ34KqH0tqf/htWNdBaMtV1nWKXwNB7ty50G3bJeLtzRhNilBqc6TKkCqDox8f0o
	CbCqR7VJsGDs7qG27hSwEZCrlnPnchE1nJ3zQmzbpr9rHux12XylazisS6tajIE0au8jJZPuzn9
	jb0gA2EjR9RL1QlNAr+sdmsTOCSbbplZ
X-Google-Smtp-Source: AGHT+IEHHsM5wqpNmF0qGu29jIMUNH0eRndhQgivRLY4H5xraCW/gKyTvq3ExPsg6IGAXRyht4DQzQ==
X-Received: by 2002:a05:600c:1d16:b0:43d:45a:8fbb with SMTP id 5b1f17b1804b1-43ed0d98e7cmr100660895e9.22.1744033553925;
        Mon, 07 Apr 2025 06:45:53 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::31af])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec17b0dbesm134131445e9.33.2025.04.07.06.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 06:45:53 -0700 (PDT)
Date: Mon, 7 Apr 2025 15:45:52 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	charlie@rivosinc.com, cleger@rivosinc.com, alex@ghiti.fr, 
	Anup Patel <apatel@ventanamicro.com>, corbet@lwn.net
Subject: Re: [PATCH v3 7/8] riscv: Add parameter for skipping access speed
 tests
Message-ID: <20250407-63092ceb505ad536d8f1394e@orel>
References: <20250304120014.143628-10-ajones@ventanamicro.com>
 <20250304120014.143628-17-ajones@ventanamicro.com>
 <CAMuHMdVEp2_ho51gkpLLJG2HimqZ1gZ0fa=JA4uNNZjFFqaPMg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVEp2_ho51gkpLLJG2HimqZ1gZ0fa=JA4uNNZjFFqaPMg@mail.gmail.com>

Hi Geert,

On Mon, Apr 07, 2025 at 11:49:59AM +0200, Geert Uytterhoeven wrote:
> Hi Andrew,
> 
> On Tue, 4 Mar 2025 at 13:02, Andrew Jones <ajones@ventanamicro.com> wrote:
> > Allow skipping scalar and vector unaligned access speed tests. This
> > is useful for testing alternative code paths and to skip the tests in
> > environments where they run too slowly. All CPUs must have the same
> > unaligned access speed.
> >
> > The code movement is because we now need the scalar cpu hotplug
> > callback to always run, so we need to bring it and its supporting
> > functions out of CONFIG_RISCV_PROBE_UNALIGNED_ACCESS.
> >
> > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> 
> Thanks for your patch, which is now commit aecb09e091dc1433
> ("riscv: Add parameter for skipping access speed tests") in
> v6.15-rc1.
> 
> > --- a/arch/riscv/kernel/unaligned_access_speed.c
> > +++ b/arch/riscv/kernel/unaligned_access_speed.c
> 
> >  static int __init check_unaligned_access_all_cpus(void)
> >  {
> >         int cpu;
> >
> > -       if (!check_unaligned_access_emulated_all_cpus())
> > +       if (unaligned_scalar_speed_param == RISCV_HWPROBE_MISALIGNED_SCALAR_UNKNOWN &&
> > +           !check_unaligned_access_emulated_all_cpus()) {
> >                 check_unaligned_access_speed_all_cpus();
> > -
> > -       if (!has_vector()) {
> > +       } else {
> > +               pr_info("scalar unaligned access speed set to '%s' by command line\n",
> > +                       speed_str[unaligned_scalar_speed_param]);
> >                 for_each_online_cpu(cpu)
> > -                       per_cpu(vector_misaligned_access, cpu) = RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED;
> > -       } else if (!check_vector_unaligned_access_emulated_all_cpus() &&
> > -                  IS_ENABLED(CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS)) {
> > +                       per_cpu(misaligned_access_speed, cpu) = unaligned_scalar_speed_param;
> > +       }
> > +
> > +       if (!has_vector())
> > +               unaligned_vector_speed_param = RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED;
> > +
> > +       if (unaligned_vector_speed_param == RISCV_HWPROBE_MISALIGNED_VECTOR_UNKNOWN &&
> > +           !check_vector_unaligned_access_emulated_all_cpus() &&
> > +           IS_ENABLED(CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS)) {
> >                 kthread_run(vec_check_unaligned_access_speed_all_cpus,
> >                             NULL, "vec_check_unaligned_access_speed_all_cpus");
> > +       } else {
> > +               pr_info("vector unaligned access speed set to '%s' by command line\n",
> > +                       speed_str[unaligned_vector_speed_param]);
> > +               for_each_online_cpu(cpu)
> > +                       per_cpu(vector_misaligned_access, cpu) = unaligned_vector_speed_param;
> >         }
> 
> On RZ/Five:
> 
>     vector unaligned access speed set to 'unsupported' by command line
> 
> However, this is not set on my command line?
> 
> Apparently this can be set using three different methods:
>   1. It is the default value in the declaration of vector_misaligned_access,
>   2. From the handle_vector_misaligned_load() exception handler,
>   3. From the command line.
> Hence the current kernel message is rather confusing...

Thanks for the report.

The three ways above are OK, since (1) sets it to 'unknown' which means
"not yet set" (by command line or otherwise), (2) doesn't actually touch
unaligned_vector_speed_param, just its per-cpu counterpart. And the
message applies to (3). However, there's a (4) which I added without
considering the message and that's the 'if (!has_vector())' part of the
hunk above, which sets 'unsupported', as you're seeing, when vector is
not present.

I'll send a patch that ensures we only get the message for truly command
line set states.

Thanks,
drew
