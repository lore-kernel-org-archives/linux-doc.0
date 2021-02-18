Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6070C433DB
	for <linux-doc@archiver.kernel.org>; Thu, 18 Feb 2021 03:22:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6838164E3E
	for <linux-doc@archiver.kernel.org>; Thu, 18 Feb 2021 03:22:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229812AbhBRDWJ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 17 Feb 2021 22:22:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229953AbhBRDWI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 17 Feb 2021 22:22:08 -0500
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7189FC061756
        for <linux-doc@vger.kernel.org>; Wed, 17 Feb 2021 19:21:28 -0800 (PST)
Received: by mail-pf1-x435.google.com with SMTP id k13so317517pfh.13
        for <linux-doc@vger.kernel.org>; Wed, 17 Feb 2021 19:21:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=f/0vhCGqZobTKO2GQ0rt7p/n6rY/SemZLd3m5aOtodk=;
        b=h0gF7phehAUTclXF2zVnETIMlzuvMwmxARNGTmSM+Z0oVQYO2ZiGZ2fYxXloP2Wefh
         eiFU1xGX9kzQClc5v/M9WK0hNnnUqV0LyJGnrM8CzOjgpNV99bETQEgTAjASLw8UUsTm
         7JiiIHk0V9YyIGAB2M3VOgjQepP4J2CXidVZff4FJM6FxMd1z2pxQqeMnzD/HuEBa9/A
         kZ2C8tVLrZYZxOjlQu9VqndlyWQ31DJOOqrDu2CoKFAYdbvpPEXHWnulixaCWAAtcPAg
         V4HdAWwV+x2JqXpy6poASde1FyRVpl0+/R/rAU1MkQSZ36vNLcmAqbB9Kgg+p5VWSCk4
         nb1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=f/0vhCGqZobTKO2GQ0rt7p/n6rY/SemZLd3m5aOtodk=;
        b=W0O9Eoa1vLaY15r2AQx3POjwHQ4DkZbngWN40Htk6yP75HrkZ9FADjSaV6SDN8cVDU
         8ltba6euoivkP0wszrJ5UU8mHO/uS+AwOvmW/ai94TBxm2EoOjhRY7sFmcy4cVazAc4l
         J/2L36iQxwsaNzF6qiZETWWJuRfqez21M+FqJttf3no48IB6Msl5VjVLsNruVDPSCtkV
         vF1vk41LDMnUcXwVhUu8qVzXKMoJhnjHqSe9rMeXtGqKUHhk3cPZOs0+7FhRZsRkBjVe
         UGR62JoKwiu7YCZmvQK+MXy7s6KDu8YBPrYD040fkt4A4alfCM1V558jP0QFx2Bak1Mm
         +D6w==
X-Gm-Message-State: AOAM5304wGXMc9Ckqkd/gR3NFYHxVyJ3DTwDbXK8qK8JmE2MFZtoxyWm
        PsjpiyRlQDGb+CEsEMdgW7iPtUxs6oIG3PWpPAP3ew==
X-Google-Smtp-Source: ABdhPJxemWnjMzG9prnGjQpuiQZv7eNL3cXQ1QRp1RDJ+Dv1Mmwfo7xhdP96xrBLDow3RIJUpuVpgB3LqTBT3h+jY5Y=
X-Received: by 2002:aa7:9790:0:b029:1d8:263e:cc9b with SMTP id
 o16-20020aa797900000b02901d8263ecc9bmr2488898pfp.2.1613618487969; Wed, 17 Feb
 2021 19:21:27 -0800 (PST)
