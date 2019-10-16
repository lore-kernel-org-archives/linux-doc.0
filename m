Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 7F5E37D90D
	for <lwn-linux-doc@archive.lwn.net>; Wed, 16 Oct 2019 19:23:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403956AbfJPTXF (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 16 Oct 2019 15:23:05 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:38801 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732079AbfJPTXF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 16 Oct 2019 15:23:05 -0400
Received: by mail-pf1-f196.google.com with SMTP id h195so5129pfe.5
        for <linux-doc@vger.kernel.org>; Wed, 16 Oct 2019 12:23:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=yNrX5NxWK+qA1o6LaqqAm41/yReowE+lc1hULeA+iQo=;
        b=sLRXXmw2WCpeuin7XPLk5ETkcNbuX0OQAQCDxphJ1f0ubNS4cBn+p7KtDKDww7V2CR
         UBZHoEuPHeD73wqbFbdqhqxzBW2qXMuadUpORhUFaQHC68a2alJ0hPIpoN6SrePwPbS4
         PH6O1zuCKb75iH8VnC4C7eNiEsEWCPzKUXjg6o/6fHOKqRIY4l8uAtOPkcYivqLkLTK2
         lU5eU3z64Zg42fgnEeSsID5CBfhrvf8p8SMW3WgVjxNR9aan4ofzi5MBRH9Asy+wnZo0
         wZc7eGxTrSPq6MPu5t3WARG+LSKXab7ReNmLvRRmiQv5r59Rv5gPG4o4wFcDo4kUll4T
         zg0g==
X-Gm-Message-State: APjAAAXol+5KwPD5l9soHzUtavVNCwziK8xb9cRC+g9/sucYozFi6ngi
        vzO5Hb+Zrqx6zxIW3Upg51LG4w==
X-Google-Smtp-Source: APXvYqxL7QA2f4fhE3Wl5GbWBvWdaQkuQMrMb1TNzwEQ1pCL0mnhlQdr9u9/Zf+Usvn7SVZWcaa+RA==
X-Received: by 2002:a65:500c:: with SMTP id f12mr16812322pgo.233.1571253782761;
        Wed, 16 Oct 2019 12:23:02 -0700 (PDT)
Received: from localhost ([12.206.222.5])
        by smtp.gmail.com with ESMTPSA id k6sm26188868pfg.162.2019.10.16.12.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2019 12:23:02 -0700 (PDT)
Date:   Wed, 16 Oct 2019 12:23:02 -0700 (PDT)
X-Google-Original-Date: Wed, 16 Oct 2019 12:22:58 PDT (-0700)
Subject:     Re: [PATCH v3 1/3] kasan: Archs don't check memmove if not support it.
In-Reply-To: <c9fa9eb25a5c0b1f733494dfd439f056c6e938fd.1570514544.git.nickhu@andestech.com>
CC:     alankao@andestech.com, Paul Walmsley <paul.walmsley@sifive.com>,
        aou@eecs.berkeley.edu, aryabinin@virtuozzo.com, glider@google.com,
        dvyukov@google.com, corbet@lwn.net, alexios.zavras@intel.com,
        allison@lohutok.net, Anup Patel <Anup.Patel@wdc.com>,
        tglx@linutronix.de, Greg KH <gregkh@linuxfoundation.org>,
        Atish Patra <Atish.Patra@wdc.com>,
        kstewart@linuxfoundation.org, linux-doc@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        kasan-dev@googlegroups.com, linux-mm@kvack.org,
        nickhu@andestech.com
From:   Palmer Dabbelt <palmer@sifive.com>
To:     nickhu@andestech.com
Message-ID: <mhng-5f3ce9b5-2b64-48d7-a661-7bedf58c50a5@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 07 Oct 2019 23:11:51 PDT (-0700), nickhu@andestech.com wrote:
> Skip the memmove checking for those archs who don't support it.
>
> Signed-off-by: Nick Hu <nickhu@andestech.com>
> ---
>  mm/kasan/common.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/mm/kasan/common.c b/mm/kasan/common.c
> index 6814d6d6a023..897f9520bab3 100644
> --- a/mm/kasan/common.c
> +++ b/mm/kasan/common.c
> @@ -107,6 +107,7 @@ void *memset(void *addr, int c, size_t len)
>  	return __memset(addr, c, len);
>  }
>
> +#ifdef __HAVE_ARCH_MEMMOVE
>  #undef memmove
>  void *memmove(void *dest, const void *src, size_t len)
>  {
> @@ -115,6 +116,7 @@ void *memmove(void *dest, const void *src, size_t len)
>
>  	return __memmove(dest, src, len);
>  }
> +#endif
>
>  #undef memcpy
>  void *memcpy(void *dest, const void *src, size_t len)

I think this is backwards: we shouldn't be defining an arch-specific memmove 
symbol when KASAN is enabled.  If we do it this way then we're defeating the 
memmove checks, which doesn't seem like the right way to go.
