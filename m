Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id DB6777D57F
	for <lwn-linux-doc@archive.lwn.net>; Tue, 21 Aug 2018 16:26:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727707AbeHUTrc (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 21 Aug 2018 15:47:32 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:34790 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726935AbeHUTrb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 21 Aug 2018 15:47:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=o8xLlsreWDwgt0z83lGD6dssrTL0SCwl+PZ33fIzVao=; b=edckW98b2gEHoggIrQihEajE/
        FPOCXTOF5p45ni+2DK46iS4KbbzviOTNFK2juu8IJhR9XEAODFv2qAYbYTsaNWHS/LN2CpwSksuVQ
        eNUG5TKRs2gGVMp5oVyGV2oZNoNhlEhW9fbCB3Z/eWyYz5Iawvcr/3aLY9NPKgBhe5Q0UL/CADGyu
        2hB2CGPFgHiXnNW7l6oc6YsZFtILliUEEqxojF/fdKHUzZOEVgYxccnbgBPrvZhRPbWzlypSF0z5y
        +Se6iFhnisA3yPRNjzY/hKXgstuN9PYDN3YemvrEObXTqb2N1Fg6W/qpWAerOQhEgxoDtSq191bIH
        uek64pPeg==;
Received: from willy by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red Hat Linux))
        id 1fs9UN-0005NL-CG; Tue, 21 Aug 2018 16:26:39 +0000
Date:   Tue, 21 Aug 2018 09:26:39 -0700
From:   Matthew Wilcox <willy@infradead.org>
To:     Brian Starkey <brian.starkey@arm.com>
Cc:     dri-devel@lists.freedesktop.org, daniel.vetter@ffwll.ch,
        airlied@linux.ie, gustavo@padovan.org,
        maarten.lankhorst@linux.intel.com, seanpaul@chromium.org,
        corbet@lwn.net, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, alexandru-cosmin.gheorghe@arm.com,
        liviu.dudau@arm.com, ayan.halder@arm.com
Subject: Re: [PATCH] drm/fourcc: Add DOC: overview comment
Message-ID: <20180821162639.GA21697@bombadil.infradead.org>
References: <20180821161611.10424-1-brian.starkey@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180821161611.10424-1-brian.starkey@arm.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Aug 21, 2018 at 05:16:11PM +0100, Brian Starkey wrote:
> There's a number of things which haven't previously been documented
> around the usage of format modifiers. Capture the current
> understanding in an overview comment and add it to the rst
> documentation.
> 
> Ideally, the generated documentation would also include documentation
> of all of the #defines, but the kernel-doc system doesn't currently
> support kernel-doc comments on #define constants.

Can you turn them into enums?  This seems to work ok:

-/* color index */
-#define DRM_FORMAT_C8          fourcc_code('C', '8', ' ', ' ') /* [7:0] C */
-
-/* 8 bpp Red */
-#define DRM_FORMAT_R8          fourcc_code('R', '8', ' ', ' ') /* [7:0] R */
+enum {
+       /* color index */
+       DRM_FORMAT_C8   = fourcc_code('C', '8', ' ', ' '), /* [7:0] C */
+       /* 8 bpp Red */
+       DRM_FORMAT_R8   = fourcc_code('R', '8', ' ', ' '), /* [7:0] R */
+};

but I appreciate this is user API and maybe there's some code out there
that does #ifndef DRM_FORMAT_C8 ...
