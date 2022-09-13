Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D261BC54EE9
	for <linux-doc@archiver.kernel.org>; Tue, 13 Sep 2022 10:35:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231635AbiIMKfD (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 13 Sep 2022 06:35:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231617AbiIMKfA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 13 Sep 2022 06:35:00 -0400
Received: from out1.migadu.com (out1.migadu.com [91.121.223.63])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5768C10FC8;
        Tue, 13 Sep 2022 03:34:56 -0700 (PDT)
Content-Type: text/plain;
        charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1663065294;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Oac3nih64E0pi5snDdXMh4iMt6lvJM63V217jemxOhc=;
        b=dhPTSi3G/hlnCI2RbLxXw/uXLx+5gnjunhauhgmpG3H3TXa2adVMGUgVjhp8+NV35PezOS
        ZthAY2vp1IUzGtcU4o7gF3Dt+JwNU20LbBQsGnkUkiIVZH5u/mugUZjMjXGWSX4iZo3w3q
        6dWKZU9ap4GYETodLLRP5gHlRPbP/kk=
MIME-Version: 1.0
Subject: Re: [PATCH v2] mm/memcontrol: use kstrtobool for swapaccount param
 parsing
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20220909084647.3598299-1-liushixin2@huawei.com>
Date:   Tue, 13 Sep 2022 18:34:40 +0800
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Michal Hocko <mhocko@kernel.org>,
        Roman Gushchin <roman.gushchin@linux.dev>,
        Shakeel Butt <shakeelb@google.com>,
        Muchun Song <songmuchun@bytedance.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        cgroups@vger.kernel.org, linux-mm@kvack.org,
        Kefeng Wang <wangkefeng.wang@huawei.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <128547F8-DABA-4548-82F5-0707A3614084@linux.dev>
References: <20220909084647.3598299-1-liushixin2@huawei.com>
To:     Liu Shixin <liushixin2@huawei.com>
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: linux.dev
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



> On Sep 9, 2022, at 16:46, Liu Shixin <liushixin2@huawei.com> wrote:
>=20
> Use kstrtobool which is more powerful to handle all kinds of =
parameters
> like 'Yy1Nn0' or [oO][NnFf] for "on" and "off".
>=20
> Signed-off-by: Liu Shixin <liushixin2@huawei.com>

With Andrew and Michal=E2=80=99s suggestion.

Reviewed-by: Muchun Song <songmuchun@bytedance.com>

Thanks.=
