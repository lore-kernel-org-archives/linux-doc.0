Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83519C07E9D
	for <linux-doc@archiver.kernel.org>; Tue, 27 Sep 2022 16:06:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232584AbiI0QGE (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 27 Sep 2022 12:06:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232908AbiI0QFo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 27 Sep 2022 12:05:44 -0400
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 128481C45BC;
        Tue, 27 Sep 2022 09:03:52 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 878062CD;
        Tue, 27 Sep 2022 16:03:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 878062CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1664294631; bh=jHSmSAR/hobBlMN0tqy1ovtiuqG6lGuz9A1LCwBR+d8=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=Hu+iHpqZId9a2KB+8oILML7Q00W4M53pyLpcc8okZ+M4ob7+lrxLZK2Oyg9yUVO0h
         WvN8n0BdN32oFT6UawHcSBZIAqSZW/pWWsIJKWR9gWSDX2LbZ9g0xuOz64oq67Oy/m
         x4bB2gdFDlUFiqjnfOTkg5pzdOKpDG0qdvrORuVnhc+R1bBDjBfX+dCKDUyLWue5Ov
         0LgktRf+Yful4wUsKTLaxvHqfi+eNHfODFo0zhTmFyvpaiDvrD8p6iYYg5PrTCx6fq
         VGyAzyLjMDP25IvLCF9U3hhXCDG2KZOjfCtjePnkNINpxJj+FGsmaEAaqaXu58hIjs
         7eqKSFOLJ9fFA==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Kristen Carlson Accardi <kristen@linux.intel.com>,
        linux-doc@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Shuah Khan <skhan@linuxfoundation.org>,
        linux-kernel@vger.kernel.org,
        LF TAB <tech-board@lists.linux-foundation.org>
Subject: Re: [PATCH] Documentation/CoC: Reflect current CoC interpretation
 and practices
In-Reply-To: <a9a569566c2771621f170d017ce981dcfff2b1e7.camel@linux.intel.com>
References: <20220926211149.2278214-1-kristen@linux.intel.com>
 <87h70tpw6d.fsf@meer.lwn.net>
 <a9a569566c2771621f170d017ce981dcfff2b1e7.camel@linux.intel.com>
Date:   Tue, 27 Sep 2022 10:03:50 -0600
Message-ID: <87sfkcolcp.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Kristen Carlson Accardi <kristen@linux.intel.com> writes:

>> > +neutral third party.=C2=A0 The processes the Code of Conduct committee
>> > will
>> > +use to address reports is varied and will depend on the individual
>
> Eek, I see a small error here - it should either say "The processes the
> Code of Conduct committee will use to address reports are varied"
> OR
> "The process the Code of Conduct committee will use to address reports
> is varied"
>
> Perhaps this can be fixed when it is added to a tree, or let me know if
> you would like another version.

I can tweak it, no worries.

Thanks,

jon
