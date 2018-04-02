Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B89C07DE78
	for <lwn-linux-doc@archive.lwn.net>; Mon,  2 Apr 2018 18:08:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753192AbeDBSIR (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 2 Apr 2018 14:08:17 -0400
Received: from mail-qt0-f194.google.com ([209.85.216.194]:41066 "EHLO
        mail-qt0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753080AbeDBSIQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 2 Apr 2018 14:08:16 -0400
Received: by mail-qt0-f194.google.com with SMTP id d3so13072553qth.8
        for <linux-doc@vger.kernel.org>; Mon, 02 Apr 2018 11:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=mY2EG03vlST2dofZLxR3viwdhb95wTLrl9amojQFlPA=;
        b=Oxz0ahqNobevIDE8VzuOfQf2f7ROLiefjhtTAd0iSO6FUMQPDTOcQRmV+Uka3mbf9W
         GSmemYCe+q3ibMzCdW3JtFRjNSGhzRqh9utxmTfX5cUZH/EzeWXkmNTag6OfYbBYH+5t
         L3zwXd/azdbrw0rUpwEyCEzgFTKi2Mip21LqE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=mY2EG03vlST2dofZLxR3viwdhb95wTLrl9amojQFlPA=;
        b=TS/mjpC+VXCZXdNhYVcEWAXo4+cTBhT5TQLF13juu/n588VcvonWF0uW+1UebNDnlc
         vj9sjDxqD/9mJ6crqf/w1QHUFeFF0ILjpwKs4JNRvY1si5W5J/q9hYfjTh9QiHZXT2yu
         EXRtIkgueqxUxmc+9WYInZC7rp6PewR4vsuSwdhmf2gTR+qm/mUYIn9gngyr5LYErx1b
         xwrMg/Q8alpUYaKxMJ/QHDSOgqGHXFK9/VaxD0B6zInDOAFJNy3KLVclMG8moaDhyZ9R
         MUjZHZBHynOFaGWBkgXr6ZibcrABTAwyjiNErdEg/FACjhM/czneu3cTWirN832C+PV9
         lEyA==
X-Gm-Message-State: ALQs6tCBENk4cJJXk2DUYMZu69/7kwM25QECtTsxQJ1ykxv275+JnhhZ
        Bjl82OmOMLgYShG5L/LzhQERgA==
X-Google-Smtp-Source: AIpwx48dYOQDAbwstPsHPxSpc+TSbkFyxWUwy0sNzGGxNsm8E4MNM1QkyPhX3HaNJqMIe50wkSkYhw==
X-Received: by 10.200.53.6 with SMTP id y6mr16269424qtb.58.1522692496214;
        Mon, 02 Apr 2018 11:08:16 -0700 (PDT)
Received: from xanadu.home (modemcable228.104-82-70.mc.videotron.ca. [70.82.104.228])
        by smtp.gmail.com with ESMTPSA id v56sm745314qtc.20.2018.04.02.11.08.13
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Apr 2018 11:08:15 -0700 (PDT)
Date:   Mon, 2 Apr 2018 14:08:13 -0400 (EDT)
From:   Nicolas Pitre <nicolas.pitre@linaro.org>
To:     Abbott Liu <liuwenliang@huawei.com>
cc:     aryabinin@virtuozzo.com, dvyukov@google.com,
        Jonathan Corbet <corbet@lwn.net>,
        Russell King - ARM Linux <linux@armlinux.org.uk>,
        christoffer.dall@linaro.org, marc.zyngier@arm.com,
        kstewart@linuxfoundation.org, gregkh@linuxfoundation.org,
        f.fainelli@gmail.com, Andrew Morton <akpm@linux-foundation.org>,
        linux@rasmusvillemoes.dk, mawilcox@microsoft.com,
        pombredanne@nexb.com, ard.biesheuvel@linaro.org,
        vladimir.murzin@arm.com, alexander.levin@verizon.com,
        tglx@linutronix.de, thgarnie@google.com, dhowells@redhat.com,
        keescook@chromium.org, Arnd Bergmann <arnd@arndb.de>,
        geert@linux-m68k.org, tixy@linaro.org, julien.thierry@arm.com,
        mark.rutland@arm.com, james.morse@arm.com,
        zhichao.huang@linaro.org, jinb.park7@gmail.com, labbott@redhat.com,
        philip@cog.systems, grygorii.strashko@linaro.org,
        Catalin Marinas <catalin.marinas@arm.com>, opendmb@gmail.com,
        kirill.shutemov@linux.intel.com, kasan-dev@googlegroups.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
        linux-mm@kvack.org
Subject: Re: [PATCH v3 5/6] Initialize the mapping of KASan shadow memory
In-Reply-To: <20180402120440.31900-6-liuwenliang@huawei.com>
Message-ID: <nycvar.YSQ.7.76.1804021402521.28462@knanqh.ubzr>
References: <20180402120440.31900-1-liuwenliang@huawei.com> <20180402120440.31900-6-liuwenliang@huawei.com>
User-Agent: Alpine 2.21 (LFD 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 2 Apr 2018, Abbott Liu wrote:

> index c79b829..20161e2 100644
> --- a/arch/arm/kernel/head-common.S
> +++ b/arch/arm/kernel/head-common.S
> @@ -115,6 +115,9 @@ __mmap_switched:
>  	str	r8, [r2]			@ Save atags pointer
>  	cmp	r3, #0
>  	strne	r10, [r3]			@ Save control register values
> +#ifdef CONFIG_KASAN
> +	bl	kasan_early_init
> +#endif
>  	mov	lr, #0
>  	b	start_kernel
>  ENDPROC(__mmap_switched)

Would be better if lr was cleared before calling kasan_early_init.


Nicolas
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
