Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id CED197D04D
	for <lwn-linux-doc@archive.lwn.net>; Tue,  9 Apr 2019 16:48:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726372AbfDIQsF (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 9 Apr 2019 12:48:05 -0400
Received: from smtprelay0046.hostedemail.com ([216.40.44.46]:47357 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726456AbfDIQsF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 9 Apr 2019 12:48:05 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay03.hostedemail.com (Postfix) with ESMTP id B9B2C83777ED;
        Tue,  9 Apr 2019 16:48:03 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: toe91_461f85aaab615
X-Filterd-Recvd-Size: 2216
Received: from XPS-9350 (unknown [172.56.41.62])
        (Authenticated sender: joe@perches.com)
        by omf01.hostedemail.com (Postfix) with ESMTPA;
        Tue,  9 Apr 2019 16:48:01 +0000 (UTC)
Message-ID: <94a1b22362ad839b1c686f52aa4e16c171881ae6.camel@perches.com>
Subject: Re: [PATCH 07/10] docs: Add all txt files to documentation
From:   Joe Perches <joe@perches.com>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Date:   Tue, 09 Apr 2019 09:47:31 -0700
In-Reply-To: <d70a2426b9ec33d22c83c18a300efd4148e636aa.1554742526.git.mchehab+samsung@kernel.org>
References: <cover.1554742526.git.mchehab+samsung@kernel.org>
         <d70a2426b9ec33d22c83c18a300efd4148e636aa.1554742526.git.mchehab+samsung@kernel.org>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.30.1-1build1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 2019-04-08 at 13:58 -0300, Mauro Carvalho Chehab wrote:
> Allow generating documentation for all files

Please update the MAINTAINERS F: patterns too.

$ git grep -P "Documentation/\w*\.txt" MAINTAINERS
MAINTAINERS:F:  Documentation/dcdbas.txt
MAINTAINERS:F:  Documentation/kobject.txt
MAINTAINERS:F:  Documentation/hw_random.txt
MAINTAINERS:F:  Documentation/hwspinlock.txt
MAINTAINERS:F:  Documentation/intel_txt.txt
MAINTAINERS:F:  Documentation/IPMI.txt
MAINTAINERS:F:  Documentation/isa.txt
MAINTAINERS:F:  Documentation/isapnp.txt
MAINTAINERS:F:  Documentation/kprobes.txt
MAINTAINERS:F:  Documentation/atomic_bitops.txt
MAINTAINERS:F:  Documentation/atomic_t.txt
MAINTAINERS:F:  Documentation/ldm.txt
MAINTAINERS:F:  Documentation/padata.txt
MAINTAINERS:F:  Documentation/switchtec.txt
MAINTAINERS:F:  Documentation/pwm.txt
MAINTAINERS:F:  Documentation/rtc.txt
MAINTAINERS:F:  Documentation/remoteproc.txt
MAINTAINERS:F:  Documentation/rpmsg.txt
MAINTAINERS:F:  Documentation/rfkill.txt
MAINTAINERS:F:  Documentation/svga.txt
MAINTAINERS:F:  Documentation/sync_file.txt
MAINTAINERS:F:  Documentation/tee.txt
MAINTAINERS:F:  Documentation/vfio.txt


