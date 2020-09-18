Return-Path: <SRS0=bpCa=C3=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67B24C43464
	for <linux-doc@archiver.kernel.org>; Fri, 18 Sep 2020 13:25:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2A9ED207FF
	for <linux-doc@archiver.kernel.org>; Fri, 18 Sep 2020 13:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600435545;
	bh=G/e6nP7tB6JJ82T2l/UuOlCcHfU2ER69cUanXqbjBxg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=mGdF2p7+/4CV82piuuMBgmn7UYERLQXwNDnFpKZBElihYbRbOZ78hHaupXTG1uO/X
	 NzJKdPTUKvCGKAlP5uUKYQKzsRCVXZn6sHkC9T///ZrzFHk/7YDNuZlQNLyydrMLXD
	 LU8plVxk2g8nwT3YKlkp1Y23VrrdxUy0+zShicto=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726917AbgIRNZh (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 18 Sep 2020 09:25:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:56158 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726759AbgIRNZh (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 18 Sep 2020 09:25:37 -0400
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 33A512078D;
        Fri, 18 Sep 2020 13:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600435536;
        bh=G/e6nP7tB6JJ82T2l/UuOlCcHfU2ER69cUanXqbjBxg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HW6HKqFGe7Z5pCz/n5ZkbXUtRvTv007S/C8TwIQO71BqAcIyQ3HI/hkiY22ytTEYK
         5Dgwr7at7I7AKw6qJN61hf05N6sZusKncE8FchIzLC8dEX1jaY3Sn0EkflGotjdxNA
         nV2845SvAVNG9d2b9LuaCDSEIA0bWRalVtgBfQTs=
Date:   Fri, 18 Sep 2020 14:25:31 +0100
From:   Will Deacon <will@kernel.org>
To:     Bailu Lin <bailu.lin@vivo.com>
Cc:     catalin.marinas@arm.com, corbet@lwn.net, harryxiyou@gmail.com,
        alex.shi@linux.alibaba.com, linux-arm-kernel@lists.infradead.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@vivo.com
Subject: Re: [PATCH v3] doc: zh_CN: index files in arm64 subdirectory
Message-ID: <20200918132530.GA31232@willie-the-truck>
References: <20200916130714.42438-1-bailu.lin@vivo.com>
 <20200918081126.20765-1-bailu.lin@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200918081126.20765-1-bailu.lin@vivo.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Sep 18, 2020 at 01:11:26AM -0700, Bailu Lin wrote:
> Add arm64 subdirectory into the table of Contents for zh_CN,
> then add other translations in arm64 conveniently.
> 
> Signed-off-by: Bailu Lin <bailu.lin@vivo.com>
> ---
> Changes in v3:
>  - Correct email encoding format.
> Changes in v2:
>  - Fix patch description.
> ---
>  Documentation/arm64/index.rst                    |  4 ++++
>  Documentation/translations/zh_CN/arm64/index.rst | 16 ++++++++++++++++
>  Documentation/translations/zh_CN/index.rst       |  1 +
>  3 files changed, 21 insertions(+)
>  create mode 100644 Documentation/translations/zh_CN/arm64/index.rst

Acked-by: Will Deacon <will@kernel.org>

I'm assuming Jon will pick this one up.

Cheers,

Will
