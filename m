Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A7D3C4332F
	for <linux-doc@archiver.kernel.org>; Wed,  9 Nov 2022 20:28:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230251AbiKIU20 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 9 Nov 2022 15:28:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230443AbiKIU2Z (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 9 Nov 2022 15:28:25 -0500
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE73CE88;
        Wed,  9 Nov 2022 12:28:24 -0800 (PST)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 539EF735;
        Wed,  9 Nov 2022 20:28:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 539EF735
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1668025704; bh=f25C52WqClKg0hiPz6ke8Ln0/+csbTbRGI5rYqAAW9g=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=lxUb2GqlcqDmymCfkPh3fcmdCVVN/WgMbuogsRQSSXZmGwpX8PE2MKst45QbEbSde
         CTqe9XqizU1SAadETkCj5VlxmZOytuFL9dLow9+Wz/mZkLO5ruNKDKQ5J15Ba1priO
         d0zJBG5fKRcOfSJmTmpvleQYaSS+0mXrrP+3N6hIucxO4rhwjzByTlMKIk9i8pYdPg
         ftzlTKznmPU6Dn/VV3LTmzwbQIp+ki2qQTTO6WtTIawsLwq+g7mqKz4+KryJx/vcvC
         HshPgN6OAfQsuEuuHGpAGvrBB4JzQ5DIV80O8EcHsIiab0hRJuBQVX/9KDr3+ZAXRa
         M+q4T4N3QFT4w==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Rui Li <me@lirui.org>, Wu XiangCheng <wu.xiangcheng@linux.dev>,
        Alex Shi <alexs@kernel.org>, Yanteng Si <siyanteng@loongson.cn>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rui Li <me@lirui.org>
Subject: Re: [PATCH v4] docs/zh_CN: Add userspace-api/seccomp_filter Chinese
 translation
In-Reply-To: <20221108112921.312071-1-me@lirui.org>
References: <20221108112921.312071-1-me@lirui.org>
Date:   Wed, 09 Nov 2022 13:28:23 -0700
Message-ID: <87a64zlvo8.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Rui Li <me@lirui.org> writes:

> Translate the following documents into Chinese:
>
> - userspace-api/seccomp_filter.rst
>
> Also adjust index order according to the original index file.
>
> Signed-off-by: Rui Li <me@lirui.org>
> ---
> Changes since v3:
> - Improve translation.
>
> Changes since v2:
> - Fix some typo.
>
> Changes since v1:
> - Add a note for Seccomp.
> - Fix some typo.
> ---
>  .../zh_CN/userspace-api/index.rst             |   4 +-
>  .../zh_CN/userspace-api/seccomp_filter.rst    | 293 ++++++++++++++++++
>  2 files changed, 295 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/translations/zh_CN/userspace-api/seccomp_filter.rst

Applied, thanks.

jon
