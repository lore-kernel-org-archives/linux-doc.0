Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24362C433FE
	for <linux-doc@archiver.kernel.org>; Tue, 28 Sep 2021 16:41:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 101F561262
	for <linux-doc@archiver.kernel.org>; Tue, 28 Sep 2021 16:41:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241856AbhI1QnT (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 28 Sep 2021 12:43:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38759 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S241870AbhI1QnR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 28 Sep 2021 12:43:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1632847297;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=PRr6yH8iE3kvIOaBo9Egrh5B+ijwJWy0w0Y5bYRa2to=;
        b=ewtAzH1LcJSjLTi/nvQXK3kzn7hAW0bYhGTDo51FzU4mRDz3kb22uSRo+vnfsdfP3QJF4h
        rwlw4PDh4ixGGZUIJGPveWJRd26ue2P1JASZTNXLymwxroaNM/1wzQ8xoJmN3tFhhL9gta
        eLPVmIXTIp4THsJeDuLBFRUiQiF7sQk=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-309-RvgXvQiAOBieDx1UCGcmCg-1; Tue, 28 Sep 2021 12:41:35 -0400
X-MC-Unique: RvgXvQiAOBieDx1UCGcmCg-1
Received: by mail-ed1-f72.google.com with SMTP id l29-20020a50d6dd000000b003d80214566cso22409026edj.21
        for <linux-doc@vger.kernel.org>; Tue, 28 Sep 2021 09:41:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=PRr6yH8iE3kvIOaBo9Egrh5B+ijwJWy0w0Y5bYRa2to=;
        b=o424ll+aXB/VKe0Wm14idI/0dzcS+tirk0ivxGUtSG0cEEqc7nu6qZBbs1vXAZdil3
         CMZQL4xQChWPJnmf/Ozo4eKmLHReFYBxhJbRFUyx8NTEJKRFXmHGh4ISZHmCq0AkP+0k
         k/7b1SCKIIC18BGZF+Nc6xKwPv1/V6FG5fFBm+aAQqg8aKM8tpr/rESEgXD2G0aj7AuY
         fKRiHUUDHl/+0AQmKF9X84x7axqEIjCwl7Yf+RBUsfwP+MffOU+Hdw7FF5hMQnV6WlII
         WB9FbQKNIyoGd6tE0vl/xjiIjKMtOlQBTC9dbiXzsq6d/PTwJf4aq0M5ODkSSni5Ki+T
         rtTQ==
X-Gm-Message-State: AOAM532OWR4CeGxlq067ToiN4LilUMzbALNyKRiBPqpdE7xrEA47GPSb
        RmXboDRFXt2DWQWaJBkYCDEwRLb3xD5zN2u3M5Dp+xsJlH00Trn7GuTbXNA8EAL4sC/3TX4VwYh
        yMzpM9JP1BwX4t54NYkA5
X-Received: by 2002:a17:906:cc4a:: with SMTP id mm10mr1284268ejb.384.1632847294510;
        Tue, 28 Sep 2021 09:41:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy0B70PGd40+l8AVXMAvDDSQoARkmaV5PDGrsf3ott4UI1ydNflKd+KB9jJ04ZN4YwImVYzAg==
X-Received: by 2002:a17:906:cc4a:: with SMTP id mm10mr1284232ejb.384.1632847294341;
        Tue, 28 Sep 2021 09:41:34 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id d3sm13456533edv.87.2021.09.28.09.41.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Sep 2021 09:41:33 -0700 (PDT)
Message-ID: <452d73b2-2d39-e80d-021d-f24550eaea82@redhat.com>
Date:   Tue, 28 Sep 2021 18:41:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 2/6] x86/kvm: add boot parameter for adding vcpu-id
 bits
Content-Language: en-US
To:     Juergen Gross <jgross@suse.com>, kvm@vger.kernel.org,
        x86@kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     maz@kernel.org, ehabkost@redhat.com,
        Jonathan Corbet <corbet@lwn.net>,
        Sean Christopherson <seanjc@google.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>
References: <20210903130808.30142-1-jgross@suse.com>
 <20210903130808.30142-3-jgross@suse.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20210903130808.30142-3-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 03/09/21 15:08, Juergen Gross wrote:
> +	if (vcpu_id_add_bits >= 0) {
> +		n_bits += vcpu_id_add_bits;
> +	} else {
> +		n_bits++;		/* One additional bit for core level. */
> +		if (topology_max_die_per_package() > 1)
> +			n_bits++;	/* One additional bit for die level. */

This needs to be unconditional since it is always possible to emulate a 
multiple-die-per-package topology for a guest, even if the host has just 
one.

Paolo


> +	}
> +
> +	if (!n_bits)

