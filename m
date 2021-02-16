Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CD55C433E6
	for <linux-doc@archiver.kernel.org>; Tue, 16 Feb 2021 09:05:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 437FB64DCF
	for <linux-doc@archiver.kernel.org>; Tue, 16 Feb 2021 09:05:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229896AbhBPJFU (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 16 Feb 2021 04:05:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229722AbhBPJE7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 16 Feb 2021 04:04:59 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 438B5C061788
        for <linux-doc@vger.kernel.org>; Tue, 16 Feb 2021 01:04:19 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id gx20so5536913pjb.1
        for <linux-doc@vger.kernel.org>; Tue, 16 Feb 2021 01:04:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Hix40Xj1oUuEJXyWgpErtznzZizVsi/XpFAKnYjHmQY=;
        b=eCXmzNSbiTk7i4WkXniq28m9G37QrlWzW+DY39V8ZNK5WTP7spj9JBNl/75AUeXslS
         pJixcJGyqDLo4/gX0Lkr+1LUgrtreYH6pDPPHtbPLnLkeQx/1x9tDVzu0zNv77WPe+uF
         QM23Y4vse2SXdXjhaYvzlAGwnbVJnKqbsBbszex9XCw8oV+SmfE5m6RQXxoFgr5eVZn/
         qINrIHGW1sADmAiL0WIfXKeZ8p6SxtIV13mV/bwjr35huaocQRV4X7kDW1oPkdZE79ZV
         Nbja5Hzu2TLV6H4VkmcjRP+LCxUc2OcC22SZjbz8IJ8OdTlvir4xzCcY9KhtszgDIiwM
         fSOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Hix40Xj1oUuEJXyWgpErtznzZizVsi/XpFAKnYjHmQY=;
        b=s9JPewLEQa6shWv3huHAJgvmsg9ZVEIJYonhHpv99Hs1TTZXu+iAEZHi3NZlhVl1vV
         VmlJJDRgu2C+LCUoQrRBre9Cd6rd7DPCKnX/1+rFtZRkvZLFc1dLcOlaxct0GlMPP2cE
         VAsbMUPC8QgkCOEw3Ani8SF5Kw8QDWKrGpIlWWZRe2ewPwWbOAx0Bixr6YuzIg0304Ex
         Yw3UcEAw22x9ynCDXy5NiZX5StFeLN5ydYN3m335OvvGBO/9xLBYMNVPizyJ5aiIuCTN
         NsmMxHh3HcM6M72Zd1B46Jf5dOnQXGYguNeUgbxv+RJDELA9jJX8bvQmXWenJ3zDdhqr
         zMHA==
X-Gm-Message-State: AOAM531qnL00IBfKIuRtBIAmv6DSn+7IA0IOakZv1dg4B0zCMKkzCuvO
        IcXZQ+dqofmkgdQ8qVXdLCfx9LHotB08q1GYpvBjxg==
X-Google-Smtp-Source: ABdhPJwC+CdCVmurJuKhxiNJoI3GMzP36B8CJFWc2NOLZbqlE1QsTOfDQR+oZ/rFDU9LQIN8Yydx6cwaPCiXV/F65I8=
X-Received: by 2002:a17:90b:286:: with SMTP id az6mr1469474pjb.147.1613466258888;
 Tue, 16 Feb 2021 01:04:18 -0800 (PST)
MIME-Version: 1.0
References: <CAMZfGtWT8CJ-QpVofB2X-+R7GE7sMa40eiAJm6PyD0ji=FzBYQ@mail.gmail.com>
 <YCpmlGuoTakPJs1u@dhcp22.suse.cz> <CAMZfGtWd_ZaXtiEdMKhpnAHDw5CTm-CSPSXW+GfKhyX5qQK=Og@mail.gmail.com>
 <YCp04NVBZpZZ5k7G@dhcp22.suse.cz> <CAMZfGtV8-yJa_eGYtSXc0YY8KhYpgUo=pfj6TZ9zMo8fbz8nWA@mail.gmail.com>
 <YCqhDZ0EAgvCz+wX@dhcp22.suse.cz> <CAMZfGtW6n_YUbZOPFbivzn-HP4Q2yi0DrUoQ3JAjSYy5m17VWw@mail.gmail.com>
 <CAMZfGtWVwEdBfiof3=wW2-FUN4PU-N5J=HfiAETVbwbEzdvAGQ@mail.gmail.com>
 <YCrN4/EWRTOwNw72@dhcp22.suse.cz> <CAMZfGtX8xizYQxwB_Ffe6VcesaftkzGPDr=BP=6va_=aR3HikQ@mail.gmail.com>
 <YCt/N9LkJT1VJEW1@dhcp22.suse.cz>
In-Reply-To: <YCt/N9LkJT1VJEW1@dhcp22.suse.cz>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Tue, 16 Feb 2021 17:03:42 +0800
Message-ID: <CAMZfGtVLv7_7sRO0tXiVY_RuAWxTEHz6G=-r7mOXViNhRNPf5A@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v15 4/8] mm: hugetlb: alloc the vmemmap
 pages associated with each HugeTLB page
To:     Michal Hocko <mhocko@suse.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Mike Kravetz <mike.kravetz@oracle.com>,
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
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Feb 16, 2021 at 4:15 PM Michal Hocko <mhocko@suse.com> wrote:
>
> On Tue 16-02-21 12:34:41, Muchun Song wrote:
> > On Tue, Feb 16, 2021 at 3:39 AM Michal Hocko <mhocko@suse.com> wrote:
> [...]
> > > > Using GFP_KERNEL will also use the current task cpuset to allocate
> > > > memory. Do we have an interface to ignore current task cpuset=EF=BC=
=9FIf not,
> > > > WQ may be the only option and it also will not limit the context of
> > > > put_page. Right?
> > >
> > > Well, GFP_KERNEL is constrained to the task cpuset only if the said
> > > cpuset is hardwalled IIRC. But I do not see why this is a problem.
> >
> > I mean that if there are more than one node in the system,
> > but the current task cpuset only allows one node.
>
> How would that cpuset get a huge pages from a node which is not part of
> the cpuset? Well, that would be possible if the cpuset was dynamic but I
> am not sure that such a configuration would be very sensible along with
> hardwall setup.

Got it. I didn't realize this before. Thanks.

>
> > If current
> > node has no memory and other nodes have enough memory.
> > We can fail to allocate vmemmap pages. But actually it is
> > suitable to allocate vmemmap pages from other nodes.
> > Right?
>
> Falling back to a different node would be very suboptimal because then
> you would have vmemmap back by remote pages. We do not want that.
> --
> Michal Hocko
> SUSE Labs
