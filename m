Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF12EC43381
	for <linux-doc@archiver.kernel.org>; Thu, 14 Jan 2021 01:55:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9035A2310A
	for <linux-doc@archiver.kernel.org>; Thu, 14 Jan 2021 01:55:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728397AbhANByh (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 13 Jan 2021 20:54:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729648AbhAMXy4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 13 Jan 2021 18:54:56 -0500
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 332C8C0617A2;
        Wed, 13 Jan 2021 15:24:25 -0800 (PST)
Received: from lwn.net (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 9A8646132;
        Wed, 13 Jan 2021 23:24:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 9A8646132
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1610580265; bh=Q7+Y7LKXkVAGeN134Mxv0g5tuHJqDerkJg9QZMMJMlg=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=EAOrejo3tVWr3rPpO8hgQAeLiN8gOTu02A2DHlM1DsBhay2XXvj1CD7O9m7a3oWS8
         9bgiywwl82dzrrcpcjkKLZnVas/Q3pKM98tsanVzYF0TpxZg+SZH80hsvSvdtOKdNA
         ECfJWYVzLgzm2VDtH7shgckzztimqDnnj9c6jTW5iDeRYIePV4f/2rBfl8BVwqXS4e
         F9J9eqOmw4C+1kf0K7T+zulEUQNaGBEg+bysOh9fqu1C3w/JVXEpPlFQPS7Ceu9LG4
         vUW3/0FBfK5f4JS4u0oei7OmbHaCL6qSuQy2ig+Q03HcPyVgYQ96/qo9Q8O8I3Igxg
         P3X0Od1Mt0Izg==
Date:   Wed, 13 Jan 2021 16:24:23 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Yanteng Si <siyanteng@loongson.cn>,
        Harry Wei <harryxiyou@gmail.com>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        linux-doc@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH for doc-next] doc/zh_CN: mips: use doc references
 instead
Message-ID: <20210113162423.5255f7b8@lwn.net>
In-Reply-To: <20210113070557.28792-1-lukas.bulwahn@gmail.com>
References: <20210113070557.28792-1-lukas.bulwahn@gmail.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 13 Jan 2021 08:05:57 +0100
Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:

> The Chinese mips translations refer to non-existing labels in the original
> documentation. Hence, make htmldocs warns about those undefined labels on
> all files in ./Documentation/translations/zh_CN/mips/.
> 
> Replace the references to non-existing labels with suitable doc references.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Applied, thanks.

jon
