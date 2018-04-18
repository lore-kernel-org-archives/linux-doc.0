Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 203857E27E
	for <lwn-linux-doc@archive.lwn.net>; Wed, 18 Apr 2018 23:29:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753197AbeDRX32 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 18 Apr 2018 19:29:28 -0400
Received: from mail-pf0-f196.google.com ([209.85.192.196]:45606 "EHLO
        mail-pf0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753038AbeDRX30 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 18 Apr 2018 19:29:26 -0400
Received: by mail-pf0-f196.google.com with SMTP id l27so1661665pfk.12;
        Wed, 18 Apr 2018 16:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=keicc/AEKeLWapTKaSP8RwpXdSAkdy8oCEFVHpKZsqs=;
        b=VSci1EsFLPRLWPQAowFSs8tmpPY/UmK/KcPIudyYMuUbPImKniz+0bPiBevxgtGtI7
         cyXcCTvBlB6btW9UCCcUGMnr7CRhVUxnQ6Yr37a5vczaSClXQ2g0ogmDBnlt1j4k/Eu+
         oQhu4W7FhM8NWc+gFqULD6NkLA0CO8G2zj9NU2E5qu48e5+pm9UmpF2ke8pTGtC0xs8j
         7a1Q+hHRvbJVTgh1eTOTa+cijHoLvhvOEXWQ3MNZ2wDOq0C/ywXKr+6yQqGh1sWh9ryY
         Qc2LNtllmr8DEqCSwwv/az9Pbut6aSIpG/WQR1VQLJqysLERylFaP5uAzyb6GgeoK4y5
         LxCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=keicc/AEKeLWapTKaSP8RwpXdSAkdy8oCEFVHpKZsqs=;
        b=fkCCrgHfZZLt3ChARy1OcOMJjIDk4YukHzErT8bTPmQ/Updd0C0Fl+i/sKeCSmABVs
         S+Yq9z+Q+ue2T3uwnpixsNr3X6kF8C6oG4JaXqOvRm0Uh9bAhNqiMpK4Cf0whdBYAP91
         4DPjZEtx5OZoongwac8lACexfDBhZVIjnAwq/X6SzdY4bBK6SsxabpFjfaNWiD2FZUEx
         UI2KZpAGh8nmLhmi+yNg8AxpvKknjPy4tcnEVJnSC+MO39ueNNflRXLm5WfWu8hWFD/O
         kwiZzO3c+BFLtM6zs+1jxnxXCAnxiDX09dNW0UXkWhMCQANe1eDIqAEIQ5bE1vE4kD8A
         wIpg==
X-Gm-Message-State: ALQs6tC81yKQ/90mgfL+Ayh2LL50Dsi3ObZuflDuzDOVMHDq9O78lrYg
        D+xOtpbP2Bc2oC29PaskE88IFfb0
X-Google-Smtp-Source: AIpwx4/fUwEGPl+A1zuCABDYFP/pyyNKVzQ8d9BD9A7MNiUKoAe127GEi03+NQ40tETNG8qOU5Ufxg==
X-Received: by 10.98.6.3 with SMTP id 3mr3649149pfg.37.1524094165166;
        Wed, 18 Apr 2018 16:29:25 -0700 (PDT)
Received: from ast-mbp ([2620:10d:c090:180::1:ac97])
        by smtp.gmail.com with ESMTPSA id b25sm6280973pfn.166.2018.04.18.16.29.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Apr 2018 16:29:24 -0700 (PDT)
Date:   Wed, 18 Apr 2018 16:29:22 -0700
From:   Alexei Starovoitov <alexei.starovoitov@gmail.com>
To:     Quentin Monnet <quentin.monnet@netronome.com>
Cc:     daniel@iogearbox.net, ast@kernel.org, netdev@vger.kernel.org,
        oss-drivers@netronome.com, linux-doc@vger.kernel.org,
        linux-man@vger.kernel.org, Kaixu Xia <xiakaixu@huawei.com>,
        Martin KaFai Lau <kafai@fb.com>,
        Sargun Dhillon <sargun@sargun.me>, Thomas Graf <tgraf@suug.ch>,
        Gianluca Borello <g.borello@gmail.com>,
        Chenbo Feng <fengc@google.com>
Subject: Re: [PATCH bpf-next v3 6/8] bpf: add documentation for eBPF helpers
 (42-50)
Message-ID: <20180418232920.xqwxoqy7rlv54pvg@ast-mbp>
References: <20180417143438.7018-1-quentin.monnet@netronome.com>
 <20180417143438.7018-7-quentin.monnet@netronome.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180417143438.7018-7-quentin.monnet@netronome.com>
User-Agent: NeoMutt/20180223
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Apr 17, 2018 at 03:34:36PM +0100, Quentin Monnet wrote:
> Add documentation for eBPF helper functions to bpf.h user header file.
> This documentation can be parsed with the Python script provided in
> another commit of the patch series, in order to provide a RST document
> that can later be converted into a man page.
> 
> The objective is to make the documentation easily understandable and
> accessible to all eBPF developers, including beginners.
> 
> This patch contains descriptions for the following helper functions:
> 
> Helper from Kaixu:
> - bpf_perf_event_read()
> 
> Helpers from Martin:
> - bpf_skb_under_cgroup()
> - bpf_xdp_adjust_head()
> 
> Helpers from Sargun:
> - bpf_probe_write_user()
> - bpf_current_task_under_cgroup()
> 
> Helper from Thomas:
> - bpf_skb_change_head()
> 
> Helper from Gianluca:
> - bpf_probe_read_str()
> 
> Helpers from Chenbo:
> - bpf_get_socket_cookie()
> - bpf_get_socket_uid()
> 
> v3:
> - bpf_perf_event_read(): Fix time of selection for perf event type in
>   description. Remove occurences of "cores" to avoid confusion with
>   "CPU".
> 
> Cc: Kaixu Xia <xiakaixu@huawei.com>
> Cc: Martin KaFai Lau <kafai@fb.com>
> Cc: Sargun Dhillon <sargun@sargun.me>
> Cc: Thomas Graf <tgraf@suug.ch>
> Cc: Gianluca Borello <g.borello@gmail.com>
> Cc: Chenbo Feng <fengc@google.com>
> Signed-off-by: Quentin Monnet <quentin.monnet@netronome.com>
...
> + *
> + * u64 bpf_get_socket_cookie(struct sk_buff *skb)
> + * 	Description
> + * 		Retrieve the socket cookie generated by the kernel from a
> + * 		**struct sk_buff** with a known socket. If none has been set

this bit could use some improvement, since it reads as cookie is
generated from sk_buff, whereas it has nothing to do with this particular
sk_buff. Cookie belongs to the socket and generated for the socket.
Would be good to explain that cookie is stable for the life of the socket.

For the rest:
Acked-by: Alexei Starovoitov <ast@kernel.org>

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
