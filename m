Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DBD1C433EF
	for <linux-doc@archiver.kernel.org>; Mon, 13 Jun 2022 19:14:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236879AbiFMTOo (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 13 Jun 2022 15:14:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238758AbiFMTOH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 13 Jun 2022 15:14:07 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79B4735862
        for <linux-doc@vger.kernel.org>; Mon, 13 Jun 2022 10:33:26 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 33328736;
        Mon, 13 Jun 2022 17:33:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 33328736
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1655141606; bh=NVQY+s9dya+hMKYs7UhypkaiGBM7Fn6qOR5BWob8Syo=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=ZewnITy/D7nI/TQhPJECQ5mnuSHxCtS5ofHziSxUjtSDTqMpY48K4qExRGQDdi5+x
         OvUyvO0lK5unHqdbDwuaCOAgPGZJB8Ov0z7LuFn6Lsr2Nf4ivJnEEnHan8mlCdaDPF
         lBqRf4eVmV2tmczPM60IQ9cZnSSOaWonU7sUKaVEFMnvltlYyK5YSFB7wBKtxJ1oKJ
         NesnzLf1v0pcFlR+UtJ3C6Ry6xXUZco3svRwEtylhR1kyTgpIcpDpmbiaBdfmK8DjI
         znPWRszFFuKwkHxkza4fQpQ9X/ssoSpUagQlXUuxmSuCvgeyptFR3SNRNsqh0ziqQH
         1/5oJxwsTQr1A==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Wu XiangCheng <bobwxc@email.cn>, Alex Shi <alexs@kernel.org>,
        Yanteng Si <siyanteng@loongson.cn>
Cc:     linux-doc@vger.kernel.org
Subject: Re: [PATCH v2] docs/zh_CN: Update translation of
 reporting-issues.rst to 5.18
In-Reply-To: <YoRlDOUl/eg+h/Cc@bobwxc.mipc>
References: <cover.1652792205.git.bobwxc@email.cn>
 <YoRlDOUl/eg+h/Cc@bobwxc.mipc>
Date:   Mon, 13 Jun 2022 11:33:25 -0600
Message-ID: <87zgigzcwq.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Wu XiangCheng <bobwxc@email.cn> writes:

> Update zh_CN/admin-guide/reporting-issues.rst to newest English version
>
> commit 247097e2bbff4 ("docs: reporting-issues.rst: link new document
>                        about regressions")
>
> Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
> ---
> v2:
> * merge former two patches together
> * give the commit a better name
>
> v1:
> <https://lore.kernel.org/linux-doc/cover.1652792205.git.bobwxc@email.cn/T/#t>
>
>  .../zh_CN/admin-guide/reporting-issues.rst    | 125 +++++++++++-------
>  1 file changed, 79 insertions(+), 46 deletions(-)

Applied, thanks.

jon
