Return-Path: <SRS0=ajHd=6Z=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0B0BC54E8D
	for <linux-doc@archiver.kernel.org>; Mon, 11 May 2020 13:57:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8D2AA20801
	for <linux-doc@archiver.kernel.org>; Mon, 11 May 2020 13:57:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZoVMfWiM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729680AbgEKN5n (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 11 May 2020 09:57:43 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:38866 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726068AbgEKN5m (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 11 May 2020 09:57:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1589205461;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Qu5keUQWIvRVuFIzG8iXBNOvDiRSfTi8I/5cNG9scEw=;
        b=ZoVMfWiMElR5AmRrH7hYRFI1SAzhUQvM/0/QhCZEb1BdemBxWvRAsijXnn707qNEfCxDS1
        mKvNQkqIvl+KBWk/07PP1YfQ7ShqLRVJyp0r7QLlR8tyO2MJFKvN+bWATUh1gw2v1XIjuz
        lgnhiExwyD9wMLqPZW70URt6Iq+9jAs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-22-RJPIDMo_N7G9B13hQlxuEg-1; Mon, 11 May 2020 09:57:39 -0400
X-MC-Unique: RJPIDMo_N7G9B13hQlxuEg-1
Received: by mail-wm1-f71.google.com with SMTP id o26so5283957wmh.1
        for <linux-doc@vger.kernel.org>; Mon, 11 May 2020 06:57:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Qu5keUQWIvRVuFIzG8iXBNOvDiRSfTi8I/5cNG9scEw=;
        b=j/PLToQUvUblMHcX6quAeZV8K9ULNyIOkElhNxyHJS70V+N5mMURb0pfGh0KEDDgUo
         mdolGeO+CuCX1hexOfX3zI8sRyOGR36Sd+/IWx65TBRzTqwxHE/EFzAVkuVnPVmLRVlP
         i+AvbsqamCuhcC8SQkbZYkRsL+HM/WOT6uVvYbG2DzalTT74t+VMeQ8Yu5wGpBTmYX//
         BAGd2XnGPrUlZNt7+U4qSNckiGFrNdpZPSZRwO4YucMZ/G9kP5IJw+8dD/DPP8IdnP25
         sD3/oYX+YeFDBPfRX7aBFw5CVfZbeno0JNHO3eEKfoSupFY70OgQcotOzaWtbSVV50g7
         FK3w==
X-Gm-Message-State: AGi0PuZeAA6nJHBEpsT2aYDUymkuy+bi7ZZ4UR6435OSLWM6rPAiNg3B
        JZDfs3zRXhbCWRMQqUoWtjb8Gi6v4CFn2jJ+0KDy5xwUk5TkNTfdVDYXI5nTsPDRmR5dGWUmh5N
        QuLg2Ebet0nFMg2yp39Mz
X-Received: by 2002:a5d:4389:: with SMTP id i9mr19788447wrq.374.1589205458607;
        Mon, 11 May 2020 06:57:38 -0700 (PDT)
X-Google-Smtp-Source: APiQypK+oszeYy+zb4b0I7GCZK3EzKZDubtrqvtNKrhSQzpgjjL+dk19vgHydykKT3gaICjPgrMiIA==
X-Received: by 2002:a5d:4389:: with SMTP id i9mr19788411wrq.374.1589205458377;
        Mon, 11 May 2020 06:57:38 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:4c95:a679:8cf7:9fb6? ([2001:b07:6468:f312:4c95:a679:8cf7:9fb6])
        by smtp.gmail.com with ESMTPSA id p190sm26875233wmp.38.2020.05.11.06.57.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2020 06:57:37 -0700 (PDT)
Subject: Re: [PATCH v2 2/3] KVM: x86: Move pkru save/restore to x86.c
To:     Babu Moger <babu.moger@amd.com>, Jim Mattson <jmattson@google.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H . Peter Anvin" <hpa@zytor.com>,
        Sean Christopherson <sean.j.christopherson@intel.com>,
        the arch/x86 maintainers <x86@kernel.org>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Joerg Roedel <joro@8bytes.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Andy Lutomirski <luto@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        mchehab+samsung@kernel.org, changbin.du@intel.com,
        Nadav Amit <namit@vmware.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        yang.shi@linux.alibaba.com, asteinhauser@google.com,
        anshuman.khandual@arm.com, Jan Kiszka <jan.kiszka@siemens.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        steven.price@arm.com, rppt@linux.vnet.ibm.com, peterx@redhat.com,
        Dan Williams <dan.j.williams@intel.com>, arjunroy@google.com,
        logang@deltatee.com, Thomas Hellstrom <thellstrom@vmware.com>,
        Andrea Arcangeli <aarcange@redhat.com>, justin.he@arm.com,
        robin.murphy@arm.com, ira.weiny@intel.com,
        Kees Cook <keescook@chromium.org>,
        Juergen Gross <jgross@suse.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        pawan.kumar.gupta@linux.intel.com,
        "Yu, Fenghua" <fenghua.yu@intel.com>,
        vineela.tummalapalli@intel.com, yamada.masahiro@socionext.com,
        sam@ravnborg.org, acme@redhat.com, linux-doc@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        kvm list <kvm@vger.kernel.org>
References: <158897190718.22378.3974700869904223395.stgit@naples-babu.amd.com>
 <158897219574.22378.9077333868984828038.stgit@naples-babu.amd.com>
 <CALMp9eQj_aFcqR+v9SvFjKFxVjaHHzU44udcczJVqOR5vLQbWQ@mail.gmail.com>
 <90657d4b-cb2b-0678-fd9c-a281bb85fadf@redhat.com>
 <6bdf365d-f283-d26c-2465-2be28d7b55bf@amd.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <3f66b718-dfc5-9ad1-cb33-87906e0ff48c@redhat.com>
Date:   Mon, 11 May 2020 15:57:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <6bdf365d-f283-d26c-2465-2be28d7b55bf@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 11/05/20 15:49, Babu Moger wrote:
>> You're right.  The bug was preexistent, but we should fix it in 5.7 and
>> stable as well.
> Paolo, Do you want me to send this fix separately? Or I will send v3 just
> adding this fix. Thanks
> 

Yes, please do.

Paolo

