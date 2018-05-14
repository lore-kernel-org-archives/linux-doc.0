Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 22ADB7D043
	for <lwn-linux-doc@archive.lwn.net>; Mon, 14 May 2018 18:46:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751954AbeENSqW (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 14 May 2018 14:46:22 -0400
Received: from mail-wm0-f43.google.com ([74.125.82.43]:37542 "EHLO
        mail-wm0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751596AbeENSqV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 14 May 2018 14:46:21 -0400
Received: by mail-wm0-f43.google.com with SMTP id l1-v6so17099850wmb.2;
        Mon, 14 May 2018 11:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=BUBARR1v7euSMBVLu7Jha1PqDnIfpEErDOWUZjeWvzU=;
        b=STezAIcZDG1oQ/4Ye8edF90whNw4uV2kt3L61XDCWHNTb/DvetK+QZWhKNb8DpAxyR
         XNj/PyVj2QpF+s+ccaTwJoOul91AN9/H2Txqx0fO1FcIJhERuY1AoYo4YKXZqlrObpCK
         xLw3A3qOZDtEeEa8pTHAvapvVhXDGDMbizbaYDWGRpsQpu0/i5vzhyPNGEWb0A3a/Gzv
         VvvgqzmdiKU6dcEwLOVQ4Bzx7loavVsDlOUKYXNmpKNhdDLbgqZ5lI5xqDCS2TPbS85j
         m+8NV/6GzvHfEgpWcyVSPDTzIbDoiNZ1NzxvCCUQs0MJzR40B6B9Ah70rUlJf9v3Fcy1
         j0aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=BUBARR1v7euSMBVLu7Jha1PqDnIfpEErDOWUZjeWvzU=;
        b=gboU32iKaSsiZCkpmqMHF82gBTVyeyZt67pE4ldQcqEFZHZcY4vt+CPLpsw6kSlnT5
         ETAMv/YRSWAGAHt2t4kubBTN49fC/ldE9OBFrnX2Cm/A7dJX+Yt2prFC3u6JmqLMELLO
         9baKdD9gPihFrTfVWuA+nPj4V0F5jkKOYcLO74BSa7jQu95blt0gyycISldh4rPV5Rbm
         68J7zDwjbJcHz8AiQ84TFEkXy8NR+7qZxzVn48pgittbZIYs4llcpNvg1fEbKiFsDWcH
         2X6ckN9WiAWOUScGInLayW9p3sCAzZ2cYLu4yhO86HQmYRHHxNP/QUhfb6ZU39ovGZiU
         xF3Q==
X-Gm-Message-State: ALKqPwfX2tvTSa+zDl0f84YgBhw2I07NNpcio2qceSrn/wkKRgalafku
        +9BU4IklH1fpIEd1fxWO7Ug=
X-Google-Smtp-Source: AB8JxZoEuAoAotc0GJZV9OfBe+RGZmx0lL9Qe+gAB/Urxi2ebrK+38ZgREAME6cggfw4ybx4CssWEw==
X-Received: by 2002:a50:f384:: with SMTP id g4-v6mr13797307edm.13.1526323580033;
        Mon, 14 May 2018 11:46:20 -0700 (PDT)
Received: from localhost ([81.6.39.140])
        by smtp.gmail.com with ESMTPSA id g7-v6sm5248520edf.90.2018.05.14.11.46.18
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 May 2018 11:46:18 -0700 (PDT)
Date:   Mon, 14 May 2018 20:46:17 +0200
From:   Silvan Jegen <s.jegen@gmail.com>
To:     Jesper Dangaard Brouer <brouer@redhat.com>
Cc:     borkmann@iogearbox.net, alexei.starovoitov@gmail.com,
        netdev@vger.kernel.org, quentin.monnet@netronome.com,
        linux-man <linux-man@vger.kernel.org>, linux-doc@vger.kernel.org
Subject: Re: [bpf-next PATCH 5/5] bpf, doc: howto use/run the BPF selftests
Message-ID: <20180514184617.GA1723@homearch.localdomain>
References: <152630528901.29210.9018565600000101307.stgit@firesoul>
 <152630535224.29210.11623921130132517306.stgit@firesoul>
 <CAKvUva-_EbMez7c=CHXUPcGKmU=jGne5ZVu4CXwR8szrNUhRhw@mail.gmail.com>
 <20180514180514.4fd0ba66@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20180514180514.4fd0ba66@redhat.com>
User-Agent: Mutt/1.9.5 (2018-04-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, May 14, 2018 at 06:05:14PM +0200, Jesper Dangaard Brouer wrote:
> On Mon, 14 May 2018 17:15:54 +0200
> Silvan Jegen <s.jegen@gmail.com> wrote:
> 
> > Hi
> > 
> > Some typo fixes below.
> > 
> > On Mon, May 14, 2018 at 3:43 PM Jesper Dangaard Brouer <brouer@redhat.com>
> > wrote:
> > > I always forget howto run the BPF selftests. Thus, lets add that info
> > > to the QA document.  
> >
> > [...] 
> >
> > I also think the underscore at the end of this line is misplaced (or it
> > should be a dash instead).
> 
> This is also part of the RST formatting.  This is a link. 
> 
> 
> > > +document for further documentation.
> > > +
> > >   Q: Which BPF kernel selftests version should I run my kernel against?
> > >   ---------------------------------------------------------------------
> > >   A: If you run a kernel ``xyz``, then always run the BPF kernel selftests
> > > @@ -607,5 +634,7 @@ when:
> > >   .. _netdev FAQ: ../networking/netdev-FAQ.txt
> > >   .. _samples/bpf/: ../../samples/bpf/
> > >   .. _selftests: ../../tools/testing/selftests/bpf/
> > > +.. _Documentation/dev-tools/kselftest.rst:
> > > +   https://www.kernel.org/doc/html/latest/dev-tools/kselftest.html  
> 
> The link is defined above/here.

Ah, thanks I didn't know.


Cheers,

Silvan

 
> -- 
> Best regards,
>   Jesper Dangaard Brouer
>   MSc.CS, Principal Kernel Engineer at Red Hat
>   LinkedIn: http://www.linkedin.com/in/brouer
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
