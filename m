Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id F1D4D7D90F
	for <lwn-linux-doc@archive.lwn.net>; Thu, 10 Oct 2019 03:00:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726669AbfJJDAv (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 9 Oct 2019 23:00:51 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:40603 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726478AbfJJDAv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 9 Oct 2019 23:00:51 -0400
Received: by mail-pl1-f193.google.com with SMTP id d22so2037032pll.7
        for <linux-doc@vger.kernel.org>; Wed, 09 Oct 2019 20:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=L6ILjTk0jMMMftmvOM9CzHygCFbStOs1a6k6VEE1ouM=;
        b=eSnlHfEUf02FrePpR5J1jTsko84CMK0y1jMta6B3aa1ZfKyJ2FOP7BzeNQ3HKLIMTO
         SzKkWhhC1GdQnZdg4//Dogck6+47nSI0vLTv9Gc4edJ3hyue1yuir3Wr/3BZEn6Idwod
         vWp8112rn/txvDFZj4El8y2IVT3YxkJMRQCSO3XWD730Z+DvaK6KtSktTVcJIhcUyD1n
         AJ/T4sapM5sazwJTy1RNxsq0SyekbTq/qlqcqk/7YqVrLn+mHCB74Q7Ou1julifmI+97
         HjpAWBbgGd7L72OWpZhdQ9jznQJtA56oeymb9ifW7OOcamS6mB0gDOUux5WDz390WleQ
         0vjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=L6ILjTk0jMMMftmvOM9CzHygCFbStOs1a6k6VEE1ouM=;
        b=cv7SAaUVWlIXsNiDuzJUfsLdWvwAficcW/hsLd4+JrOkn2VdBSAFf4btzB1Zrw35pk
         N6UQaFsxZC00suQ2QeM6x2i8LAmDREQr2ruhSBhPSnb+0SY5xlliYXhSgIdspp81DQiO
         zEf9u11CoXWF2bP4nQ9h0KCfCZDyc2+lzBdR2eZbnjKwnDGhUqAixPOWr7UvPAr6mQ5B
         oHeKRIoj1CjNIJZ3JKSiu7wuSmXycI51JQYvfzlHt4cJSHjKUJ1d/N7SukJfIjpmQzD3
         XwBL7tT79FESriSRPa32G6W4unUNckcqW6QgLahqwROzH7mBfl0v5YhlHvG6gpGs8tSe
         R9iw==
X-Gm-Message-State: APjAAAWLl7oprmDKX1D8SxsioCxGi9bWwJm9Dhnwf5wiNTmPsLTwp45z
        7+rZoRP2pTADHxf+kOMBTGGQSULs0XI=
X-Google-Smtp-Source: APXvYqxkAwBrHyoiNX5V10E7ob4IF2vwmuGTnxSkiLKFR+5hNG9JZB/1UucHTs4zLOvlQwEWkQz5Bg==
X-Received: by 2002:a17:902:aa43:: with SMTP id c3mr6582731plr.26.1570676450696;
        Wed, 09 Oct 2019 20:00:50 -0700 (PDT)
Received: from Gentoo ([103.231.91.35])
        by smtp.gmail.com with ESMTPSA id d10sm3796515pfh.8.2019.10.09.20.00.45
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 09 Oct 2019 20:00:50 -0700 (PDT)
Date:   Thu, 10 Oct 2019 08:30:38 +0530
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     Kees Cook <keescook@chromium.org>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: Sphinx parallel build errors
Message-ID: <20191010030035.GA17659@Gentoo>
References: <dc19a670-7e8e-04e5-667d-578c2dd3754e@infradead.org>
 <201910091929.0C058BB@keescook>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="6TrnltStXW4iwmi0"
Content-Disposition: inline
In-Reply-To: <201910091929.0C058BB@keescook>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--6TrnltStXW4iwmi0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 19:30 Wed 09 Oct 2019, Kees Cook wrote:
>On Wed, Oct 09, 2019 at 02:37:51PM -0700, Randy Dunlap wrote:
>>
>> Sphinx parallel build error:
>> OSError: [Errno 12] Cannot allocate memory
>>
>> I have had this error 4 times in the last 3 days.
>>
>> The first time it oom-killed Thunderbird.  No big deal.
>> The second time it oom-killed gimp, which had 24 photos open.
>> Still no big deal.  Just a nuisance.
>
>Eek, sorry! OOM-killer once again chooses ... not the culprit. ;)
>
>> My little laptop has only 8 GB of RAM.
>>
>> Is there a way that I can limit the amount of parallelism?
>
>As mentioned, "make -jN htmldocs" should be respected now (before it was
>as many CPUs as it had). I'm wondering if it's actually the addition of
>the MAINTAINERS file parsing -- that's a really big parse and maybe that
>pushed things over the edge?
>
>--=20
>Kees Cook

Seriously, looking/parsing MAINTAINERS file becomes serious pain in the
arse. It big and very easy to get lost in the way.
=20
 Okay, complaining for the sake of complaining doesn't make things go
 far ...but until we find something more efficient ,alas! We have deal
 with it...that kinda sucks.

-Bhaskar

--6TrnltStXW4iwmi0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEnwF+nWawchZUPOuwsjqdtxFLKRUFAl2entAACgkQsjqdtxFL
KRXKuggAgBSyoTfk5EM3FIRFDOA0xmOludBKEtZNigzml6RAvRejjx39EzNpyHJP
SM3u+aqWbeyh0dNgatU/yRqIfpjekvyvaKJL39BHKQlMxSqJp/l4bOE/XoggNqMS
WRtunmQa2nHa8AHbkVM2OP6gCz8y9vMMSQQ4pVHgyxSIK6pHK01iZh2Ki/GE6C62
KZ13n53K/ndAFikhHUo73JFF7KrMVScynR2+Vvkx7s/74iODT8jGli6F9pWuPT3I
qtCqSySlKDELDtj+SlOagpS2ePyhGzcEoiyEWFmAPLPvegISDLpT7Oc1tM44wrNb
4UiluSbdL4DwX1ZFc85S1iu0oLBMCg==
=oBgw
-----END PGP SIGNATURE-----

--6TrnltStXW4iwmi0--
