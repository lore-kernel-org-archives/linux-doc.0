Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 232CFC433DB
	for <linux-doc@archiver.kernel.org>; Mon, 11 Jan 2021 16:09:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9B10D22A83
	for <linux-doc@archiver.kernel.org>; Mon, 11 Jan 2021 16:09:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388807AbhAKQJI (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 11 Jan 2021 11:09:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29304 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388754AbhAKQJI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 11 Jan 2021 11:09:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1610381262;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=gR3CElKk0PnSgnXHclh3IlBtMgA5nThX3E70/mb55XA=;
        b=GdEELA+5ej+jR6sOy/BeNjgZT6fXOOPjEYzDNkuFKJhJBmowwETbx3lMedA7pxLHn/I83p
        Q7gwDGAypu6St4sDOduOT0pCMr2BSPVqG5sL6vr2IaPegNYdO4HqPcoD5bBr0Z0fetLSEY
        5BjZ9uYtucJNcS6O5DIKNVe14A03y+I=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-425-GCrikBXbNfio4hR7W3VfsQ-1; Mon, 11 Jan 2021 11:07:38 -0500
X-MC-Unique: GCrikBXbNfio4hR7W3VfsQ-1
Received: by mail-qt1-f199.google.com with SMTP id a11so84389qto.16
        for <linux-doc@vger.kernel.org>; Mon, 11 Jan 2021 08:07:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=gR3CElKk0PnSgnXHclh3IlBtMgA5nThX3E70/mb55XA=;
        b=eYLSsh8l3sXOeiyxtrRQQtfEv16yKfkObSedbkG5hl99yug0FFDGcsq21/lNtL9QaT
         61ykbaNZwsj2brnv2A3v40OFAssrCm8py86jJ6/aoUusjWeN9UVFr9sA9RQzzqab3ZMb
         eaP0A21FxPqaZw3eCGLgWYjyR7F+tmmseTYaYeLKu02bEjTy8Fv8rsLtfS+DiUS10mdw
         KW9HMO6z1KME2M4jAkUIxf08q366pzeI9PaGLqpe173fkF4EUrzvzdxbi1kvHIG0Ivhf
         iVSUu85lW9kq+NUA7f8HUJaGArwlnynPb1Q3o2mrm4mh7HDW9wLdx/9g+CRHLNpH2kqg
         TDBQ==
X-Gm-Message-State: AOAM532Y3mJrIxUldJ1t/4OueK5wIftRGOTQgFgJHUChEiezcixo7SK/
        pRHQXyJSPOh/1zi24DmVry+YOT/e3QWM7ABNjB0CibRs7wKRKIRRd+rjXkS1wOYhAZopVHz/XMu
        hz2te5o6gxvuADu4lQqT0
X-Received: by 2002:ac8:7a82:: with SMTP id x2mr343241qtr.20.1610381258542;
        Mon, 11 Jan 2021 08:07:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxozA1GI+nFom93hyoQJ4M9BtRvKUZlCABqi9lHMk4l6x4HjRnwTYzqc0Cp1kjwkIzE52l8Eg==
X-Received: by 2002:ac8:7a82:: with SMTP id x2mr343227qtr.20.1610381258378;
        Mon, 11 Jan 2021 08:07:38 -0800 (PST)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id u26sm107305qke.57.2021.01.11.08.07.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Jan 2021 08:07:37 -0800 (PST)
Subject: Re: [PATCH -next] fpga: dfl-pci: rectify ReST formatting
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Lukas Bulwahn <lukas.bulwahn@gmail.com>, Wu Hao <hao.wu@intel.com>,
        Moritz Fischer <mdf@kernel.org>,
        Matthew Gerlach <matthew.gerlach@linux.intel.com>,
        linux-fpga@vger.kernel.org, linux-doc@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210111112113.27242-1-lukas.bulwahn@gmail.com>
 <d22ccfa1-19a1-d48c-d822-76ea289965ab@redhat.com>
 <X/x0cJ2N0/VA81FK@kroah.com>
From:   Tom Rix <trix@redhat.com>
Message-ID: <422569e9-b85c-7724-51ea-bcbdf6c26bf6@redhat.com>
Date:   Mon, 11 Jan 2021 08:07:35 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <X/x0cJ2N0/VA81FK@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


On 1/11/21 7:53 AM, Greg Kroah-Hartman wrote:
> On Mon, Jan 11, 2021 at 07:11:59AM -0800, Tom Rix wrote:
>> On 1/11/21 3:21 AM, Lukas Bulwahn wrote:
>>> Commit fa41d10589be ("fpga: dfl-pci: locate DFLs by PCIe vendor specific
>>> capability") provides documentation to the FPGA Device Feature List (DFL)
>>> Framework Overview, but introduced new documentation warnings:
>>>
>>>   ./Documentation/fpga/dfl.rst:
>>>     505: WARNING: Title underline too short.
>>>     523: WARNING: Unexpected indentation.
>>>     523: WARNING: Blank line required after table.
>>>     524: WARNING: Block quote ends without a blank line; unexpected unindent.
>>>
>>> Rectify ReST formatting in ./Documentation/fpga/dfl.rst.
>> Can you explain how to reproduce this problem ?
> 'make htmldocs'

Thanks, I have verified the problem and its resolution.

Tested-by: Tom Rix <trix@redhat.com>

>

