Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1421C77B60
	for <linux-doc@archiver.kernel.org>; Wed, 26 Apr 2023 12:49:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240672AbjDZMtk (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 26 Apr 2023 08:49:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240747AbjDZMth (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 26 Apr 2023 08:49:37 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EE676A5B
        for <linux-doc@vger.kernel.org>; Wed, 26 Apr 2023 05:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1682513289;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=N5DM8uFRDHl/3yHn+2axRN4cpB2/Yn2dxraiQxNEcRs=;
        b=PC+DkDXpPAITutRMZepcYjJl490G1CI7hzGVGxoPzKMKT2a05kyVzS4Mzm3unyYrSzkRSu
        OVDv98La05AyPedAf9wbJJtMOKLB/DPvXngVY0kcEemGVq70naicG0Z+ocWRcpWKtiXFyj
        DokCUjShGw6NBzt1o1gYe/TNpDveuHU=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-230-UTIVcVOSP-mNQT5-xPlyvA-1; Wed, 26 Apr 2023 08:42:05 -0400
X-MC-Unique: UTIVcVOSP-mNQT5-xPlyvA-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-94f59fc787fso665293566b.0
        for <linux-doc@vger.kernel.org>; Wed, 26 Apr 2023 05:42:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682512924; x=1685104924;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N5DM8uFRDHl/3yHn+2axRN4cpB2/Yn2dxraiQxNEcRs=;
        b=VnlZOYvmv3u2C7qqNtURTgWWk46pmCLVmI95BZfASmyh6qvKfY42dzKUs499VxQXoL
         41H+JnMwrhDc3NRA7iHNdFJuafl1sDwM0/SJ6BwBXq+Ld4p1wqy3MxRyzL+/tzsi8p83
         ENVXMCqqIC37DRIdqoaLhSm7rIiYPIDHaIP9xQLNdmdc9/FBRw+5kNtdoD4tgloXU9L8
         PDR3i82DUirD0kGxCvJkuRkcsodFnDPTiqlEAjeTzEZeWh3Kuyp1GNOQ45sOEz6M+QNv
         EqUQ2c+swrpd5Xis94t0QDh5/FCnn8MII1OiwY/0sGw8FwpHTYmeINudPORUIj10snLh
         Bn5w==
X-Gm-Message-State: AAQBX9fP00N6jbdUq7YGkxaONvzARJBrmBbWobjtWDENslZ8uVwb2Fma
        lr3dV01aadclwKWSTTBcbETJkqM7wEQuyfJzpkLDCLabxwjX9a6V/HsIEyi1tuUT7s2dTDDLiji
        Dhz2wkkvturcERtcTAEMi
X-Received: by 2002:a17:907:d092:b0:959:6fb2:1c35 with SMTP id vc18-20020a170907d09200b009596fb21c35mr9999715ejc.60.1682512923891;
        Wed, 26 Apr 2023 05:42:03 -0700 (PDT)
X-Google-Smtp-Source: AKy350bvXKOYJy6okWIZQECAi2PCDtQ0dPgUVzmT7RubNUWIJbMHxurZWDEmVVfiERP74ogwTR7r/g==
X-Received: by 2002:a17:907:d092:b0:959:6fb2:1c35 with SMTP id vc18-20020a170907d09200b009596fb21c35mr9999703ejc.60.1682512923548;
        Wed, 26 Apr 2023 05:42:03 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id f15-20020a056402150f00b00506adf55ae2sm6742648edw.6.2023.04.26.05.42.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Apr 2023 05:42:02 -0700 (PDT)
Message-ID: <d632fa2f-e94f-2958-c899-480afa9354c3@redhat.com>
Date:   Wed, 26 Apr 2023 14:42:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 0/4] platform/x86: wmi: Add subsystem documentation
Content-Language: en-US, nl
To:     Armin Wolf <W_Armin@gmx.de>, markgross@kernel.org,
        rdunlap@infradead.org
Cc:     corbet@lwn.net, linux-doc@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230424222939.208137-1-W_Armin@gmx.de>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230424222939.208137-1-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Armin,

On 4/25/23 00:29, Armin Wolf wrote:
> Currently, there is no recent documentation available for writing WMI
> drivers using the modern bus-based interface. This leads to developers
> using the deprecated GUID-based interface when developing new drivers,
> causing issues with notification handling when multiple WMI devices sharing
> the same notification ID are present. There is also no way for WMI
> drivers to add device specific documentation at the moment.
> Add documentation for the WMI subsystem to solve those issues. The
> device specific documentation currently onyl include documentation for
> the wmi-bmof driver, but more is expected to follow.

Thank you for your patch series, I've applied this series
to my review-hans branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Patches which are added to review-hans now are intended for
the next rc1. This branch will get rebased to the next rc1 when
it is out and after the rebasing the contents of review-hans
will be pushed to the platform-drivers-x86/for-next branch.

Regards,

Hans


> ---
> Changes in v2:
> - spelling fixes
> - tell readers that MOF means Managed Object Format
> - 80-cloumn limit
> 
> Armin Wolf (4):
>   platform/x86: wmi: Add kernel doc comments
>   platform/x86: wmi: Mark GUID-based WMI interface as deprecated
>   platform/x86: wmi: Add documentation
>   platform/x86: wmi: Add device specific documentation
> 
>  .../ABI/stable/sysfs-platform-wmi-bmof        |  7 ++
>  Documentation/driver-api/index.rst            |  1 +
>  Documentation/driver-api/wmi.rst              | 21 ++++
>  Documentation/subsystem-apis.rst              |  1 +
>  Documentation/wmi/acpi-interface.rst          | 96 +++++++++++++++++++
>  Documentation/wmi/devices/index.rst           | 22 +++++
>  Documentation/wmi/devices/wmi-bmof.rst        | 25 +++++
>  Documentation/wmi/index.rst                   | 19 ++++
>  MAINTAINERS                                   |  9 ++
>  drivers/platform/x86/Kconfig                  |  4 +-
>  drivers/platform/x86/wmi.c                    | 63 +++++++++---
>  include/linux/wmi.h                           | 41 +++++++-
>  12 files changed, 289 insertions(+), 20 deletions(-)
>  create mode 100644 Documentation/ABI/stable/sysfs-platform-wmi-bmof
>  create mode 100644 Documentation/driver-api/wmi.rst
>  create mode 100644 Documentation/wmi/acpi-interface.rst
>  create mode 100644 Documentation/wmi/devices/index.rst
>  create mode 100644 Documentation/wmi/devices/wmi-bmof.rst
>  create mode 100644 Documentation/wmi/index.rst
> 
> --
> 2.30.2
> 

