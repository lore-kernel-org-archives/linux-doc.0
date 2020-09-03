Return-Path: <SRS0=8YJ4=CM=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D46C0C43461
	for <linux-doc@archiver.kernel.org>; Thu,  3 Sep 2020 21:41:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 55188206D4
	for <linux-doc@archiver.kernel.org>; Thu,  3 Sep 2020 21:41:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cmpwn.com header.i=@cmpwn.com header.b="xThPzY8n"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726679AbgICVlK (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 3 Sep 2020 17:41:10 -0400
Received: from mail.cmpwn.com ([45.56.77.53]:40202 "EHLO mail.cmpwn.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726528AbgICVlK (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 3 Sep 2020 17:41:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=cmpwn.com; s=cmpwn;
        t=1599169266; bh=5uP5ZKLKbvdASSHmEZmKfkmbTnL32cXrZoiL7dnaoPc=;
        h=Cc:Subject:From:To:Date:In-Reply-To;
        b=xThPzY8nBUFhC+D19UaaornEhaX7RqGlhzwphcSXmytEN9+mRlSnaStzN6PdmUGgn
         K8ScEVwIsvq6JLjKs+MDfxDDzHsJz9EfNyDp8+pV98rZS0hIE4q6hpxiQvexqEmx1M
         JlPZLJJW0Y7UXWKM4jN6jYdxAS6bdHhFGbSbbt0E=
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Cc:     <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v3 0/4] Improvements to submitting-patches.rst
From:   "Drew DeVault" <sir@cmpwn.com>
To:     "Jonathan Corbet" <corbet@lwn.net>
Date:   Thu, 03 Sep 2020 17:40:48 -0400
Message-Id: <C5E26QT3RD90.2S03QMRN3QQ6X@homura>
In-Reply-To: <20200903154031.0faded85@lwn.net>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu Sep 3, 2020 at 5:40 PM EDT, Jonathan Corbet wrote:
> Indeed it is - applied, thanks.

Cheers!

> One little thing: it would have been good to keep Randy's Reviewed-by
> tag for patch 2; I poked it in.

Will remember that for next time. Thanks again for the reviews!
