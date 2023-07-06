Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10987EB64D9
	for <linux-doc@archiver.kernel.org>; Thu,  6 Jul 2023 11:31:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232324AbjGFLbn (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 6 Jul 2023 07:31:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232335AbjGFLbl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 6 Jul 2023 07:31:41 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4009FAA
        for <linux-doc@vger.kernel.org>; Thu,  6 Jul 2023 04:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1688643054;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=RinQDlUt4K38HkHxLwhOYs8pH7N2WJkW7Jmb1TL6X3c=;
        b=daTvktUaUzkWhbkD74TdmxfhS7MLdiT1fLQebvHYuPuzjzWasKJY3Bgpv3lQ9vaW1xw99N
        gaaLdnmaEtr/f2W2kDch6azmuS0d+OMR4z+BKiC4sb2bDykScGImi2Z/FdFNGCuq/N9WiT
        pSriEbyW5C8dZ/lrqdlntiEPogvcgIk=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-649-buxDq6wZO0CtjHmc_13JXg-1; Thu, 06 Jul 2023 07:30:53 -0400
X-MC-Unique: buxDq6wZO0CtjHmc_13JXg-1
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7659c6caeaeso87900485a.3
        for <linux-doc@vger.kernel.org>; Thu, 06 Jul 2023 04:30:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688643053; x=1691235053;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RinQDlUt4K38HkHxLwhOYs8pH7N2WJkW7Jmb1TL6X3c=;
        b=B0m85uxzJ55Y6ZcJiKq3aGPy/fEjUlNm4nL+wscP1/X2lKH1zBFmJ2kHfozljtJbSz
         Jqt6agCADUBHiYO/45150Nh+c16e5bldEiCG1ws9KBqHOXrejE/K8/P60Bd0K6NS5BdY
         jGSnQDBRK6yfMvzOqsPomD79UsAmbHxZmr/eeY2MecTa6pgrSxYVnfAKl45tInomyaPS
         1Q9jVUWj0PXxbiYoX5U/RrlTjIP6jULP5gbAHpO90l6u4hNuEUCM3xstx8nooCErgZw+
         XkZQe5Oi/iHpr5kKw8TgmodqebiK2wRvTJnQHx28XIFK2MJgnymr721j9DaZFB8n2yvE
         60TA==
X-Gm-Message-State: ABy/qLaoTgargcoiB1zmNnTiQCzJfmPyYP+7FBiuqapSKpI7/kdKWh2c
        aMB8+OkaddCaIFPgbnEUfNAjNfkWPrNvusFgrZIJOSpYmfKLe/0cTHq8dJIQSP/6Afn1J1sj+rJ
        kuqVsv2Goshm338vxU+mA
X-Received: by 2002:a0c:f549:0:b0:62f:effe:3dca with SMTP id p9-20020a0cf549000000b0062feffe3dcamr1420105qvm.2.1688643053023;
        Thu, 06 Jul 2023 04:30:53 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEbUYOJppwMgQvsEvMakiRmaJatTD8CbvHxxx1dIrR+0X5zWXHf8RNpRxDwVdgtv2CCKKsXFA==
X-Received: by 2002:a0c:f549:0:b0:62f:effe:3dca with SMTP id p9-20020a0cf549000000b0062feffe3dcamr1420051qvm.2.1688643052762;
        Thu, 06 Jul 2023 04:30:52 -0700 (PDT)
Received: from vschneid.remote.csb ([154.57.232.159])
        by smtp.gmail.com with ESMTPSA id a12-20020a0ce38c000000b0062de6537febsm769879qvl.58.2023.07.06.04.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 04:30:52 -0700 (PDT)
From:   Valentin Schneider <vschneid@redhat.com>
To:     Frederic Weisbecker <frederic@kernel.org>
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
        Peter Zijlstra <peterz@infradead.org>,
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
In-Reply-To: <ZKXtfWZiM66dK5xC@localhost.localdomain>
References: <20230705181256.3539027-1-vschneid@redhat.com>
 <20230705181256.3539027-12-vschneid@redhat.com>
 <ZKXtfWZiM66dK5xC@localhost.localdomain>
Date:   Thu, 06 Jul 2023 12:30:46 +0100
Message-ID: <xhsmhttuhuvix.mognet@vschneid.remote.csb>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 06/07/23 00:23, Frederic Weisbecker wrote:
> Le Wed, Jul 05, 2023 at 07:12:53PM +0100, Valentin Schneider a =C3=A9crit=
 :
>> +bool ct_set_cpu_work(unsigned int cpu, unsigned int work)
>> +{
>> +	struct context_tracking *ct =3D per_cpu_ptr(&context_tracking, cpu);
>> +	unsigned int old_work;
>> +	bool ret =3D false;
>> +
>> +	preempt_disable();
>> +
>> +	old_work =3D atomic_read(&ct->work);
>> +	/*
>> +	 * Try setting the work until either
>> +	 * - the target CPU no longer accepts any more deferred work
>> +	 * - the work has been set
>> +	 */
>> +	while (!(old_work & CONTEXT_WORK_DISABLED) && !ret)
>
> Isn't there a race here where you may have missed a CPU that just entered=
 in
> user and you eventually disturb it?
>

Yes, unfortunately.

>> +		ret =3D atomic_try_cmpxchg(&ct->work, &old_work, old_work | work);
>> +
>> +	preempt_enable();
>> +	return ret;
>> +}
> [...]
>> @@ -100,14 +158,19 @@ static noinstr void ct_kernel_exit_state(int offse=
t)
>>   */
>>  static noinstr void ct_kernel_enter_state(int offset)
>>  {
>> +	struct context_tracking *ct =3D this_cpu_ptr(&context_tracking);
>>      int seq;
>> +	unsigned int work;
>>
>> +	work =3D ct_work_fetch(ct);
>
> So this adds another fully ordered operation on user <-> kernel transitio=
n.
> How many such IPIs can we expect?
>

Despite having spent quite a lot of time on that question, I think I still
only have a hunch.

Poking around RHEL systems, I'd say 99% of the problematic IPIs are
instruction patching and TLB flushes.

Staring at the code, there's quite a lot of smp_calls for which it's hard
to say whether the target CPUs can actually be isolated or not (e.g. the
CPU comes from a cpumask shoved in a struct that was built using data from
another struct of uncertain origins), but then again some of them don't
need to hook into context_tracking.

Long story short: I /think/ we can consider that number to be fairly small,
but there could be more lurking in the shadows.

> If this is just about a dozen, can we stuff them in the state like in the
> following? We can potentially add more of them especially on 64 bits we c=
ould
> afford 30 different works, this is just shrinking the RCU extended quiesc=
ent
> state counter space. Worst case that can happen is that RCU misses 65535
> idle/user <-> kernel transitions and delays a grace period...
>

I'm trying to grok how this impacts RCU, IIUC most of RCU mostly cares abou=
t the
even/odd-ness of the thing, and rcu_gp_fqs() cares about the actual value
but only to check if it has changed over time (rcu_dynticks_in_eqs_since()
only does a !=3D).

I'm rephrasing here to make sure I get it - is it then that the worst case
here is 2^(dynticks_counter_size) transitions happen between saving the
dynticks snapshot and checking it again, so RCU waits some more?

