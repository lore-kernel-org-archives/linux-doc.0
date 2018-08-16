Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 41D1C7D57F
	for <lwn-linux-doc@archive.lwn.net>; Thu, 16 Aug 2018 17:27:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730451AbeHPU0u (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 16 Aug 2018 16:26:50 -0400
Received: from mail.us.es ([193.147.175.20]:57542 "EHLO mail.us.es"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728956AbeHPU0u (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 16 Aug 2018 16:26:50 -0400
Received: from antivirus1-rhel7.int (unknown [192.168.2.11])
        by mail.us.es (Postfix) with ESMTP id 9C6E1249EF
        for <linux-doc@vger.kernel.org>; Thu, 16 Aug 2018 19:24:38 +0200 (CEST)
Received: from antivirus1-rhel7.int (localhost [127.0.0.1])
        by antivirus1-rhel7.int (Postfix) with ESMTP id 8A9D4DA80C
        for <linux-doc@vger.kernel.org>; Thu, 16 Aug 2018 19:24:38 +0200 (CEST)
Received: by antivirus1-rhel7.int (Postfix, from userid 99)
        id 77E69DA7E8; Thu, 16 Aug 2018 19:24:38 +0200 (CEST)
Received: from antivirus1-rhel7.int (localhost [127.0.0.1])
        by antivirus1-rhel7.int (Postfix) with ESMTP id 83B25DA4C8;
        Thu, 16 Aug 2018 19:24:36 +0200 (CEST)
Received: from 192.168.1.97 (192.168.1.97)
 by antivirus1-rhel7.int (F-Secure/fsigk_smtp/550/antivirus1-rhel7.int);
 Thu, 16 Aug 2018 19:24:36 +0200 (CEST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/antivirus1-rhel7.int)
Received: from us.es (sys.soleta.eu [212.170.55.40])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: 1984lsi)
        by entrada.int (Postfix) with ESMTPSA id 600F84265A5C;
        Thu, 16 Aug 2018 19:24:36 +0200 (CEST)
Date:   Thu, 16 Aug 2018 19:26:58 +0200
X-SMTPAUTHUS: auth mail.us.es
From:   Pablo Neira Ayuso <pablo@netfilter.org>
To:     =?iso-8859-1?Q?M=E1t=E9?= Eckl <ecklm94@gmail.com>
Cc:     netfilter-devel@vger.kernel.org,
        "David S. Miller" <davem@davemloft.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Florian Westphal <fw@strlen.de>,
        KOVACS Krisztian <hidden@sch.bme.hu>, linux-doc@vger.kernel.org
Subject: Re: [PATCH nf-next] doc: net: Add nf_tables part in tproxy.txt
Message-ID: <20180816172658.wgrq3qa4oblo5n3u@salvia>
References: <20180810105834.17653-1-ecklm94@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180810105834.17653-1-ecklm94@gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Aug 10, 2018 at 12:58:39PM +0200, Máté Eckl wrote:
> Recently, transparent proxy support has been added to nf_tables so that
> this document should be updated with the new information.

Applied to nf, thanks.
