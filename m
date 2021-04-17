Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAE72C433B4
	for <linux-doc@archiver.kernel.org>; Sat, 17 Apr 2021 12:52:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A3ED16113D
	for <linux-doc@archiver.kernel.org>; Sat, 17 Apr 2021 12:52:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236320AbhDQMxP (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 17 Apr 2021 08:53:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39546 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230442AbhDQMxO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 17 Apr 2021 08:53:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1618663968;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Xpi8u3rGuVt1oh/pHBvAbreNYDYIDAl7JDBjulEYZdI=;
        b=iqAwLz8FJ3YcRayZWoRPm2A1QAV4Pt6fWQSzLlM3JcZQovJ7KpI6EVUx+EYWEk9uJOsBr/
        EYYevFu2cjhgba5E2fsxOV33HhCVnk0IihvtYVksJu7XCOC745ngmW5LwAoWnpegT3Uf5E
        Gar1LIYEyt2nazNvZAK2Mi7M07gvAxc=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-251-p7Q21XYCMTiZxrElGEeh8g-1; Sat, 17 Apr 2021 08:52:46 -0400
X-MC-Unique: p7Q21XYCMTiZxrElGEeh8g-1
Received: by mail-ed1-f70.google.com with SMTP id r4-20020a0564022344b0290382ce72b7f9so8604707eda.19
        for <linux-doc@vger.kernel.org>; Sat, 17 Apr 2021 05:52:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Xpi8u3rGuVt1oh/pHBvAbreNYDYIDAl7JDBjulEYZdI=;
        b=Sw2cRNsjtZVqsZ6Df8jST1TRKnCW33OCKIZkcRieADHBD+76lbzebplgYmwHAKf3bt
         ao5BM0rFZoAaVDwybuNjVO41v67rlfd2KdLzkcAoE8/o0FjodG/2opS6v0ZR7eqXB8x9
         uxVrEsmCHHxG7TpfigsZVlh2Dd2QRKpfQiS2BxyaWgndgVyj9Z/+W31DXLVkUU1WUTm7
         NUv2uMA1LuxchytkRLGxHhcaBwgaZ0xaW8GGe7RkJJnnVbC4xJB1caZ6dk+Yrf1jhPDC
         8HpMkE/nRNRIG6Tow3NQMCOTRSPE4MRAifq5VdGQeo4EFw9eOJgn+LZKNcTSMjSBk8kw
         n6dQ==
X-Gm-Message-State: AOAM53056NvrUxbubn+RjKsuEb2YnAuX9FiIlsxKd3fQ4+Fm/fOzm573
        fPhA5sk4IfsM2dePeMDakvXRzevDYB3ijC7XuRHLxIUMy9D0+ifFKmGLAFuTXIPNs3TwPszCeRZ
        /z5yUv3STuQ2XtlmLmltA
X-Received: by 2002:a17:906:68da:: with SMTP id y26mr13241785ejr.442.1618663964878;
        Sat, 17 Apr 2021 05:52:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxTpOMr7Ij1+3mQXgHXxMH+0QmMKVahk4yLdYEs4lQyEzw/0HUv+6EV0v6H4vJbDRkDD6BlJA==
X-Received: by 2002:a17:906:68da:: with SMTP id y26mr13241776ejr.442.1618663964695;
        Sat, 17 Apr 2021 05:52:44 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id l9sm6156786ejz.96.2021.04.17.05.52.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Apr 2021 05:52:44 -0700 (PDT)
Subject: Re: [PATCH] doc/virt/kvm: move KVM_X86_SET_MSR_FILTER in section 8
To:     Emanuele Giuseppe Esposito <eesposit@redhat.com>,
        linux-doc@vger.kernel.org
Cc:     Jonathan Corbet <corbet@lwn.net>, kvm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210316170814.64286-1-eesposit@redhat.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <e3286d6d-5b0b-9a40-072b-41f0209f2b21@redhat.com>
Date:   Sat, 17 Apr 2021 14:52:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210316170814.64286-1-eesposit@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 16/03/21 18:08, Emanuele Giuseppe Esposito wrote:
> KVM_X86_SET_MSR_FILTER is a capability, not an ioctl.
> Therefore move it from section 4.97 to the new 8.31 (other capabilities).

Here and in the subject I think KVM_X86_SET_MSR_FILTER should be 
replaced by KVM_CAP_PPC_MULTITCE.

Otherwise looks good, so I queued it.

Thanks,

Paolo

> To fill the gap, move KVM_X86_SET_MSR_FILTER (was 4.126) to
> 4.97, and shifted Xen-related ioctl (were 4.127 - 4.130) by
> one place (4.126 - 4.129).
> 
> Also fixed minor typo in KVM_GET_MSR_INDEX_LIST ioctl description
> (section 4.3).

