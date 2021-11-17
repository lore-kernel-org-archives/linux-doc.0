Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8ECFC433F5
	for <linux-doc@archiver.kernel.org>; Wed, 17 Nov 2021 23:46:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B828D61B43
	for <linux-doc@archiver.kernel.org>; Wed, 17 Nov 2021 23:46:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241687AbhKQXts (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 17 Nov 2021 18:49:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241693AbhKQXtg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 17 Nov 2021 18:49:36 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20904C061766
        for <linux-doc@vger.kernel.org>; Wed, 17 Nov 2021 15:46:36 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id w33-20020a17090a6ba400b001a722a06212so5406324pjj.0
        for <linux-doc@vger.kernel.org>; Wed, 17 Nov 2021 15:46:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=vBBxMjPLRUhIihqhqucxRK9lnl2zxhzIK0++UZjm8wA=;
        b=ZlB2RT7dNPcZE3snoS77x56kjyngl8YJjE2a87gK9wlDb3Mo9LrGTvT+PyyjFmgnUM
         GyXnWubx2TpkDtfDi0jdSWizGJdqO8xzBIyoKzmgyg4iXtBNhMM63HTZ2VTAn/S+brlk
         dU7nt7H/95X2tMg69YH9/Szekw3qFjdhb3ChqN20wUU+yZAx5TxFZ5ZwO2SSNudzQSxO
         7GalZ4ZY/tesjRI1Qpramrd5Bazhk9syLXb4hKKZydLYVFK6VlTwHg3lE/JlfW6jq8LZ
         fbu0QzJSXcUYjO1/ehDYIUxhIKTjbgyXs85dUl6tafDnYcyuu12Pwcj5aNabCN3BkFr/
         LJRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vBBxMjPLRUhIihqhqucxRK9lnl2zxhzIK0++UZjm8wA=;
        b=uq4BhvePXXmwGCpyh0LZAmIOjj9cw9PyFC5JQd5t2gYj0BvEmQFZ0X68GrogpOC07t
         KbU07gvYT0am6VM7jVbL3T7V7t2i/uZi+LYjJS6XfoAJ9rI80kAMPogpc6k7Yo87t2Xe
         Y6HSexsjF7V6Lf61jWIeqH4U0fP9T4nC9dxSzXMucbEXo2EMgNUxvW+/jIwCp2T4rwyk
         M03TfzBJe26cK0X3n4mYDKJjft05rz05KXcrWZx30Z4Dns/1DjGcNDUrjf+EbdvVJF45
         Et5QXL5fpVvWGApCD9XmetbHvm90ymNJl2lox0SeYL2c96wrpyi8qG8VAoMCYS5WjY5i
         RRxg==
X-Gm-Message-State: AOAM5301cLXITtjT6U0gAKq9BYfn9AaD7EksjQfT63dXUOdIEwGo9MCC
        GRpDvUlJZwUGjRoYqqe+WA0fYg==
X-Google-Smtp-Source: ABdhPJwORdO130JVw+aybjtjWO7QHNAn6+9S2r9Cyv5zHvjQDzt1IzZyAOcddO77J2Y+Se6fY1CzSQ==
X-Received: by 2002:a17:90a:3e09:: with SMTP id j9mr4794449pjc.24.1637192795417;
        Wed, 17 Nov 2021 15:46:35 -0800 (PST)
Received: from google.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id f130sm714169pfa.81.2021.11.17.15.46.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 15:46:34 -0800 (PST)
Date:   Wed, 17 Nov 2021 23:46:31 +0000
From:   Sean Christopherson <seanjc@google.com>
To:     Juergen Gross <jgross@suse.com>
Cc:     kvm@vger.kernel.org, x86@kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH v3 1/4] x86/kvm: add boot parameter for adding vcpu-id
 bits
Message-ID: <YZWUV2jvoOS9RSq8@google.com>
References: <20211116141054.17800-1-jgross@suse.com>
 <20211116141054.17800-2-jgross@suse.com>
 <7f10b8b4-e753-c977-f201-5ef17a6e81c8@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7f10b8b4-e753-c977-f201-5ef17a6e81c8@suse.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Nov 17, 2021, Juergen Gross wrote:
> On 16.11.21 15:10, Juergen Gross wrote:
> > Today the maximum vcpu-id of a kvm guest's vcpu on x86 systems is set
> > via a #define in a header file.
> > 
> > In order to support higher vcpu-ids without generally increasing the
> > memory consumption of guests on the host (some guest structures contain
> > arrays sized by KVM_MAX_VCPU_IDS) add a boot parameter for adding some
> > bits to the vcpu-id. Additional bits are needed as the vcpu-id is
> > constructed via bit-wise concatenation of socket-id, core-id, etc.
> > As those ids maximum values are not always a power of 2, the vcpu-ids
> > are sparse.
> > 
> > The additional number of bits needed is basically the number of
> > topology levels with a non-power-of-2 maximum value, excluding the top
> > most level.
> > 
> > The default value of the new parameter will be 2 in order to support
> > today's possible topologies. The special value of -1 will use the
> > number of bits needed for a guest with the current host's topology.
> > 
> > Calculating the maximum vcpu-id dynamically requires to allocate the
> > arrays using KVM_MAX_VCPU_IDS as the size dynamically.
> > 
> > Signed-of-by: Juergen Gross <jgross@suse.com>
> 
> Just thought about vcpu-ids a little bit more.
> 
> It would be possible to replace the topology games completely by an
> arbitrary rather high vcpu-id limit (65536?) and to allocate the memory
> depending on the max vcpu-id just as needed.
> 
> Right now the only vcpu-id dependent memory is for the ioapic consisting
> of a vcpu-id indexed bitmap and a vcpu-id indexed byte array (vectors).
> 
> We could start with a minimal size when setting up an ioapic and extend
> the areas in case a new vcpu created would introduce a vcpu-id outside
> the currently allocated memory. Both arrays are protected by the ioapic
> specific lock (at least I couldn't spot any unprotected usage when
> looking briefly into the code), so reallocating those arrays shouldn't
> be hard. In case of ENOMEM the related vcpu creation would just fail.
> 
> Thoughts?

Why not have userspace state the max vcpu_id it intends to creates on a per-VM
basis?  Same end result, but doesn't require the complexity of reallocating the
I/O APIC stuff.
