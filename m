Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B70FAC433F5
	for <linux-doc@archiver.kernel.org>; Tue, 17 May 2022 19:24:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349120AbiEQTYd (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 17 May 2022 15:24:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241252AbiEQTYc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 17 May 2022 15:24:32 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B92542ED0
        for <linux-doc@vger.kernel.org>; Tue, 17 May 2022 12:24:31 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:3d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id AF3E06D6;
        Tue, 17 May 2022 19:24:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net AF3E06D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1652815470; bh=AH3h+xG6S1UxZts7MM4Lbl1Q2bHxyw36LloElg4QbMY=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=lp55WB7BfyirtKSVDyGKX1DwDS4bdbzFAkpKnFkhylVyIPJe2m4VhamgskemEisrl
         lohRZb3QZ0q0QDNKL97M8aSKnkgYzTpRu7qO/cbWvcsgIGbIJayrH88RyGGuZywT4r
         uREhGFP8sGzFxbqgE3sPOpoMDj8BWY/K2eSrYeJ/Z2IyIfaZhDBA39JYVAhdiLw8H8
         AS2GSuE6xgfgDw+vCYDlnpmzATY+JgeRMszKXM8xrSN2rjUtayZ7Yb5515ADLGuWX7
         Wlcchi5LR4P5d6KDcriaVRNegOkdDV70xq6qI8wdkR+E80U6gLA0Xln+vzZOS23AhX
         t3oMDoH/nH8PQ==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Wu XiangCheng <bobwxc@email.cn>, Alex Shi <alexs@kernel.org>,
        Yanteng Si <siyanteng@loongson.cn>
Cc:     linux-doc@vger.kernel.org
Subject: Re: [PATCH 0/2] docs/zh_CN: sync reporting-issues.rst to 247097e2bbff4
In-Reply-To: <cover.1652792205.git.bobwxc@email.cn>
References: <cover.1652792205.git.bobwxc@email.cn>
Date:   Tue, 17 May 2022 13:24:30 -0600
Message-ID: <877d6kvu6p.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Wu XiangCheng <bobwxc@email.cn> writes:

> sync zh_CN/admin-guide/reporting-issues.rst to newest version
> (commit 247097e2bbff4)
>
> There are two patches in the same name, the first acturally been
> reviewed by Alex and Yanteng last year , see <https://lore.kernel.org/linux-doc/CAMU9jJor_V_G6wG1vWnDvgQADeXaPxg9E47w27nk_sBNGJpuEg@mail.gmail.com/>,
> but not been picked up yet. So I rebase it to newest docs-next and resend
> it. Then bring a new sync commit.

I'm not quite sure what happened with that patch, but I do know that
posting multiple patches with the same subject line is a recipe for
confusion; please don't do that.

In this case, is there any reason to not just merge those two patches
together?  Then make the subject line read something like "Update the
translation of reporting-issues.rst to 5.18" or something like that.

Thanks,

jon
