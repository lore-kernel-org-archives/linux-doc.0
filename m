Return-Path: <SRS0=OR/0=3N=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8922C2D0CE
	for <linux-doc@archiver.kernel.org>; Fri, 24 Jan 2020 09:17:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A978B2077C
	for <linux-doc@archiver.kernel.org>; Fri, 24 Jan 2020 09:17:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Uzx9WVjj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730380AbgAXJRB (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 24 Jan 2020 04:17:01 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:44433 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1730275AbgAXJRA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 24 Jan 2020 04:17:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1579857418;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=eVwp3U5GzOX2o0jWqVHj3WHwgjI/zlg9dOk4xt7JmuA=;
        b=Uzx9WVjjbAcDNrmkkLuX5HGYwUEtDHQ2B7kphc75eyyvktouhu2hiz2Zrtnk49URcnAwOP
        7wQ1kTw1e0uA412jy0vnUOKEjij1vdjVIZuRzfggZYLe7jbcN+DJ/K97as6Bs1Kp3pvYZz
        sPUpNx3UHBqXwm1EEt93ge8tR+W2GfE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-271-f8ytwAVpOKOfU5ITyQ3WBg-1; Fri, 24 Jan 2020 04:16:52 -0500
X-MC-Unique: f8ytwAVpOKOfU5ITyQ3WBg-1
Received: by mail-wr1-f72.google.com with SMTP id k18so869317wrw.9
        for <linux-doc@vger.kernel.org>; Fri, 24 Jan 2020 01:16:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=eVwp3U5GzOX2o0jWqVHj3WHwgjI/zlg9dOk4xt7JmuA=;
        b=kzmfWCcITCk5jviD39qHG0+DHuv545GkZO7u0gLHqfiHniGL4klc4PLe3/qXr4ouMt
         eAOCscwDcauKcZHb12Vw8U6qRgD40LAVK7VKuTUmEjK8WoGa9zQ2sD0T0hoKpk6mCLwi
         LHO+gfmX64mfJGzynzjt1ft3dQ/M0/NQ/+8oxU5GHT6Fw/YUc3NSGyHJegGxU2eZ1GVi
         wUbPtU0ORIiVGRYNk8jKWQlu5aCdF+hM4yaGAnumvWLZvoTV/UhdQotvpxezp4XDklXU
         YnyVMs7VpSsCrlpmXj5om1eQ10Dj8G++G9ohQfRNwB2wGX8PY5oZXGYUf7Je340DbeMi
         LPNw==
X-Gm-Message-State: APjAAAVBBbNNIQdW8dbn0RqS61ot0pdQSRDypr1tmBVtq9sF5dRmNDmz
        vhavHMlVeAXbR7Q6X0ynrKW6/L1PPd4iwR30gizVnKVay74ykLNHJ1sAUQrbK6SDlb+YhOR7Qca
        l44NDQLnfwoF+CWZjovyx
X-Received: by 2002:a1c:a445:: with SMTP id n66mr2460515wme.151.1579857411330;
        Fri, 24 Jan 2020 01:16:51 -0800 (PST)
X-Google-Smtp-Source: APXvYqxUiU565WJyxONGgI7w4xQRq/ENXZEynENvjhqk4CBvmo8g5IcgWmw96rLrMcfuNGJKf9m74A==
X-Received: by 2002:a1c:a445:: with SMTP id n66mr2460489wme.151.1579857411156;
        Fri, 24 Jan 2020 01:16:51 -0800 (PST)
Received: from localhost.localdomain ([109.38.141.136])
        by smtp.gmail.com with ESMTPSA id a132sm6060770wme.3.2020.01.24.01.16.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jan 2020 01:16:50 -0800 (PST)
Subject: Re: [PATCH v12 03/10] firmware: Rename FW_OPT_NOFALLBACK to
 FW_OPT_NOFALLBACK_SYSFS
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Lutomirski <luto@kernel.org>
Cc:     Ard Biesheuvel <ardb@kernel.org>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H . Peter Anvin" <hpa@zytor.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Peter Jones <pjones@redhat.com>,
        Dave Olsthoorn <dave@bewaar.me>, x86@kernel.org,
        platform-driver-x86@vger.kernel.org, linux-efi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-input@vger.kernel.org
References: <20200115163554.101315-1-hdegoede@redhat.com>
 <20200115163554.101315-4-hdegoede@redhat.com>
 <20200124085751.GA2957916@kroah.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <d25d5d6e-0348-b19f-539e-048cfa70d6a6@redhat.com>
Date:   Fri, 24 Jan 2020 10:16:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20200124085751.GA2957916@kroah.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

On 1/24/20 9:57 AM, Greg Kroah-Hartman wrote:
> On Wed, Jan 15, 2020 at 05:35:47PM +0100, Hans de Goede wrote:
>> This is a preparation patch for adding a new platform fallback mechanism,
>> which will have its own enable/disable FW_OPT_xxx option.
>>
>> Note this also fixes a typo in one of the re-wordwrapped comments:
>> enfoce -> enforce.
>>
>> Acked-by: Luis Chamberlain <mcgrof@kernel.org>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> 
> I've taken this in my tree for now in a quest to try to get others to
> pay attention to this series...

Thank you.

As mentioned before I believe that this series is ready for merging now.

Andy Lutomirski had one last change request for v12 of the second
patch in the series, specifically to replace the loop searching for
the prefix with a memem, but the kernel does not have memmem.

Andy, are you ok with v12 as is, given that we don't have memmem ?

Assuming Andy is ok with v12 as is, then to merge this we need
to probably wait for 5.6-rc1 and then have the x86/efi folks do
an immutable branch with the first 2 patches of the series.

After that you (Greg) can merge patches 3-10 (after merging the
branch) and the platform/drivers/x86 folks can take 11 and 12
(also after merging the branch).

Regards,

Hans

