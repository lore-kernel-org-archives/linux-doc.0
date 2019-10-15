Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 8FEFE7D90D
	for <lwn-linux-doc@archive.lwn.net>; Tue, 15 Oct 2019 20:55:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727988AbfJOUzR (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 15 Oct 2019 16:55:17 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:41004 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728276AbfJOUzQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 15 Oct 2019 16:55:16 -0400
Received: by mail-ed1-f66.google.com with SMTP id f20so19391256edv.8
        for <linux-doc@vger.kernel.org>; Tue, 15 Oct 2019 13:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=oDe3m4rQhSeY+085wHNREg/SXUE2bSEKEEx664Jg5w8=;
        b=QlVkZKTUMDSSzBGZhSI9NF6G0+3XMbJ6J2iynj+OS6O4zXcFlL3S4E5MaYJDcauxZk
         FgTdM3r8hZSgOz96TSowUnqL/VC7mMRck7BQaJC5Ima8iDx+OJfwSo2bdkwUeIMUK9Mh
         XedO9xP0CggVE6s6ltyVqWYIq4ePbRiXxCmhY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=oDe3m4rQhSeY+085wHNREg/SXUE2bSEKEEx664Jg5w8=;
        b=bC/gvhQvwO9M7f129C9XIAk5EPszfbtThfDyXxMwNk0JA2KTTU7i5oRfc5UhYotwWb
         kfqNp7pG/lWSG2LhGSRTmCncKsQz4sWGekSvMd6JnX9zpF2ApYHDFiXS2SryRwViWrjY
         GTzqLj0Po+DD/F6zs6cgO9BOc7Yb3n9Mcg6WqoDxZOIjK8eDSm+Ap7NCl+1d0Dv+VzKU
         tH2lyAc5vQMiYSk54RnxI6zJrb7IkCtoXdh5kKNMxkKNk+xjU6BH6Iwb/ErxTiEmF/7x
         hA+KPnJA7WUGKlzUpw162T7hfYgKg5dLcU+hjspjdYdpGOG/lhxcqt+fF/MK5etApX7H
         GnxQ==
X-Gm-Message-State: APjAAAUZItvE0/2dP2AVjWSkAlPPZI8+N0j4BDu7iWTJxaAwpfdJ2Qk1
        hC8Hd+94C2LZr93T1vF9DkgnLQ==
X-Google-Smtp-Source: APXvYqwDITrOe6St9TL9o8lLSzMebzIU+Q8KhhpwCgh+rCtbPFOdRBURIT5dtKJRht+X8Hb+Rm5Wxw==
X-Received: by 2002:a17:906:6094:: with SMTP id t20mr36753160ejj.316.1571172913188;
        Tue, 15 Oct 2019 13:55:13 -0700 (PDT)
Received: from [192.168.1.149] (ip-5-186-115-54.cgn.fibianet.dk. [5.186.115.54])
        by smtp.gmail.com with ESMTPSA id gl4sm2871268ejb.6.2019.10.15.13.55.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Oct 2019 13:55:12 -0700 (PDT)
Subject: Re: [PATCH v3] docs: Use make invocation's -j argument for
 parallelism
To:     Kees Cook <keescook@chromium.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <201909241627.CEA19509@keescook>
 <eb25959a-9ec4-3530-2031-d9d716b40b20@rasmusvillemoes.dk>
 <201910040904.43B61E4@keescook>
 <b95ded2e-474a-5f7b-af07-30732e8cdb41@rasmusvillemoes.dk>
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <44c01043-ab24-b4de-6544-e8efd153e27a@rasmusvillemoes.dk>
Date:   Tue, 15 Oct 2019 22:55:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <b95ded2e-474a-5f7b-af07-30732e8cdb41@rasmusvillemoes.dk>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 06/10/2019 21.33, Rasmus Villemoes wrote:
> On 04/10/2019 18.08, Kees Cook wrote:

>> The best solution would be to teach sphinx-build about the Make
>> jobserver, though I expect that would be weird. Another idea would be to
>> hold the reservation until sphinx-build finishes and THEN return the
>> slots? That would likely need to change from a utility to a sphinx-build
>> wrapper...
> 
> Yes, a more general solution would be some kind of generic wrapper that
> would hog however many tokens it could get hold of and run a given
> command with a commandline slightly modified to hand over those tokens -
> then wait for that process to exit and give back the tokens. That would
> work for any command that knows about parallelism but doesn't support
> the make jobserver model.

On the off-chance that anybody cares I tried implementing that, because
I've wanted something like that to make "ninja" play nice when invoked
from Make for a long time. Rough sketch at
https://github.com/Villemoes/jobhog .

Rasmus
