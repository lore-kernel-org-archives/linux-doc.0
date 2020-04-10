Return-Path: <SRS0=nlb3=52=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71DFBC2BB55
	for <linux-doc@archiver.kernel.org>; Fri, 10 Apr 2020 19:34:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4B82620732
	for <linux-doc@archiver.kernel.org>; Fri, 10 Apr 2020 19:34:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FLNMfN0l"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726713AbgDJTe1 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 10 Apr 2020 15:34:27 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:50633 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726646AbgDJTe1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 10 Apr 2020 15:34:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1586547266;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=dR0pnT92lTl7PiXH1/vycyqLlKqG/upjftJ1HpISkMA=;
        b=FLNMfN0l96dcvqYOzv1flsfaJu2qCqQltFIc1t7pe3auLWEfPbyo0PpbjHCzBldHpJvJ48
        tszX2nw5SPmdGQttLgWF9yMVk1Ivta2heRB5m8eB3ZqSOH571ablFcOTKbe71snL0fRs5Y
        YOZIEsUSoo7NQHP6PLs7G7KQjUBhYss=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-294-MVoaJtIbOjy_-MuYw8xYbw-1; Fri, 10 Apr 2020 15:34:23 -0400
X-MC-Unique: MVoaJtIbOjy_-MuYw8xYbw-1
Received: by mail-qt1-f198.google.com with SMTP id f56so2683203qte.18
        for <linux-doc@vger.kernel.org>; Fri, 10 Apr 2020 12:34:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dR0pnT92lTl7PiXH1/vycyqLlKqG/upjftJ1HpISkMA=;
        b=pio1rKXYpTaj1FYBRRMGsI53tqY+VXsdpBBnbvu1WCvsDCC605S0O1DO13n7ZToVlS
         BAIGqAYBHM48rqjptAYFbQhvqMoZ/QCCBCUCq1Dvh0FBoVftz+io3PveOd6ckonr7H7v
         R9aADGaEuMke26APdkOOAIn264n+8/kzCHymU00z1gXOwGjtXt3vLvaj5sEEq0J0Z1ng
         9/rnTVKo6GNcej6aFNsE91o6QHl10YgS/UvGuEdTyAMx7XopLSVf4+wo4/fH1njyJuRv
         Dd08myNHrQTlZowSDYrFQFx3Ca6GKviqDX+S5MMYokwX+MibC1tEd8gZY/PndaKEphWf
         tq8A==
X-Gm-Message-State: AGi0PuZr7Mfv9DNFljzBaJRR+lj3t/hXV6obNwDZyQ7PgB5zi8DCVkN8
        fzLl24RWLMhivIqut2eEfXFDthATMwuV6EdDriH4RJlVazponJDnnOD0HklP6wQVnlH5f88qCrx
        Pi9FvBG/FThISntpfIi/q
X-Received: by 2002:ac8:6d06:: with SMTP id o6mr768732qtt.165.1586547263228;
        Fri, 10 Apr 2020 12:34:23 -0700 (PDT)
X-Google-Smtp-Source: APiQypKE+9gdKAAzqM7E075abKl7yEhzpSisddiPAFgdbjLHprLwAVDEdymEnBo0qMB8GT4NFqVJjg==
X-Received: by 2002:ac8:6d06:: with SMTP id o6mr768725qtt.165.1586547263017;
        Fri, 10 Apr 2020 12:34:23 -0700 (PDT)
Received: from xz-x1 ([2607:9880:19c0:32::2])
        by smtp.gmail.com with ESMTPSA id m11sm2214328qkg.130.2020.04.10.12.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2020 12:34:22 -0700 (PDT)
Date:   Fri, 10 Apr 2020 15:34:19 -0400
From:   Peter Xu <peterx@redhat.com>
To:     Mike Kravetz <mike.kravetz@oracle.com>
Cc:     linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-doc@vger.kernel.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        "David S . Miller" <davem@davemloft.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Longpeng <longpeng2@huawei.com>,
        Christophe Leroy <christophe.leroy@c-s.fr>,
        Mina Almasry <almasrymina@google.com>,
        Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v2 3/4] hugetlbfs: remove hugetlb_add_hstate() warning
 for existing hstate
Message-ID: <20200410193419.GF3172@xz-x1>
References: <20200401183819.20647-1-mike.kravetz@oracle.com>
 <20200401183819.20647-4-mike.kravetz@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200401183819.20647-4-mike.kravetz@oracle.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Apr 01, 2020 at 11:38:18AM -0700, Mike Kravetz wrote:

[...]

> @@ -3255,7 +3254,6 @@ void __init hugetlb_add_hstate(unsigned int order)
>  	unsigned long i;
>  
>  	if (size_to_hstate(PAGE_SIZE << order)) {
> -		pr_warn("hugepagesz= specified twice, ignoring\n");
>  		return;
>  	}

Nitpick: I think the brackets need to be removed to follow linux
coding style.  With that:

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu

