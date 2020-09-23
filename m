Return-Path: <SRS0=6mJA=DA=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA7FAC4727E
	for <linux-doc@archiver.kernel.org>; Wed, 23 Sep 2020 11:53:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8295D235FD
	for <linux-doc@archiver.kernel.org>; Wed, 23 Sep 2020 11:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600862004;
	bh=dQTb7mV0wqUh/Qk8TeipvbzvxI5032AuKyT+9XvZm5c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-ID:From;
	b=zF8C6PYltLFYWLENtiP/2bBKUFlQUcP9WTovKvKaw9DIgdXevASJx0YohRd/qM0Mg
	 n7CjO6+72pyQ/Fk4bA+RXoHYh0fY57R0bbkktxJhCe5e+KzgWkslU8+ZxNbbJE5wQv
	 8QAySJPRxSboIilGp70g9q/iNq8XUj3IMQRu7cLE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726498AbgIWLxY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 23 Sep 2020 07:53:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:51090 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726332AbgIWLxY (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 23 Sep 2020 07:53:24 -0400
Received: from coco.lan (ip5f5ad5c8.dynamic.kabel-deutschland.de [95.90.213.200])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 85CA621D41;
        Wed, 23 Sep 2020 11:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600862002;
        bh=dQTb7mV0wqUh/Qk8TeipvbzvxI5032AuKyT+9XvZm5c=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=nyIJrThOpzlI3HdlC1DZJ9/iMUKz6BkCVoxm+D9HkLgnwaBo24YSrGhvD5wZZapHK
         6z8Bsd5YVhmUY3VpPjfDcClMURmufJ0UVPo97S4xs9AjlbCBADnFGXsJjCFfpi4RYi
         Jm0MMZank5e4sN5dVjBaiKwC+c07nI1OfOpya5dY=
Date:   Wed, 23 Sep 2020 13:53:18 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Jani Nikula <jani.nikula@linux.intel.com>,
        Matthew Wilcox <willy@infradead.org>,
        linux-doc@vger.kernel.org,
        Markus Heiser <markus.heiser@darmarit.de>
Subject: Re: [PATCH RFC] Make the docs build "work" with Sphinx 3.x
Message-ID: <20200923135318.48bb93f5@coco.lan>
In-Reply-To: <20200923110106.192e313f@coco.lan>
References: <20200904102925.52fcd2a1@lwn.net>
        <20200921222639.GY32101@casper.infradead.org>
        <87sgbaqnp9.fsf@intel.com>
        <20200922105656.11043bd9@lwn.net>
        <20200923110106.192e313f@coco.lan>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Em Wed, 23 Sep 2020 11:01:06 +0200
Mauro Carvalho Chehab <mchehab@kernel.org> escreveu:

> Em Tue, 22 Sep 2020 10:56:56 -0600
> Jonathan Corbet <corbet@lwn.net> escreveu:
> 
> > On Tue, 22 Sep 2020 10:23:46 +0300
> > Jani Nikula <jani.nikula@linux.intel.com> wrote:
> >   
> > > > Should we be converting the kernel-doc script to output 3.0-style markup
> > > > for structs?    
> > > 
> > > IIUC it's not backwards compatible with Sphinx pre-3.0, so you'd either
> > > have to require Sphinx 3.0 or have kernel-doc emit both, depending on
> > > the Sphinx version.  
> > 
> > Certainly before requiring 3.0 we should, like, actually make it work with
> > 3.0...  People with time to do that appear to be rather scarce at the
> > moment, though.  I'll get to it eventually but I have a few other things
> > on my plate as well.  
> 
> Tried to build now with Sphinx 3.2.1. There are thousands of warnings:
> 
> 	build succeeded, 3423 warnings.
> 
> Like those:
> 
> 	Documentation/driver-api/basics.rst: WARNING: Duplicate C declaration, also defined in 'core-api/workqueue'.
> 	Declaration is 'unsigned long delay'.
> 
> And those:
> 
> 	./include/uapi/linux/firewire-cdev.h:38: WARNING: Type must be either just a name or a typedef-like declaration.
> 	If just a name:
> 	  Error in declarator or parameters
> 	  Invalid C declaration: Expected identifier in nested name, got keyword: struct [error at 6]
> 	    struct fw_cdev_event_iso_interrupt
> 	    ------^
> 	If typedef-like declaration:
> 	  Error in declarator or parameters
> 	  Invalid C declaration: Expected identifier in nested name. [error at 34]
> 	    struct fw_cdev_event_iso_interrupt
> 	    ----------------------------------^
> 
> If I'm not mistaken, one of the reasons why cdomain was added is
> due to the duplicate C declaration.
> 
> -
> 
> I guess changing kernel-doc to produce Sphinx 3.x syntax and
> raise the bar requiring 3.0 to be the minimal version would be
> one alternative, but this won't solve the duplicated C declarations. 
> 
> Does Sphinx 3.x have some way to enable "local" C references?
> 
> Another one could be to make cdomain compatible with 3.x and
> make it handle the differences. Not sure how easy/hard would be
> to do that.

Ok, I checked the code of cdomain.py. It sounds that Markus
tried to make cdomain compatible with Sphinx 3.x[1]:

	https://github.com/return42/linuxdoc/commit/48f09de2aff80169b7b9be5b0f2431ad8954e5cc

[1] Yet, he ended disabling cdomain.py at his latest commit there:

	https://github.com/return42/linuxdoc/commit/70673dcf69e705e08d81f53794895dc15c4920b3#diff-40ccfb63661f88fd819794047febd54d

    (Basically, if Sphinx > 3.0, the cdomain.py is just an alias for c.py)

I was hoping that porting such change would be enough for docs to build
with Sphinx 3.2, but it isn't[2]. It seems that the entire Cdomain code
was re-written:

	https://github.com/sphinx-doc/sphinx/commit/0f49e30c51b5cc5055cda5b4b294c2dd9d1df573#r38750737

There are now some environment vars that are required. Some of them
have things like:

        lastSymbol = self.env.temp_data['c:last_symbol']  # type: Symbol
        assert lastSymbol

If those aren't found, Sphinx crashes.

So, making anything that would be compatible with both Sphinx 2.x
and Sphinx 3.x seems very painful.

It sounds to me that we need to make a choice here about how to
proceed. We have a few alternatives:

1) stick forever with Sphinx 2.x syntax. We may end needing to 
   support a fork of Sphinx, if we follow this direction, as
   nobody currently fix bugs on older versions of Sphinx;

