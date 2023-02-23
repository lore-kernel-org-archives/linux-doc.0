Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCC03C61DA4
	for <linux-doc@archiver.kernel.org>; Thu, 23 Feb 2023 16:01:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233320AbjBWQBN (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 23 Feb 2023 11:01:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234880AbjBWQBM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 23 Feb 2023 11:01:12 -0500
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF2233B865
        for <linux-doc@vger.kernel.org>; Thu, 23 Feb 2023 08:01:09 -0800 (PST)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 2AFBE4E5;
        Thu, 23 Feb 2023 16:01:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 2AFBE4E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1677168069; bh=aN831SzKEjozkfFZ3z4VZjtahCEViG+rHV1qghG/BRA=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=jkMRSVZTeCwbWmxWKzrU7WELKfUKN4W14xngld0hDQn2sxMtQbXcJHwO4daca/EMB
         edTgAPjcyiz/CJsl9UQISo91tiBqz7XlHEOMIyfo7OdDJ0Sw1ewATQuLHoLlAsnSMK
         taHrcW5droMGhl6QnauITXj4yJqzY4vLciLHho0jY1j5oYPcnkHFfI3snYacTxf/ht
         C7/ALVBKxMMS2OLaNMwneBO23oKlNdvdDl+oZ/0k4MYmvePEV55ZClM7OyHOCh6DnY
         SIXAMc7hZlRKS9RbEfTeBgeXZbr46OKHfX4E1clULmEypHpgZ+LcTQcP7Wg2FEHNFw
         nk9pYMyGMGSIw==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Harsh Mishra <hmisraji07@gmail.com>, linux-doc@vger.kernel.org
Cc:     Harsh Mishra <hmisraji07@gmail.com>, skhan@linuxfoundation.org
Subject: Re: [PATCH] Fixed the Warning:
 Documentation/admin-guide/hw-vuln/cross-thread-rsb.rst:92: WARNING:
 Unexpected indentation.
In-Reply-To: <20230222232759.12599-1-hmisraji07@gmail.com>
References: <20230222232759.12599-1-hmisraji07@gmail.com>
Date:   Thu, 23 Feb 2023 09:01:08 -0700
Message-ID: <87k0085q2j.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Harsh Mishra <hmisraji07@gmail.com> writes:

> ------
>
> Dear Maintainers and Mentors,
> I have successfully compeleted the task "Documentation Task" under "Linux Kernel Bug Fixing Spring 2023" Mentee Application. 
> I have also solved a minor documentation warning in Documentation/admin-guide/hw-vuln/cross-thread-rsb.rst .
> Please have a look into it 
> Regards,
> Harsh Mishra

Thank you for working to improve our documentation!

That said, I do have a few requests, starting with:

- Please read Documentation/process/submitting-patches.rst for
  information on how your changelog should be written.  Among other
  things, the changelog should be *above* the '---' line, briefly
  describe the problem and why it needs to be fixed, and not contain
  extraneous information.

> Signed-off-by: Harsh Mishra <hmisraji07@gmail.com>
> ---
>  Documentation/admin-guide/hw-vuln/cross-thread-rsb.rst | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/Documentation/admin-guide/hw-vuln/cross-thread-rsb.rst b/Documentation/admin-guide/hw-vuln/cross-thread-rsb.rst
> index ec6e9f5bcf9e..d0fd6cf44911 100644
> --- a/Documentation/admin-guide/hw-vuln/cross-thread-rsb.rst
> +++ b/Documentation/admin-guide/hw-vuln/cross-thread-rsb.rst
> @@ -88,5 +88,4 @@ capability to override those interceptions, but since this is not common, the
>  mitigation that covers this path is not enabled by default.
>  
>  The mitigation for the KVM_CAP_X86_DISABLE_EXITS capability can be turned on
> -using the boolean module parameter mitigate_smt_rsb, e.g.:
> -        kvm.mitigate_smt_rsb=1
> +using the boolean module parameter mitigate_smt_rsb, e.g.: kvm.mitigate_smt_rsb=1

This is not a terrible fix, but may not be the best one.  Most likely,
the author wanted this as a literal block:

  ...the boolean module parameter mitigate_smt_rsb, e.g.::

	kvm.mitigate_smt_rsb=1

Thanks,

jon
