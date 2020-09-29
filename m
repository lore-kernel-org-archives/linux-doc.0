Return-Path: <SRS0=tD+q=DG=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 329A6C4741F
	for <linux-doc@archiver.kernel.org>; Tue, 29 Sep 2020 14:23:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A2231206DB
	for <linux-doc@archiver.kernel.org>; Tue, 29 Sep 2020 14:22:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b="KtSUOtpr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728378AbgI2OW6 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 29 Sep 2020 10:22:58 -0400
Received: from smtp-fw-33001.amazon.com ([207.171.190.10]:26706 "EHLO
        smtp-fw-33001.amazon.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727659AbgI2OW5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 29 Sep 2020 10:22:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1601389377; x=1632925377;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   mime-version;
  bh=JACM4vdUV33y9yliaH0/j1OWR+5VHZd1rr/Na9ivV5M=;
  b=KtSUOtprq/y0g8LGj5fvZnDJ7nc6gjT/kHEnf664jOqlaDSeanLpa1MZ
   auVlhleo3pzHby2bAwb/8eV9b1Tj69b07HTCapPEbYxdWM+eWnjjdOccT
   FzhQtQPqEsaS896yNPwqw7a5bETt2ax/PfWUb9bGh8d9bi8d4LKKarApd
   c=;
X-IronPort-AV: E=Sophos;i="5.77,318,1596499200"; 
   d="scan'208";a="78932031"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO email-inbound-relay-2b-81e76b79.us-west-2.amazon.com) ([10.47.23.38])
  by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP; 29 Sep 2020 14:21:45 +0000
Received: from EX13D31EUA001.ant.amazon.com (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
        by email-inbound-relay-2b-81e76b79.us-west-2.amazon.com (Postfix) with ESMTPS id 20059A17E7;
        Tue, 29 Sep 2020 14:21:41 +0000 (UTC)
Received: from u3f2cd687b01c55.ant.amazon.com (10.43.160.185) by
 EX13D31EUA001.ant.amazon.com (10.43.165.15) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 29 Sep 2020 14:21:28 +0000
From:   SeongJae Park <sjpark@amazon.com>
To:     Marco Elver <elver@google.com>
CC:     <akpm@linux-foundation.org>, <glider@google.com>, <hpa@zytor.com>,
        <paulmck@kernel.org>, <andreyknvl@google.com>,
        <aryabinin@virtuozzo.com>, <luto@kernel.org>, <bp@alien8.de>,
        <catalin.marinas@arm.com>, <cl@linux.com>,
        <dave.hansen@linux.intel.com>, <rientjes@google.com>,
        <dvyukov@google.com>, <edumazet@google.com>,
        <gregkh@linuxfoundation.org>, <hdanton@sina.com>,
        <mingo@redhat.com>, <jannh@google.com>,
        <Jonathan.Cameron@huawei.com>, <corbet@lwn.net>,
        <iamjoonsoo.kim@lge.com>, <keescook@chromium.org>,
        <mark.rutland@arm.com>, <penberg@kernel.org>,
        <peterz@infradead.org>, <sjpark@amazon.com>, <tglx@linutronix.de>,
        <vbabka@suse.cz>, <will@kernel.org>, <x86@kernel.org>,
        <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kasan-dev@googlegroups.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-mm@kvack.org>
Subject: Re: [PATCH v4 11/11] MAINTAINERS: Add entry for KFENCE
Date:   Tue, 29 Sep 2020 16:21:13 +0200
Message-ID: <20200929142113.26993-1-sjpark@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200929133814.2834621-12-elver@google.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.43.160.185]
X-ClientProxiedBy: EX13D19UWA004.ant.amazon.com (10.43.160.102) To
 EX13D31EUA001.ant.amazon.com (10.43.165.15)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 29 Sep 2020 15:38:14 +0200 Marco Elver <elver@google.com> wrote:

> Add entry for KFENCE maintainers.
> 
> Reviewed-by: Dmitry Vyukov <dvyukov@google.com>
> Co-developed-by: Alexander Potapenko <glider@google.com>
> Signed-off-by: Alexander Potapenko <glider@google.com>
> Signed-off-by: Marco Elver <elver@google.com>

Reviewed-by: SeongJae Park <sjpark@amazon.de>


Thanks,
SeongJae Park
