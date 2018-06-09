Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 4824D7D043
	for <lwn-linux-doc@archive.lwn.net>; Sat,  9 Jun 2018 00:10:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753227AbeFIAKn (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 8 Jun 2018 20:10:43 -0400
Received: from merlin.infradead.org ([205.233.59.134]:41602 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753039AbeFIAKm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 8 Jun 2018 20:10:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
        Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=nB8hSxv0O1j7Dg4ADjfxQSWfIKeFH39X9kWYSmhDa7E=; b=P5ben5uHoX9hFH+31mqthGbFNR
        OuUEXzj8LWQDQhS55FJ5wwbkDLyA9kQ23bPzWX4tva/qjQ+RhFKj4vJLBNytOKBYlgOczEzVnyKTD
        VBcUwUZZDLHsznDAOR4uUcND5EvRZQF/0n0x0OajUOrq9Kd+fo+2aNzRx9Nvf7HcCijVpDCCAq3Uq
        IAHqI+s7mxRJmfj9lhJrKlBt4BXiWwZZ3DcXmOgTbS9R+YkTTGT2NoKszOO8bbSVsB8U/lu1YTOEr
        KeW5YDsxpmQFI8mPwCEJn2kF18JLvtBru6TUcnyXuaVUnGqTTJOawM3urJsGuGe+ip42Fk4VcEy3Z
        RXyE8XvA==;
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16] helo=midway.dunlab)
        by merlin.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1fRRSU-0001Sm-GM; Sat, 09 Jun 2018 00:10:18 +0000
Subject: Re: [PATCH 5/5] Documentation/x86: Add CET description
To:     Yu-cheng Yu <yu-cheng.yu@intel.com>, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-mm@kvack.org,
        linux-arch@vger.kernel.org, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        "H.J. Lu" <hjl.tools@gmail.com>,
        Vedvyas Shanbhogue <vedvyas.shanbhogue@intel.com>,
        "Ravi V. Shankar" <ravi.v.shankar@intel.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Andy Lutomirski <luto@amacapital.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Oleg Nesterov <oleg@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
        Mike Kravetz <mike.kravetz@oracle.com>
References: <20180607143544.3477-1-yu-cheng.yu@intel.com>
 <20180607143544.3477-6-yu-cheng.yu@intel.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <0c91f979-85e1-6deb-9570-9749c8eaf15b@infradead.org>
Date:   Fri, 8 Jun 2018 17:10:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180607143544.3477-6-yu-cheng.yu@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 06/07/2018 07:35 AM, Yu-cheng Yu wrote:
> Explain how CET works and the noshstk/noibt kernel parameters.
> 
> Signed-off-by: Yu-cheng Yu <yu-cheng.yu@intel.com>
> ---
>  Documentation/admin-guide/kernel-parameters.txt |   6 +
>  Documentation/x86/intel_cet.txt                 | 161 ++++++++++++++++++++++++
>  2 files changed, 167 insertions(+)
>  create mode 100644 Documentation/x86/intel_cet.txt
> 

> diff --git a/Documentation/x86/intel_cet.txt b/Documentation/x86/intel_cet.txt
> new file mode 100644
> index 000000000000..1b902a6c49f4
> --- /dev/null
> +++ b/Documentation/x86/intel_cet.txt
> @@ -0,0 +1,161 @@
> +-----------------------------------------
> +Control Flow Enforcement Technology (CET)
> +-----------------------------------------
> +
> +[1] Overview
> +
> +Control Flow Enforcement Technology (CET) provides protection against
> +return/jump-oriented programing (ROP) attacks.  It can be implemented to

                        programming

> +protect both the kernel and applications.  In the first phase, only the
> +user-mode protection is implemented for the 64-bit kernel.  Thirty-two bit
> +applications are supported under the compatibility mode.
> +
> +CET includes shadow stack (SHSTK) and indirect branch tracking (IBT) and
> +they are enabled from two kernel configuration options:
> +
> +  INTEL_X86_SHADOW_STACK_USER, and

no comma.

> +  INTEL_X86_BRANCH_TRACKING_USER.
> +
> +There are two command-line options for disabling CET features:
> +
> +  noshstk - disables shadow stack, and
> +  noibt - disables indirect branch tracking.
> +
> +At run time, /proc/cpuinfo shows the availability of SHSTK and IBT.
> +

[snip]


thanks,
-- 
~Randy
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
