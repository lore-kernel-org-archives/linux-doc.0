Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 608D87D2EF
	for <lwn-linux-doc@archive.lwn.net>; Thu, 20 Jun 2019 08:26:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726583AbfFTI0U (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 20 Jun 2019 04:26:20 -0400
Received: from mx2.suse.de ([195.135.220.15]:34042 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726072AbfFTI0U (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 20 Jun 2019 04:26:20 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 2B8E1ADA2;
        Thu, 20 Jun 2019 08:26:19 +0000 (UTC)
Date:   Thu, 20 Jun 2019 10:25:57 +0200
From:   Borislav Petkov <bp@suse.de>
To:     Ethan Sommer <e5ten.arch@gmail.com>
Cc:     hpa@zytor.com, Jonathan Corbet <corbet@lwn.net>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Kees Cook <keescook@chromium.org>,
        Joe Perches <joe@perches.com>,
        Federico Vaga <federico.vaga@vaga.pv.it>,
        Ingo Molnar <mingo@kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Mark Rutland <mark.rutland@arm.com>,
        John Stultz <john.stultz@linaro.org>,
        Corey Minyard <cminyard@mvista.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] replace timeconst bc script with an sh script
Message-ID: <20190620082557.GB28346@zn.tnic>
References: <8a9ffb4b-791d-35d1-bb2a-7b6ad812bff1@ideasonboard.com>
 <20190620081142.31302-1-e5ten.arch@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190620081142.31302-1-e5ten.arch@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jun 20, 2019 at 04:11:32AM -0400, Ethan Sommer wrote:
> removes the bc build dependency introduced when timeconst.pl was
> replaced by timeconst.bc:
> 70730bca1331 ("kernel: Replace timeconst.pl with a bc script")

I don't see you answering Kieran's questions anywhere...

-- 
Regards/Gruss,
    Boris.

SUSE Linux GmbH, GF: Felix Imendörffer, Mary Higgins, Sri Rasiah, HRB 21284 (AG Nürnberg)
