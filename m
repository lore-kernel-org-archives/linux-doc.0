Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84979C4321E
	for <linux-doc@archiver.kernel.org>; Thu, 19 May 2022 11:56:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237616AbiESL4w (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 19 May 2022 07:56:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237592AbiESL4u (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 19 May 2022 07:56:50 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2FBF264BDF
        for <linux-doc@vger.kernel.org>; Thu, 19 May 2022 04:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1652961406;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vUzlKZtKtiKnTkl0c+yvVz6DAi0GpJ/ajyiMuXYkKV0=;
        b=gQnVOgxw+JRAllyi4GWeOiSRpCVdWOFBJjRri89AEsejs6heX3qxIc5iTHmEafJlASpI0w
        VD2VaNpdx8q68rdUe8Pxk9v5PLhR08Ww5ZVpcCkqP+hZYR0Yc+z1iaheOapjj55tCTuZan
        XVCTr4slCQHWsJfZK/YsZhSyaTjv/Bc=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-230-7lRGcMX_MrCRVxHzg7Bhxg-1; Thu, 19 May 2022 07:56:42 -0400
X-MC-Unique: 7lRGcMX_MrCRVxHzg7Bhxg-1
Received: by mail-pl1-f199.google.com with SMTP id z1-20020a170902ee0100b00161cf3e64c4so1837014plb.11
        for <linux-doc@vger.kernel.org>; Thu, 19 May 2022 04:56:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=vUzlKZtKtiKnTkl0c+yvVz6DAi0GpJ/ajyiMuXYkKV0=;
        b=RfKuaBqVKVM5UFwpZyMMmahNB+bsZfrLRUHzS8UfV7Cm/L/x5XHTHWZeFEWUqNq70c
         z9wpdH45p+haxf/RKFvBdit5p2X9kYd8EoAkIX2J+lQ8VJX+Qh3Hctnnl+INFVxl9YGH
         h5RQ3Vw64FbvR/s+HP6D1zdb3oY90sByCgZV2qC4YGenvKa2wFtoGvhJttHA2bRt4GzE
         Z6C48hg14FUH7rxNbTO5ODGyk9LjkoCzpcXfIQVlX4K5BfDMqs//3/2N2xmOHFfRk7RA
         KHcmm2RKGVUPaYggchMge3jmZ7N8FGQZQrkDOtwtxmw9UxXR1iNqzO5UIw3gbORzZg94
         yCjA==
X-Gm-Message-State: AOAM532mCR34Fx0oQpMpTHUmrBPlygpytiSDpZacqUAE0h8NFWWUPc/3
        /1fYOjpiJzaUVflVHF8jr0DOfMHX+8Kvix/ZB0mTWAd7kxSDFWbD3wlnuP6fSDPBboOVaDdsGWI
        gboNH9OSptrQ3NE0qt/+ssTK3aT2vzXMqDwR5
X-Received: by 2002:a17:902:c412:b0:161:af8b:f478 with SMTP id k18-20020a170902c41200b00161af8bf478mr4521240plk.67.1652961401580;
        Thu, 19 May 2022 04:56:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwaJcMg0BaVxCTdCDQ3mQxkDhNi5bxy54g0yctOXIo/JTNwcXdo8zjGgzXssPr6OROkM+zoGvNENhA/pSXCpxY=
X-Received: by 2002:a17:902:c412:b0:161:af8b:f478 with SMTP id
 k18-20020a170902c41200b00161af8bf478mr4521208plk.67.1652961401301; Thu, 19
 May 2022 04:56:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220518205924.399291-1-benjamin.tissoires@redhat.com>
 <YoX7iHddAd4FkQRQ@infradead.org> <YoX904CAFOAfWeJN@kroah.com>
 <YoYCIhYhzLmhIGxe@infradead.org> <CAO-hwJL4Pj4JaRquoXD1AtegcKnh22_T0Z0VY_peZ8FRko3kZw@mail.gmail.com>
 <87ee0p951b.fsf@toke.dk>
In-Reply-To: <87ee0p951b.fsf@toke.dk>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Thu, 19 May 2022 13:56:30 +0200
Message-ID: <CAO-hwJKwj6H0Nc_gqsN5okT2ipLL3H6fqe23_vpO+xC3PnX5uw@mail.gmail.com>
Subject: Re: [PATCH bpf-next v5 00/17] Introduce eBPF support for HID devices
To:     =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>
Cc:     Christoph Hellwig <hch@infradead.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Jiri Kosina <jikos@kernel.org>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Andrii Nakryiko <andrii@kernel.org>,
        Martin KaFai Lau <kafai@fb.com>,
        Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>,
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
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, May 19, 2022 at 12:43 PM Toke H=C3=B8iland-J=C3=B8rgensen <toke@red=
hat.com> wrote:
>
> Benjamin Tissoires <benjamin.tissoires@redhat.com> writes:
>
> > On Thu, May 19, 2022 at 10:39 AM Christoph Hellwig <hch@infradead.org> =
wrote:
> >>
> >> On Thu, May 19, 2022 at 10:20:35AM +0200, Greg KH wrote:
> >> > > are written using a hip new VM?
> >> >
> >> > Ugh, don't mention UDI, that's a bad flashback...
> >>
> >> But that is very much what we are doing here.
> >>
> >> > I thought the goal here was to move a lot of the quirk handling and
> >> > "fixup the broken HID decriptors in this device" out of kernel .c co=
de
> >> > and into BPF code instead, which this patchset would allow.
> >
> > Yes, quirks are a big motivation for this work. Right now half of the
> > HID drivers are less than 100 lines of code, and are just trivial
> > fixes (one byte in the report descriptor, one key mapping, etc...).
> > Using eBPF for those would simplify the process from the user point of
> > view: you drop a "firmware fix" as an eBPF program in your system and
> > you can continue working on your existing kernel.
>
> How do you envision those BPF programs living, and how would they be
> distributed? (In-tree / out of tree?)
>

As Greg mentioned in his reply, report descriptors fixups don't do
much besides changing a memory buffer at probe time. So we can either
have udev load the program, pin it and forget about it, or we can also
have the kernel do that for us.

So I envision the distribution to be hybrid:
- for plain fixups where no userspace is required, we should
distribute those programs in the kernel itself, in-tree.
This series already implements pre-loading of BPF programs for the
core part of HID-BPF, but I plan on working on some automation of
pre-loading of these programs from the kernel itself when we need to
do so.

Ideally, the process would be:
* user reports a bug
* developer produces an eBPF program (and maybe compile it if the user
doesn't have LLVM)
* user tests/validates the fix without having to recompile anything
* developer drops the program in-tree
* some automated magic happens (still unclear exactly how to define
which HID device needs which eBPF program ATM)
* when the kernel sees this exact same device (BUS/VID/PID/INTERFACE)
it loads the fixup

- the other part of the hybrid solution is for when userspace is
heavily involved (because it exports a new dbus interface for that
particular feature on this device). We can not really automatically
preload the BPF program because we might not have the user in front of
it.
So in that case, the program would be hosted alongside the
application, out-of-the-tree, but given that to be able to call kernel
functions you need to be GPL, some public distribution of the sources
is required.

Cheers,
Benjamin

