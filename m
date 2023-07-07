Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBA9CEB64D9
	for <linux-doc@archiver.kernel.org>; Fri,  7 Jul 2023 13:15:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231967AbjGGNPI (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 7 Jul 2023 09:15:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229955AbjGGNPG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 7 Jul 2023 09:15:06 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B5561FEC
        for <linux-doc@vger.kernel.org>; Fri,  7 Jul 2023 06:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1688735659;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=6vnw9WeYBMqYt9YWOLp+S5fHsLpKwmQh+j83UzoShuI=;
        b=XB+2hyqX+RgG0KF7POd4w1+nySTTVymLEO7kr/t+09EBuSHf879ReoDc2tfWn05IUFNWel
        SBUFvLLHIArfJ2Wchv27PrkaTi2BJRF1KkCci8B+UMHzGbqAmCtwctmD53Ki4wydDebGD1
        /JrCpFenTvMECtJdVT0BVad/gj+DB8Y=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-6-ewjtkNkyPwuU5Cu1uGcE_A-1; Fri, 07 Jul 2023 09:14:18 -0400
X-MC-Unique: ewjtkNkyPwuU5Cu1uGcE_A-1
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7673887b2cfso47809885a.1
        for <linux-doc@vger.kernel.org>; Fri, 07 Jul 2023 06:14:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688735657; x=1691327657;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6vnw9WeYBMqYt9YWOLp+S5fHsLpKwmQh+j83UzoShuI=;
        b=ffQQBCWjJz957/+KWALpj7vS6HNwhK18DnAQ6Sskj6uB8JHQL17u9EYywpYGEyrdNi
         SgxpDEvtaNDp5UdRhZ0IRfoes6bs1g2Z9AYk8nwTXMVHhDVQPSDq3UOoXTsW+uZIuoLK
         YsorsQ0bS6p1yM/Q1MaY5PrehCvWN7OeG1osEXfq/6gWMhFJYW986nDaRC/XJS0XyGW/
         MTirDR0htOCiomGK/eUvNQrWHx4mjeo2zmurO7KGjF+i7rsq0Zo0Amw1IT6s5YY3suYa
         sSoSeYixl1milFvaQuw3pwK4ejy/KvjVKGX7PE8wvaGzxz8irJhOZJj3GFfczvXXOGbB
         wdSQ==
X-Gm-Message-State: ABy/qLby1YziGTR/yevhFbO5JpkXuFVXdPaS21pISfbUunFXtL6DzuHE
        Sb0Ym6etBYh3esv80yEVDM9H3NpWFNCRJSEtGH+pLxTaq5I19im6DQ7SfVhlzUG2S4eqmrXkGDT
        kMnZAPOwG3V5ygJ1qtU/8
X-Received: by 2002:a05:620a:444c:b0:767:1573:d36e with SMTP id w12-20020a05620a444c00b007671573d36emr5602262qkp.3.1688735657670;
        Fri, 07 Jul 2023 06:14:17 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFM9ujXAoIaW0G5RqfQhUiyk9Pp98RfcrEYp1lty1Ca8TCUHVClMKEuALmkLm8iW1IpWPaeUA==
X-Received: by 2002:a05:620a:444c:b0:767:1573:d36e with SMTP id w12-20020a05620a444c00b007671573d36emr5602241qkp.3.1688735657399;
        Fri, 07 Jul 2023 06:14:17 -0700 (PDT)
Received: from x1n (cpe5c7695f3aee0-cm5c7695f3aede.cpe.net.cable.rogers.com. [99.254.144.39])
        by smtp.gmail.com with ESMTPSA id a22-20020a05620a16d600b007671678e31fsm1800467qkn.86.2023.07.07.06.14.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 06:14:17 -0700 (PDT)
Date:   Fri, 7 Jul 2023 09:14:14 -0400
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
Subject: Re: [PATCH v3 2/8] mm: userfaultfd: check for start + len overflow
 in validate_range
Message-ID: <ZKgPpkx0l7mZ6s5E@x1n>
References: <20230706225037.1164380-1-axelrasmussen@google.com>
 <20230706225037.1164380-3-axelrasmussen@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230706225037.1164380-3-axelrasmussen@google.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jul 06, 2023 at 03:50:30PM -0700, Axel Rasmussen wrote:
> Most userfaultfd ioctls take a `start + len` range as an argument.
> We have the validate_range helper to check that such ranges are valid.
> However, some (but not all!) ioctls *also* check that `start + len`
> doesn't wrap around (overflow).
> 
> Just check for this in validate_range. This saves some repetitive code,
> and adds the check to some ioctls which weren't bothering to check for
> it before.
> 
> Signed-off-by: Axel Rasmussen <axelrasmussen@google.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu

