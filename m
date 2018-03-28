Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 0D4597DD32
	for <lwn-linux-doc@archive.lwn.net>; Wed, 28 Mar 2018 17:57:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753379AbeC1R5O (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 28 Mar 2018 13:57:14 -0400
Received: from mail-qk0-f193.google.com ([209.85.220.193]:44712 "EHLO
        mail-qk0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753220AbeC1R5M (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 28 Mar 2018 13:57:12 -0400
Received: by mail-qk0-f193.google.com with SMTP id o5so3288116qki.11;
        Wed, 28 Mar 2018 10:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=UAGDbe20ZojsQbJ3qz43fa/aeN6/D9HAyTM5kiCvcoA=;
        b=oXj1PPqFo4reg7/8ewGHatvcQr9G05HUOobromLew57aOvZLxmG1jk79Jp/U+bdhsd
         /TD8SwXI4e6gSYnqRqPTFelHqS40xqAm/j1bDHTpftlHJ3aE2k9fTrnp+Azr5FlFhktW
         /7R4WCCBNGew8aLlUhUhWMSoSjYRXyRw40O1oYSTM2AYB8kQFw4oHrsY7HMJG0L/8lwC
         AgPBw6Rhj4e2yFcs8RBXk2zm1VcfpbtpOP6hQaJt2SsJSh5kazsvmFRDcytYJwdNaY0k
         wxWBUTrlQzqLmU43bjDLtvD6NC33d0ZqE3zwdt24xmKNLGq2xqy+pjTNfmrcGRdSMiW4
         ct0Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=UAGDbe20ZojsQbJ3qz43fa/aeN6/D9HAyTM5kiCvcoA=;
        b=ps4G4kbm8e6SjL+FruYkxMm3kCakMJUnAmMvatIHcRw6SvAt19Zz5rYsaZgxOedzsW
         6HDDyhYJFW9d5B5pFTuY53gZJjHi+SncoVK7lgtI3+RPtxEsoY8nu5J0mg3K5X4b530g
         O1IRREq+IuHstQlk0GHtPXxCezLyGdWkStLm/Oh9cJ3Eetrw5MbK8XQK+B7goFjJW6Ph
         PIMSHFC9wfYGTHfRm6P7t12vQblIPTBzYmpgT05AHLlTF+qj1UJhHWmUc76ZweUNNbYr
         jpZa1sILrMhZNSJbEGr+WH1t9g8kSTZZ8ZLYrpX3EBIlknr6JjaRd8kff6ZqkdXiWL7z
         If2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
         :date:message-id:subject:to:cc;
        bh=UAGDbe20ZojsQbJ3qz43fa/aeN6/D9HAyTM5kiCvcoA=;
        b=Flwn9WpqZwA70N6kLqhqtjzznovtoTNvl8Ku32pG7a03pLuAiPeTEqT8+s20IbcXOy
         QqA8KgQObul/PgwmFsa8kwBZcGAnoOZR2A5sc4gFMu3K91mBjhQe07nW4hlul+olk7FH
         4gJbh6yjtQcQjRDCvtAE56McbnIof3dXTwrJ6rmmtv3Qq5M9Y4WW7yxBCgoJ0oGUpUmS
         THtpbZ4Pvod5tXmykjHX6dpUH5pYqAPXxO5DgJ9uikrrfj0mUvC3j79WGG0E1KQIhE7L
         Do24jo9tVrst5OML0MRLSaZmVPTD1akhw0AKz8GM5nBDOLdPwn4Z1QetO3gXFcNOUpRW
         rCVg==
X-Gm-Message-State: AElRT7GdrZ8PIpMfj25qXTQa6xRXNb7ljLhCRsvUG8bj2AC646e5pqMN
        LdNbcyNdWvPQoLu0iAc0DTOrH/xiFvVeEy9YrwA=
X-Google-Smtp-Source: AIpwx4+bfUmqx9z5g6yv/CMkVukOMIdRqd29ndsnQGrft8RnO9X8F6Y2fxLHw/US6aTpPRGhJiNa5pIVnx9rsMxDCKE=
X-Received: by 10.55.140.197 with SMTP id o188mr6505017qkd.230.1522259831914;
 Wed, 28 Mar 2018 10:57:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.200.38.59 with HTTP; Wed, 28 Mar 2018 10:57:11 -0700 (PDT)
In-Reply-To: <c93ed5db-8cfd-1258-3396-62ca2076c44d@codeaurora.org>
References: <1522156287-15169-1-git-send-email-will.deacon@arm.com>
 <20180327150252.GN3675@linux.vnet.ibm.com> <c93ed5db-8cfd-1258-3396-62ca2076c44d@codeaurora.org>
From:   Tony Luck <tony.luck@intel.com>
Date:   Wed, 28 Mar 2018 10:57:11 -0700
X-Google-Sender-Auth: CJ7SUjkr2_1K7Y7WLhcjBOQ8O94
Message-ID: <CA+8MBb+61AhMkbo8xtd3Y0fY8xRUPD+kUsEvWgOz94KGEuovOw@mail.gmail.com>
Subject: Re: [PATCH] docs/memory-barriers.txt: Fix broken DMA vs MMIO ordering example
To:     Sinan Kaya <okaya@codeaurora.org>
Cc:     Paul McKenney <paulmck@linux.vnet.ibm.com>,
        Will Deacon <will.deacon@arm.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-doc@vger.kernel.org,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Arnd Bergmann <arnd@arndb.de>, Jason Gunthorpe <jgg@ziepe.ca>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Mar 28, 2018 at 6:02 AM, Sinan Kaya <okaya@codeaurora.org> wrote:
> +linux-ia64
> Does IA64 follow this requirement? If not, is implementation planned?
>
> "no wmb() before writel()"
>
> Linus asked us to get rid of wmb() in front of writel() for UC memory.
> Just checking that we are not breaking anything for IA64.

We should be OK on ia64, writel() uses a cast to:

 *(volatile unsigned int __force *)

which the compiler takes as a request to use a "st4.rel" instruction
(meaning "store with release semantics"). So the value stored will
be visible to anything that follows.

-Tony
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
