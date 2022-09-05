Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2257C6FA83
	for <linux-doc@archiver.kernel.org>; Mon,  5 Sep 2022 16:48:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237249AbiIEQsJ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 5 Sep 2022 12:48:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231174AbiIEQsH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 5 Sep 2022 12:48:07 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6485361D54
        for <linux-doc@vger.kernel.org>; Mon,  5 Sep 2022 09:48:06 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id l12so1345961ljg.9
        for <linux-doc@vger.kernel.org>; Mon, 05 Sep 2022 09:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brouer-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=eBPc8+lw+EthbmoJDVfsiUIub6fYAfy3lSFevqTwdLo=;
        b=En9kd4oHs7ZiMDWysTVzFkwgkH1GBSna1/f4J7enbLjUZsf45f6OYgEl2he4kLnYsn
         ev7Eizw/O5cLP0Fw2TzMAKWRK4swcR0frYnErngKmdhhAFR/OwLATgnc251hcM63q8Gs
         S4YAy5Q0FcQsgCFw1y+7nCP8FAhARUwsLC8N4cGgUEuz1LF27VvXCpT1r26Hxiw3JF2o
         0lf5Y2K4WJ3NhuaXbtJuXA+2OZDxyYnqBKdQ/V1e59Z9/fl9Cx8yT33guIUKmQLMZuCK
         JiGq58JFJaDLyUkrT7be1Pf3hpDzEa0zkFf/Pi88aaOofXOnUSSVFZ9WMelQeoOPAaGe
         0Ljg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=eBPc8+lw+EthbmoJDVfsiUIub6fYAfy3lSFevqTwdLo=;
        b=63Fxl4R/SKZIH3QRXqlW/3LrffeBBehZaK+ozbWgV7BiuVFz+b8c6jBxTYKiDqYwoq
         pk3mrYVs9ep9aDkVpnRnQP2GIcTu0aFgd+s/ye5fWwze7DbM5+nu1duT7MXV7Xh73ewZ
         dUvVoPpovnP036tMVkqd5IF9gZjKOf2J0JAJ+aXSPZFLkonV2I58IcY/UC0dxYHh90Jw
         pFx908P7OquYFg6hBEC0z1MCf2XHJDVON6TKm2cTkcfy3TPk4cW78DsArt58ggvity7t
         HSh8GiU3syE+aFCJkt+jYaBlbiwbpJ0pvLNFpLlqPFuZXXLv8JIWgevnuOs8xpSNHslf
         t5gQ==
X-Gm-Message-State: ACgBeo0nJBpdNQmLRJuz0QwQ6zgSiRA0nSwuM9b+JE9FDPGhS3DkkPkJ
        Bgm9oLAgxzH6Z5CsexchX/3hKA==
X-Google-Smtp-Source: AA6agR5Gl3F9BkviHh6nUidmO/FxQm0p+I+k9XcQpfgXdLrhhs5wYrLP6/Z4VmpPSz+3Un25DU2egQ==
X-Received: by 2002:a2e:6e14:0:b0:268:8813:f997 with SMTP id j20-20020a2e6e14000000b002688813f997mr8133895ljc.519.1662396484774;
        Mon, 05 Sep 2022 09:48:04 -0700 (PDT)
Received: from [192.168.41.81] (83-90-141-187-cable.dk.customer.tdc.net. [83.90.141.187])
        by smtp.gmail.com with ESMTPSA id p4-20020a2e9ac4000000b0026a7199e526sm385233ljj.52.2022.09.05.09.48.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Sep 2022 09:48:04 -0700 (PDT)
Message-ID: <4c78f2c6-be9e-a85a-2846-f21e9e8bc536@brouer.com>
Date:   Mon, 5 Sep 2022 18:48:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Cc:     brouer@redhat.com
Subject: Re: [PATCH bpf-next v3 2/2] Add table of BPF program types to libbpf
 docs
Content-Language: en-US
To:     Donald Hunter <donald.hunter@gmail.com>, bpf@vger.kernel.org,
        linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Andrii Nakryiko <andrii.nakryiko@gmail.com>
References: <20220829091500.24115-1-donald.hunter@gmail.com>
 <20220829091500.24115-3-donald.hunter@gmail.com>
From:   "Jesper D. Brouer" <netdev@brouer.com>
In-Reply-To: <20220829091500.24115-3-donald.hunter@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


On 29/08/2022 11.15, Donald Hunter wrote:
> Extend the libbpf documentation with a table of program types,
> attach points and ELF section names. This table uses data from
> program_types.csv which is generated from tools/lib/bpf/libbpf.c
> during the documentation build.
> 
> Signed-off-by: Donald Hunter <donald.hunter@gmail.com>
> ---
[...]
> diff --git a/Documentation/bpf/libbpf/program_types.rst b/Documentation/bpf/libbpf/program_types.rst
> new file mode 100644
> index 000000000000..04fbb48b8a6a
> --- /dev/null
> +++ b/Documentation/bpf/libbpf/program_types.rst
> @@ -0,0 +1,32 @@
> +.. SPDX-License-Identifier: (LGPL-2.1 OR BSD-2-Clause)
> +
> +.. _program_types_and_elf:
> +
> +Program Types and ELF Sections
> +==============================
> +
> +The table below lists the program types, their attach types where relevant and the ELF section
> +names supported by libbpf for them. The ELF section names follow these rules:
> +
> +- ``type`` is an exact match, e.g. ``SEC("socket")``
> +- ``type+`` means it can be either exact ``SEC("type")`` or well-formed ``SEC("type/extras")``
> +  with a ‘``/``’ separator between ``type`` and ``extras``.
> +
> +When ``extras`` are specified, they provide details of how to auto-attach the BPF program.
> +The format of ``extras`` depends on the program type, e.g. ``SEC("tracepoint/<category>/<name>")``
> +for tracepoints or ``SEC("usdt/<path-to-binary>:<usdt_provider>:<usdt_name>")`` for USDT probes.
> +
> +..
> +  program_types.csv is generated from tools/lib/bpf/libbpf.c and is fomatted like this:
                                                                        ^
Typo:  s/fomatted/formatted

> +    Program Type,Attach Type,ELF Section Name,Sleepable
> +    ``BPF_PROG_TYPE_SOCKET_FILTER``,,``socket``,
> +    ``BPF_PROG_TYPE_SK_REUSEPORT``,``BPF_SK_REUSEPORT_SELECT_OR_MIGRATE``,``sk_reuseport/migrate``,
> +    ``BPF_PROG_TYPE_SK_REUSEPORT``,``BPF_SK_REUSEPORT_SELECT``,``sk_reuseport``,
> +    ``BPF_PROG_TYPE_KPROBE``,,``kprobe+``,
> +    ``BPF_PROG_TYPE_KPROBE``,,``uprobe+``,
> +    ``BPF_PROG_TYPE_KPROBE``,,``uprobe.s+``,Yes
> +
> +.. csv-table:: Program Types and Their ELF Section Names
> +   :file: ../../output/program_types.csv
> +   :widths: 40 30 20 10
> +   :header-rows: 1

Nice, I didn't know this formatting trick :-)

Appreciate you are working on this :-)
--Jesper
