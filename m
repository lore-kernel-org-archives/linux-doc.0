Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6A0777D90D
	for <lwn-linux-doc@archive.lwn.net>; Mon, 22 Jul 2019 18:35:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727855AbfGVSfi (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 22 Jul 2019 14:35:38 -0400
Received: from smtprelay0152.hostedemail.com ([216.40.44.152]:56129 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727744AbfGVSfh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 22 Jul 2019 14:35:37 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay01.hostedemail.com (Postfix) with ESMTP id 37ADE100E806B;
        Mon, 22 Jul 2019 18:35:36 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: sort55_4dc629887d118
X-Filterd-Recvd-Size: 2243
Received: from XPS-9350.home (cpe-23-242-196-136.socal.res.rr.com [23.242.196.136])
        (Authenticated sender: joe@perches.com)
        by omf10.hostedemail.com (Postfix) with ESMTPA;
        Mon, 22 Jul 2019 18:35:34 +0000 (UTC)
Message-ID: <207e201cb7a36e38f032bcb66e79e2d4b9b63c7b.camel@perches.com>
Subject: Re: [RFC PATCH] string.h: Add stracpy/stracpy_pad (was: Re: [PATCH]
 checkpatch: Added warnings in favor of strscpy().)
From:   Joe Perches <joe@perches.com>
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Kees Cook <keescook@chromium.org>,
        Nitin Gote <nitin.r.gote@intel.com>, akpm@linux-foundation.org,
        corbet@lwn.net, apw@canonical.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-hardening@lists.openwall.com,
        Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Date:   Mon, 22 Jul 2019 11:35:33 -0700
In-Reply-To: <20190722182703.GE363@bombadil.infradead.org>
References: <1562219683-15474-1-git-send-email-nitin.r.gote@intel.com>
         <f6a4c2b601bb59179cb2e3b8f4d836a1c11379a3.camel@perches.com>
         <d1524130f91d7cfd61bc736623409693d2895f57.camel@perches.com>
         <201907221031.8B87A9DE@keescook>
         <b9bb5550b264d4b29b2b20f7ff8b1b40d20def6a.camel@perches.com>
         <2c959c56c23d0052e5c35ecfa2f6051b17fb2798.camel@perches.com>
         <20190722182703.GE363@bombadil.infradead.org>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.30.5-0ubuntu0.18.10.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 2019-07-22 at 11:27 -0700, Matthew Wilcox wrote:
> On Mon, Jul 22, 2019 at 10:58:15AM -0700, Joe Perches wrote:
> > On Mon, 2019-07-22 at 10:43 -0700, Joe Perches wrote:
> > > On Mon, 2019-07-22 at 10:33 -0700, Kees Cook wrote:
> > > > On Thu, Jul 04, 2019 at 05:15:57PM -0700, Joe Perches wrote:
> > > > > On Thu, 2019-07-04 at 13:46 -0700, Joe Perches wrote:
[]
> > > > > +#define stracpy(to, from)					\
> > > > > +({								\
> > > > > +	size_t size = ARRAY_SIZE(to);				\
> > > > > +	BUILD_BUG_ON(!__same_type(typeof(*to), char));		\
> > > > > +								\
> > > > > +	strscpy(to, from, size);				\
> > > > > +})
> 
> Where does the 'a' in 'stracpy' come from?

No place in particular.

I used it because dst has to be an 'a'rray rather
than a pointer.


