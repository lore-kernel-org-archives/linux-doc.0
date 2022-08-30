Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AFB8C0502E
	for <linux-doc@archiver.kernel.org>; Tue, 30 Aug 2022 13:30:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230301AbiH3Nar (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 30 Aug 2022 09:30:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230281AbiH3Naq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 30 Aug 2022 09:30:46 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CA50A3D15
        for <linux-doc@vger.kernel.org>; Tue, 30 Aug 2022 06:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1661866243;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=C071C0Fu4zpnzqm2GxjZqFKUf2VQ3Uu+K+WnKl/q7NU=;
        b=eIIDCdgsdaCqBbIPHAh4P+kl99YhCpf8DlocPkBsz9FF7M22q5AwrsIn8GXUG26OQp91cL
        RVHfkHtOeXpM9YuGQmrP2IZpoyp0+J9NqRVmCjz/tErlew/HSwcwHWNAethKz4jVKsg8c9
        O+UOyDH/n5djMQOOTMcltGBo5cXS4cg=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-34-85-vCgwNP_687I9GsL87Jg-1; Tue, 30 Aug 2022 09:30:39 -0400
X-MC-Unique: 85-vCgwNP_687I9GsL87Jg-1
Received: by mail-pl1-f199.google.com with SMTP id b9-20020a170902d50900b0016f0342a417so8112345plg.21
        for <linux-doc@vger.kernel.org>; Tue, 30 Aug 2022 06:30:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=C071C0Fu4zpnzqm2GxjZqFKUf2VQ3Uu+K+WnKl/q7NU=;
        b=f3z2XgnBrfFKEEdcQAQ0N1TdQ2HIBQXxZwaDuWeTXb3Yjaz2Y9Gmq9bW9XCn+f8DHn
         DpUH8mP2yG8C4hFq1C8RlObgYc0LdUvpZ7hvBSWj/ymbcrD6UMIycTJNWvxQN67D2bI1
         Uegaf9o1eGxN4ymt9F/Ba4mm1y6M4kVgibMYZycFYlH1hdzJr+tnVi7ooPYq4AppktbA
         fpaL+kSQ76BCkBLNKghRXkqQeuIfzlAIzcKeMktperP/0wQaMiL4RyZ0p34NwqvX8afK
         MX2K9OsesCtfjYT8lEOyYEo4ddv7d2MgdSM00lNOLjeeBf1UUgSw/TcwiQFxh0xJQFP+
         fx3w==
X-Gm-Message-State: ACgBeo14HfZJzxwGrhMpqIkvu7Y6MVrR/75twH3X8HU0LaNq2esFYqO+
        iDWlDibGWPyczdx+jp2uFej8OSO6OSHNU9OZzc8PXdurkX8gAqry9aOS1LsSupuh20LGjhEFANa
        HLjpK7DIW1wENntaA8C9PM8r6XTQiyo4HYJA5
X-Received: by 2002:a63:d10b:0:b0:41d:bd7d:7759 with SMTP id k11-20020a63d10b000000b0041dbd7d7759mr17929693pgg.196.1661866237881;
        Tue, 30 Aug 2022 06:30:37 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7CO92TZNx1/ZDyoq+lGXimNNYaqY6rNHmUopJlR2o2q6TOwVRYYUayx8+y1zHvUDGFjESrSTgnSoi2AHd+NLQ=
X-Received: by 2002:a63:d10b:0:b0:41d:bd7d:7759 with SMTP id
 k11-20020a63d10b000000b0041dbd7d7759mr17929681pgg.196.1661866237660; Tue, 30
 Aug 2022 06:30:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220721153625.1282007-1-benjamin.tissoires@redhat.com>
 <20220721153625.1282007-25-benjamin.tissoires@redhat.com> <YwbkC9v83gk0Eq/d@debian.me>
In-Reply-To: <YwbkC9v83gk0Eq/d@debian.me>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 30 Aug 2022 15:30:26 +0200
Message-ID: <CAO-hwJ+zJZzRXaj3ZGSaz9N3p7hE0mdcbsxTK04L-ep7_podFw@mail.gmail.com>
Subject: Re: [PATCH bpf-next v7 24/24] Documentation: add HID-BPF docs
To:     Bagas Sanjaya <bagasdotme@gmail.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Jiri Kosina <jikos@kernel.org>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Andrii Nakryiko <andrii@kernel.org>,
        Martin KaFai Lau <kafai@fb.com>,
        Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>,
        Kumar Kartikeya Dwivedi <memxor@gmail.com>,
        John Fastabend <john.fastabend@gmail.com>,
        KP Singh <kpsingh@kernel.org>, Shuah Khan <shuah@kernel.org>,
        Dave Marchevsky <davemarchevsky@fb.com>,
        Joe Stringer <joe@cilium.io>, Jonathan Corbet <corbet@lwn.net>,
        Tero Kristo <tero.kristo@linux.intel.com>,
        lkml <linux-kernel@vger.kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Networking <netdev@vger.kernel.org>, bpf <bpf@vger.kernel.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Aug 25, 2022 at 4:53 AM Bagas Sanjaya <bagasdotme@gmail.com> wrote:
>
> On Thu, Jul 21, 2022 at 05:36:25PM +0200, Benjamin Tissoires wrote:
> > +When (and why) to use HID-BPF
> > +=============================
> > +
> > +We can enumerate several use cases for when using HID-BPF is better than
> > +using a standard kernel driver fix:
> > +
>
> Better say "There are several use cases when using HID-BPF is better
> than standard kernel driver fix:"

OK, included locally, and will send it in v10.

>
> > +When a BPF program needs to emit input events, it needs to talk HID, and rely
> > +on the HID kernel processing to translate the HID data into input events.
> > +
>
> talk to HID?

Replaced with "it needs to talk with the HID protocol".

>
> Otherwise the documentation LGTM (no new warnings caused by the doc).

Great, thanks a lot for the review :)

Cheers,
Benjamin

>
> --
> An old man doll... just what I always wanted! - Clara

