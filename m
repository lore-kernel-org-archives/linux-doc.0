Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4615AEB64D9
	for <linux-doc@archiver.kernel.org>; Fri,  7 Jul 2023 12:12:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231213AbjGGMMH (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 7 Jul 2023 08:12:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229740AbjGGMMG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 7 Jul 2023 08:12:06 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4384E210C
        for <linux-doc@vger.kernel.org>; Fri,  7 Jul 2023 05:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1688731875;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=BVyqwSHAPLftzopmtaxC0lFHhRx6FuTQym8jgnJKosE=;
        b=TT7UO4bheeBP7wmn9tkTywJkEp8fnSwMnFglXtwkzr1AbWAiX7Pg/2a+ZmaiYth/dsQ5FX
        CTbrmt/pvv96HmwLAZkSvfTOFRDu/qPB909Qx1P+X4Vzq4IDLLaCl/mwGjAV01YRmHqdDt
        of+gvaHQOTTt4GgYt9QmY6YfZmdqUh0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-626-zVbkCHP7PIS2i1S-Squ3Ag-1; Fri, 07 Jul 2023 08:11:14 -0400
X-MC-Unique: zVbkCHP7PIS2i1S-Squ3Ag-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3143c941d0bso999905f8f.1
        for <linux-doc@vger.kernel.org>; Fri, 07 Jul 2023 05:11:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688731873; x=1691323873;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BVyqwSHAPLftzopmtaxC0lFHhRx6FuTQym8jgnJKosE=;
        b=WfbOCWD68AilYphzxewA2cOIWQVjs3SwmADWITOlh2t/za0uBQIqJ+Tz3xmBSd4MXw
         Lv8aHHlmc8W3l5PXsqZPdWyFwauuOcWUvABt9016g7861UFLTFDodjR41EKR4i5pqTpl
         5/JnnXzJ/j0UP/+fgi357Qk3+epDgpqViZxzYCSoQCJSYlHJjI5AlEoq51yTYECjHug+
         ZRpvDb+Pi4YZ0Gehe5DxeVQpiSWax+huj7x80Glyc2KWMJfB5oEeR2pWwS9tp/WPNzvn
         cC/re2sYdl5uOi8slv4eI0HwdiIBaAeD+Q0r/i1ipstV9anOn8Z6pKDS5lEmNZ240Hvt
         ETwg==
X-Gm-Message-State: ABy/qLZ6B0XSPjBIOO4N4MvOfIxy/yx6WgEslFH9Ag7OrphDMdaHP7xb
        G3Yxsuz+CfxWBrbiuscwYRuJtybHnhwb13UtW2mON5kmCn2WLAwlHSjUCPfCroFB6J9IqNlvwX/
        N8+VEyzHO7xmbwHW9NFU/
X-Received: by 2002:a5d:5450:0:b0:314:3503:15ac with SMTP id w16-20020a5d5450000000b00314350315acmr4071147wrv.10.1688731872959;
        Fri, 07 Jul 2023 05:11:12 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGQ+0CrqDvb4lVn+YlJy3j3lhmI2e5jJ3pz4I7kZYIBFwKLH8Ug0fJ0/CydpV5KGXWVfJemXw==
X-Received: by 2002:a5d:5450:0:b0:314:3503:15ac with SMTP id w16-20020a5d5450000000b00314350315acmr4071129wrv.10.1688731872601;
        Fri, 07 Jul 2023 05:11:12 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f04:3c00:248f:bf5b:b03e:aac7? (p200300d82f043c00248fbf5bb03eaac7.dip0.t-ipconnect.de. [2003:d8:2f04:3c00:248f:bf5b:b03e:aac7])
        by smtp.gmail.com with ESMTPSA id k6-20020adfd846000000b00314315071bbsm4324550wrl.38.2023.07.07.05.11.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Jul 2023 05:11:12 -0700 (PDT)
Message-ID: <b8bf72f4-f590-a159-ca94-526153b73216@redhat.com>
Date:   Fri, 7 Jul 2023 14:11:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [RFC 0/4] arm64/mm: Clean up pte_dirty() state management
Content-Language: en-US
To:     Anshuman Khandual <anshuman.khandual@arm.com>,
        linux-arm-kernel@lists.infradead.org
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Ryan Roberts <ryan.roberts@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
References: <20230707053331.510041-1-anshuman.khandual@arm.com>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230707053331.510041-1-anshuman.khandual@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 07.07.23 07:33, Anshuman Khandual wrote:
> These pte_dirty() changes make things explicitly clear, while improving the
> code readability. This optimizes HW dirty state transfer into SW dirty bit.
> This also adds a new arm64 documentation explaining overall pte dirty state
> management in detail. This series applies on the latest mainline kernel.
> 
>

I skimmed over most of the series, and I am not convinced that this is 
actually a cleanup. If we cannot really always differentiate between 
sw/hw clearing, why have separate primitives that give one the illusion 
that it could be done and that they are two different concepts?

Maybe there are other opinions, but at least for me this made the code 
harder to grasp.

I do appreciate a doc update, though :)

-- 
Cheers,

David / dhildenb

