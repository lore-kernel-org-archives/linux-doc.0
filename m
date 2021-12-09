Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB909C433EF
	for <linux-doc@archiver.kernel.org>; Thu,  9 Dec 2021 16:18:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240948AbhLIQVj (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 9 Dec 2021 11:21:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241000AbhLIQVi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 9 Dec 2021 11:21:38 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 212E4C061353
        for <linux-doc@vger.kernel.org>; Thu,  9 Dec 2021 08:18:05 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D5CC2B82563
        for <linux-doc@vger.kernel.org>; Thu,  9 Dec 2021 16:18:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24527C004DD;
        Thu,  9 Dec 2021 16:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639066682;
        bh=zCwncriJUBKlbUe2XtLliZsKicOmCM2PH2+pDQvZAY0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Gir/3ij8RW+r/tjxR9g+8XYeHDmfyVuXHaopfTdUMNIUm+YWrddlmg9kCrN0ag1kC
         PolfVbcJJCm2ImeFNf2Fun0xFxBhXneEd5JPKQ9OvjcXtvaHofIEnaBi8QshX9hfXh
         nusabQZevpmdpm3na0CXbQVnlCefVJnc+dVbip+vABquDXz26DvpcAbGH+hpX/26ly
         Ck6x23ekTfD/IDdwJqNSCVoSOfU6p8UoMz3Aavl+/JqsPaeoYCne81rzxw6xIIqmsi
         cuh3hKnwnA4xTo158Nwjbi0A9Lp1Z9yfqLV4xopqlgV3tHIg20YgHwAFYlA7/+LdiA
         W4yox4Sucw0gA==
Date:   Fri, 10 Dec 2021 01:17:58 +0900
From:   Masami Hiramatsu <mhiramat@kernel.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Yanteng Si <siyanteng01@gmail.com>, mhiramat@kernel.org,
        rostedt@goodmis.org, linux-doc@vger.kernel.org,
        Yanteng Si <siyanteng@loongson.cn>
Subject: Re: [PATCH] docs/trace: fix a label of boottime-trace
Message-Id: <20211210011758.0963cbb51a7d4752ccbfe957@kernel.org>
In-Reply-To: <87y24tvnmo.fsf@meer.lwn.net>
References: <20211209091133.558744-1-siyanteng@loongson.cn>
        <87y24tvnmo.fsf@meer.lwn.net>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 09 Dec 2021 07:50:07 -0700
Jonathan Corbet <corbet@lwn.net> wrote:

> Yanteng Si <siyanteng01@gmail.com> writes:
> 
> > Since 559789539255 ("Documentation: tracing: Add histogram syntax to boot-time tracing") which
> > introduced a warning:
> >
> > linux/Documentation/trace/boottime-trace.rst:136: WARNING: undefined label: histogram (if the link has no caption the label must precede a section header)
> >
> > Replace with:
> >               :xxx: path
> >
> > Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> > ---
> >  Documentation/trace/boottime-trace.rst | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/Documentation/trace/boottime-trace.rst b/Documentation/trace/boottime-trace.rst
> > index 6dcfbc64014d..efb75ec5bf48 100644
> > --- a/Documentation/trace/boottime-trace.rst
> > +++ b/Documentation/trace/boottime-trace.rst
> > @@ -133,7 +133,7 @@ action option, there are tree-style options under per-event 'hist' subkey
> >  for the histogram actions. For the detail of the each parameter,
> >  please read the event histogram document [3]_.
> >  
> > -.. [3] See :ref:`Documentation/trace/histogram.rst <histogram>`
> > +.. [3] See :histogram: Documentation/trace/histogram.rst
> 
> I don't see that this is going to work either.  Is there any reason not
> to just make the text read:
> 
>    please read the event histogram document Documentation/trace/histogram.rst
> 
> and let automarkup link it in?

Hmm, I think we need the following change instead of this.
(the label is not in this document, but in the target document.)

diff --git a/Documentation/trace/histogram.rst b/Documentation/trace/histogram.rst
index 859fd1b76c63..ea722eae2810 100644
--- a/Documentation/trace/histogram.rst
+++ b/Documentation/trace/histogram.rst
@@ -1,3 +1,5 @@
+.. _histogram:
+
 ================
 Event Histograms
 ================

-- 
Masami Hiramatsu <mhiramat@kernel.org>
