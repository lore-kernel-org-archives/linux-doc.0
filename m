Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 280537D048
	for <lwn-linux-doc@archive.lwn.net>; Tue, 22 May 2018 08:39:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1750733AbeEVIjR (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 22 May 2018 04:39:17 -0400
Received: from mx.kolabnow.com ([95.128.36.42]:20302 "EHLO mx.kolabnow.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750709AbeEVIjO (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 22 May 2018 04:39:14 -0400
Received: from localhost (unknown [127.0.0.1])
        by ext-mx-out003.mykolab.com (Postfix) with ESMTP id 84A89403A1;
        Tue, 22 May 2018 10:39:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kolabnow.com; h=
        content-type:content-type:content-transfer-encoding:mime-version
        :references:in-reply-to:message-id:date:date:subject:subject
        :from:from:received:received:received; s=dkim20160331; t=
        1526978351; x=1528792752; bh=lGCf0XeHrLoGGkUITZGN2TYrg3s2ygwcCOu
        u2sU5Drw=; b=yg1ThNjbaLrx591D3j65+xDP1pnPljcOGgRcEOkTYnHGbEFxpcL
        8UHEAVKdo4MWssKr6V+KpN3OCnypMsYfTm9ot1oq9cauhR0KgPL1Hzg/Muub5FOJ
        j+wR2xyTgxTHIOp/uKZQ0//5klxkSTnZZiqWRzJMJrH7wHf1TOUcRy/aIz3n1lL0
        ONsUxSvS//YC4z02VfsOMqg/oiCzSZn6zZuRL7sVBShBmklP5bE3oheOwM+iiGRD
        vEXc8t0JWkZ41ke3pJL+iaX76/47vmTuo/qCGDuKvj2HesCuHAvY/uXBHsgPv5Nn
        lbS2qGtUZNzL0Zs+HJT2cwELSxRGMhNxoq5at53BJfovCnwOIvAEYDne89J//nVT
        A34P/UvOOxVob4HnqsNiB0fdsbuiitlCM35UqknE6EtEzX+ZH7k67qOsOv6l4tXM
        as6qben4yLArQaCHmqgoFiJnd45dA9zlEvJOcMKI49Vmhwt05NWkVmXeZ5KVD4Qj
        PXA8DMi79zlbI6gJ9oH4xF09pXHt30Bst+G0iBsoGPtav8rVdim28ODTBb2otIu0
        8MHPgEs1vfUzYYVOtio76wOhzAt1kunJDyKr4h/UWepQasU2AutitTv1B1//vnah
        ATOypM882ZYzjGPiBl6WIRch6PGmGsyfJrJESGdTGbiEa7rESp1RtMoU=
X-Virus-Scanned: amavisd-new at mykolab.com
Received: from mx.kolabnow.com ([127.0.0.1])
        by localhost (ext-mx-out003.mykolab.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id Kdj5LB8GyAh2; Tue, 22 May 2018 10:39:11 +0200 (CEST)
Received: from int-mx003.mykolab.com (unknown [10.9.13.3])
        by ext-mx-out003.mykolab.com (Postfix) with ESMTPS id 697E1401CD;
        Tue, 22 May 2018 10:39:11 +0200 (CEST)
Received: from ext-subm001.mykolab.com (unknown [10.9.6.1])
        by int-mx003.mykolab.com (Postfix) with ESMTPS id 35BD3A26;
        Tue, 22 May 2018 10:39:11 +0200 (CEST)
From:   Federico Vaga <federico.vaga@vaga.pv.it>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, amantegazza@vaga.pv.it
Subject: Re: Documentation/translations: Italian
Date:   Tue, 22 May 2018 10:39:09 +0200
Message-ID: <3094464.Q0nrLVF18W@pcbe13614>
In-Reply-To: <20180521170035.7e75f54b@lwn.net>
References: <152696186.kHulSgLgWb@harkonnen> <20180521170035.7e75f54b@lwn.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tuesday, 22 May 2018 01:00:35 CEST Jonathan Corbet wrote:
> On Mon, 21 May 2018 22:54:18 +0200
> 
> Federico Vaga <federico.vaga@vaga.pv.it> wrote:
> > I'm writing you because I would like to start an effort to
> > translate the Documentation in Italian. I would like also to
> > express the idea of providing guide lines for translations.
> 
> Mi sembra un'ottima idea! :)

Siamo sulla stessa lunghezza d'onda :)
 
> > I know that there are already translations for Asian languages but
> > I am not able to find the history of them. I do not know if
> > translations in European languages are going to be accepted
> > (perhaps there is the assumption that everyone knows English in
> > the European continent and it is a waste of energy to do
> > translations[?]). For example, even if French and Germans are
> > quite active there are not translations yet in their language: is
> > there a particular reason or simply nobody did it?
> 
> Nobody has done it.  There certainly is no policy against
> translations to any specific language - that would be hard to
> justify, to say the least.
> 
> OK, I might draw the line at Klingon.  But the discussion of error
> handling in Klingon could actually be a lot of fun.
> 
> I'm happy to accept new translations of stuff in the documentation
> directory.  In general, I've had two concerns about translations:
> they are generally impossible for me to review, and there needs to
> be somebody committed to keeping the translations current as the
> documentation changes.  For Italian, the first problem doesn't
> exist, but the second is always there. What are your intentions for
> maintaining the translations in the long term?

I can maintain the Italian translation. 
 
> > If you agree with the need to support different translations, I
> > would like to do the Italian one. But first I would like to open
> > a little discussion about translations  "how to write
> > translations"; this discussion should produce a document (in
> > English) with guide lines for translator (e.g. Documentation/
> > translation/howto.rst): what to translate first, what to NOT
> > translate, how to structure it.
> > Once this is defined I will start the Italian translation (I
> > already have some documents translated).
> 
> This can be a fine plan, assuming we're convinced that the
> guidelines document is really needed.  I guess I'm not yet
> convinced of that.  But you might also consider gaining some
> experience in writing, merging, and maintaining a translation
> before trying to lay down rules for everybody else.  In other
> words, I think you might want to do things in the opposite order.

You are right, probably I was over-engineering this thing :)

> 
> > How to do translations (IMHO)
> > -----------------------------
> > Here my personal guide lines for translations
> > 
> > - Translate only sphinx-ready documents, do not translate
> > documents which are not yet sphinx. We should avoid useless
> > double work; at some point, I guess, everything will be sphinx.
> 
> I wouldn't insist on that.  But a better idea in any case would be:
> if a document you want to translate isn't yet in RST, just do the
> conversion. The amount of work required is usually quite small.

ok

> > - Include in all documents a disclaimer saying that English is the
> > main reference (use sphinx directive 'include' to include it).
> > - Include in all documents a reference to the English version. So
> > it will be easy jump to the original document.
> 
> Remember that the docs need to be readable *without* Sphinx
> processing. Better to just name the source document in a quick line
> at the top, IMO.

ok

> > - Translate in order: non-technical documents (they are stable,
> > useful for a wider group of people (developers and managers):
> > process/, doc-guide/ ), technical documents about key concepts
> > (they are stable, and important for new-comers), subsystems (the
> > big picture is stable, typically they do not describe all little
> > details that may change), and then other documents
> If you want to work in that order, that is more than fine.  Others
> have agreed - the process docs tend to get translated first.  But
> if somebody else wants to start elsewhere, I wouldn't try to tell
> them not to.
> 
> Anyway, thanks for wanting to help improve the documentation!  If
> you have some of this work already done, you might want to consider
> going ahead and posting some patches.

I will review them and push something in the next days

-- 
Federico Vaga
http://www.federicovaga.it/


--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
