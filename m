Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id EA1CB7DE74
	for <lwn-linux-doc@archive.lwn.net>; Wed, 18 Apr 2018 01:04:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752915AbeDRBEy (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 17 Apr 2018 21:04:54 -0400
Received: from mail-pf0-f196.google.com ([209.85.192.196]:38326 "EHLO
        mail-pf0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752314AbeDRBEx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 17 Apr 2018 21:04:53 -0400
Received: by mail-pf0-f196.google.com with SMTP id y69so49161pfb.5;
        Tue, 17 Apr 2018 18:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=1k8wvZP/JzGH+w06DvZcX/cEbPcZuXo5erdBfMuDq38=;
        b=LZMrEq0mI7Y6SW7oiakpj9nTksU5pQFOp7owZYHbxrZwibHU9J/iPcEN6LX1+U3P8L
         l4/vGUv8ixBDxr1H/NB5P7F5AKwpf1ISoue3ZVPz7+S2NwAtLeDaK6pF/+IcoUdsqbkx
         5KMkHJt1Uy4UxURmO6W9ZToQqS692KLDXs/tO85MAoRfIUsz6s+gBp4B6X+1cwplfEp5
         5wFTOEwA15bLpqUcKtxuldf3hEt4m7aNd1o8OxL2TXdjlLPpw1g+PnBwvTXn+Q2IIRU6
         b+wJNWrkpsSMXY4Ti5DWynEGk6Q/5jmoTZWlSLjCZPcW1xDsGJrrQ0QtORT9IYqEKFSr
         U6Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=1k8wvZP/JzGH+w06DvZcX/cEbPcZuXo5erdBfMuDq38=;
        b=tC0SxDXNfS2s/vkSiF3+94Xb+CGmSOpQ2KkPZ20mzHguq5aQ6goRsFYa1SqpOw2xlJ
         x9wAa19J/k6pJTvPJsmwUpANKmYzn6GqnZEqPHpzN6ZWc9YPRb3vTDNXEcBeFA6vavS2
         2ZiYjPJDEgnbmVlE9Y6YyeTKO8+4riqGrqImfS9HivPiYJKYsiFG8eow8QE/CaSL9Xjc
         OBm3MCvKF+2M9X3EILqRR8wvsHee711o43PDaAdJ3iJpERTxhfBBCFsRmeMfKfnu+4PV
         APl0krmXo845l9QbnM6EP2dXq3Ud8RCHrSwRjNfEZksRVWD6bWtljr71jtgX2oTO+gob
         Jjcg==
X-Gm-Message-State: ALQs6tAkHGVd26W3Bv78CXjatMs+I04ian+djh7+BMBcENsrb7c+dX1/
        uA/mtD5Ftpe22SbfN30mLSA=
X-Google-Smtp-Source: AIpwx4/OoSJFpGEHVuNOBKm3mXyoN/eDlLmh7JYXfdGhFNGJyzC41TgWjwH/Ef3RSzi41GREQgzxTw==
X-Received: by 10.101.72.140 with SMTP id n12mr21772pgs.155.1524013492706;
        Tue, 17 Apr 2018 18:04:52 -0700 (PDT)
Received: from ast-mbp ([2620:10d:c090:180::1:5a07])
        by smtp.gmail.com with ESMTPSA id g8sm66068pgq.28.2018.04.17.18.04.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Apr 2018 18:04:51 -0700 (PDT)
Date:   Tue, 17 Apr 2018 18:04:50 -0700
From:   Alexei Starovoitov <alexei.starovoitov@gmail.com>
To:     Quentin Monnet <quentin.monnet@netronome.com>
Cc:     daniel@iogearbox.net, ast@kernel.org, netdev@vger.kernel.org,
        oss-drivers@netronome.com, linux-doc@vger.kernel.org,
        linux-man@vger.kernel.org
Subject: Re: [PATCH bpf-next v3 2/8] bpf: add documentation for eBPF helpers
 (01-11)
Message-ID: <20180418010449.abxlxtdllo7nofg3@ast-mbp>
References: <20180417143438.7018-1-quentin.monnet@netronome.com>
 <20180417143438.7018-3-quentin.monnet@netronome.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180417143438.7018-3-quentin.monnet@netronome.com>
User-Agent: NeoMutt/20180223
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Apr 17, 2018 at 03:34:32PM +0100, Quentin Monnet wrote:
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
> - bpf_map_lookup_elem()
> - bpf_map_update_elem()
> - bpf_map_delete_elem()
> - bpf_probe_read()
> - bpf_ktime_get_ns()
> - bpf_trace_printk()
> - bpf_skb_store_bytes()
> - bpf_l3_csum_replace()
> - bpf_l4_csum_replace()
> - bpf_tail_call()
> - bpf_clone_redirect()
> 
> v3:
> - bpf_map_lookup_elem(): Fix description of restrictions for flags
>   related to the existence of the entry.
> - bpf_trace_printk(): State that trace_pipe can be configured. Fix
>   return value in case an unknown format specifier is met. Add a note on
>   kernel log notice when the helper is used. Edit example.
> - bpf_tail_call(): Improve comment on stack inheritance.
> - bpf_clone_redirect(): Improve description of BPF_F_INGRESS flag.
> 
> Cc: Alexei Starovoitov <ast@kernel.org>
> Signed-off-by: Quentin Monnet <quentin.monnet@netronome.com>

Acked-by: Alexei Starovoitov <ast@kernel.org>

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
