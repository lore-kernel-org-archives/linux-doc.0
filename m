Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9DFFC001E0
	for <linux-doc@archiver.kernel.org>; Wed, 16 Aug 2023 13:02:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238513AbjHPNBw (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 16 Aug 2023 09:01:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245321AbjHPNBi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 16 Aug 2023 09:01:38 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 130301FF3
        for <linux-doc@vger.kernel.org>; Wed, 16 Aug 2023 06:01:37 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 0B43D37C;
        Wed, 16 Aug 2023 13:01:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 0B43D37C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1692190895; bh=yfe9XyGLYaRO3yjoGXTTjNsrn0HHz8CERryZBncGOQM=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=R3S701Q5ZfucTewmQstPBeBnrY2gU8tLQsx4b+ypCM8VqcpTrydh7iYIBSYhu5GpV
         i98pwyXP/hSKe48h+KzYqfjQS3xvv9Jaa9q+CVnW5ei+kFKFlegL3xspaOQGBxFvgo
         nZo+v1+KMi3AdJgkXFIkJA/bHSjc8xQmrOidZJRhpIkiCSn9jKFew/EdpXg93HG32o
         gdI5/bHhEpuuN7ZxwKdOkoLW9PWbVMTARp1iPSkhGGYUxRBH79gEMMZQVV1McZWXBD
         KuB1Vhfk9UIQ5BAAeZbRvTe5MKgZGAnUWh4jGfP4DqLIOH7ndeRimerzwKfSf/wWtL
         Q1NLdL0bJ5s2Q==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Sarah Walker <sarah.walker@imgtec.com>, linux-doc@vger.kernel.org
Cc:     Matt Coster <matt.coster@imgtec.com>,
        Donald Robson <donald.robson@imgtec.com>,
        Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v5 16/17] drm/imagination: Add driver documentation
In-Reply-To: <20230816082806.164968-1-sarah.walker@imgtec.com>
References: <20230816082806.164968-1-sarah.walker@imgtec.com>
Date:   Wed, 16 Aug 2023 07:01:34 -0600
Message-ID: <87r0o3rvip.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Sarah Walker <sarah.walker@imgtec.com> writes:

> Add documentation for the UAPI and for the virtual memory design.

One little thing I happened to notice on a quick glance:

> +Begin by calling :c:func:`pvr_vm_create_context` to obtain a VM context. It is
> +bound to a PowerVR device (:c:type:`pvr_device`) and holds a reference to it.

Rather than writing out the :c:func: incantation, just say
pvr_vm_create_context().  All of the right things will happen, and your
document will be a lot more readable.

Thanks,

jon
