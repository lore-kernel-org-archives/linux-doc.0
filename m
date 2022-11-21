Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74311C433FE
	for <linux-doc@archiver.kernel.org>; Mon, 21 Nov 2022 23:29:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229723AbiKUX3m (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 21 Nov 2022 18:29:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229501AbiKUX3l (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 21 Nov 2022 18:29:41 -0500
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2B61D5A3E
        for <linux-doc@vger.kernel.org>; Mon, 21 Nov 2022 15:29:39 -0800 (PST)
Received: from localhost (unknown [IPv6:2601:281:8300:73:8b7:7001:c8aa:b65f])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 57AE15CC;
        Mon, 21 Nov 2022 23:29:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 57AE15CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1669073379; bh=1BeGb8FeHdrlJCumMSMgcil3vbKfhksQ4m29A08aed4=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=Q2o23jM3kLAyzzU1vhIsz6mHHZL+JO1TBXKmE7xziKlEEzWtrBBWE2FpF0OXYsLQN
         V2J5xOdzqtGxrmdmin39BS69Of/xFdvjoQ6nhuZ8bw5cJzKiyjrwjFlnRrUYAU5Sml
         ZLxfJgVBrbgVXOToEFx5rz1PguSiv3vUTzFKTvZabNc2qU+BPCE2F7TnlqigjueX+6
         hjAi2MqHGE4vsImKTe68C25geMVR1fhA1/4Gc62bvnkS65QZLbHOinIKGiWPLV2l0M
         mcCenmbBbgjG+9zq8/LyAaCyTKbUfqA5GU2ZYyz/QW7MBxymeKuQ8PumNfo4KAQ6nh
         70Pw4cIx4MF4A==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Akira Yokosawa <akiyks@gmail.com>
Cc:     linux-doc@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
Subject: Re: [PATCH] docs/driver-api/miscellaneous: Remove kernel-doc of
 serial_core.c
In-Reply-To: <46789578-5785-eed3-24e7-14712ab78b99@gmail.com>
References: <4e54c76a-138a-07e0-985a-dd83cb622208@gmail.com>
 <47514c0a-7d5b-5a0b-6bb5-d5c96d163838@gmail.com>
 <9f23e62c-1401-cf58-f99b-fa804366cd4c@gmail.com>
 <87o7t09g4j.fsf@meer.lwn.net>
 <46789578-5785-eed3-24e7-14712ab78b99@gmail.com>
Date:   Mon, 21 Nov 2022 16:29:38 -0700
Message-ID: <877czn9999.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Akira Yokosawa <akiyks@gmail.com> writes:

> On Mon, 21 Nov 2022 14:01:16 -0700, Jonathan Corbet wrote:
>> So the purpose of this backmerge would be just to get rid of a few
>> warnings in docs-next for the next few weeks?  Given the jaundiced eye
>> with which Linus looks at backmerges, I'm inclined to just wait and let
>> it all settle out during the merge window.  Is there any work that would
>> be impeded by not doing that merge now?
> I thought the backmerge might reduce your annoyance when test-building
> for the next merge window with Sphinx >=3.1.
> You call those dozes of warnings *a few*.
> Of course, I can wait. :-)

Hey, I raised two kids, I'm good at dealing with annoyance...:)

Thanks,

jon
