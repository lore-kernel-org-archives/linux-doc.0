Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 8C5947D2F0
	for <lwn-linux-doc@archive.lwn.net>; Tue,  1 Oct 2019 18:35:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725884AbfJASfP (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 1 Oct 2019 14:35:15 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:34945 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725851AbfJASfP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 1 Oct 2019 14:35:15 -0400
Received: by mail-io1-f65.google.com with SMTP id q10so50701834iop.2
        for <linux-doc@vger.kernel.org>; Tue, 01 Oct 2019 11:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=5Fb9YzTga/9+WMrU/2SgNO0ujHSLL6+IpDmwPVkwFnc=;
        b=MgWKg3MG9CFFTbex7gURjFzj/yGw9uuzkuu5j+o0ih7zhVtPEW9RiKP0YWZW0S7TMS
         2EjaJMUEbOyWOI8aChBxYQnkekrgosM844KOs9vUMrE0ZjW/MjKNHGreR1SdbMf/jeop
         SqbRhsDxtNrg14UaJZxR937/bCEuM4ullb94tJPl+dLTzY8ZjY/aJiOBUws0OKzCZ9gY
         iLobxmvd2YU/ItYaJTrQpH2ChTwNVyB9NTqztommrzAAmjLWkUaSKMUwlrHGNKQtC6az
         MxX/nvvKCuEnkstBJ01oIE0ezjmN8Wiz80OEHvCv6z+28Z/yddutvIzX+hkcqkOCi7kC
         cV0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=5Fb9YzTga/9+WMrU/2SgNO0ujHSLL6+IpDmwPVkwFnc=;
        b=M0rXdNBOQEhG2jqAlB5fMoRnYaI/lJxR1RgX9VZ0XWx/SWMdSwD/d4rFwXQYOJ1yBg
         ITH6hA8ft61BbKoGAaRJ+RemtAYUcMTaTVXKUZZHJx6GisxgBE5VrVyXq+tjUX36dM0x
         k6UIJfjRd+4RNCTVVEueYwb6miceuU0WGqr8oVs5i8rPSL5UIHz/nSUJr64SCgE5S49w
         auYhNaGs1JCMiQAfwYALO3Gf0dt9DA3MLZxEp1RoNmoEGYQ4rvWKFT0wL16m6Mvtt924
         S9gDE2jEeKHzA2Mo6qkPCJvK79a+DL6UNxwBc2LxCU3fVdxTVuOdUFVbk3Opqyla2nWB
         sXiw==
X-Gm-Message-State: APjAAAViv0257bL58BdPkhuxgREcCBIDrNUFwYsMTR0cz7YkXBDdAobZ
        CziSB6mRZyoAb6FPqKrejVaSiw==
X-Google-Smtp-Source: APXvYqxBrZp6foWvPhswC6rB/mDoUsUd3wHiswUzJVpu1vT5vd9zpn3vwJDmd4c8Gt6pF9rTIZS2sg==
X-Received: by 2002:a6b:8e92:: with SMTP id q140mr7413827iod.205.1569954912731;
        Tue, 01 Oct 2019 11:35:12 -0700 (PDT)
Received: from localhost (67-0-10-3.albq.qwest.net. [67.0.10.3])
        by smtp.gmail.com with ESMTPSA id m9sm7691487ion.65.2019.10.01.11.35.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2019 11:35:12 -0700 (PDT)
Date:   Tue, 1 Oct 2019 11:35:11 -0700 (PDT)
From:   Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To:     Jonathan Corbet <corbet@lwn.net>
cc:     Chester Lin <clin@suse.com>,
        "palmer@sifive.com" <palmer@sifive.com>,
        "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
        "atish.patra@wdc.com" <atish.patra@wdc.com>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH] riscv-docs: correct the sequence of the magic number 2
 since it's little endian
In-Reply-To: <20191001072212.21d55899@lwn.net>
Message-ID: <alpine.DEB.2.21.9999.1910011132280.3732@viisi.sifive.com>
References: <20190916130108.31404-1-clin@suse.com> <20191001072212.21d55899@lwn.net>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Jon,

On Tue, 1 Oct 2019, Jonathan Corbet wrote:

> On Mon, 16 Sep 2019 13:01:40 +0000
> Chester Lin <clin@suse.com> wrote:
> 
> > Correct the sequence of the magic number 2 since it's little endian.
> > 
> > Signed-off-by: Chester Lin <clin@suse.com>
> > ---
> >  Documentation/riscv/boot-image-header.txt | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> So I'm slowly digging my way through my docs folder, sorry for the delay.
> 
> > diff --git a/Documentation/riscv/boot-image-header.txt b/Documentation/riscv/boot-image-header.txt
> > index 14b1492f689b..f388805aa5c3 100644
> > --- a/Documentation/riscv/boot-image-header.txt
> > +++ b/Documentation/riscv/boot-image-header.txt
> > @@ -18,7 +18,7 @@ The following 64-byte header is present in decompressed Linux kernel image.
> >  	u32 res1  = 0;		  /* Reserved */
> >  	u64 res2  = 0;    	  /* Reserved */
> >  	u64 magic = 0x5643534952; /* Magic number, little endian, "RISCV" */
> > -	u32 magic2 = 0x56534905;  /* Magic number 2, little endian, "RSC\x05" */
> > +	u32 magic2 = 0x05435352;  /* Magic number 2, little endian, "RSC\x05" */
> 
> That's doing more than just reordering the bytes.  Was the original
> completely wrong?  If so, the changelog should probably reflect that.  Or
> else what am I missing?

This was simply due to idiocy on my part, due to a very last-minute patch 
submission, where I missed that the original documented magic number was 
already in little-endian format.  The updated number from Chester is 
correct.

So,

Reviewed-by: Paul Walmsley <paul.walmsley@sifive.com>


- Paul
