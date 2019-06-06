Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3FD357D8AB
	for <lwn-linux-doc@archive.lwn.net>; Thu,  6 Jun 2019 22:04:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728942AbfFFWEq (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 6 Jun 2019 18:04:46 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:38824 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728945AbfFFWEq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 6 Jun 2019 18:04:46 -0400
Received: by mail-pf1-f194.google.com with SMTP id a186so2327055pfa.5
        for <linux-doc@vger.kernel.org>; Thu, 06 Jun 2019 15:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=gywlfm9Yoih0bMD6ifzxFpYzXhaSqNtZ3Vx41KnjrlA=;
        b=KdSuc6qUwutVqZM2bBUwnBVByiqJN/DKQJSosVOKivdyswe1dj1OAQfWDjDK5YJqE1
         3t/oHHgHgs+xW+fdWxVOLNWJCnOHYy0LQGMB6JmAUG7IXoYQOym9OJyHHhJSkOCWAnhx
         8ZyvTJDobg2BeY5W4nGvYAgDyNSaNV7cPjuqETuPpAL/hFFP94VqLDOOhRHizSEdYNbX
         rKoG4vr6XTyxTWKCztg7TkQKMD0hCuWqA7q9AZ+TyVE1Pp1fsVn2MY93Iie5UNcgJ7RK
         cwWcCP2/TdvUQakRROAWM6UmzRJhH+2vJHzQ8AEnKylWm8x9WUlTp6jAtdEEDQmMH5ut
         jTeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=gywlfm9Yoih0bMD6ifzxFpYzXhaSqNtZ3Vx41KnjrlA=;
        b=k/QE9bHl+Wnl3YGRCcJjzbJSUWRpjS63/V2sWZ4LVynwZQTnwZKLZMCzJ/qdKdRFUn
         qYhjRVQ1wEiJ1qFl5ryshEXlmzKIl9zExyz+tcF78UyiXwdct8cliA/n6JdQbFZyqsf+
         rmq00s+Y57M99+u9QhcJ0uws1EMS/A5YG0JAjm1w5KhS5rdHxzv/rCRJVogXpcQnHxyQ
         ZkQgcLLSTF/EgfUBohv3psJ3pacFGlEhzDpVPcVKT6DFiqXgbFS2COY5cYwCbGN+VJQK
         fuv1B2a/YdxPeRBZyMwnpKDr0Rws/0+K94FlAhbl1m+pjl6lk8YXNUyIG7y8BU/KjSVc
         0hlw==
X-Gm-Message-State: APjAAAWUUD6Pn38kfLEJg8Bh/4vaBDI7Owc28zVGx8tvNBEH8dwTq11h
        CQ5N9hF4NzxMoMd2AHXJ2fc09A==
X-Google-Smtp-Source: APXvYqyk9QmRHSJ+vGdphw2yaxfTPiy05mkf3a1uNeH7r3/M6ySs3Tt2nDTXY7uEDRPl7vLLEP5vrg==
X-Received: by 2002:a62:1456:: with SMTP id 83mr3919945pfu.228.1559858685103;
        Thu, 06 Jun 2019 15:04:45 -0700 (PDT)
Received: from ?IPv6:2600:1010:b02c:95e1:658b:ab88:7a44:1879? ([2600:1010:b02c:95e1:658b:ab88:7a44:1879])
        by smtp.gmail.com with ESMTPSA id s12sm68142pjp.10.2019.06.06.15.04.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Jun 2019 15:04:44 -0700 (PDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v7 04/27] x86/fpu/xstate: Introduce XSAVES system states
From:   Andy Lutomirski <luto@amacapital.net>
X-Mailer: iPhone Mail (16F203)
In-Reply-To: <0a2f8b9b-b96b-06c8-bae0-b78b2ca3b727@intel.com>
Date:   Thu, 6 Jun 2019 15:04:41 -0700
Cc:     Yu-cheng Yu <yu-cheng.yu@intel.com>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-mm@kvack.org,
        linux-arch@vger.kernel.org, linux-api@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>,
        Balbir Singh <bsingharora@gmail.com>,
        Borislav Petkov <bp@alien8.de>,
        Cyrill Gorcunov <gorcunov@gmail.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Eugene Syromiatnikov <esyr@redhat.com>,
        Florian Weimer <fweimer@redhat.com>,
        "H.J. Lu" <hjl.tools@gmail.com>, Jann Horn <jannh@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Kees Cook <keescook@chromium.org>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Nadav Amit <nadav.amit@gmail.com>,
        Oleg Nesterov <oleg@redhat.com>, Pavel Machek <pavel@ucw.cz>,
        Peter Zijlstra <peterz@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        "Ravi V. Shankar" <ravi.v.shankar@intel.com>,
        Vedvyas Shanbhogue <vedvyas.shanbhogue@intel.com>,
        Dave Martin <Dave.Martin@arm.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <5EE146A8-6C8C-4C5D-B7C0-AB8AD1012F1E@amacapital.net>
References: <20190606200646.3951-1-yu-cheng.yu@intel.com> <20190606200646.3951-5-yu-cheng.yu@intel.com> <0a2f8b9b-b96b-06c8-bae0-b78b2ca3b727@intel.com>
To:     Dave Hansen <dave.hansen@intel.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On Jun 6, 2019, at 2:18 PM, Dave Hansen <dave.hansen@intel.com> wrote:

>> +/*
>> + * Helpers for changing XSAVES system states.
>> + */
>> +static inline void modify_fpu_regs_begin(void)
>> +{
>> +    fpregs_lock();
>> +    if (test_thread_flag(TIF_NEED_FPU_LOAD))
>> +        __fpregs_load_activate();
>> +}
>> +
>> +static inline void modify_fpu_regs_end(void)
>> +{
>> +    fpregs_unlock();
>> +}
>=20
> These are massively under-commented and under-changelogged.  This looks
> like it's intended to ensure that we have supervisor FPU state for this
> task loaded before we go and run the MSRs that might be modifying it.
>=20
> But, that seems broken.  If we have supervisor state, we can't always
> defer the load until return to userspace, so we'll never?? have
> TIF_NEED_FPU_LOAD.  That would certainly be true for cet_kernel_state.

Ugh. I was sort of imagining that we would treat supervisor state completely=
 separately from user state.  But can you maybe give examples of exactly wha=
t you mean?

>=20
> It seems like we actually need three classes of XSAVE states:
> 1. User state

This is FPU, XMM, etc, right?

> 2. Supervisor state that affects user mode

User CET?


> 3. Supervisor state that affects kernel mode

Like supervisor CET?  If we start doing supervisor shadow stack, the context=
 switches will be real fun.  We may need to handle this in asm.

Where does PKRU fit in?  Maybe we can treat it as #3?

=E2=80=94Andy
