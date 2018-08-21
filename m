Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 638C67D57F
	for <lwn-linux-doc@archive.lwn.net>; Tue, 21 Aug 2018 16:44:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727119AbeHUUFR (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 21 Aug 2018 16:05:17 -0400
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]:52034 "EHLO
        foss.arm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727043AbeHUUFR (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 21 Aug 2018 16:05:17 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 32B66ED1;
        Tue, 21 Aug 2018 09:44:25 -0700 (PDT)
Received: from e107564-lin.cambridge.arm.com (e107564-lin.cambridge.arm.com [10.2.131.9])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F236D3F5BC;
        Tue, 21 Aug 2018 09:44:22 -0700 (PDT)
Date:   Tue, 21 Aug 2018 17:44:17 +0100
From:   Brian Starkey <brian.starkey@arm.com>
To:     Matthew Wilcox <willy@infradead.org>
Cc:     dri-devel@lists.freedesktop.org, daniel.vetter@ffwll.ch,
        airlied@linux.ie, gustavo@padovan.org,
        maarten.lankhorst@linux.intel.com, seanpaul@chromium.org,
        corbet@lwn.net, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, alexandru-cosmin.gheorghe@arm.com,
        liviu.dudau@arm.com, ayan.halder@arm.com
Subject: Re: [PATCH] drm/fourcc: Add DOC: overview comment
Message-ID: <20180821164416.GA11553@e107564-lin.cambridge.arm.com>
References: <20180821161611.10424-1-brian.starkey@arm.com>
 <20180821162639.GA21697@bombadil.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20180821162639.GA21697@bombadil.infradead.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Matthew,

On Tue, Aug 21, 2018 at 09:26:39AM -0700, Matthew Wilcox wrote:
>On Tue, Aug 21, 2018 at 05:16:11PM +0100, Brian Starkey wrote:
>> There's a number of things which haven't previously been documented
>> around the usage of format modifiers. Capture the current
>> understanding in an overview comment and add it to the rst
>> documentation.
>>
>> Ideally, the generated documentation would also include documentation
>> of all of the #defines, but the kernel-doc system doesn't currently
>> support kernel-doc comments on #define constants.
>
>Can you turn them into enums?  This seems to work ok:
>
>-/* color index */
>-#define DRM_FORMAT_C8          fourcc_code('C', '8', ' ', ' ') /* [7:0] C */
>-
>-/* 8 bpp Red */
>-#define DRM_FORMAT_R8          fourcc_code('R', '8', ' ', ' ') /* [7:0] R */
>+enum {
>+       /* color index */
>+       DRM_FORMAT_C8   = fourcc_code('C', '8', ' ', ' '), /* [7:0] C */
>+       /* 8 bpp Red */
>+       DRM_FORMAT_R8   = fourcc_code('R', '8', ' ', ' '), /* [7:0] R */
>+};
>
>but I appreciate this is user API and maybe there's some code out there
>that does #ifndef DRM_FORMAT_C8 ...

Thanks for the suggestion, Daniel did mention the same. However,
unfortunately I don't think we can safely change the UAPI header in
this manner.

Cheers,
-Brian
