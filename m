Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,T_DKIM_INVALID autolearn=ham
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5F94A7DE74
	for <lwn-linux-doc@archive.lwn.net>; Wed,  9 May 2018 12:02:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S934507AbeEIMCH (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 9 May 2018 08:02:07 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:42224 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755541AbeEIMCH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 9 May 2018 08:02:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=LeKjRIh97yzDW8uywTFfb224/Qb5V0t8Zfg93xtfvH0=; b=BC+ZBc64kRXGLxfNcHzonkAP+
        ndN/w17r10KWllgkxsAXc6RTPTpd2lghUWLUQhMQphZpKcLhewgoXHMgrhPCnfWZyb8k7y6v8QJ/1
        lQYW+ID0fPJupf6xm3GhfgMk7iSKbK5rzsbIy1sdidUvUnmAJAzSy8zyTVJABLBckdd5+J6E1pj1s
        vJZUpITrFxeQZnw6vNaqjXL1Bw6bEVupOj9LkGLVZ5PS5TDRqDEPfnUiFFiC0+IknX0z+Nig89gNz
        EKC4Fi18XIr+7h+OSr/QgSRytoOTIua8VMLfu1SxEqKPqVxAKVNZKOEL5bJEG1qevAL10cVXeTdDx
        0nob5N81A==;
Received: from 177.41.96.165.dynamic.adsl.gvt.net.br ([177.41.96.165] helo=vento.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1fGNnJ-000715-Il; Wed, 09 May 2018 12:02:06 +0000
Date:   Wed, 9 May 2018 09:02:01 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org,
        Michael Jamet <michael.jamet@intel.com>,
        Mike Rapoport <rppt@linux.vnet.ibm.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH 06/18] docs: core-api: add cgroup-v2 documentation
Message-ID: <20180509090201.145572f1@vento.lan>
In-Reply-To: <20180508095114.0da69ef3@lwn.net>
References: <cover.1525684985.git.mchehab+samsung@kernel.org>
        <b45083a64578b661cabadcf99d509e7def7c21a5.1525684985.git.mchehab+samsung@kernel.org>
        <20180508095114.0da69ef3@lwn.net>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Em Tue, 8 May 2018 09:51:14 -0600
Jonathan Corbet <corbet@lwn.net> escreveu:

> On Mon,  7 May 2018 06:35:42 -0300
> Mauro Carvalho Chehab <mchehab+samsung@kernel.org> wrote:
> 
> > The cgroup-v2.txt is already in ReST format. So, move it to the
> > core-api guide, where it belongs.
> > 
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>  
> 
> Honestly, this seems to me like sysadmin material, so I think it should
> go into the admin guide instead.
> 
> Actually, looking at the patch, it seems you agree - it's just the
> changelog that's wrong :)

Yeah, wrong cut-and-paste. Sorry for that.

> I could fix that, but it should probably be posted with a CC to Tejun
> first.

I'll repost it c/c to cgroup maintainers with the right
description.

Thanks,
Mauro
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
