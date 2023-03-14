Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2036CC05027
	for <linux-doc@archiver.kernel.org>; Tue, 14 Mar 2023 18:52:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231264AbjCNSwC (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 14 Mar 2023 14:52:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231226AbjCNSvx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 14 Mar 2023 14:51:53 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15D9A19C41;
        Tue, 14 Mar 2023 11:51:41 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id A683E7F9;
        Tue, 14 Mar 2023 18:51:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net A683E7F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1678819900; bh=EqarAuL84CPQ/T2h5Yo0ww3HHQdh9VsTqkJjh9VIqMQ=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=Kf5IaAfhwFQkArkt/+C6LbpWkUJQirPqvUfr5IhR7Ez8+KDISXFCSfgs7ZPb+CU7P
         8ujFKZa3AUyPmJQHCdKdVit+V1q6+QY1wS2858pPmIHxkzL/HiRnndxKpCCg9Z9X09
         yv9Eb6mHa/8F/TzGssa3VcnWAQnQVE/KF0vKHWZ04YCptkOObIcZGpDA/cP+JG/UzN
         m90/8MPmKxwe6aHcMiYCiRR6hz+yxHb7CZjH6Xxq2Pw//xAeQRawmBqlt75MfEbkLj
         cBWVosk8IUFtll/6apOVkI/X6/cjwGsoW19jSh4vcr+J54LsELEoCCCZZ0diMUMHvy
         Yoq8ItTbHnI2w==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Carlos Bilbao <carlos.bilbao@amd.com>
Cc:     kaiwan.billimoria@gmail.com, rlove@rlove.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Carlos Bilbao <carlos.bilbao@amd.com>
Subject: Re: [PATCH v2] docs: Add relevant kernel publications to list of books
In-Reply-To: <20230222183445.3127324-1-carlos.bilbao@amd.com>
References: <20230222183445.3127324-1-carlos.bilbao@amd.com>
Date:   Tue, 14 Mar 2023 12:51:39 -0600
Message-ID: <87wn3jqi84.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Carlos Bilbao <carlos.bilbao@amd.com> writes:

> For the list of kernel published books, include publication covering kernel
> debugging from August, 2022 (ISBN 978-1801075039) and one from March, 2021
> on the topic of char device drivers and kernel synchronization (ISBN
> 978-1801079518). Also add foundational book from Robert Love (ISBN
> 978-1449339531) and remove extra spaces.
>
> Co-developed-by: Carlos Bilbao <carlos.bilbao@amd.com>
> Signed-off-by: Kaiwan N Billimoria <kaiwan.billimoria@gmail.com>
> Signed-off-by: Carlos Bilbao <carlos.bilbao@amd.com>
>
> ---
>
> Changes since v1:
>
>  - Fix name of author Kaiwan N Billimoria.
>  - Include other book, from 2021, also authored by Kaiwan.
>  - Include Kaiwan's SoB.
>
> ---
>  Documentation/process/kernel-docs.rst | 36 +++++++++++++++++++++++----
>  1 file changed, 31 insertions(+), 5 deletions(-)

Applied, thanks.

jon
