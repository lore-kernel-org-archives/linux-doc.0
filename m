Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E072C4361B
	for <linux-doc@archiver.kernel.org>; Thu, 10 Dec 2020 18:59:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 18EBA23440
	for <linux-doc@archiver.kernel.org>; Thu, 10 Dec 2020 18:59:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393300AbgLJS6z (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 10 Dec 2020 13:58:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390512AbgLJS6s (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 10 Dec 2020 13:58:48 -0500
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79CBFC0617A6
        for <linux-doc@vger.kernel.org>; Thu, 10 Dec 2020 10:57:57 -0800 (PST)
Received: by mail-ej1-x644.google.com with SMTP id w1so4181777ejf.11
        for <linux-doc@vger.kernel.org>; Thu, 10 Dec 2020 10:57:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=a6TkgEUfiDhWCoSS0DFeAubMo61jHLszmVbhmRRlKAo=;
        b=Mvy/GKpSRg8Xa2d/bWsJOn0aT1XfglvsqwjR+nO6/qw8n8TvkbbiEeshrouUhn4XU+
         ax428YZ6LYn6d2NdDSzyxeS87BL+rbWwOVpppByha4dut1SaSxw6VhBtxRuyXA4B96ms
         DHUF/izejnx648aeQrhElRRClRT+brQYNwWSQ3a2MAb10scn6hAPsjW4BNUVPwjtCwU6
         b+GptKorV3xqcNbvWlWUcMdTRzzprfEfspQtSrdGbE8XrI2r27N/Z250TuneFrUMjKrA
         LKe5RUyKGA3v8X2LC1d+78hZBw66X7PJiWi1xjUhUzyUECFLYpoici7W0Sfq0KsEHRJx
         pnQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=a6TkgEUfiDhWCoSS0DFeAubMo61jHLszmVbhmRRlKAo=;
        b=Vm3tFbacsdv07+SHFllrEprzlNPRoRoOtsn4na4XEIEcvwhP1/GOu+IkaPxELxjv0i
         3XZUnfYGyicWk1ZAWmXEbIIyd4d5DXPYj/gCjK9hUE08ME1XU4X94JjboB+kPJzDSlqZ
         /M2qJ00wtYFGSvPl7ABdudzylO89mmc07hAYn8gy/My8MSrMDingb39gHnIfNFPvxWwK
         fQC223qOaqrUJ9fTUfjdy4/p8PLBGeu4uxiplodOb4cKDhtTXLkACc0Bm2Hizi/ahkiM
         nzL7Leg5mPysQD/9lAaj07QWB2ngxoWcPvjT9RSCgHNULYg0KR77Y22TPYF3beWVRTZk
         sINw==
X-Gm-Message-State: AOAM530dgFMrGmlDIgfCof83CW+vReWhrTc22y3wZTwbbNNPXG7nL765
        X0rFRBBt7S7LM/uTCN4OEHtRWIkqbdPGy1mf5TZtZA==
X-Google-Smtp-Source: ABdhPJyRi83G4NsMmHZfaFGRTtQRDTMLDzUIrLDBV1wXI7ajLidTQuBMOdhm2H36zD8usiRong+dYAarxyBWcqOpOvE=
X-Received: by 2002:a17:906:fb9b:: with SMTP id lr27mr7880873ejb.175.1607626676199;
 Thu, 10 Dec 2020 10:57:56 -0800 (PST)
MIME-Version: 1.0
References: <20201210004335.64634-1-pasha.tatashin@soleen.com>
 <20201210004335.64634-4-pasha.tatashin@soleen.com> <20201210040618.GR1563847@iweiny-DESK2.sc.intel.com>
 <CA+CK2bCVEnKKatQSxZcdcvNo+9rWNrGWXyLS3dnF-y7=5Ery7g@mail.gmail.com> <20201210174431.GT1563847@iweiny-DESK2.sc.intel.com>
In-Reply-To: <20201210174431.GT1563847@iweiny-DESK2.sc.intel.com>
From:   Pavel Tatashin <pasha.tatashin@soleen.com>
Date:   Thu, 10 Dec 2020 13:57:20 -0500
Message-ID: <CA+CK2bBbN9dxqD_ntAPACfjJmwahPEyP36cb7koVm212nzsuKw@mail.gmail.com>
Subject: Re: [PATCH v2 3/8] mm/gup: make __gup_longterm_locked common
To:     Ira Weiny <ira.weiny@intel.com>
Cc:     LKML <linux-kernel@vger.kernel.org>, linux-mm <linux-mm@kvack.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        Michal Hocko <mhocko@suse.com>,
        David Hildenbrand <david@redhat.com>,
        Oscar Salvador <osalvador@suse.de>,
        Dan Williams <dan.j.williams@intel.com>,
        Sasha Levin <sashal@kernel.org>,
        Tyler Hicks <tyhicks@linux.microsoft.com>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>, mike.kravetz@oracle.com,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>,
        Peter Zijlstra <peterz@infradead.org>,
        Mel Gorman <mgorman@suse.de>,
        Matthew Wilcox <willy@infradead.org>,
        David Rientjes <rientjes@google.com>,
        John Hubbard <jhubbard@nvidia.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Dec 10, 2020 at 12:44 PM Ira Weiny <ira.weiny@intel.com> wrote:
>
> On Thu, Dec 10, 2020 at 08:30:03AM -0500, Pavel Tatashin wrote:
> > On Wed, Dec 9, 2020 at 11:06 PM Ira Weiny <ira.weiny@intel.com> wrote:
> > >
> > > On Wed, Dec 09, 2020 at 07:43:30PM -0500, Pavel Tatashin wrote:
> > > > __gup_longterm_locked() has CMA || FS_DAX version and a common stub
> > > > version. In the preparation of prohibiting longterm pinning of pages from
> > > > movable zone make the CMA || FS_DAX version common, and delete the stub
> > > > version.
> > >
> > > I thought Jason sent a patch which got rid of this as well?
> >
> > Yes, this series applies on the mainline so it can be easily tested.
> > The next version, I will sync with linux-next.
>
> Oh yea we wanted this to be back-portable correct?
>
> If so, LGTM
>
> Reviewed-by: Ira Weiny <ira.weiny@intel.com>

Thank you. Yes, this series should be backported, but I am not sure
what to do about Jason's patch. Perhaps, in the next version I will
send out this series together with his patch.

Pasha

>
> Sorry for not keeping up,
> Ira