MIME-Version: 1.0
References: <CAMZfGtXgVUvCejpxu1o5WDvmQ7S88rWqGi3DAGM6j5NHJgtdcg@mail.gmail.com>
 <YCpN38i75olgispI@dhcp22.suse.cz> <CAMZfGtUXJTaMo36aB4nTFuYFy3qfWW69o=4uUo-FjocO8obDgw@mail.gmail.com>
 <CAMZfGtWT8CJ-QpVofB2X-+R7GE7sMa40eiAJm6PyD0ji=FzBYQ@mail.gmail.com>
 <YCpmlGuoTakPJs1u@dhcp22.suse.cz> <CAMZfGtWd_ZaXtiEdMKhpnAHDw5CTm-CSPSXW+GfKhyX5qQK=Og@mail.gmail.com>
 <YCp04NVBZpZZ5k7G@dhcp22.suse.cz> <CAMZfGtV8-yJa_eGYtSXc0YY8KhYpgUo=pfj6TZ9zMo8fbz8nWA@mail.gmail.com>
 <YCqhDZ0EAgvCz+wX@dhcp22.suse.cz> <29cdbd0f-dbc2-1a72-15b7-55f81000fa9e@oracle.com>
 <YCzQJIeI+dj9vphw@dhcp22.suse.cz> <f956c39a-6043-6d0e-9f4c-6013f54c2768@oracle.com>
In-Reply-To: <f956c39a-6043-6d0e-9f4c-6013f54c2768@oracle.com>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Thu, 18 Feb 2021 11:20:51 +0800
Message-ID: <CAMZfGtWVSWN0dL+2Dm=7bPSNFyomTQYEijCdd_ThXvArsA04ug@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v15 4/8] mm: hugetlb: alloc the vmemmap
 pages associated with each HugeTLB page
To:     Mike Kravetz <mike.kravetz@oracle.com>,
        Michal Hocko <mhocko@suse.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Thomas Gleixner <tglx@linutronix.de>, mingo@redhat.com,
        bp@alien8.de, x86@kernel.org, hpa@zytor.com,
        dave.hansen@linux.intel.com, luto@kernel.org,
        Peter Zijlstra <peterz@infradead.org>, viro@zeniv.linux.org.uk,
        Andrew Morton <akpm@linux-foundation.org>, paulmck@kernel.org,
        mchehab+huawei@kernel.org, pawan.kumar.gupta@linux.intel.com,
        Randy Dunlap <rdunlap@infradead.org>, oneukum@suse.com,
        anshuman.khandual@arm.com, jroedel@suse.de,
        Mina Almasry <almasrymina@google.com>,
        David Rientjes <rientjes@google.com>,
        Matthew Wilcox <willy@infradead.org>,
        Oscar Salvador <osalvador@suse.de>,
        "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>,
        David Hildenbrand <david@redhat.com>,
        =?UTF-8?B?SE9SSUdVQ0hJIE5BT1lBKOWggOWPoyDnm7TkuZ8p?= 
        <naoya.horiguchi@nec.com>,
        Joao Martins <joao.m.martins@oracle.com>,
        Xiongchun duan <duanxiongchun@bytedance.com>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Feb 18, 2021 at 9:00 AM Mike Kravetz <mike.kravetz@oracle.com> wrote:
>
> On 2/17/21 12:13 AM, Michal Hocko wrote:
> > On Tue 16-02-21 11:44:34, Mike Kravetz wrote:
> > [...]
> >> If we are not going to do the allocations under the lock, then we will need
> >> to either preallocate or take the workqueue approach.
> >
> > We can still drop the lock temporarily right? As we already do before
> > calling destroy_compound_gigantic_page...
> >
>
> Yes we can.  I forgot about that.
>
> Actually, very little of what update_and_free_page does needs to be done
> under the lock.  Perhaps, just decrementing the global count and clearing
> the destructor so PageHuge() is no longer true.

Right. I have another question about using GFP flags. Michal
suggested using GFP_KERNEL instead of GFP_ATOMIC to
save reserve memory. From your last email, you suggested
using non-blocking allocation GFP flags (perhaps GFP_NOWAIT).

Hi Mike and Michal,

What is the consensus we finally reached? Thanks.
