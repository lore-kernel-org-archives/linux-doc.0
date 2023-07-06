Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47DF9EB64D9
	for <linux-doc@archiver.kernel.org>; Thu,  6 Jul 2023 11:32:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231551AbjGFLcX (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 6 Jul 2023 07:32:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232490AbjGFLcO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 6 Jul 2023 07:32:14 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 432021BEF
        for <linux-doc@vger.kernel.org>; Thu,  6 Jul 2023 04:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1688643081;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=YUOZEoZh3tniSwu0Lc1VH/leg3NuusrIfXtvdOdkp+U=;
        b=ggRz6sQpPR044IGeVBsvYwIuqtk1ZUPUV8ChBrlf7ZxwvBqQrZHstX5c0bnrKle6nObARB
        JILO6hIt6n51i9aF+U1WAOeJMRA0RPa/3de6PJHRd7rg8O46qfMzrm+jr3A5phxQ8CBJ4E
        tNiMYpSke5YRA5d2+vFA450Q/cLwT7E=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-513-dOY3WK59PPu440yfXt42Ew-1; Thu, 06 Jul 2023 07:31:19 -0400
X-MC-Unique: dOY3WK59PPu440yfXt42Ew-1
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-635eeb952b8so8330256d6.3
        for <linux-doc@vger.kernel.org>; Thu, 06 Jul 2023 04:31:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688643079; x=1691235079;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YUOZEoZh3tniSwu0Lc1VH/leg3NuusrIfXtvdOdkp+U=;
        b=bwxISj2QPG9wLwLnTFk15RLfKh1PXaWUQG7cDxQqzTv3YjOqu96cEcf+2V3wQQp/Sr
         dhdvYKGbDav4uwrji/IjqxlG4V4UTK6Fok8m9u3Fv5Lq5s1P8NAA5LRvlDQzQg2FENBd
         Is0PIlrx7pg7bPGJS9jA7Jn3142E7QHLnf1Er4CkRmup5XDcFG3Ai96GMS+ISUbcMMBr
         zqxSoR+J4JeTI3LdTx8v9LwMGhwIjlfVQ7Bwf2PRDj3LGTpEe3ZJ+dWnCMIEoRvHIzou
         U35IJ5hElUlJI1BR6mHKlMvSPds10nSQK64kOhmK41o2n1/a7jQVOprfFPCeE2GwYGVV
         HIPg==
X-Gm-Message-State: ABy/qLYoEB4eaWlPx0+/BqtpGCAc23nC/1l8dJm5XkePMJWkCj4pZmhp
        mhnTBswP94IqQeXkRuRtbEJQv6ahjFwXeLd30nNSLcoyjblCETluOc1AFHdUcQz1lEqSpvNVAOL
        FMrIcAFpFZ+OQPo7tuHIC
X-Received: by 2002:a0c:f014:0:b0:636:e56c:eedb with SMTP id z20-20020a0cf014000000b00636e56ceedbmr1572766qvk.34.1688643079066;
        Thu, 06 Jul 2023 04:31:19 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEBNT72yhfIkKfRmJowXJfm9QDc9/aizAtdc3cEmmOmAM0nOogaJ0lzClntXieI3e1t66iJTw==
X-Received: by 2002:a0c:f014:0:b0:636:e56c:eedb with SMTP id z20-20020a0cf014000000b00636e56ceedbmr1572731qvk.34.1688643078801;
        Thu, 06 Jul 2023 04:31:18 -0700 (PDT)
Received: from vschneid.remote.csb ([154.57.232.159])
        by smtp.gmail.com with ESMTPSA id oo23-20020a05620a531700b007673f8803c3sm624918qkn.96.2023.07.06.04.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 04:31:18 -0700 (PDT)
From:   Valentin Schneider <vschneid@redhat.com>
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, kvm@vger.kernel.org, linux-mm@kvack.org,
        bpf@vger.kernel.org, x86@kernel.org,
        Nicolas Saenz Julienne <nsaenzju@redhat.com>,
        Steven Rostedt <rostedt@goodmis.org>,
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
        Frederic Weisbecker <frederic@kernel.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Uladzislau Rezki <urezki@gmail.com>,
        Christoph Hellwig <hch@infradead.org>,
        Lorenzo Stoakes <lstoakes@gmail.com>,
        Josh Poimboeuf <jpoimboe@kernel.org>,
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
Subject: Re: [RFC PATCH 11/14] context-tracking: Introduce work deferral
 infrastructure
In-Reply-To: <20230705223956.GD2813335@hirez.programming.kicks-ass.net>
References: <20230705181256.3539027-1-vschneid@redhat.com>
 <20230705181256.3539027-12-vschneid@redhat.com>
 <20230705223956.GD2813335@hirez.programming.kicks-ass.net>
Date:   Thu, 06 Jul 2023 12:31:11 +0100
Message-ID: <xhsmhsfa1uvi8.mognet@vschneid.remote.csb>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 06/07/23 00:39, Peter Zijlstra wrote:
> On Wed, Jul 05, 2023 at 07:12:53PM +0100, Valentin Schneider wrote:
>
>> Note: A previous approach by PeterZ [1] used an extra bit in
>> context_tracking.state to flag the presence of deferred callbacks to
>> execute, and the actual callbacks were stored in a separate atomic
>> variable.
>>
>> This meant that the atomic read of context_tracking.state was sufficient to
>> determine whether there are any deferred callbacks to execute.
>> Unfortunately, it presents a race window. Consider the work setting
>> function as:
>>
>>   preempt_disable();
>>   seq = atomic_read(&ct->seq);
>>   if (__context_tracking_seq_in_user(seq)) {
>>        /* ctrl-dep */
>>        atomic_or(work, &ct->work);
>>        ret = atomic_try_cmpxchg(&ct->seq, &seq, seq|CT_SEQ_WORK);
>>   }
>>   preempt_enable();
>>
>>   return ret;
>>
>> Then the following can happen:
>>
>>   CPUx                                             CPUy
>>                                                   CT_SEQ_WORK \in context_tracking.state
>>     atomic_or(WORK_N, &ct->work);
>>                                                    ct_kernel_enter()
>>                                                      ct_state_inc();
>>     atomic_try_cmpxchg(&ct->seq, &seq, seq|CT_SEQ_WORK);
>>
>> The cmpxchg() would fail, ultimately causing an IPI for WORK_N to be
>> sent. Unfortunately, the work bit would remain set, and it can't be sanely
>> cleared in case another CPU set it concurrently - this would ultimately
>> lead to a double execution of the callback, one as a deferred callback and
>> one in the IPI. As not all IPI callbacks are idempotent, this is
>> undesirable.
>
> So adding another atomic is arguably worse.
>
> The thing is, if the NOHZ_FULL CPU is actually doing context transitions
> (SYSCALLs etc..) then everything is fundamentally racy, there is no
> winning that game, we could find the remote CPU is in-kernel, send an
> IPI, the remote CPU does return-to-user and receives the IPI.
>
> And then the USER is upset... because he got an IPI.
>

Yeah, that part is inevitably racy.

The thing I was especially worried about was the potential double
executions (once in IPI, again in deferred work). It's not /too/ bad as the
only two deferred callbacks I'm introducing here are costly-but-stateless,
but IMO is a bad foundation.

But it seems like we can reuse the existing atomic and squeeze some bits in
there, so let's see how that goes :-)