2) switch to use Sphinx 3.x c domains and drop support for
   version < 3.x;

3) copy the code from Sphinx 2.x c.py file into our cdomain.py,
   making it to work with both versions. We may have troubles
   with newer versions of Sphinx if we follow this path though.

If someone has enough time, one alternative would be to do a
a mix of (2) and (3) by first porting to Sphinx 3.x and then 
re-writing the code at cdomain.py for it to work as a "backport"
of the Sphinx 3.x c domain.

-

Assuming that we would take (1), I suspect that changing kernel-doc to
produce Sphinx 3 domain shouldn't be too hard, but I'm a little bit
afraid of namespace collisions. There is a new namespace directive 
there, introduced on Sphinx 3.1:

	.. c:namespace:: scope specification

We'll likely need to use things like these in order to avoid
namespace collisions, meaning that the new minimal version
would be 3.1.

Btw, with regards to namespace, there are two alternatives:

- the RST files that would need it would explicitly have
  such directive;

- the kernel-doc script could have a new option
  "namespace". If found, kernel-doc would output the
  namespace directive. IMO, this is more elegant.

In any case, "namespace" will break automarkup.py for symbols
that won't use the "NULL" namespace. Not sure how to fix it.

Comments?

Thanks,
Mauro

[2] After Markus patch, I applied this change, to solve the issues
with the number of rows at the items array:

diff --git a/Documentation/sphinx/cdomain.py b/Documentation/sphinx/cdomain.py
index f262586cd094..6f1524bbede5 100644
--- a/Documentation/sphinx/cdomain.py
+++ b/Documentation/sphinx/cdomain.py
@@ -160,7 +160,10 @@ class CObject(Base_CObject):
                             'duplicate C object description of %s, ' % name +
                             'other instance in ' + self.env.doc2path(inv[name][0]),
                             line=self.lineno)
-            inv[name] = (self.env.docname, self.objtype)
+            if major <= 2:
+                inv[name] = (self.env.docname, self.objtype)
+            else:
+                inv[name] = (self.env.docname, targetname, self.objtype)
 
         indextext = self.get_index_text(name)
         if indextext:




