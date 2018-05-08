Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E6CAE7DE78
	for <lwn-linux-doc@archive.lwn.net>; Tue,  8 May 2018 03:50:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754054AbeEHDug (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 7 May 2018 23:50:36 -0400
Received: from mail-pg0-f65.google.com ([74.125.83.65]:39116 "EHLO
        mail-pg0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753971AbeEHDuf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 7 May 2018 23:50:35 -0400
Received: by mail-pg0-f65.google.com with SMTP id e1-v6so9211781pga.6;
        Mon, 07 May 2018 20:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :organization:mime-version:content-transfer-encoding;
        bh=J1qEEEG3I2BCK5yhoRn+O+z7Pmqxs4kA6jaiWaLIE7g=;
        b=kXTxNawlk6JdH8eYuglVpVMapmzGq+BmQ5qxurqDvbdzavecwvz4M+lyRZrhyOGvi8
         Wn+nl5IVGrLfSfzLkkfovMb+fhFEWLE4SXyMDeaWqAbXNwwitaBY+1T1T8yJL/d71yYW
         0SqH2oJB0X+uQN/J2LgM8kTFXI5shZQDrPx7KEZHGqG9LtVReg2XWGY9AJbUwSqMZ6lg
         7uGG8NbrXB0JHaVfKakFr5VQdMs6WUXi/bKKyLHCLY3MsFbInhkNMwdPst2zmUZiXkgV
         PjQkRlYqP7/AI8Fh0bTkrYTQCkxMLmgpbGug7Ea/N5EiFg34tkfyoC11XmYrAkJcPyaG
         r5Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:organization:mime-version:content-transfer-encoding;
        bh=J1qEEEG3I2BCK5yhoRn+O+z7Pmqxs4kA6jaiWaLIE7g=;
        b=Dw3yDuRLA6DgALIUxA9OEFzl10S89xG3TU0kd10ZLFLb2SDOscQj3jpInAFBVJohUd
         3Q4L6GUkQdE/EWofhIVN4XB3l+jtrR3xrChThVuKGZdt4LeAzPYAIeVVRTOBFBiI+wFJ
         Y1HRq/razE+w8MW/ky1BJusQ71/Hn24wLtdZE/9S2dzISHtY9/b8SfoeELyqVR35fwew
         LGfUcqrXqFAtj7tktHSmeHzL6sNy0KANNonRFv2tONE9vT1jy5hhjlheDS3t2MK+2y6u
         BGg3xW1vIDX8Y83JcRnRn5/THh1HPsjAgQSIxS6SyEMGzKPSX3wxqxdwOBmHVk5qp6PT
         bVgA==
X-Gm-Message-State: ALQs6tDAEhSX8ZvVr411usoWwmlIzy3yuW6zAAQ7JiD0lP9Ng5/dJFmo
        oqKDPS7+uZjj7Cr5N6xDuWg=
X-Google-Smtp-Source: AB8JxZrw1tSyhdAX2JdpBFTBhJdyHAiJak2E+cTURLDy9svtgvCkQTb4tKxRXehdOPib/WUtsRo2Cg==
X-Received: by 2002:a63:b144:: with SMTP id g4-v6mr31327380pgp.253.1525751434602;
        Mon, 07 May 2018 20:50:34 -0700 (PDT)
Received: from roar.ozlabs.ibm.com (59-102-70-78.tpgi.com.au. [59.102.70.78])
        by smtp.gmail.com with ESMTPSA id k63sm65403038pfk.90.2018.05.07.20.50.27
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 May 2018 20:50:33 -0700 (PDT)
Date:   Tue, 8 May 2018 13:50:19 +1000
From:   Nicholas Piggin <npiggin@gmail.com>
To:     "Alastair D'Silva" <alastair@au1.ibm.com>
Cc:     Frederic Barrat <fbarrat@linux.ibm.com>,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, mikey@neuling.org,
        vaibhav@linux.vnet.ibm.com, aneesh.kumar@linux.vnet.ibm.com,
        malat@debian.org, felix@linux.vnet.ibm.com, pombredanne@nexb.com,
        sukadev@linux.vnet.ibm.com, gregkh@linuxfoundation.org,
        arnd@arndb.de, andrew.donnellan@au1.ibm.com,
        fbarrat@linux.vnet.ibm.com, corbet@lwn.net
Subject: Re: [PATCH v2 6/7] ocxl: Add an IOCTL so userspace knows what CPU
 features are available
Message-ID: <20180508135019.3e08d57a@roar.ozlabs.ibm.com>
In-Reply-To: <1525740115.7796.46.camel@au1.ibm.com>
References: <20180417020950.21446-1-alastair@au1.ibm.com>
        <20180418010810.30937-1-alastair@au1.ibm.com>
        <20180418010810.30937-7-alastair@au1.ibm.com>
        <eec7dceb-0b25-8644-7f32-3700c3c4ed46@linux.ibm.com>
        <1525740115.7796.46.camel@au1.ibm.com>
Organization: IBM
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 08 May 2018 10:41:55 +1000
"Alastair D'Silva" <alastair@au1.ibm.com> wrote:

> On Mon, 2018-05-07 at 20:14 +0200, Frederic Barrat wrote:
> > 
> > Le 18/04/2018 à 03:08, Alastair D'Silva a écrit :  
> > > From: Alastair D'Silva <alastair@d-silva.org>
> > > 
> > > In order for a userspace AFU driver to call the Power9 specific
> > > OCXL_IOCTL_ENABLE_P9_WAIT, it needs to verify that it can actually
> > > make that call.
> > > 
> > > Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
> > > ---
> > >   Documentation/accelerators/ocxl.rst |  1 -
> > >   drivers/misc/ocxl/file.c            | 25
> > > +++++++++++++++++++++++++
> > >   include/uapi/misc/ocxl.h            |  4 ++++
> > >   3 files changed, 29 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/Documentation/accelerators/ocxl.rst
> > > b/Documentation/accelerators/ocxl.rst
> > > index ddcc58d01cfb..7904adcc07fd 100644
> > > --- a/Documentation/accelerators/ocxl.rst
> > > +++ b/Documentation/accelerators/ocxl.rst
> > > @@ -157,7 +157,6 @@ OCXL_IOCTL_GET_METADATA:
> > >     Obtains configuration information from the card, such at the
> > > size of
> > >     MMIO areas, the AFU version, and the PASID for the current
> > > context.
> > > 
> > > -  
> > 
> > 
> > Intended?
> > 
> > Other than that,
> > Acked-by: Frederic Barrat <fbarrat@linux.vnet.ibm.com>
> >   
> 
> Nope, I'll fix that, thanks.
> 

Just to be clear, this is for OCXL features. I would just make that
explicit in the title (s/CPU/OCXL).

Thanks,
Nick
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
