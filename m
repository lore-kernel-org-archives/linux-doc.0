Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	RCVD_IN_SORBS_WEB,T_DKIM_INVALID autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C6D2E7E679
	for <lwn-linux-doc@archive.lwn.net>; Thu,  3 May 2018 15:24:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751196AbeECPYe (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 3 May 2018 11:24:34 -0400
Received: from mail-lf0-f52.google.com ([209.85.215.52]:34787 "EHLO
        mail-lf0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751137AbeECPYd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 3 May 2018 11:24:33 -0400
Received: by mail-lf0-f52.google.com with SMTP id h4-v6so26599201lfc.1
        for <linux-doc@vger.kernel.org>; Thu, 03 May 2018 08:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shutemov-name.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Fu0dqtOQYCvqgLFGrs4lPTfH7EQrDai8s2KxRnVzuIE=;
        b=awCjdz1qgWuFkZsf7J09bagQ1wvxFKq5UgkckqnvneiOupmadN4reXAgNHzq2XQhGi
         aD/t6ULiHJChatLC9hU/4/h11T3gbo/c+wt2ju4PGFtojluRwl6uXUaxhyiOIZuE7dsG
         6T73T5CoPzPIbYA8ELcFT9+PxCktDuaVMw/HkqiiPDPjOoK57agIqfohaBsKx1Ui4aSg
         nOLWWVRR+mqsUF+JlxAjor7wqHlMqQH7wGMUpxIRd+owub9dZG33g20TJowq/ehTHdZu
         ahaUgLyqn1K80yRXsalZvjbZJ5rNzpGhHxZ+f0VY4j1woi/bfEkFI4ptbQuG3HBZ4Zfn
         U37w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Fu0dqtOQYCvqgLFGrs4lPTfH7EQrDai8s2KxRnVzuIE=;
        b=nNLGY746jAiV2kdWHWrDZgO/uTfy58/xnIMIInxqN82z4ew420K2fUyoUyQooCEgSw
         sQgETZ3du3SDyf3cNzyBY92aOMfJrZ0eIPXiBILKOLWDYUdiX1b2vi4bCyZbeByHXoFI
         nyx+Ef/ZlaBMPsjv9x5LmvKs66NQkC1eqTu5PSnSFUcu9feexQxVxUilp0Xr6ViPQ4E8
         n9YN7PLiFY2dQ6jcb1sdRRl45UXgmqC6ntiNINpHJqxXuMPDR6jTCezRpJLZXJoahCEf
         TXlMmMz/+OSoWa1/FtigBNYm+3HHIWAox48ukuW9p2RiITkLO7xm+ukDLC6PQZ667nwf
         O+gA==
X-Gm-Message-State: ALQs6tB5M1GQ6vkUF7iFKeqVrC/DvT1cX8BrmV0fgENarHDAG4cuMEL7
        BgsvH8rc8Td1kn7EL3Al9Ii9RQ==
X-Google-Smtp-Source: AB8JxZpnvCkbx0rrQooi1G7FCEIVj/Mx2wGcFr4rWglc3Bu1nIEgpw6NV4Zq+9S3VvMO0CHBDKtA1A==
X-Received: by 2002:a2e:88d7:: with SMTP id a23-v6mr5153804ljk.117.1525361071547;
        Thu, 03 May 2018 08:24:31 -0700 (PDT)
Received: from kshutemo-mobl1.localdomain ([178.124.222.164])
        by smtp.gmail.com with ESMTPSA id j1-v6sm341987ljg.48.2018.05.03.08.24.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 May 2018 08:24:30 -0700 (PDT)
Received: by kshutemo-mobl1.localdomain (Postfix, from userid 1000)
        id 0BB463003A2; Thu,  3 May 2018 18:24:33 +0300 (+03)
Date:   Thu, 3 May 2018 18:24:32 +0300
From:   "Kirill A. Shutemov" <kirill@shutemov.name>
To:     Andrey Konovalov <andreyknvl@google.com>
Cc:     "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Mark Rutland <mark.rutland@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        James Morse <james.morse@arm.com>,
        Kees Cook <keescook@chromium.org>,
        Bart Van Assche <bart.vanassche@wdc.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Philippe Ombredanne <pombredanne@nexb.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Ingo Molnar <mingo@kernel.org>,
        Dan Williams <dan.j.williams@intel.com>,
        "Aneesh Kumar K . V" <aneesh.kumar@linux.vnet.ibm.com>,
        Zi Yan <zi.yan@cs.rutgers.edu>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        Jacob Bramley <Jacob.Bramley@arm.com>,
        Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
        Lee Smith <Lee.Smith@arm.com>,
        Kostya Serebryany <kcc@google.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
        Evgeniy Stepanov <eugenis@google.com>
Subject: Re: [PATCH 4/6] mm, arm64: untag user addresses in mm/gup.c
Message-ID: <20180503152432.q742zvdbv6xtvo34@kshutemo-mobl1>
References: <cover.1524077494.git.andreyknvl@google.com>
 <0db34d04fa16be162336106e3b4a94f3dacc0af4.1524077494.git.andreyknvl@google.com>
 <20180426174714.4jtb72q56w3xonsa@armageddon.cambridge.arm.com>
 <CAAeHK+zY8p9E4FZa7mbdgR=wR0u-RDS552dn=h9fKRC-ArYLdw@mail.gmail.com>
 <20180502153645.fui4ju3scsze3zkq@black.fi.intel.com>
 <CAAeHK+yTbmZfkeNbqbo+J90zsjsM99rwnYBGfQBxphHMMfgD7A@mail.gmail.com>
 <CAAeHK+zh0LSpq2VFJeHrV7AETnL1b9R+yex3iPMg5SetbEyxwg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAeHK+zh0LSpq2VFJeHrV7AETnL1b9R+yex3iPMg5SetbEyxwg@mail.gmail.com>
User-Agent: NeoMutt/20180323
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, May 03, 2018 at 04:09:56PM +0200, Andrey Konovalov wrote:
> On Wed, May 2, 2018 at 7:25 PM, Andrey Konovalov <andreyknvl@google.com> wrote:
> > On Wed, May 2, 2018 at 5:36 PM, Kirill A. Shutemov
> > <kirill.shutemov@linux.intel.com> wrote:
> >> On Wed, May 02, 2018 at 02:38:42PM +0000, Andrey Konovalov wrote:
> >>> > Does having a tagged address here makes any difference? I couldn't hit a
> >>> > failure with my simple tests (LD_PRELOAD a library that randomly adds
> >>> > tags to pointers returned by malloc).
> >>>
> >>> I think you're right, follow_page_mask is only called from
> >>> __get_user_pages, which already untagged the address. I'll remove
> >>> untagging here.
> >>
> >> It also called from follow_page(). Have you covered all its callers?
> >
> > Oh, missed that, will take a look.
> 
> I wasn't able to find anything that calls follow_page with pointers
> passed from userspace except for the memory subsystem syscalls, and we
> deliberately don't add untagging in those.

I guess I missed this part, but could you elaborate on this? Why?
Not yet or not ever?

Also I wounder if we can find (with sparse?) all places where we cast out
__user. This would give a nice list of places where to pay attention.

-- 
 Kirill A. Shutemov
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
