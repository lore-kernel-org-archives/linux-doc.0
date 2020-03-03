Return-Path: <SRS0=Succ=4U=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34B23C3F2C6
	for <linux-doc@archiver.kernel.org>; Tue,  3 Mar 2020 14:03:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0984720866
	for <linux-doc@archiver.kernel.org>; Tue,  3 Mar 2020 14:03:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="N+5Phh/k"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729337AbgCCOD4 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 3 Mar 2020 09:03:56 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:48949 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726899AbgCCOD4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 3 Mar 2020 09:03:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1583244235;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ceaj2Lg7fPNdB8HydaqL4RB3izyCaF2LynvqRf8Tl8U=;
        b=N+5Phh/kvHrsbFA7BiIsncYG5nORWPjDD6XT3qE6x5GKM9XAYqG4wZ3Ndqbxvf74fvjohK
        ymeWM3BZsP0n+3vN6Ofj+W/Dw8CEjRFj5WI9LITBYNZ3852EnBBUEt89B8DUrMfjGBowcR
        0PIdjjlNEa5RJhS8c4fgSB/Njhb4zDA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-30-7glexJaBO2yrX5UlR87PwQ-1; Tue, 03 Mar 2020 09:03:51 -0500
X-MC-Unique: 7glexJaBO2yrX5UlR87PwQ-1
Received: by mail-wr1-f72.google.com with SMTP id t14so1251130wrs.12
        for <linux-doc@vger.kernel.org>; Tue, 03 Mar 2020 06:03:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ceaj2Lg7fPNdB8HydaqL4RB3izyCaF2LynvqRf8Tl8U=;
        b=NgJgFl2H41gk7hCMz4lK7go+uu49ObDsoR6sdqHtaAEnvH7X9aQ5QFkV+wfOS4pbAi
         ECxczTODAf6evA+eLP0jhjgvTJ+ZioQ9duJ96xvoC7ADh8Z8ixnNiXPmYPVHR5705Bp7
         muD9eScmSDNwHXCIny9MIfeBqKYjq7M4orJb5Gh0iq07NihX+5b7jZzWg+l2xIAZhSoA
         vfHKzfHpjgy1NjLxZhtrymvbus5pLlTWWRjtcydBypz1PcIJ/5iKRAj4V7a/+HRbNQAp
         BnXewNcnHUOLOUmOXPtqiVk9n7wd6eCmEkgQjkjuKo487Hm2g3ejsGqxPlA2BMY0sQlW
         nDmA==
X-Gm-Message-State: ANhLgQ1Z8ockwDuAu/lfGDHOBHg3CKZrPyOHB+pfvc+8c1jmcCOdsKyu
        RjbkT9JZGLKDplQGqXMLfQ0EiriLmrqSBq2Tln3v82Q+Qf/M2QDsUMCxP7tO+C57eDFqrZIajIe
        rfAYd+CaBhiu3NXs6Cx71
X-Received: by 2002:adf:b609:: with SMTP id f9mr5238255wre.380.1583244230110;
        Tue, 03 Mar 2020 06:03:50 -0800 (PST)
X-Google-Smtp-Source: ADFU+vtRrjACbBzLECzEdikELeWu5riMzPojCsiwMy3rUBXbMXTxIm4JJhpHv89LsfdGxx108rVeSA==
X-Received: by 2002:adf:b609:: with SMTP id f9mr5238244wre.380.1583244229878;
        Tue, 03 Mar 2020 06:03:49 -0800 (PST)
Received: from [192.168.178.40] ([151.20.254.94])
        by smtp.gmail.com with ESMTPSA id j14sm34519090wrn.32.2020.03.03.06.03.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2020 06:03:49 -0800 (PST)
Subject: Re: [PATCH v3 18/18] docs: kvm: get read of devices/README
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, kvm@vger.kernel.org,
        linux-doc@vger.kernel.org
References: <cover.1583243826.git.mchehab+huawei@kernel.org>
 <6e9c4aaf704cdc7b4e517122fb87cbe05f0ffd23.1583243827.git.mchehab+huawei@kernel.org>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <ef0e7454-d7ff-2dcb-194d-b8b831769eac@redhat.com>
Date:   Tue, 3 Mar 2020 15:03:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <6e9c4aaf704cdc7b4e517122fb87cbe05f0ffd23.1583243827.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 03/03/20 14:59, Mauro Carvalho Chehab wrote:
> Add the information there inside devices/index.rst
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  Documentation/virt/kvm/devices/README    | 1 -
>  Documentation/virt/kvm/devices/index.rst | 3 +++
>  2 files changed, 3 insertions(+), 1 deletion(-)
>  delete mode 100644 Documentation/virt/kvm/devices/README
> 
> diff --git a/Documentation/virt/kvm/devices/README b/Documentation/virt/kvm/devices/README
> deleted file mode 100644
> index 34a69834124a..000000000000
> --- a/Documentation/virt/kvm/devices/README
> +++ /dev/null
> @@ -1 +0,0 @@
> -This directory contains specific device bindings for KVM_CAP_DEVICE_CTRL.
> diff --git a/Documentation/virt/kvm/devices/index.rst b/Documentation/virt/kvm/devices/index.rst
> index 192cda7405c8..cbadafc0e36e 100644
> --- a/Documentation/virt/kvm/devices/index.rst
> +++ b/Documentation/virt/kvm/devices/index.rst
> @@ -4,6 +4,9 @@
>  Devices
>  =======
>  
> +The following documentation contains specific device bindings
> +for KVM_CAP_DEVICE_CTRL.
> +
>  .. toctree::
>     :maxdepth: 2
>  
> 

Acked-by: Paolo Bonzini <pbonzini@redhat.com>

