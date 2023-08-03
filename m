Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DEC4EB64DD
	for <linux-doc@archiver.kernel.org>; Thu,  3 Aug 2023 18:36:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232868AbjHCSgQ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 3 Aug 2023 14:36:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229836AbjHCSgP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 3 Aug 2023 14:36:15 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B609312B;
        Thu,  3 Aug 2023 11:36:14 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 52C4161E48;
        Thu,  3 Aug 2023 18:36:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A2C5C433C7;
        Thu,  3 Aug 2023 18:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1691087773;
        bh=EPrIzhnHngRmYcpriOSsv2C4b5KD1vrTxnytJvuJaq0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Q3m576+o47BBOW0zkBUz47OGhhZvDB4sdkQTE+y7N7fCmm010mcLqCDZedn1T5ob1
         uMwMzjE71THOEPJ9pZb0QnnZEpCheaqphUenUm7XMOyYUarNpGWAD/nmjtHMDGdout
         oaYx3ASWxF+VsVbwvAu+kNiylGg3EpW35CMpxQIU=
Date:   Thu, 3 Aug 2023 20:36:10 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Eric DeVolder <eric.devolder@oracle.com>
Cc:     linux-kernel@vger.kernel.org, david@redhat.com, osalvador@suse.de,
        corbet@lwn.net, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, x86@kernel.org, bhe@redhat.com,
        ebiederm@xmission.com, kexec@lists.infradead.org, hpa@zytor.com,
        rafael@kernel.org, vgoyal@redhat.com, dyoung@redhat.com,
        lf32.dev@gmail.com, akpm@linux-foundation.org,
        naveen.n.rao@linux.vnet.ibm.com, zohar@linux.ibm.com,
        bhelgaas@google.com, vbabka@suse.cz, tiwai@suse.de,
        seanjc@google.com, linux@weissschuh.net, vschneid@redhat.com,
        linux-mm@kvack.org, linux-doc@vger.kernel.org,
        sourabhjain@linux.ibm.com, konrad.wilk@oracle.com,
        boris.ostrovsky@oracle.com
Subject: Re: [PATCH v25 01/10] drivers/base: refactor cpu.c to use
 .is_visible()
Message-ID: <2023080320-dinner-ravine-7d18@gregkh>
References: <20230629192119.6613-1-eric.devolder@oracle.com>
 <20230629192119.6613-2-eric.devolder@oracle.com>
 <2023070342-human-spill-a62c@gregkh>
 <31c1393d-4285-0032-7675-737737d21f71@oracle.com>
 <6d2811f5-a5ee-a49d-012d-b519b2c6ee26@oracle.com>
 <a6dd6e27-e8a7-09ac-f33d-03318dd5695c@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a6dd6e27-e8a7-09ac-f33d-03318dd5695c@oracle.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Aug 03, 2023 at 01:20:28PM -0500, Eric DeVolder wrote:
> 
> 
> On 7/21/23 11:32, Eric DeVolder wrote:
> > 
> > 
> > On 7/3/23 11:53, Eric DeVolder wrote:
> > > 
> > > 
> > > On 7/3/23 08:05, Greg KH wrote:
> > > > On Thu, Jun 29, 2023 at 03:21:10PM -0400, Eric DeVolder wrote:
> > > > >   - the function body of the callback functions are now wrapped with
> > > > >     IS_ENABLED(); as the callback function must exist now that the
> > > > >     attribute is always compiled-in (though not necessarily visible).
> > > > 
> > > > Why do you need to do this last thing?  Is it a code savings goal?  Or
> > > > something else?  The file will not be present in the system if the
> > > > option is not enabled, so it should be safe to not do this unless you
> > > > feel it's necessary for some reason?
> > > 
> > > To accommodate the request, all DEVICE_ATTR() must be
> > > unconditionally present in this file. The DEVICE_ATTR() requires the
> > > .show() callback. As the callback is referenced from a data
> > > structure, the callback has to be present for link. All the
> > > callbacks for these attributes are in this file.
> > > 
> > > I have two basic choices for gutting the function body if the config
> > > feature is not enabled. I can either use #ifdef or IS_ENABLED().
> > > Thomas has made it clear I need to use IS_ENABLED(). I can certainly
> > > use #ifdef (which is what I did in v24).
> > > 
> > > > 
> > > > Not doing this would make the diff easier to read :)
> > > 
> > > I agree this is messy. I'm not really sure what this request/effort
> > > achieves as these attributes are not strongly related (unlike
> > > cacheinfo) and the way the file was before results in less code.
> > > 
> > > At any rate, please indicate if you'd rather I use #ifdef.
> > > Thanks for your time!
> > > eric
> > > 
> > > > 
> > > > thanks,
> > > > 
> > > > greg k-h
> > 
> > Hi Greg,
> > I was wondering if you might weigh-in so that I can proceed.
> > 
> > I think there are three options on the table:
> > - use #ifdef to comment out these function bodies, which keeps the diff much more readable
> > - use IS_ENABLED() as Thomas has requested I do, but makes the diff more difficult to read
> > - remove this refactor altogether, perhaps post-poning until after this
> > crash hotplug series merges, as this refactor is largely unrelated to
> > crash hotplug.
> > 
> > Thank you for your time on this topic!
> > eric
> 
> Hi Greg,
> If you have an opinion on how to proceed, please provide.

Sorry, totally swamped by "stuff".  I don't know, use your judgement
here and send a new version, don't wait for me to weigh in on design
decisions for longer than a week.

thanks,

greg k-h
