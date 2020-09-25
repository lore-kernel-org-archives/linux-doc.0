Return-Path: <SRS0=pZ1j=DC=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09DA5C4363D
	for <linux-doc@archiver.kernel.org>; Fri, 25 Sep 2020 04:14:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A31DD21D91
	for <linux-doc@archiver.kernel.org>; Fri, 25 Sep 2020 04:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601007258;
	bh=1YF2QRKWOnWrJ1zY8mp4fEGQ4HLySD66w8vtf27iqS8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-ID:From;
	b=U3t/7RSaUD006zS3YlGrRyEiDG7TRQ9jIB1m5lv/zK3MmVrc87nBA+4U45EXaqnPD
	 YUn6wjUgz/MygzxlqHwipFnhTgY00VQSKEaK/VWamkiND5bwsfI4x/cLdx9iSmib4/
	 YcLgDj0ZbZ8w1RgPk2HlQ0JkYV+SfAjNVy7cgWyw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726889AbgIYEOS (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 25 Sep 2020 00:14:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:37330 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726758AbgIYEOR (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 25 Sep 2020 00:14:17 -0400
Received: from coco.lan (ip5f5ad5bf.dynamic.kabel-deutschland.de [95.90.213.191])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B08B221D20;
        Fri, 25 Sep 2020 04:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601007257;
        bh=1YF2QRKWOnWrJ1zY8mp4fEGQ4HLySD66w8vtf27iqS8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=SItvLPwsxJKErQ/HPfugEklcgAXQOtj55G+IblhJ+CFuk5ds7AiOvh9M+De1YdCI8
         xnz9NfI6d9znqRS+buRBeOjUkKQwMI4NRNWuZ+XMyX2h9Af3tFO1PD9YCgbJmyUrdy
         eKHBIwDGzTGhyV0IV8YNf2Am3bm6CRXX6KWhitLw=
Date:   Fri, 25 Sep 2020 06:14:13 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] docs: cdomain.py: add support for two new Sphinx
 3.1+ tags
Message-ID: <20200925061413.5e166662@coco.lan>
In-Reply-To: <20200924102225.46fbfafd@lwn.net>
References: <cover.1600945712.git.mchehab+huawei@kernel.org>
        <4b8a20013ca0b631724e8a986544ada08ac3dfd7.1600945712.git.mchehab+huawei@kernel.org>
        <20200924094335.65944316@lwn.net>
        <20200924181354.59087a8d@coco.lan>
        <20200924102225.46fbfafd@lwn.net>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Em Thu, 24 Sep 2020 10:22:25 -0600
Jonathan Corbet <corbet@lwn.net> escreveu:

> On Thu, 24 Sep 2020 18:13:54 +0200
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> 
> > > How can this possibly work without a "global namespace" declaration in
> > > markup_namespace()?    
> > 
> > ... While I'm not a python expert, the namespace variable is global
> >     because it was defined outside the "markup_namespace" function.  
> 
> Assignments within functions are *always* local unless declared global.
> 
> Try this:
> 
> 	$ python3
> 	>>> x = 0
> 	>>> def y(v):
> 	>>>	x = v
> 	>>>
> 	>>> y(1)
> 	>>> x  
> 	0
> 	>>>  
> 
> So your assignment to "namespace" in markup_namespace() cannot change the
> global, since it's not declared global.

Ok! Thanks for helping with this. I'll declare namespace as global for
the next version.

Thanks,
Mauro
