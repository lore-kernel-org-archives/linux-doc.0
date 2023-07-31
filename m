Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0006CC001E0
	for <linux-doc@archiver.kernel.org>; Mon, 31 Jul 2023 17:22:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233982AbjGaRWO (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 31 Jul 2023 13:22:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233056AbjGaRV4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 31 Jul 2023 13:21:56 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AE0E1BFB
        for <linux-doc@vger.kernel.org>; Mon, 31 Jul 2023 10:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1690824065;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8NfShcrH5vNeU09yfaTlylFugR/gu1+MgjXGX+9Q5ac=;
        b=fiRFmSVOKfM9vRZt8vRPcw9b7rTH0ZIGlxpcFRaSnhtv0aQHSy0nDExPi+KrM6jaPKirJq
        7d8yb6vdM2mgjSGW+lapOTUU5fq3Ihwg9voLsUNslZRRBnPgPkWHBjbQsIev+4a2JZejEA
        jeUNOPlycOfQYru20QZr1s7NlclpiW8=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-146-Jbn404o9Md6kLateHukFvA-1; Mon, 31 Jul 2023 13:21:01 -0400
X-MC-Unique: Jbn404o9Md6kLateHukFvA-1
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-58473c4f629so49584457b3.1
        for <linux-doc@vger.kernel.org>; Mon, 31 Jul 2023 10:21:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690824060; x=1691428860;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8NfShcrH5vNeU09yfaTlylFugR/gu1+MgjXGX+9Q5ac=;
        b=A2FKzANJU0Qjzh/HgURIsTMKHRrZYNNIixas5Ej42YrW0u97KzJK1j33Nuzr5wZmmP
         kh5/RBkUe795Hbeox2I036voAKLZQtWrWnyIOJskWNkZ5xkARzJ9fRYAdpXGX/FkF0pC
         kaToOjVa/IKAOtS/HkdFMi8rXgUbJRsDI0Tvapaq+RZmvY4UmACGbrGXG0RINNNqQr3s
         SWO1vpD6Cq48uPnr4QhViSJ3dj/WYcbblpfKKmMafpNBgXiBqkwZ+U6XDSxvDk7aWVda
         HySEiSge27TKRzQP0BpgEkj7Nvn3Dqe5XCLn30xRaTsLn8pXvzXj5Hfxk93K3Ih8oH28
         b39Q==
X-Gm-Message-State: ABy/qLbQxyOe18VxWsUhOo3VwgYewrNG9yI0v8IgtzUJyexPWy5U0FaL
        J4TkWS17mCRHSc7i2ixszCzLUzibwhxzjEt8BhlP4aL3B1OWM1K0Ea2W0RDz38rSpPt8W7LCOE1
        M+6WmE+sIe88MhetvMgTX
X-Received: by 2002:a81:c24f:0:b0:583:4304:75a4 with SMTP id t15-20020a81c24f000000b00583430475a4mr10696725ywg.29.1690824060509;
        Mon, 31 Jul 2023 10:21:00 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFbVJszIfUaYg4Uc4+wm7XQPO4r+bpFj464rdlreCyyKuJOaZIruagzYqntofPsjWen070/Bg==
X-Received: by 2002:a81:c24f:0:b0:583:4304:75a4 with SMTP id t15-20020a81c24f000000b00583430475a4mr10696647ywg.29.1690824059920;
        Mon, 31 Jul 2023 10:20:59 -0700 (PDT)
Received: from vschneid.remote.csb ([149.12.7.81])
        by smtp.gmail.com with ESMTPSA id 10-20020ac8208a000000b00401f7f23ab6sm3744764qtd.85.2023.07.31.10.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 10:20:59 -0700 (PDT)
From:   Valentin Schneider <vschneid@redhat.com>
To:     Dan Carpenter <dan.carpenter@linaro.org>,
        Steven Rostedt <rostedt@goodmis.org>
Cc:     linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, kvm@vger.kernel.org, linux-mm@kvack.org,
        bpf@vger.kernel.org, x86@kernel.org, rcu@vger.kernel.org,
        linux-kselftest@vger.kernel.org,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Andy Lutomirski <luto@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Frederic Weisbecker <frederic@kernel.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Neeraj Upadhyay <quic_neeraju@quicinc.com>,
        Joel Fernandes <joel@joelfernandes.org>,
        Josh Triplett <josh@joshtriplett.org>,
        Boqun Feng <boqun.feng@gmail.com>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        Zqiang <qiang.zhang1211@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Uladzislau Rezki <urezki@gmail.com>,
        Christoph Hellwig <hch@infradead.org>,
        Lorenzo Stoakes <lstoakes@gmail.com>,
        Josh Poimboeuf <jpoimboe@kernel.org>,
        Jason Baron <jbaron@akamai.com>,
        Kees Cook <keescook@chromium.org>,
        Sami Tolvanen <samitolvanen@google.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Nicholas Piggin <npiggin@gmail.com>,
        Juerg Haefliger <juerg.haefliger@canonical.com>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
        Nadav Amit <namit@vmware.com>,
        Dan Carpenter <error27@gmail.com>,
        Chuang Wang <nashuiliang@gmail.com>,
        Yang Jihong <yangjihong1@huawei.com>,
        Petr Mladek <pmladek@suse.com>,
        "Jason A. Donenfeld" <Jason@zx2c4.com>, Song Liu <song@kernel.org>,
        Julian Pidancet <julian.pidancet@oracle.com>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        Dionna Glaze <dionnaglaze@google.com>,
        Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>,
        Juri Lelli <juri.lelli@redhat.com>,
        Daniel Bristot de Oliveira <bristot@redhat.com>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        Yair Podemsky <ypodemsk@redhat.com>
Subject: Re: [RFC PATCH v2 06/20] tracing/filters: Optimise scalar vs
 cpumask filtering when the user mask is a single CPU
In-Reply-To: <b7cf996a-f443-402c-8e13-c5f25a964184@kadam.mountain>
References: <20230720163056.2564824-1-vschneid@redhat.com>
 <20230720163056.2564824-7-vschneid@redhat.com>
 <20230729155547.35719a1f@rorschach.local.home>
 <04f20e58-6b24-4f44-94e2-0d12324a30e4@kadam.mountain>
 <20230731115453.395d20c6@gandalf.local.home>
 <b7cf996a-f443-402c-8e13-c5f25a964184@kadam.mountain>
Date:   Mon, 31 Jul 2023 18:20:49 +0100
Message-ID: <xhsmhy1iwq9ou.mognet@vschneid.remote.csb>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 31/07/23 19:03, Dan Carpenter wrote:
> On Mon, Jul 31, 2023 at 11:54:53AM -0400, Steven Rostedt wrote:
>> On Mon, 31 Jul 2023 15:07:52 +0300
>> Dan Carpenter <dan.carpenter@linaro.org> wrote:
>>
>> > On Sat, Jul 29, 2023 at 03:55:47PM -0400, Steven Rostedt wrote:
>> > > > @@ -1761,6 +1761,11 @@ static int parse_pred(const char *str, void=
 *data,
>> > > >                                FILTER_PRED_FN_CPUMASK;
>> > > >                } else if (field->filter_type =3D=3D FILTER_CPU) {
>> > > >                        pred->fn_num =3D FILTER_PRED_FN_CPU_CPUMASK;
>> > > > +		} else if (single) {
>> > > > +			pred->op =3D pred->op =3D=3D OP_BAND ? OP_EQ : pred->op;
>> > >
>> > > Nit, the above can be written as:
>> > >
>> > >                  pred->op =3D pret->op !=3D OP_BAND ? : OP_EQ;
>> > >
>> >
>> > Heh.  Those are not equivalent.  The right way to write this is:
>>
>> You mean because of my typo?
>
> No, I hadn't seen the s/pred/pret/ typo.  Your code does:
>
>       if (pred->op !=3D OP_BAND)
>               pred->op =3D true;
>       else
>               pred->op OP_EQ;
>
> Realy we should probably trigger a static checker warning any time
> someone does a compare operations as part of a "x =3D comparison ?: bar;
> Years ago, someone asked me to do that with regards to error codes like:
>
>       return ret < 0 ?: -EINVAL;
>
> but I don't remember the results.
>

FWIW this is caught by GCC:

     error: the omitted middle operand in ?: will always be =E2=80=98true=
=E2=80=99, suggest explicit middle operand [-Werror=3Dparentheses]
     pred->op =3D pred->op !=3D OP_BAND ? : OP_EQ;


> regards,
> dan carpenter

