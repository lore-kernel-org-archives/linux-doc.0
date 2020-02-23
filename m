Return-Path: <SRS0=a2q4=4L=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D508C35670
	for <linux-doc@archiver.kernel.org>; Sun, 23 Feb 2020 08:12:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E6790214DB
	for <linux-doc@archiver.kernel.org>; Sun, 23 Feb 2020 08:12:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D8C1rbA1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726277AbgBWIMZ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 23 Feb 2020 03:12:25 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:47329 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726208AbgBWIMZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 23 Feb 2020 03:12:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1582445543;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=BwYUjK8HxtbAMJrKBooyAEULF1GvPByjvn4wuyM0RUU=;
        b=D8C1rbA1eYIaxuTmhRiR1Hbgy3BQvZkK/Yq1QxsPG4MyDIPrckWRBbQomt/nprbFUez6wL
        A1VdxEvbUkb19JZV/784FT1xLhNVVuDWYMePyW/3ac4mZmTjq1y8np+fGYjJP1VA4JpARl
        afLqoZ4hWSQZ1fGvIUNUs+SRBqHnizs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-310-cLwDaW0lOzCVdlbREMPegA-1; Sun, 23 Feb 2020 03:12:21 -0500
X-MC-Unique: cLwDaW0lOzCVdlbREMPegA-1
Received: by mail-wr1-f71.google.com with SMTP id j4so3652186wrs.13
        for <linux-doc@vger.kernel.org>; Sun, 23 Feb 2020 00:12:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=BwYUjK8HxtbAMJrKBooyAEULF1GvPByjvn4wuyM0RUU=;
        b=k6xbwfZq8M1Fl3GBSAqin2iILzY/REig+LWwXlSVCKKjdigwb2PjNkr0iV5kAUX1E3
         p/q3Wnx/pG3/hMrZLWekp4kRDPjjcJx+LG9Z2SBAWGpkMi/ln/fvYzPS0C/VdLZD4cb2
         6gEjA8fQObkIR6R4LfaRupFbHm7Rvh994lgXht0uaP/MmlDLoAvGos1jRkbFK7QnkFdd
         l6ZPNbrMCEO35gYgPRoqJOR+YBC7U3EX2nWJ6P2qKxXFbgaUveQXbMFvNVeBGhSBPTg9
         ts83TkGjhAtMKMkVFZg6K2NDc6R0ppH7I+afjR6T3/jySf/u22GTyB7T5AHzO+D8aAli
         lphA==
X-Gm-Message-State: APjAAAUQuTmdqEoz8daFYxEAf7KCTSZcyOIE1HIv3bMqLiWmcF4zddXH
        hm1ByIlzGwzBs1forl6A1M50AlmClgykZMPNqdaoZCJaFquMDNSDWItleA55yyjDYPxYK0hjzol
        J6akP7gdqPyHTzGLV1Yfr
X-Received: by 2002:adf:eec3:: with SMTP id a3mr56070680wrp.337.1582445540718;
        Sun, 23 Feb 2020 00:12:20 -0800 (PST)
X-Google-Smtp-Source: APXvYqwOZ/DYXl+XcdxcNcioYWjyDgY1O/v59EztMIj07VWdCsNv6wIcLG+8kygyVI/R+698U9QzxQ==
X-Received: by 2002:adf:eec3:: with SMTP id a3mr56070638wrp.337.1582445540426;
        Sun, 23 Feb 2020 00:12:20 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:ec41:5e57:ff4d:8e51? ([2001:b07:6468:f312:ec41:5e57:ff4d:8e51])
        by smtp.gmail.com with ESMTPSA id g10sm369900wrr.13.2020.02.23.00.12.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Feb 2020 00:12:18 -0800 (PST)
Subject: Re: [PATCH 5/7] docs: fix broken references for ReST files that moved
 around
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Sean Christopherson <sean.j.christopherson@intel.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
        Corentin Labbe <clabbe.montjoie@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>, kvm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <cover.1582361737.git.mchehab+huawei@kernel.org>
 <df38697632818443686a52340d6b38ef83cb0654.1582361738.git.mchehab+huawei@kernel.org>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <a180d8c2-c51f-900f-0328-cba4dd29f521@redhat.com>
Date:   Sun, 23 Feb 2020 09:12:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <df38697632818443686a52340d6b38ef83cb0654.1582361738.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 22/02/20 10:00, Mauro Carvalho Chehab wrote:
>  Documentation/virt/kvm/mmu.rst                      | 2 +-
>  Documentation/virt/kvm/review-checklist.rst         | 2 +-
>  arch/x86/kvm/mmu/mmu.c                              | 2 +-
>  include/uapi/linux/kvm.h                            | 4 ++--
>  tools/include/uapi/linux/kvm.h                      | 4 ++--

Acked-by: Paolo Bonzini <pbonzini@redhat.com>

