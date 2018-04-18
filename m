Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D8CD67DD31
	for <lwn-linux-doc@archive.lwn.net>; Wed, 18 Apr 2018 22:23:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752170AbeDRWXu (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 18 Apr 2018 18:23:50 -0400
Received: from mail-pl0-f68.google.com ([209.85.160.68]:42910 "EHLO
        mail-pl0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750981AbeDRWXs (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 18 Apr 2018 18:23:48 -0400
Received: by mail-pl0-f68.google.com with SMTP id t20-v6so1955923ply.9;
        Wed, 18 Apr 2018 15:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=OimKEsSICZPjTs7+JgOGNQXXNSTynwAbhy+51cojTiQ=;
        b=VBMAIG69DDNvLbANJI76GeyjOQhCpZ7d+HxutOHgdjnWSiOCpK9l+ttHAUfB0X6cng
         4EH7rUy6K6GT+6TEuNH0ZP9u35b9bOnaCtq3etvxKR5PwPNe/4+TkC80rsJNgEnr45bX
         +bU3t76KkrNlAVN3glFxP7omHXFE3DDmGMVpchznVOxeH8R3nO1caD/mOuW/VBdz/UdW
         cRMaRM45fEPTnXgBFoAB22xRj/5w9V1OPsNm9lqEk13rqr3N+crumNNoA6xBGn/fBUPZ
         iQ50xNVNmVLnZwGCkm1dNkveKcHuzXUP3oSk4UhkgzbaCHHtqIaDbGiI0j1f8bwAdYii
         7c3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=OimKEsSICZPjTs7+JgOGNQXXNSTynwAbhy+51cojTiQ=;
        b=lhYokyM8jLKlITao+F61EJYHe9rJ72wyLWWEIQpQ2CYyw+kDGC5uaTcXxCBb1LPN9+
         e+7K1I7xdXxI0s2/J/3TGglGCFeblav3HfkXhaseRmI2awXsUnYAYZAiSZFXl/KpOOy0
         1Ox0OOMvM8A88a0Zx3BumgosDrxnW+AvCdPRlc6aoloK2njeWufXdOcynGutT92Sryix
         qy2v+QZ1Km3wgkNSY2wcfEQ+ue4zV3uQHFQIpcb648rkzmtJ7Dw8BhRo+qZNq58X62y6
         CURDvP5TwqSdKN6PnnV2fIpPOjQHfmSTfQJ/oZvuRoJu97FhR16dhWrzmo3gOx8upQM0
         3mAA==
X-Gm-Message-State: ALQs6tBQCivvfqdXYiUeLLw4wMo4EZjk03NQAtlCx/3d+jFRJkD8RayE
        3+SUcxdsALZoXKBMaBJKQ/E=
X-Google-Smtp-Source: AIpwx49i9xVUQLDUifWVJGlgjerYd939fHICzIPJrS1V9tdd4XwChm8dJSnJ8DT3DVvpZpKcaRyGnw==
X-Received: by 2002:a17:902:2947:: with SMTP id g65-v6mr1269574plb.346.1524090228263;
        Wed, 18 Apr 2018 15:23:48 -0700 (PDT)
Received: from ast-mbp ([2620:10d:c090:180::1:ac97])
        by smtp.gmail.com with ESMTPSA id g10sm4069393pgr.69.2018.04.18.15.23.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Apr 2018 15:23:47 -0700 (PDT)
Date:   Wed, 18 Apr 2018 15:23:45 -0700
From:   Alexei Starovoitov <alexei.starovoitov@gmail.com>
To:     Quentin Monnet <quentin.monnet@netronome.com>
Cc:     daniel@iogearbox.net, ast@kernel.org, netdev@vger.kernel.org,
        oss-drivers@netronome.com, linux-doc@vger.kernel.org,
        linux-man@vger.kernel.org
Subject: Re: [PATCH bpf-next v3 5/8] bpf: add documentation for eBPF helpers
 (33-41)
Message-ID: <20180418222344.7wzj3mkm6it5rdit@ast-mbp>
References: <20180417143438.7018-1-quentin.monnet@netronome.com>
 <20180417143438.7018-6-quentin.monnet@netronome.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180417143438.7018-6-quentin.monnet@netronome.com>
User-Agent: NeoMutt/20180223
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Apr 17, 2018 at 03:34:35PM +0100, Quentin Monnet wrote:
> Add documentation for eBPF helper functions to bpf.h user header file.
> This documentation can be parsed with the Python script provided in
> another commit of the patch series, in order to provide a RST document
> that can later be converted into a man page.
> 
> The objective is to make the documentation easily understandable and
> accessible to all eBPF developers, including beginners.
> 
> This patch contains descriptions for the following helper functions, all
> written by Daniel:
> 
> - bpf_get_hash_recalc()
> - bpf_skb_change_tail()
> - bpf_skb_pull_data()
> - bpf_csum_update()
> - bpf_set_hash_invalid()
> - bpf_get_numa_node_id()
> - bpf_set_hash()
> - bpf_skb_adjust_room()
> - bpf_xdp_adjust_meta()
> 
> Cc: Daniel Borkmann <daniel@iogearbox.net>
> Signed-off-by: Quentin Monnet <quentin.monnet@netronome.com>

Acked-by: Alexei Starovoitov <ast@kernel.org>

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
