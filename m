Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A30EC5519F
	for <linux-doc@archiver.kernel.org>; Wed, 18 Nov 2020 03:28:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2A73E21D7E
	for <linux-doc@archiver.kernel.org>; Wed, 18 Nov 2020 03:28:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.b="Z0Pooym/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726544AbgKRD2g (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 17 Nov 2020 22:28:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725613AbgKRD2g (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 17 Nov 2020 22:28:36 -0500
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAF9FC0613D4
        for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2020 19:28:34 -0800 (PST)
Received: by mail-pf1-x442.google.com with SMTP id q10so549059pfn.0
        for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2020 19:28:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vnppsZ7cWIbTMEPsAbpATqFowYN5orqZc7MbBDjuppY=;
        b=Z0Pooym/oNFad9Fe/S4QBekCIl4pMLqIVpkTAhSBjg8q8MTG2Hs2M2yTtaycmXUXMB
         DCWzShQbQD9VmvWsQar+Ba/TElkxIPONZ2xofnFJio2KvPpZU+7BpCOc3foRauQMCAQR
         b4qMuD8ipbbNSmgB2zuq4ltocv8d/92XOLEIg+9BURbLZVuJnhTCbpVcXpGJeLE23Zsh
         mNP5Yciiw7lqdZ7FmXJSDoSJDfTPZi9HzUNzYUiNSJMOKHyN0axH+F6Zbxsqf8864OlL
         BptbzgToMZ9iYyY2bFLg/dsjLr3/UvVWv1JYOMp3vP0raDRG2vtMfNH6Xq166w7wxiku
         AXiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vnppsZ7cWIbTMEPsAbpATqFowYN5orqZc7MbBDjuppY=;
        b=Whvu3Hlzr1ocCY0fs03u7geGNBVLX1d2RmsZVqWlUI4GoL49fv/dSO/O8IwcgoTnzR
         uwKAfPoaOM0roiUgMVEa0gHiipqQ12ZPvFAkeAc2XGLV1ELeG1lQajhXO2nIjMDuXCoR
         dR49MTTHISYWIeftseYd1nSH1vNJNEvJ9DmIKIBRNebZ5dTjCPWhYWHuZvCGFaSiCXa2
         QIYPSwwkOJTM2k6v6PW2Aprp2nln4i2XM7Q0V/grwipOglvNsbFce4ShhcBlyau5BAie
         dFkTGoDNoxOWWE/D3d+M23Pt/6qYhhCXKSkpc7Z93dgZFN8ugUryPNDd5bT33Hk4mdl1
         v/hA==
X-Gm-Message-State: AOAM530UbQ1Bimn5msUC9ugt1kqAeR5rL6VA10ixKO9FnLQ2BfEhY7br
        x+1xWE2oKjKR9eqLtHLz9Nstw+iG7hZ8lp+YDj+3HQ==
X-Google-Smtp-Source: ABdhPJxFg2bZDDYdW5cu+c+X8qxklQebDNJ6tYNq3D6DCb4Egzt6LNdC6SdIChwp4gckYFi19M+npXEa9Q6dvYouWMU=
X-Received: by 2002:a62:e116:0:b029:18b:d325:153f with SMTP id
 q22-20020a62e1160000b029018bd325153fmr2647216pfh.2.1605670114278; Tue, 17 Nov
 2020 19:28:34 -0800 (PST)
MIME-Version: 1.0
References: <20201113105952.11638-1-songmuchun@bytedance.com>
 <349168819c1249d4bceea26597760b0a@hisilicon.com> <CAMZfGtUVDJ4QHYRCKnPTkgcKGJ38s2aOOktH+8Urz7oiVfimww@mail.gmail.com>
 <714ae7d701d446259ab269f14a030fe9@hisilicon.com> <CAMZfGtWNa=abZdN6HmWE1VBFHfGCbsW9D0zrN-F5zrhn6s=ErA@mail.gmail.com>
 <d04fdbf6c955054fddb152c78bc53db6@suse.de>
In-Reply-To: <d04fdbf6c955054fddb152c78bc53db6@suse.de>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Wed, 18 Nov 2020 11:27:50 +0800
Message-ID: <CAMZfGtWMF7ZbPHOZg69VNNO0oiVf=i3pAEVmwsmV32wpbAHYxw@mail.gmail.com>
Subject: Re: [External] RE: [PATCH v4 00/21] Free some vmemmap pages of
 hugetlb page
To:     Oscar Salvador <osalvador@suse.de>
Cc:     "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>,
        Jonathan Corbet <corbet@lwn.net>,
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
        Xiongchun duan <duanxiongchun@bytedance.com>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Nov 18, 2020 at 3:45 AM Oscar Salvador <osalvador@suse.de> wrote:
>
> On 2020-11-17 17:29, Muchun Song wrote:
> > Now for the 2MB HugrTLB page, we only free 6 vmemmap pages.
> > But your words woke me up. Maybe we really can free 7 vmemmap
> > pages. In this case, we can see 8 of the 512 struct page structures
> > has beed set PG_head flag. If we can adjust compound_head()
> > slightly and make compound_head() return the real head struct
> > page when the parameter is the tail struct page but with PG_head
> > flag set. I will start an investigation and a test.
>
> I would not overcomplicate things at this stage, but rather keep it
> simple as the code is already tricky enough(without counting the LOC
> thatvit adds).
> We can always build on top later on in order to improve things.

I think that this improvement can be a separate patch. In this case,
it can make the code evolution route clearer.

Thanks.


>
> --
> Oscar Salvador
> SUSE L3



-- 
Yours,
Muchun
