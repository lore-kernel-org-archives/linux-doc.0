Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3E5AC05027
	for <linux-doc@archiver.kernel.org>; Tue, 14 Mar 2023 18:12:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229632AbjCNSMF (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 14 Mar 2023 14:12:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229464AbjCNSME (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 14 Mar 2023 14:12:04 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B81B26854;
        Tue, 14 Mar 2023 11:12:02 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 0823344A;
        Tue, 14 Mar 2023 18:12:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 0823344A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1678817522; bh=hZIB3fXbwJyV05G1DqnBxpSsaRU2qVB2wPhuKl4K2+M=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=H0hHeZaKWaEdQZDneY6d4KftcMJ5qnrBC0HkBJZxOMRMiJ6jrM5MV8S4byzRmPWFA
         eRlH+fggJT06S7QC9EighIoEMm6e5Kcy3uw+khhldE9N/gTfql/zC6EX/eZmjthHRy
         M5oDWukWVfaWX1zMSLTE7SQj0ztrj5t5JvnI22l2HMfDS/vGcJpd7wgRFJdeoPBpaz
         7wDpb00DlmsKZPHsUfqHF6yVXVvVKB7IBtv0J4QaBzKc+EgR82mNjJzjPAoOlQdz+D
         ZBz0fcRDXn7c+qZZqUdxDQ2zeZcJLdQtIChCfPF0Sw3SE2C7kz0pLiDRN/Cl0Xu8Yw
         NtsCHLdn/57bQ==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
        linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH] Documentation: fs/proc: corrections and update
In-Reply-To: <20230314060347.605-1-rdunlap@infradead.org>
References: <20230314060347.605-1-rdunlap@infradead.org>
Date:   Tue, 14 Mar 2023 12:12:01 -0600
Message-ID: <87zg8frymm.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Randy Dunlap <rdunlap@infradead.org> writes:

> Update URL for the latest online version of this document.
> Correct "files" to "fields" in a few places.
> Update /proc/scsi, /proc/stat, and /proc/fs/ext4 information.
> Drop /usr/src/ from the location of the kernel source tree.
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
> Cc: linux-fsdevel@vger.kernel.org
> ---
>  Documentation/filesystems/proc.rst |   44 ++++++++++++++-------------
>  1 file changed, 23 insertions(+), 21 deletions(-)

Applied, thanks.

jon
