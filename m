Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2FC147D048
	for <lwn-linux-doc@archive.lwn.net>; Mon, 14 May 2018 15:16:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753544AbeENPQN (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 14 May 2018 11:16:13 -0400
Received: from mail-ot0-f195.google.com ([74.125.82.195]:35746 "EHLO
        mail-ot0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752960AbeENPQH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 14 May 2018 11:16:07 -0400
Received: by mail-ot0-f195.google.com with SMTP id h8-v6so14694622otb.2;
        Mon, 14 May 2018 08:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Soy3yC1xDxDsDOIsygwfo/0/lOu8c9PXwoYnbMszw8w=;
        b=RmmDmZuHfu+oGhhJlLkAEqqljrjy9alWunchJLLJEj4N7OJZQmWzHJDKsVTvCrlxI2
         2TV9i2Nbf94jCH0fEFgnsgb7jJ6N9AP/MnlQ0xHsnPoATu1UhrTm5nGWCVC7Gxyr7wOp
         rQdGGTkw2jHI6Q5+wvXSsDSvRsKoaBr/n6Y86EZbNs3wVs4uDHlZ+GdcgQiCmZjEefQ/
         3yQkJZR40azurEeYj+nmE8JetA64oINcsUjfQjGFRO8eLbK2RWIsrRjsWvKPJkfayyVm
         iUmroJwQS/ULgrj+1HbZ0ETpxTTzpoHxn7l6lPlA5KncusXEj+lEvKgNJgsYkwY+zyyU
         O/7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Soy3yC1xDxDsDOIsygwfo/0/lOu8c9PXwoYnbMszw8w=;
        b=Tn+16SdWnubZckBBvfUgm6bV9Y+IlVWXfg9yPyqO9D2Xj94ZEtNtmw6nvLQ+xt5XIX
         TxJeCPxvyCy9ADeD73lEcaVq0Epu4YRVExEXJCTfPB47sLmc35E1mxxUF0aQdrwm8E6N
         ZoJ4jyZ8MvE5PO1Qt4m13pvhtBRe20hlcKRtsvF7jXE5KAgE4dmVbMWUHf2VR+B9lDAn
         ShhZd7idFL0QvHmCGliGUPjqjYAAsMLPF/J1lMn61/so7fdpVI3lYgGuTp0Dq+lvyEpj
         aGSf1G/K3HMTBdVVpG23LEj2eQSWTqFNCCcr+ykqvZvplQtSH42tsDVHdloEVWTVlaZ2
         BVpQ==
X-Gm-Message-State: ALKqPwcu9axCjlYoP9cYU8S48gaQZVJrQCH/xA5lU2V6q+rS+EjKAk2B
        0IdS1BTwB9fDQeFi1v8i8Yz59x97pBZit8LKuNw=
X-Google-Smtp-Source: AB8JxZoXt+MBJurb0Pn2H1ODREQmor0ptnwKfwWsf1tTDJo7lecmNdnj20G+LzI6ptKKpzHpRMPl2uVC5c/IAv6C4vc=
X-Received: by 2002:a9d:354a:: with SMTP id l10-v6mr7924922ote.15.1526310966542;
 Mon, 14 May 2018 08:16:06 -0700 (PDT)
MIME-Version: 1.0
References: <152630528901.29210.9018565600000101307.stgit@firesoul> <152630535224.29210.11623921130132517306.stgit@firesoul>
In-Reply-To: <152630535224.29210.11623921130132517306.stgit@firesoul>
From:   Silvan Jegen <s.jegen@gmail.com>
Date:   Mon, 14 May 2018 17:15:54 +0200
Message-ID: <CAKvUva-_EbMez7c=CHXUPcGKmU=jGne5ZVu4CXwR8szrNUhRhw@mail.gmail.com>
Subject: Re: [bpf-next PATCH 5/5] bpf, doc: howto use/run the BPF selftests
To:     brouer@redhat.com
Cc:     borkmann@iogearbox.net, alexei.starovoitov@gmail.com,
        netdev@vger.kernel.org, quentin.monnet@netronome.com,
        linux-man <linux-man@vger.kernel.org>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi

Some typo fixes below.

On Mon, May 14, 2018 at 3:43 PM Jesper Dangaard Brouer <brouer@redhat.com>
wrote:
> I always forget howto run the BPF selftests. Thus, lets add that info
> to the QA document.

> Documentation was based on Cilium's documentation:
>   http://cilium.readthedocs.io/en/latest/bpf/#verifying-the-setup

> Signed-off-by: Jesper Dangaard Brouer <brouer@redhat.com>
> ---
>   Documentation/bpf/bpf_devel_QA.rst |   29 +++++++++++++++++++++++++++++
>   1 file changed, 29 insertions(+)

> diff --git a/Documentation/bpf/bpf_devel_QA.rst
b/Documentation/bpf/bpf_devel_QA.rst
> index 2254bdeae990..0e7c1d946e83 100644
> --- a/Documentation/bpf/bpf_devel_QA.rst
> +++ b/Documentation/bpf/bpf_devel_QA.rst
> @@ -417,6 +417,33 @@ submitted by the BPF maintainers to the stable
maintainers.
>   Testing patches
>   ===============

> +Q: How to run BPF selftests
> +---------------------------
> +A: After you have booted into the newly compiled kernel, navigate to
> +the BPF selftests_ suite in order to test BPF functionality (current
> +working directory points to the root of the cloned git tree)::
> +
> +  $ cd tools/testing/selftests/bpf/
> +  $ make
> +
> +To run the verifier tests::
> +
> +  $ sudo ./test_verifier
> +
> +The verifier tests print out all the current checks being
> +performed. The summary at the end of running all tests will dump
> +information of test successes and failures::

Two colons at the end of the line. Don't think that was intended.


> +
> +  Summary: 418 PASSED, 0 FAILED
> +
> +In order to run through all BPF selftests, the following command is
> +needed::
> +
> +  $ sudo make run_tests
> +
> +See the kernels selftest `Documentation/dev-tools/kselftest.rst`_

s/kernels/kernel's/

I also think the underscore at the end of this line is misplaced (or it
should be a dash instead).

Cheers,

Silvan


> +document for further documentation.
> +
>   Q: Which BPF kernel selftests version should I run my kernel against?
>   ---------------------------------------------------------------------
>   A: If you run a kernel ``xyz``, then always run the BPF kernel selftests
> @@ -607,5 +634,7 @@ when:
>   .. _netdev FAQ: ../networking/netdev-FAQ.txt
>   .. _samples/bpf/: ../../samples/bpf/
>   .. _selftests: ../../tools/testing/selftests/bpf/
> +.. _Documentation/dev-tools/kselftest.rst:
> +   https://www.kernel.org/doc/html/latest/dev-tools/kselftest.html

>   Happy BPF hacking!

> --
> To unsubscribe from this list: send the line "unsubscribe linux-man" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
