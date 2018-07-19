Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 07AD07D071
	for <lwn-linux-doc@archive.lwn.net>; Thu, 19 Jul 2018 23:00:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727553AbeGSXp0 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 19 Jul 2018 19:45:26 -0400
Received: from mail-oi0-f65.google.com ([209.85.218.65]:43346 "EHLO
        mail-oi0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730248AbeGSXp0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 19 Jul 2018 19:45:26 -0400
Received: by mail-oi0-f65.google.com with SMTP id b15-v6so17995834oib.10
        for <linux-doc@vger.kernel.org>; Thu, 19 Jul 2018 16:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cDXcBs6C/GbNP9HolazchJwWC1Zy4HFsACqVQPyV3/c=;
        b=dDwhU+ylnq+yjxsRgjlMz6BYadwoF4PB1teVSrnEUkRxVOeAvqw/fVGPcxQA1xEK/Y
         MHaqoPcz8ntDy8tvuJbTaRQBY9OvOMcKOf0WJQO5kqews48yvXBtGyqqYO6mMZogJ7Zi
         u5ySIG101RwjGvSlpHZAbBxLWC/7mAhBug4hTOmRDoSpE5fS1FqZ7JyGonXBj5HwkR4N
         03mBoTFL42qjRA1TQKXd46hbsCF4XCB09t6V+fY3PpODT890+7d3AgIUeKRWWIu5ZA2j
         ViGxSQLps7xEkJYYMnjmKSRswh1veLOlPIF0kp6WhPaHmqIENDeFbMGpOlx07ZsCmE7l
         TmdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cDXcBs6C/GbNP9HolazchJwWC1Zy4HFsACqVQPyV3/c=;
        b=D3zcRf+Gg2RpIBC+onU9miNp/3P3K1YccMLvsEFEHGpEkLFJVL4JnLGZZOlqhH5rmi
         8PROwBm6S6QUNpvsHjTmX90WnPn1bO4gitLDewtpO5ahMizS6jbgUdtMyKa8Kkcg93B1
         hoG/LUKRHVlOwRnqR7vLQWXGLK6HBxV1PNjVtokDP8nVqMMN1Ef8zil1AUfV3P5Id4+V
         U7bB91e//1JrNLE4HICeY6gHfzxRj64JhOPcj7H+wKtF6uEVmR590Prp5EEvcuB5XxWh
         c9sfWUoVH31jDIBxlmJm8rniEc9DFuxpCXZEIV7UcI3+ZUTVQFcSJDi4ANcG8UaQGuMc
         3zWw==
X-Gm-Message-State: AOUpUlHmxg0rwk+ATEmdb/w8/J4knCxZ+DSqRmctAO4ua0bve/Q22VTP
        7xTXJop/5WZ1bAz2d9eDYF/Q1B/QQvJedSQL63Lvxw==
X-Google-Smtp-Source: AAOMgpfq7l1rJLgA33nHoO5+EUh/F/EUkBOcIvR+PaCoiFaISRfT+cDBgwZBC/vVMgOkVQxdqtQlhoErPpTh2HHMrZ8=
X-Received: by 2002:aca:e089:: with SMTP id x131-v6mr24115oig.221.1532041210410;
 Thu, 19 Jul 2018 16:00:10 -0700 (PDT)
MIME-Version: 1.0
References: <20180719213802.17161-1-ahmedsoliman0x666@gmail.com> <20180719213802.17161-4-ahmedsoliman0x666@gmail.com>
In-Reply-To: <20180719213802.17161-4-ahmedsoliman0x666@gmail.com>
From:   Jann Horn <jannh@google.com>
Date:   Fri, 20 Jul 2018 00:59:43 +0200
Message-ID: <CAG48ez3EyU=ROBczUdHEuOYBtZghYqOpq3K16Bs4RQLO1OO6oA@mail.gmail.com>
Subject: Re: [PATCH 3/3] [RFC V3] KVM: X86: Adding skeleton for Memory ROE
To:     ahmedsoliman0x666@gmail.com
Cc:     kvm@vger.kernel.org,
        Kernel Hardening <kernel-hardening@lists.openwall.com>,
        virtualization@lists.linux-foundation.org,
        linux-doc@vger.kernel.org,
        "the arch/x86 maintainers" <x86@kernel.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        "H . Peter Anvin" <hpa@zytor.com>,
        Kees Cook <keescook@chromium.org>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>, david@redhat.com,
        Boris Lukashev <blukashev@sempervictus.com>,
        david.vrabel@nutanix.com, nigel.edwards@hpe.com, riel@surriel.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jul 19, 2018 at 11:40 PM Ahmed Abd El Mawgood
<ahmedsoliman0x666@gmail.com> wrote:
> This patch introduces a hypercall implemented for X86 that can assist
> against subset of kernel rootkits, it works by place readonly protection in
> shadow PTE. The end result protection is also kept in a bitmap for each
> kvm_memory_slot and is used as reference when updating SPTEs. The whole
> goal is to protect the guest kernel static data from modification if
> attacker is running from guest ring 0, for this reason there is no
> hypercall to revert effect of Memory ROE hypercall. This patch doesn't
> implement integrity check on guest TLB so obvious attack on the current
> implementation will involve guest virtual address -> guest physical
> address remapping, but there are plans to fix that.

Why are you implementing this in the kernel, instead of doing it in
host userspace?
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
