Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32E59C678D5
	for <linux-doc@archiver.kernel.org>; Wed,  8 Mar 2023 14:41:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231932AbjCHOlt (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 8 Mar 2023 09:41:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231982AbjCHOl2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 8 Mar 2023 09:41:28 -0500
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2338DB6D7
        for <linux-doc@vger.kernel.org>; Wed,  8 Mar 2023 06:39:41 -0800 (PST)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id D6C312C3;
        Wed,  8 Mar 2023 14:39:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net D6C312C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1678286380; bh=LaEwZX6NZ05ginfLQT+9LvrZWbhKXF0n8wqUhqymkzI=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=HAhEFX9siDLaUx+qc05bpQh1ecDYZdaRGNDOc5tuenF/mkY2Vokoz4d9yhJ12hO+P
         +s6VnIstOYtOmQEvBw9WfgWQhgPIDNupPXy7ChVdHxFufzm64Xv8BGlzDOzHPwRgUq
         czKx4DCh3Ghek3fsrQScWPXYFI4e6wuicYfHfy8IndpPKOhd8NVe8+6LkV2jvZ7iuq
         tW1czTOzzy7fMNsHQNri5SPpmgkM97s4Y84hKzlLwCNJNA/qG1jY3RS7+v85bmiUI7
         obDW9YLH0DREm2rGYsixzdpsdTxPbbVJ4QaWSCH+DURyD3gykJUr7zMzSAeVwIGAR2
         qBVmgRySAAuNg==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     linux-doc@vger.kernel.org,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>,
        kernel@pengutronix.de, David Rientjes <rientjes@google.com>
Subject: Re: [PATCH] docs: rebasing-and-merging: Drop wrong statement about git
In-Reply-To: <20230308073058.ipiudixcn2fpwaus@pengutronix.de>
References: <20230228134657.1797871-1-u.kleine-koenig@pengutronix.de>
 <875yblzjoe.fsf@meer.lwn.net>
 <20230308073058.ipiudixcn2fpwaus@pengutronix.de>
Date:   Wed, 08 Mar 2023 07:39:38 -0700
Message-ID: <87v8jbl32t.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de> writes:

> On Tue, Feb 28, 2023 at 12:14:41PM -0700, Jonathan Corbet wrote:
>> So the patch is worth applying, but I may tweak the changelog some.
>
> I spotted a414684e3b735a4114c19295a07e8cb2eb889dae in next now. You made
> the changelog read:
>
> 	The "^0" syntax is no longer needed to fast-forward to a mainline commit
>
> I'm willing to bet that ^0 was never needed to force a fast-forward and
> using it was never had an advantage.

https://lore.kernel.org/lkml/CA+55aFwaxsNZ0ACQkASdDTbSrdcHMJpFPtswK485tEWRB=
VVYrA@mail.gmail.com/

Git has since been changed, as I said before, so that it's no longer
necessary to use the ^0 notation.  So I maintain that, while the doc
change was good, the changelog wasn't quite right.

jon
