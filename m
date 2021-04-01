Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83F37C433B4
	for <linux-doc@archiver.kernel.org>; Thu,  1 Apr 2021 18:06:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4E31F60FE6
	for <linux-doc@archiver.kernel.org>; Thu,  1 Apr 2021 18:06:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234744AbhDASGk (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 1 Apr 2021 14:06:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:37006 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236816AbhDASDB (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 1 Apr 2021 14:03:01 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E8E45611CC;
        Thu,  1 Apr 2021 12:37:05 +0000 (UTC)
From:   Catalin Marinas <catalin.marinas@arm.com>
To:     corbet@lwn.net, will@kernel.org, He Ying <heying24@huawei.com>
Cc:     linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH -next] docs: arm64: Fix a grammar error
Date:   Thu,  1 Apr 2021 13:37:04 +0100
Message-Id: <161728062026.15531.9076497905075968278.b4-ty@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210330085817.86185-1-heying24@huawei.com>
References: <20210330085817.86185-1-heying24@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 30 Mar 2021 04:58:17 -0400, He Ying wrote:
> depending -> depending on

Applied to arm64 (for-next/misc), thanks!

[1/1] docs: arm64: Fix a grammar error
      https://git.kernel.org/arm64/c/68f638a432df

-- 
Catalin

