Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 83EE87DD2A
	for <lwn-linux-doc@archive.lwn.net>; Thu,  6 Dec 2018 15:03:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726166AbeLFPD1 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 6 Dec 2018 10:03:27 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:32938 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726150AbeLFPD1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 6 Dec 2018 10:03:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=1Ww/RtAgrRIH6lz2Y8vYaAIvbz9EYN+kMxq+fYs0Tlw=; b=DnMjz38YhyM7PLXhdeLObvURP
        JFeTpmgs2ZwbDa7eNFJHD14PdgsM9CV2tPU8RqzROvL9wlqmr6bK3dLhEXfTvlzVFYfQZmrrdpTFW
        LVdAKSFw5vTPAKbxgA5D+uufgT92OWm6YMexiRoiYu5ItAJM838GjbUizzO4t/yDVAo0CKriW9Ms8
        jJ14gvvvDivnMnro4WTt1hAkCOhd2zwjAsElYLNpvACeeO2It+uMNjmTebBYMnW5fIw0rwdiN2Bjg
        3JV45NvYx9xhfc7a8sMs3lcr2Kxo2Fxm+Xl1lBW1YiYCEQ+nvebKobsgJHhXc20IIKAgafwuRXudN
        kiv695RrQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red Hat Linux))
        id 1gUvBV-0000uP-EY; Thu, 06 Dec 2018 15:03:25 +0000
Date:   Thu, 6 Dec 2018 07:03:25 -0800
From:   Christoph Hellwig <hch@infradead.org>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     linux-kbuild@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>
Subject: Re: [PATCH 2/3] kbuild: generate asm-generic wrappers if mandatory
 headers are missing
Message-ID: <20181206150325.GA2726@infradead.org>
References: <1544009286-15705-1-git-send-email-yamada.masahiro@socionext.com>
 <1544009286-15705-2-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1544009286-15705-2-git-send-email-yamada.masahiro@socionext.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Dec 05, 2018 at 08:28:05PM +0900, Masahiro Yamada wrote:
> Some time ago, Sam pointed out a certain degree of overwrap between
> generic-y and mandatory-y. (https://lkml.org/lkml/2017/7/10/121)
> 
> I a bit tweaked the meaning of mandatory-y; now it defines the minimum
> set of ASM headers that all architectures must have.
> 
> If arch does not have specific implementation of a mandatory header,
> Kbuild will let it fallback to the asm-generic one by automatically
> generating a wrapper. This will allow to drop lots of redundant
> generic-y defines.
> 
> Previously, "mandatory" was used in the context of UAPI, but I guess
> this can be extended to kernel space ASM headers.

How useful is it to keep the generic-y behavior around at all vs making
everything useful mandatory?
