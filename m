Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59D65C678D6
	for <linux-doc@archiver.kernel.org>; Mon,  9 Jan 2023 13:50:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236382AbjAINuC (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 9 Jan 2023 08:50:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237265AbjAINto (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 9 Jan 2023 08:49:44 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73C80271BC
        for <linux-doc@vger.kernel.org>; Mon,  9 Jan 2023 05:48:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1673272137;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=NqUCAZbaNLI+BrA/h8UtdwPusw7D5gv6g1VhKXRC0SU=;
        b=T465wyB0a/P9xapr7+xqfRrWYJoTlVpP8iE8XNgzXmx/O4Y/u7tI0CAWiQVLy1FwbrQmXQ
        dw4aojFF7MFRrQUtfLOCYVJ6p+UFWRiREt47JBQgG6BfayOnF8jJAPIrFPXXt+d2P8X/C+
        +OFS+8pcjrggp3o79PNr/Pq+JI/JyGk=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-206-MnkurT9wMoeZNl-Uq-X64g-1; Mon, 09 Jan 2023 08:48:56 -0500
X-MC-Unique: MnkurT9wMoeZNl-Uq-X64g-1
Received: by mail-pl1-f198.google.com with SMTP id n1-20020a170902e54100b00192cc6850ffso6313740plf.18
        for <linux-doc@vger.kernel.org>; Mon, 09 Jan 2023 05:48:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-language:content-transfer-encoding:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NqUCAZbaNLI+BrA/h8UtdwPusw7D5gv6g1VhKXRC0SU=;
        b=pPQOCMs+dbkWCgxmP3qZg7CbVWe9jLqPVfLC7eNY6w4JaoAvC4X3fBGHK/yJ2RwUtP
         +dv5FLVnWW9mqnaqV1QTE33emg3J1GASmZE+ZLU0yYrSctQVfPHYHdGesra7yK8/vOb+
         kJNJH+WLvCSh/9/D7+RwCv975zwc8D09DCdjM3lrDu8dZ6hwNU0MOT8KAtaZW8i5PmOy
         4DwXTDplQLpxqCwAWIi/Vl0lwKPa7qLCTTmTbHyZhl3Jk4yQen/n6gN3TKcpZPFRFUE0
         eLi2pSUh4JxCVyI7V6wT2U9mPnavLuyvwplUAsXUvy7J7vp/Xs7NXa9k430bj3aA5lv6
         4Ayg==
X-Gm-Message-State: AFqh2kpdCLYtc1/v/EM6623kKnE7qp/aAeyz89M6m3AUSl4x7HiPiDfP
        y1w2fxiqN3MXUhsGXn3wxvgF3eY6HN+gw5C+lfhdck5TYCPCEKe7javURwBH44Ru8EOJJ5pH5l6
        T9xx2GmIrL29Q2T6BrssW
X-Received: by 2002:a17:902:7288:b0:193:24bf:344d with SMTP id d8-20020a170902728800b0019324bf344dmr6294935pll.57.1673272134524;
        Mon, 09 Jan 2023 05:48:54 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvgQ1KW/WDU2jxQ3Px8VVv1KWvd4mBA2JdiH9huI3h8STXP3IpST+se5m3+Pp8YlNIr0RJVnw==
X-Received: by 2002:a17:902:7288:b0:193:24bf:344d with SMTP id d8-20020a170902728800b0019324bf344dmr6294909pll.57.1673272134200;
        Mon, 09 Jan 2023 05:48:54 -0800 (PST)
Received: from localhost.localdomain (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id k7-20020a170902ce0700b001885d15e3c1sm6183354plg.26.2023.01.09.05.48.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jan 2023 05:48:53 -0800 (PST)
Subject: Re: [PATCH v9 1/4] Documentation: fpga: dfl: Add documentation for
 DFHv1
To:     matthew.gerlach@linux.intel.com, hao.wu@intel.com,
        yilun.xu@intel.com, russell.h.weight@intel.com,
        basheer.ahmed.muddebihal@intel.com, mdf@kernel.org,
        linux-fpga@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, tianfei.zhang@intel.com,
        corbet@lwn.net, gregkh@linuxfoundation.org,
        linux-serial@vger.kernel.org, jirislaby@kernel.org,
        geert+renesas@glider.be, andriy.shevchenko@linux.intel.com,
        niklas.soderlund+renesas@ragnatech.se, macro@orcam.me.uk,
        johan@kernel.org, lukas@wunner.de, ilpo.jarvinen@linux.intel.com,
        marpagan@redhat.com, bagasdotme@gmail.com
References: <20230104232253.24743-1-matthew.gerlach@linux.intel.com>
 <20230104232253.24743-2-matthew.gerlach@linux.intel.com>
From:   Tom Rix <trix@redhat.com>
Message-ID: <4e7f84ff-8bab-019d-3858-4c545834a354@redhat.com>
Date:   Mon, 9 Jan 2023 05:48:50 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20230104232253.24743-2-matthew.gerlach@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


On 1/4/23 3:22 PM, matthew.gerlach@linux.intel.com wrote:
> From: Matthew Gerlach <matthew.gerlach@linux.intel.com>
>
> Add documentation describing the extensions provided by Version
> 1 of the Device Feature Header (DFHv1).
>
> Signed-off-by: Matthew Gerlach <matthew.gerlach@linux.intel.com>
> Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

Thanks for the changes.

Reviewed-by: Tom Rix <trix@redhat.com>

> ---
> v9: move DFH definitions to after the Overview
>      fix name of feature revision field
>      clarify next field in DFH
>
> v8: fix section titles
>
> v7: shorten long lines and wording suggestions by bagasdotme@gmail.com
>
> v6: no change
>
> v5: use nested list for field descriptions
>      clean up prose
>      add reviewed-by and comments from Ilpo Järvinen
>
> v4: Remove marketing speak and separate v0 and v1 descriptions.
>      Fix errors reported by "make htmldocs".
>
> v3: no change
>
> v2: s/GUILD/GUID/
>      add picture
> ---
>   Documentation/fpga/dfl.rst | 117 +++++++++++++++++++++++++++++++++++++
>   1 file changed, 117 insertions(+)
>
> diff --git a/Documentation/fpga/dfl.rst b/Documentation/fpga/dfl.rst
> index 15b670926084..7e015249785b 100644
> --- a/Documentation/fpga/dfl.rst
> +++ b/Documentation/fpga/dfl.rst
> @@ -75,6 +75,123 @@ convenient for software to locate each feature by walking through this list,
>   and can be implemented in register regions of any FPGA device.
>   
>   
> +Device Feature Header - Version 0
> +=================================
> +Version 0 (DFHv0) is the original version of the Device Feature Header.
> +The format of DFHv0 is shown below::
> +
> +    +-----------------------------------------------------------------------+
> +    |63 Type 60|59 DFH VER 52|51 Rsvd 41|40 EOL|39 Next 16|15 REV 12|11 ID 0| 0x00
> +    +-----------------------------------------------------------------------+
> +    |63                                 GUID_L                             0| 0x08
> +    +-----------------------------------------------------------------------+
> +    |63                                 GUID_H                             0| 0x10
> +    +-----------------------------------------------------------------------+
> +
> +- Offset 0x00
> +
> +  * Type - The type of DFH (e.g. FME, AFU, or private feature).
> +  * DFH VER - The version of the DFH.
> +  * Rsvd - Currently unused.
> +  * EOL - Set if the DFH is the end of the Device Feature List (DFL).
> +  * Next - The offset in bytes of the next DFH in the DFL from the DFH start,
> +    and the start of a DFH must be aligned to an 8 byte boundary.
> +    If EOL is set, Next is the size of MMIO of the last feature in the list.
> +  * REV - The revision of the feature associated with this header.
> +  * ID - The feature ID if Type is private feature.
> +
> +- Offset 0x08
> +
> +  * GUID_L - Least significant 64 bits of a 128-bit Globally Unique Identifier
> +    (present only if Type is FME or AFU).
> +
> +- Offset 0x10
> +
> +  * GUID_H - Most significant 64 bits of a 128-bit Globally Unique Identifier
> +    (present only if Type is FME or AFU).
> +
> +
> +Device Feature Header - Version 1
> +=================================
> +Version 1 (DFHv1) of the Device Feature Header adds the following functionality:
> +
> +* Provides a standardized mechanism for features to describe
> +  parameters/capabilities to software.
> +* Standardize the use of a GUID for all DFHv1 types.
> +* Decouples the DFH location from the register space of the feature itself.
> +
> +The format of Version 1 of the Device Feature Header (DFH) is shown below::
> +
> +    +-----------------------------------------------------------------------+
> +    |63 Type 60|59 DFH VER 52|51 Rsvd 41|40 EOL|39 Next 16|15 REV 12|11 ID 0| 0x00
> +    +-----------------------------------------------------------------------+
> +    |63                                 GUID_L                             0| 0x08
> +    +-----------------------------------------------------------------------+
> +    |63                                 GUID_H                             0| 0x10
> +    +-----------------------------------------------------------------------+
> +    |63                   Reg Address/Offset                      1|  Rel  0| 0x18
> +    +-----------------------------------------------------------------------+
> +    |63        Reg Size       32|Params 31|30 Group    16|15 Instance      0| 0x20
> +    +-----------------------------------------------------------------------+
> +    |63 Next    35|34RSV33|EOP32|31 Param Version 16|15 Param ID           0| 0x28
> +    +-----------------------------------------------------------------------+
> +    |63                 Parameter Data                                     0| 0x30
> +    +-----------------------------------------------------------------------+
> +
> +                                  ...
> +
> +    +-----------------------------------------------------------------------+
> +    |63 Next    35|34RSV33|EOP32|31 Param Version 16|15 Param ID           0|
> +    +-----------------------------------------------------------------------+
> +    |63                 Parameter Data                                     0|
> +    +-----------------------------------------------------------------------+
> +
> +- Offset 0x00
> +
> +  * Type - The type of DFH (e.g. FME, AFU, or private feature).
> +  * DFH VER - The version of the DFH.
> +  * Rsvd - Currently unused.
> +  * EOL - Set if the DFH is the end of the Device Feature List (DFL).
> +  * Next - The offset in bytes of the next DFH in the DFL from the DFH start,
> +    and the start of a DFH must be aligned to an 8 byte boundary.
> +    If EOL is set, Next is the size of MMIO of the last feature in the list.
> +  * REV - The revision of the feature associated with this header.
> +  * ID - The feature ID if Type is private feature.
> +
> +- Offset 0x08
> +
> +  * GUID_L - Least significant 64 bits of a 128-bit Globally Unique Identifier.
> +
> +- Offset 0x10
> +
> +  * GUID_H - Most significant 64 bits of a 128-bit Globally Unique Identifier.
> +
> +- Offset 0x18
> +
> +  * Reg Address/Offset - If Rel bit is set, then the value is the high 63 bits
> +    of a 16-bit aligned absolute address of the feature's registers. Otherwise
> +    the value is the offset from the start of the DFH of the feature's registers.
> +
> +- Offset 0x20
> +
> +  * Reg Size - Size of feature's register set in bytes.
> +  * Params - Set if DFH has a list of parameter blocks.
> +  * Group - Id of group if feature is part of a group.
> +  * Instance - Id of feature instance within a group.
> +
> +- Offset 0x28 if feature has parameters
> +
> +  * Next - Offset to the next parameter block in 8 byte words. If EOP set,
> +    size in 8 byte words of last parameter.
> +  * Param Version - Version of Param ID.
> +  * Param ID - ID of parameter.
> +
> +- Offset 0x30
> +
> +  * Parameter Data - Parameter data whose size and format is defined by
> +    version and ID of the parameter.
> +
> +
>   FIU - FME (FPGA Management Engine)
>   ==================================
>   The FPGA Management Engine performs reconfiguration and other infrastructure

