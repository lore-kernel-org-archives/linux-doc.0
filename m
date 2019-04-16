Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D4EBA7D04D
	for <lwn-linux-doc@archive.lwn.net>; Tue, 16 Apr 2019 15:09:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726875AbfDPPJA (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 16 Apr 2019 11:09:00 -0400
Received: from ms.lwn.net ([45.79.88.28]:39034 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725796AbfDPPJA (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 16 Apr 2019 11:09:00 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 452DE738;
        Tue, 16 Apr 2019 15:08:59 +0000 (UTC)
Date:   Tue, 16 Apr 2019 09:08:58 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
        Tom Zanussi <tom.zanussi@linux.intel.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Masanari Iida <standby24x7@gmail.com>,
        "Joel Fernandes (Google)" <joel@joelfernandes.org>
Subject: Re: [PATCH] docs: trace: fix some Sphinx warnings
Message-ID: <20190416090858.3cebacfe@lwn.net>
In-Reply-To: <20190415183451.506a4b6a@gandalf.local.home>
References: <466439c96cc753254dc0fab97902d3d12aaf1e6a.1555358399.git.mchehab+samsung@kernel.org>
        <20190415183451.506a4b6a@gandalf.local.home>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 15 Apr 2019 18:34:51 -0400
Steven Rostedt <rostedt@goodmis.org> wrote:

> On Mon, 15 Apr 2019 17:00:05 -0300
> Mauro Carvalho Chehab <mchehab+samsung@kernel.org> wrote:
> 
> > There are some warnings produced when building trace. Fix them.
> > 
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>  
> 
> Acked-by: Steven Rostedt (VMware) <rostedt@goodmis.org>
> 
> Jon,
> 
> Care to take this through your tree?

I've applied it, thanks.

jon
