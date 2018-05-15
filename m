Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3C7987D072
	for <lwn-linux-doc@archive.lwn.net>; Tue, 15 May 2018 06:05:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752281AbeEOGFR (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 15 May 2018 02:05:17 -0400
Received: from mail-pl0-f65.google.com ([209.85.160.65]:39271 "EHLO
        mail-pl0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752270AbeEOGFP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 15 May 2018 02:05:15 -0400
Received: by mail-pl0-f65.google.com with SMTP id c19-v6so8764522pls.6;
        Mon, 14 May 2018 23:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=UIdymIhvZJGqWcVmmdjlp59093Z4vhNenvttud/Lp5g=;
        b=sAGgmL/TlzdKnsgcx+VQJ/o7m3l83fhuVliTNetSSVlLa9IgmrXdptkucfvAjSqghk
         FuKbIx8AouF/zbClLNrC6UC+L4SVUhf6GBa55HYKEbKimFVszPB3eDBL2jYyXvT7Yw2u
         g+dvgq4ZtQ7fPMk3QmsD042sR0HhqS0dWb7uOdGt5IFLYjrI5oXuPn/SONDg/bGGJVh0
         LvNZuyImibU4F8eJWHlmnGN4uaxNn1bt4183ankxaqFQ8R8ZfPv4299ElwBLK5Re+Ytc
         yIq8DinHiPn1sJ9snOwHNPirUblDVzK4qMg2T3BKFfvo75hHyDe9lyQ1l6bdRWR22vls
         1ixA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=UIdymIhvZJGqWcVmmdjlp59093Z4vhNenvttud/Lp5g=;
        b=cOQoSNmaQuLjYOItVRbKuAE6WO13Mf1baYRVXWxq9SloOwSZCn0HYbQJW7zX7hjoys
         ZlVt/b/ltBNBmS93LOkq2P8b8d01jI78ZS3omjVstUnPZxEZbM7l5K64G81RuIDVaWUB
         4+Ry2q7KBsSjCbCNN4FZgnBoDOC6WEc8Iqyf/DFKW9KY6TX+d2OZivx60nu29Njh9fR6
         Uu9tWbH6amYL391QJ/rD/pYKVjPKM0XCvv91LVc+IYn8jm9esJ4/UVBKnPwe88Cf462z
         sq5tX0sMt8kwkcycl/PQMMxEHJmvqCEed0IKBXu4IF4GhNrOTfnG5kDPlJnWOOYBqteE
         DI3Q==
X-Gm-Message-State: ALKqPwcyW95Pdy54qDUZ279jHd0nNkhveeLUkeVbOUT0bHZ+1D9q34Uq
        CYqI34yXCM4A451SQFeEZ5k=
X-Google-Smtp-Source: AB8JxZoSSnuQm9HeoVtBx2tDu8quamMQ7O/X9oiZsNMVZe+WSehVzMRm7GQtjxstoGz8YDqzfDFGKg==
X-Received: by 2002:a17:902:9344:: with SMTP id g4-v6mr13169122plp.10.1526364314185;
        Mon, 14 May 2018 23:05:14 -0700 (PDT)
Received: from ast-mbp ([2620:10d:c090:180::1:9f1b])
        by smtp.gmail.com with ESMTPSA id s65-v6sm26180925pfj.124.2018.05.14.23.05.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 May 2018 23:05:13 -0700 (PDT)
Date:   Mon, 14 May 2018 23:05:11 -0700
From:   Alexei Starovoitov <alexei.starovoitov@gmail.com>
To:     Y Song <ys114321@gmail.com>
Cc:     Jesper Dangaard Brouer <brouer@redhat.com>,
        Daniel Borkmann <borkmann@iogearbox.net>,
        netdev <netdev@vger.kernel.org>,
        Quentin Monnet <quentin.monnet@netronome.com>,
        linux-man@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [bpf-next PATCH 0/5] bpf, doc: convert Documentation/bpf to
 RST-formatting
Message-ID: <20180515060510.ut264galu3poyskc@ast-mbp>
References: <152630528901.29210.9018565600000101307.stgit@firesoul>
 <CAH3MdRV_f+gN+pHDQOviM9th6i1Evaa_Vh6dKSJcXE9ymqSd1Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAH3MdRV_f+gN+pHDQOviM9th6i1Evaa_Vh6dKSJcXE9ymqSd1Q@mail.gmail.com>
User-Agent: NeoMutt/20180223
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, May 14, 2018 at 10:57:25PM -0700, Y Song wrote:
> On Mon, May 14, 2018 at 6:42 AM, Jesper Dangaard Brouer
> <brouer@redhat.com> wrote:
> > The kernel is moving files under Documentation to use the RST
> > (reStructuredText) format and Sphinx [1].  This patchset converts the
> > files under Documentation/bpf/ into RST format.  The Sphinx
> > integration is left as followup work.
> >
> > [1] https://www.kernel.org/doc/html/latest/doc-guide/sphinx.html
> >
> > This patchset have been uploaded as branch bpf_doc10 on github[2], so
> > reviewers can see how GitHub renders this.
> >
> > [2] https://github.com/netoptimizer/linux/tree/bpf_doc10/Documentation/bpf
> >
> > ---
> >
> > Jesper Dangaard Brouer (5):
> >       bpf, doc: add basic README.rst file
> >       bpf, doc: rename txt files to rst files
> >       bpf, doc: convert bpf_design_QA.rst to use RST formatting
> >       bpf, doc: convert bpf_devel_QA.rst to use RST formatting
> >       bpf, doc: howto use/run the BPF selftests
> 
> This initial conversion from .txt to .rst files look good to me. Ack
> for the whole series.
> Acked-by: Yonghong Song <yhs@fb.com>

Applied, Thanks

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
