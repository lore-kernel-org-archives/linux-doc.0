Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74FB2EB64D7
	for <linux-doc@archiver.kernel.org>; Fri, 16 Jun 2023 14:24:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229482AbjFPOYw (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 16 Jun 2023 10:24:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345416AbjFPOYp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 16 Jun 2023 10:24:45 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7E3530E4;
        Fri, 16 Jun 2023 07:24:43 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 47C9737A;
        Fri, 16 Jun 2023 14:24:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 47C9737A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1686925483; bh=vpQWUMHiAcSLt1/qfwUoz3VdeI6B9m6HY5SkCx0pxT8=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=mRY+AsZrucUhtkOwRlu1zyYmzbz0BizP5+fMXDrMA121rLRfz640Uayi+nRx43I2V
         zdRQViJhrFRG1Z8yj+hSJN4LgsBzFan9q4D9hmdv3kzf8BPukY9k7i2sSw1gt34DZc
         Zl3EcVtwy8yERrFMxTpSlCLedPklI4Z1EB4C+XWN7HlEZVt6MBpobFmYDAauXXiCED
         rnki1SQ7IEJl36HHhstsMTAG9UpMJvlbJZyx6nkQ6yFUIfkpsukErT8Ev5izdzk07N
         K60tRARjoRPhk73mw49DyEq0KzYpvOIJg1nWp2gAeGMnaVYg+DMWIcdyUkuowdTH1G
         xO4eYBloaR+Lw==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Suraj Jitindar Singh <sjitindarsingh@gmail.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Sean Christopherson <seanjc@google.com>,
        Alexander Graf <agraf@suse.de>,
        Andrew Jones <drjones@redhat.com>,
        Christoffer Dall <cdall@linaro.org>, kvm@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH 0/4] Documentation: KVM: multiple editing corrections
In-Reply-To: <20230612030810.23376-1-rdunlap@infradead.org>
References: <20230612030810.23376-1-rdunlap@infradead.org>
Date:   Fri, 16 Jun 2023 08:24:42 -0600
Message-ID: <875y7nzdqt.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Randy Dunlap <rdunlap@infradead.org> writes:

> Fix various issues in KVM documentation files (grammar, spelling,
> punctuation, file path, wording, hyphenation, and the location of
> module parameters).
>
>
>  [PATCH 1/4] Documentation: KVM: make corrections to halt-polling.rst
>  [PATCH 2/4] Documentation: KVM: make corrections to locking.rst
>  [PATCH 3/4] Documentation: KVM: make corrections to ppc-pv.rst
>  [PATCH 4/4] Documentation: KVM: make corrections to vcpu-requests.rst
>
>  Documentation/virt/kvm/halt-polling.rst  |   10 +++++-----
>  Documentation/virt/kvm/locking.rst       |   18 +++++++++---------
>  Documentation/virt/kvm/ppc-pv.rst        |    8 ++++----
>  Documentation/virt/kvm/vcpu-requests.rst |    6 +++---
>  4 files changed, 21 insertions(+), 21 deletions(-)

I've applied the set, thanks.

jon
