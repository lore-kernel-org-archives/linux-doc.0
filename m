Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6515A7E22E
	for <lwn-linux-doc@archive.lwn.net>; Wed,  2 May 2018 17:25:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751154AbeEBRZU (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 2 May 2018 13:25:20 -0400
Received: from mail-it0-f45.google.com ([209.85.214.45]:52698 "EHLO
        mail-it0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750942AbeEBRZS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 2 May 2018 13:25:18 -0400
Received: by mail-it0-f45.google.com with SMTP id i136-v6so9511521ita.2
        for <linux-doc@vger.kernel.org>; Wed, 02 May 2018 10:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=iy/QIicasq+EO8o2dAfPPMdQcTfRaxi+FJzYj6CZJfE=;
        b=vG26IieNHIsw9TyrxtWnlg+p+Q1h18EIlEt29YspRoeyTJs0AdOo5gl5E9CoGPU6fj
         Yyg74kBUy+wiLe08DmbHnxvWmQsZZkxCSyEEadDZffdKVXQHxpxEgL0ptCMOhLkxGnNe
         9khugtDktk0KRRD0PrvbUQn/tkNvTn9Hxjg3uG+ReBULKbR7Fj8DtsaAG1JvH1H/+nzj
         KyawbCJ3y9FW2A6Fl9Cm6czeQqHar8EPTiMG1vck6V1eIU51uOoRVVSTd/rtpzSTloTf
         Z4ogXeq/qoNrOaJpWUqDGnC9+Su4jnvgsuCSARhzNJ6JwF0wJByQvuNRRmL8ma0bQDXV
         WBZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=iy/QIicasq+EO8o2dAfPPMdQcTfRaxi+FJzYj6CZJfE=;
        b=Pyjf0P+7E3HozbjgEijRHx2S00ANogR/oMYclRsGsTzfspkQv9wLy+UALFJmA7XOuP
         EV7sy10tP5BPrueMBUuvcHnGmQD0FsRWu636AL/D4W3NN0BgtNaEz42l9FzSbA/1cyDV
         odWBugx2Ye48/O1fHaCBp3hnxM+n4sjUG20N61edTT+nTPuT14r9JqnTnusT+zd6LhnR
         s9MCa7unYJMmq4lgtrFGIkW39tOD1P70oLpsNqoJf8tnckOaFQ0M7sBeix8eh0BRtKWL
         /pb8tV/Wl+ADCe4j3+2qM2tbCegHFAzewJplQaE2UaeLSdDLDmbzFsgmVpMJl939lG2w
         WmSQ==
X-Gm-Message-State: ALQs6tA2oiihhSoD+Gs5N9FVAhPKp9O3FUX9L6+PgluPP3T7Y+kqc11i
        FY9xD0UFn6AZGOAfxBHMMVWLMYvpcD1gwsqudKrQbw==
X-Google-Smtp-Source: AB8JxZro+x4E6etcw1aZ5rFdnvE4dKyQmOHUddiV9UPnUQubVgGNeekDC28ddc2Wg5AkujCNYkO0sCo7f/+KWZpJ2M8=
X-Received: by 2002:a24:b915:: with SMTP id w21-v6mr21279171ite.53.1525281918050;
 Wed, 02 May 2018 10:25:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a02:6658:0:0:0:0:0 with HTTP; Wed, 2 May 2018 10:25:17 -0700 (PDT)
In-Reply-To: <20180502153645.fui4ju3scsze3zkq@black.fi.intel.com>
References: <cover.1524077494.git.andreyknvl@google.com> <0db34d04fa16be162336106e3b4a94f3dacc0af4.1524077494.git.andreyknvl@google.com>
 <20180426174714.4jtb72q56w3xonsa@armageddon.cambridge.arm.com>
 <CAAeHK+zY8p9E4FZa7mbdgR=wR0u-RDS552dn=h9fKRC-ArYLdw@mail.gmail.com> <20180502153645.fui4ju3scsze3zkq@black.fi.intel.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Wed, 2 May 2018 19:25:17 +0200
Message-ID: <CAAeHK+yTbmZfkeNbqbo+J90zsjsM99rwnYBGfQBxphHMMfgD7A@mail.gmail.com>
Subject: Re: [PATCH 4/6] mm, arm64: untag user addresses in mm/gup.c
To:     "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
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
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, May 2, 2018 at 5:36 PM, Kirill A. Shutemov
<kirill.shutemov@linux.intel.com> wrote:
> On Wed, May 02, 2018 at 02:38:42PM +0000, Andrey Konovalov wrote:
>> > Does having a tagged address here makes any difference? I couldn't hit a
>> > failure with my simple tests (LD_PRELOAD a library that randomly adds
>> > tags to pointers returned by malloc).
>>
>> I think you're right, follow_page_mask is only called from
>> __get_user_pages, which already untagged the address. I'll remove
>> untagging here.
>
> It also called from follow_page(). Have you covered all its callers?

Oh, missed that, will take a look.

Thinking about that, would it make sense to add untagging to find_vma
(and others) instead of trying to cover all find_vma callers?
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
