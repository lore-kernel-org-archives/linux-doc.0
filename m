Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A3E1C678D5
	for <linux-doc@archiver.kernel.org>; Wed,  8 Mar 2023 19:23:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230099AbjCHTXl (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 8 Mar 2023 14:23:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229841AbjCHTXg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 8 Mar 2023 14:23:36 -0500
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C332591C4
        for <linux-doc@vger.kernel.org>; Wed,  8 Mar 2023 11:23:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
        Message-ID:Sender:Reply-To:Content-ID:Content-Description;
        bh=F2/oRxm9F/YTA23JYPgKdtEwgtNV/Q1m5JbZrToTnPE=; b=saL8NDuui0ux+WSPWIb1yfubJn
        pVNmgx8nyZY737zVj7w2p5Tk4Vytb8My+0+S5kjvsOE9ovNpvgLjZwlH+ki5lGSlEtSJqY9fl3DHs
        rLPFfTmm0e5bfS/UfkkxwqECioCfL2IzZmK0KR7wPodu1Q9KNlHKNnynrSvdKqVKXy1npRbN65+xr
        ioXz0yXxIZ40KiXC9YrsxeUugPkoYuSNC6Jv3ws9m20Rg2DZoSWQ5Ggym6KetMs00og3T0b3MfetA
        uxONNUU+4JWUI7mHQZud/BOQe1KxMs9QJVd1SDyJV3OAMQ8Rvc76dj8C6AurDu8H5Lo4FdAHGe3Ma
        QyFDqoYw==;
Received: from [2601:1c2:980:9ec0::df2f]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1pZzNo-006XPQ-Si; Wed, 08 Mar 2023 19:23:28 +0000
Message-ID: <89ff369a-054e-b190-d541-0071e9c4e5e2@infradead.org>
Date:   Wed, 8 Mar 2023 11:23:28 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH -v3] Documentation/process: Add Linux Kernel Contribution
 Maturity Model
Content-Language: en-US
To:     Theodore Ts'o <tytso@mit.edu>, linux-doc@vger.kernel.org
Cc:     Kees Cook <keescook@chromium.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Christian Brauner <brauner@kernel.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Jonathan Corbet <corbet@lwn.net>
References: <20230308190403.2157046-1-tytso@mit.edu>
From:   Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230308190403.2157046-1-tytso@mit.edu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 3/8/23 11:04, Theodore Ts'o wrote:
> As a follow-up to a discussion at the 2021 Maintainer's Summit on the
> topic of maintainer recruitment and retention, the TAB took on the
> task of creating a document which to help companies and other
> organizations to grow in their ability to engage with the Linux Kernel
> development community, using the Maturity Model[2] framework.
> 
> The goal is to encourage, in a management-friendly way, companies to
> allow their engineers to contribute with the upstream Linux Kernel
> development community, so we can grow the "talent pipeline" for
> contributors to become respected leaders, and eventually kernel
> maintainers.
> 
> [1] https://lwn.net/Articles/870581/
> [2] https://en.wikipedia.org/wiki/Maturity_model
> 
> Signed-off-by: Theodore Ts'o <tytso@mit.edu>
> Co-developed-by: Kees Cook <keescook@chromium.org>
> Signed-off-by: Kees Cook <keescook@chromium.org>
> Co-developed-by: Dan Williams <dan.j.williams@intel.com>
> Signed-off-by: Dan Williams <dan.j.williams@intel.com>
> Acked-by: Jakub Kicinski <kuba@kernel.org>
> Acked-by: Christian Brauner (Microsoft) <brauner@kernel.org>
> Acked-by: Dave Hansen <dave.hansen@linux.intel.com>
> Acked-by: Jonathan Corbet <corbet@lwn.net>
> ---
>  .../process/contribution-maturity-model.rst   | 109 ++++++++++++++++++
>  Documentation/process/index.rst               |   1 +
>  MAINTAINERS                                   |   8 ++
>  3 files changed, 118 insertions(+)
>  create mode 100644 Documentation/process/contribution-maturity-model.rst
> 
> diff --git a/Documentation/process/contribution-maturity-model.rst b/Documentation/process/contribution-maturity-model.rst
> new file mode 100644
> index 000000000000..b87ab34de22c
> --- /dev/null
> +++ b/Documentation/process/contribution-maturity-model.rst

> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8d5bc223f305..3ce66e199c97 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -21244,6 +21244,14 @@ S:	Maintained
>  F:	Documentation/tools/rtla/
>  F:	tools/tracing/rtla/
>  

This chunk is in the wrong location for alphabetical order.
Other than that:

Acked-by: Randy Dunlap <rdunlap@infradead.org>

> +TECHNICAL ADVISORY BOARD PROCESS DOCS
> +M:	"Theodore Ts'o" <tytso@mit.edu>
> +M:	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> +L:	tech-board-discuss@lists.linux-foundation.org
> +S:	Maintained
> +F:	Documentation/process/researcher-guidelines.rst
> +F:	Documentation/process/contribution-maturity-model.rst
> +
>  TRADITIONAL CHINESE DOCUMENTATION
>  M:	Hu Haowen <src.res@email.cn>
>  L:	linux-doc-tw-discuss@lists.sourceforge.net (moderated for non-subscribers)

-- 
~Randy
