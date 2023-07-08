Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63A6CEB64DA
	for <linux-doc@archiver.kernel.org>; Sat,  8 Jul 2023 15:03:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229874AbjGHPDX (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 8 Jul 2023 11:03:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229658AbjGHPDW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 8 Jul 2023 11:03:22 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67C84E61
        for <linux-doc@vger.kernel.org>; Sat,  8 Jul 2023 08:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1688828557;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=T3GRnokqrPVaYV/THcdBGlJffY7BDH+AcPJHejmPSVM=;
        b=bUPOe8ftgS9nqFxx2l8gM7jwZ65gPpqg/kYq/npOY6e3L8n7uZpfCL17yfqIWUrg7ySeJw
        R8kNfgTwhWW96uyC14G/81eHqoZ5HOsp5sp1hvTaDVvyH9SSzOlUtpgbWTjgP02DE+OP49
        LZC2b6BPz98CVMjucr2wmv4UWfqB7f0=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-29-zEWX1MtiOZ24uuBP-ZA7rA-1; Sat, 08 Jul 2023 11:02:36 -0400
X-MC-Unique: zEWX1MtiOZ24uuBP-ZA7rA-1
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7672918d8a4so71607485a.0
        for <linux-doc@vger.kernel.org>; Sat, 08 Jul 2023 08:02:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688828556; x=1691420556;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T3GRnokqrPVaYV/THcdBGlJffY7BDH+AcPJHejmPSVM=;
        b=RF8cH3981g4e4O+kVFDB+THCazSjDg4hCt2+7xKy9Eoxbp/VJIPnN+sJnuvBDxeyIM
         yAw6RIVM4KFG3QOkE5YXHLMjr8/lfMGHxP6veW6bECn0e6sI2NjtAl2ICd8Ays5hiDzV
         pPv7R4CxpSyOKtgrxB7sOkr6wnKWXIFZgqamnFaMwMsu2I7lJzJSl93cRxapaGS1Ny9d
         rGyhbJ3lQr2ZKgyfZ6PgbH/oz+KScXDl4iWxfVoNFZ7N5O1vtBvlqX+pi5Ouus4OyWl1
         8Q8TVA51RNZRsH811aJGdAa0aLulrc82deYhy2pEw38nDJ/Wo6g9OUTWP8jquaS32x+8
         zWiw==
X-Gm-Message-State: ABy/qLZhgyOd07YwPSDHlh3GGiSQk07LEuCS+dsjv9R2Eo6pUzcOxhAM
        RYUYk0kwiL8onxfv/0GhsnyUn/7nwsPStrXdXCJJd/PF7Yg3w5tzEgcUwK04xO/KLb9HSbGuciu
        mk7MpxKyQ7mrbiV/n8laY
X-Received: by 2002:a05:6214:b65:b0:634:cdae:9941 with SMTP id ey5-20020a0562140b6500b00634cdae9941mr8767610qvb.0.1688828556026;
        Sat, 08 Jul 2023 08:02:36 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGj53IzcQAPmiI/v43Lyk7eh+euAZZXrSV8HTK/l4O/V2y1GtOUmoqfRyODcRL3zSDwxMPZhQ==
X-Received: by 2002:a05:6214:b65:b0:634:cdae:9941 with SMTP id ey5-20020a0562140b6500b00634cdae9941mr8767568qvb.0.1688828555801;
        Sat, 08 Jul 2023 08:02:35 -0700 (PDT)
Received: from xz-m1.local (cpe5c7695f3aee0-cm5c7695f3aede.cpe.net.cable.rogers.com. [99.254.144.39])
        by smtp.gmail.com with ESMTPSA id i4-20020a0cf484000000b0063013c621fasm3417890qvm.68.2023.07.08.08.02.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Jul 2023 08:02:35 -0700 (PDT)
Date:   Sat, 8 Jul 2023 11:02:33 -0400
From:   Peter Xu <peterx@redhat.com>
To:     Axel Rasmussen <axelrasmussen@google.com>
Cc:     Alexander Viro <viro@zeniv.linux.org.uk>,
        Andrew Morton <akpm@linux-foundation.org>,
        Brian Geffon <bgeffon@google.com>,
        Christian Brauner <brauner@kernel.org>,
        David Hildenbrand <david@redhat.com>,
        Gaosheng Cui <cuigaosheng1@huawei.com>,
        Huang Ying <ying.huang@intel.com>,
        Hugh Dickins <hughd@google.com>,
        James Houghton <jthoughton@google.com>,
        "Jan Alexander Steffens (heftig)" <heftig@archlinux.org>,
        Jiaqi Yan <jiaqiyan@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Kefeng Wang <wangkefeng.wang@huawei.com>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Miaohe Lin <linmiaohe@huawei.com>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        "Mike Rapoport (IBM)" <rppt@kernel.org>,
        Muchun Song <muchun.song@linux.dev>,
        Nadav Amit <namit@vmware.com>,
        Naoya Horiguchi <naoya.horiguchi@nec.com>,
        Ryan Roberts <ryan.roberts@arm.com>,
        Shuah Khan <shuah@kernel.org>,
        Suleiman Souhlal <suleiman@google.com>,
        Suren Baghdasaryan <surenb@google.com>,
        "T.J. Alumbaugh" <talumbau@google.com>,
        Yu Zhao <yuzhao@google.com>,
        ZhangPeng <zhangpeng362@huawei.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        linux-mm@kvack.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v4 7/8] selftests/mm: refactor uffd_poll_thread to allow
 custom fault handlers
Message-ID: <ZKl6ie4s/94TPCgm@xz-m1.local>
References: <20230707215540.2324998-1-axelrasmussen@google.com>
 <20230707215540.2324998-8-axelrasmussen@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230707215540.2324998-8-axelrasmussen@google.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jul 07, 2023 at 02:55:39PM -0700, Axel Rasmussen wrote:
> Previously, we had "one fault handler to rule them all", which used
> several branches to deal with all of the scenarios required by all of
> the various tests.
> 
> In upcoming patches, I plan to add a new test, which has its own
> slightly different fault handling logic. Instead of continuing to add
> cruft to the existing fault handler, let's allow tests to define custom
> ones, separate from other tests.
> 
> Signed-off-by: Axel Rasmussen <axelrasmussen@google.com>

Acked-by: Peter Xu <peterx@redhat.com>

PS: please remember to update manpage after it lands.  I still have a plan
to update but not yet happening; if you happen to update before mine please
feel free to update for whatever is missing.

Thanks!

-- 
Peter Xu

