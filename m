Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2E1CC77B61
	for <linux-doc@archiver.kernel.org>; Mon,  1 May 2023 13:17:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232369AbjEANR2 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 1 May 2023 09:17:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbjEANR1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 1 May 2023 09:17:27 -0400
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DEC3129;
        Mon,  1 May 2023 06:17:24 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 825EB31A;
        Mon,  1 May 2023 13:17:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 825EB31A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1682947043; bh=TFwoud0wizqRUXKPP/5TlZfn1QcHbCrOvleTETIq2Xs=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=HxLzcsUHkaUyF6oJqbEWrtRrWqrgbdXLo5S+VgaolXPUD5sbeJgSeg9KnrSGFXhSP
         7Wq9YX6YIULfBWpXKBo+oYf137au7vqFLKvBL2jTdXowxOXDgihQtPrDgTAXOVX0uv
         4rJk6ZtHoG0yqxNukWlvOPBsngUJIdKoG3SHi5Ubz4jG7jAqWrRGlN/lLIOdToQxpk
         sqvqDL0n2cOFu14B6z5B6sWV66lsu0iIkQmAGRezMemdZWg8zFhznLSQJYar2Woyre
         WN8AcCsI4gR2K2QYiFB+NB7lDgxFvlCFZP46BSKonMXW5MAj7kM5mOnwrwsa583H49
         Tjmfct6F+Sb7Q==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Natesh Sharma <nsharma@redhat.com>, chenhuacai@kernel.org,
        dave.hansen@linux.intel.com, geert@linux-m68k.org, axboe@kernel.dk,
        linux@zary.sk
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: admin-guide: Add information about intel_pstate
 active mode
In-Reply-To: <CACY8qCSVcLkDGWCVmZ9-fhaax7FQdY=FS4MGyy_-wo3Qc_CSig@mail.gmail.com>
References: <20230427083706.49882-1-nsharma@redhat.com>
 <CACY8qCSVcLkDGWCVmZ9-fhaax7FQdY=FS4MGyy_-wo3Qc_CSig@mail.gmail.com>
Date:   Mon, 01 May 2023 07:17:22 -0600
Message-ID: <87pm7k9onx.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Natesh Sharma <nsharma@redhat.com> writes:

> Just a gentle reminder if the request has been missed out!

You need to wait more than four days before sending "gentle reminders" -
even when the merge window is not open, which it currently is.

Thanks,

jon
