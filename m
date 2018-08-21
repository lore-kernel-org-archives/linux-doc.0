Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A6A2E7D2EE
	for <lwn-linux-doc@archive.lwn.net>; Tue, 21 Aug 2018 05:20:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726413AbeHUIir (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 21 Aug 2018 04:38:47 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:48351 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726175AbeHUIir (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 21 Aug 2018 04:38:47 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 646162201E;
        Tue, 21 Aug 2018 01:20:11 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Tue, 21 Aug 2018 01:20:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
        :content-type:date:from:in-reply-to:message-id:mime-version
        :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=i1aQU6XCDoLlpyev6bF/32X5wqj1ViEBwNg/r7ev864=; b=xAFqQcyl
        XxBLL2s7cl15xk8lNOCploHv5q+QT0lITUS412HlJsBAkAgsZUSShKDZV7OPxTGj
        QGqGkGBSz337X74sa8Mc2YNhHvxTHuuQSaze01ImzzIwKz4TbtYkCV2cVUtYxafA
        tWAI7o6Vhg+NMbssnXK0DgRbxsOW8HuyWE2hfh8zr19GlYNQn+PK3GliBacBkBLw
        LbqaPpTY5/gZH+PUE4Z3qicrajPucNtbaIccSaAkJHmcpH4SD03lhNa9NWvUhChJ
        q1RCL6kWeywC1nex40lu/InAAF9QCQ9OpF4aTWqyNJRlXMMLw+/nwsyYZwaRhrbZ
        Z5rdtkJEsOmGCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-sender
        :x-me-sender:x-sasl-enc; s=fm3; bh=i1aQU6XCDoLlpyev6bF/32X5wqj1V
        iEBwNg/r7ev864=; b=QCts/NBOTy4JI8Ozq4gNr9/CJW/dHPujpssYqHAmiQv00
        vBoM+sOAZ6S5xZvaSPNqcWxV9IKs9zKugp20gyvdpztrJ5E81+R/QNwGdEDQ+O9H
        Hj0xHd8Z+bsE0z3eUeC0G2PQdVy5cDRNTIl9JV5XKlsDZr0seHbFcqP71p7IZs4d
        iKby/muwaA/mRVg4oOOaZI85HTMvIhrPu2aw0Clf1VX/UucJBO+B8yhgcqqbpZIh
        g8wV3VXbM2Wjss6NsjYK1FNcMW1a7fMr5/VWidSV+IyITMCP/NkgZwsx3FQVehzN
        Leb9EWXLfc6LDWMJPnws0CTKvI5P/L2YBRt/+2+Nw==
X-ME-Proxy: <xmx:B6F7Wy92pmRXbxfbzKQqJqp9qTCgeZHNRNLC0hdgjf2uQ741pzCzWw>
    <xmx:B6F7W93uzKU9yiD8X8Md42nJ-xLEGnDemijbWkm8svvDFk4fZi3t0w>
    <xmx:B6F7W3aGceURFZTurPXj2rEhiVk_CELpQjIgSLdsA-OFGaqGO8UNZQ>
    <xmx:B6F7W5syfu_qSXz2U_IrweoFXcSZkltaw5kJ0QXEM0qdiqEWfC_lGQ>
    <xmx:B6F7W-B3TnmDEJxgyyUnQFCLruB24xGJKNc62ElnZhms3tSxUg_b_w>
    <xmx:C6F7WyxSdBG0OQ2A3_ONa0UtO5E0P8LpMXeOdnlUxznxUQWY9m53Zw>
X-ME-Sender: <xms:B6F7W3Ak6mgTMC5rOOjsES5g-abpO4A3w-21lYdQ3zR02VCFNUUOzA>
Received: from localhost (5355525a.cm-6-6b.dynamic.ziggo.nl [83.85.82.90])
        by mail.messagingengine.com (Postfix) with ESMTPA id 6D2DCE4626;
        Tue, 21 Aug 2018 01:20:05 -0400 (EDT)
Date:   Tue, 21 Aug 2018 07:20:00 +0200
From:   Greg KH <greg@kroah.com>
To:     Andi Kleen <andi@firstfloor.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        stable <stable@vger.kernel.org>, Andi Kleen <ak@linux.intel.com>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        Alexander Potapenko <glider@google.com>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Andrew Lutomirski <luto@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>,
        Brijesh Singh <brijesh.singh@amd.com>,
        Dave Young <dyoung@redhat.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
        Larry Woodman <lwoodman@redhat.com>,
        Matt Fleming <matt@codeblueprint.co.uk>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>,
        Rik van Riel <riel@redhat.com>,
        Toshi Kani <toshi.kani@hpe.com>,
        kasan-dev <kasan-dev@googlegroups.com>,
        KVM list <kvm@vger.kernel.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        linux-efi <linux-efi@vger.kernel.org>,
        linux-mm <linux-mm@kvack.org>, Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH] x86/mm: Simplify p[g4um]d_page() macros
Message-ID: <20180821052000.GB23615@kroah.com>
References: <20180820203705.16212-1-andi@firstfloor.org>
 <20180820203705.16212-2-andi@firstfloor.org>
 <CA+55aFyo_MFz2Qg3pEbLMf3zhvAQbpZf3mQf98bTRJx28drbeQ@mail.gmail.com>
 <20180820220422.7qrayn7wivmejr24@two.firstfloor.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180820220422.7qrayn7wivmejr24@two.firstfloor.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Aug 20, 2018 at 03:04:23PM -0700, Andi Kleen wrote:
> On Mon, Aug 20, 2018 at 02:57:39PM -0700, Linus Torvalds wrote:
> > On Mon, Aug 20, 2018 at 1:37 PM Andi Kleen <andi@firstfloor.org> wrote:
> > >
> > > From: Andi Kleen <ak@linux.intel.com>
> > >
> > > Create a pgd_pfn() macro similar to the p[4um]d_pfn() macros and then
> > > use the p[g4um]d_pfn() macros in the p[g4um]d_page() macros instead of
> > > duplicating the code.
> > 
> > When doing backports, _please_ explicitly specify which commit this is
> > upstream too.
> 
> Ok.
> 
> > 
> > Also, the original upstream patch is credited to Tom Lendacky.
> 
> Okay.
> 
> > 
> > Or is there something I'm not seeing, and this is different from
> > commit fd7e315988b7 ("x86/mm: Simplify p[g4um]d_page() macros")?
> 
> No it's Tom's patch just ported to the older tree with some minor
> changes. I just fat fingered it while doing the commit

Ok, I've fixed this up by hand now, please be more careful next time.

greg k-h
