Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 0B0037D071
	for <lwn-linux-doc@archive.lwn.net>; Fri, 20 Jul 2018 02:46:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731001AbeGTDc1 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 19 Jul 2018 23:32:27 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:54028 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730862AbeGTDc1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 19 Jul 2018 23:32:27 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.22/8.16.0.22) with SMTP id w6K2iNe4021311;
        Fri, 20 Jul 2018 02:45:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2018-07-02;
 bh=aNii+UprM/Oqj1k9JsYWg7ZIG8RZmPxLdhWOSSXOLYA=;
 b=dPnVU7UOHrRf2E7ezwFYk1pNQjDwzf79ByFmB9GJdLVJHPMUdFlVahhBe3ydE6GzRpkr
 fzeFv5ORAPOcOZ4In4obzL+DGNhVQr5e0wmAptKSKgklPPJE81l190EGC14qy3sXqVhe
 euhuNC4WeKQQtTuqDD+31NgHC5NFjXyrt5bYgwg82QqEyhbppOjNO+7UHWazUDCV7cyY
 Kws3W4O70nAtXhF+tqWUHsy+lYnV3RLyMqfvqew7PsaYQcb/k/MC1+gujm7e7up0Yf3/
 vgdl8ILx4VLzYvIrOjKWH1B8JbuZDblo0FG1KuAkaFvYjo1GsYQ4ZBk0E2h1hKI/Zoio kw== 
Received: from userv0022.oracle.com (userv0022.oracle.com [156.151.31.74])
        by aserp2120.oracle.com with ESMTP id 2k9yjgsfay-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 20 Jul 2018 02:45:40 +0000
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userv0022.oracle.com (8.14.4/8.14.4) with ESMTP id w6K2jcoe013538
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 20 Jul 2018 02:45:38 GMT
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id w6K2jZcY008218;
        Fri, 20 Jul 2018 02:45:35 GMT
Received: from char.us.oracle.com (/10.137.176.158)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 19 Jul 2018 19:45:35 -0700
Received: by char.us.oracle.com (Postfix, from userid 1000)
        id 6B92D6A00EB; Thu, 19 Jul 2018 22:45:33 -0400 (EDT)
Date:   Thu, 19 Jul 2018 22:45:33 -0400
From:   Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
To:     Ahmed Abd El Mawgood <ahmedsoliman0x666@gmail.com>,
        xen-devel@lists.xensource.com
Cc:     kvm@vger.kernel.org,
        Kernel Hardening <kernel-hardening@lists.openwall.com>,
        virtualization@lists.linux-foundation.org,
        linux-doc@vger.kernel.org, x86@kernel.org,
        Paolo Bonzini <pbonzini@redhat.com>, rkrcmar@redhat.com,
        nathan Corbet <corbet@lwn.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, hpa@zytor.com,
        Kees Cook <keescook@chromium.org>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        David Hildenbrand <david@redhat.com>,
        Boris Lukashev <blukashev@sempervictus.com>,
        David Vrabel <david.vrabel@nutanix.com>, nigel.edwards@hpe.com,
        Rik van Riel <riel@surriel.com>
Subject: Re: Memory Read Only Enforcement: VMM assisted kernel rootkit
 mitigation for KVM
Message-ID: <20180720024533.GA27437@char.US.ORACLE.com>
References: <20180719213802.17161-1-ahmedsoliman0x666@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180719213802.17161-1-ahmedsoliman0x666@gmail.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=8959 signatures=668706
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1806210000 definitions=main-1807200031
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jul 19, 2018 at 11:37:59PM +0200, Ahmed Abd El Mawgood wrote:
> Hi,
> 
> This is my first set of patches that works as I would expect, and the
> third revision I sent to mailing lists.
> 
> Following up with my previous discussions about kernel rootkit mitigation
> via placing R/O protection on critical data structure, static data,
> privileged registers with static content. These patches present the
> first part where it is only possible to place these protections on
> memory pages. Feature-wise, this set of patches is incomplete in the sense of:
> - They still don't protect privileged registers
> - They don't protect guest TLB from malicious gva -> gpa page mappings.
> But they provide sketches for a basic working design. Note that I am totally
> noob and it took lots of time and effort to get to this point. So sorry in
> advance if I overlooked something.

This reminds me of Xen PV page model. That is the hypervisor is the one
auditing the page tables and the guest's pages are read-only.

Ditto for IDT, GDT, etc. Gosh, did you by chance look at how
Xen PV mechanism is done? It may provide the protection you are looking for?

CC-ing xen-devel.
> 
> [PATCH 1/3] [RFC V3] KVM: X86: Memory ROE documentation
> [PATCH 2/3] [RFC V3] KVM: X86: Adding arbitrary data pointer in kvm memslot itterator functions
> [PATCH 3/3] [RFC V3] KVM: X86: Adding skeleton for Memory ROE
> 
> Summery:
> 
>  Documentation/virtual/kvm/hypercalls.txt |  14 ++++
>  arch/x86/include/asm/kvm_host.h          |  11 ++-
>  arch/x86/kvm/Kconfig                     |   7 ++
>  arch/x86/kvm/mmu.c                       | 127 ++++++++++++++++++++++---------
>  arch/x86/kvm/x86.c                       |  82 +++++++++++++++++++-
>  include/linux/kvm_host.h                 |   3 +
>  include/uapi/linux/kvm_para.h            |   1 +
>  virt/kvm/kvm_main.c                      |  29 ++++++-
>  8 files changed, 232 insertions(+), 42 deletions(-)
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
