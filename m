Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6B9187DE78
	for <lwn-linux-doc@archive.lwn.net>; Wed, 11 Apr 2018 15:45:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753599AbeDKPpR (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 11 Apr 2018 11:45:17 -0400
Received: from mail-wm0-f52.google.com ([74.125.82.52]:35490 "EHLO
        mail-wm0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752870AbeDKPpP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 11 Apr 2018 11:45:15 -0400
Received: by mail-wm0-f52.google.com with SMTP id r82so4689426wme.0
        for <linux-doc@vger.kernel.org>; Wed, 11 Apr 2018 08:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=netronome-com.20150623.gappssmtp.com; s=20150623;
        h=from:subject:to:cc:references:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=TB+Fn3mJ8GxQPxt2hcfzrqPlJwE9P9YNQT2giuW/xAQ=;
        b=brsh+p+41HfqDItHb4ojyka4prl4W6ufMsUCnhbcXNnMlNbUM/DO3Y4DsgNYI95gBA
         sWDxz9Ol5NyRomyLSKGEaPc0u4dutWuRH04fqGVH6cVYBqNoFadnprNaJo6GE8h9Sroq
         Pml2gHcXWD+U1Xe+hXRwXYj6jzFNgvE5SsNh8UiSErQhwoEMJssdA3IoAxiDTaxU6qkL
         plVc3+idEpGN2do2wxphkpmAx41sCERGRWp6cTamwQWrTzMOdddh+h7IuJVsfvThuCDW
         q+O7rX2sT/lIAQwVd8Q4EfFcjJYifSQ+1SZU5qkfN18GfeEZ9HcOfyUE+ADG/dfKCMG9
         5RKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=TB+Fn3mJ8GxQPxt2hcfzrqPlJwE9P9YNQT2giuW/xAQ=;
        b=tghuc636nsaNWc82MChhEFxdluXWKXeJG4kMza479Ip4Vf2BXyjuEyV2OWLtXi/EF4
         wfKAmCQYEI/4nGa2we0MHlKs3GFC+bcIrPKpIujstK1g1Ww0mFK2mIRnUBvoAWI0W7aP
         qEVppi6JiaEMWoPlWbkHYqnCt9FOfPtwBjdItE0VX9MofRlLtWe+7HjaNq6YmJqjCWs9
         omdp8WsMzBNTGj2lsLXq3RLHr2l52Enff3sqJtoFYd0UPtdqnEmT2E2pv4coOZijqaBS
         b1RCQvO7aqS8dHRJ4XvFck757FcaDRo4AqTR8q06HLoornigFBtu3gksWmRCnTrdbtaC
         8Uzg==
X-Gm-Message-State: ALQs6tDKZTaCFsS3eRN1Qsr4/ASS3uZR+UdR9Y3L5z5PJheKSh6soxDW
        yqpMTVJ/USZ0SMfdDq4vcAKKaA==
X-Google-Smtp-Source: AIpwx4/R+TzpDD2XD6jlPZ5+9nqqpSzRt7OsdB/6gtwBrQf/PV6An5IGwDISDnfC7VpgPbUVthv9Tw==
X-Received: by 10.80.149.212 with SMTP id x20mr10519815eda.258.1523461513769;
        Wed, 11 Apr 2018 08:45:13 -0700 (PDT)
Received: from [172.20.1.93] (host-79-78-33-110.static.as9105.net. [79.78.33.110])
        by smtp.gmail.com with ESMTPSA id p27sm957313eda.83.2018.04.11.08.45.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Apr 2018 08:45:13 -0700 (PDT)
From:   Quentin Monnet <quentin.monnet@netronome.com>
Subject: [RFC bpf-next v2 7/8] bpf: add documentation for eBPF helpers (51-57)
To:     Andrey Ignatov <rdna@fb.com>
Cc:     daniel@iogearbox.net, ast@kernel.org, netdev@vger.kernel.org,
        oss-drivers@netronome.com, linux-doc@vger.kernel.org,
        linux-man@vger.kernel.org, Lawrence Brakmo <brakmo@fb.com>,
        Yonghong Song <yhs@fb.com>, Josef Bacik <jbacik@fb.com>
References: <20180410144157.4831-1-quentin.monnet@netronome.com>
 <20180410144157.4831-8-quentin.monnet@netronome.com>
 <20180410175015.GA6762@rdna-mbp.dhcp.thefacebook.com>
Openpgp: preference=signencrypt
Autocrypt: addr=quentin.monnet@netronome.com; prefer-encrypt=mutual; keydata=
 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
 RHhSHGnKaQ6MfrTge5Q0h5A=
Message-ID: <ae82c204-71cb-f575-c4b0-61e15cf94f7b@netronome.com>
Date:   Wed, 11 Apr 2018 16:45:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180410175015.GA6762@rdna-mbp.dhcp.thefacebook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

2018-04-10 10:50 UTC-0700 ~ Andrey Ignatov <rdna@fb.com>
> Quentin Monnet <quentin.monnet@netronome.com> [Tue, 2018-04-10 07:43 -0700]:
>> + * int bpf_bind(struct bpf_sock_addr_kern *ctx, struct sockaddr *addr, int addr_len)
>> + * 	Description
>> + * 		Bind the socket associated to *ctx* to the address pointed by
>> + * 		*addr*, of length *addr_len*. This allows for making outgoing
>> + * 		connection from the desired IP address, which can be useful for
>> + * 		example when all processes inside a cgroup should use one
>> + * 		single IP address on a host that has multiple IP configured.
>> + *
>> + * 		This helper works for IPv4 and IPv6, TCP and UDP sockets. The
>> + * 		domain (*addr*\ **->sa_family**) must be **AF_INET** (or
>> + * 		**AF_INET6**). Looking for a free port to bind to can be
>> + * 		expensive, therefore binding to port is not permitted by the
>> + * 		helper: *addr*\ **->sin_port** (or **sin6_port**, respectively)
>> + * 		must be set to zero.
>> + *
>> + * 		As for the remote end, both parts of it can be overridden,
>> + * 		remote IP and remote port. This can be useful if an application
>> + * 		inside a cgroup wants to connect to another application inside
>> + * 		the same cgroup or to itself, but knows nothing about the IP
>> + * 		address assigned to the cgroup.
> 
> The last paragraph ("As for the remote end ...") is not relevant to
> bpf_bind() and should be removed. It's about sys_connect hook itself
> that can call to bpf_bind() but also has other functionality (and that
> other functionality is described by this paragraph).

Thanks Andrey, I will remove this paragraph.

Quentin



--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
