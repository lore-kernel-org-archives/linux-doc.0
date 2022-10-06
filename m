Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 758C5C4332F
	for <linux-doc@archiver.kernel.org>; Thu,  6 Oct 2022 12:55:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231432AbiJFMzw (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 6 Oct 2022 08:55:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231709AbiJFMzc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 6 Oct 2022 08:55:32 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9AADF586
        for <linux-doc@vger.kernel.org>; Thu,  6 Oct 2022 05:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1665060870;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Syg5zIWBvPOX0jJz9joJzjpsGxjICL72fZp42SQwfoM=;
        b=Da+tPwSXYVNH+L080u9NexWFhgE45S7Ga7vEs0JOox0JfHZ7eO+ACImtaSQiRAv33Q5NEU
        Cb/3L5DnQgqygczPwPN0kLe94zjvA27frMsTMh/diu8lc6uhgAu3SZLJdknFlCKib+XgFs
        erSEuRFajYgvlMK0J5ney9PQNRwaBoE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-641-L5KogIr0MXKM_z-vahuTGw-1; Thu, 06 Oct 2022 08:51:13 -0400
X-MC-Unique: L5KogIr0MXKM_z-vahuTGw-1
Received: by mail-wm1-f69.google.com with SMTP id g8-20020a05600c4ec800b003b4bcbdb63cso980343wmq.7
        for <linux-doc@vger.kernel.org>; Thu, 06 Oct 2022 05:51:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=Syg5zIWBvPOX0jJz9joJzjpsGxjICL72fZp42SQwfoM=;
        b=5w+AJ5tdC41aVDF0Oz4amNEJsvRDIMyPcB2gyrcBR8SOcEMprgeHGJT6RSZnOoh2FB
         Si3e36rsYw5tVWZ206Y5XamgH606YU/ZNNCHJgxdpAsiuJ3wr4EnFGFTDb+HrnycjAsi
         QKAut0KEL5/EruCg16COJCOkpNSYqdvMfuIbvIxi8qYpf7DpM+w4Qm1NLPY4Pes2SfP3
         7//v7UWMeYO9Kv0NB2pWlz0rTkOsCxA+Ej+pudFWrHKLa8UUdXNG4o3Gv2xi20eUNppS
         jLCFLD/yzcH87gxSPMjH6jtJdDQJ8c0SierkCr0lVZNURIbMPajh1zaE317dOegtoQxs
         aQ7w==
X-Gm-Message-State: ACrzQf2A/L897MVwClML4s/fJGdcKfiTCbBp/P+55en4IvgaqPyG2Ncy
        DjwHTRJjp9SS9t7QGnjUlSG0n2nHQ5uTCNnqATZphnQO2qubbzvT7ePyS8NzYRYMydfVJkzJrLN
        p81bLshXIEYiSAuiB27Ql
X-Received: by 2002:a05:6000:982:b0:229:79e5:6a96 with SMTP id by2-20020a056000098200b0022979e56a96mr3013247wrb.469.1665060672557;
        Thu, 06 Oct 2022 05:51:12 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM58nCSs5milYBn+uz3POtf6SVmsGMBqz64i2N0S1T/ojkzi20QUFO80u17d3tCt4j0XzS5cUQ==
X-Received: by 2002:a05:6000:982:b0:229:79e5:6a96 with SMTP id by2-20020a056000098200b0022979e56a96mr3013230wrb.469.1665060672376;
        Thu, 06 Oct 2022 05:51:12 -0700 (PDT)
Received: from localhost.localdomain ([92.62.32.42])
        by smtp.gmail.com with ESMTPSA id p16-20020a05600c359000b003bdd2add8fcsm5095484wmq.24.2022.10.06.05.51.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 05:51:11 -0700 (PDT)
Date:   Thu, 6 Oct 2022 14:51:09 +0200
From:   Guillaume Nault <gnault@redhat.com>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
        pabeni@redhat.com, robh@kernel.org, johannes@sipsolutions.net,
        ecree.xilinx@gmail.com, stephen@networkplumber.org, sdf@google.com,
        f.fainelli@gmail.com, fw@strlen.de, linux-doc@vger.kernel.org,
        razor@blackwall.org, nicolas.dichtel@6wind.com
Subject: Re: [PATCH net-next v2 3/7] net: add basic C code generators for
 Netlink
Message-ID: <20221006125109.GE3328@localhost.localdomain>
References: <20220930023418.1346263-1-kuba@kernel.org>
 <20220930023418.1346263-4-kuba@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220930023418.1346263-4-kuba@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Sep 29, 2022 at 07:34:14PM -0700, Jakub Kicinski wrote:
> Code generators to turn Netlink specs into C code.
> I'm definitely not proud of it.
> 
> The main generator is in Python, there's a bash script
> to regen all code-gen'ed files in tree after making
> spec changes.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> --
> v2: - use /* */ comments instead of //

Probably not a very interesting feedback, but there
are still many comments generated in the // style.

For example in this block:

> +    if args.mode == "kernel":
> +        if args.header:
> +            if parsed.kernel_policy == 'global':
> +                cw.p(f"// Global operation policy for {parsed.name}")
> +
> +                struct = Struct(parsed, parsed.global_policy_set, type_list=parsed.global_policy)
> +                print_req_policy_fwd(cw, struct)
> +                cw.nl()
> +
> +            for op_name, op in parsed.ops.items():
> +                if parsed.kernel_policy == 'per-op' and 'do' in op and 'event' not in op:
> +                    cw.p(f"// {op.enum_name} - do")
> +                    ri = RenderInfo(cw, parsed, args.mode, op, op_name, "do")
> +                    print_req_policy_fwd(cw, ri.struct['request'], op=op)
> +                    cw.nl()
> +
> +            print_kernel_op_table_fwd(parsed, cw)
> +        else:
> +            if parsed.kernel_policy == 'global':
> +                cw.p(f"// Global operation policy for {parsed.name}")
> +
> +                struct = Struct(parsed, parsed.global_policy_set, type_list=parsed.global_policy)
> +                print_req_policy(cw, struct)
> +                cw.nl()
> +
> +            for op_name, op in parsed.ops.items():
> +                if parsed.kernel_policy == 'per-op':
> +                    for op_mode in {'do', 'dump'}:
> +                        if op_mode in op and 'request' in op[op_mode]:
> +                            cw.p(f"// {op.enum_name} - {op_mode}")
> +                            ri = RenderInfo(cw, parsed, args.mode, op, op_name, op_mode)
> +                            print_req_policy(cw, ri.struct['request'], op=op)
> +                            cw.nl()
> +
> +            print_kernel_op_table(parsed, cw)

