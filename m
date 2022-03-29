Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C403C433F5
	for <linux-doc@archiver.kernel.org>; Tue, 29 Mar 2022 08:25:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233812AbiC2I13 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 29 Mar 2022 04:27:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233550AbiC2I12 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 29 Mar 2022 04:27:28 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4B391F687A
        for <linux-doc@vger.kernel.org>; Tue, 29 Mar 2022 01:25:45 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id b13so13370622pfv.0
        for <linux-doc@vger.kernel.org>; Tue, 29 Mar 2022 01:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=LVOthKvmk7pEFsJLXItm4lvp3zEU/WLeAImvlN9hb2s=;
        b=buJ/2U0QrnRmckBFKFL3lvBV3fQpHpUOCZ9mXHFIGlcsJtwAD+w6eQeZ5PBcafy28N
         G9ckpw0BNTDplowDgkpVualiBg7pYo9jJx2CZkNXYDFJN/JdpVmNqwBGidRbshSVlojG
         q9oDEpPb63Er0/lQcwiqSX0THHF527XFlrZFuMazWKlSyM+DxqB5zwNnpknXnrEUgC6b
         idLxwRqqSjvsmK1kP5WFHS+lrWOn01q00DBRmTvdOwsiMCgvpqVk2/PsnVSyzArGpENT
         0Il0tmi5ZJcVp7V980UzDkqV7JuaEInkCL+x0smHAJgcxN110zSejoIKmR3BypIjAqF5
         dgIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=LVOthKvmk7pEFsJLXItm4lvp3zEU/WLeAImvlN9hb2s=;
        b=piBV46aqVZaekfZpyl8px/hLtw9ymzgl6TvOH3B/bLNDHKu+qEnMt1CMXewPVcKvf5
         Lj4tjtKZaLLOX2KF4dnb62OGfxAkFECWTt4h2X2MDPe75pLIW5L3Ma1HUUJYAfg2ePmJ
         AZQKupFS6SEhUEWw6W6l8r9409oCls1C3eRGDNKyEUMiFUa0NOFT7y94+a+zgoZFsotg
         H2fMMLZhM8GcA9LBgS/WslU02QdnXy0psiI+WwP14JRFe2eyPJt+6vZLMXxiEYUEzAb4
         Jv1daayNVyFCdRrb5E7WljhhdSz2X/FW3mEAMlRfzNc4LNA1xb6bINYmKjOL0VXaXUMd
         RD5g==
X-Gm-Message-State: AOAM5332/rzjMi7RhHZG11/8DMJd3bOnp+aHoDSyMQX0NXNENnnAZFOD
        +Usv8Sikrgdx63sp0yOSI5o=
X-Google-Smtp-Source: ABdhPJzQlCYNGrym0/8/toodi/lTCM2qmHu8CN+WWTqIQ3xoNQPJFLNmEsIPRiX6PLLU9GsHRgizMg==
X-Received: by 2002:a05:6a02:182:b0:374:5a57:cbf9 with SMTP id bj2-20020a056a02018200b003745a57cbf9mr1188405pgb.616.1648542345299;
        Tue, 29 Mar 2022 01:25:45 -0700 (PDT)
Received: from [192.168.11.5] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id l4-20020a056a0016c400b004f79504ef9csm18645656pfc.3.2022.03.29.01.25.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Mar 2022 01:25:44 -0700 (PDT)
Message-ID: <d3db3281-6cf2-51a9-c3ca-9fdae309de34@gmail.com>
Date:   Tue, 29 Mar 2022 17:25:40 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3 1/2] Documentation: kernel-doc: Promote two chapter
 headings to page title
Content-Language: en-US
To:     Bagas Sanjaya <bagasdotme@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-doc@vger.kernel.org
References: <20220328065030.24936-1-bagasdotme@gmail.com>
 <20220328065030.24936-2-bagasdotme@gmail.com>
 <6a5ce717-cc0a-9b7c-ba08-88e3b9f760bb@gmail.com>
 <b92e00a1-04e4-c1e2-42a8-16d87d3d0183@gmail.com>
From:   Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <b92e00a1-04e4-c1e2-42a8-16d87d3d0183@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

[Dropped irrelevant CCs]

Hi Bagas,

First of all, can I ask you to refrain from submitting new versions
everyday?  It is one of the most frowned-upon behavior in the kernel
community.

See: https://www.kernel.org/doc/html/latest/process/submitting-patches.ht=
ml#don-t-get-discouraged-or-impatient

I'm intentionally ignoring v4.

On Mon, 28 Mar 2022 19:28:51 +0700,
Bagas Sanjaya wrote:
> On 28/03/22 14.46, Akira Yokosawa wrote:
>> On Mon, 28 Mar 2022 13:50:30 +0700,
>> Bagas Sanjaya wrote:
>>> Promote two chapter headings, named "Writing kernel-doc comments" and=

>>> "Including kernel-doc comments" to page title. These titles deserve
>>> their own chapters in PDF output, although these will also appear as =
two
>>> separate titles in table of contents in HTML output.
>>
>> As Mauro and I have pointed out, this change won't have any effect
>> in the resulting HTML and PDF docs.=C2=A0 No difference *at all*.
>>
>> Why do you think this change is worthwhile.
>>
>> Please convince us!
>>
>=20
> My intention is to give page title for kernel-doc.rst, according to
> documentation guideline at [1].

I'm afraid I'm not convinced.

Let's see the history of this document.

It first appeared in commit 17defc282fe6 ("Documentation: add
meta-documentation for Sphinx and kernel-doc") as a chapter among
other topics which evolved into current Documentation/doc-guide/.
Back then there was a proper document title of "Linux Kernel
Documentation".

It was renamed "How to write kernel documentation" in commit
555af62431e6 ("docs: retitle the kernel-documentation.rst"), which
you still find in Documentation/doc-guide/index.rst.

It got split by commit 1dc4bbf0b268 ("docs-rst: doc-guide:
split the kernel-documentation.rst contents") in 2016.
The title markers have not been touched ever since.

This is why you find those markers one level below the ones
suggested in the guideline.

I think the guideline predates the reorganization of
Documentations/ into document-wise subdirectories.
It needs some expansion regarding .rst docs included from
index.rst files under subdirectories.

What does "document title" mean?  The one in index.rst?

What happens when a .rst file has a "document title"-level
title at the beginning?  Would it be treated as a "chapter"
level title?

What happens when an index.rst file is included from
another index.rst file?

Which title is used as a "page title" in the HTML docs?

=2E.. and so on.

I'd like to suggest you do the expansion of the guideline
itself, which will be much appreciated.

        Thanks, Akira

>=20
[...]
