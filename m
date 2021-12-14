Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D28A9C433EF
	for <linux-doc@archiver.kernel.org>; Tue, 14 Dec 2021 19:17:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230244AbhLNTRh (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 14 Dec 2021 14:17:37 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:44688 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229937AbhLNTRh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 14 Dec 2021 14:17:37 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D1C44616C7
        for <linux-doc@vger.kernel.org>; Tue, 14 Dec 2021 19:17:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 945E4C34600;
        Tue, 14 Dec 2021 19:17:34 +0000 (UTC)
From:   Catalin Marinas <catalin.marinas@arm.com>
To:     Yanteng Si <siyanteng01@gmail.com>, pcc@google.com
Cc:     Will Deacon <will@kernel.org>, akpm@linux-foundation.org,
        linux-doc@vger.kernel.org, corbet@lwn.net,
        Yanteng Si <siyanteng@loongson.cn>, andreyknvl@gmail.com
Subject: Re: [PATCH] docs/arm64: delete a space from tagged-address-abi
Date:   Tue, 14 Dec 2021 19:17:32 +0000
Message-Id: <163950943659.2458372.12834621660814675088.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211209091922.560979-1-siyanteng@loongson.cn>
References: <20211209091922.560979-1-siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 9 Dec 2021 17:19:22 +0800, Yanteng Si wrote:
> Since e71e2ace5721("userfaultfd: do not untag user pointers") which
> introduced a warning:
> 
> linux/Documentation/arm64/tagged-address-abi.rst:52: WARNING: Unexpected indentation.
> 
> Let's fix it.
> 
> [...]

Applied to arm64 (for-next/misc), thanks!

[1/1] docs/arm64: delete a space from tagged-address-abi
      https://git.kernel.org/arm64/c/f2cefc0c2d2a

-- 
Catalin

