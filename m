Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A9B4C38A2D
	for <linux-doc@archiver.kernel.org>; Mon, 24 Oct 2022 23:15:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231366AbiJXXPS (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 24 Oct 2022 19:15:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231331AbiJXXOn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 24 Oct 2022 19:14:43 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A26D12626
        for <linux-doc@vger.kernel.org>; Mon, 24 Oct 2022 14:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1666647315;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TYYeY6WmbISjt57nThyLXvb2Wb4vuO7aGaq3NhLmbyU=;
        b=Wl7ZSbGt6O+yP3UyV33opVSDDsNek+K7LMxRGMucXAjOIzpRbshm53Kcr8gDC/Fq8lgAEf
        6ifJfdZtJECUDscc5uaxCtgPuZcuCfx+h3rleQKIgrGU4tWHGmt5ZSUWvGaE7FvSvU8PVZ
        x53LferlOAeN3ce+4CnfpCSMuUg/J9Y=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-257-hSHK-P4VMmOXUg5RO3pA6A-1; Mon, 24 Oct 2022 08:57:37 -0400
X-MC-Unique: hSHK-P4VMmOXUg5RO3pA6A-1
Received: by mail-qt1-f200.google.com with SMTP id f19-20020ac84713000000b00397692bdaecso7049496qtp.22
        for <linux-doc@vger.kernel.org>; Mon, 24 Oct 2022 05:57:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TYYeY6WmbISjt57nThyLXvb2Wb4vuO7aGaq3NhLmbyU=;
        b=QnLfJvFNq8hncRoEjHuUSyAr+yhMnVBgttNL284jkFdqb8riEDXgIuYKZpb8a+HBJ2
         z7ifmTzUmNpeP7y/wErLLJHFZ1TnKYYDc5WP66N8QFo5+oWP/Xo/nREcQW9z5atW7AIT
         VRuOEvfRdWpoubFLhSWJSdPDS/2BCmPJXcnMmdJExRbeuvWB1lMOdXBEsSoPRB9S+vj1
         +KuCR1dfuIiTGvNbR+BwkObfMzjkKOSBnDSTcoqdWEJ9hfhZ/GmBkgc08L/SJAIp/u3o
         PmB8Oe9conxA/XSoVj5dOypUAgGCpKZOdXzHsDMxLc2vs1h4lyoKNsDSwpoBaGGTVN6o
         eUeQ==
X-Gm-Message-State: ACrzQf0I0eyNkGjFgi1k8Im70DMk76K6hu/W1LE4sMKItikErRfugzyz
        TpEZ85aysdc/aZIDqGdFYwvwkYiQn2dbN/lGdX9ATCPgmDOZn5H3CTEB1wgprJLOUlzWe5oyRhN
        7R4B4i4Qb+KkWvurx5/PR
X-Received: by 2002:a05:622a:5cd:b0:39c:fcaf:7b36 with SMTP id d13-20020a05622a05cd00b0039cfcaf7b36mr23058054qtb.117.1666616257079;
        Mon, 24 Oct 2022 05:57:37 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7WC/42UgfWTDRy7m+TsBLfPQ7a53w+oMwbp6Q5j9cwx09EhMTQrNFPl7veBJ1xcH6Q+Absww==
X-Received: by 2002:a05:622a:5cd:b0:39c:fcaf:7b36 with SMTP id d13-20020a05622a05cd00b0039cfcaf7b36mr23058043qtb.117.1666616256881;
        Mon, 24 Oct 2022 05:57:36 -0700 (PDT)
Received: from [192.168.149.123] (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
        by smtp.gmail.com with ESMTPSA id bn39-20020a05620a2ae700b006cddf59a600sm14693814qkb.34.2022.10.24.05.57.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Oct 2022 05:57:36 -0700 (PDT)
Message-ID: <fba8e829-0d28-8f4d-a8ce-84d533009eb9@redhat.com>
Date:   Mon, 24 Oct 2022 14:57:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 3/4] KVM: introduce memory transaction semaphore
Content-Language: en-US
To:     Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Maxim Levitsky <mlevitsk@redhat.com>,
        Sean Christopherson <seanjc@google.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        David Hildenbrand <david@redhat.com>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221022154819.1823133-1-eesposit@redhat.com>
 <20221022154819.1823133-4-eesposit@redhat.com>
 <62500f94-b95b-1e16-4aa2-f67905fab01a@redhat.com>
From:   Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <62500f94-b95b-1e16-4aa2-f67905fab01a@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



Am 23/10/2022 um 19:50 schrieb Paolo Bonzini:
> On 10/22/22 17:48, Emanuele Giuseppe Esposito wrote:
>> +static DECLARE_RWSEM(memory_transaction);
> 
> This cannot be global, it must be per-struct kvm.  Otherwise one VM can
> keep the rwsem indefinitely while a second VM hangs in
> KVM_KICK_ALL_RUNNING_VCPUS.
> 
> It can also be changed to an SRCU (with the down_write+up_write sequence
> changed to synchronize_srcu_expedited) which has similar characteristics
> to your use of the rwsem.
> 

Makes sense, but why synchronize_srcu_expedited and not synchronize_srcu?

Thank you,
Emanuele

