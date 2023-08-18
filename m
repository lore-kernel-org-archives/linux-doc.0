Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 179FAC71159
	for <linux-doc@archiver.kernel.org>; Fri, 18 Aug 2023 16:50:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229640AbjHRQuA (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 18 Aug 2023 12:50:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378611AbjHRQtk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 18 Aug 2023 12:49:40 -0400
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6804C2D5A
        for <linux-doc@vger.kernel.org>; Fri, 18 Aug 2023 09:49:38 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::646])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id C3B3A6A2;
        Fri, 18 Aug 2023 16:49:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net C3B3A6A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1692377377; bh=aTSKcXHAzi+llhwn6fAsHPlzQduZaSvDCTxPIO1KyHM=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=HM3NbSFPc/+XF71vhQbvnyNYZUcuOQlS0CsmVBhTu/hGjW84crdABWW6YTviEihz1
         uITVyi/EooRDe8u3/Y52hI4CRDBtyduI9/k6z/3Tn2MNK0uRokkw2PbU+nvXh3OxY7
         WKwJzYiHk79OGe7Nc6k3QLKy6hv5EoHtQmyuDy8U3f0efkUUZslCtwcXITgBq0aMjc
         jHDg1Ks9GB/Tk0xbq0XO8kkrthzRsCFiWmAO3ym6c1CS7DX1v195T3wmIDb/s9hjvT
         +xQrU5AQ4NHMNkbODwpNmRdmvu0xfIwx3zopa6XQ5kHIKkyeh/id5FqiQVd7VCcLi1
         X8GgadD2EMRLA==
From:   Jonathan Corbet <corbet@lwn.net>
To:     "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        linux-doc@vger.kernel.org
Cc:     "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Carlos Bilbao <carlos.bilbao@amd.com>,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH] doc: Always check kernel-doc
In-Reply-To: <20230817144142.903553-1-willy@infradead.org>
References: <20230817144142.903553-1-willy@infradead.org>
Date:   Fri, 18 Aug 2023 10:49:37 -0600
Message-ID: <87cyzkmh26.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

"Matthew Wilcox (Oracle)" <willy@infradead.org> writes:

> kernel-doc checks were initially enabled only for builds which had extra
> warnings enabled.  We have now eliminated enough kernel-doc warnings that
> we can enable kernel-doc checking by default.  This comes at a slight
> cost; for an allmodconfig build, make -j8 fs/ timings on my laptop
> increase by less than 5%:
>
> before real     4m7.456s        4m4.416s        4m6.663s
> after real      4m18.960s       4m21.566s       4m23.234s
> before user     29m35.370s      29m11.036s      29m30.092s
> after user      30m55.602s      31m10.918s      31m20.311s
> before sys      2m8.230s        2m6.392s        2m9.727s
> after sys       2m19.896        2m23.422s       2m25.762s
>
> This feels like a reasonable price to pay to force people to keep
> documentation up to date.
>
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> Reviewed-by: Carlos Bilbao <carlos.bilbao@amd.com>
> ---
>  scripts/Makefile.build | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 82e3fb19fdaf..52f57c0c5227 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -100,11 +100,9 @@ else ifeq ($(KBUILD_CHECKSRC),2)
>          cmd_force_checksrc = $(CHECK) $(CHECKFLAGS) $(c_flags) $<
>  endif
>  
> -ifneq ($(KBUILD_EXTRA_WARN),)
> -  cmd_checkdoc = $(srctree)/scripts/kernel-doc -none $(KDOCFLAGS) \
> +cmd_checkdoc = $(srctree)/scripts/kernel-doc -none $(KDOCFLAGS) \
>          $(if $(findstring 2, $(KBUILD_EXTRA_WARN)), -Wall) \
>          $<
> -endif
>  

So I'm not opposed to this and can carry it in docs-next (after the
merge window, though, for something like this).  But, it seems to me, we
should copy Masahiro (added) on a build patch of this type.

Thanks,

jon
