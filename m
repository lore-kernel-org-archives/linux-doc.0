Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6429C4332B
	for <linux-doc@archiver.kernel.org>; Thu, 28 Jan 2021 22:43:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9662464DF2
	for <linux-doc@archiver.kernel.org>; Thu, 28 Jan 2021 22:43:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231533AbhA1Wmz (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 28 Jan 2021 17:42:55 -0500
Received: from ms.lwn.net ([45.79.88.28]:48146 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231481AbhA1Wmo (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 28 Jan 2021 17:42:44 -0500
Received: from lwn.net (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id B8C2A6178;
        Thu, 28 Jan 2021 22:41:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net B8C2A6178
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1611873700; bh=cAnmIGNniQpZ7DbBfxiWMjVdcPX5sR3KqgME/wQPrKQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=sBtVvYFfswWyrhacumNMuqxz19P+pre+artjKxOpU6COqY6GbiaTBe3qwEzOyezXr
         HUQ9LQOnPvQVXJYoi9vAYqL3GDXOin1LwJQ9H7Drq5y05fC1BdkKRDN9oMmWVDBFVm
         9qpjm4j892m3AVZSw1EBdoAJl+cLNy7iGECq6hBCecVAbIuCep69Y/9Bqn9q0t8dhm
         ar6njvMX53RmmjpTvDuEprkDJqXVlxu5T5cf0uDADyottA8e1hz+fOch+Gm5Ntjags
         x4ku39UYcmM80zp08briF0z/zAImn+g2mD1JPaxeGDqoZfpwhM75tBiK+ZtfsKw7hn
         84w9+1++9ax8g==
Date:   Thu, 28 Jan 2021 15:41:38 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     Alex Shi <alex.shi@linux.alibaba.com>,
        Harry Wei <harryxiyou@gmail.com>,
        Yanteng Si <siyanteng01@gmail.com>, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH v4 1/3] docs/zh_CN: add iio iio_configfs.rst translation
Message-ID: <20210128154138.4c4841d7@lwn.net>
In-Reply-To: <20210121033302.558935-1-siyanteng@loongson.cn>
References: <20210121033302.558935-1-siyanteng@loongson.cn>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 21 Jan 2021 11:33:00 +0800
Yanteng Si <siyanteng@loongson.cn> wrote:

> This patch translates Documentation/iio/iio_configfs.rst into Chinese.
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> Reviewed-by: Alex Shi <alex.shi@linux.alibaba.com>
> ---
>  .../translations/zh_CN/iio/iio_configfs.rst   | 102 ++++++++++++++++++
>  1 file changed, 102 insertions(+)
>  create mode 100644 Documentation/translations/zh_CN/iio/iio_configfs.rst

All three patches applied, thanks.

In the future, please consider providing a cover letter with a multi-part
series like this.

Thanks,

jon
