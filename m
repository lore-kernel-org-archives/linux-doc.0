Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0A36C77B73
	for <linux-doc@archiver.kernel.org>; Tue, 30 May 2023 08:54:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230169AbjE3Iy3 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 30 May 2023 04:54:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230107AbjE3IyY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 30 May 2023 04:54:24 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFEECAB;
        Tue, 30 May 2023 01:54:23 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-5343c3daff0so2619085a12.0;
        Tue, 30 May 2023 01:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685436863; x=1688028863;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RHOfDHWRu2lnNQ2rwsI4E9GPenGbIFAJzlfsF9ORlaA=;
        b=Ylgn9iAdMtxxc8FJxKAGE2o1WOnW3T3Lw18t6dKRqKWozr5Iq/nRIpwG+R5TUxHvKz
         zvpErSFlsOh4Aq/S3x04R937m9P7/iknOualjqnPLqNUiRVfit69aQq6j4qvAm0H+UU9
         aJI4x23lnXFUUA/lszjmULkwt/hHk9F7HnSqhp7+bO/t3Vkb3MdOTa/z8iAwiIdvJXdu
         c3WRcTNU9FsVdf0aizB/g37zKSR55Sgcem+WWXP4uuegYEiYdVRAJ7Ln7w3Jp1tU5/J1
         rEBcIz1Nn76EOxUGObFYr135bZ/v8kPiN87yAw0q1f4KM/SJQInWPU4T6xyAUd/QJ53p
         p27Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685436863; x=1688028863;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RHOfDHWRu2lnNQ2rwsI4E9GPenGbIFAJzlfsF9ORlaA=;
        b=FEKxOV3sQhSHgd7MXxKCp3cc7f/yD54OAICBTTE4RGLcx7MwgsS2igJPlPP6EvBhyH
         X3j5QE637jxzoMjLeKJl1z2n3gx6rbTX267P38qbbnXZU4s9YYHVJJPsr1huHwZIQ7xf
         K1mGFkx4x4GRCTqMkhnZJJXnV6DMINzLiHuPEarcEVXnm+hKwUvzb0Oj1kFVAN02W43P
         vG8pNyN/9ZtxMoEyagfHsvs6Z4U5O4T+8aFQ336bzsxbG9F6m9++5Nn/4fMqLY9tFFT2
         lDQLHmvtkEV3S1vRUvByxwj1p8WvgKQCFV8nkvYvHjK0avZ1dgBbCwrv0U0pbHI+4phb
         82Pg==
X-Gm-Message-State: AC+VfDzirtQcDarXRwwVPRH5+BpsfdNeI5Bz1MFJEEINFTmkQ0AsR18n
        GZayIj9ON6IM+AqWJsUO8kymuLEGtU0=
X-Google-Smtp-Source: ACHHUZ7Rk93SVq30nkXleqZYW12ye8Tl15Neszkr2aVbJkc30Bw3jgnoVHpBz9GQvl/GkjlAZ9219A==
X-Received: by 2002:a17:903:41cb:b0:1ad:edbd:8547 with SMTP id u11-20020a17090341cb00b001adedbd8547mr1936489ple.15.1685436862988;
        Tue, 30 May 2023 01:54:22 -0700 (PDT)
Received: from [192.168.43.80] (subs09a-223-255-225-74.three.co.id. [223.255.225.74])
        by smtp.gmail.com with ESMTPSA id x7-20020a170902ec8700b001ab1cdb41d6sm9692178plg.235.2023.05.30.01.54.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 01:54:22 -0700 (PDT)
Message-ID: <d1e4436e-b428-0f49-ecf1-079955aaecb2@gmail.com>
Date:   Tue, 30 May 2023 15:54:20 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] docs: consolidate storage interfaces
Content-Language: en-US
To:     Costa Shulyupin <costa.shul@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Cc:     open list <linux-kernel@vger.kernel.org>
References: <20230529085521.2574848-1-costa.shul@redhat.com>
From:   Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <20230529085521.2574848-1-costa.shul@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 5/29/23 15:55, Costa Shulyupin wrote:
> +Storage interfaces
> +------------------
> +
> +.. toctree::
> +   :maxdepth: 1
> +
> +   filesystems/index
> +   block/index
> +   cdrom/index
> +   scsi/index
> +
>  **Fixme**: much more organizational work is needed here.
>  

Can you also categorize below indexes (table of contents) like above?

>  .. toctree::
> @@ -31,8 +42,6 @@ Human interfaces
>     core-api/index
>     locking/index
>     accounting/index
> -   block/index
> -   cdrom/index
>     cpu-freq/index
>     fpga/index
>     i2c/index
> @@ -54,12 +63,10 @@ Human interfaces
>     accel/index
>     security/index
>     crypto/index
> -   filesystems/index
>     mm/index
>     bpf/index
>     usb/index
>     PCI/index
> -   scsi/index
>     misc-devices/index
>     scheduler/index
>     mhi/index

Thanks.

-- 
An old man doll... just what I always wanted! - Clara

