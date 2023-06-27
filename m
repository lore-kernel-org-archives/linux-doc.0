Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA392EB64D9
	for <linux-doc@archiver.kernel.org>; Tue, 27 Jun 2023 23:16:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229568AbjF0XQS (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 27 Jun 2023 19:16:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229524AbjF0XQR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 27 Jun 2023 19:16:17 -0400
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C26441BCF;
        Tue, 27 Jun 2023 16:16:16 -0700 (PDT)
From:   Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1687907774;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=GRwoGOoZ7TfS3mJRWihfbPocmOKxdlsrgSr40GGWDkk=;
        b=H3TnR2/dn+iIhdhhgfSpvtynaVPPqWUAlALbmY6cd+k0ZU/4a748f9uZwlJKdT421E7g8S
        2n9g6Q6LPM6fbKCTVFcJ1hy2cx2s/C2s5Nxnw29AXuJpFKP0vdA/uCIybstHEu/AYNxVg1
        KoNrKEGKiKgzo5fWzRO7K/MgPUN+Af1XWwuDbPG8Vh6KMGYdwyQLKTX4MEnfsqVQHjz3mr
        ofBZ+WbFFGNguJPOkjmpBIdZfl5Ow0AALJRxB1qMq3+VZOAT5v/Sag+QE7KlWg622X+8SG
        lSrejnH8ZpsCnH+78CpRINbBEPHqTKWz58app4L07ZSMHemagVrGagTHxfNEnA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1687907774;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=GRwoGOoZ7TfS3mJRWihfbPocmOKxdlsrgSr40GGWDkk=;
        b=Q4gkUxqHAUXqzDp75Hqv4RlphQUUFvAeBJDBmNhwpsFmNnrWlJSQ6WBdOvSNlGbSpojief
        TdTps/8Ue79NweAA==
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org
Cc:     linux-doc@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Tom Lendacky <thomas.lendacky@amd.com>
Subject: Re: [PATCH] Documentation: embargoed-hardware-issues.rst: clean out
 empty and unused entries
In-Reply-To: <2023062742-mouse-appease-7917@gregkh>
References: <2023062742-mouse-appease-7917@gregkh>
Date:   Wed, 28 Jun 2023 01:16:13 +0200
Message-ID: <87edlw4htu.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jun 27 2023 at 13:26, Greg Kroah-Hartman wrote:

> There are a few empty entries in the company/project list, which
> confuses people as to why they are there, so remove them entirely, and
> also remove an entry that doesn't wish to participate in this process.
>
> Cc: Tom Lendacky <thomas.lendacky@amd.com>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Reviewed-by: Thomas Gleixner <tglx@linutronix.de>
