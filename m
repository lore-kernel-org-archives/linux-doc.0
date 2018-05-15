Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 038707D071
	for <lwn-linux-doc@archive.lwn.net>; Tue, 15 May 2018 05:58:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752130AbeEOF6I (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 15 May 2018 01:58:08 -0400
Received: from mail-ua0-f194.google.com ([209.85.217.194]:33910 "EHLO
        mail-ua0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752044AbeEOF6H (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 15 May 2018 01:58:07 -0400
Received: by mail-ua0-f194.google.com with SMTP id f22-v6so10024971uam.1;
        Mon, 14 May 2018 22:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=a181x0yP5NObC/A1xIJlaTZ7dXXM4AawUC/390JXSpQ=;
        b=kuu1ZwwiJsq2p2Bi9Exss+m6VA7tMv+ouJTSZjPm4jHBsiZjb44xCdmhHoqslie4rh
         WLlAGcL/On66AUubshY8D/CXdbMMyVd2N0BC2Xe1VzFArSiI3WMpmrtnCuT+WmnvUrDK
         Z/4gCcmutT63mgq/ZVQFlviS9MxWEC7jXTL89/J+5tQtKLUKkeHEVEJbTD23K4FNEFuc
         SdAJbsPARY3qbQjFhypp6jtvgLZPDtGfRgeqTx+/5DDWRz1PZlDBVkC75a3AoXaPDLP3
         0/cnSbvF5Ka4eQ9f5iCd9kEDqg6cJg7/NKfNhweIvWr9KnyjZfUD9OhEPgV5gPIs8YvB
         35Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=a181x0yP5NObC/A1xIJlaTZ7dXXM4AawUC/390JXSpQ=;
        b=QH3ic6OBVqYqe639aIsyMxKmAJ8LBmN4q6dlwCwyY0Rqev1lxGv4k8h/H2g5zpkRTc
         cRxjGjqwLGtBxMi/nsXJUP/W1eVvh0Munl0EoSGovCqpBMc0TPxzoS6wxI2EMpigFiz4
         R7h8SOm2420BHUnfw3CFD1NUxDRPP2YBN+eVJa5mpQFOJNe6w4JWOynfp3m9SiN92KKY
         alfczL2ZCuhLY59S/aEEDAO+SjQTVlCCjiNcs1BUcT/Vi1cJSex/CCIAzqG7HZIibPps
         S8PqMceJhN1G3KtGnm8f1nrKS7XICUo36xp1LnF3jYztkZstbebrjTcImkq2P4AdUoeN
         wMtQ==
X-Gm-Message-State: ALKqPwcmAlj4Vd2WeJ924Aeup+J8ScdOiUSqYBN15vdwxXt0Lcr6o/kN
        8G4lPYcoo4Arg5GqxBvW7kE5715Rl7goN4lD6U0=
X-Google-Smtp-Source: AB8JxZqmaBN6tRZ+18W15BiN3v4ksbp7dIELGtK4cJw8q+wTmsxr63ivd/qygNnX4ZcwSEbNehW+iWa8w5W4EpEq+Ls=
X-Received: by 2002:a9f:3b5c:: with SMTP id j28-v6mr14757279uah.142.1526363886181;
 Mon, 14 May 2018 22:58:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.64.90 with HTTP; Mon, 14 May 2018 22:57:25 -0700 (PDT)
In-Reply-To: <152630528901.29210.9018565600000101307.stgit@firesoul>
References: <152630528901.29210.9018565600000101307.stgit@firesoul>
From:   Y Song <ys114321@gmail.com>
Date:   Mon, 14 May 2018 22:57:25 -0700
Message-ID: <CAH3MdRV_f+gN+pHDQOviM9th6i1Evaa_Vh6dKSJcXE9ymqSd1Q@mail.gmail.com>
Subject: Re: [bpf-next PATCH 0/5] bpf, doc: convert Documentation/bpf to RST-formatting
To:     Jesper Dangaard Brouer <brouer@redhat.com>
Cc:     Daniel Borkmann <borkmann@iogearbox.net>,
        Alexei Starovoitov <alexei.starovoitov@gmail.com>,
        netdev <netdev@vger.kernel.org>,
        Quentin Monnet <quentin.monnet@netronome.com>,
        linux-man@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, May 14, 2018 at 6:42 AM, Jesper Dangaard Brouer
<brouer@redhat.com> wrote:
> The kernel is moving files under Documentation to use the RST
> (reStructuredText) format and Sphinx [1].  This patchset converts the
> files under Documentation/bpf/ into RST format.  The Sphinx
> integration is left as followup work.
>
> [1] https://www.kernel.org/doc/html/latest/doc-guide/sphinx.html
>
> This patchset have been uploaded as branch bpf_doc10 on github[2], so
> reviewers can see how GitHub renders this.
>
> [2] https://github.com/netoptimizer/linux/tree/bpf_doc10/Documentation/bpf
>
> ---
>
> Jesper Dangaard Brouer (5):
>       bpf, doc: add basic README.rst file
>       bpf, doc: rename txt files to rst files
>       bpf, doc: convert bpf_design_QA.rst to use RST formatting
>       bpf, doc: convert bpf_devel_QA.rst to use RST formatting
>       bpf, doc: howto use/run the BPF selftests

This initial conversion from .txt to .rst files look good to me. Ack
for the whole series.
Acked-by: Yonghong Song <yhs@fb.com>

>
>
>  Documentation/bpf/README.rst        |   36 ++
>  Documentation/bpf/bpf_design_QA.rst |  221 ++++++++++++
>  Documentation/bpf/bpf_design_QA.txt |  156 ---------
>  Documentation/bpf/bpf_devel_QA.rst  |  640 +++++++++++++++++++++++++++++++++++
>  Documentation/bpf/bpf_devel_QA.txt  |  570 -------------------------------
>  5 files changed, 897 insertions(+), 726 deletions(-)
>  create mode 100644 Documentation/bpf/README.rst
>  create mode 100644 Documentation/bpf/bpf_design_QA.rst
>  delete mode 100644 Documentation/bpf/bpf_design_QA.txt
>  create mode 100644 Documentation/bpf/bpf_devel_QA.rst
>  delete mode 100644 Documentation/bpf/bpf_devel_QA.txt
>
> --
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
