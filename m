Return-Path: <SRS0=2m1s=C2=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86C48C433E2
	for <linux-doc@archiver.kernel.org>; Thu, 17 Sep 2020 16:42:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 234D2206B6
	for <linux-doc@archiver.kernel.org>; Thu, 17 Sep 2020 16:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600360932;
	bh=ZbFCcq9rxKOm2jqLy5LrwzzDX3URSfmspDs7nsDj/b4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=2XYJ0wuj7ddna67KIN7V4M/2SZstRViTfFjcRU7S3paLluDeYjVRpOsa5Z+Al7kIR
	 eYEDpHyPAFIMCFsjI5QEGFfmVrIeAT1NdLtku9rAOZsRajpnv+CFxuY/eljxvXfOAe
	 4CY0G+wbpaqGKyxP7ze/0yWeIhwZ3C5G0gd095cE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728591AbgIQQlV (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 17 Sep 2020 12:41:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:45916 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728581AbgIQQiL (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 17 Sep 2020 12:38:11 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BA182214D8;
        Thu, 17 Sep 2020 16:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600360691;
        bh=ZbFCcq9rxKOm2jqLy5LrwzzDX3URSfmspDs7nsDj/b4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rCNJ+LLShql7CSA8MK8XMSJoU5yHqPOcvX8RSdZ+Uy3bucYkDG2A2umXzQ/ST1PV/
         /0LPrLjM8Pt6GJD9ZrU6VfiL5Ngoy4wpLfZs1Ataa/2ZcT5gCwDbo03z3Cigdp5rDI
         0KuJFk2+UryYS9MrZGDGM2ChDfW8zB+iEppMSgcM=
Date:   Thu, 17 Sep 2020 18:38:43 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Bhaskar Chowdhury <unixbhaskar@gmail.com>
Cc:     b.zolnierkie@samsung.com, linux-fbdev@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        corbet@lwn.net, rdunlap@infradead.org, daniel@ffwll.ch,
        yuanmingbuaa@gmail.com, w@1wt.eu, nopitydays@gmail.com,
        zhangyunhai@nsfocus.com, luto@amacapital.net,
        torvalds@linux-foundation.org
Subject: Re: [PATCH v4 0/4] docs: fb: Removed framebuffer scrollback related
 documentations
Message-ID: <20200917163843.GA721081@kroah.com>
References: <cover.1600333774.git.unixbhaskar@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1600333774.git.unixbhaskar@gmail.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Sep 17, 2020 at 03:56:11PM +0530, Bhaskar Chowdhury wrote:
> 
> In this patch series, documentation get in sync with the code removal
> of scrollback,by this commit 50145474f6ef ("fbcon: remove soft scrollback code"),
> by eliminating the information related to it.

Much nicer, thanks for sticking with it:

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
