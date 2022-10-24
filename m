Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EFECC67871
	for <linux-doc@archiver.kernel.org>; Mon, 24 Oct 2022 23:31:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231304AbiJXXbq (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 24 Oct 2022 19:31:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231340AbiJXXbW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 24 Oct 2022 19:31:22 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE3DD18543B
        for <linux-doc@vger.kernel.org>; Mon, 24 Oct 2022 14:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1666648344;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=IpngcHCWXOEB2RUy/1H4V+ZSqfQykCkjdv8Mle+909c=;
        b=PTYfMPULfLDxsCx2O2bNer18VW0wrht6xBbYVMZ1RvNn/E76KlWXpwCv1NY11Xzgl2KfWX
        veO4yCyNVFlEz9gtd1EZ8CgLZiFEw1j/F9jlpq3XWg77b91TyyGOtsce9Db57oRkcu2L8e
        NBFHKMw8Jc1aLt/+Dam5T5X6ihqxvT4=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-472-jUOconWXM_CT19A_p58sAQ-1; Mon, 24 Oct 2022 08:12:56 -0400
X-MC-Unique: jUOconWXM_CT19A_p58sAQ-1
Received: by mail-ed1-f71.google.com with SMTP id i17-20020a05640242d100b0044f18a5379aso9558974edc.21
        for <linux-doc@vger.kernel.org>; Mon, 24 Oct 2022 05:12:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:to
         :content-language:subject:cc:user-agent:mime-version:date:message-id
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IpngcHCWXOEB2RUy/1H4V+ZSqfQykCkjdv8Mle+909c=;
        b=6aA7n4qnAbgqRS6kGRphW4rYmp9KXsQIfgVDOwYFA+/cNjZCsRlr7XxbDGxgz2mSBM
         fXhJqJSB2OY1NCVXBcju3E0bJ/1q8OSkFbIkL6J1bxDcI7LD6ZeveSnPePNY0kRZUGQX
         iBGA8GrtIFIxqWKX9z1TkyUz+puqLDEzhrsvi1C9BtOVTrXjBamnNV9nuK/bl1tmynPs
         uTeZ0HITxg4iE1hqmeQM2rfM3AgEdgjLbEkf3+QgpOIhUr5UDY/dUpIhMyPUx6JY9NMg
         WBF+anl9yI0OUtFiCa2nQEsL3iNlOxozsihRicPRkmd0Md0kHncaDOHumzT1ERcefsZK
         rcRA==
X-Gm-Message-State: ACrzQf3HTAJw95m4kd5yITtvEVka2MbXwxv49+7uTBACEjIIy0BPQIIR
        +/hAQKkTcFzCWh7SxM14hvYAEKzUKTGzRLYijb4zVPyT9xG6KXwUI6/4IOLKOQPoHxW3v2Sn3Bv
        yn+vmlagP5UhW/Lj+9RNw
X-Received: by 2002:a05:6402:4445:b0:461:b506:de51 with SMTP id o5-20020a056402444500b00461b506de51mr6016603edb.388.1666613574779;
        Mon, 24 Oct 2022 05:12:54 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4XIUGG3NXBCwfUFhJ/dHHjY+VmgLvC7hF3ZxCcaiztCUDIp+ADR/uUE+QiwIp27yGapEPpLw==
X-Received: by 2002:a05:6402:4445:b0:461:b506:de51 with SMTP id o5-20020a056402444500b00461b506de51mr6016587edb.388.1666613574560;
        Mon, 24 Oct 2022 05:12:54 -0700 (PDT)
Received: from [192.168.41.200] (83-90-141-187-cable.dk.customer.tdc.net. [83.90.141.187])
        by smtp.gmail.com with ESMTPSA id n2-20020a170906378200b0078b1bb98615sm15505137ejc.51.2022.10.24.05.12.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Oct 2022 05:12:53 -0700 (PDT)
From:   Jesper Dangaard Brouer <jbrouer@redhat.com>
X-Google-Original-From: Jesper Dangaard Brouer <brouer@redhat.com>
Message-ID: <afc6d835-3988-0b4a-afd6-496f392324dd@redhat.com>
Date:   Mon, 24 Oct 2022 14:12:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Cc:     brouer@redhat.com
Subject: Re: [PATCH bpf-next v3 1/1] doc: DEVMAPs and XDP_REDIRECT
Content-Language: en-US
To:     mtahhan@redhat.com, bpf@vger.kernel.org, linux-doc@vger.kernel.org
References: <20221017094753.1564273-1-mtahhan@redhat.com>
 <20221017094753.1564273-2-mtahhan@redhat.com>
In-Reply-To: <20221017094753.1564273-2-mtahhan@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


First of all, I'm super happy that we are getting documentation added 
for this.

Comments inlined below.

On 17/10/2022 11.47, mtahhan@redhat.com wrote:
> diff --git a/Documentation/bpf/redirect.rst b/Documentation/bpf/redirect.rst
> new file mode 100644
> index 000000000000..5a0377a67ff0
> --- /dev/null
> +++ b/Documentation/bpf/redirect.rst

Naming the file 'redirect.rst' is that in anticipating that TC-BPF also 
support invoking the bpf_redirect helper?

IMHO we should remember to *also* promote TC-BPF redirect, and it would 
likely be good to have this in same file with XDP-redirect so end-users 
see this.


> @@ -0,0 +1,46 @@
> +.. SPDX-License-Identifier: GPL-2.0-only
> +.. Copyright (C) 2022 Red Hat, Inc.
> +
> +============
> +XDP_REDIRECT
> +============
> +
> +XDP_REDIRECT works by a three-step process, implemented as follows:
> +
> +1. The ``bpf_redirect()`` and ``bpf_redirect_map()`` helpers will lookup the
> +   target of the redirect and store it (along with some other metadata) in a
> +   per-CPU ``struct bpf_redirect_info``. This is where the maps above come into
> +   play.
> +
> +2. When the program returns the ``XDP_REDIRECT`` return code, the driver will
> +   call ``xdp_do_redirect()`` which will use the information in ``struct
> +   bpf_redirect_info`` to actually enqueue the frame into a map type-specific
> +   bulk queue structure.
> +
> +3. Before exiting its NAPI poll loop, the driver will call ``xdp_do_flush()``,
> +   which will flush all the different bulk queues, thus completing the
> +   redirect.

Is this text more or less copied from net/core/filter.c ?

I will suggest directly including this from the code via the DOC text
trick.  (note I've added these DOC tags in other XDP + page_pool code,
but not fully utilized these yet).


> +Pointers to the map entries will be kept around for this whole sequence of
> +steps, protected by RCU. However, there is no top-level ``rcu_read_lock()`` in
> +the core code; instead, the RCU protection relies on everything happening
> +inside a single NAPI poll sequence.
> +
> +.. note::
> +    Not all drivers support transmitting frames after a redirect, and for
> +    those that do, not all of them support non-linear frames. Non-linear xdp
> +    bufs/frames are bufs/frames that contain more than one fragment.
> +

I would like for us to extend this redirect.rst document with
information on how to troubleshoot when XDP-redirect "silently" drops
packets.

Above note it one issue (but not visible to readers).
Plus we should describe how to catch these silent drops, via tracepoints
and even point to xdpdump tool.

I recently helped someone on Slack debug a XDP redirect issue.
During this session I wrote some bpftrace oneliners, that I added to 
XDP-tutorial sub-README[1]

[1] 
https://github.com/xdp-project/xdp-tutorial/blob/master/tracing02-xdp-monitor/README.org


> +XDP_REDIRECT works with the following map types:
> +
> +- BPF_MAP_TYPE_DEVMAP
> +- BPF_MAP_TYPE_DEVMAP_HASH
> +- BPF_MAP_TYPE_CPUMAP
> +- BPF_MAP_TYPE_XSKMAP
> +
> +For more information on these maps, please see the specific map documentation.
> +
> +References
> +===========
> +
> +-https://elixir.bootlin.com/linux/latest/source/net/core/filter.c#L4106

I don't think this reference with a line-number will be stable.

--Jesper

