Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E000C433EF
	for <linux-doc@archiver.kernel.org>; Tue, 19 Apr 2022 00:15:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239543AbiDSASe (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 18 Apr 2022 20:18:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239870AbiDSASd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 18 Apr 2022 20:18:33 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2DC01C924
        for <linux-doc@vger.kernel.org>; Mon, 18 Apr 2022 17:15:47 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id o5so14370797pjr.0
        for <linux-doc@vger.kernel.org>; Mon, 18 Apr 2022 17:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=x9YwmAp2QDkoEu3Pd7UH+hlqRg7dQPtrARKbviBaqcc=;
        b=LS94uQCVBeDedOivqhS3AXEod3aD0uCn3OCGItQmXdYVqxQhAco1YGytull7MAaiJ1
         4FSTlvycdokwn7L5MAMrl7O401CAF7LSp/TPRMm7N8f1AsYjcT6x6anJf9E7BZRN3ugQ
         LqyWNMYnmMpn17a527epttazDDoT4e9bTCmHiY0GStAcCSFDC7g/4ro/A1N3UR9yR/WG
         RKiXEg8R8FQs6XIbQ871wfOOB8fbwLM+nC9lJsuzN9XgFhvfbLB3JQdt7t8iQQmuUxc3
         zRdfTF6jNkXh7y9trNSwFgqKEnW2U7zN6MqQnMvtwiYU8xoFjKeuBVKiIFWg69yDohul
         9ddA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=x9YwmAp2QDkoEu3Pd7UH+hlqRg7dQPtrARKbviBaqcc=;
        b=oiQ+VZrxLurKtQ5fr2G0hxjf9KDNP84oGdGs24nsAWMhRNl4qnFbzCHzqUW1htw5a6
         Ru8dGuS0eiaosT1W3OAFoJreu+tDbbdMoKinUM+hnoxPua6Nc5twLoprzdh8aHrU1cG8
         cxge3Jhqd3cNsQeMuP15+UHPDiLjYPtzPiO1eYm+EFka+fdpaxoEb6U/1hkGxWHXJ7NO
         vXbOhVTcUU9oFyyDC1SIg9YACcWcOPVKUWq2/vs+sYIBk0trw3BpRGD94I0NsdiL8zod
         XL98Sjh8+6MoZCjj+f8gqiP1/AvTjGlK4bNIaupHSzuBaIW13UKjbKKlovx+avEzNX0q
         QLBQ==
X-Gm-Message-State: AOAM5300dcqDcvAFqxdn+rHXoK91pgxw9yCkC/0xPFPfb1nCb82v4JkC
        Ecu/o2Tsgj/HtRgGqTZTN/RgnA==
X-Google-Smtp-Source: ABdhPJxaSGUKi+MJtTgAMP7K68Qj5DefmIKWgtVg4ePelTMJW/qDb+JicwG/VzTaZm6dCS4QO3WlPQ==
X-Received: by 2002:a17:903:110f:b0:154:c7a4:9371 with SMTP id n15-20020a170903110f00b00154c7a49371mr12962737plh.75.1650327346860;
        Mon, 18 Apr 2022 17:15:46 -0700 (PDT)
Received: from [192.168.1.100] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id b7-20020a056a00114700b004f7be3231d6sm14088664pfm.7.2022.04.18.17.15.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Apr 2022 17:15:46 -0700 (PDT)
Message-ID: <937c7152-8da9-5dba-29a8-308781e20d3a@kernel.dk>
Date:   Mon, 18 Apr 2022 18:15:45 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: docs: IDE removal?
Content-Language: en-US
To:     Randy Dunlap <rdunlap@infradead.org>,
        Christoph Hellwig <hch@lst.de>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
References: <16ed554f-0f25-e914-5cb9-dce53d027f1e@infradead.org>
From:   Jens Axboe <axboe@kernel.dk>
In-Reply-To: <16ed554f-0f25-e914-5cb9-dce53d027f1e@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 4/17/22 6:06 PM, Randy Dunlap wrote:
> Hi,
> 
> Would someone suggest how much of
> Documentation/ide/ can be removed, given:
> 
> commit b7fb14d3ac63
> Author: Christoph Hellwig <hch@lst.de>
> Date:   Wed Jun 16 15:46:58 2021 +0200
> 
>     ide: remove the legacy ide driver
> 
> 
> 
> ChangeLog.ide-cd.1994-2004
> ChangeLog.ide-floppy.1996-2002
> ChangeLog.ide-tape.1995-2002
> changelogs.rst
> ide.rst
> ide-tape.rst
> index.rst

By all means, let's kill it.

-- 
Jens Axboe

