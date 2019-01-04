Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5D9C47D04D
	for <lwn-linux-doc@archive.lwn.net>; Fri,  4 Jan 2019 22:10:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726094AbfADWKs (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 4 Jan 2019 17:10:48 -0500
Received: from mx.kolabnow.com ([95.128.36.42]:10398 "EHLO mx.kolabnow.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726100AbfADWKs (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 4 Jan 2019 17:10:48 -0500
Received: from localhost (unknown [127.0.0.1])
        by ext-mx-out003.mykolab.com (Postfix) with ESMTP id C3C83404D2;
        Fri,  4 Jan 2019 23:10:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kolabnow.com; h=
        content-type:content-type:content-transfer-encoding:mime-version
        :references:in-reply-to:message-id:date:date:subject:subject
        :from:from:received:received:received; s=dkim20160331; t=
        1546639844; x=1548454245; bh=+mUVarqQAkRSTvJ88hlNfvjzfRoIOKhXL/2
        mdCxRThQ=; b=TFT+CceWRWuUSaxU6c7D22BR/TaJ5BlFME6SVTxOR85xA0vkbY0
        wtSXTdPU1e7wjRxJXq7x2b/TlTuRVkFsUvN9P5Cfq2+cUpoMPycSSUwl8+5SYNCT
        EYzKf02Alb92h/Zmuy2GJLMQivnzFtfDVWZDdg51wlBGtetpoxKtvMFDxnvl34w3
        VP7L99s+zGd0JJYu6X9QLJWmm6iI++lXfU+tT2NQZPuE1WRSaWMs7oPSANNm2l3x
        Q4LTGdWsqmzN8bNjKGhbMLKawFQnHA8y/4mloNlva/xCrt1w4Kb0ga7VG2YNYPus
        ilyS8/0lULg7jUqlX6enHBxNHy3/yk5VNZn3VYzP7Zex7/n2DWceMrj0/mLj2MaT
        ms5fIusEiEFTz9kGqA9tG10asG7s2S8etSwR157Eq2dE0Fc30pfA12cBXMVpZ3xs
        fI9B84SalelVPAe7Zl4MRhb0dqxdB0YA0T7HmfEmU91/Ql/TFuPcozck2bv6yz/3
        waM6IQtVY1qXyUE83wEpy+0rOkHPB69wLv/BGrbHz6WY7l6J7T9hxZ8qZGMIpnIl
        7ImI9uJsb6wENh3C/nB8C+12UjqcRbOVsAD0zisLsanqXygqfCzp5AJDflNxDje/
        RRdsPJ/sbbo0ewufVd4JLBzwczXwk2NBaFwIzKJ+cbFJK7tLnr2y1EMY=
X-Virus-Scanned: amavisd-new at mykolab.com
Received: from mx.kolabnow.com ([127.0.0.1])
        by localhost (ext-mx-out003.mykolab.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id idGuqFJkEOtp; Fri,  4 Jan 2019 23:10:44 +0100 (CET)
Received: from int-mx001.mykolab.com (unknown [10.9.13.1])
        by ext-mx-out003.mykolab.com (Postfix) with ESMTPS id 5DD8A404C6;
        Fri,  4 Jan 2019 23:10:44 +0100 (CET)
Received: from ext-subm003.mykolab.com (unknown [10.9.6.3])
        by int-mx001.mykolab.com (Postfix) with ESMTPS id A16DE2B9;
        Fri,  4 Jan 2019 23:10:35 +0100 (CET)
From:   Federico Vaga <federico.vaga@vaga.pv.it>
To:     Bart Van Assche <bvanassche@acm.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Matthew Wilcox <willy@infradead.org>,
        "Geyslan G . Bem" <geyslan@gmail.com>,
        Tiago Natel de Moura <tiago4orion@gmail.com>,
        Alison Chaiken <alison@she-devel.com>,
        Joe Perches <joe@perches.com>, Li Yang <leo@zh-kernel.org>
Subject: Re: [PATCH] Documentation/CodingStyle: Use directory-local variables for emacs
Date:   Fri, 04 Jan 2019 23:10:31 +0100
Message-ID: <1951386.HLNclI27qt@harkonnen>
In-Reply-To: <20190104210834.89231-1-bvanassche@acm.org>
References: <20190104210834.89231-1-bvanassche@acm.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Friday, January 4, 2019 10:08:33 PM CET Bart Van Assche wrote:
> In emacs 23.1 support for directory-local variables was added (see also
> https://lists.gnu.org/archive/html/info-gnu-emacs/2009-07/msg00000.html).
> Simplify the settings in coding-style.rst by using that feature.
> Additionally, do not inherit any settings from emacs' linux coding style
> to minimize dependencies on the version of emacs that is being used.
> 
> I have verified with several large and nontrivial kernel source files
> that the new settings format code according to what checkpatch expects.
> 
> Signed-off-by: Bart Van Assche <bvanassche@acm.org>
> Cc: Matthew Wilcox <willy@infradead.org>
> Cc: Geyslan G. Bem <geyslan@gmail.com>
> Cc: Tiago Natel de Moura <tiago4orion@gmail.com>
> Cc: Alison Chaiken <alison@she-devel.com>
> Cc: Joe Perches <joe@perches.com>
> Cc: Federico Vaga <federico.vaga@vaga.pv.it>
> Cc: Li Yang <leo@zh-kernel.org>
> ---
>  Documentation/process/coding-style.rst | 57 +++++++++++++++++---------
>  1 file changed, 37 insertions(+), 20 deletions(-)
> 
> Changes compared to v1:
> - Removed top-level .dir-locals.el file again and updated coding-style.rst
> instead. - Restored the humourous paragraph about emacs.
> - Left out Italian and Chinese translations.

Since now there are only code changes, I think you can apply them on both 
Italian and Chinese translations.

As a general comment, I personally think that it worth to mention the fact 
that the user can take this code (actually part of it) and put it in a .dir-
locals.el file in the top-level directory.

> diff --git a/Documentation/process/coding-style.rst
> b/Documentation/process/coding-style.rst index 277c113376a6..5013883aec8e
> 100644
> --- a/Documentation/process/coding-style.rst
> +++ b/Documentation/process/coding-style.rst
> @@ -592,26 +592,43 @@ values.  To do the latter, you can stick the following
> in your .emacs file: (* (max steps 1)
>           c-basic-offset)))
> 
> -  (add-hook 'c-mode-common-hook
> -            (lambda ()
> -              ;; Add kernel style
> -              (c-add-style
> -               "linux-tabs-only"
> -               '("linux" (c-offsets-alist
> -                          (arglist-cont-nonempty
> -                           c-lineup-gcc-asm-reg
> -                           c-lineup-arglist-tabs-only))))))
> -
> -  (add-hook 'c-mode-hook
> -            (lambda ()
> -              (let ((filename (buffer-file-name)))
> -                ;; Enable kernel mode for the appropriate files
> -                (when (and filename
> -                           (string-match (expand-file-name
> "~/src/linux-trees") -                                         filename))
> -                  (setq indent-tabs-mode t)
> -                  (setq show-trailing-whitespace t)
> -                  (c-set-style "linux-tabs-only")))))
> +  (dir-locals-set-class-variables
> +   'linux-kernel
> +   '((c-mode . (
> +          (c-basic-offset . 8)
> +          (c-label-minimum-indentation . 0)
> +          (c-offsets-alist . (
> +                  (arglist-close         . c-lineup-arglist-tabs-only)
> +                  (arglist-cont-nonempty .
> +		      (c-lineup-gcc-asm-reg c-lineup-arglist-tabs-only))
> +                  (arglist-intro         . +)
> +                  (brace-list-intro      . +)
> +                  (c                     . c-lineup-C-comments)
> +                  (case-label            . 0)
> +                  (comment-intro         . c-lineup-comment)
> +                  (cpp-define-intro      . +)
> +                  (cpp-macro             . -1000)
> +                  (cpp-macro-cont        . +)
> +                  (defun-block-intro     . +)
> +                  (else-clause           . 0)
> +                  (func-decl-cont        . +)
> +                  (inclass               . +)
> +                  (inher-cont            . c-lineup-multi-inher)
> +                  (knr-argdecl-intro     . 0)
> +                  (label                 . -1000)
> +                  (statement             . 0)
> +                  (statement-block-intro . +)
> +                  (statement-case-intro  . +)
> +                  (statement-cont        . +)
> +                  (substatement          . +)
> +                  ))
> +          (indent-tabs-mode . t)
> +          (show-trailing-whitespace . t)
> +          ))))
> +
> +  (dir-locals-set-directory-class
> +   (expand-file-name "~/src/linux-trees")
> +   'linux-kernel)
> 
>  This will make emacs go better with the kernel coding style for C
>  files below ``~/src/linux-trees``.




