Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id CD8717DE79
	for <lwn-linux-doc@archive.lwn.net>; Thu, 10 May 2018 16:34:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S966346AbeEJQe7 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 10 May 2018 12:34:59 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:34530 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965017AbeEJQe6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 10 May 2018 12:34:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=Fexp7bhbcjZvaNOfeGfDXgYRBAXsGLocCyoyaRBbeHY=; b=oaw5aSlP/djr6lMOTOa/FSJci
        uvGso09D9YSlebvphERMwrXvLq32l3ADfNLeSZgInhQ1ICaajdjTj30aJpMtcXKNVh5YaoPJVrRf4
        SwCloCDvLvpqs8+3LoKeBAT+4kZDBBYK1o/C3PQGoSjJdmCoNMD5K4raGDYDv1JUYzvrpMM3X/usB
        qPasqKcc7K/VO2qXcMp5/Dgb8+IggQna9LcMISWgNx517HxrpHJvh7C1XlbvnQqrP79BcDVGN4qx7
        KdaYAeduMDXYnXHbGwIrrcGDQrlmKxHqsnElcs595DZM2C+cavoKgrBcuZ5DeDC4wkgaDuouF6kjF
        EkYEHlKig==;
Received: from willy by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red Hat Linux))
        id 1fGoWv-0001PU-4R; Thu, 10 May 2018 16:34:57 +0000
Date:   Thu, 10 May 2018 09:34:56 -0700
From:   Matthew Wilcox <willy@infradead.org>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Christoph Hellwig <hch@infradead.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>
Subject: Re: [RFC PATCH 1/2] scripts/kernel-doc: Auto-detect common
 code-blocks
Message-ID: <20180510163456.GC30442@bombadil.infradead.org>
References: <2ac6e3da22119f714406925139e40f4d835d11a4.1525962971.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2ac6e3da22119f714406925139e40f4d835d11a4.1525962971.git.mchehab+samsung@kernel.org>
User-Agent: Mutt/1.9.2 (2017-12-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, May 10, 2018 at 10:38:16AM -0400, Mauro Carvalho Chehab wrote:
> Comments that end with a comma and have certain keywords
> should be presented as code-blocks

I think this is a bit fragile.  Why not just search for ':\n'?  Is
there ever a case where we want to write:

/**
 * foo is a bar:
 * wibble
 */
and have wibble not be a code-block?

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
