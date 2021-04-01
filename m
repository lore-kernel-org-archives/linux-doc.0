Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E8CEC43600
	for <linux-doc@archiver.kernel.org>; Thu,  1 Apr 2021 17:47:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DB24161285
	for <linux-doc@archiver.kernel.org>; Thu,  1 Apr 2021 17:47:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236842AbhDARre (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 1 Apr 2021 13:47:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:42944 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235596AbhDARnA (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 1 Apr 2021 13:43:00 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0398561285;
        Thu,  1 Apr 2021 14:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617286054;
        bh=V9bgGYiXE/LDBTtHWvl7WWQChZzjc4Q9/uN+D4DIQy0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=EOF9Y/ffwJdLpVX103cX18Q3xPEvwbjUOBxWoJakgB0+ZUiWZBijfZ+bnYgMESBUk
         0k/HgFAi3Wwk/R1XtRMpAhFU2su5ZHMBU+xO2Ph2VFV5FKZW0fpFuFgb5x3bg/gId9
         nWg83yDf4xdEnfZcPgMxtrSWXkjeW3kZjGkCAN9L87o3hNjU5pMIJA/CAxDpnb/jsC
         Rs195DiAnGhJ9UsWS26pcpcYv6koBJTVFQiSpW9DdOByGyKBiqfJulxtBLDkkupDYq
         6tVeoKcLiVUkJRYA0ReZCa5kn+rpxZhLU4ce88Pr+jR5x7MO2h4GncVNEl+IDkhd6J
         p9DZgt1NYdCOg==
Date:   Thu, 1 Apr 2021 16:07:29 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Andrew Lunn <andrew@lunn.ch>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Benedikt Spranger <b.spranger@linutronix.de>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Hyunchul Lee <hyc.lee@gmail.com>,
        Namjae Jeon <namjae.jeon@samsung.com>,
        Ronnie Sahlberg <lsahlber@redhat.com>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steve French <stfrench@microsoft.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 30/32] Documentation: net: dsa: update configuration.rst
 reference
Message-ID: <20210401160729.6ee45872@coco.lan>
In-Reply-To: <YGW/a8FuCO+Q6hEg@lunn.ch>
References: <cover.1617279355.git.mchehab+huawei@kernel.org>
        <a3d52c1380624f34b4a04e9698f67e1e6d8d23f8.1617279356.git.mchehab+huawei@kernel.org>
        <YGW/a8FuCO+Q6hEg@lunn.ch>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Em Thu, 1 Apr 2021 14:41:15 +0200
Andrew Lunn <andrew@lunn.ch> escreveu:

> On Thu, Apr 01, 2021 at 02:17:50PM +0200, Mauro Carvalho Chehab wrote:
> > The file name: Documentation/configuration.txt
> > should be, instead: Documentation/networking/dsa/configuration.rst.
> > 
> > Update its cross-reference accordingly.
> > 
> > Fixes: 75b8988dfe83 ("cifsd: add server handler for central processing and tranport layers")
> > Fixes: 58dd7a8d9d02 ("Documentation: net: dsa: Describe DSA switch configuration")
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > ---
> >  Documentation/filesystems/cifs/cifsd.rst | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/filesystems/cifs/cifsd.rst b/Documentation/filesystems/cifs/cifsd.rst
> > index 48ae58f2a53c..082a839535e7 100644
> > --- a/Documentation/filesystems/cifs/cifsd.rst
> > +++ b/Documentation/filesystems/cifs/cifsd.rst
> > @@ -114,7 +114,7 @@ How to run
> >  	# ksmbd.adduser -a <Enter USERNAME for SMB share access>
> >  
> >  3. Create /etc/ksmbd/smb.conf file, add SMB share in smb.conf file
> > -	- Refer smb.conf.example and Documentation/configuration.txt
> > +	- Refer smb.conf.example and Documentation/networking/dsa/configuration.rst
> >  	  in ksmbd-tools  
> 
> Hi Mauro
> 
> This looks wrong. There is no relationship between SMB and DSA. I
> suspect you are looking for some other configuration.txt

Thanks for reviewing it.

I'll drop the patch from my series.

After re-reading cifsd.rst, I suspect that it is actually trying to
refer to:

	https://github.com/cifsd-team/ksmbd-tools/blob/master/Documentation/configuration.txt

and not to a local file.

So, IMO, the right thing to do is to apply the enclosed patch instead.
	

Thanks,
Mauro

[PATCH] docs: cifsd: change the reference to configuration.txt

Changeset 75b8988dfe83 ("cifsd: add server handler for central processing and tranport layers")
added documentation for cifsd. There, it points to a file
named:
	Documentation/configuration.txt

This confuses Kernel scripts, as they think that this is a
document within the Kernel tree, instead of a file from
some other place.

Replace it by an hyperlink to the ksmbd-tools tree, in order
to avoid false-positives.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

diff --git a/Documentation/filesystems/cifs/cifsd.rst b/Documentation/filesystems/cifs/cifsd.rst
index 48ae58f2a53c..a6ab85e68252 100644
--- a/Documentation/filesystems/cifs/cifsd.rst
+++ b/Documentation/filesystems/cifs/cifsd.rst
@@ -114,8 +114,8 @@ How to run
 	# ksmbd.adduser -a <Enter USERNAME for SMB share access>
 
 3. Create /etc/ksmbd/smb.conf file, add SMB share in smb.conf file
-	- Refer smb.conf.example and Documentation/configuration.txt
-	  in ksmbd-tools
+	- Refer smb.conf.example and
+	  https://github.com/cifsd-team/ksmbd-tools/blob/master/Documentation/configuration.txt
 
 4. Insert ksmbd.ko module
 


