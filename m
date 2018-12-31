Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6FCC17DC5B
	for <lwn-linux-doc@archive.lwn.net>; Mon, 31 Dec 2018 15:03:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726383AbeLaPDO (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 31 Dec 2018 10:03:14 -0500
Received: from mail-qt1-f195.google.com ([209.85.160.195]:41241 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725899AbeLaPDN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 31 Dec 2018 10:03:13 -0500
Received: by mail-qt1-f195.google.com with SMTP id l12so29416811qtf.8
        for <linux-doc@vger.kernel.org>; Mon, 31 Dec 2018 07:03:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=geciauskas-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QzsJsO9HpkYv5Uq/JLIsuQffKu8yMlR4H3xtNh3ZKvc=;
        b=kwySJW/64XBDloywQR1gmKtylPjDOzDvmaVmHZq+9HRQv4EjZH5b8/wa6p6AOVL37q
         2vOX0AgwaxWNQtYb8I10bW+JmwUyyPe8o9kKPBBNbY/2EYbFn1YifmMT7uI7do2mcigO
         J2nmo+jcJgFBBNnr99zVEVSZJxQ8ZWhbmqQUyCbWzE9fqgNrKx3gIFaXK5pZBB/A743R
         OVYzdq6okulMdGjsMoI40ho7wvhoBsWVcVEfybzUoQpQjlN6svLSwQYm+nmG8XVFpbIi
         kALISg6GUWGOeVO+xhFgb1pIN+maFRf4kwKqbiIFxK9NLy5JmPi9477rZFmRjztEyi0f
         7DQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QzsJsO9HpkYv5Uq/JLIsuQffKu8yMlR4H3xtNh3ZKvc=;
        b=Tvf6LSvshplfAJzYFLxh/LWQ/esK1KfCZpZiFkJuhWP2SefapCaOcJS7lidpDMeShE
         QrGwD7lw0+LlEd5ud7AW2tLa5RUGb7afQj02cOqZnoh38LufSmoRYt40snSrBNVUCHuR
         46qbCeVfa0N8vQFjB/AY5/ccb6XqN0egZx5P+4bUh3eZFseJk95vnzfmIRqiXI5u2zVU
         2ZHu6MVrjxv6S739SkGPxxq/cwC9FrZikDy+jWgMzYnupXGh25N8Q5F+sIIKU78EbxWf
         k1b+IciOSP8TKkRXYtw4fkutuGPwOVTIj5k45QMfk43tJNbI3QtRMtVzxYO9CLMx0Y9c
         t+EA==
X-Gm-Message-State: AA+aEWYqRwqNEoKFcrnD05pxRlseZdUdvleGKRpZU1LPHjXV5Zr80SE+
        wqZHJslINBO2+CfKsnaO+qTiZw==
X-Google-Smtp-Source: ALg8bN74HDAwUrid9G5zXrn28Fi5CkYvKHwm9ucmxzlZZhv0htJRVRSXlqGXX+qRYUF4NMLiX3DdBA==
X-Received: by 2002:ac8:1779:: with SMTP id u54mr35563611qtk.285.1546268592638;
        Mon, 31 Dec 2018 07:03:12 -0800 (PST)
Received: from triton.namas.geciauskas.com ([2601:18d:8800:7790:ecf0:baca:b876:c623])
        by smtp.gmail.com with ESMTPSA id s24sm3056470qkl.48.2018.12.31.07.03.12
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 31 Dec 2018 07:03:12 -0800 (PST)
Date:   Mon, 31 Dec 2018 10:03:09 -0500
From:   Ramunas Geciauskas <kernel@geciauskas.com>
To:     Jani Nikula <jani.nikula@linux.intel.com>
Cc:     corbet@lwn.net, linux-doc@vger.kernel.org
Subject: Re: [PATCH] Documentation/admin-guide: update URL of LKML
 information link
Message-ID: <20181231100309.07b871f1@triton.namas.geciauskas.com>
In-Reply-To: <87a7kmumf7.fsf@intel.com>
References: <20181229210000.1132-1-kernel@geciauskas.com>
        <87a7kmumf7.fsf@intel.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

On Mon, 31 Dec 2018 10:31:56 +0200
Jani Nikula <jani.nikula@linux.intel.com> wrote:

> On Sat, 29 Dec 2018, Ramunas Geciauskas <kernel@geciauskas.com> wrote:
> > Information regarding linux-kernel mailing list is no longer hosted on tux.org
> > Update the link to point to the one available at kernel.org  
> 
> Arguably there's no useful current information wrt reporting bugs at the
> updated URL either.

A lot of information in there is rather outdated indeed,
however it does contain explanation how to subscribe/unsubscribe
to LKML (or rather "why you shouldn't").

Would you prefer to get rid of the link completely?
The current one is dead since late 2016 (so it doesn't seem it will come back)

Thanks,
Ramunas

> 
> BR,
> Jani.
> 
> >
> > Signed-off-by: Ramunas Geciauskas <kernel@geciauskas.com>
> > ---
> >  Documentation/admin-guide/reporting-bugs.rst | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/Documentation/admin-guide/reporting-bugs.rst b/Documentation/admin-guide/reporting-bugs.rst
> > index 4650edb8840a..49ac8dc3594d 100644
> > --- a/Documentation/admin-guide/reporting-bugs.rst
> > +++ b/Documentation/admin-guide/reporting-bugs.rst
> > @@ -67,7 +67,7 @@ If you can't figure out which subsystem caused the issue, you should file
> >  a bug in kernel.org bugzilla and send email to
> >  linux-kernel@vger.kernel.org, referencing the bugzilla URL.  (For more
> >  information on the linux-kernel mailing list see
> > -http://www.tux.org/lkml/).
> > +http://vger.kernel.org/lkml/).
> >  
> >  
> >  Tips for reporting bugs  
> 

