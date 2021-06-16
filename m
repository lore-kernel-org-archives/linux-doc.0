Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79A2AC48BE5
	for <linux-doc@archiver.kernel.org>; Wed, 16 Jun 2021 23:35:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 55DA3613B9
	for <linux-doc@archiver.kernel.org>; Wed, 16 Jun 2021 23:35:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234626AbhFPXhh (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 16 Jun 2021 19:37:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:52106 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234620AbhFPXhg (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 16 Jun 2021 19:37:36 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9AC4D6128C;
        Wed, 16 Jun 2021 23:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
        s=korg; t=1623886530;
        bh=wPVQVbIbUSPCHwlQveBPypj0b7ZEUBG7b+pcNYSFUIk=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=OMSb5BYNr5xaUbuoMHYk0NSbtNUpgEhtIwdXglhLvCqDrW5i5qa2Uyw/yckWpzgvr
         PAagI6UIzBwhdIGp+BcTlme/GBh0kO1sv8tBF0p4l6Hpe21d5Kiv3nkLUw9rd+xyjF
         ipJ2ogqHrqVqo0ogdHpSuhxubfuwK4SU8iDDFm8c=
Date:   Wed, 16 Jun 2021 16:35:29 -0700
From:   Andrew Morton <akpm@linux-foundation.org>
To:     Alistair Popple <apopple@nvidia.com>
Cc:     <linux-mm@kvack.org>, <rcampbell@nvidia.com>,
        <willy@infradead.org>, <linux-doc@vger.kernel.org>,
        <nouveau@lists.freedesktop.org>, <hughd@google.com>,
        <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <hch@infradead.org>, <peterx@redhat.com>, <shakeelb@google.com>,
        <bskeggs@redhat.com>, <jgg@nvidia.com>, <jhubbard@nvidia.com>
Subject: Re: [PATCH v11 00/10] Add support for SVM atomics in Nouveau
Message-Id: <20210616163529.7de2f6e24d395c4ef7a367b6@linux-foundation.org>
In-Reply-To: <20210616105937.23201-1-apopple@nvidia.com>
References: <20210616105937.23201-1-apopple@nvidia.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 16 Jun 2021 20:59:27 +1000 Alistair Popple <apopple@nvidia.com> wrote:

> This is my series to add support for SVM atomics in Nouveau

Can we please have a nice [0/n] overview for this patchset?
