Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F985C433DB
	for <linux-doc@archiver.kernel.org>; Thu, 14 Jan 2021 14:58:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 48C8823A7D
	for <linux-doc@archiver.kernel.org>; Thu, 14 Jan 2021 14:58:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727407AbhANO6H (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 14 Jan 2021 09:58:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31543 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727150AbhANO6G (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 14 Jan 2021 09:58:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1610636199;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nbchwcZUiSag5BbIN49pWrX6UaO9j5xtOJpcOaVjMHM=;
        b=ccqXN8xWJnTZBo+/bF0kFNDwwPHcakuR4/zF/KuFdNkIzNn34521p0NfU5hEgAPJrrMhu1
        YsXkz/VKj2I59y4qa8cE2L4yqeDVlwfpC7G30w5T9e9y07atTOtEgnDq1s7zNfhYoBqu57
        HB+BgWYkZNZ+vZz5en1OmjY9wOQVGw4=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-458-knbvc9SIO5OUmfBTjVJ8EQ-1; Thu, 14 Jan 2021 09:56:38 -0500
X-MC-Unique: knbvc9SIO5OUmfBTjVJ8EQ-1
Received: by mail-qk1-f198.google.com with SMTP id d7so4905553qkb.23
        for <linux-doc@vger.kernel.org>; Thu, 14 Jan 2021 06:56:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=nbchwcZUiSag5BbIN49pWrX6UaO9j5xtOJpcOaVjMHM=;
        b=Ph55HRVRd6ZUhrtXlLr+kgCcRV84jiy3zZBN/40MlQ+YYSld4zcs8NuWFXzfC2gwQ/
         fUpQKJR1MEKA/NMWDL8NPuel7FKwTX3LqQXGSyusAFRoGnAD4jEY05N2U2A8Ok1JFVu0
         c1Wctw8I+G5qUcucxlku8S4hXOJql0xKRU/0VLRg/SbOYgaWnyUxSsyqfP1ZFTS8j4BC
         VBOotIfcgSEONyA1LT52l13sOkZGdPa8gghAf4ZlxjnJthYUrJcPVKAr29L6nhbzIdWy
         a0o8DDrGn31vMB9gQD4UI5YIviEf5FpbFj0PuimRk+Li81E+5Z6ZdsfSOlsFrCbBGv96
         4b8g==
X-Gm-Message-State: AOAM5334gtH6bI+6fDAlA/RyDiXaCt4CQztti/qVWEgCGSvo0DztBcJ7
        8D9Ln2N4V/KGNzNAkno9ro3bmZqjC0SKARFEhX0kclU+bpSPPAdBKN6TT6FMM83Y0nOaf15WScl
        wQ5lmJ2BHD8f1fKWyroeT
X-Received: by 2002:ae9:f819:: with SMTP id x25mr7421373qkh.429.1610636197638;
        Thu, 14 Jan 2021 06:56:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxzC9kWhDdASoCrS9eh0meOVk1AAL4J2tGbvAlfoA4Q2l9zFniGWeZggsOmq/G+R7qqv44Idw==
X-Received: by 2002:ae9:f819:: with SMTP id x25mr7421350qkh.429.1610636197397;
        Thu, 14 Jan 2021 06:56:37 -0800 (PST)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id 6sm3114272qko.3.2021.01.14.06.56.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Jan 2021 06:56:36 -0800 (PST)
Subject: Re: [PATCH 05/10] docs: fpga: dfl.rst: Fix a couple building issues
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Moritz Fischer <mdf@kernel.org>, Wu Hao <hao.wu@intel.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-fpga@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1610610444.git.mchehab+huawei@kernel.org>
 <fca8e53692b1e57242e09fc3436cacd1961c8d8b.1610610444.git.mchehab+huawei@kernel.org>
From:   Tom Rix <trix@redhat.com>
Message-ID: <16cf60e2-74ec-8d51-cb78-0e5e614b5a4c@redhat.com>
Date:   Thu, 14 Jan 2021 06:56:34 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <fca8e53692b1e57242e09fc3436cacd1961c8d8b.1610610444.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


On 1/13/21 11:53 PM, Mauro Carvalho Chehab wrote:
> A title markup length is smaller than required;
> A literal block is not marked as such.
>
> This fixes the warnings below:
>
>     .../Documentation/fpga/dfl.rst:505: WARNING: Title underline too short.
>
>     Location of DFLs on a PCI Device
>     ===========================
>     .../Documentation/fpga/dfl.rst:523: WARNING: Unexpected indentation.
>     .../Documentation/fpga/dfl.rst:523: WARNING: Blank line required after table.
>     .../Documentation/fpga/dfl.rst:524: WARNING: Block quote ends without a blank line; unexpected unindent.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Lukas made an earlier change here

https://lore.kernel.org/linux-fpga/alpine.DEB.2.22.394.2101111016480.2457315@rhweight-WRK1/

Tom


