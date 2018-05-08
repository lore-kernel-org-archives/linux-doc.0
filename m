Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,FSL_HELO_FAKE,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 8AB767E679
	for <lwn-linux-doc@archive.lwn.net>; Tue,  8 May 2018 18:07:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S932872AbeEHSHe (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 8 May 2018 14:07:34 -0400
Received: from mail-pl0-f67.google.com ([209.85.160.67]:39900 "EHLO
        mail-pl0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932400AbeEHSHb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 May 2018 14:07:31 -0400
Received: by mail-pl0-f67.google.com with SMTP id q18-v6so2691003plr.6;
        Tue, 08 May 2018 11:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=VS8l3hZ9OK+rBxZbMpoarfIZQY+He7GsmQCYltGHl7M=;
        b=j/DwZ7H4WjpIqymbshDCPHKeB57qWOPuELg+pnb7m/AEMj3ir/ZV462P2WCCs5LNEW
         NYZbaLX2tEO58tEuVCZwFlwW0bJosM+dkCNIld1vjmmbto0mQzQX80Sczx1uETC2t81Q
         HocUE35XXmy37IdEwLRei6narYwYEZD2lMcer8UOlm70dFqmXSXXtEVD0eipqhXz4zDr
         sd8XP2feoRcteLGbiFdnnxgEEvIfZBOjka6LZqTaTPxqCbhpH7P9RQ8BeOx5G3OxdXsv
         K493YELjdRCnSDX0lbxaAo5ezY59z0TCnp57IzfABjeJLkZsS7SxvdtlmMc07BIVlLax
         zkhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=VS8l3hZ9OK+rBxZbMpoarfIZQY+He7GsmQCYltGHl7M=;
        b=FGSqXiEv14tN0Ck/u2PCdv+mcjtlfPiF2mFX6v7tAItGLhvFRxUibQoYrKF6dlpPms
         Gx567Op4A3Sslmf6LkUjryjEFBCX+pUOn79StrwlV/IAlfwmYvYbqJ0Ri6ahpB6v41W+
         4d5gn4TBMo8WOLz0Sxju6uj8GMQWVvZZAmRHaDo/X1OgHNwFZgEPHFGGP6evR6umIB/U
         ZFeVfguwXNclhfHvLv7EWo7eeHX1tIuB4L3s3uZpsG0SrOp2sROhLEzVN3q43SjLQp1t
         zN1JOuAX4PWtJ7xIufvYWob89ZOc0hOKZO9oVp4VC9roT4f0k49B7uc066+7R7zxIRq2
         087A==
X-Gm-Message-State: ALQs6tCsihe3Vqpg9/3g0JpMyO+s0qszBogbG++CvAsEQ4bloaH5wgl5
        0FYwpsG2vRp3Ou1XE9IR0wK39kJn
X-Google-Smtp-Source: AB8JxZr7vSzL/2dgl9VpwK/dLlQmTBI4dL9pvP0JvYp2zCA/0mUmVOwcq59INxkdLuyzLmT+fdRpgA==
X-Received: by 2002:a17:902:5382:: with SMTP id c2-v6mr42775966pli.335.1525802850926;
        Tue, 08 May 2018 11:07:30 -0700 (PDT)
Received: from gmail.com ([2620:15c:17:3:dc28:5c82:b905:e8a8])
        by smtp.gmail.com with ESMTPSA id y20-v6sm31027033pgv.27.2018.05.08.11.07.30
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 May 2018 11:07:30 -0700 (PDT)
Date:   Tue, 8 May 2018 11:07:28 -0700
From:   Eric Biggers <ebiggers3@gmail.com>
To:     keyrings@vger.kernel.org, David Howells <dhowells@redhat.com>
Cc:     Ben Hutchings <ben@decadent.org.uk>, linux-doc@vger.kernel.org,
        Eric Biggers <ebiggers@google.com>
Subject: Re: [keyutils PATCH v2] man: keyctl_read(3): fix documentation for
 short buffer case
Message-ID: <20180508180728.GB135321@gmail.com>
References: <20171102180605.110627-1-ebiggers3@gmail.com>
 <20180220194234.GC70958@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180220194234.GC70958@gmail.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Feb 20, 2018 at 11:42:34AM -0800, Eric Biggers wrote:
> On Thu, Nov 02, 2017 at 11:06:05AM -0700, Eric Biggers wrote:
> > From: Eric Biggers <ebiggers@google.com>
> > 
> > When keyctl_read() is passed a buffer that is too small, the behavior is
> > inconsistent.  Some key types will fill as much of the buffer as
> > possible, while others won't copy anything.  Moreover, the in-kernel
> > documentation contradicted the man page on this point.
> > 
> > Update the man page to say that this point is unspecified.
> > 
> > Signed-off-by: Eric Biggers <ebiggers@google.com>
> > ---
> >  man/keyctl_read.3 | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/man/keyctl_read.3 b/man/keyctl_read.3
> > index 25821ad..852bc05 100644
> > --- a/man/keyctl_read.3
> > +++ b/man/keyctl_read.3
> > @@ -33,8 +33,8 @@ permission on a key to be able to read it.
> >  and
> >  .I buflen
> >  specify the buffer into which the payload data will be placed.  If the buffer
> > -is too small, the full size of the payload will be returned and no copy will
> > -take place.
> > +is too small, then the full size of the payload will be returned, and the
> > +contents of the buffer may be overwritten in some undefined way.
> >  .P
> >  .BR keyctl_read_alloc ()
> >  is similar to
> > @@ -62,8 +62,8 @@ though the byte-ordering is as appropriate for the kernel.
> >  On success
> >  .BR keyctl_read ()
> >  returns the amount of data placed into the buffer.  If the buffer was too
> > -small, then the size of buffer required will be returned, but no data will be
> > -transferred.
> > +small, then the size of buffer required will be returned, and the contents of
> > +the buffer may have been overwritten in some undefined way.
> >  .P
> >  On success
> >  .BR keyctl_read_alloc ()
> > -- 
> > 2.15.0.403.gc27cc4dac6-goog
> > 
> 
> Ping.

Ping.
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
