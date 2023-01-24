Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3E34C54E94
	for <linux-doc@archiver.kernel.org>; Tue, 24 Jan 2023 22:05:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235177AbjAXWFe (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 24 Jan 2023 17:05:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235178AbjAXWFc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 24 Jan 2023 17:05:32 -0500
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 522E5521E3;
        Tue, 24 Jan 2023 14:04:59 -0800 (PST)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id E2B0399C;
        Tue, 24 Jan 2023 22:04:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net E2B0399C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1674597886; bh=b9wX+EPKF8LMzFlBp7moLL2r723CGwKnPFthU9QqeaM=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=XhVGgJiGradEM2ZdmLm0ziXiZEPA1MeFVU+3tHp6jyu+gAlPOiGWwuN5s6Hm0pR+j
         TL/q6elhIhsjnDNmkiPH5z0k9rCxg8/D72X5dQquBgT5TsbaKFOxqbp4ummxkKeAI9
         2Y5LPFErpAMePR5Pu/so6zxaZxzaFIbefuTi6HnzlFhBQCnbMz9Z067NeZSDIEcwv8
         QpGYd62dmeQ+iqHaoMub7/eCZZIsZTlWlJ2NdjkFpMzVvC25OhsDAe5FwQB/9xKqvN
         yo93VfmGm2NXuR9Sf2cVLKtVD7DhwwbvlcecbhotAT1e6YHlYL2hoTAMJpUHfjZMyf
         WLpZhnTc0AK5A==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Takashi Iwai <tiwai@suse.de>, SeongJae Park <sj@kernel.org>
Cc:     alsa-devel@alsa-project.org, linux-doc@vger.kernel.org,
        Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 8/8] Docs/sound/index: Add missing SPDX License
 Identifier
In-Reply-To: <268823a3-f453-a38b-3fd7-500306675890@linux.intel.com>
References: <20230122213650.187710-1-sj@kernel.org>
 <20230122213650.187710-9-sj@kernel.org> <875ycxr7qv.wl-tiwai@suse.de>
 <268823a3-f453-a38b-3fd7-500306675890@linux.intel.com>
Date:   Tue, 24 Jan 2023 15:04:45 -0700
Message-ID: <87r0vjfv2a.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com> writes:

> On 1/23/23 02:10, Takashi Iwai wrote:
>> On Sun, 22 Jan 2023 22:36:50 +0100,
>> SeongJae Park wrote:
>>>
>>> Add missing SPDX License Identifier for sound documentation index file.
>>>
>>> Signed-off-by: SeongJae Park <sj@kernel.org>
>> 
>> Acked-by: Takashi Iwai <tiwai@suse.de>
>
> Isn't GPL-2.0 deprecated? It should be GPL-2.0-only, no?
>
> https://spdx.org/licenses/GPL-2.0.html
>
> https://spdx.org/licenses/GPL-2.0-only.html

The kernel community hasn't really followed along with that change on
the part of the SPDX folks; as far as I know, GPL-2.0 is considered to
be just fine.  There are currently more than twice as many GPL-2.0
declarations than GPL-2.0-only.

Thanks,

jon
