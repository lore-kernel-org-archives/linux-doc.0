Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD4D9C433F5
	for <linux-doc@archiver.kernel.org>; Fri,  5 Nov 2021 16:41:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B6B4D6125F
	for <linux-doc@archiver.kernel.org>; Fri,  5 Nov 2021 16:41:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233826AbhKEQoG (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 5 Nov 2021 12:44:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233079AbhKEQoG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 5 Nov 2021 12:44:06 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FCE1C061714
        for <linux-doc@vger.kernel.org>; Fri,  5 Nov 2021 09:41:26 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id e65so8833175pgc.5
        for <linux-doc@vger.kernel.org>; Fri, 05 Nov 2021 09:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5amwjTWIRqLe2fTBGlO6hAxlM9gBL72qHsZ42zn9EgA=;
        b=w2UkjvmMa0b3Jj3bRnCOzLOOnJhzHram0qUr+hyVoF7QF9wO0sS98CValsAS4SqqGs
         bJ9t/C20kldIAxthpkaMWhjpJgzWIlNQDDNN5E+rqF+YU7F1SGGuyX8PDpHk8SudRGlQ
         zw2wsAtBlstMfy+CtBPresI5dAl4hU2isZxvNFFptJ4pa4O4izJIV2fD2GUXU6eS+jah
         kKKiufRF1OgboBlVcSu8bleHvoc0e/emRjRHSuPKNAtlXDaPJ9MCPEgbxIWIxEzZJCSE
         0JrTPTicicUFnp/AAJ/njGjb9Bl+Ka1UvAchQ2vB4em9ZYUfNBe/4jBKFac75OxFICzw
         XrnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5amwjTWIRqLe2fTBGlO6hAxlM9gBL72qHsZ42zn9EgA=;
        b=a0TLCE33GEJnTXKUwoDdSl5QpSDku7zsnfk9plcnuL2sbqP423HxaxUYQthQcuaU16
         frP8Vi4mDJjnJz4cXQEvaP/6wtZhkmyg/xugRKQTmQdnaYxnZ0q8FAjGIG6U8zA4WjJG
         JfHS3u1z+35vF4q7xegr5AH2bNf0uDD96b0/2i/cMMv6tQHfxEnoDBqdbJtE9vLEqdYX
         hqDpPKxnmmedRZJx1ZlG0Zx5Dq/lSE+0lu5tj3saCfXkj6q9t4yyd/hrxpiSlC42FLa5
         Zkw3wJPihx1wzisU5ibOmnKw+TIHYR7RA1cNnVvJDDaHWeJ7q19bcCxIuxaPq3dREmst
         mUBA==
X-Gm-Message-State: AOAM530/LM6+b3kYby0PEmOkvU9a/vfKDD74lsIWVx0ywzVRmGdlL5Q6
        NfwPRJwPzwGcUlGvIOay9YTVmkh3rmbTNBMDOnq0Hw==
X-Google-Smtp-Source: ABdhPJy88KlTg/YTg27YWTdBpEzIk+qBEUkjukz8u9LiS5ucVjPUeY/wW29fEVui4yjEuSG2RwuDHI2MPSDUqYsWP6o=
X-Received: by 2002:a63:6302:: with SMTP id x2mr27989241pgb.5.1636130486183;
 Fri, 05 Nov 2021 09:41:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210827145819.16471-1-joao.m.martins@oracle.com>
 <20210827145819.16471-8-joao.m.martins@oracle.com> <CAPcyv4jqdPaLPOydb_GWvVP4d+hRkcu7CnP_Ud-CQXHcqTLWKw@mail.gmail.com>
 <bfc9f754-e927-f6fa-7da8-2811fe5c8808@oracle.com>
In-Reply-To: <bfc9f754-e927-f6fa-7da8-2811fe5c8808@oracle.com>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Fri, 5 Nov 2021 09:41:15 -0700
Message-ID: <CAPcyv4gXHaH=wHTbA3GsUgGvrcoXHxtrnD55iFtg7ZGHD8cMxg@mail.gmail.com>
Subject: Re: [PATCH v4 07/14] device-dax: compound devmap support
To:     Joao Martins <joao.m.martins@oracle.com>
Cc:     Linux MM <linux-mm@kvack.org>,
        Vishal Verma <vishal.l.verma@intel.com>,
        Dave Jiang <dave.jiang@intel.com>,
        Naoya Horiguchi <naoya.horiguchi@nec.com>,
        Matthew Wilcox <willy@infradead.org>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        John Hubbard <jhubbard@nvidia.com>,
        Jane Chu <jane.chu@oracle.com>,
        Muchun Song <songmuchun@bytedance.com>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Christoph Hellwig <hch@lst.de>,
        Linux NVDIMM <nvdimm@lists.linux.dev>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Nov 5, 2021 at 7:10 AM Joao Martins <joao.m.martins@oracle.com> wrote:
>
> On 11/5/21 00:38, Dan Williams wrote:
> > On Fri, Aug 27, 2021 at 7:59 AM Joao Martins <joao.m.martins@oracle.com> wrote:
> >>
> >> Use the newly added compound devmap facility which maps the assigned dax
> >> ranges as compound pages at a page size of @align. Currently, this means,
> >> that region/namespace bootstrap would take considerably less, given that
> >> you would initialize considerably less pages.
> >>
> >> On setups with 128G NVDIMMs the initialization with DRAM stored struct
> >> pages improves from ~268-358 ms to ~78-100 ms with 2M pages, and to less
> >> than a 1msec with 1G pages.
> >>
> >> dax devices are created with a fixed @align (huge page size) which is
> >> enforced through as well at mmap() of the device. Faults, consequently
> >> happen too at the specified @align specified at the creation, and those
> >> don't change through out dax device lifetime.
> >
> > s/through out/throughout/
> >
> >> MCEs poisons a whole dax huge page, as well as splits occurring at the configured page size.
> >
> > A clarification here, MCEs trigger memory_failure() to *unmap* a whole
> > dax huge page, the poison stays limited to a single cacheline.
> >
> Ah, yes. I'll fix it for v5.
>
> > Otherwise the patch looks good to me.
> >
> Thanks!
>
> Btw, does 'looks good' == Reviewed-by (with the commit message clarification above) or is
> it that 'should be good with the ammend above and you get the tag in the next round' ?

Reviewed-by: Dan Williams <dan.j.williams@intel.com>

> Asking as IIRC you mentioned this too some other time(s) (in the simpler sparse-vmemmap
> patches) hence just clarifying to understand your expected 'process' better.
>
> Also, I will be splitting this series as mentioned in the other discussion ...
>
> https://lore.kernel.org/linux-mm/20211019160136.GH3686969@ziepe.ca/
>
> ... So this patch and the previous one should be the last two patches of the series
> and the rest (gup, sparse-vmemmmap) will go in parallel.

Sounds good.
