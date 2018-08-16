Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 906447D2EE
	for <lwn-linux-doc@archive.lwn.net>; Thu, 16 Aug 2018 19:23:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725888AbeHPWYL (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 16 Aug 2018 18:24:11 -0400
Received: from mail-qt0-f194.google.com ([209.85.216.194]:46173 "EHLO
        mail-qt0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725828AbeHPWYL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 16 Aug 2018 18:24:11 -0400
Received: by mail-qt0-f194.google.com with SMTP id d4-v6so6084427qtn.13
        for <linux-doc@vger.kernel.org>; Thu, 16 Aug 2018 12:23:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zLQvIDtjtGko1xB3gXADRmWviRjFlggMCqSQ1H9FKGU=;
        b=ly+I8dssvoEKMytwIU2kDuXDSYmVtearBQ754WCv/5ivA5eYYnmZ+Y8jfOP1oAr3kd
         UgHY1kGQ7Liw/K1h3oqcLE7C7jNR7Ye2FZX7lmfnvvWAD8byjPwBhBaJuBS9u0FkG+qZ
         GtMRJZV9NpOgiH8MQUJ+FAOPteTSelGIxnC4Knmzina1scnbwkjtOp9sdpbTwTo1om4d
         DhP8QWYOr0dA/YRUwa5sTSI80s+gYjJIv0d0QdZI/5DMDGGaN2WA7YD61jewHmBGJE0v
         WSXVwC2Kjl4J+qSyu7dAoVHfYjGDrw7xj0VPszUKZRQ4FrHOcRYjQsCBOKHqvNnlHbeT
         PC5A==
X-Gm-Message-State: AOUpUlHwF3w9G1cTW9F0BOZLQeGxQY1WrtnckTWwn3sa6CDEvzDIBhqn
        oyuKRRWzGe2bJfiB6UEyD+/Nfw==
X-Google-Smtp-Source: ANB0VdYlRMHRw9vrOCHYzgsuyQDnFBMIMcuGm7OfW4Yf+SfAo1C2r+S78g0+vZAg1QO05Ai7DRkBRg==
X-Received: by 2002:ac8:364b:: with SMTP id n11-v6mr950594qtb.339.1534447432167;
        Thu, 16 Aug 2018 12:23:52 -0700 (PDT)
Received: from ?IPv6:2601:602:9802:a8dc::8a8f? ([2601:602:9802:a8dc::8a8f])
        by smtp.gmail.com with ESMTPSA id b40-v6sm84319qte.43.2018.08.16.12.23.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 16 Aug 2018 12:23:51 -0700 (PDT)
Subject: Re: [PATCH] kbuild: Fix LOADLIBES rename in
 Documentation/kbuild/makefiles.txt
To:     Michal Suchanek <msuchanek@suse.de>
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Jonathan Corbet <corbet@lwn.net>, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20180816170555.21623-1-msuchanek@suse.de>
From:   Laura Abbott <labbott@redhat.com>
Message-ID: <4f6673db-5b59-c3b1-042c-b36057c31c13@redhat.com>
Date:   Thu, 16 Aug 2018 12:23:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180816170555.21623-1-msuchanek@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 08/16/2018 10:05 AM, Michal Suchanek wrote:
> Fixes: 8377bd2b9ee1 ("kbuild: Rename HOST_LOADLIBES to
> 		KBUILD_HOSTLDLIBS")
> 
> Signed-off-by: Michal Suchanek <msuchanek@suse.de>

Acked-by: Laura Abbott <labbott@redhat.com>

> ---
>   Documentation/kbuild/makefiles.txt | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/kbuild/makefiles.txt b/Documentation/kbuild/makefiles.txt
> index 766355b1d221..7b6a2b2bdc98 100644
> --- a/Documentation/kbuild/makefiles.txt
> +++ b/Documentation/kbuild/makefiles.txt
> @@ -680,7 +680,7 @@ Both possibilities are described in the following.
>   
>   	Example:
>   		#scripts/kconfig/Makefile
> -		HOSTLOADLIBES_qconf := -L$(QTDIR)/lib
> +		HOSTLDLIBS_qconf := -L$(QTDIR)/lib
>   
>   	When linking qconf, it will be passed the extra option
>   	"-L$(QTDIR)/lib".
> 

