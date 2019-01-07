Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D25447D2EF
	for <lwn-linux-doc@archive.lwn.net>; Mon,  7 Jan 2019 20:40:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726938AbfAGUkd (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 7 Jan 2019 15:40:33 -0500
Received: from smtprelay0042.hostedemail.com ([216.40.44.42]:34061 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726689AbfAGUkd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 7 Jan 2019 15:40:33 -0500
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
        by smtpgrave07.hostedemail.com (Postfix) with ESMTP id 216B218017367
        for <linux-doc@vger.kernel.org>; Mon,  7 Jan 2019 20:40:25 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay06.hostedemail.com (Postfix) with ESMTP id 48E7818224D67;
        Mon,  7 Jan 2019 20:40:24 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: crow50_5a9c327867d24
X-Filterd-Recvd-Size: 1658
Received: from XPS-9350.home (unknown [47.151.153.53])
        (Authenticated sender: joe@perches.com)
        by omf03.hostedemail.com (Postfix) with ESMTPA;
        Mon,  7 Jan 2019 20:40:22 +0000 (UTC)
Message-ID: <8f36db2a0d843cee4d1c076e7daa4b7cae053b49.camel@perches.com>
Subject: Re: [PATCH v3] Documentation/CodingStyle: Use directory-local
 variables for emacs settings
From:   Joe Perches <joe@perches.com>
To:     Bart Van Assche <bvanassche@acm.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Alison Chaiken <alison@she-devel.com>,
        Federico Vaga <federico.vaga@vaga.pv.it>,
        "Geyslan G . Bem" <geyslan@gmail.com>,
        Tiago Natel de Moura <tiago4orion@gmail.com>
Date:   Mon, 07 Jan 2019 12:40:21 -0800
In-Reply-To: <20190107182019.105393-1-bvanassche@acm.org>
References: <20190107182019.105393-1-bvanassche@acm.org>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.30.1-1build1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 2019-01-07 at 10:20 -0800, Bart Van Assche wrote:
> In emacs 23.1 support for directory-local variables was added (see also
> https://lists.gnu.org/archive/html/info-gnu-emacs/2009-07/msg00000.html).
> Simplify the settings in coding-style.rst by using that feature.
> Additionally, do not inherit any settings from emacs' linux coding style
> to minimize dependencies on the version of emacs that is being used.
> 
> I have verified with several large and nontrivial kernel source files
> that the new settings format code according to what checkpatch expects.

Thanks Bart.


