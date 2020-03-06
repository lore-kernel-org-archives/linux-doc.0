Return-Path: <SRS0=ldhC=4X=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1490C3F2D2
	for <linux-doc@archiver.kernel.org>; Fri,  6 Mar 2020 00:27:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8EFB620705
	for <linux-doc@archiver.kernel.org>; Fri,  6 Mar 2020 00:27:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726191AbgCFA1d (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 5 Mar 2020 19:27:33 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:43871 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726162AbgCFA1c (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 5 Mar 2020 19:27:32 -0500
Received: by ozlabs.org (Postfix, from userid 1034)
        id 48YT3733F8z9sRR; Fri,  6 Mar 2020 11:27:31 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: f52153ab383f04a45c38d8a7f55a4249477b20df
In-Reply-To: <20191211160910.21656-2-sourabhjain@linux.ibm.com>
To:     Sourabh Jain <sourabhjain@linux.ibm.com>
From:   Michael Ellerman <patch-notifications@ellerman.id.au>
Cc:     corbet@lwn.net, mahesh@linux.vnet.ibm.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sourabh Jain <sourabhjain@linux.ibm.com>,
        linuxppc-dev@ozlabs.org, gregkh@linuxfoundation.org,
        hbathini@linux.ibm.com
Subject: Re: [PATCH v6 1/6] Documentation/ABI: add ABI documentation for /sys/kernel/fadump_*
Message-Id: <48YT3733F8z9sRR@ozlabs.org>
Date:   Fri,  6 Mar 2020 11:27:31 +1100 (AEDT)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 2019-12-11 at 16:09:05 UTC, Sourabh Jain wrote:
> Add missing ABI documentation for existing FADump sysfs files.
> 
> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>

Series applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/f52153ab383f04a45c38d8a7f55a4249477b20df

cheers
