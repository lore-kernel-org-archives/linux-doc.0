Return-Path: <SRS0=QfIF=7V=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 619E4C433DF
	for <linux-doc@archiver.kernel.org>; Mon,  8 Jun 2020 18:15:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3D2DD20775
	for <linux-doc@archiver.kernel.org>; Mon,  8 Jun 2020 18:15:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iTF63JX0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725878AbgFHSP6 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 8 Jun 2020 14:15:58 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:53270 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725797AbgFHSP5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 8 Jun 2020 14:15:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1591640156;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=oIo80SnB/PSIWlFE9jQ3/SK9wb3PpgcPr98lQXyYwj4=;
        b=iTF63JX0VnbXjXuVTnQL0RxeYBoXXWZqOVDM1RpJAL+EHhfTtNeGuRIBn3Kf7+UdHX1/0Y
        YRjoxljV74G0QsoPiSlJr99pLBryAbs7mHBmeMlq1mN5HHbJ3yyyVTyA1eCtYRnVZru6Ve
        pSg7d12U6f7lZgY8Zy8IO9CbT5QkZQk=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-43-YJJzDp-TNDWdNFO_pYkadQ-1; Mon, 08 Jun 2020 14:15:54 -0400
X-MC-Unique: YJJzDp-TNDWdNFO_pYkadQ-1
Received: by mail-ej1-f71.google.com with SMTP id l2so6353470ejd.11
        for <linux-doc@vger.kernel.org>; Mon, 08 Jun 2020 11:15:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:content-transfer-encoding:from:mime-version
         :subject:date:message-id:references:cc:in-reply-to:to;
        bh=oIo80SnB/PSIWlFE9jQ3/SK9wb3PpgcPr98lQXyYwj4=;
        b=RebjgZpGbonI41qiRRW06hA9UKH+ir/LwhA1zUSKrmOhipt4YQHtPl6xUdTxE3pt0u
         k3MVj/b9orFy8o8Bmovu0dA6zVNPFfVnDIlQDh/Wr8PcC534tZQYYnv5q+1L+xtQ3EH3
         dFCcIW3S/YltDRDxQFRrGL4bL7L5FUD6SU4jAjspKyw4KB7FGeFytoN2WngDzTRg6/cW
         MS/I6krZ7Jgdjv3Joyy6fORfx8GKQp+7i6HcfRJPY0XJtjIOB0992Ag6bqQHSZoNtdWE
         UwjcvLJLtH7AsEreBUHvulM8BNTNz4t7YdClEPRPLoMTWuoxj8+U773njCFoIWkLlPyE
         qU0w==
X-Gm-Message-State: AOAM533VX42dK1p1kVE6EDw5uuUonntGbAfHE2OjvUz1zO0/uAXzfOEO
        NWPcLZWQM30e0u2GWKA4qztzR2+H0VLYUQVVUBzyYjLTRFHjoaiejTVm39X2Sxq4uIzMms/Hgnn
        h61iQGhi6CIOsHk+qajkS
X-Received: by 2002:a50:ac84:: with SMTP id x4mr23961517edc.124.1591640153192;
        Mon, 08 Jun 2020 11:15:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwFuIoKxqy0jjsfx01sqRkTEypgRvXwuITW6/q5hDponWWttStC6KsdShp0bZjj0Gw9JwhjrQ==
X-Received: by 2002:a50:ac84:: with SMTP id x4mr23961498edc.124.1591640152969;
        Mon, 08 Jun 2020 11:15:52 -0700 (PDT)
Received: from [192.168.3.122] (p5b0c659c.dip0.t-ipconnect.de. [91.12.101.156])
        by smtp.gmail.com with ESMTPSA id k3sm13152866edi.60.2020.06.08.11.15.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2020 11:15:52 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From:   David Hildenbrand <david@redhat.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v15 01/14] mm/page_ext: Export lookup_page_ext() to GPL modules
Date:   Mon, 8 Jun 2020 20:15:50 +0200
Message-Id: <320E495A-1A3E-423B-A3E7-088004771E45@redhat.com>
References: <20200608154917.GA8408@infradead.org>
Cc:     David Hildenbrand <david@redhat.com>,
        SeongJae Park <sjpark@amazon.com>, akpm@linux-foundation.org,
        SeongJae Park <sjpark@amazon.de>, jonathan.cameron@huawei.com,
        aarcange@redhat.com, acme@kernel.org,
        alexander.shishkin@linux.intel.com, amit@kernel.org,
        benh@kernel.crashing.org, brendan.d.gregg@gmail.com,
        brendanhiggins@google.com, cai@lca.pw, colin.king@canonical.com,
        corbet@lwn.net, dwmw@amazon.com, foersleo@amazon.de,
        irogers@google.com, jolsa@redhat.com, kirill@shutemov.name,
        mark.rutland@arm.com, mgorman@suse.de, minchan@kernel.org,
        mingo@redhat.com, namhyung@kernel.org, peterz@infradead.org,
        rdunlap@infradead.org, riel@surriel.com, rientjes@google.com,
        rostedt@goodmis.org, sblbir@amazon.com, shakeelb@google.com,
        shuah@kernel.org, sj38.park@gmail.com, snu@amazon.de,
        vbabka@suse.cz, vdavydov.dev@gmail.com, yang.shi@linux.alibaba.com,
        ying.huang@intel.com, linux-damon@amazon.com, linux-mm@kvack.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20200608154917.GA8408@infradead.org>
To:     Christoph Hellwig <hch@infradead.org>
X-Mailer: iPhone Mail (17E262)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



> Am 08.06.2020 um 18:11 schrieb Christoph Hellwig <hch@infradead.org>:
>=20
> =EF=BB=BFOn Mon, Jun 08, 2020 at 01:53:23PM +0200, David Hildenbrand wrote=
:
>>> @@ -131,6 +131,7 @@ struct page_ext *lookup_page_ext(const struct page *=
page)
>>>                    MAX_ORDER_NR_PAGES);
>>>    return get_entry(base, index);
>>> }
>>> +EXPORT_SYMBOL_GPL(lookup_page_ext);
>>>=20
>>> static int __init alloc_node_page_ext(int nid)
>>> {
>>>=20
>>=20
>> I've been told to always smuggle new EXPORTs into the patch that
>> actually needs it (and cc relevant people on that patch instead).
>=20
> A separate patch for anything remotely controversial really helps it
> to stick out, so I think keeping it separate is a very good practice.
>=20

That used to be my approach until Michal told me to do it differently. And t=
here is a good point for it: Reviewers actually understand in which context i=
t is used and if it is really required.

Having that said, I don=E2=80=98t have a strong opinion on this.=

