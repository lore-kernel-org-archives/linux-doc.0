Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1D5267D048
	for <lwn-linux-doc@archive.lwn.net>; Mon, 21 May 2018 23:00:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751072AbeEUXAh (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 21 May 2018 19:00:37 -0400
Received: from ms.lwn.net ([45.79.88.28]:49248 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750942AbeEUXAh (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 21 May 2018 19:00:37 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 7FF83AA6;
        Mon, 21 May 2018 23:00:36 +0000 (UTC)
Date:   Mon, 21 May 2018 17:00:35 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Federico Vaga <federico.vaga@vaga.pv.it>
Cc:     linux-doc@vger.kernel.org, amantegazza@vaga.pv.it
Subject: Re: Documentation/translations: Italian
Message-ID: <20180521170035.7e75f54b@lwn.net>
In-Reply-To: <152696186.kHulSgLgWb@harkonnen>
References: <152696186.kHulSgLgWb@harkonnen>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 21 May 2018 22:54:18 +0200
Federico Vaga <federico.vaga@vaga.pv.it> wrote:

> I'm writing you because I would like to start an effort to translate the 
> Documentation in Italian. I would like also to express the idea of providing 
> guide lines for translations.

Mi sembra un'ottima idea! :)

> I know that there are already translations for Asian languages but I am not 
> able to find the history of them. I do not know if translations in European 
> languages are going to be accepted (perhaps there is the assumption that 
> everyone knows English in the European continent and it is a waste of energy 
> to do translations[?]). For example, even if French and Germans are quite 
> active there are not translations yet in their language: is there a particular 
> reason or simply nobody did it?

Nobody has done it.  There certainly is no policy against translations to
any specific language - that would be hard to justify, to say the least.

OK, I might draw the line at Klingon.  But the discussion of error handling
in Klingon could actually be a lot of fun.

I'm happy to accept new translations of stuff in the documentation
directory.  In general, I've had two concerns about translations: they are
generally impossible for me to review, and there needs to be somebody
committed to keeping the translations current as the documentation
changes.  For Italian, the first problem doesn't exist, but the second is
always there. What are your intentions for maintaining the translations in
the long term?

> If you agree with the need to support different translations, I would like to 
> do the Italian one. But first I would like to open a little discussion about 
> translations  "how to write translations"; this discussion should produce a 
> document (in English) with guide lines for translator (e.g. Documentation/
> translation/howto.rst): what to translate first, what to NOT translate, how to 
> structure it.
> Once this is defined I will start the Italian translation (I already have some 
> documents translated).

This can be a fine plan, assuming we're convinced that the guidelines
document is really needed.  I guess I'm not yet convinced of that.  But you
might also consider gaining some experience in writing, merging, and
maintaining a translation before trying to lay down rules for everybody
else.  In other words, I think you might want to do things in the opposite
order.

> How to do translations (IMHO)
> -----------------------------
> Here my personal guide lines for translations
> 
> - Translate only sphinx-ready documents, do not translate documents which are 
> not yet sphinx. We should avoid useless double work; at some point, I guess, 
> everything will be sphinx.

I wouldn't insist on that.  But a better idea in any case would be: if a
document you want to translate isn't yet in RST, just do the conversion.
The amount of work required is usually quite small.

> - Include in all documents a disclaimer saying that English is the main 
> reference (use sphinx directive 'include' to include it).
> - Include in all documents a reference to the English version. So it will be 
> easy jump to the original document.

Remember that the docs need to be readable *without* Sphinx processing.
Better to just name the source document in a quick line at the top, IMO.

> - Translate in order: non-technical documents (they are stable, useful for a 
> wider group of people (developers and managers): process/, doc-guide/ ), 
> technical documents about key concepts (they are stable, and important for 
> new-comers), subsystems (the big picture is stable, typically they do not 
> describe all little details that may change), and then other documents

If you want to work in that order, that is more than fine.  Others have
agreed - the process docs tend to get translated first.  But if somebody
else wants to start elsewhere, I wouldn't try to tell them not to.

Anyway, thanks for wanting to help improve the documentation!  If you have
some of this work already done, you might want to consider going ahead and
posting some patches.

Thanks,

jon
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
