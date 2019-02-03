Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 35B487D04D
	for <lwn-linux-doc@archive.lwn.net>; Sun,  3 Feb 2019 23:20:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726885AbfBCXUo (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 3 Feb 2019 18:20:44 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:59325 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726680AbfBCXUo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 3 Feb 2019 18:20:44 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id CDFE121F27;
        Sun,  3 Feb 2019 18:20:43 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Sun, 03 Feb 2019 18:20:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tobin.cc; h=date
        :from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=SJqPGTB0fgiuvmq5ColcEhkEoq0
        uMgfWwZ8z7qT9h4E=; b=iiiU9KxatVD94Du+f5+pBTGop31TRn98x2B7izfZ43T
        nlQC2f8nheXWrj+1is1e8ag8xwhi/J6lbxj+Vyi7iLO7QL0QvDhz8S6BpRCFbKKT
        r/ggjwSwCUXJjRjfLv4tf2tzEUSBQCAXlDJ93v0rbxnW617gHqQK34WcnO+rdCFf
        lrnoWFlArWWjkqMxrdI8LkpyXmNgBU08u9Pe6tmghRCO/01MwTUksYKQDrc/A06U
        14NIpZvD3HCTjZZsvrCjSjeuE9J7tgDX9Q0dzFVt7S/khFPgBfc8Hoy+wA0lmgAK
        mjYG4flB3l7oYNfGsokX1rTfHMgwtjVamV2DaZAn3OA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=SJqPGT
        B0fgiuvmq5ColcEhkEoq0uMgfWwZ8z7qT9h4E=; b=tiIxliBSC7IAfoF6u+VAre
        VxIfU8xFGf0x29ltuiTyKS3V/5H9+8BrsE9Cf07EUGukfZFuC7eJbKcLkn/0Mfs7
        mq5YwSEm039vAEtO8XHwJjmK1PkSx5jkqiCrwBs4QVF4LBI727JkJDaiT5TZnoK6
        cYf5kalzsxAvF8Q+uwNRwwLZksxYNb75eXN2OBLywnmeQLQlz3Gm54ISOd0UVtk/
        Q6BzK02preAfyD2s1vAaTQRpryp8hgyJ7X3Svf9GyATcc2XJXdT1vIKeQArJBrNe
        nZl7jwlFU5eXkhotHULCpSJ1/iB2RWfW8U3IBFjCXZEPf59Zp6pQnBI9+oXrvU6g
        ==
X-ME-Sender: <xms:S3dXXI-BMiMTnmryciUrlQ2-FSxhek9a8baQccAcGwF028Ghbzzssw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedtledrkeefgddtkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfhuthenuceurghilhhouhhtmecufedt
    tdenucesvcftvggtihhpihgvnhhtshculddquddttddmnegfrhhlucfvnfffucdlfedtmd
    enucfjughrpeffhffvuffkfhggtggujgfofgesthdtredtofervdenucfhrhhomhepfdfv
    ohgsihhnucevrdcujfgrrhguihhnghdfuceomhgvsehtohgsihhnrdgttgeqnecuffhomh
    grihhnpehkvghrnhgvlhdrohhrghenucfkphepuddvuddrgeegrddvvdejrdduheejnecu
    rfgrrhgrmhepmhgrihhlfhhrohhmpehmvgesthhosghinhdrtggtnecuvehluhhsthgvrh
    fuihiivgeptd
X-ME-Proxy: <xmx:S3dXXPLATGwNh1H6WrOVOphHWk6nBH3GnSlZMZyN4LWPLZ-tNYV4CQ>
    <xmx:S3dXXApD7_z6wMsHLkUulWrM-wj-JYlZ6FpopQCdWMwiV09OLIwUFA>
    <xmx:S3dXXDydxytM4sXTPiLpAWtbPfut-LPAaWhchCi1Ma9PkVUgk_64Kw>
    <xmx:S3dXXOiZAoKDDCdNuF_9Zxcr3J4i6UYh2FHxX3uRpm_Xw9g9wi8-4g>
Received: from localhost (ppp121-44-227-157.bras2.syd2.internode.on.net [121.44.227.157])
        by mail.messagingengine.com (Postfix) with ESMTPA id A0271E44F4;
        Sun,  3 Feb 2019 18:20:42 -0500 (EST)
Date:   Mon, 4 Feb 2019 10:20:35 +1100
From:   "Tobin C. Harding" <me@tobin.cc>
To:     Mike Rapoport <rppt@linux.ibm.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        "Tobin C. Harding" <tobin@kernel.org>,
        Christopher Lameter <cl@linux.com>, linux-doc@vger.kernel.org
Subject: Re: [PATCH 3/3] docs: Use underscore not hyphen in label
Message-ID: <20190203232035.GA4235@eros.localdomain>
References: <20190131040623.15569-1-me@tobin.cc>
 <20190131040623.15569-4-me@tobin.cc>
 <20190131092757.GF28876@rapoport-lnx>
 <20190131205608.GB1329@eros.localdomain>
 <20190201160310.5b98eb69@lwn.net>
 <20190202143209.GA8620@rapoport-lnx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190202143209.GA8620@rapoport-lnx>
X-Mailer: Mutt 1.11.2 (2019-01-07)
User-Agent: Mutt/1.11.2 (2019-01-07)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Feb 02, 2019 at 04:32:10PM +0200, Mike Rapoport wrote:
> On Fri, Feb 01, 2019 at 04:03:10PM -0700, Jonathan Corbet wrote:
> > On Fri, 1 Feb 2019 07:56:08 +1100
> > "Tobin C. Harding" <me@tobin.cc> wrote:
> > 
> > > > > From: "Tobin C. Harding" <tobin@kernel.org>
> > > > > 
> > > > > sphinx emits warning
> > > > > 
> > > > >        WARNING: undefined label: memory-allocation ...  
> > > > 
> > > > Weird, for me it works fine. The generated html at kernel.org [1] also
> > > > seems to be Ok...
> > > > 
> > > > What version of sphinx do you use?  
> > > 
> > > Thanks for looking at this Mike.  I was running 1.4, I see there is a v2
> > > out so I'll upgrade but if the warning doesn't show for you then I'd say
> > > we just drop this patch.
> > > 
> > > Jon,
> > > 
> > > Is it within your usual workflow to take just the first two patches from
> > > this series or would you like me to spin another version without the
> > > final patch in it?
> > 
> > We currently document that 1.4 is supposed to work, so we should stick to
> > that; I think I'll go ahead and apply all three patches.
> >
> > We should maybe consider dragging our minimum version forward a bit, or
> > else we might want to document this particular gotcha.
> 
> I have 1.4.6 (the one listed in sphinx.rst) and everything worked just
> fine...

FWIW I'm running 1.4.9


thanks,
Tobin.
