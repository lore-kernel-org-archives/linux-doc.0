Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C0B5EDE99C
	for <linux-doc@archiver.kernel.org>; Thu, 14 Sep 2023 09:37:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236069AbjINJhp (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 14 Sep 2023 05:37:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235604AbjINJhp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 14 Sep 2023 05:37:45 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 782991BF9
        for <linux-doc@vger.kernel.org>; Thu, 14 Sep 2023 02:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1694684221;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=8vQlQADn2LNqOGAlsXmaezeqHZMFdsyRwPKTLWRd854=;
        b=TDAGFleMZDXaox0b9O9cR/KjF6jDxgxfKQ8tnSDBwtsTEH+ol2xb9fbv6qDM+eIhDk26G/
        XFaCM4IcZp/UXEj6HDkSR76S5iFceNolN+w3h+mCACiyw+kjohQJCw39GFIlOT5zqv2+YD
        /sXjroxZJTlLnMJLrGtE3oWA7z7BunQ=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-256-FX-zR43GNhObcJb-3MROdg-1; Thu, 14 Sep 2023 05:37:00 -0400
X-MC-Unique: FX-zR43GNhObcJb-3MROdg-1
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-3aa1254fb00so1059309b6e.1
        for <linux-doc@vger.kernel.org>; Thu, 14 Sep 2023 02:36:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694684219; x=1695289019;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8vQlQADn2LNqOGAlsXmaezeqHZMFdsyRwPKTLWRd854=;
        b=R6jzLmRpcuzMq+hjBWNjxbuCKkmf8P7KApE9B6TQn84PKUwEuG70KKz1ss4k4/hEce
         58ez+GH51nb6z6cRjHstafOk7SW2wfkf4KzDM0AyJBbjAeZrKm+iuiwkPcAAjwN1hAc3
         xgqfyVBvI2M5LFG+qWAIG1gZHY5Gs9+cggAMkeQGA7oXWORGlAFv6j9HmDaj59PoKO65
         Fi8LHmvPbC+Fh5hsEr6/uuSxVTNaBCbwHgoBimzY0IXFX4t0KxvyUs6ICw/iyeUAZw0V
         hGpr2y6lAYyshg8NEqh1HAoiEqMgfXvvyHeFFQt5vgwLE6twdTtExsS6wIdAZeJr9AaB
         raaw==
X-Gm-Message-State: AOJu0Yy86iiKkRHAagUpJh0KYuzDm8cFbYs/m96gr6Zj+dxreUw0tVxs
        iV55zOLI5JgBBm5GNHGIqKIA1il3DDk5r/ZIcSCrzZndSYff0o35w7ia0Dxb3D2Pv1nD7AdsU7m
        ogZJs6PCrxcI4i8f2JI2K
X-Received: by 2002:a05:6808:bd4:b0:3a3:7a28:f841 with SMTP id o20-20020a0568080bd400b003a37a28f841mr6256021oik.41.1694684219295;
        Thu, 14 Sep 2023 02:36:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEOYB9XBC6PVpc7f+a0f60gNl1NFed8atTc8/uEab+FTz4RvHJ//hpWsS4nDqiqEtsGdQd5ag==
X-Received: by 2002:a05:6808:bd4:b0:3a3:7a28:f841 with SMTP id o20-20020a0568080bd400b003a37a28f841mr6255987oik.41.1694684219072;
        Thu, 14 Sep 2023 02:36:59 -0700 (PDT)
Received: from redhat.com ([2804:1b3:a803:4ff9:7c29:fe41:6aa7:43df])
        by smtp.gmail.com with ESMTPSA id n11-20020a9d4d0b000000b006b96a4287d4sm495055otf.5.2023.09.14.02.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Sep 2023 02:36:58 -0700 (PDT)
Date:   Thu, 14 Sep 2023 06:36:49 -0300
From:   Leonardo Bras <leobras@redhat.com>
To:     guoren@kernel.org
Cc:     paul.walmsley@sifive.com, anup@brainfault.org,
        peterz@infradead.org, mingo@redhat.com, will@kernel.org,
        palmer@rivosinc.com, longman@redhat.com, boqun.feng@gmail.com,
        tglx@linutronix.de, paulmck@kernel.org, rostedt@goodmis.org,
        rdunlap@infradead.org, catalin.marinas@arm.com,
        conor.dooley@microchip.com, xiaoguang.xing@sophgo.com,
        bjorn@rivosinc.com, alexghiti@rivosinc.com, keescook@chromium.org,
        greentime.hu@sifive.com, ajones@ventanamicro.com,
        jszhang@kernel.org, wefu@redhat.com, wuwei2016@iscas.ac.cn,
        linux-arch@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-doc@vger.kernel.org, kvm@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-csky@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH V11 10/17] riscv: qspinlock: errata: Enable qspinlock for
 T-HEAD processors
Message-ID: <ZQLUMbDKMgDzptPw@redhat.com>
References: <20230910082911.3378782-1-guoren@kernel.org>
 <20230910082911.3378782-11-guoren@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230910082911.3378782-11-guoren@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Sep 10, 2023 at 04:29:04AM -0400, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> According to qspinlock requirements, RISC-V gives out a weak LR/SC
> forward progress guarantee which does not satisfy qspinlock. But
> many vendors could produce stronger forward guarantee LR/SC to
> ensure the xchg_tail could be finished in time on any kind of
> hart. T-HEAD is the vendor

nit: "a vendor"

> which implements strong forward
> guarantee LR/SC instruction pairs, so enable qspinlock for T-HEAD
> with errata init help.
> 
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> ---
>  arch/riscv/errata/thead/errata.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/riscv/errata/thead/errata.c b/arch/riscv/errata/thead/errata.c
> index 751eb5a7f614..0df6a67302c0 100644
> --- a/arch/riscv/errata/thead/errata.c
> +++ b/arch/riscv/errata/thead/errata.c
> @@ -86,6 +86,13 @@ static bool errata_probe_write_once(unsigned int stage,
>  	return false;
>  }
>  
> +extern bool enable_qspinlock_key;

Oh, now I understand why it was not static before. :)


> +static void errata_probe_qspinlock(unsigned int stage)
> +{
> +	if (stage == RISCV_ALTERNATIVES_BOOT)
> +		enable_qspinlock_key = true;
> +}
> +
>  static u32 thead_errata_probe(unsigned int stage,
>  			      unsigned long archid, unsigned long impid)
>  {
> @@ -103,6 +110,8 @@ static u32 thead_errata_probe(unsigned int stage,
>  	if (errata_probe_write_once(stage, archid, impid))
>  		cpu_req_errata |= BIT(ERRATA_THEAD_WRITE_ONCE);
>  
> +	errata_probe_qspinlock(stage);
> +
>  	return cpu_req_errata;
>  }
>  

So, if THEAD then enable qspinlock().

LGTM:
Reviewed-by: Leonardo Bras <leobras@redhat.com>

> -- 
> 2.36.1
> 

