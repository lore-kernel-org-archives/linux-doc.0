Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E75887D04D
	for <lwn-linux-doc@archive.lwn.net>; Mon, 18 Mar 2019 17:35:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727066AbfCRRf2 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 18 Mar 2019 13:35:28 -0400
Received: from mail-it1-f196.google.com ([209.85.166.196]:55637 "EHLO
        mail-it1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726907AbfCRRf2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 18 Mar 2019 13:35:28 -0400
Received: by mail-it1-f196.google.com with SMTP id z126so18950262itd.5
        for <linux-doc@vger.kernel.org>; Mon, 18 Mar 2019 10:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PrCO2lU0ZipPiiy31J0umfmtEn4o5iLh0G0tXGxKdqM=;
        b=uyrIqaY7oC9B9nG/UxXrp2razNOLtRgLgzTki3DkPSo3hKZBihhOVs5XMPl0tSTbG9
         8BkxMAekwOpEr5c18J94vX/PHkd/cR8S37JaGiHv2rHoQtCm8VN0JQT4bVDxL4DnFuaf
         TBpB7mtD1xZMSM6CEOwzN6ylMmjBtpj/81knOnGPRXtUhR49sy3r7rujNqeJpemmcNe/
         yahcAmwycILMB5vkZoN8PLSOFNCEEoAnrHt4dlbEmOy7anc6ZJcANenVW5WZHg63bVhQ
         EDhXKW0Z+zXP/J6GAQ7GCYiiP+UrBe+V732dR9WdPtz9JuQLQBUDqkDSRPo5Tqt0+iTo
         c1OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PrCO2lU0ZipPiiy31J0umfmtEn4o5iLh0G0tXGxKdqM=;
        b=h7varglETVZhvb+/32MhUnRT/lJEdbWCsc32roWYCQhWDqgrFyJ0hv1mhkBH+2acSe
         MoU9zKChGk1SJIH2pJygannOBzyCaf/XAI2MTEPWkQrwUWPu422o5j2/LKRyli5rO9T/
         9EP+BJXRK7Kr6Hlqrp7hakJGYzVGHgT5Wc4TQLu5X118CcyF8ycHPSuQqTZ4/3lMQb5Q
         INyo+Or3ttCj51Sa0UsvkpojxtYCIbvoZMNUnWf4KWJSWo1A3BWd9Dh9PRODGz9Dhula
         to7hikzaV3gGxuISuhULfEtVJM/O8OsMTG2P7bMLd6T78Gsd7bXIoN8M0tpWYP1T97sD
         +ycQ==
X-Gm-Message-State: APjAAAW4mbp8CVY3la4DXcfKe17ZnIjLCHB7GsQRgCh8uvQ7Np/1F/T4
        oaC0rqW+Yp5LO3D3+nJmllOPi6P9z0Hs8A+7eebt8Q==
X-Google-Smtp-Source: APXvYqw7xww6FQki8SuPZw8IxP5jWoWikBVhp58R4A7DMUEMPaLunFv8UC7JQGZkd4Yza/sj1u2HgqSyKYRRdWhydLY=
X-Received: by 2002:a05:660c:842:: with SMTP id f2mr25940itl.142.1552930526937;
 Mon, 18 Mar 2019 10:35:26 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1552929301.git.andreyknvl@google.com> <80e79c47dc7c5ee3572034a1d69bb724fbed2ecb.1552929301.git.andreyknvl@google.com>
In-Reply-To: <80e79c47dc7c5ee3572034a1d69bb724fbed2ecb.1552929301.git.andreyknvl@google.com>
From:   Eric Dumazet <edumazet@google.com>
Date:   Mon, 18 Mar 2019 10:35:14 -0700
Message-ID: <CANn89iJ4SeccE79gKiv5RFqaouFV8shFA+0dCS8+2D_1aRq_Kw@mail.gmail.com>
Subject: Re: [PATCH v12 08/13] net, arm64: untag user pointers in tcp_zerocopy_receive
To:     Andrey Konovalov <andreyknvl@google.com>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Kees Cook <keescook@chromium.org>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Ingo Molnar <mingo@kernel.org>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        Shuah Khan <shuah@kernel.org>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        "David S. Miller" <davem@davemloft.net>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        linux-mm <linux-mm@kvack.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        netdev <netdev@vger.kernel.org>, bpf <bpf@vger.kernel.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        Kostya Serebryany <kcc@google.com>,
        Evgeniy Stepanov <eugenis@google.com>,
        Lee Smith <Lee.Smith@arm.com>,
        Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
        Jacob Bramley <Jacob.Bramley@arm.com>,
        Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
        Chintan Pandya <cpandya@codeaurora.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Dave Martin <Dave.Martin@arm.com>,
        Kevin Brodsky <kevin.brodsky@arm.com>,
        Szabolcs Nagy <Szabolcs.Nagy@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Mar 18, 2019 at 10:18 AM Andrey Konovalov <andreyknvl@google.com> wrote:
>
> This patch is a part of a series that extends arm64 kernel ABI to allow to
> pass tagged user pointers (with the top byte set to something else other
> than 0x00) as syscall arguments.
>
> tcp_zerocopy_receive() uses provided user pointers for vma lookups, which
> can only by done with untagged pointers.
>
> Untag user pointers in this function.
>
> Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
> ---
>  net/ipv4/tcp.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/net/ipv4/tcp.c b/net/ipv4/tcp.c
> index 6baa6dc1b13b..e76beb5ff1ff 100644
> --- a/net/ipv4/tcp.c
> +++ b/net/ipv4/tcp.c
> @@ -1749,7 +1749,7 @@ EXPORT_SYMBOL(tcp_mmap);
>  static int tcp_zerocopy_receive(struct sock *sk,
>                                 struct tcp_zerocopy_receive *zc)
>  {
> -       unsigned long address = (unsigned long)zc->address;
> +       unsigned long address;
>         const skb_frag_t *frags = NULL;
>         u32 length = 0, seq, offset;
>         struct vm_area_struct *vma;
> @@ -1758,7 +1758,12 @@ static int tcp_zerocopy_receive(struct sock *sk,
>         int inq;
>         int ret;
>
> -       if (address & (PAGE_SIZE - 1) || address != zc->address)
> +       address = (unsigned long)untagged_addr(zc->address);
> +
> +       /* The second test in this if detects if the u64->unsigned long
> +        * conversion had any truncated bits.
> +        */
> +       if (address & (PAGE_SIZE - 1) || address != untagged_addr(zc->address))
>                 return -EINVAL;
>
>         if (sk->sk_state == TCP_LISTEN)


This is quite ugly, the comment does not really help nor belong to this patch.

What about using  untagged_addr()  only once ?

diff --git a/net/ipv4/tcp.c b/net/ipv4/tcp.c
index 6baa6dc1b13b0b94b1da238668b93e167cf444fe..855a1f68c1ea9b0d07a92bd7f5e7c24840a99d3d
100644
--- a/net/ipv4/tcp.c
+++ b/net/ipv4/tcp.c
@@ -1761,6 +1761,8 @@ static int tcp_zerocopy_receive(struct sock *sk,
        if (address & (PAGE_SIZE - 1) || address != zc->address)
                return -EINVAL;

+       address = untagged_addr(address);
+
        if (sk->sk_state == TCP_LISTEN)
                return -ENOTCONN;
