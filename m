Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A057BC433F5
	for <linux-doc@archiver.kernel.org>; Fri, 19 Nov 2021 13:03:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7D19661A55
	for <linux-doc@archiver.kernel.org>; Fri, 19 Nov 2021 13:03:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232080AbhKSNGp (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 19 Nov 2021 08:06:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49574 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235188AbhKSNGo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 19 Nov 2021 08:06:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1637327022;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=hKfzGk0Wpd8IGC/prDVcUoPiImNh9tLcC0HmBj731Mc=;
        b=WwRaXgbqU78bWO6pwcPZbhOOytBcuv2QP1e817JV6IimeGoKeHGP+uUOfwsHWPMPVP+nEp
        wC5oG0yP102S7exM7XHCjeg9LT4QAbOThm52mdD4732ALg+fjBv9QvluzFOVSEgJiMDFGS
        sr/EVOLWev5GQOSk3SCikoLKQVmZl+Q=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-492-zxQ5PYPrOM-unBO5P2BK1w-1; Fri, 19 Nov 2021 08:03:41 -0500
X-MC-Unique: zxQ5PYPrOM-unBO5P2BK1w-1
Received: by mail-ed1-f71.google.com with SMTP id i19-20020a05640242d300b003e7d13ebeedso8325762edc.7
        for <linux-doc@vger.kernel.org>; Fri, 19 Nov 2021 05:03:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=hKfzGk0Wpd8IGC/prDVcUoPiImNh9tLcC0HmBj731Mc=;
        b=pUZpRDoL1T/bhIcpGG2Du8gVn5vpFKJ1WIWtjdGT0wCvB63mreOMXlRKLxKcWq9ueT
         GS2eec4jKjdzPvX76e2OramTMhEHqsHhOat52MDScv6RW+tR0GKuCX5Ks6yHvFHhdeos
         O2YJsqM7xR+AWKladE1mO6iGQ6ZVaTAX1ON9IKmokqUjvpdqHW0jFBPvop/yileaF0Vp
         S39GQ7mTUnziclcu5GroFTfzCV50Zaabh/B8UQjykRGp9tYqhcsFeL/Qf5nkfW1G9Giw
         v2E/pYXgceNchAf+kyHCljR+HcVOdfO0UFOHwCMtBHA/btWvlXHQddyfqBo8brMXJ9Jx
         wQig==
X-Gm-Message-State: AOAM531pc3YiOJ5IuAnIrZC05w3yObV4MuoEd3zRhsLebVz4FjiR2X97
        9c6W9gZoqFH4HvKh5ZZlwH4kEeVEyyjyg2sVaGxw/SIb/tsD4lmeySot7Ec68FnArdaa2bF4kx2
        PFZxg4WfSTLhg5U3k1+R+
X-Received: by 2002:a05:6402:34d6:: with SMTP id w22mr24389963edc.35.1637327019607;
        Fri, 19 Nov 2021 05:03:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx0iYtHfCnciVMnXitwgUqkXXZdqqWWg/E2uIeEkNqY5pWCuyejuk1lAeev+8CNOUCiai6nhA==
X-Received: by 2002:a05:6402:34d6:: with SMTP id w22mr24389826edc.35.1637327018826;
        Fri, 19 Nov 2021 05:03:38 -0800 (PST)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id dz18sm238310edb.74.2021.11.19.05.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Nov 2021 05:03:38 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id 87A81180270; Fri, 19 Nov 2021 14:03:37 +0100 (CET)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     Christoph Hellwig <hch@lst.de>,
        Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc:     Christoph Hellwig <hch@lst.de>, Jonathan Corbet <corbet@lwn.net>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Andrii Nakryiko <andrii@kernel.org>,
        Martin KaFai Lau <kafai@fb.com>,
        Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>,
        John Fastabend <john.fastabend@gmail.com>,
        KP Singh <kpsingh@kernel.org>, linux-doc@vger.kernel.org,
        netdev@vger.kernel.org, bpf@vger.kernel.org
Subject: Re: [PATCH 2/2] bpf, doc: split general purpose eBPF documentation
 out of filter.rst
In-Reply-To: <20211119061642.GB15129@lst.de>
References: <20211115130715.121395-1-hch@lst.de>
 <20211115130715.121395-3-hch@lst.de>
 <20211118005613.g4sqaq2ucgykqk2m@ast-mbp> <20211119061642.GB15129@lst.de>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Fri, 19 Nov 2021 14:03:37 +0100
Message-ID: <877dd4e1qu.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Christoph Hellwig <hch@lst.de> writes:

>> In terms of followups and cleanup... please share what you have in mind.
>
> The prime issue I'd like to look in is to replace all the references
> to classic BPF and instead make the document standadlone.

Yes, please, this would be awesome! :)

-Toke

