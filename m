Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 76CCC7DE74
	for <lwn-linux-doc@archive.lwn.net>; Wed, 18 Apr 2018 22:12:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751407AbeDRWMB (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 18 Apr 2018 18:12:01 -0400
Received: from mail-pf0-f195.google.com ([209.85.192.195]:35038 "EHLO
        mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750981AbeDRWMA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 18 Apr 2018 18:12:00 -0400
Received: by mail-pf0-f195.google.com with SMTP id j5so1588287pfh.2;
        Wed, 18 Apr 2018 15:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=EAGRwUoRshdmeAi7JqZN4nU9r+J5fp3/LLRYmOATtjk=;
        b=oEMKK0u3T0M89lwwb9vfuHRQDCKOcumHaN/xubudA92zHciY9A3dgkNYgsQAmBJgsN
         P0eoM691GpC9VL10FKRuvHE2j6j8paKJJ2N840Jl81fa0vHirfIEIjAietARLngc7phh
         V5gtHZuRctraE3FJJXUfoEuP3uUF5y/ZubGvv+/wLSrcEp0ym1sli28J11pvOtROOGxH
         b6Nqq66rve3HXll71Rjsz4a4qz7gbxRwtzyzuzMpTeB0LY6rtxU47oRnAQ5LAc2nlfJx
         L81bcQF200lxXFiP4PM6szsEe7z0SiTxqnexXlZv+ROcSVyfcfWcabGH2zkVwnliefQe
         rIEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=EAGRwUoRshdmeAi7JqZN4nU9r+J5fp3/LLRYmOATtjk=;
        b=O1ey8SvksGCKo1liO2TxRUkfLlzgLrc+qHA4duN3RaBVGSdbHsrXBJiEqudWhT6unT
         Vo5ugVXj/G+WNgp/g18Jiv0wN1sKe/iqQ5qtDBCHDoKxdfIU4B33vNSJl85NZcSiyBvT
         MSiZfXZp9GjeEmOkKV7aNGDVsAI96RDwyompzzIi2STcHj6Ma4TmFt6Sc4X03Q11GD4L
         rp4nH0Xt/tY2ORKho+XdlMumGCGHpfaqecUCpGu1lZYEQ8oGbstI7M1fuMD7mK51vfkk
         gSt0SAMHY+5sHF9gpTs3YTDvTg4vjR5RZRA9CRVSyBdXefRKWqrQQYAJdlVMk4mZCqTh
         FL1g==
X-Gm-Message-State: ALQs6tDsjCC1HIMxQwPj3F+kRKoEeWTN03fzQQhmWSsmUpNDnvrG6d9c
        3iPrmfH/ybARyuqwinKTNVU=
X-Google-Smtp-Source: AIpwx48Uqi6CH1jsteG9JAmNKXLEaFAaH8jb8ltztBrit81X5W4yAcKBOSDsInX2kM3LDaptt0N7sQ==
X-Received: by 10.99.52.76 with SMTP id b73mr3079718pga.258.1524089520246;
        Wed, 18 Apr 2018 15:12:00 -0700 (PDT)
Received: from ast-mbp ([2620:10d:c090:180::1:ac97])
        by smtp.gmail.com with ESMTPSA id l11sm3106391pgq.83.2018.04.18.15.11.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Apr 2018 15:11:59 -0700 (PDT)
Date:   Wed, 18 Apr 2018 15:11:57 -0700
From:   Alexei Starovoitov <alexei.starovoitov@gmail.com>
To:     Quentin Monnet <quentin.monnet@netronome.com>
Cc:     daniel@iogearbox.net, ast@kernel.org, netdev@vger.kernel.org,
        oss-drivers@netronome.com, linux-doc@vger.kernel.org,
        linux-man@vger.kernel.org
Subject: Re: [PATCH bpf-next v3 4/8] bpf: add documentation for eBPF helpers
 (23-32)
Message-ID: <20180418221156.o5ulg2ecixr6oubn@ast-mbp>
References: <20180417143438.7018-1-quentin.monnet@netronome.com>
 <20180417143438.7018-5-quentin.monnet@netronome.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180417143438.7018-5-quentin.monnet@netronome.com>
User-Agent: NeoMutt/20180223
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Apr 17, 2018 at 03:34:34PM +0100, Quentin Monnet wrote:
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
> - bpf_get_prandom_u32()
> - bpf_get_smp_processor_id()
> - bpf_get_cgroup_classid()
> - bpf_get_route_realm()
> - bpf_skb_load_bytes()
> - bpf_csum_diff()
> - bpf_skb_get_tunnel_opt()
> - bpf_skb_set_tunnel_opt()
> - bpf_skb_change_proto()
> - bpf_skb_change_type()
> 
> v3:
> - bpf_get_prandom_u32(): Fix helper name :(. Add description, including
>   a note on the internal random state.
> - bpf_get_smp_processor_id(): Add description, including a note on the
>   processor id remaining stable during program run.
> - bpf_get_cgroup_classid(): State that CONFIG_CGROUP_NET_CLASSID is
>   required to use the helper. Add a reference to related documentation.
>   State that placing a task in net_cls controller disables cgroup-bpf.
> - bpf_get_route_realm(): State that CONFIG_CGROUP_NET_CLASSID is
>   required to use this helper.
> - bpf_skb_load_bytes(): Fix comment on current use cases for the helper.
> 
> Cc: Daniel Borkmann <daniel@iogearbox.net>
> Signed-off-by: Quentin Monnet <quentin.monnet@netronome.com>

Acked-by: Alexei Starovoitov <ast@kernel.org>

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
