Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FBFAC2B9F4
	for <linux-doc@archiver.kernel.org>; Mon, 28 Jun 2021 12:25:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6D98F61C71
	for <linux-doc@archiver.kernel.org>; Mon, 28 Jun 2021 12:25:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232959AbhF1M10 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 28 Jun 2021 08:27:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232953AbhF1M1Z (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 28 Jun 2021 08:27:25 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CF45C061574
        for <linux-doc@vger.kernel.org>; Mon, 28 Jun 2021 05:24:59 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id k21so4656891ljh.2
        for <linux-doc@vger.kernel.org>; Mon, 28 Jun 2021 05:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shutemov-name.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=mZl19EAHfBMj6o+esp+Ag6rbRzMSpGqttEk0/Qom/6Y=;
        b=ZVOOxa14dG+gGR+HyULgfW1QlZEE0vq5WSIHRrgiYp/5DUgQrlUg70uTV9+iiQJOS8
         Pe+tAx0ojKZ2yuaQIO/FdCeNLGMO39zO+3ghXHaGFb8Qv8ePjd2zRehTJFBSME3itL+N
         I4PF9q/n+1mVW9pd2W3di0CYIOLGySCGxFs1hPQL3cVZ8Nvm7PSEvIwX0+LSAqzn+AHP
         iK3mFtpAvxhnFAsLzeYuLG33r3zC3xTSgxkhDRIZ1EyktWdBn7qOB0Lv/WnKkjwB8Zei
         PZfQu+0zQ2cpmQizSDr0XELO9PnJNinhQMSs8rMRcoWZ7nNKtHnHR/jLeX1UEUH/9d2F
         YEBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mZl19EAHfBMj6o+esp+Ag6rbRzMSpGqttEk0/Qom/6Y=;
        b=rQaJ0WVx5Nvqzz4J6ctUJZZszyX6psMl8Ku3lmCLEybFWtF8Ae1bXzgMfLvf1dlAud
         QduxOuv0j2X/quYEIzVaKU5NBKFVRH7Alwjpq9AgWlEvnYTx9gY/PVrP6QMoScNNerCH
         0KihFZEk29+nL2ecOiFW+u4774yLy8S2fDFUrTi6Ak/3ggJAXNWgLTT3SeHSpmeSaat3
         9ENsqmAas4ifiQ5DW7klWQ9fBqGuAlLfMMU1g21rpKX7M/NtIFBmd1JdmgZ9lJjkKj8F
         wd6l8PUF/NNFHFzkatf1d3EzhReKI0+1IUZmhEGzWvEmZUFWh2deOg3vbP7MuCAqidPD
         DB5A==
X-Gm-Message-State: AOAM532B1r6g1OWBZLWoTNcz4ySFB/uHndis63fu4+I5z+Wmu+rVlcfL
        FhE7iaD5fwouxid0KNoWSJKf/Q==
X-Google-Smtp-Source: ABdhPJyfJ8jeeyfOn0CBv6l9Qm89e2M0XZhNu8UyBRm8yx8et6Em68BU7cax6g9fdMATElyOwR72kA==
X-Received: by 2002:a05:651c:10a8:: with SMTP id k8mr5284294ljn.99.1624883097640;
        Mon, 28 Jun 2021 05:24:57 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
        by smtp.gmail.com with ESMTPSA id v3sm1355213lji.115.2021.06.28.05.24.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jun 2021 05:24:56 -0700 (PDT)
Received: by box.localdomain (Postfix, from userid 1000)
        id 066BE10280E; Mon, 28 Jun 2021 15:24:56 +0300 (+03)
Date:   Mon, 28 Jun 2021 15:24:55 +0300
From:   "Kirill A. Shutemov" <kirill@shutemov.name>
To:     Peter Collingbourne <pcc@google.com>
Cc:     John Hubbard <jhubbard@nvidia.com>,
        Matthew Wilcox <willy@infradead.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Evgenii Stepanov <eugenis@google.com>,
        Jann Horn <jannh@google.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-mm@kvack.org, kernel test robot <lkp@intel.com>,
        Linux API <linux-api@vger.kernel.org>,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v4] mm: introduce reference pages
Message-ID: <20210628122455.sqo77q4jfxtiwt5b@box.shutemov.name>
References: <20210619092002.1791322-1-pcc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210619092002.1791322-1-pcc@google.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Jun 19, 2021 at 02:20:02AM -0700, Peter Collingbourne wrote:
>   #include <stdio.h>
>   #include <stdlib.h>
>   #include <string.h>
>   #include <sys/mman.h>
>   #include <unistd.h>
> 
>   constexpr unsigned char pattern_byte = 0xaa;
> 
>   #define PAGE_SIZE 4096
> 
>   _Alignas(PAGE_SIZE) static unsigned char pattern[PAGE_SIZE];
> 
>   int main(int argc, char **argv) {
>     if (argc < 3)
>       return 1;
>     bool use_refpage = argc > 3;
>     size_t mmap_size = atoi(argv[1]);
>     size_t touch_size = atoi(argv[2]);
> 
>     int refpage_fd;
>     if (use_refpage) {
>       memset(pattern, pattern_byte, PAGE_SIZE);
>       refpage_fd = syscall(448, pattern, 0);
>     }
>     for (unsigned i = 0; i != 1000; ++i) {
>       char *p;
>       if (use_refpage) {
>         p = (char *)mmap(0, mmap_size, PROT_READ | PROT_WRITE, MAP_PRIVATE,
>                          refpage_fd, 0);
>       } else {
>         p = (char *)mmap(0, mmap_size, PROT_READ | PROT_WRITE,
>                          MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
>         memset(p, pattern_byte, mmap_size);
>       }
>       for (unsigned j = 0; j < touch_size; j += PAGE_SIZE)
>         p[j] = 0;
>       munmap(p, mmap_size);
>     }
>   }

I don't like the inteface. It is tied to PAGE_SIZE and this doesn't seem
to be very future looking. How would it work with THPs?

Maybe we should cosider passing down a filling pattern to kernel and let
kernel allocate appropriate page size on read page fault? The pattern has
to be power of 2 and limited in lenght.

-- 
 Kirill A. Shutemov
