Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2E40F7D048
	for <lwn-linux-doc@archive.lwn.net>; Mon, 14 May 2018 16:05:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752950AbeENQFW (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 14 May 2018 12:05:22 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:33922 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1752727AbeENQFV (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 14 May 2018 12:05:21 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 193D74040073;
        Mon, 14 May 2018 16:05:21 +0000 (UTC)
Received: from localhost (ovpn-200-17.brq.redhat.com [10.40.200.17])
        by smtp.corp.redhat.com (Postfix) with ESMTP id A64D011166F0;
        Mon, 14 May 2018 16:05:16 +0000 (UTC)
Date:   Mon, 14 May 2018 18:05:14 +0200
From:   Jesper Dangaard Brouer <brouer@redhat.com>
To:     Silvan Jegen <s.jegen@gmail.com>
Cc:     borkmann@iogearbox.net, alexei.starovoitov@gmail.com,
        netdev@vger.kernel.org, quentin.monnet@netronome.com,
        linux-man <linux-man@vger.kernel.org>, linux-doc@vger.kernel.org,
        brouer@redhat.com
Subject: Re: [bpf-next PATCH 5/5] bpf, doc: howto use/run the BPF selftests
Message-ID: <20180514180514.4fd0ba66@redhat.com>
In-Reply-To: <CAKvUva-_EbMez7c=CHXUPcGKmU=jGne5ZVu4CXwR8szrNUhRhw@mail.gmail.com>
References: <152630528901.29210.9018565600000101307.stgit@firesoul>
        <152630535224.29210.11623921130132517306.stgit@firesoul>
        <CAKvUva-_EbMez7c=CHXUPcGKmU=jGne5ZVu4CXwR8szrNUhRhw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]); Mon, 14 May 2018 16:05:21 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]); Mon, 14 May 2018 16:05:21 +0000 (UTC) for IP:'10.11.54.3' DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'brouer@redhat.com' RCPT:''
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 14 May 2018 17:15:54 +0200
Silvan Jegen <s.jegen@gmail.com> wrote:

> Hi
> 
> Some typo fixes below.
> 
> On Mon, May 14, 2018 at 3:43 PM Jesper Dangaard Brouer <brouer@redhat.com>
> wrote:
> > I always forget howto run the BPF selftests. Thus, lets add that info
> > to the QA document.  
> 
> > Documentation was based on Cilium's documentation:
> >   http://cilium.readthedocs.io/en/latest/bpf/#verifying-the-setup  
> 
> > Signed-off-by: Jesper Dangaard Brouer <brouer@redhat.com>
> > ---
> >   Documentation/bpf/bpf_devel_QA.rst |   29 +++++++++++++++++++++++++++++
> >   1 file changed, 29 insertions(+)  
> 
> > diff --git a/Documentation/bpf/bpf_devel_QA.rst  
> b/Documentation/bpf/bpf_devel_QA.rst
> > index 2254bdeae990..0e7c1d946e83 100644
> > --- a/Documentation/bpf/bpf_devel_QA.rst
> > +++ b/Documentation/bpf/bpf_devel_QA.rst
> > @@ -417,6 +417,33 @@ submitted by the BPF maintainers to the stable  
> maintainers.
> >   Testing patches
> >   ===============  
> 
> > +Q: How to run BPF selftests
> > +---------------------------
> > +A: After you have booted into the newly compiled kernel, navigate to
> > +the BPF selftests_ suite in order to test BPF functionality (current
> > +working directory points to the root of the cloned git tree)::
> > +
> > +  $ cd tools/testing/selftests/bpf/
> > +  $ make
> > +
> > +To run the verifier tests::
> > +
> > +  $ sudo ./test_verifier
> > +
> > +The verifier tests print out all the current checks being
> > +performed. The summary at the end of running all tests will dump
> > +information of test successes and failures::  
> 
> Two colons at the end of the line. Don't think that was intended.

It is intended, that is part of the RST formatting.

> 
> > +
> > +  Summary: 418 PASSED, 0 FAILED
> > +
> > +In order to run through all BPF selftests, the following command is
> > +needed::
> > +
> > +  $ sudo make run_tests
> > +
> > +See the kernels selftest `Documentation/dev-tools/kselftest.rst`_  
> 
> s/kernels/kernel's/

I guess that is more correct...

> I also think the underscore at the end of this line is misplaced (or it
> should be a dash instead).

This is also part of the RST formatting.  This is a link. 


> > +document for further documentation.
> > +
> >   Q: Which BPF kernel selftests version should I run my kernel against?
> >   ---------------------------------------------------------------------
> >   A: If you run a kernel ``xyz``, then always run the BPF kernel selftests
> > @@ -607,5 +634,7 @@ when:
> >   .. _netdev FAQ: ../networking/netdev-FAQ.txt
> >   .. _samples/bpf/: ../../samples/bpf/
> >   .. _selftests: ../../tools/testing/selftests/bpf/
> > +.. _Documentation/dev-tools/kselftest.rst:
> > +   https://www.kernel.org/doc/html/latest/dev-tools/kselftest.html  

The link is defined above/here.

-- 
Best regards,
  Jesper Dangaard Brouer
  MSc.CS, Principal Kernel Engineer at Red Hat
  LinkedIn: http://www.linkedin.com/in/brouer
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
