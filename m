Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6DCFC001B0
	for <linux-doc@archiver.kernel.org>; Mon,  3 Jul 2023 08:18:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229591AbjGCISm (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 3 Jul 2023 04:18:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230483AbjGCISk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 3 Jul 2023 04:18:40 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 989D3E44
        for <linux-doc@vger.kernel.org>; Mon,  3 Jul 2023 01:18:38 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-51de841a727so4116475a12.3
        for <linux-doc@vger.kernel.org>; Mon, 03 Jul 2023 01:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1688372317; x=1690964317;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=f0AIPmQjwEPFU9S6QPuv3kXAJyYa7R0ahvO9uqbNsw0=;
        b=CTXm0Evd7f9xNERgFGe8Kgf2dIrXOUMZPOBGhEgXQdvIjRhhrv5Qh3s5ENWJ09z7ev
         5wm7FiXz+iF/TvW0dDpczV2RwoT7ClRWoiG7fSddWKzNyBagcc/r7pNw84OiXN04lL4z
         wC0LmC5S4SY3KJKOoKwf0war+sU1MsM9XTZc+Scp7fmMYsS9QJtvuv34rKr0yMZAysn8
         D2fh7In8mMCQM9+yNYsq6aVEQIOZzk4aw7h/eGK/mN535gJJ9Vny0AUFRXYlZM0dEbQr
         O8A0Ma5CFWhzbHzM3joBe8qmF4w64d0CQLFSC5gbL99qho7IZPwuRlOOued1WUV58MLW
         eK2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688372317; x=1690964317;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f0AIPmQjwEPFU9S6QPuv3kXAJyYa7R0ahvO9uqbNsw0=;
        b=HOpdAIy1smLTqBRJOLMLlYrW5acymg+5iprxQkEo5LeV7DNxZ/XfZKmoqvjReKcIJ8
         5qYixQzAGch7bdzAObz53IcRdqlKa6vAAYNeDv5OPNrwr4af9UIRUJGiDSKNSHddzmLX
         S4l6DTS3/gdJv14IMvOjnxlT+5JlBgyD8KVRpsCHb7ODpFXwGpUW3TABZw/bRfMKw7XN
         DAMgnxS20mfBlzDgTFJhZat5uBqDhqr9sH8+c0V55xCIbnWxqbmTYYNKd3sPLaiCrl+7
         /h2VnxH/M7Qy3V8E42YihPUcOgmEgYhuQPwzaBIvYtj8e2DKqrEUO8NY6MB3+uYL727V
         zTkw==
X-Gm-Message-State: ABy/qLblyLHN/NrFvj5aCiLQjsIzpQ20jLcheCqDwnLNhGA4MuC53QvO
        Vkh45irBVhzucKisAP3r53xzYw==
X-Google-Smtp-Source: APBJJlFjFKFq1EVk2plu+5SIDoHMMxjYDFXuQ8UHkU0hLQGKGPcjw2PacRkzpqFIW8QfcigNzutaAw==
X-Received: by 2002:a05:6402:4497:b0:51a:200b:d8ff with SMTP id er23-20020a056402449700b0051a200bd8ffmr6795812edb.13.1688372316835;
        Mon, 03 Jul 2023 01:18:36 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id n22-20020a056402515600b0051e0f100c48sm1171605edd.22.2023.07.03.01.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jul 2023 01:18:36 -0700 (PDT)
Date:   Mon, 3 Jul 2023 10:18:35 +0200
From:   Andrew Jones <ajones@ventanamicro.com>
To:     Haibo Xu <haibo1.xu@intel.com>
Cc:     xiaobo55x@gmail.com, maz@kernel.org, oliver.upton@linux.dev,
        seanjc@google.com, Paolo Bonzini <pbonzini@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Anup Patel <anup@brainfault.org>,
        Atish Patra <atishp@atishpatra.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Shuah Khan <shuah@kernel.org>,
        James Morse <james.morse@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Zenghui Yu <yuzenghui@huawei.com>,
        Ricardo Koller <ricarkol@google.com>,
        Vishal Annapurve <vannapurve@google.com>,
        Vipin Sharma <vipinsh@google.com>,
        David Matlack <dmatlack@google.com>,
        Colton Lewis <coltonlewis@google.com>, kvm@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
        linux-kselftest@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Subject: Re: [PATCH v5 10/13] KVM: selftests: Only do get/set tests on
 present blessed list
Message-ID: <20230702-49c5545eb1ae2d0cf11c7b95@orel>
References: <cover.1688010022.git.haibo1.xu@intel.com>
 <f44c3aa46971d524319c6340f9ce1b00c0182fd2.1688010022.git.haibo1.xu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f44c3aa46971d524319c6340f9ce1b00c0182fd2.1688010022.git.haibo1.xu@intel.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Jul 01, 2023 at 09:42:58PM +0800, Haibo Xu wrote:
> Only do the get/set tests on present and blessed registers
> since we don't know the capabilities of any new ones.
> 
> Suggested-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  tools/testing/selftests/kvm/get-reg-list.c | 29 ++++++++++++++--------
>  1 file changed, 18 insertions(+), 11 deletions(-)
> 
> diff --git a/tools/testing/selftests/kvm/get-reg-list.c b/tools/testing/selftests/kvm/get-reg-list.c
> index c61090806007..74fb6f6fdd09 100644
> --- a/tools/testing/selftests/kvm/get-reg-list.c
> +++ b/tools/testing/selftests/kvm/get-reg-list.c
> @@ -49,6 +49,10 @@ extern int vcpu_configs_n;
>  	for_each_reg_filtered(i)						\
>  		if (!find_reg(blessed_reg, blessed_n, reg_list->reg[i]))
>  
> +#define for_each_present_blessed_reg(i)			\
> +	for ((i) = 0; (i) < blessed_n; ++(i))		\
> +		if (find_reg(reg_list->reg, reg_list->n, blessed_reg[i]))

I just realized this is backwards. We need 'i' to index reg_list->reg in
the body of the loop. That means we need to write this as

#define for_each_present_blessed_reg(i)                                         \
        for_each_reg(i)                                                         \
                if (find_reg(blessed_reg, blessed_n, reg_list->reg[i]))

(Which, in hindsight, makes sense since we're replacing a for_each_reg()
loop.)

Thanks,
drew
