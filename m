Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09AB3C001E0
	for <linux-doc@archiver.kernel.org>; Mon, 31 Jul 2023 15:54:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232874AbjGaPym (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 31 Jul 2023 11:54:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231199AbjGaPyk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 31 Jul 2023 11:54:40 -0400
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7019E1704;
        Mon, 31 Jul 2023 08:54:39 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id E77FC2B0;
        Mon, 31 Jul 2023 15:54:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net E77FC2B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1690818879; bh=d7ZdYmCN1L8a0kS8FRQZHqV6enyFRZjMWMxCa/PQrqM=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=NeSiWaxdIypq+AxOyOuD62s3RCdzY3MlxieHzm3gAGITa1Hr49m1dmUCwg2W4034N
         ZWMJyBzeRMOqg7ze8+jTjaDmurjJOHJdu6WrXB/NTvHoIKG//WLn4Qp1XQFKFmBoPg
         58rrucw2+yBZY8l5/SInWQjyFJexRZ1mjckvw26aatHcWx2VCHcjdify4prKCjM/N0
         ZdEYP4V1h7Z+fgSlrQzvQPhbMNdNQh+VhZ5rUNLUzGEG9SY66GmfKDUJXqUuEgKIkd
         H+NhWeHN7sRICRuHS9qg23HT1qrjHmncVVG62E2hV6awbNqNgLkKkUt3Pi9wgGdMKZ
         k4VQsY80X8SYg==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Ramazan Safiullin <ram.safiullin2001@gmail.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Suren Baghdasaryan <surenb@google.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ramazan Safiullin <ram.safiullin2001@gmail.com>,
        Sabina Trendota <sabinatrendota@gmail.com>
Subject: Re: [PATCH] docs: psi: use correct config name
In-Reply-To: <20230728115600.231068-1-ram.safiullin2001@gmail.com>
References: <20230728115600.231068-1-ram.safiullin2001@gmail.com>
Date:   Mon, 31 Jul 2023 09:54:38 -0600
Message-ID: <87sf94dqkh.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Ramazan Safiullin <ram.safiullin2001@gmail.com> writes:

> Commit 2ce7135adc9a ("psi: cgroup support") adds documentation which refers
> to CONFIG_CGROUP, but the correct name is CONFIG_CGROUPS.
>
> Correct the reference to CONFIG_CGROUPS.
>
> Co-developed-by: Sabina Trendota <sabinatrendota@gmail.com>
> Signed-off-by: Sabina Trendota <sabinatrendota@gmail.com>
> Signed-off-by: Ramazan Safiullin <ram.safiullin2001@gmail.com>
> ---
>  Documentation/accounting/psi.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/accounting/psi.rst b/Documentation/accounting/psi.rst
> index df6062eb3abb..d455db3e5808 100644
> --- a/Documentation/accounting/psi.rst
> +++ b/Documentation/accounting/psi.rst
> @@ -178,7 +178,7 @@ Userspace monitor usage example
>  Cgroup2 interface
>  =================
>  
> -In a system with a CONFIG_CGROUP=y kernel and the cgroup2 filesystem
> +In a system with a CONFIG_CGROUPS=y kernel and the cgroup2 filesystem
>  mounted, pressure stall information is also tracked for tasks grouped
>  into cgroups. Each subdirectory in the cgroupfs mountpoint contains
>  cpu.pressure, memory.pressure, and io.pressure files; the format is

Applied, thanks.

jon
