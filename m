Return-Path: <SRS0=98ua=5C=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E18AC10F29
	for <linux-doc@archiver.kernel.org>; Tue, 17 Mar 2020 15:06:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D9FCF20714
	for <linux-doc@archiver.kernel.org>; Tue, 17 Mar 2020 15:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1584457561;
	bh=OwU2LE2IoKg+lQxkLtb4DQDIXWAPOFBX7/UD8iAQLuE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-ID:From;
	b=wbyD2ZekeK3xLzDNhZSKQCfRGtrgk8SFkFc7S0I5p5w5biclImRJsmLC5ELeySySI
	 XaGLpmDwkAVA6OIC0qfCFQ+OQ3likB6KAsCw3zVfbm8TvLmT/LHXAHxOdit0XWHBUq
	 ZCpDE2E0TbFs/JSIagwXtxCtWPhtvFDfZY1cmWeE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726836AbgCQPF6 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 17 Mar 2020 11:05:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:46828 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726388AbgCQPF6 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 17 Mar 2020 11:05:58 -0400
Received: from coco.lan (ip5f5ad4e9.dynamic.kabel-deutschland.de [95.90.212.233])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2B69F20714;
        Tue, 17 Mar 2020 15:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584457557;
        bh=OwU2LE2IoKg+lQxkLtb4DQDIXWAPOFBX7/UD8iAQLuE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=TY5dXTUF30PZED5B2tekjznH/47LJBKMu3UYOQvJ6y9LH/t1q+B9wQAgIs8pJFzeD
         jOAKDfKMaN5mdCSrRptFDJmNjIiH1TizYi6bByP5sF5hgXSTzfRfkPOvb6Ywr/7Sss
         gxGsStTVt0uXRovp3n3GxWMfRaq7I5UQeLrhazZA=
Date:   Tue, 17 Mar 2020 16:05:49 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH 13/17] i2c: include/linux/i2c.h: fix a doc warning
Message-ID: <20200317160549.3c23bbda@coco.lan>
In-Reply-To: <20200317150322.GB1134@ninjato>
References: <cover.1584456635.git.mchehab+huawei@kernel.org>
        <24cbf9166b21531186e5b6d37a3f9201f957abef.1584456635.git.mchehab+huawei@kernel.org>
        <20200317150322.GB1134@ninjato>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Em Tue, 17 Mar 2020 16:03:22 +0100
Wolfram Sang <wsa@the-dreams.de> escreveu:

> On Tue, Mar 17, 2020 at 03:54:22PM +0100, Mauro Carvalho Chehab wrote:
> > Don't let non-letters inside a literal block without escaping it, as
> > the toolchain would mis-interpret it:
> > 
> > ./include/linux/i2c.h:518: WARNING: Inline strong start-string without end-string.
> > 
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>  
> 
> Shall I take this via I2C?

Yeah, feel free to pick it. The patches on this series are pretty
much independent from the others.

Thanks,
Mauro
