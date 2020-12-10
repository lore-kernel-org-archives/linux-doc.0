Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E3E0C433FE
	for <linux-doc@archiver.kernel.org>; Thu, 10 Dec 2020 16:21:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1825A23D56
	for <linux-doc@archiver.kernel.org>; Thu, 10 Dec 2020 16:21:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388251AbgLJQVL (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 10 Dec 2020 11:21:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729345AbgLJQVH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 10 Dec 2020 11:21:07 -0500
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E28B4C0613CF
        for <linux-doc@vger.kernel.org>; Thu, 10 Dec 2020 08:20:26 -0800 (PST)
Received: by mail-pf1-x443.google.com with SMTP id p4so4565852pfg.0
        for <linux-doc@vger.kernel.org>; Thu, 10 Dec 2020 08:20:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gOoShQoy2wQXY3FUgpRmJNV81X7XkJlcJzzP39yH8B4=;
        b=LQDH7cHHyuvDFABjfdf9FCcJAaWrzP3BR5lBscpduE8+d/2f9mGS6XkaQKV0I60pqs
         dNpfH8d0p1VK1cyAjKTaqlC5y3T808RJwN9j3zhRg/y9AEzktUHWw3XIMzzOnQGlkIMb
         b4zsyh1x5M7w/lo/hNoZWTX6mjHZvhogI5SyMNajkwzm79JnfCyDV9rN3geEZVvVO0PE
         QuKQKh6TyvxlTr7Gc0QAKbe5kd3kwVS0eqIVfQ5F6V17xzPNzcJ0t2jmgEzR1W50cgBC
         t91uBNVmv8sHk1Lu39R8Dk2cdY6wbDcZ+k//sf9r0sxS5O3DnV4bQebIkJxjkwuBXsuK
         +P6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gOoShQoy2wQXY3FUgpRmJNV81X7XkJlcJzzP39yH8B4=;
        b=L4jbirYlCIbGehjGYNtRWQ1gNhQlKrA3G4z5MqNFlRVyE3oJVwry0f9d7kFDaOo1gt
         It/FOkqKx4WZBPIeIW9/ZD+1WzGFhLuyaThucE37Hh2jiNKeGJ6fi9uy8jfrwBJNwoOM
         nlS/AZkNKih0pMrMZ2hFLqLARgnSxTomJDK0ATbKj2sKx6RACqjj0r4XTovYlRuqDTUO
         6Zd2jsDBsAEyz88edgA3BihBHU3qzgYt2DrvtGuDaPNu7AsDmKPj6jW7z7tL1ps3Rs4s
         QFMRt60Mv37AmPeSjXGst0qiQh06U9M9gGI1JHO/ARnMeUWljXGqIFloTIkiMCnrcSiQ
         boRQ==
X-Gm-Message-State: AOAM5336k5Kc3Q73C8HWIpzn2H/wozpvvHTkSJeLWU8cqCqTt2nydlVz
        UsNRa+090QzricjGAULCHWHHKlwtr0/gpogJVaaFbA==
X-Google-Smtp-Source: ABdhPJyFWG17IHNoAP1Thl1Hpjqvi91RsLyQZI9OQ0R4iCDqarpGl7qDkLFnU7RvxsSo3ZJbFWt8ym48Dt8Rp1jptMQ=
X-Received: by 2002:a62:4e4e:0:b029:19e:aaab:8be with SMTP id
 c75-20020a624e4e0000b029019eaaab08bemr5287563pfb.59.1607617226427; Thu, 10
 Dec 2020 08:20:26 -0800 (PST)
MIME-Version: 1.0
References: <20201210035526.38938-1-songmuchun@bytedance.com>
 <20201210035526.38938-13-songmuchun@bytedance.com> <375d6bad6bb37e3626f71bfabc20b384@suse.de>
 <CAMZfGtUQOXmuRumv48MYGCYh_JZn4bMPPz8HW2ExgTPCfFMMnw@mail.gmail.com>
 <20201210131608.GA7811@localhost.localdomain> <CAMZfGtX842XJC+C_OeptH4Ru_Q-qV1=5vCq_PgPJmuyTGKO_rg@mail.gmail.com>
In-Reply-To: <CAMZfGtX842XJC+C_OeptH4Ru_Q-qV1=5vCq_PgPJmuyTGKO_rg@mail.gmail.com>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Fri, 11 Dec 2020 00:19:50 +0800
Message-ID: <CAMZfGtUH00bxOptddY0i2Zt2HJsy8C-QgN0aqXGOi=u4-f_MjQ@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v8 12/12] mm/hugetlb: Optimize the code
 with the help of the compiler
To:     Oscar Salvador <osalvador@suse.de>
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
        Michal Hocko <mhocko@suse.com>,
        "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>,
        David Hildenbrand <david@redhat.com>,
        Xiongchun duan <duanxiongchun@bytedance.com>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Dec 10, 2020 at 9:29 PM Muchun Song <songmuchun@bytedance.com> wrote:
>
> On Thu, Dec 10, 2020 at 9:16 PM Oscar Salvador <osalvador@suse.de> wrote:
> >
> > On Thu, Dec 10, 2020 at 08:14:18PM +0800, Muchun Song wrote:
> > > Yeah, you are right. But if we do this check can make the code simple.
> > >
> > > For example, here is a code snippet.
> > >
> > > void func(void)
> > > {
> > >         if (free_vmemmap_pages_per_hpage())
> > >                 return;
> > >         /* Do something */
> > > }
> > >
> > > With this patch, the func will be optimized to null when is_power_of_2
> > > returns false.
> > >
> > > void func(void)
> > > {
> > > }
> > >
> > > Without this patch, the compiler cannot do this optimization.
> >
> > Ok, I misread the changelog.
> >
> > So, then is_hugetlb_free_vmemmap_enabled, free_huge_page_vmemmap,
> > free_vmemmap_pages_per_hpage and hugetlb_vmemmap_init are optimized
> > out, right?
>
> Yes, that's right. I have disassembled to make sure of this. Thanks.

Hi Oscar,

Because this is an optimization for code, I leave it in this
separate patch. Do you still suggest squash this with
patch#10? Thanks.

>
> >
> > --
> > Oscar Salvador
> > SUSE L3
>
>
>
> --
> Yours,
> Muchun



-- 
Yours,
Muchun
