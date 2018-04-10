Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A3F1B7E8A1
	for <lwn-linux-doc@archive.lwn.net>; Tue, 10 Apr 2018 01:47:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752121AbeDJBr4 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 9 Apr 2018 21:47:56 -0400
Received: from mail-pf0-f196.google.com ([209.85.192.196]:39790 "EHLO
        mail-pf0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751568AbeDJBr4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 9 Apr 2018 21:47:56 -0400
Received: by mail-pf0-f196.google.com with SMTP id c78so6906964pfj.6;
        Mon, 09 Apr 2018 18:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=vY22XYuwr1X/OeYIYJcehGWc7hx/nfC0XmGC2eKdnpI=;
        b=OEgolDQd1QNzG0EZejA7F52XsAwtIw2hzhXYZlS+sPuvX0aXRPMyoorFjMm6iijrMM
         sqNjZOvWuVvxAnbN14O617tvyhWdl/F0DXD0TqfAKVLw1lJVkCE+RuTFnOrLup1oFWPK
         1IzYgmBypt8ySx0lab35CXI3DIi3W8J+wR2UGzepLmFfsTIri6iW1468kxkDn5GHs4RA
         YLAfuKh0m3Dvz3FIBO5OmwpxnNqLRVk2RzaS+1jT1+upyBFVg0Q27qNAhAGu+QUHmVRK
         BtxpFguPH6zPqHcTZ2MlWaRO4KIqMcRCTW2KSmkISjrsVlT6i9VaK2bSbgIgScmyCOkn
         MdOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=vY22XYuwr1X/OeYIYJcehGWc7hx/nfC0XmGC2eKdnpI=;
        b=AX7F4GF9tphDbOlcVCNWIfqepGQrSOVpItm8wj6er0/tFLJWfxlP+qyZfmJdGOhw77
         KTagqOESYZ4z0s03QMapzvUOlzKX3rfmPPYcLQhXXvmnTsJ2AcDcSI5ZvC6L7BWcE2WV
         F9xAVV+l/Gev4EkLuk33e5VirgKSVkDv19r2fPg9U/md2VdXS0pfOHk3f5i8iTozRuF8
         AE4R6v9qtN3SEs0U1dwMtGnoBE0DDFKgKPE/sPmmrTrCuO9oWKe64IdfbpBaBcHgd8RB
         U/svve1zoKV6+tKZYFpdORMlHNxr5K8rM8ey4QtXfcR1A0GdYwEh36fIDKvkWxhmQL8E
         dGNQ==
X-Gm-Message-State: AElRT7EsNOL9OpVXsh+pd6FqnqYpVtTfMWSIUlMu5XmvH0ywGqd2teDB
        pObh7ndzRO31hSZI0vAP7ag=
X-Google-Smtp-Source: AIpwx4/wa0dF1GgTxGGy1Si5trevJGPYQ3NyeEKyQqg+XudYbPIn8pRY0ke2Ry37VdKxYpBeZsx3eA==
X-Received: by 10.101.102.69 with SMTP id z5mr26611068pgv.438.1523324875193;
        Mon, 09 Apr 2018 18:47:55 -0700 (PDT)
Received: from ast-mbp.dhcp.thefacebook.com ([2620:10d:c090:200::7:bddf])
        by smtp.gmail.com with ESMTPSA id y7sm2605805pfi.185.2018.04.09.18.47.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Apr 2018 18:47:54 -0700 (PDT)
Date:   Mon, 9 Apr 2018 18:47:53 -0700
From:   Alexei Starovoitov <alexei.starovoitov@gmail.com>
To:     Quentin Monnet <quentin.monnet@netronome.com>
Cc:     Daniel Borkmann <daniel@iogearbox.net>, ast@kernel.org,
        netdev@vger.kernel.org, oss-drivers@netronome.com,
        linux-doc@vger.kernel.org, linux-man@vger.kernel.org
Subject: Re: [RFC bpf-next] bpf: document eBPF helpers and add a script to
 generate man page
Message-ID: <20180410014751.mqwqdyujvybir6g5@ast-mbp.dhcp.thefacebook.com>
References: <20180406111122.11038-1-quentin.monnet@netronome.com>
 <05d2d03a-0b39-9d0c-9ba0-3461afc45fac@iogearbox.net>
 <16d4d67a-ab36-3e58-1082-52f0898546e5@netronome.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <16d4d67a-ab36-3e58-1082-52f0898546e5@netronome.com>
User-Agent: NeoMutt/20180223
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Apr 09, 2018 at 02:25:26PM +0100, Quentin Monnet wrote:
> 
> Anyway, I am fine with keeping just signatures, descriptions and return
> values for now. I will submit a new version with only those items.

Thank you.

Could you also split it into few patches?
 include/uapi/linux/bpf.h   | 2237 ++++++++++++++++++++++++++++++++++++--------
 scripts/bpf_helpers_doc.py |  568 +++++++++++
 2 files changed, 2429 insertions(+), 376 deletions(-)

replying back and forth on a single patch of such size will be tedious
for others to follow.
May be document ~10 helpers at a time ? Total of ~7 patches and extra
patch for .py ?

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
