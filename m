Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE127C3DA7A
	for <linux-doc@archiver.kernel.org>; Mon,  2 Jan 2023 23:30:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230154AbjABXaa (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 2 Jan 2023 18:30:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229587AbjABXa2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 2 Jan 2023 18:30:28 -0500
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12E746355;
        Mon,  2 Jan 2023 15:30:28 -0800 (PST)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id BF22D2E0;
        Mon,  2 Jan 2023 23:30:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net BF22D2E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1672702227; bh=2rFC3aW60ZhpXACUfZv8bN1+7nPrRX+uUNMRBmIa3dk=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=GVh0x0ybkzoj3+3T8abAx/SahhYeqwKZLpuDwjj0bu7Uek6TJLI9wVj7GjdPlqKza
         ygYZt3CVyHKwAHDSC3fuHBmKP+MflFDuYAEyYSsBmOAj9vT0yq3AglO0m+spiYXhSD
         V7vdZun4WxZRoelUfR9X16mmerEGUE2aDJiNwh2fUpm33tj+ksVbvR+RTd7kjBgw3G
         m81MqBvjhH410kz//wGL/D3ZKpfUJ9rd1fyzJqibDDQgoA3D8X3e4lFfa2kdqVERzB
         yoN4VJYG9t9xOzuZ+qxz1Zd2ynGEWhk+l24Z5uEsm8XOILmR4AXdbTbQKknudLhD83
         7dRlLnAXzB7Gw==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Steven Rostedt <rostedt@goodmis.org>,
        Donglin Peng <dolinux.peng@gmail.com>
Cc:     tzanussi@gmail.com, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: ftrace: fix a issue with duplicated subtitle number
In-Reply-To: <20221209164255.6c15e535@gandalf.local.home>
References: <20221209025119.1371570-1-dolinux.peng@gmail.com>
 <20221209164255.6c15e535@gandalf.local.home>
Date:   Mon, 02 Jan 2023 16:30:27 -0700
Message-ID: <87edsch5v0.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Steven Rostedt <rostedt@goodmis.org> writes:

> On Thu,  8 Dec 2022 18:51:19 -0800
> Donglin Peng <dolinux.peng@gmail.com> wrote:
>
>> The subtitle "5.3 Clearing filters" and "5.3 Subsystem filters" has
>> the same index number, let's fix it.
>> 
>> Fixes: 95b696088c1c ("tracing/filters: add filter Documentation")
>> Signed-off-by: Donglin Peng <dolinux.peng@gmail.com>
>
> Acked-by: Steven Rostedt (Google) <rostedt@goodmis.org>
>
> Jon, care to take this?

Done.

Thanks,

jon
