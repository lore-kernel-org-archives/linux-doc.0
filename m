Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id EADA37D0DA
	for <lwn-linux-doc@archive.lwn.net>; Wed, 21 Mar 2018 09:41:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751508AbeCUJlh (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 21 Mar 2018 05:41:37 -0400
Received: from Galois.linutronix.de ([146.0.238.70]:36569 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751405AbeCUJlg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 21 Mar 2018 05:41:36 -0400
Received: from hsi-kbw-5-158-153-52.hsi19.kabel-badenwuerttemberg.de ([5.158.153.52] helo=nanos.tec.linutronix.de)
        by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
        (Exim 4.80)
        (envelope-from <tglx@linutronix.de>)
        id 1eyaFI-0003T3-7L; Wed, 21 Mar 2018 10:41:24 +0100
Date:   Wed, 21 Mar 2018 10:41:21 +0100 (CET)
From:   Thomas Gleixner <tglx@linutronix.de>
To:     Peter Zijlstra <peterz@infradead.org>
cc:     Dou Liyang <douly.fnst@cn.fujitsu.com>,
        linux-kernel@vger.kernel.org, x86@kernel.org,
        linux-acpi@vger.kernel.org, linux-doc@vger.kernel.org,
        mingo@redhat.com, corbet@lwn.net, rjw@rjwysocki.net,
        lenb@kernel.org, hpa@zytor.com
Subject: Re: [PATCH 1/5] x86/smpboot: Add the missing description of
 possible_cpus
In-Reply-To: <20180321090826.GW4043@hirez.programming.kicks-ass.net>
Message-ID: <alpine.DEB.2.21.1803211039170.3754@nanos.tec.linutronix.de>
References: <20180320110432.28127-1-douly.fnst@cn.fujitsu.com> <20180320110432.28127-2-douly.fnst@cn.fujitsu.com> <20180320123712.GR4043@hirez.programming.kicks-ass.net> <f64cb207-3851-9a26-2001-653fc0068540@cn.fujitsu.com>
 <20180321090826.GW4043@hirez.programming.kicks-ass.net>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 21 Mar 2018, Peter Zijlstra wrote:
> On Wed, Mar 21, 2018 at 01:33:24PM +0800, Dou Liyang wrote:
> > How about:
> > 
> > possible_cpus=	[s390,x86_64] Set the number of possible CPUs which
> > 		are determined by the ACPI tables MADT or mptables by
> > 		default. possible_cpus=n : n >= 1 enforces the possible
> > 		number to be 'n'.
> > 		While nr_cpus is also be set: nr_cpus=m, choice the
> > 		minimum one for the number of possible CPUs.
> 
> So what is the exact difference between possible_cpus and nr_cpus ? I
> konw maxcpus= limits the number of CPUs we bring up, and possible_cpus
> limits the possible_map, but I'm not entirely sure what nr_cpus does
> here.

nr_cpus limits the number of CPUs the kernel will handle. Think of it as a
boot time override of NR_CPUs.

Way too many commandline switches though.

Thanks,

	tglx
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
