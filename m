Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D86507DE74
	for <lwn-linux-doc@archive.lwn.net>; Wed, 18 Apr 2018 22:10:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752689AbeDRWKH (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 18 Apr 2018 18:10:07 -0400
Received: from mail-pl0-f67.google.com ([209.85.160.67]:33727 "EHLO
        mail-pl0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750981AbeDRWKG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 18 Apr 2018 18:10:06 -0400
Received: by mail-pl0-f67.google.com with SMTP id w12-v6so1947875plp.0;
        Wed, 18 Apr 2018 15:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=iscAVkILweYqb0SkM9S6asBzHCjRFrVrZ5wiAVhsOT0=;
        b=h0DauilfNFc2VR0PZ4escY+wi7U2HDDUiCEcjJJlpVlm9RZkqYp7i5eCIt9xLAXdZ7
         KT/MfNGxqFgSkIaovvBO4ioJaUMdLLmNxF1JNcqOnLVFm1oq/oHBdFPtnWALDmlw/1c+
         g3t22sQYLXQqhkCPj5Pbu4o6lKm4s5YeyZwAM66A397BhhoO1KXMQPU3HPoRAE/69g5/
         ZS3tmorEn9uGuA8FHAtdTe+FimLby/ERYKQJChPlcpe3TE17gsFM1L/qhS7lktLcvVz4
         PPfCo9YSnjaHBZtPWf5t+Aa+KoZ6Gaml/xzS4ks1HBhoAdsCFTEa6NLHKhVwYwpG7sQn
         qiuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=iscAVkILweYqb0SkM9S6asBzHCjRFrVrZ5wiAVhsOT0=;
        b=aSagpCuKuQxk/7gmVbxYPHe34OfZNBknIkirrc5lqEwR59IxflbxFzfkEf0+jFd15j
         /eanRgSX5g+cdvyEpmfpvpcu6qodxibCjZ6oUEh5lIc+gJHyZ02D27G2T7G2KV/Wn92+
         1iHjeBMnf2UnrgZP5AZtgcu4Myyp5F3us2IzvDA+MKpYR1Uy5BN1ydTFICDp3gqsAbCw
         IXmLBTFsxCFrMNK5X0xCHvAjgw0hXKkYFsCtG5q7zUC48ftAQqXzGkOXHt998kNtCiR6
         MuqJQAcC48nzsx0MBYyiXCmsUSIF6WmpR4cHfkgaDQlc6FwQfJ3MgI646N/KSQ2OPAnk
         7Tbg==
X-Gm-Message-State: ALQs6tBTFoDAXrBFLlaNBHFyvcji+KW33NmKmQ5VGy/pj05XH4NXEaDk
        2vlMnTQy8Y35FCcoqzaNPGk=
X-Google-Smtp-Source: AIpwx4+JsgD+J4ghPl+N5a0LHST80LVtNnLmp3Udn2M2Bigv0wgO29sAKUv8xeYda7uWY2RMVHgMuw==
X-Received: by 2002:a17:902:7101:: with SMTP id a1-v6mr3616414pll.291.1524089405227;
        Wed, 18 Apr 2018 15:10:05 -0700 (PDT)
Received: from ast-mbp ([2620:10d:c090:180::1:ac97])
        by smtp.gmail.com with ESMTPSA id v8sm3873461pff.42.2018.04.18.15.10.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Apr 2018 15:10:04 -0700 (PDT)
Date:   Wed, 18 Apr 2018 15:10:02 -0700
From:   Alexei Starovoitov <alexei.starovoitov@gmail.com>
To:     Quentin Monnet <quentin.monnet@netronome.com>
Cc:     daniel@iogearbox.net, ast@kernel.org, netdev@vger.kernel.org,
        oss-drivers@netronome.com, linux-doc@vger.kernel.org,
        linux-man@vger.kernel.org
Subject: Re: [PATCH bpf-next v3 3/8] bpf: add documentation for eBPF helpers
 (12-22)
Message-ID: <20180418221000.e2gwl54kis2l4ia4@ast-mbp>
References: <20180417143438.7018-1-quentin.monnet@netronome.com>
 <20180417143438.7018-4-quentin.monnet@netronome.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180417143438.7018-4-quentin.monnet@netronome.com>
User-Agent: NeoMutt/20180223
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Apr 17, 2018 at 03:34:33PM +0100, Quentin Monnet wrote:
> Add documentation for eBPF helper functions to bpf.h user header file.
> This documentation can be parsed with the Python script provided in
> another commit of the patch series, in order to provide a RST document
> that can later be converted into a man page.
> 
> The objective is to make the documentation easily understandable and
> accessible to all eBPF developers, including beginners.
> 
> This patch contains descriptions for the following helper functions, all
> written by Alexei:
> 
> - bpf_get_current_pid_tgid()
> - bpf_get_current_uid_gid()
> - bpf_get_current_comm()
> - bpf_skb_vlan_push()
> - bpf_skb_vlan_pop()
> - bpf_skb_get_tunnel_key()
> - bpf_skb_set_tunnel_key()
> - bpf_redirect()
> - bpf_perf_event_output()
> - bpf_get_stackid()
> - bpf_get_current_task()
> 
> v3:
> - bpf_skb_get_tunnel_key(): Change and improve description and example.
> - bpf_redirect(): Improve description of BPF_F_INGRESS flag.
> - bpf_perf_event_output(): Fix first sentence of description. Delete
>   wrong statement on context being evaluated as a struct pt_reg. Remove
>   the long yet incomplete example.
> - bpf_get_stackid(): Add a note about PERF_MAX_STACK_DEPTH being
>   configurable.
> 
> Cc: Alexei Starovoitov <ast@kernel.org>
> Signed-off-by: Quentin Monnet <quentin.monnet@netronome.com>

looks great.
Acked-by: Alexei Starovoitov <ast@kernel.org>

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
